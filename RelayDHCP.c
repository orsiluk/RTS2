#define __DHCPS_C
#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#define THIS_IS_STACK_APPLICATION
#define DHCP_SERVER_IP	0x0101A8C0	//Server IP: 192.168
#define DHCP_LEASE_DURATION	60ul

#include <pic18f97j60.h>	//ML
#include "Include/TCPIPConfig.h"
#include "Include/TCPIP_Stack/TCPIP.h"
#include "Include/TCPIP_Stack/DHCP.h"
#include "Include/TCPIP_Stack/UDP.h"
#include "Include/GenericTypeDefs.h"
#include "Include/MainDemo.h"
#include "Include/LCDBlocking.h"

static 	UDP_SOCKET	CSocket,SSocket;
static 	NODE_INFO 	DHCPServer;
BOOL relayEnable = TRUE;
APP_CONFIG AppConfig;

static  BOOL getARP();
void ReceiveInput(UDP_SOCKET listen);
void DiscoveryToS(BOOTP_HEADER *Header);
void OfferToC(BOOTP_HEADER *Header);
void ReqToS(BOOTP_HEADER *Header);
void AckToC(BOOTP_HEADER *Header);
void DisplayString(BYTE pos, char* text);

void DisplayString(BYTE pos, char* text)
{
  BYTE        l = strlen(text);	/*number of actual chars in the string*/
  BYTE      max = 32 - pos;  	/*available space on the lcd*/
  char       *d = (char*)&LCDText[pos];
  const char *s = text;
  size_t      n = (l < max) ? l : max;
  if (n != 0)
    while (n-- != 0)*d++ = *s++;/* Copy as many bytes as will fit */
  LCDUpdate();
}

static BOOL getARP() {
	ARPResolve(&DHCPServer.IPAddr);
	return ARPIsResolved(&DHCPServer.IPAddr, &DHCPServer.MACAddr);
}

static int Receive() {

	if (relayEnable == FALSE) return 0;
	CSocket = UDPOpen(DHCP_SERVER_PORT, NULL, DHCP_CLIENT_PORT);
	SSocket = UDPOpen(DHCP_CLIENT_PORT, NULL, DHCP_SERVER_PORT);
	if (CSocket == INVALID_UDP_SOCKET || SSocket == INVALID_UDP_SOCKET) {
		LCDErase();
		DisplayString(0 , "Socket ERROR!");
		return 0;
	} else {
		LCDErase();
		DisplayString(0, "Socket success");
	}
	ReceiveInput(SSocket);	// Start listening
	ReceiveInput(CSocket);
	UDPDiscard();
	return 1;
}

int main(void)
{	
	UDP_SOCKET MySocket;
	getARP();
	LCDInit();
	
	DisplayString(0,"START RELAY");
	while(1)
	{
		MySocket = UDPOpen(DHCP_SERVER_PORT, NULL, DHCP_CLIENT_PORT);
		while(MySocket == INVALID_UDP_SOCKET)
		{
			MySocket = UDPOpen(DHCP_SERVER_PORT, NULL, DHCP_CLIENT_PORT);
			DisplayString (0,"Invalid socket");
			if(MySocket != INVALID_UDP_SOCKET)
				break;
		}
		DisplayString (16,"Valid socket");
		ReceiveInput(MySocket);
	}
	return 1;
}

void ReceiveInput(UDP_SOCKET listen) {
	BOOTP_HEADER clientHeader;
	BYTE Option, Len, i;
	DWORD dw;

	DisplayString (0,"ReceiveInput");
	if (UDPIsGetReady(listen) < 241u)	// Check to see if a valid DHCP packet has arrived
		return;
	UDPGetArray((BYTE*)&clientHeader, sizeof(clientHeader));
	if (clientHeader.HardwareType != 1u || clientHeader.HardwareLen != 6u)
		return;
	UDPGetArray((BYTE*)&dw, sizeof(DWORD));
	if (dw != 0x63538263ul)
		return;

	while (1)
	{
		if (!UDPGet(&Option))	// Get option type
			break;
		if (Option == DHCP_END_OPTION)
			break;
		UDPGet(&Len);	// Get option length

		switch (Option)	// Process option
		{
		case DHCP_MESSAGE_TYPE:
			UDPGet(&i);
			switch (i)
			{
			case DHCP_DISCOVER_MESSAGE:
				DisplayString(0,"DISCOVER");
				DiscoveryToS(&clientHeader);
				break;
			case DHCP_OFFER_MESSAGE:
				DisplayString(0,"OFFER");
				OfferToC(&clientHeader);
				break;
			case DHCP_REQUEST_MESSAGE:
				DisplayString(0,"REQUEST");
				ReqToS(&clientHeader);
				break;
			case DHCP_DECLINE_MESSAGE:
				DisplayString(0,"DECLINE");
				break;
			case DHCP_ACK_MESSAGE:
				DisplayString(0,"ACK");
				AckToC(&clientHeader);
				break;
			default:
				DisplayString(0,"DEFAULT");
				break;
			}
			break;
		//case DHCP_PARAM_REQUEST_IP_ADDRESS:
		case DHCP_END_OPTION:
			UDPDiscard();
			return;
		}
		while (Len--)	// Remove any unprocessed bytes that we don't care about
			UDPGet(&i);
	}
}

void OfferToC(BOOTP_HEADER *Header)
{
	BYTE i,a;
	DWORD RequestedIP = 0;
	UDP_SOCKET_INFO* p;

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(CSocket) < 300u)
		return;

	//REMOVE THIS???
	p = &UDPSocketInfo[activeUDPSocket];
	p->remoteNode.IPAddr.Val = DHCPServer.IPAddr.Val;
	for(a = 0; a < 6; a++){
		p->remoteNode.MACAddr.v[a] = DHCPServer.MACAddr.v[a];
	}
	UDPIsPutReady(SSocket);
	//---------------

	Header->BootpFlags = 0x8000;	//Send via broadcast

	UDPPutArray((BYTE*)&(Header->MessageType), sizeof(Header->MessageType));
	UDPPutArray((BYTE*)&(Header->HardwareType), sizeof(Header->HardwareType));
	UDPPutArray((BYTE*)&(Header->HardwareLen), sizeof(Header->HardwareLen));
	UDPPutArray((BYTE*)&(Header->Hops), sizeof(Header->Hops));
	UDPPutArray((BYTE*)&(Header->TransactionID), sizeof(Header->TransactionID));
	UDPPutArray((BYTE*)&(Header->SecondsElapsed), sizeof(Header->SecondsElapsed));
	UDPPutArray((BYTE*)&(Header->BootpFlags), sizeof(Header->BootpFlags));
	UDPPutArray((BYTE*)&(Header->ClientIP), sizeof(Header->ClientIP));
	UDPPutArray((BYTE*)&(Header->YourIP), sizeof(Header->YourIP));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));
	UDPPutArray((BYTE*)&(AppConfig.MyIPAddr), sizeof(AppConfig.MyIPAddr));
	UDPPutArray((BYTE*)&(Header->ClientMAC), sizeof(Header->ClientMAC));

	/ Remaining 10 bytes of client hardware address, server host name: Null string (not used)
	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	/
		UDPPut(0x00);									// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	UDPPut(DHCP_MESSAGE_TYPE);	// Message type = REQUEST
	UDPPut(DHCP_MESSAGE_TYPE_LEN);
	UDPPut(DHCP_OFFER_MESSAGE);

	UDPPut(DHCP_SUBNET_MASK);	// Subnet mask
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));
	
	UDPPut(DHCP_ROUTER);	// Option: Router/Gateway address
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	UDPPut(DHCP_IP_LEASE_TIME);	// Option: Lease duration
	UDPPut(4);
	UDPPut((DHCP_LEASE_DURATION>>24) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION>>16) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION>>8) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION) & 0xFF);

	UDPPut(DHCP_SERVER_IDENTIFIER);	// Option: Server identifier
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));

	UDPPut(DHCP_END_OPTION);	// No more options, mark ending

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	UDPFlush();	// Transmit the packet
}

void AckToC(BOOTP_HEADER *Header)
{
	BYTE i,a;
	DWORD RequestedIP = 0;
	UDP_SOCKET_INFO *p;

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(CSocket) < 300u)
		return;

	//REMOVE THIS???
	p = &UDPSocketInfo[activeUDPSocket];
	p->remoteNode.IPAddr.Val = DHCPServer.IPAddr.Val;
	for(a = 0; a < 6; a++){
		p->remoteNode.MACAddr.v[a] = DHCPServer.MACAddr.v[a];
	}
	UDPIsPutReady(SSocket);
	//---------------

	Header->BootpFlags = 0x0000;	//Send via unicast

	UDPPutArray((BYTE*)&(Header->MessageType), sizeof(Header->MessageType));
	UDPPutArray((BYTE*)&(Header->HardwareType), sizeof(Header->HardwareType));
	UDPPutArray((BYTE*)&(Header->HardwareLen), sizeof(Header->HardwareLen));
	UDPPutArray((BYTE*)&(Header->Hops), sizeof(Header->Hops));
	UDPPutArray((BYTE*)&(Header->TransactionID), sizeof(Header->TransactionID));
	UDPPutArray((BYTE*)&(Header->SecondsElapsed), sizeof(Header->SecondsElapsed));
	UDPPutArray((BYTE*)&(Header->BootpFlags), sizeof(Header->BootpFlags));
	UDPPutArray((BYTE*)&(Header->ClientIP), sizeof(Header->ClientIP));
	UDPPutArray((BYTE*)&(Header->YourIP), sizeof(Header->YourIP));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));
	UDPPutArray((BYTE*)&(AppConfig.MyIPAddr), sizeof(AppConfig.MyIPAddr));
	UDPPutArray((BYTE*)&(Header->ClientMAC), sizeof(Header->ClientMAC));

	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	
		UDPPut(0x00);									// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	UDPPut(DHCP_MESSAGE_TYPE);	// Message type = REQUEST
	UDPPut(DHCP_MESSAGE_TYPE_LEN);
	UDPPut(DHCP_ACK_MESSAGE);

	UDPPut(DHCP_SUBNET_MASK);	// Subnet mask
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));

	UDPPut(DHCP_ROUTER);	// Option: Router/Gateway address
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	UDPPut(DHCP_IP_LEASE_TIME);	// Option: Lease duration
	UDPPut(4);
	UDPPut((DHCP_LEASE_DURATION>>24) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION>>16) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION>>8) & 0xFF);
	UDPPut((DHCP_LEASE_DURATION) & 0xFF);

	UDPPut(DHCP_SERVER_IDENTIFIER);	// Option: Server identifier
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));

	UDPPut(DHCP_END_OPTION);	// No more options, mark ending

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	UDPFlush();	// Transmit the packet
}

void DiscoveryToS(BOOTP_HEADER *Header) {
	BYTE i;

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(SSocket) < 300u)
		return;

	UDPPutArray((BYTE*)&(Header->MessageType), sizeof(Header->MessageType));
	UDPPutArray((BYTE*)&(Header->HardwareType), sizeof(Header->HardwareType));
	UDPPutArray((BYTE*)&(Header->HardwareLen), sizeof(Header->HardwareLen));
	UDPPutArray((BYTE*)&(Header->Hops), sizeof(Header->Hops));
	UDPPutArray((BYTE*)&(Header->TransactionID), sizeof(Header->TransactionID));
	UDPPutArray((BYTE*)&(Header->SecondsElapsed), sizeof(Header->SecondsElapsed));
	UDPPutArray((BYTE*)&(Header->BootpFlags), sizeof(Header->BootpFlags));
	UDPPutArray((BYTE*)&(Header->ClientIP), sizeof(Header->ClientIP));
	UDPPutArray((BYTE*)&(Header->YourIP), sizeof(Header->YourIP));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));
	UDPPutArray((BYTE*)&(AppConfig.MyIPAddr), sizeof(AppConfig.MyIPAddr));
	UDPPutArray((BYTE*)&(Header->ClientMAC), sizeof(Header->ClientMAC));

	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)
		UDPPut(0x00);									// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	UDPPut(DHCP_MESSAGE_TYPE);	// Message type = DISCOVERY
	UDPPut(1);
	UDPPut(DHCP_DISCOVER_MESSAGE);

	UDPPut(DHCP_SERVER_IDENTIFIER);	// Option: Server identifier
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	UDPPut(DHCP_ROUTER);	// Option: Router/Gateway address
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	UDPPut(DHCP_END_OPTION);	// No more options, mark ending

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	UDPFlush();	// Transmit the packet
}

void ReqToS(BOOTP_HEADER *Header) {
	BYTE i,a;
	DWORD RequestedIP = 0;
	UDP_SOCKET_INFO *p;

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(SSocket) < 300u)
		return;

	// Search through all remaining options and look for the Requested IP address field
	// Obtain options
	while(UDPIsGetReady(SSocket))
	{
		BYTE Option, Len;

		if(!UDPGet(&Option))	// Get option type
			break;
		if(Option == DHCP_END_OPTION)
			break;

		UDPGet(&Len);	// Get option length

		// Process option
		if((Option == DHCP_PARAM_REQUEST_IP_ADDRESS) && (Len == 4u))
		{
			// Get the requested IP address and see if it is the one we have on offer. If not, we should send back a NAK
			// but since there could be some other DHCP server offering this address, we'll just silently ignore this request.
			UDPGetArray((BYTE*)&RequestedIP, 4);
			break;
		}

		while(Len--)	// Remove the unprocessed bytes that we don't care about
			UDPGet(&i);
	}

	//REMOVE THIS???
	p = &UDPSocketInfo[activeUDPSocket];
	p->remoteNode.IPAddr.Val = DHCPServer.IPAddr.Val;
	for(a = 0; a < 6; a++){
		p->remoteNode.MACAddr.v[a] = DHCPServer.MACAddr.v[a];
	}
	UDPIsPutReady(SSocket);
	//---------------

	UDPPutArray((BYTE*)&(Header->MessageType), sizeof(Header->MessageType));
	UDPPutArray((BYTE*)&(Header->HardwareType), sizeof(Header->HardwareType));
	UDPPutArray((BYTE*)&(Header->HardwareLen), sizeof(Header->HardwareLen));
	UDPPutArray((BYTE*)&(Header->Hops), sizeof(Header->Hops));
	UDPPutArray((BYTE*)&(Header->TransactionID), sizeof(Header->TransactionID));
	UDPPutArray((BYTE*)&(Header->SecondsElapsed), sizeof(Header->SecondsElapsed));
	UDPPutArray((BYTE*)&(Header->BootpFlags), sizeof(Header->BootpFlags));
	UDPPutArray((BYTE*)&(Header->ClientIP), sizeof(Header->ClientIP));
	UDPPutArray((BYTE*)&(Header->YourIP), sizeof(Header->YourIP));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));
	UDPPutArray((BYTE*)&(AppConfig.MyIPAddr), sizeof(AppConfig.MyIPAddr));
	UDPPutArray((BYTE*)&(Header->ClientMAC), sizeof(Header->ClientMAC));

	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	
		UDPPut(0x00);			// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	// Message type = REQUEST
	UDPPut(DHCP_MESSAGE_TYPE);
	UDPPut(1);
	UDPPut(DHCP_REQUEST_MESSAGE);

	// Option: Server identifier
	UDPPut(DHCP_SERVER_IDENTIFIER);
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	// Option: Router/Gateway address
	UDPPut(DHCP_ROUTER);
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	//Add the client's requested IP, if there's one available
	if(RequestedIP)
	{
		UDPPut(DHCP_PARAM_REQUEST_IP_ADDRESS);
		UDPPut(DHCP_PARAM_REQUEST_IP_ADDRESS_LEN);
		UDPPutArray((BYTE*)&RequestedIP, sizeof(IP_ADDR));
	}

	UDPPut(DHCP_END_OPTION);	// No more options, mark ending

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	UDPFlush();	// Transmit the packet
}

/*
void MessageToServer(BOOTP_HEADER *Header, BYTE messageType) {
	BYTE i;

	if(messageType != DHCP_DISCOVER_MESSAGE || messageType != DHCP_REQUEST_MESSAGE)
		return;	//If messageType is not Discovery or Request, something's up..

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(SSocket) < 300u)
		return;

	UDPPutArray((BYTE*)&(Header->MessageType), sizeof(Header->MessageType));
	UDPPutArray((BYTE*)&(Header->HardwareType), sizeof(Header->HardwareType));
	UDPPutArray((BYTE*)&(Header->HardwareLen), sizeof(Header->HardwareLen));
	UDPPutArray((BYTE*)&(Header->Hops), sizeof(Header->Hops));
	UDPPutArray((BYTE*)&(Header->TransactionID), sizeof(Header->TransactionID));
	UDPPutArray((BYTE*)&(Header->SecondsElapsed), sizeof(Header->SecondsElapsed));
	UDPPutArray((BYTE*)&(Header->BootpFlags), sizeof(Header->BootpFlags));
	UDPPutArray((BYTE*)&(Header->ClientIP), sizeof(Header->ClientIP));
	UDPPutArray((BYTE*)&(Header->YourIP), sizeof(Header->YourIP));
	UDPPutArray((BYTE*)&(Header->NextServerIP), sizeof(Header->NextServerIP));
	UDPPutArray((BYTE*)&(AppConfig.MyIPAddr), sizeof(AppConfig.MyIPAddr));
	UDPPutArray((BYTE*)&(Header->ClientMAC), sizeof(Header->ClientMAC));

	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	
		UDPPut(0x00);									// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	// Set the message type (can be DISCOVER or REQUEST)
	UDPPut(DHCP_MESSAGE_TYPE);
	UDPPut(1);
	UDPPut(messageType);

	// Option: Server identifier
	UDPPut(DHCP_SERVER_IDENTIFIER);
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	// Option: Router/Gateway address
	UDPPut(DHCP_ROUTER);
	UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

	// No more options, mark ending
	UDPPut(DHCP_END_OPTION);

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	// Transmit the packet
	UDPFlush();
}
*/

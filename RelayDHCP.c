#define __DHCPS_C
#define __18F97J60
#define __SDCC__
#include <pic18f97j60.h> //ML

#include "Include/TCPIPConfig.h"
#include "Include/TCPIP_Stack/TCPIP.h"
// #include "TCPIP_Stack/DHCPs.c"
#include "Include/TCPIP_Stack/DHCP.h"
#include "Include/TCPIP_Stack/UDP.h"
#include "Include/LCDBlocking.h"

// DHCP Server at 	192.168.2.2
// 			c0.a8.02.02
// DHCP Server at 	192.168.97.3
// 			c0.a8.61.03
// Little endian!
#define DHCP_SERVER_IP	0x0202A8C0

static 	UDP_SOCKET	CSocket;
static 	UDP_SOCKET 	SSocket;
static 	NODE_INFO 	DHCPServer; // You can get the ip of the server by typing DHCPServer.IPAddr.Val
static  BOOL getARP();
void ReceiveInput(UDP_SOCKET listen);
void DiscoveryToS(&BOOTPHeader);
void OfferToC(&BOOTPHeader);
void ReqToS(&BOOTPHeader);
void AccToC(&BOOTPHeader);

BOOL relayEnable = TRUE;

static BOOL getARP() {

	ARPResolve(&DHCPServer.IPAddr);

	return ARPIsResolved(&DHCPServer.IPAddr, &DHCPServer.MACAddr);
}

static int Receive() {

	if (relayEnable == FALSE) return 0;

	// Introduce an array of open sockets!
	// Create a switch case to decide if I want new socket or I start listening

	CSocket = UDPOpen(DHCP_SERVER_PORT, NULL, DHCP_CLIENT_PORT);
	SSocket = UDPOpen(DHCP_CLIENT_PORT, NULL, DHCP_SERVER_PORT);

	if (CSocket == INVALID_UDP_SOCKET || SSocket == INVALID_UDP_SOCKET) {
		// Print to LCD ("Socket ERROR!");
		LCDErase();
		DisplayString(0 , "Socket ERROR!");
		return 0;
	} else {
		// Print to LCD ("Socket success");
		LCDErase();
		DisplayString(0, "Socket success");
		// numDHCPRelay++;
	}

	// Start listening

	ReceiveInput(SSocket);
	ReceiveInput(CSocket);
	UDPDiscard();
	return 1;
}

void ReceiveInput(UDP_SOCKET listen) {

	/**	// DHCP or BOOTP Header structure
	typedef struct __attribute__((aligned(2), packed))
	{
		BYTE		MessageType;	// Message type for this message
		BYTE		HardwareType;	// Hardware type for this message
		BYTE		HardwareLen;	// Length of hardware type
		BYTE		Hops;			// Number of hops
		DWORD		TransactionID;	// DHCP Transaction ID
		WORD		SecondsElapsed;	// Number of elapsed seconds
		WORD		BootpFlags;		// BOOTP Flags
		IP_ADDR		ClientIP;		// Client IP
		IP_ADDR		YourIP;			// Your IP
		IP_ADDR		NextServerIP;	// Next Server IP
		IP_ADDR		RelayAgentIP;	// Relay Agent IP
		MAC_ADDR	ClientMAC;		// Client MAC Address
	} BOOTP_HEADER;*/

	BOOTP_HEADER clientHeader;
	BYTE Option, Len;

//		  #define DHCP_DISCOVER_MESSAGE           (1u)	// DCHP Discover Message
//   	  #define DHCP_OFFER_MESSAGE              (2u)	// DHCP Offer Message
//   	  #define DHCP_REQUEST_MESSAGE            (3u)	// DHCP Request message
//   	  #define DHCP_DECLINE_MESSAGE            (4u)	// DHCP Decline Message
//   	  #define DHCP_ACK_MESSAGE                (5u)	// DHCP ACK Message


	/*****************************************************************************
	  Function:
		WORD UDPIsGetReady(UDP_SOCKET s)

	  Summary:
		Determines how many bytes can be read from the UDP socket.

	  Description:
		This function determines if bytes can be read from the specified UDP
		socket.  It also prepares the UDP module for reading by setting the
		indicated socket as the currently active connection.

	  Parameters:
		s - The socket to be made active (which has already been opened or is
			listening)

	  Returns:
	  	The number of bytes that can be read from this socket.
	  ***************************************************************************/

	// Check to see if a valid DHCP packet has arrived
	if (UDPIsGetReady(listen) < 241u)
		return;

	/*****************************************************************************
	Function:
	WORD UDPGetArray(BYTE *cData, WORD wDataLen)

	Summary:
	Reads an array of bytes from the currently active socket.

	Description:
	This function reads an array from bytes to the currently active UDP
	    socket, while decrementing the remaining buffer length.  UDPIsGetReady
	    should be used before calling this function to specify the currently
	    active socket.

	Precondition:
	UDPIsPutReady() was previously called to specify the current socket.

	Parameters:
	cData - The buffer to receive the bytes being read.
	wDateLen - Number of bytes to be read from the socket.

	Returns:
	The number of bytes successfully read from the UDP buffer.  If this
	value is less than wDataLen, then the buffer was emptied and no more
	data is available.
	***************************************************************************/
	UDPGetArray((BYTE*)&clientHeader, sizeof(clientHeader));

	if (clientHeader.HardwareType != 1u)
		return;
	if (clientHeader.HardwareLen != 6u)
		return;

	UDPGetArray((BYTE*)&dw, sizeof(DWORD));
	if (dw != 0x63538263ul)
		break;

	while (1)
	{
		// Get option type
		if (!UDPGet(&Option))
			break;
		if (Option == DHCP_END_OPTION)
			break;

		// Get option length
		UDPGet(&Len);

		// Process option
		switch (Option)
		{
		case DHCP_MESSAGE_TYPE:
			UDPGet(&i);
			switch (i)
			{
			case DHCP_DISCOVER_MESSAGE:
				DisplayString("DISCOVER", "");
				MessageToServer(&clientHeader,DHCP_DISCOVER_MESSAGE);
				break;
			case DHCP_OFFER_MESSAGE:
				DisplayString("OFFER", "");
				OfferToC(&clientHeader);
				break;
			case DHCP_REQUEST_MESSAGE:
				DisplayString("REQUEST", "");
				MessageToServer(&clientHeader,DHCP_REQUEST_MESSAGE);
				break;
			case DHCP_DECLINE_MESSAGE:
				DrespondString("DECLINE", "");
				break;
			case DHCP_ACK_MESSAGE:
				DisplayString("ACK", "");
				AccToC(&clientHeader);
				break;
			// case DHCP_RELEASE_MESSAGE:
			// 	DisplayString("RELEASE", "");
			// 	break;
			default:
				DisplayString("DEFAULT", "");
				break;

			}
			break;
		case DHCP_PARAM_REQUEST_IP_ADDRESS:
			DisplayString("IP Requested", "Not handled");
		case DHCP_END_OPTION:
			UDPDiscard();
			return;
		}
		// Remove any unprocessed bytes that we don't care about
		while (Len--)
		{
			UDPGet(&i);
		}
	}
}

void MessageToServer(BOOTP_HEADER *clientHeader, BYTE messageType) {
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

	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
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

void DiscoveryToS(BOOTP_HEADER *clientHeader) {
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

	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
		UDPPut(0x00);									// Boot filename: Null string (not used)
	UDPPut(0x63);				// Magic Cookie: 0x63538263
	UDPPut(0x82);				// Magic Cookie: 0x63538263
	UDPPut(0x53);				// Magic Cookie: 0x63538263
	UDPPut(0x63);				// Magic Cookie: 0x63538263

	// Message type = DISCOVERY
	UDPPut(DHCP_MESSAGE_TYPE);
	UDPPut(1);
	UDPPut(DHCP_DISCOVER_MESSAGE);

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

void ReqToS(BOOTP_HEADER *clientHeader) {
	BYTE i;

	// Set the correct socket to active and ensure that
	// enough space is available to generate the DHCP response
	if (UDPIsPutReady(SSocket) < 300u)
		return;

	// Search through all remaining options and look for the Requested IP address field
	// Obtain options
	while(UDPIsGetReady(MySocket))
	{
		BYTE Option, Len;
		DWORD dw;

		// Get option type
		if(!UDPGet(&Option))
			break;
		if(Option == DHCP_END_OPTION)
			break;

		// Get option length
		UDPGet(&Len);

		// Process option
		if((Option == DHCP_PARAM_REQUEST_IP_ADDRESS) && (Len == 4u))
		{
			// Get the requested IP address and see if it is the one we have on offer.  If not, we should send back a NAK, but since there could be some other DHCP server offering this address, we'll just silently ignore this request.
			UDPGetArray((BYTE*)&dw, 4);
			//Set an appropriate flag
			break;
		}

		// Remove the unprocessed bytes that we don't care about
		while(Len--)
		{
			UDPGet(&i);
		}
	}

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

	for (i = 0; i < 64 + 128 + (16 - sizeof(MAC_ADDR)); i++)	// Remaining 10 bytes of client hardware address, server host name: Null string (not used)
		UDPPut(0x00);									// Boot filename: Null string (not used)
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

	// No more options, mark ending
	UDPPut(DHCP_END_OPTION);

	// Add zero padding to ensure compatibility with old BOOTP relays that discard small packets (<300 UDP octets)
	while (UDPTxCount < 300u)
		UDPPut(0);

	// Transmit the packet
	UDPFlush();
}

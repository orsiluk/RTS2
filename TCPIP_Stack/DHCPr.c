#define __DHCPS_C
#define __18F97J60
#define __SDCC__
#include <pic18f97j60.h> //ML

#include "../Include/TCPIPConfig.h"
#include "Include/TCPIP_Stack/TCPIP.h"
#include "DHCPs.c"
#include "DHCP.c"
#include "../Include/LCDBlocking.h"

// DHCP Server at 	192.168.2.2
// 			c0.a8.02.02
// DHCP Server at 	192.168.97.3
// 			c0.a8.61.03
// Little endian!
#define DHCP_SERVER_IP	0x0202A8C0

static 	UDP_SOCKET	ClientSocket;
static 	UDP_SOCKET 	ServerSocket;
static 	NODE_INFO 	DHCPServer; // You can get the ip of the server by typing DHCPServer.IPAddr.Val
static BOOL getARP();
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
		break;
	} else {
		// Print to LCD ("Socket success");
		LCDErase();
		DisplayString(0, "Socket success")
		smDHCPRelay++;
	}

	// Start listening

	ReceiveInput(ServerSocket);
	ReceiveInput(ClientSocket);
	UDPDiscard();

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
	// MessageType -- WHat can be the options?


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
	if (UDPIsGetReady(socket) < 241u)
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
}







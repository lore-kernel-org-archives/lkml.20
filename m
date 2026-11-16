Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859944;
	b=pa5+XCDJVDn37m0qT6LH5enS7fzl3oxF7uFCvTE0zyQmuKc5mntLKRyoK19ez6q8ijfv
	 g2MQ8+UCUuaQWhOhx08y7re81T0p5fP/TYD3IRdxcrbLgK+34PFvaZI6KSxk7r/Eiz8hb
	 7L0LSc6l72VIvihONmVD5aM7pUr4SyeqTAdOQ9YE8CpZhDGW0if6hhro1IEVcigjxySuW
	 Z6APlk1aN/D1kTQiqbFVBXJV8/df0+fXsqeHTzN7LvxovnHLrM0TsPAbCKbfQoRtIifve
	 g8t0VXbeKWThm8uSPRKV8YhzlxepcG418t+QrPJRT4FsYX49EP9M2qAJZ5v9XNvmGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859944;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=7RuiT6iCxrGPIa9/QebEhMct2rGljab7SqiuFzxTFAI=;
	b=Ct5Sr3QHIHpNY2Qi1UV72wChIdNN3gaS057dZZWyp/93C9FQKzMcegYw0n7pnbwVGy5M
	 3rdvYoS6ZlSQ3o0AeSO8VsbUxfbNo/mjikw3rkk0mxh95EkZnaFXIIF/f69pWcCLlz6YL
	 wMAkfhbmryBkCIX0UuwqKcGzVjI4r4kauId3WLASGX2VycLsGyKx6ioqz8kSx/QJu5Liz
	 i9vV+9JOZYIyFcIZ5stre/QMo7V0duevAP1IezR3PUhqy1b0GEkSw43J61YpKkM3Cw2sG
	 z5HiKYvknCilKuFMu+ESEqkjqVx7PAdspCyPwCMzMNkXHdAyMHXGckbJUCYehobaBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=iyZ3kD56;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F78606A89E;
	Mon, 16 Nov 2026 20:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F78606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=iyZ3kD56
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jSzY33nG8zNkJZ;
	Mon, 16 Nov 2026 21:12:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794859927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7RuiT6iCxrGPIa9/QebEhMct2rGljab7SqiuFzxTFAI=;
	b=iyZ3kD56AeUFSqLcSdGv59DpreQxJfvIbU5s96N5IOin3r1Pj+8f+tbT12yaNifm4jZlPS
	LvRyXaLS+3T8Xdf0BLO6ollVl2Jla1Ok073ZAWRBrppjCItG0XDHk5mn3BCpSTor8A1XeH
	GaAZwc1WVRErynH9s3ToyA6UbMbxlTvdmD4dxoSVCEa38VUD0dWfbhgJDncqubj8WzfgDD
	9abqR6xZEp9qOhKAfWqWwG0Wh3Cavj6BXnKy/RXob008OKJBECas3U/Lh1AY/A2UIkdVJ+
	hR5HhzMs1r3A65BdRGi958rq/s30/5xwHZGe33XxkaNUcIGGUrAFn7eFwp7oew==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: use inet_rcv_saddr_any() in udp_tunnel and ping
Date: Mon, 16 Nov 2026 21:08:53 +0100
Message-ID: <20261116200854.3799498-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jSzY33nG8zNkJZ

udp_tunnel_core.c carries its own copy of inet_rcv_saddr_any(),
sk_saddr_any(), as it can be built as a module while
inet_rcv_saddr_any() is not exported, and ping_bind() open-codes the
same check for its AF_INET and AF_INET6 sockets.

Make inet_rcv_saddr_any() a static inline in <net/addrconf.h>, where it
is already declared, and use it in both places.

Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Link: https://lore.kernel.org/netdev/avVVzxL3pVZc6yQ5@google.com/
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---

@Kuniyuki:
the helper can't go to <net/sock.h> as suggested, since it needs
ipv6_addr_any() and <net/ipv6.h> includes <net/sock.h>.
I hope <net/addrconf.h> is fine too.


 include/net/addrconf.h          | 12 +++++++++++-
 net/ipv4/inet_connection_sock.c |  9 ---------
 net/ipv4/ping.c                 |  8 ++------
 net/ipv4/udp_tunnel_core.c      | 12 ++----------
 4 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/include/net/addrconf.h b/include/net/addrconf.h
index 6818057cf727..0ec4db881404 100644
--- a/include/net/addrconf.h
+++ b/include/net/addrconf.h
@@ -149,7 +149,17 @@ int ipv6_get_lladdr(struct net_device *dev, struct in6_addr *addr,
 		    u32 banned_flags);
 bool inet_rcv_saddr_equal(const struct sock *sk, const struct sock *sk2,
 			  bool match_wildcard);
-bool inet_rcv_saddr_any(const struct sock *sk);
+
+/* whether @sk is bound to the wildcard address of its family */
+static inline bool inet_rcv_saddr_any(const struct sock *sk)
+{
+#if IS_ENABLED(CONFIG_IPV6)
+	if (sk->sk_family == AF_INET6)
+		return ipv6_addr_any(&sk->sk_v6_rcv_saddr);
+#endif
+	return !sk->sk_rcv_saddr;
+}
+
 void addrconf_join_solict(struct net_device *dev, const struct in6_addr *addr);
 void addrconf_leave_solict(struct inet6_dev *idev, const struct in6_addr *addr);
 
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 5807067083c9..c6f7c3550013 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -109,15 +109,6 @@ bool inet_rcv_saddr_equal(const struct sock *sk, const struct sock *sk2,
 				    match_wildcard);
 }
 
-bool inet_rcv_saddr_any(const struct sock *sk)
-{
-#if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6)
-		return ipv6_addr_any(&sk->sk_v6_rcv_saddr);
-#endif
-	return !sk->sk_rcv_saddr;
-}
-
 /**
  *	inet_sk_get_local_port_range - fetch ephemeral ports range
  *	@sk: socket
diff --git a/net/ipv4/ping.c b/net/ipv4/ping.c
index 223a0108b74c..ceb0af8c70a3 100644
--- a/net/ipv4/ping.c
+++ b/net/ipv4/ping.c
@@ -40,11 +40,11 @@
 #include <net/route.h>
 #include <net/inet_common.h>
 #include <net/checksum.h>
+#include <net/addrconf.h>
 
 #if IS_ENABLED(CONFIG_IPV6)
 #include <linux/in6.h>
 #include <linux/icmpv6.h>
-#include <net/addrconf.h>
 #include <net/ipv6.h>
 #include <net/transp_v6.h>
 #endif
@@ -439,12 +439,8 @@ int ping_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len)
 		 sk->sk_bound_dev_if);
 
 	err = 0;
-	if (sk->sk_family == AF_INET && isk->inet_rcv_saddr)
+	if (!inet_rcv_saddr_any(sk))
 		sk->sk_userlocks |= SOCK_BINDADDR_LOCK;
-#if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6 && !ipv6_addr_any(&sk->sk_v6_rcv_saddr))
-		sk->sk_userlocks |= SOCK_BINDADDR_LOCK;
-#endif
 
 	if (snum)
 		sk->sk_userlocks |= SOCK_BINDPORT_LOCK;
diff --git a/net/ipv4/udp_tunnel_core.c b/net/ipv4/udp_tunnel_core.c
index 29581c94fdcf..c2888aa2bbe6 100644
--- a/net/ipv4/udp_tunnel_core.c
+++ b/net/ipv4/udp_tunnel_core.c
@@ -3,6 +3,7 @@
 #include <linux/errno.h>
 #include <linux/socket.h>
 #include <linux/kernel.h>
+#include <net/addrconf.h>
 #include <net/dst_metadata.h>
 #include <net/flow.h>
 #include <net/udp.h>
@@ -59,15 +60,6 @@ int udp_sock_create4(struct net *net, struct udp_port_cfg *cfg,
 }
 EXPORT_SYMBOL(udp_sock_create4);
 
-static bool sk_saddr_any(struct sock *sk)
-{
-#if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6)
-		return ipv6_addr_any(&sk->sk_v6_rcv_saddr);
-#endif
-	return !sk->sk_rcv_saddr;
-}
-
 void setup_udp_tunnel_sock(struct net *net, struct sock *sk,
 			   struct udp_tunnel_sock_cfg *cfg)
 {
@@ -91,7 +83,7 @@ void setup_udp_tunnel_sock(struct net *net, struct sock *sk,
 
 	udp_tunnel_update_gro_rcv(sk, true);
 
-	if (!sk->sk_dport && !sk->sk_bound_dev_if && sk_saddr_any(sk) &&
+	if (!sk->sk_dport && !sk->sk_bound_dev_if && inet_rcv_saddr_any(sk) &&
 	    sk->sk_kern_sock)
 		udp_tunnel_update_gro_lookup(net, sk, true);
 }

base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.56.1


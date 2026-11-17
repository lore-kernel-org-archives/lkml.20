Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907406;
	b=Gni3NDBSZOfIlVMfdBxaHP/xfdY+l/OWfwzJr6n9+sBOL39li1ZJ19Nyq6t0AtIu0tW5
	 EfUAINjlTl6S9QxL/NybSD9vfDoEOKtpPm0wZn6fhC1lWxNOY9+BjV1/I+uq2bjUWcssQ
	 DExG/FRU0+Ce5rmK+FtfQhWV4OSOgeDZt+e8sTqXA98gzpx5p7z1Wre4Vyy7kN2gjBHLG
	 aW2AWZNTKp7mvGbNXkru4Q7DB8jyJyoM0i2iBmUdaQnrxFvkRtiU/Ura4T+o/Vl0IOoTB
	 XUI3Zj3Avrn5MqfSdy6IVsDB/Z3a68SEg3m5JTDq3PaLeZpaPzauAhtfFVxRgt+naRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907406;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=0hOh3HKszBZwFxqxHgvq7RXYP2b77P8HYXCB3loCMLQ=;
	b=LFfD/cGKDyekqtTOuNdlWQDQCVCIoLYoGH8bRxLP0oDq0t6u0ks0avaw6OXJasEoeO7l
	 Yv1DEFZCjK+E+LGZ59qqHpVPRcel91y+qnp49DCvpii018q6bPz6Z1vgzaG3M1eILfXKs
	 ti5WJkZXOiZk8dPUVvYvnKFsdY+cv0doLefbfc7BkVLXQNbhWASQh//m2vYLE43ymNRKp
	 fm2ePTjvvZA9ef8mgvS5GdlaxjjcaCR3GKbvAa9aAblBN5JuK5eNdLAZMxe83zXjJpQxV
	 C4ZwmW31LxysIz27snyEuziQtc5ubRGVdT7qjrpO8uSpYzR1asrmJYh1QqWXTpG931Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=ydkYzYVF;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C60606A33A;
	Tue, 17 Nov 2026 09:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C60606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=ydkYzYVF
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jTK614s1mz3y81;
	Tue, 17 Nov 2026 10:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794907401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hOh3HKszBZwFxqxHgvq7RXYP2b77P8HYXCB3loCMLQ=;
	b=ydkYzYVFOrbnQc8eMOyC0knGUY8sF7WmDSB0dKTAVe6HIYmO2CStItZeOKe+Ydjg2fUsZN
	GnMDJfOjVkJflyneCiOTd2KfaogLYtGvhqVmjDy0sPRdYSBY7ZVc0oGT1go9mp49fS8juV
	FSdiVQAPgRf8EaISs5nweayVTiIcDbE4OWf13fW1U6sui/f3jkJq6NbukfBkkC6Y7Smy43
	OGpej9vHt3n9Ii/bbuG9HJtfb6zMvOYGw82ZqvBZ+t9aca3XyzoGBKKvNLp7ousYVkCwWv
	8PlwSG+nmlAscj1KTxbAWXgNRdraBTcgqN6Li/6r+i/5MKxMXtEepaXbqMkkEg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Jeff Layton <jlayton@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Qi Tang <tpluszz77@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/3] ipv6: use lookup cookies in selected socket dst cache paths
Date: Tue, 17 Nov 2026 10:21:26 +0100
Message-ID: <60907e12930f38ba6c45c4ccfdca7abee068b765.1794906743.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794906743.git.ralf@mandelbit.com>
References: <cover.1794906743.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jTK614s1mz3y81

tcp_v6_connect, ip6_datagram_dst_update and ip6_sk_dst_lookup_flow
obtain a dst and sample its validation cookie afterwards. If a matching
xfrm policy is inserted between lookup and cookie sampling, the plain
route can be cached with a post-insertion serial. Subsequent packets
then pass dst validation and bypass the new policy until another
relevant FIB change.

Store the cookie returned by ip6_dst_lookup_flow_cookie in these paths
instead. Add ip6_dst_store_cookie to accept the supplied cookie,
retaining ip6_dst_store for unconverted callers.

This is a partial conversion. Established TCP route refills, header
rebuilds and accepted-socket setup still use late cookie sampling. Those
paths and other persistent caches, including SCTP and dst_cache users,
are left for follow-up conversions.

This race was found while investigating how mutable socket routing
properties affect the dst cache in ovpn's UDP TX path.

The socket-cache case was then reproduced in a VM by adding a debug-only
kernel delay after the route and policy lookup, then inserting a
matching xfrm policy before cookie sampling. TCP connect and connected
UDP sockets continued sending plaintext after the policy insertion. With
lookup cookies, the stale cached route was rejected on reuse.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Changes since v2 https://lore.kernel.org/all/43917b9119e13e54dcde0e2941d3f4a1fe255df7.1794384146.git.ralf@mandelbit.com/
- Add a Fixes tag referencing the initial git import. (Sashiko)
- Clearly state that this is only a partial conversion to the new API.

No changes since v1 https://lore.kernel.org/netdev/832892eaa7d2371f20459c3134c72914e42970b0.1793806941.git.ralf@mandelbit.com/

 include/net/ip6_route.h | 18 +++++++++++++-----
 net/ipv6/datagram.c     |  6 ++++--
 net/ipv6/ip6_output.c   |  6 ++++--
 net/ipv6/route.c        | 12 ++++++------
 net/ipv6/tcp_ipv6.c     |  5 +++--
 5 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 95f936be32c6..2684f6069a5e 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -252,13 +252,13 @@ static inline const struct rt6_info *skb_rt6_info(const struct sk_buff *skb)
 /*
  *	Store a destination cache entry in a socket
  */
-static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
-				 bool daddr_set,
-				 bool saddr_set)
+static inline void ip6_dst_store_cookie(struct sock *sk, struct dst_entry *dst,
+					u32 cookie, bool daddr_set,
+					bool saddr_set)
 {
 	struct ipv6_pinfo *np = inet6_sk(sk);
 
-	np->dst_cookie = rt6_get_cookie(dst_rt6_info(dst));
+	np->dst_cookie = cookie;
 	sk_setup_caps(sk, dst);
 	np->daddr_cache = daddr_set;
 #ifdef CONFIG_IPV6_SUBTREES
@@ -266,8 +266,16 @@ static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
 #endif
 }
 
+static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
+				 bool daddr_set,
+				 bool saddr_set)
+{
+	ip6_dst_store_cookie(sk, dst, rt6_get_cookie(dst_rt6_info(dst)),
+			     daddr_set, saddr_set);
+}
+
 void ip6_sk_dst_store_flow(struct sock *sk, struct dst_entry *dst,
-			   const struct flowi6 *fl6);
+			   const struct flowi6 *fl6, u32 cookie);
 
 static inline bool ipv6_unicast_destination(const struct sk_buff *skb)
 {
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ffbf983..c18609bab366 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -78,6 +78,7 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	struct in6_addr *final_p;
 	struct dst_entry *dst;
 	struct flowi6 *fl6;
+	u32 cookie;
 	int err = 0;
 
 	if (inet6_test_bit(SNDFLOW, sk) &&
@@ -94,7 +95,8 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	final_p = fl6_update_dst(fl6, opt, &np->final);
 	rcu_read_unlock();
 
-	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
+	dst = ip6_dst_lookup_flow_cookie(sock_net(sk), sk, fl6, final_p,
+					 &cookie);
 	if (IS_ERR(dst)) {
 		err = PTR_ERR(dst);
 		goto out;
@@ -112,7 +114,7 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 		}
 	}
 
-	ip6_sk_dst_store_flow(sk, dst, fl6);
+	ip6_sk_dst_store_flow(sk, dst, fl6, cookie);
 
 out:
 	fl6_sock_release(flowlabel);
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index b87ccb5586cf..d51986d5ea4b 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1370,6 +1370,7 @@ struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
 					 bool connected)
 {
 	struct dst_entry *dst;
+	u32 cookie;
 
 	if (connected) {
 		dst = sk_dst_check(sk, inet6_sk(sk)->dst_cookie);
@@ -1378,9 +1379,10 @@ struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
 			return dst;
 	}
 
-	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_dst);
+	dst = ip6_dst_lookup_flow_cookie(sock_net(sk), sk, fl6, final_dst,
+					 &cookie);
 	if (connected && !IS_ERR(dst))
-		ip6_sk_dst_store_flow(sk, dst_clone(dst), fl6);
+		ip6_sk_dst_store_flow(sk, dst_clone(dst), fl6, cookie);
 
 	return dst;
 }
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index c54844b83828..b19bc0d0c78d 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3048,19 +3048,19 @@ void ip6_sk_update_pmtu(struct sk_buff *skb, struct sock *sk, __be32 mtu)
 }
 
 void ip6_sk_dst_store_flow(struct sock *sk, struct dst_entry *dst,
-			   const struct flowi6 *fl6)
+			   const struct flowi6 *fl6, u32 cookie)
 {
 #ifdef CONFIG_IPV6_SUBTREES
 	struct ipv6_pinfo *np = inet6_sk(sk);
 #endif
 
-	ip6_dst_store(sk, dst,
-		      ipv6_addr_equal(&fl6->daddr, &sk->sk_v6_daddr),
+	ip6_dst_store_cookie(sk, dst, cookie,
+			     ipv6_addr_equal(&fl6->daddr, &sk->sk_v6_daddr),
 #ifdef CONFIG_IPV6_SUBTREES
-		      ipv6_addr_equal(&fl6->saddr, &np->saddr) ?
-		      true :
+			     ipv6_addr_equal(&fl6->saddr, &np->saddr) ?
+			     true :
 #endif
-		      false);
+			     false);
 }
 
 static bool ip6_redirect_nh_match(const struct fib6_result *res,
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 9e22ed61a6de..9dc031437b42 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -145,6 +145,7 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	struct dst_entry *dst;
 	struct flowi6 *fl6;
 	int addr_type;
+	u32 cookie;
 	int err;
 
 	if (addr_len < SIN6_LEN_RFC2133)
@@ -288,7 +289,7 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	 */
 	ip6_ecmp_set_mp_hash(net, fl6, sk->sk_txhash);
 
-	dst = ip6_dst_lookup_flow(net, sk, fl6, final_p);
+	dst = ip6_dst_lookup_flow_cookie(net, sk, fl6, final_p, &cookie);
 	if (IS_ERR(dst)) {
 		err = PTR_ERR(dst);
 		goto failure;
@@ -312,7 +313,7 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	inet->inet_rcv_saddr = LOOPBACK4_IPV6;
 
 	sk->sk_gso_type = SKB_GSO_TCPV6;
-	ip6_dst_store(sk, dst, false, false);
+	ip6_dst_store_cookie(sk, dst, cookie, false, false);
 
 	icsk->icsk_ext_hdr_len = 0;
 	if (opt)
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907410;
	b=xRLxZwykUcklS2BtqGnIzQ+j4R+O1OSOzxqTxbZdq3h70wNn9t6+t9Ogb2p1ZWBXDtvQ
	 kcpPgl3UDdZO164OKRg8V6eM+LjJidDr6mJON4obPGzBzyhMpf0XYZe7k3aUYfvHRUZVS
	 5YY+DX9kyDMtpRAQ0Smd/7APFI4ONrXNwZrhHosF2p8Dl6uEIBCBcHa9MsMIOsgjbEH3I
	 avE+H/Q4/DA6JR8rcWYCL0m5StzSEJKlKIPZTjYNCmXSJBqFbtmmgjEqeIlUlOT3M05z7
	 r1oRIBCoJwLKflF1MM50jBoQyOq+4dwqPSLhGVyKxivUQTjUfDraElwRSwULnvnYRGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907410;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=qOiVIMf0/x3m1w5f2iTYwi+mVMcrW+OUvHiTNkRCMYY=;
	b=v6qPmv7CorKQBv0/DjyysdNkL07rjuex7L9S+trtM32dBqr6sEBnC3RhPoQemsxTyVPr
	 vGE+G8BAHW87yUN/m0Gcaz1RslNGfOy/n1CkNqBOu05WuG50dXLOplo/b/byAzIycxmnn
	 UpGIKVrit8c+9t61pUnHUQJJhaO/Ihld2YEKDK6xi2PzO/4CjaP7eaZUGXR6x6j+/s7V+
	 +1gDTCrGee3g5DjMCDGQCnfge1k9se0MQqFtbPe+xrWtCHqgrCcd/yBMNSbKs6LjbX4Tb
	 Bpc6rJsdw9epUxj9mMns2mor4j+p6IgPfQczfw/S5reCNYALYZpi/FEQUm5XJfTBEGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=AftgPuha;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4BF606A32A;
	Tue, 17 Nov 2026 09:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=AftgPuha
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jTK5z3gD4z9tK0;
	Tue, 17 Nov 2026 10:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794907399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOiVIMf0/x3m1w5f2iTYwi+mVMcrW+OUvHiTNkRCMYY=;
	b=AftgPuhaGgw5x9I0MK6rNT1m25SLrF9yrT6CxsO2PoyhUEZ7bSM51rdCAZsOUlziH3Q0XQ
	SeNJLZnSWo7uZb84plUI+0dSRSHEPfOImVGoL+FVji/lK6PxIR4myb9HEvRD6iPR/55rnX
	obNruUBwzOZnPpGXK2wZY14Qg+yFYO8TdWqXQQ+Lk/FcWFin23ZEKkoa8ESZRNo7fRswO1
	oTn5Do7JavjI9ARkWKtCrNiteXnabN0j9rNMXU4WGPHARQVbHlgm6GjkeEpgZkLvIVzGmW
	k8P9h+UT19/c+VovaP6+EROVsCp55Nbsdl2fmfzlJ8ytfabjMkx1UWLe22Icgg==
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
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Tue, 17 Nov 2026 10:21:25 +0100
Message-ID: <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jTK5z3gD4z9tK0

Persistent dst caches read the validation cookie with rt6_get_cookie
after route lookup has returned. For routes without their own sernum,
this reads the current fn_sernum of the associated node. A concurrent
FIB change or xfrm policy insertion can therefore pair an old dst with a
new serial, allowing subsequent dst_check calls to accept the stale
result until another relevant change.

Add ip6_dst_lookup_flow_cookie to return the dst together with its
validation cookie. Sample the cookie between two reads of the IPv6
generation and return cookie 0 if the generation changed. This lets the
route dst serve the current packet while preventing its subsequent reuse
through cache validation. xfrm bundles retain their existing validation
through their own route and path cookies.

For nexthop-object dsts, return the pre-lookup generation and require
the supplied cookie to match rt->sernum in ip6_dst_check. This also
rejects a dst allocated with a newer serial after route selection.
Existing callers passing rt6_get_cookie retain their validation
behavior.

The generation checks require writers to publish routing changes before
advancing the serial. Move the serial updates in fib6_ifup and
fib6_ifdown after rt6_multipath_rebalance, preserving their existing
invalidation scope. Otherwise, a lookup can observe the new serial while
selecting a nexthop using the old ECMP bounds, without detecting a
generation change.

This establishes the API and writer ordering needed to address late
cookie sampling. The following patch converts selected socket cache
users while other persistent caches are left for follow-up conversions.

Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Changes since v2 https://lore.kernel.org/all/e48cac0cdf9f3adcedecbbfff4a314a98bc22d01.1794384146.git.ralf@mandelbit.com/
- Move the serial update after rt6_multipath_rebalance in fib6_ifup and
  fib6_ifdown. (Sashiko)
- Clarify that this introduces the new API while the following patch
  converts *some* users to it while leaving the rest as follow-up.

Changes since v1 https://lore.kernel.org/netdev/e40f48e925a0950eac99a3f084e485e82cabe88f.1793806941.git.ralf@mandelbit.com/
- Fix kdoc return statement in ip6_dst_lookup_flow and
  ip6_dst_lookup_flow_cookie. (NIPA)

 include/net/ipv6.h    | 13 +++++++++++
 net/ipv6/ip6_output.c | 51 +++++++++++++++++++++++++++++++++++++++++--
 net/ipv6/route.c      |  8 +++----
 3 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 579df1516d25..5a6c66504056 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1062,6 +1062,11 @@ int ip6_dst_lookup(struct net *net, struct sock *sk, struct dst_entry **dst,
 #if IS_ENABLED(CONFIG_IPV6)
 struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
 				      const struct in6_addr *final_dst);
+struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
+					     const struct sock *sk,
+					     struct flowi6 *fl6,
+					     const struct in6_addr *final_dst,
+					     u32 *cookie);
 #else
 static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk,
 						    struct flowi6 *fl6,
@@ -1069,6 +1074,14 @@ static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struc
 {
 	return ERR_PTR(-EAFNOSUPPORT);
 }
+
+static inline struct dst_entry *
+ip6_dst_lookup_flow_cookie(struct net *net, const struct sock *sk,
+			   struct flowi6 *fl6, const struct in6_addr *final_dst,
+			   u32 *cookie)
+{
+	return ERR_PTR(-EAFNOSUPPORT);
+}
 #endif
 
 struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 3cc911f6618e..b87ccb5586cf 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1279,8 +1279,7 @@ EXPORT_SYMBOL_GPL(ip6_dst_lookup);
  *
  *	This function performs a route lookup on the given flow.
  *
- *	It returns a valid dst pointer on success, or a pointer encoded
- *	error code.
+ *	Return: a valid dst pointer on success or a pointer encoded error code.
  */
 struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
 				      const struct in6_addr *final_dst)
@@ -1300,6 +1299,54 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
 }
 EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
 
+/**
+ *	ip6_dst_lookup_flow_cookie - perform route lookup on flow with ipsec
+ *				     and return the matching dst cookie
+ *	@net: Network namespace to perform lookup in
+ *	@sk: socket which provides route info
+ *	@fl6: flow to lookup
+ *	@final_dst: final destination address for ipsec lookup
+ *	@cookie: where to store the cookie for the returned dst
+ *
+ *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
+ *	the routing state the dst was obtained from. A caller caching the dst
+ *	should use this cookie when validating it with dst_check. If the
+ *	IPv6 FIB changed during the lookup, a route dst no longer validates
+ *	with it. An xfrm bundle is validated by xfrm and ignores the cookie.
+ *
+ *	Return: a valid dst pointer on success or a pointer encoded error code.
+ */
+struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
+					     const struct sock *sk,
+					     struct flowi6 *fl6,
+					     const struct in6_addr *final_dst,
+					     u32 *cookie)
+{
+	const struct rt6_info *rt;
+	struct dst_entry *dst;
+	int gen0, gen1;
+
+	gen0 = rt_genid_ipv6(net);
+	/* read the generation before looking at the FIB or xfrm policies */
+	smp_rmb();
+
+	dst = ip6_dst_lookup_flow(net, sk, fl6, final_dst);
+	if (IS_ERR(dst))
+		return dst;
+
+	rt = dst_rt6_info(dst);
+	*cookie = rt->sernum ? gen0 : rt6_get_cookie(rt);
+
+	/* keep the FIB and cookie reads before the final generation read */
+	smp_rmb();
+	gen1 = rt_genid_ipv6(net);
+	if (unlikely(gen0 != gen1))
+		*cookie = 0;
+
+	return dst;
+}
+EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);
+
 /**
  *	ip6_sk_dst_lookup_flow - perform socket cached route lookup on flow
  *	@sk: socket which provides the dst cache and route info
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index cc505817399b..c54844b83828 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2817,7 +2817,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 	rt = dst_rt6_info(dst);
 
 	if (rt->sernum)
-		return rt6_is_valid(rt) ? dst : NULL;
+		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;
 
 	rcu_read_lock();
 
@@ -4911,8 +4911,8 @@ static int fib6_ifup(struct fib6_info *rt, void *p_arg)
 	if (rt != net->ipv6.fib6_null_entry && !rt->nh &&
 	    rt->fib6_nh->fib_nh_dev == arg->dev) {
 		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
-		fib6_update_sernum_upto_root(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum_upto_root(net, rt);
 	}
 
 	return 0;
@@ -5015,8 +5015,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 			}
 			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
 						   RTNH_F_LINKDOWN);
-			fib6_update_sernum(net, rt);
 			rt6_multipath_rebalance(rt);
+			fib6_update_sernum(net, rt);
 		}
 		return -2;
 	case NETDEV_CHANGE:
@@ -5024,8 +5024,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
 			break;
 		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
-		fib6_update_sernum(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum(net, rt);
 		break;
 	}
 
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603599;
	b=DZib3SbkzGW79Ae/Okx+sK0c+aBcgsZtFUYbjHfI5dQgz1DfAnvdRO8EANEkt8xwMwTq
	 oIw5jl5vUktTu2cHFBy6sZzzSHJibHZDegMgjl94vreM2kPzSp6pwB7fkUFrzbiTrGlJv
	 5rZKyTuA4ZtvO0R6yPD6KwFH24IufAuMARZgXgXe54ynjYZ/TYnuMFmXYBmmhJrah52+/
	 cbBAiKhcBp9tq4HsZ42x7One0ZNtkc9MVrtaM4ef2L1u8WeLafdgc4mB2PIxDWDgLOKGs
	 jbo5t8/ebLgciKmZKkLbeFXD3Ne76rXh2esLXT9WVSkp5FwROkWT6zc9tPmpj6u7TEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603599;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:To:Cc:
	 Message-ID:X-Envelope-From;
	bh=fc7eBVccXyqpb3AcaE1cP21S6BjPzYCuEQMD8lkmYGs=;
	b=an0LgliOcGftWY7qw/TF+sF4E2QV44JzSiHQHjqZ0RL6/zKpm5dVvsx56oUbWlmTuSuw
	 dnK+d7Fi4sDOM4+IY8K52BlFZtceKuv41zVODYbXRdJ3djL64/w4Q1TUsihf0XylmigyG
	 0IZXmRmYzymy0bRsvynpno45Uq46+5YMprXKYDyHelj+P5c1dKmGH/zIxrRhxpYnEVZq9
	 c84xSMpBb8pYNjr4eWqMFWdb4KlXEIHp4sUpIQI+BE3TjCdh2x1ArRmpoKgowVer2+86r
	 Y8HT/0aDC3zUV/pLu6N7cTlJvKXslI5/8E39SbkQ9hArTpD1GJPXw8MP1T64rkcXkEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=kC8Nc1Hx;
	arc=none smtp.remote-ip=198.54.127.139
Received: from out-2z4y-a139.jellyfish.systems (out-2z4y-a139.jellyfish.systems [198.54.127.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F10C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=kC8Nc1Hx
Received: from [10.18.116.108] (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j8x5X6HPNz6tkQ;
	Wed, 21 Oct 2026 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1792603572;
	bh=fc7eBVccXyqpb3AcaE1cP21S6BjPzYCuEQMD8lkmYGs=;
	h=From:Date:Subject:To:Cc:From;
	b=kC8Nc1Hx+Eg2+OWebfwGurucXxKpHOwLadXoikSLe8leVcqsJr1l+ikbiw4zDiTxw
	 pbIkegkRLZiZgMdOpeB1iPMCkwYzncTCKtC9fOS/mhnk/iIJOd5CAQgkqNOkPsS0Ta
	 4ZX4cIcztMCbqztjWrd672QanY4ML2mhG1jampjK/GFsl+oR9dlkBs0oNTVC3xxr1i
	 GyVd5dQg65yXdL8pkIxmGUAxnRYhQj8YJ/e0hoiJqJVRGsakKlyo0opvNhX0tARtbb
	 dKvV5aUTkekwXW+fs9cGqjc/Fo18I+zsQtAIk42cHY0MQwJSXKxn/jFPKGtJ0SMxKs
	 knpYsi3E+Fq1w==
From: Tianyi Chen <hi@tychen.cc>
Date: Thu, 22 Oct 2026 02:23:59 +0900
Subject: [PATCH net] ipv4: igmp: report interface group allocation failure on
 join
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, hi@tychen.cc
Message-ID: <179260356668.911829.6576504063198285556@tychen.cc>
X-Envelope-From: hi@tychen.cc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

setsockopt(IP_ADD_MEMBERSHIP) can return 0 while the group was never
joined on the interface.  __ip_mc_join_group() publishes the socket-side
ip_mc_socklist in inet->mc_list before calling ____ip_mc_inc_group().
That helper returns void, so when its kzalloc_obj() fails it returns
without creating the interface-side ip_mc_list and the syscall still
reports success.  The socket then passes IP_MSFILTER but cannot receive
the group's traffic: no IGMP report is generated, the group is absent
from /proc/net/igmp, and the receive path drops the datagrams.  Closing
the socket also decrements the interface group for every published
ip_mc_socklist, so it can remove a group that another socket joined.

Make the helper return -ENOBUFS on allocation failure, call it before
publishing iml, and free iml on failure.  The object is charged with
sock_kmalloc(), so sock_kfree_s() with the same size keeps
sk_omem_alloc balanced; it was never published and has no source list
yet, so no RCU free is needed.  Successful joins still publish the fully
initialized socket-side record after the interface group exists.  RTNL
serializes the writers, not the RCU readers; this ordering prevents a
published socket membership without a device group.

The legacy void wrapper keeps its best-effort behaviour: interface-up,
init, bridge and tunnel callers cannot report an allocation failure.  A
query does not recreate a missing group; only a later successful
inc_group call can.  The silent failure predates the 2019 helper split
(9fb20801dab4); there is no recent regression to tag with Fixes.

Reproduced with fail-nth on v6.19 and v7.3-rc2.  N=2 fails the helper's
kzalloc_obj(): the original returns 0 with no interface group and 0/4
multicast datagrams delivered; this change returns -ENOBUFS, leaves no
socket or interface state, and a later join delivers 2/2.  On the
original, closing the half-joined socket also removes a second socket's
group; the patched kernel keeps it.  Normal joins, the existing-group
users++ path and source-specific joins (allowed 2/2, filtered 0/2) are
unchanged.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 net/ipv4/igmp.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index d56355aca797..81a100330630 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -1566,9 +1566,15 @@ static void inet_ifmcaddr_notify(struct net_device *dev,
 
 /*
  *	A socket has joined a multicast group on device dev.
+ *
+ *	Returns 0 if the interface now has a reference to the group, or
+ *	-ENOBUFS if the new group could not be allocated.  Callers that can
+ *	report an error to userspace must check it: a socket that reports a
+ *	successful join while the interface has no group cannot receive the
+ *	group's traffic.
  */
-static void ____ip_mc_inc_group(struct in_device *in_dev, __be32 addr,
-				unsigned int mode, gfp_t gfp)
+static int ____ip_mc_inc_group(struct in_device *in_dev, __be32 addr,
+			       unsigned int mode, gfp_t gfp)
 {
 	struct ip_mc_list __rcu **mc_hash;
 	struct ip_mc_list *im;
@@ -1595,12 +1601,12 @@ static void ____ip_mc_inc_group(struct in_device *in_dev, __be32 addr,
 	if  (im) {
 		WRITE_ONCE(im->users, im->users + 1);
 		ip_mc_add_src(in_dev, &addr, mode, 0, NULL, 0);
-		goto out;
+		return 0;
 	}
 
 	im = kzalloc_obj(*im, gfp);
 	if (!im)
-		goto out;
+		return -ENOBUFS;
 
 	WRITE_ONCE(im->users, 1);
 	im->interface = in_dev;
@@ -1630,13 +1636,18 @@ static void ____ip_mc_inc_group(struct in_device *in_dev, __be32 addr,
 	inet_ifmcaddr_notify(in_dev->dev, im, RTM_NEWMULTICAST);
 	if (!in_dev->dead)
 		ip_rt_multicast_event(in_dev);
-out:
-	return;
+	return 0;
 }
 
 void __ip_mc_inc_group(struct in_device *in_dev, __be32 addr, gfp_t gfp)
 {
-	____ip_mc_inc_group(in_dev, addr, MCAST_EXCLUDE, gfp);
+	/*
+	 * Legacy void interface: interface-up, init, bridge and tunnel
+	 * callers cannot report an allocation failure.  Keep the best-effort
+	 * behaviour.  A query does not recreate a missing group; only a later
+	 * successful inc_group call can.
+	 */
+	(void)____ip_mc_inc_group(in_dev, addr, MCAST_EXCLUDE, gfp);
 }
 EXPORT_SYMBOL(__ip_mc_inc_group);
 
@@ -2386,11 +2397,19 @@ static int __ip_mc_join_group(struct sock *sk, struct ip_mreqn *imr,
 		goto done;
 
 	memcpy(&iml->multi, imr, sizeof(*imr));
-	iml->next_rcu = inet->mc_list;
 	iml->sflist = NULL;
 	iml->sfmode = mode;
+	/*
+	 * Make the interface group exist before publishing the socket's
+	 * membership: success must mean the group can actually receive.
+	 */
+	err = ____ip_mc_inc_group(in_dev, addr, mode, GFP_KERNEL);
+	if (err) {
+		sock_kfree_s(sk, iml, sizeof(*iml));
+		goto done;
+	}
+	iml->next_rcu = inet->mc_list;
 	rcu_assign_pointer(inet->mc_list, iml);
-	____ip_mc_inc_group(in_dev, addr, mode, GFP_KERNEL);
 	err = 0;
 done:
 	return err;

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794021439;
	b=0q0blbWCglnehBg2KgFAn/MaDDhDvkJ9odFQ/wP332UQ0qTV414Vd4O7cpFDxMMm0JMi
	 K5xWYtyw4ly1N04XVklE63Ry3sLBeZ9Pevsh6RSoNr/50njVjHliFpkGPHOoMRAIJGrK/
	 bYR0e08tK19zSXMD00vVWLWiGcjl0f/y6byWH6pa/7gWSveDiadHDPMsh0H2Vo8Nl9qfQ
	 5Y+nlM54aj5y8uPm+3aGrivsRIt+OLYTVLIGVC461ZGWTfg5+dEo672AxROP7SWHxI+SU
	 nzJ+32ndu9YD3eqxjT+BaWEoP5lKdWShd213lROE+/y3dYl6s4kkjSvkQcj4UjqtDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794021439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=5V973eV5z9bFCFEhgPYSvRAKHWeecR/OoECRUm/vrjI=;
	b=g6PQOe341bFW2M8k8sEUAuHuMGYBcdRqTHWrNaxIGncjfAJRm61GMiBugLbqrU6qaVD+
	 YcbLD0hC3s+YfsKqzeVplYOaFdxKKkkRazoj763saj0TVBlwS5WDSz75RIXvlmsAU6nDQ
	 Y0wqWkNEpXY37963gjXpu0QeuqwWVfrWfG4B4xkjgubsdkLcwIFDe/YaGdWyqB1THjf3Q
	 twLE8P8Pmz3jD3bUoGoj4I9oZ4jpgT3WODTAdsoeAeXwFdR/vekQWlYtoRf0Ztgy+7Riw
	 gFsVIEizADHDwsEEp6ZtmZIoY+czJc6cmb9A5zGyqypQipW1Q26cGO1ImLie1JuP4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mtf0B2Lr;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80EF606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mtf0B2Lr
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e90071735so188567eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794021438; x=1794626238; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5V973eV5z9bFCFEhgPYSvRAKHWeecR/OoECRUm/vrjI=;
        b=mtf0B2Lr5l7FsjDOdaERaAxmGRyqLte1g4IWhLbZHM+ub48pKGPjjqUGdZd+IRHrMD
         meJZuBiTQeW55zIf8ZeLOzfb05/Np7cAH55b+PnuXKk4EtVoyjXKdBTVi3wYCBJY4XE5
         81Qo8qPVVsSdfUXFBoTn2rnLwIhrdXYaHbYBIuN3GnsHkPoWVSJXz/+L3uqWHBbwHnAU
         czIgLwzP9Anr4267FbtfN5OLlT5Hcu5dAXgXZddin+r5ivbJ3wgyHtcjBkrG8t0jz45W
         RxG5zQYjomPh/tmMwtlxVGEPlJDFPT+M2slOybjXuKi/LcK0FIj23U0i89TaifaUmrjO
         gizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794021438; x=1794626238;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5V973eV5z9bFCFEhgPYSvRAKHWeecR/OoECRUm/vrjI=;
        b=Zbbs6Y56ZntgVWzRhdv/Dwnt5D7lWl1ulD6BAAX2wGWPVpg0Zu0f5epveIDIei5riS
         +0gZnjXMGdETE3nS5UzPiZeWlylGhVrWpuxx0fbKWX/lsVZK1M7azSqZk41HRzJ0wamj
         bAo0kVwK0aIOw3UJ3jNG+24wvHfYLuRYaOXQSLf1TAC2wMvvg3d+rwyWJ0kvFlCt6KXs
         dIOLg3oatKOCrQolNcra1sUWrgrxBNPx6NUqXsQ/zJwdB+l5/KAlNxVOK0Sa4OrcG6aE
         Bu+puTekXERatO8YCD3oeXkmCisMwJx/oevCnfR75fjRmzqqi+spm3WdHWPtqgWvOhYO
         WUyQ==
X-Forwarded-Encrypted: i=1; AL+hErGJFJqcqF+f9lhG1H1+qY/WmfPYHufdsXIBvLfJEqV21tpUmk/ScbohOt3ZooFhfCQDZKUlu4+CXV9aZRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bHR/Of7G6RRRYlEzT/WffZtX/b7ftAlACXQUydH8IhNck/23v
	2IOTVlGTc9r+M79iyOLp6dza5Tsvrt9NQtEDG7ItnjfxlQYjYN9OAZy5
X-Gm-Gg: AYBFou3QayifXDAMPM/mPOdMov6B71Z8Vq7O7nFI6ROs9ozG9Xs/FFf7AzshxUZuzQ1
	AHuXvmtit18qd/iG2nvhX8NclfP/Ehd5qWhpPt+IdBXHOAGzF8j4x5a1Y1RI/0a1zigk0KzYLix
	udh6CAqF+9RvwQX9QnHHeilnAJXvdXoIoXiyvn0gnLldwdtrhUQVAEWCyAQYy9zGVmgEr8hbEb6
	04XbzTwhWaW7FREuN0HOx0tZQPoSCcAfiNepgYr9pHGXze7kkoMGMO7QbS1NeWc8epVf5Naieji
	dj+zvBiO6jr8U6I08u9aee4vhM1dSpTa+Rdrq5rok626AfTv5hawrdOVglPvDZ4Q5iVbvHdSPww
	9z7NcDz956/HFp68k6fJ+1XMIBDdcViOXpK5WdCyWa4BxjYn/Hun8dL5gHi/LsElVantdpSRN8r
	zF30qC8kkHhGZnPtRlnNwC1WvckbAlX9XkfUs5Wg1xceMT7IFz8ReqMEFVDz81ZGN+T7MKkXEX8
	9PjmSQ6fZu2HyLiR7XS+bbgLLN2XUkuAgfSC+Ru6ZuHAPiqAexz/S/0YI4KDJebyW2NR5zZbXuq
	Y7kVEAh4paHk95WL7JdhxqYbhYaZg5nYx8UyQItSh+khWkUXQnF4MqAMoEeFP0pelaCouIw=
X-Received: by 2002:a05:693c:8858:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-36f7524bf37mr9088545eec.2.1794021437662;
        Fri, 06 Nov 2026 19:17:17 -0800 (PST)
Received: from msg ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922b205sm10973889eec.11.2026.11.06.19.17.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:17:17 -0800 (PST)
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Message-ID: <20261107111617.21347-4-q.h.hack.winter@gmail.com>
In-Reply-To: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
References: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Sat, 31 Oct 2026 10:09:48 +0800
Subject: [PATCH net v8 3/3] xfrm: hold the tunnel device reference across the
 input path
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference.  With async crypto the
receive callback runs from the crypto completion, after a possible
device teardown, and dereferences the freed tunnel device:

    BUG: KASAN: slab-use-after-free in vti_rcv_cb

Take a reference on the tunnel device when the pointer is cached.  The
tunnel is the device's private area, so the reference keeps the tunnel
structure alive as well.  xfrm6_rcv_spi() takes the same reference for
the tunnel it is given; it is a separate entry point, so vti6 does not
hold the reference twice.

A successful vti/vti6 callback leaves the cached tunnel in place for
xfrm_input() to release after delivery.  A callback that fails only
updates the error counters; the common drop path releases the reference
after the skb has been freed.  The helper takes the device out of the
skb before gro_cells_receive() and transport_finish(), which may already
consume the skb, so the device reference is always dropped after the skb
is gone.  The early drop for a state that is no longer valid releases
the reference too, and needs the address family for that, so set the
family before the validity check.

The reference is released right after gro_cells_receive().  The NAPI
that processes the queued skb later still reads skb->dev without a
reference.  That window is pre-existing on the synchronous path as well
and is not changed here.

IPTFS consumes the outer skb itself and frees it directly, so it must
release the reference as well.  The IPTFS state carries the address
family the tunnel was resolved for, and the caller passes it in.  Add
xfrm_input_drop() and xfrm_input_consume() for the outer-skb free paths
in __input_process_payload(), iptfs_input_ordered(), iptfs_input(),
iptfs_drop_timer() and iptfs_destroy_state().  Only the outer skb
carries the cached tunnel; the inner skbs built by iptfs_alloc_skb()
have a zeroed control buffer, so they do not release it.  The drop paths
keep their skb drop reason and the consumed skb keeps consume_skb()
semantics.

Fixes: df3893c176e9 ("vti: Update the ipv4 side to use it's own receive hook.")
Fixes: fa9ad96d4905 ("vti6: Update the ipv6 side to use its own receive hook.")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  2 ++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 64 ++++++++++++++++++++++++++++++++++++++++--
 net/xfrm/xfrm_iptfs.c  | 31 +++++++++++---------
 6 files changed, 91 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index c4f14d42d..e7b836aba 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -63,6 +63,9 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,
 
 		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = tunnel;
 
+		/* Keep the tunnel alive until xfrm_input() is done with the skb. */
+		dev_hold(tunnel->dev);
+
 		if (update_skb_dev)
 			skb->dev = tunnel->dev;
 
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index c79027839..c3666dc53 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -319,6 +319,8 @@ static int vti6_input_proto(struct sk_buff *skb, int nexthdr, __be32 spi,
 			goto discard;
 		}
 
+		/* Keep the tunnel alive until xfrm_input() is done with the skb. */
+		dev_hold(t->dev);
 		rcu_read_unlock();
 
 		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
diff --git a/net/ipv6/xfrm6_input.c b/net/ipv6/xfrm6_input.c
index 07edef258..d27bc24f1 100644
--- a/net/ipv6/xfrm6_input.c
+++ b/net/ipv6/xfrm6_input.c
@@ -15,6 +15,7 @@
 #include <linux/netfilter.h>
 #include <linux/netfilter_ipv6.h>
 #include <net/ipv6.h>
+#include <net/ip6_tunnel.h>
 #include <net/xfrm.h>
 #include <net/protocol.h>
 #include <net/gro.h>
@@ -23,6 +24,8 @@ int xfrm6_rcv_spi(struct sk_buff *skb, int nexthdr, __be32 spi,
 		  struct ip6_tnl *t)
 {
 	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
+	if (t)
+		dev_hold(t->dev);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 	return xfrm_input(skb, nexthdr, spi, 0);
diff --git a/net/xfrm/xfrm_inout.h b/net/xfrm/xfrm_inout.h
index efc5e6b2e..8bd05f62a 100644
--- a/net/xfrm/xfrm_inout.h
+++ b/net/xfrm/xfrm_inout.h
@@ -6,6 +6,10 @@
 #ifndef XFRM_INOUT_H
 #define XFRM_INOUT_H 1
 
+void xfrm_input_drop(struct sk_buff *skb, unsigned int family,
+		     enum skb_drop_reason reason);
+void xfrm_input_consume(struct sk_buff *skb, unsigned int family);
+
 static inline void xfrm4_extract_header(struct sk_buff *skb)
 {
 	const struct iphdr *iph = ip_hdr(skb);
diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index cfd5cea03..e3b6c486f 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -120,6 +120,56 @@ static int xfrm_rcv_cb(struct sk_buff *skb, unsigned int family, u8 protocol,
 	return ret;
 }
 
+/*
+ * The cached tunnel holds one reference on its net_device.
+ * The address family determines the tunnel type.
+ */
+static struct net_device *xfrm_input_take_tunnel_dev(struct sk_buff *skb,
+						     unsigned int family)
+{
+	void *slot = (void *)XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4;
+	struct net_device *dev;
+
+	if (!slot)
+		return NULL;
+
+	switch (family) {
+	case AF_INET:
+		dev = ((struct ip_tunnel *)slot)->dev;
+		break;
+	case AF_INET6:
+		dev = ((struct ip6_tnl *)slot)->dev;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	return dev;
+}
+
+void xfrm_input_drop(struct sk_buff *skb, unsigned int family,
+		     enum skb_drop_reason reason)
+{
+	struct net_device *dev = xfrm_input_take_tunnel_dev(skb, family);
+
+	kfree_skb_reason(skb, reason);
+	if (dev)
+		dev_put(dev);
+}
+EXPORT_SYMBOL(xfrm_input_drop);
+
+void xfrm_input_consume(struct sk_buff *skb, unsigned int family)
+{
+	struct net_device *dev = xfrm_input_take_tunnel_dev(skb, family);
+
+	consume_skb(skb);
+	if (dev)
+		dev_put(dev);
+}
+EXPORT_SYMBOL(xfrm_input_consume);
+
 struct sec_path *secpath_set(struct sk_buff *skb)
 {
 	struct sec_path *sp, *tmp = skb_ext_find(skb, SKB_EXT_SEC_PATH);
@@ -468,6 +518,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 	const struct xfrm_state_afinfo *afinfo;
 	struct net *net = dev_net(skb->dev);
 	struct net_device *dev = skb->dev;
+	struct net_device *tdev;
 	int err;
 	__be32 seq;
 	__be32 seq_hi;
@@ -747,8 +798,11 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			sp->olen = 0;
 		if (skb_valid_dst(skb))
 			skb_dst_drop(skb);
-		/* gro_cells_receive() reads skb->dev. */
+		/* gro_cells_receive() may free the skb. */
+		tdev = xfrm_input_take_tunnel_dev(skb, family);
 		gro_cells_receive(&gro_cells, skb);
+		if (tdev)
+			dev_put(tdev);
 		if (async)
 			dev_put(dev);
 		rcu_read_unlock();
@@ -758,6 +812,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 		if (xo)
 			xfrm_gro = xo->flags & XFRM_GRO;
 
+		tdev = xfrm_input_take_tunnel_dev(skb, family);
 		err = -EAFNOSUPPORT;
 		afinfo = xfrm_state_afinfo_get_rcu(family);
 		if (likely(afinfo))
@@ -771,6 +826,8 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			gro_cells_receive(&gro_cells, skb);
 		}
 
+		if (tdev)
+			dev_put(tdev);
 		if (async)
 			dev_put(dev);
 		rcu_read_unlock();
@@ -781,9 +838,12 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 	spin_unlock(&x->lock);
 drop:
 	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
+	tdev = xfrm_input_take_tunnel_dev(skb, family);
+	kfree_skb(skb);
+	if (tdev)
+		dev_put(tdev);
 	if (async)
 		dev_put(dev);
-	kfree_skb(skb);
 	return 0;
 }
 EXPORT_SYMBOL(xfrm_input);
diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 5ea3e77dd..363962308 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -717,8 +717,9 @@ static void __iptfs_reassem_done(struct xfrm_iptfs_data *xtfs, bool free)
 			      IPTFS_HRTIMER_MODE);
 	}
 
-	if (free)
-		kfree_skb(xtfs->ra_newskb);
+	if (free && xtfs->ra_newskb)
+		xfrm_input_drop(xtfs->ra_newskb, xtfs->x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	xtfs->ra_newskb = NULL;
 }
 
@@ -1213,14 +1214,11 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
 	skb_abort_seq_read(skbseq);
 
 	if (defer) {
-		consume_skb(defer);
+		xfrm_input_consume(defer, x->props.family);
 	} else if (!first_skb) {
-		/* skb is the original passed in skb, but we didn't get far
-		 * enough to process it as the first_skb, if we had it would
-		 * either be save in ra_newskb, trimmed and sent on as an skb or
-		 * placed in defer to be freed.
-		 */
-		kfree_skb(skb);
+		/* The original skb was not consumed as the first inner packet. */
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 	return true;
 }
@@ -1307,7 +1305,8 @@ static void iptfs_input_ordered(struct xfrm_state *x, struct sk_buff *skb)
 	if (!consumed) {
 		skb = skbseq.root_skb;
 		skb_abort_seq_read(&skbseq);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 }
 
@@ -1709,7 +1708,8 @@ static enum hrtimer_restart iptfs_drop_timer(struct hrtimer *me)
 	spin_unlock(&xtfs->drop_lock);
 
 	if (skb)
-		kfree_skb_reason(skb, SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
 
 	if (count) {
 		list_for_each_entry_safe(skb, next, &list, list) {
@@ -1760,7 +1760,8 @@ static int iptfs_input(struct xfrm_state *x, struct sk_buff *skb)
 
 	list_for_each_entry_safe(skb, next, &freelist, list) {
 		skb_list_del_init(skb);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 done:
 	/* We always have dealt with the input SKB, either we are re-using it,
@@ -2761,11 +2762,13 @@ static void iptfs_destroy_state(struct xfrm_state *x)
 	hrtimer_cancel(&xtfs->drop_timer);
 
 	if (xtfs->ra_newskb)
-		kfree_skb(xtfs->ra_newskb);
+		xfrm_input_drop(xtfs->ra_newskb, xtfs->x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 
 	for (s = xtfs->w_saved, se = s + xtfs->w_savedlen; s < se; s++) {
 		if (s->skb)
-			kfree_skb(s->skb);
+			xfrm_input_drop(s->skb, x->props.family,
+					SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 
 	kfree_sensitive(xtfs->w_saved);
-- 
2.54.0 (Apple Git-157)



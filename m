Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639628;
	b=V8NxzvPPUoMq+SZOGwxsL5YjLpbkS8du1JjIFRN3pGd2oNExzDBJOlZNb1ViELg1RdcW
	 D+CEGuyKSpmwy1BNfFZTyKDBSOfCMp30hvg+ypeZeDwvqc0lvOiRb8tYuG9hwIFU09c2D
	 JA0M2ZxYXcKCmm12POB/fNX57lTqucmHId/GcbUoaDaMMv2lcHV7AQ9t0f15xSMPiOMzW
	 yxF2vr8yklsjOVSg2gyBMN7oT7IOmQviXqlR5XyQdHQbFVxSJnUj2pY9w6enA3tOoxBFV
	 1Rs//5BYBlJEGW+xyPTBYhHLv11ldXw4bOS/YzTeRiG60Mcf9RsKaoAFkYzCdlW8PSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
	b=qzPwAieSjRXzhL0cikSsOhRdSdt0cE1GC6r8EQKHyMmK7prPZJuJ6HvRAJ+tnmZOy9+Q
	 bIotnGU8N312hZp5o2PQDNaKjM34DsYMQ96I11Ciuyqz9eAM5lzc8HIYFBTpKYeiMA3qm
	 YyOMgN3RSh+RXxhE+KS6WFaZ6VcFXYIZFolgpIHeGEXOKM4xwFK7JNefg2YkfBSp2cBx+
	 JlvEsTCeetJAHO3PaBgTNFZPSig/+qKdywToh3OLTbZJlKKnuvWfpQJu6W+wAk1kcwWIT
	 Y9zxYVIJKIWx2lIZkQOfb76/GhsfAkfDzefcfS/H3KD9cwSK8uAU+vO3+YZxyrnvxZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0hk+9EV;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285EE606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285EE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0hk+9EV
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-870e8b21121so117557b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639628; x=1793244428; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
        b=h0hk+9EVp2udpisLduAc32kkur4LYmvZfjTD/yI8dnpG46jVinr9t+3drTklQb0l5a
         IIi2wBW3QrGXsI9paFyCDjci+5L/xSlVLdzkOaxSCOOqh2a+YtpCzWlHjP+C5PmfjK/x
         rSVyim/GySVOvt4OkJlyYZxsB/C2/nvJve5nf9aK14wSMw2K6w+ZDLsOGNeE+xtLDO3O
         /5llZTED2uqSTNJvhUPp1hPmSAD9oAsL3AsHgogD2m3CoLWPfPnwtB6HqtbrK+lxKAhd
         8Pj8MsTHVb3ij4jYEKtgrAJuLIiItSEciJyd2qLva1j+vSTAghgFiYDdukQOkC5uJo79
         DIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639628; x=1793244428;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
        b=tFU7CLq9dI2u8UVDlf0Hw3u+GIuDmUQCXhJTtQHJZWsuCj0ekVdRSXDpse2vIjAR4P
         vbXe+RfAwDp2+TF+6JrA/DcylAhQGqV2Jx63ltNDtsB7i4uULxFHBGwMwgu4cJHELPd6
         ojYAXBthRzOL73O+0U9QWRSbxsfdFAZpQIA+wZ9P2U0S/fFJO3cRdlgd3+AJ8/JdBUx1
         6MzRZtcjIgR7kCzMo1zJCVmZICTnrnoQ3gbJkvAbLxosBdNKyo+hdRQnDGt1TxitkJ4w
         OEdjfmHcezGnLJrM5uUqU2pDaLgMpwR39vTBYg+vWeOqLsutcXtr8JtcQw+6+cob5id6
         SFUw==
X-Forwarded-Encrypted: i=1; AKwUvByEHusiQ0eCVQwxWOb/pX8MBufge61X24aMAAEhsIpXd8G44ZDjiMu5bY22Js2FCvs55vYq3RnEuAwsVyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRzOdqLEVcqnFeF0vOd02dI9nVaN8ph0SaVjzd6q0RKzQgcPK9
	axX7yE1buVRXmYhrnTQ9G9lydFNaSTgZtfxBSrrSKZ1rYMUHvOrKfzqn
X-Gm-Gg: AYBFou2Dd+HI3uoX1HdopHNoATLMgdWfisqBsZRyVdYDap9KlN154g4psFYLaOPRL2H
	cC9RAwRmHjT3rmSDMC2TR0RjIp2rsjOUxe9r3gxIvf36FfOqt7Iylz+qsrTMZDwcc8No6thFadi
	O82drBdcYlV8T28lypSAtnrTnB+rwKXoticpcaDdBD2AM89El51Yi6cm6AFr2nWsC7Yca/BXBsA
	9gON1hMdfhtutYN19GOEY8Hk8gFEPpu8UQJZk8QVVNgmR5iK6+LpFshD9T8RXvYyrmqqYbLP6yf
	Dk3JyF/yN+pgBSR92n9PUU2DLzv8/6YJhwGLRL0Zu/1CFCYfAqqNzAmiSfpNq1zkAp1kyAiWgrh
	ekVVrtqH1u4FNZMUCbsN1VZjsgBLq5dWwhWUKzqaEQYuVZKTEtpAG9BPeHnRa3axOU3uVZk0xj7
	q4U0ZP+3/CibyZFkLfp7wRJqFDFsUszSQHwzsBtvx/t+xyFNwW437VeSpecJ0HtSaxWZHixAcJb
	h7l1fOxEEL/SoiefOU2pd50ftIzeX9CrcRss+idKau7QJp7jQKSnSNdMPdO7lCKtk2m435yugfh
	YuJKUcGg9vzaglX7tSb44Rhdpha6pZxc6cJiqUWWlnM=
X-Received: by 2002:a17:90b:39a7:b0:3ad:50ef:f5ef with SMTP id 98e67ed59e1d1-3ad86f000eemr5853546a91.3.1792639627465;
        Wed, 21 Oct 2026 20:27:07 -0700 (PDT)
Received: from msg ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48879a0sm2027760a91.4.2026.10.21.20.27.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 20:27:07 -0700 (PDT)
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
Message-ID: <20261022032129.16118-4-q.h.hack.winter@gmail.com>
In-Reply-To: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
References: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Sun, 18 Oct 2026 15:03:23 +0800
Subject: [PATCH net v6 3/3] xfrm: hold the tunnel device reference across the
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
consume the skb.  The device reference is therefore always dropped after
the skb is gone.

IPTFS consumes the outer skb itself and frees it directly, so it must
release the reference as well.  The IPTFS state carries the address
family the tunnel was resolved for, and the caller passes it in.  Add
xfrm_input_drop() and xfrm_input_consume() for the outer-skb free paths
in __input_process_payload(), iptfs_input_ordered(), iptfs_input(),
iptfs_drop_timer() and iptfs_destroy_state().  Only the outer skb
carries the cached tunnel; the inner skbs built by iptfs_alloc_skb()
have a zeroed control buffer, so they do not release it.  The drop paths
keep their skb drop reason and the consumed skb keeps consume_skb()
semantics.  An inner packet that fails validation reaches the drop path
before the queued inner packets are delivered; drop those as well so the
outer skb's reference is not leaked.

The reference is released right after gro_cells_receive(); the NAPI
that processes the queued skb later still uses skb->dev without a
reference.  That window is pre-existing and is not changed here.

This depends on the previous two patches: the receive callbacks must
run before the async dev_put(), and the early drop must know the
address family to release the reference.

Fixes: df3893c176e9 ("vti: Update the ipv4 side to use it's own receive hook.")
Fixes: fa9ad96d4905 ("vti6: Update the ipv6 side to use its own receive hook.")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
v5:
- __input_process_payload(): drop the inner packets queued on the
  delivery list when an inner packet fails validation and jumps to the
  drop label, so the outer skb's tunnel device reference is released
  (found by the Sashiko review).

 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  2 ++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 63 +++++++++++++++++++++++++++++++++++++++++-
 net/xfrm/xfrm_iptfs.c  | 42 ++++++++++++++++++----------
 6 files changed, 102 insertions(+), 15 deletions(-)

diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index 3b80929994a0..0277812852e7 100644
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
index ab94b3a4ba9c..6715bf10bc85 100644
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
index 07edef258984..d27bc24f1b16 100644
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
index efc5e6b2e87b..8bd05f62ad56 100644
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
index 517369ba9efe..369817c870ce 100644
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
@@ -748,7 +799,11 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			skb_dst_drop(skb);
 		if (async)
 			dev_put(dev);
+		/* gro_cells_receive() may free the skb. */
+		tdev = xfrm_input_take_tunnel_dev(skb, family);
 		gro_cells_receive(&gro_cells, skb);
+		if (tdev)
+			dev_put(tdev);
 		rcu_read_unlock();
 		return 0;
 	} else {
@@ -756,6 +811,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 		if (xo)
 			xfrm_gro = xo->flags & XFRM_GRO;
 
+		tdev = xfrm_input_take_tunnel_dev(skb, family);
 		err = -EAFNOSUPPORT;
 		afinfo = xfrm_state_afinfo_get_rcu(family);
 		if (likely(afinfo))
@@ -769,6 +825,8 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			gro_cells_receive(&gro_cells, skb);
 		}
 
+		if (tdev)
+			dev_put(tdev);
 		if (async)
 			dev_put(dev);
 		rcu_read_unlock();
@@ -779,9 +837,12 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
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
index 6920940a35b4..2b202c7570f1 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -709,8 +709,9 @@ static void __iptfs_reassem_done(struct xfrm_iptfs_data *xtfs, bool free)
 
 	/* We don't care if it works locking takes care of things */
 	hrtimer_try_to_cancel(&xtfs->drop_timer);
-	if (free)
-		kfree_skb(xtfs->ra_newskb);
+	if (free && xtfs->ra_newskb)
+		xfrm_input_drop(xtfs->ra_newskb, xtfs->x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	xtfs->ra_newskb = NULL;
 }
 
@@ -1204,15 +1205,23 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
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
+	}
+
+	/*
+	 * A validation failure can bypass delivery of @sublist.  Drop the
+	 * queued skbs so the outer skb's tunnel reference is released.
+	 */
+	list_for_each_entry_safe(skb, next, sublist, list) {
+		skb_list_del_init(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
+
 	return true;
 }
 
@@ -1298,7 +1307,8 @@ static void iptfs_input_ordered(struct xfrm_state *x, struct sk_buff *skb)
 	if (!consumed) {
 		skb = skbseq.root_skb;
 		skb_abort_seq_read(&skbseq);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 }
 
@@ -1700,7 +1710,8 @@ static enum hrtimer_restart iptfs_drop_timer(struct hrtimer *me)
 	spin_unlock(&xtfs->drop_lock);
 
 	if (skb)
-		kfree_skb_reason(skb, SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
 
 	if (count) {
 		list_for_each_entry_safe(skb, next, &list, list) {
@@ -1751,7 +1762,8 @@ static int iptfs_input(struct xfrm_state *x, struct sk_buff *skb)
 
 	list_for_each_entry_safe(skb, next, &freelist, list) {
 		skb_list_del_init(skb);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 done:
 	/* We always have dealt with the input SKB, either we are re-using it,
@@ -2752,11 +2764,13 @@ static void iptfs_destroy_state(struct xfrm_state *x)
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



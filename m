Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BF44F553
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314424; cv=none; b=PgXc27Q6L31xRei2pp/gFJOidcJra8Svx2oF7+C8PjQKlHKKnp1x7JK1Nv+5eMn1ibkjm4lmJEsc0KQT9G/xxXjVv0tirB/Vws+OnfHDxcr7Q2FwgKjzO5OsgC+K5eVhHpd7m63ctf+w8XNE6BbKVaQnGxG0lwLa9Pf450MUQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314424; c=relaxed/simple;
	bh=f+nris4d4zWv9JrDWeIPVriTY/gt1aASkMLwAUEv+jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGf7SKUAkWiU7tOYXN7qu4QNOywoy9P+qA+wDxmJ3Eo1rTckRHaTBt4d63grBnP4/Mst7uxlLbg/Q3reknEGFoFDCAsa9qVx1FMAStN47zY3K2U8AjU6ntFFQdGpk8loHeUsZbHgs5PB0lRxe0hCCaHzuo38x4fS76yZBJYsqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3OTTBDx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3OTTBDx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so258001a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314420; x=1792919220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcrM7xj1hl7Ek+joMUqGAFthjfHhD83vu5g9xZWY5i0=;
        b=S3OTTBDxZvwaFuh0oqh2xWN+OhcZ6R5mze6SNGDunlBZnuSC2/d4a+/32uyb35e5C0
         imnY4cFoweyBzt8hHXFo5dcOoly1u6uCkvHQdpCb+ljqz5wN8nIwprXzvM4pbJ0xDdLP
         CMCYhahUh1ntvNIf5MvHZMSVT9E5Ig4bG76AA4PJqWsgRCycZQbIgrRnXhSaZpcKVja2
         y3wTrHz4IqeKeZFfrKlOIkqi9fBTWjp35/VcjK4VvgLIWScZ5lB9qhHZN5whpXOPZO8u
         tiKi8dUbmJVgxBDPz1LEXILQVdsy6K+hOsnSmi9hdPp636co5w4Wr8qDvUJT1+YcNvzo
         Ilew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314420; x=1792919220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcrM7xj1hl7Ek+joMUqGAFthjfHhD83vu5g9xZWY5i0=;
        b=iaDmt4j+bCfemI+SqvkUB4II2qr3fXQoW0dUnfTzZrdPSyfyonvr3Wiz/cohSHaEaB
         Vzn83Jc52xV4GgE4wqlpLoDepx5vEDqn1rhcacpX6rLIwd2UeHhihzImuWqXPwm0Q+vY
         eabF/S8Y1ogdMbfeyKtRKE/A/sJpaLv+TtqtVBVWLPG5ktlxt2fB1ebeBC+PO0h9pZ2t
         0E1x68ll0tGJbf/oWthkljGRqInZL9/3VKEvEJNJaduUnqYf3FA8xt3Q8CO25FrZlaaN
         nMtyQjIl9ER4mDB1fxsuTr8uiKuNz/yQfzz8HddHVV2nV/nASVgjccFlcHvbqJywNf76
         DbwA==
X-Forwarded-Encrypted: i=1; AKwUvBzNRZ2DyENAsmuVxqHpDxjoSS4gYFfBfYGPLjHSc0bsbqIBrn2DnTDFc7PfD9K0zc5UfskqW4oJsaUuxmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKJA3M8x7Orhobd/BbAz4VzlpGiWorXDlF2tn6jon92JWym8Wl
	Oe/VcXD0xy2FcGIf1w+ByagMdOAOiMo7JpdophXvBSo/3M3y1m7Gl/Fy
X-Gm-Gg: AYBFou06xxWrZr9n2eXRS9udbkJ/mJWQNkJZ9Qf16kHm8YrxvcHqAKUs/f4amzAbP+Q
	IIyQvZjv1AafkKKRc29uebiOPOvuxRYx+1KDBBQl1UPDhu2XL6XXBDF92gWmlBBdScMl/jj/zuN
	mQwzKtn5RpA+b8Xjsuwk60WmlIF5DYBcHyRXr9fjqYhGX8RyOV4kaLgPolIl/9s9gr+HplTGi6P
	xtvTeIIbVhKvSrx5ltZhaJipNkW+JTQgjIAcM/Y4k/QKZUvUjAkM5e+yndxyOpF/8Fb/bMerbNC
	McTdyI3uOedIWJT4ZsdflA1H6EVPCcMSUqD3b4l1ATeCMDb4c5N5GxejzbmI38EOu4+BgWq02Zr
	ktYB9d+Zsx1JRGU+0JhDijHMvqi/bg2YpD7K6HjT9bmOuhnW4VM8OirluGv5Am1vk3gn0l2Iaod
	IgFe3RH+23X5A5JUnE8EQs0/3+CgW6MDvcHPSNYSIaXonjg4xIW/5w4tlvOTA/bMlWAtHimgi2e
	dvk3oCatKDdX5eqdGpDKfMb58xUMY6awpnnt3w/OlsiFvkLFWQ34wMj5KAspTg37HU=
X-Received: by 2002:a17:90b:28cc:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3acef56ff87mr6467206a91.5.1792314420387;
        Sun, 18 Oct 2026 02:07:00 -0700 (PDT)
Received: from localhost.localdomain ([113.102.237.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm15580675a91.11.2026.10.18.02.06.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 02:06:59 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
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
Subject: [PATCH net v4 3/3] xfrm: hold the tunnel device reference across the input path
Date: Sun, 18 Oct 2026 17:06:38 +0800
Message-ID: <20261018090638.55686-4-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
References: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
semantics.

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
 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  4 +++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 67 +++++++++++++++++++++++++++++++++++++++++-
 net/xfrm/xfrm_iptfs.c  | 25 ++++++++++------
 6 files changed, 96 insertions(+), 10 deletions(-)

diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index 3b80929994a0..cbe7906a4a1b 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -63,6 +63,9 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,
 
 		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = tunnel;
 
+		/* Kept until xfrm_input() is done with the skb. */
+		dev_hold(tunnel->dev);
+
 		if (update_skb_dev)
 			skb->dev = tunnel->dev;
 
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index ab94b3a4ba9c..73a65b853be0 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -319,6 +319,10 @@ static int vti6_input_proto(struct sk_buff *skb, int nexthdr, __be32 spi,
 			goto discard;
 		}
 
+		/* Keep the tunnel device alive until xfrm_input() is done
+		 * with the skb, including an async crypto resumption.
+		 */
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
index 517369ba9efe..209fd7ffb5c8 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -120,6 +120,60 @@ static int xfrm_rcv_cb(struct sk_buff *skb, unsigned int family, u8 protocol,
 	return ret;
 }
 
+/*
+ * vti/vti6 cache the tunnel in the skb control buffer and keep a
+ * reference on its net_device.  The tunnel is the device's private
+ * area, so the reference keeps both alive.  xfrm_input() releases it
+ * once the packet has been delivered; the drop paths release it when
+ * no receive callback ran.  The caller passes the address family of the
+ * cached tunnel.
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
@@ -468,6 +522,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 	const struct xfrm_state_afinfo *afinfo;
 	struct net *net = dev_net(skb->dev);
 	struct net_device *dev = skb->dev;
+	struct net_device *tdev;
 	int err;
 	__be32 seq;
 	__be32 seq_hi;
@@ -748,7 +803,11 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
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
@@ -756,6 +815,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 		if (xo)
 			xfrm_gro = xo->flags & XFRM_GRO;
 
+		tdev = xfrm_input_take_tunnel_dev(skb, family);
 		err = -EAFNOSUPPORT;
 		afinfo = xfrm_state_afinfo_get_rcu(family);
 		if (likely(afinfo))
@@ -769,6 +829,8 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			gro_cells_receive(&gro_cells, skb);
 		}
 
+		if (tdev)
+			dev_put(tdev);
 		if (async)
 			dev_put(dev);
 		rcu_read_unlock();
@@ -779,9 +841,12 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
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
index 6920940a35b4..657dce0c9fdf 100644
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
 
@@ -1204,14 +1205,15 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
 	skb_abort_seq_read(skbseq);
 
 	if (defer) {
-		consume_skb(defer);
+		xfrm_input_consume(defer, x->props.family);
 	} else if (!first_skb) {
 		/* skb is the original passed in skb, but we didn't get far
 		 * enough to process it as the first_skb, if we had it would
 		 * either be save in ra_newskb, trimmed and sent on as an skb or
 		 * placed in defer to be freed.
 		 */
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 	return true;
 }
@@ -1298,7 +1300,8 @@ static void iptfs_input_ordered(struct xfrm_state *x, struct sk_buff *skb)
 	if (!consumed) {
 		skb = skbseq.root_skb;
 		skb_abort_seq_read(&skbseq);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 }
 
@@ -1700,7 +1703,8 @@ static enum hrtimer_restart iptfs_drop_timer(struct hrtimer *me)
 	spin_unlock(&xtfs->drop_lock);
 
 	if (skb)
-		kfree_skb_reason(skb, SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_FRAG_REASM_TIMEOUT);
 
 	if (count) {
 		list_for_each_entry_safe(skb, next, &list, list) {
@@ -1751,7 +1755,8 @@ static int iptfs_input(struct xfrm_state *x, struct sk_buff *skb)
 
 	list_for_each_entry_safe(skb, next, &freelist, list) {
 		skb_list_del_init(skb);
-		kfree_skb(skb);
+		xfrm_input_drop(skb, x->props.family,
+				SKB_DROP_REASON_NOT_SPECIFIED);
 	}
 done:
 	/* We always have dealt with the input SKB, either we are re-using it,
@@ -2752,11 +2757,13 @@ static void iptfs_destroy_state(struct xfrm_state *x)
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


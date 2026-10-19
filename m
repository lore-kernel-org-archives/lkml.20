Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423997;
	b=oPRKF4vnlN/bLxsdz/9lDAXsHi1zlfdCAwD9fybsSQk/wmbOfS69D43vPNWoRn98Xeox
	 Y6dkAYGsFXRVGxz0eP+sdWnpH92CUPhS2gqmslajk0VcbfHSEeY0XBw+sEKK9IXjSdZVv
	 RMqC1fBU2UWHOe7GyW3bMywylDyWiniQdJlvfecPKiFefMwt6kFd6E+BX61zN40YBuBWo
	 8V2+P6RRvrzJKxrwd/CNhacPKWqn/meIpgRvoPFCwwpu4HjtqlrXgsmw2hmTJjVEoc0tY
	 gU9LiGrViEjffgb9j3kCQURZtnUMvSHXQjs02wEZqihMgFOBwEuGoXBnHJ+OMMXSkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
	b=c44ySJ52vfqy8iqZLOnMB3wQZBPfRp8QEOZs+QCYknJTWv2eMY8yLLTJlPXc8jgyvpm2
	 HRTfWGDFZB7lJkccbOTJHc3y0eJg866dEPTkVGjQV0v33Dv6N42CW8MWZ9pDM0vub6/La
	 W1bUlHSDfxtgPTPQe3TqWeEVdLjNW8pjyuqnrC5VR9rj7SITnbI6ax6xxopT0wL13gw3c
	 8kuGKxWXxD6LZch0b6tN84SNIGbv+9SERLZkGp3QCiDoU6L5mfvgZvSghFrCHz8QH6qeG
	 pNZjn662BpbRIdyREWaD2DfcLqSRrVWVUAy/LoDENAlsq4GuTVrzTYJC7tNLrFccQGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSMu9As1;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF4606C92B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDF4606C92B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSMu9As1
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd06e1a9d16so111221a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423996; x=1793028796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
        b=lSMu9As1xeFOkeAIkBPPe9ko1N+Oks2kA493NiM/HmWqavLHcKeg5wKRPNbA1KBX+K
         3aGz7i6IxVoQFPnsOIpSwjGQarIK9ZJi3f6uSXcqroXJEv6E8nV7kXt4yWeXrgySuBhg
         nMkpZ1W61dPu/Z0lh1mkv1SMslf59VCiv+8uYAH+SP2hPKZrNDCQvD9oci1z7lUL9jK8
         sFM/TUHTvPlfaOLDpBVGnkh6+5oqtdBcR6QQy8ikjrnxovkdEaci4aL7TrO2+9wujBF7
         zHTIbVIydjl35s94JRlDXlPOTv9k9Ik+gsdSuVvG8JA4CWGLXbcNKJbBZMk1CM2jyM1D
         q13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423996; x=1793028796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYeBVoiHSIqb31GJS7/4bkZPdgBAygf1VBuzTNUUPiw=;
        b=K9CfGGM7YgNdIcKsyIwdLr6o7KR0ugHyzg3CfilnPbuCFjbaRPPC0DGtzEN4cEhT8r
         YCgFNYc/Ob6aISBimgu5towmOnpNFIzYSJXEGyna942GnsKdeOYHobX5zejUfJsaWypn
         aFlTHOHt2yG3PR4wt/UXqhV15JUEmqkXYSBQpZ+ITlr6ZuEwFOr4hVM1YeNglphbIBLN
         Brw5Dcweveh1MsRaQ3NXtQOKabv+LIHqZNx8x1WTXAJ/9Qx8SGTpFcDoaO6DSCr2TGAo
         mqFiL4YQQ2afCxJVnBLf8V7Hsez0CRHBoip8vkjJ24d+xYX8CJI827lG014+Av+Y6RFW
         P0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIcpwvEs+CzVXHRafcZiViijEOHu02FLmbCnR0p3Mbo/7hHoxW8HDBX5QDXJ4jxe7pGp6oWKu/n2Ib0Aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdQkVt9J/dk3EOWSnJ5KjaexDKXqfEk/IReyvMI6ciHi3Mettv
	O1Xp24hOJC3/D+ZJQF+QXk8pjy5q9KkN/+VEc6K1RSLd0WKcUPerrt9y9wxiZE3t
X-Gm-Gg: AYBFou3SvwniAVp0lovrokG29kEp/IMR1wOm7jpdCpqQIdc4yVy1i8rgd/7EfElJR8Y
	/DzZPQczP05aOYX+iClNcH6qjEAqvDTKTmukVzzFG33KZ7WKAGs0YuN8xYBFylV7Q1NLv98Iwqq
	HRjVA5Hn+1+8xXUitI7coQ74Lgw7FFKJIxmfiY6n+H2R4xFUi0yE/tCzVVt2AESn55FBb1Q5UNd
	Uk9juPGeg8JBYjfoY0mQuj6vYHxCdV3Ho+QRy0384Pk7dROJEM0qiUqxKfk+QRTOcVxVr8EsrfH
	q0jVa3IWCYF9D/xaMZdAgce12YKbb4f2NQzE3mCcgEStxfH3EDyb/E/d2BTgAqO35eiGzoOxlL3
	twQ3UVuA44RKJP3G0vM/tPZm34HJBQGj/6HSHlXZcfq/Qlkvme9B8kYvF2IJnwsM4Mm4Y3RLj/+
	dAa1elNIU/L4iJzyILaz0epyTKo7NI6IhooTpOjbmxgRRY5f1xZ2bj7c3LwMjpQzYo6tFRNC28/
	xUA1pBIliJwnLtL4iM6KirF0iG6csZ0MXGm9ACSKnKqzEBPkYp9nKSWndsPvQWjyvrWyfsLqKYl
	28Sm+t2rS8JHiLmoyQ4rKTjVwk9WZ3lz8zdlEvTzku7GQB7W
X-Received: by 2002:a05:6300:6bc5:10b0:3e2:3392:540e with SMTP id adf61e73a8af0-3e2339285b6mr5695482637.0.1792423995890;
        Mon, 19 Oct 2026 08:33:15 -0700 (PDT)
Received: from localhost.localdomain ([183.42.136.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm4017801b3a.29.2026.10.19.08.33.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:33:15 -0700 (PDT)
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
Subject: [PATCH net v5 3/3] xfrm: hold the tunnel device reference across the input path
Date: Mon, 19 Oct 2026 23:32:47 +0800
Message-ID: <20261019153247.89957-4-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
References: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
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


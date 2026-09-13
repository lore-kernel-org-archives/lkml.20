Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52651390992
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789271411; cv=none; b=XZ3M2ZSSQCilEDo3oZxT+oh0c0YPiefBy6h9KJzpP8fF594nuqi5spR52wCMsnvpyExBM1bWLZzS1rCOGv5p7a/xCtas0tLzWNEjOnGblyIVFov+0psy3371r5k0dCZDm/F9cY8NzoeFz+4FjYAqEt/vEqqs4sjB9uOJCCQMY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789271411; c=relaxed/simple;
	bh=zft4siIVzjvwyrjp+6cNDJekjhXf5b3vJKbJg5NmvCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwuY7oAfVJRoDx4y6GB46IqnwEPqpxSFjyKUgV5s/bWijYTGn69UlqOQ/IPyeHTQorx2BLqAKOUrLvlId0lnoXKcVr4KQV65kBaWF1gC4Go5WP+rV8qTbtDzbEriJxVxfkK3k6/DE8iprcl0/fX/7tnowqg1H1TWWKzloGBztso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdDOiiOh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdDOiiOh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a20367cf82so18133481fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789271407; x=1789876207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQJgSVahL7et4eCG/b1accUqaKciLG+AzNANVA6kd74=;
        b=XdDOiiOhblRMkj5qOmLBaORodOVW3Hli+BNGEuH0PMQki7C00LYbY2A5PWo+XTSprJ
         HYWnpZUq+sORe8VwMvNuN2vdaX4hZU6WkH7Gjd6sSHYJEgDGQLsQF/wyxYP+odFAHEeN
         NLRx8XRsY7X8e8faGZA1I2rYXvGZWBOXk0S9Fiejs92ftyW8Okoi85QRrypXIfsa3Hnm
         DVRyu/QSiEn0cl1MMiCvkJ/hCUjzSIh/xUVXeU/Pw2M9TFkAdlgN5LMbtVL6M0zKPTPi
         3sD8bZ7BikNKgsDdx95EAtpiDjEX81beMr2wSQi6q48keOokPRipWlF5dQX1utF5/9qW
         SrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789271407; x=1789876207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQJgSVahL7et4eCG/b1accUqaKciLG+AzNANVA6kd74=;
        b=Xn5JcG9J+rcXlVPlkOyoEQI22uCbsV3l8Pw2/QvMhdNDb/YxI/zrYtOe/bjaEfo+by
         JfUo7ojsDWqK2Skw/wpcI78RuHfB8YjXlZ7NFpbjvzsSaZCjVoPnWzQcIRj9OYZmuHYW
         dbEVvZA7LYpGb5g9SfCPz5Vy4gv1sK+vJcjJZ0g0r2yr+dNuOlUJkbYyG7yGXl74rrh/
         WapSMmvWxMpzUGfU5OkUoh/YWEWCGWhorskkapckL09yUVt4SHtxp5vG0lz/njLdCjXO
         Ex81507B/Zai3wMc+Khr4npB/ndDGrwCog4XcXiukGFfK1hKJkHeGinHGl3LvVZ/DZe9
         CGfQ==
X-Forwarded-Encrypted: i=1; AKwUvByi/SwwEOlqyAAvrv8Dqj4wSTiIogIv8OoPu59B9myzmuZ8RSJUFxg7oFVfiqNrx1oV+RhpE12KTOfw/HA=@vger.kernel.org
X-Gm-Message-State: AFuF++kcw/HTh61grfh8YDZPx3a8tO+0k9MHwUmlhUWdmac1esMnOybo
	FkvIBr4pzqTFta/XeG/c2boRPco4FT/2RXiQhFGu0C1plet+CFxw/Nhw
X-Gm-Gg: AYBFou1P2u6v10D1hLQvnk307cNavL4ZQ2T4CBl0bKentBCvW6cT9WC5Qb9wyaVdWMf
	zkkCL8WPBIuOThpaX7gEkKMCyQKYHd5ahDJXhwdltk9qQFxPpu4RhkfCAH1C+BqAdGi8FujxVr1
	itHE/HOxk8RIds2LcUNMiNpeNfP+DBF813MDx73EzA3ettaJ8zRN7Uwo5vY7DKIaDHh8mqRCyBy
	6jX2Cuo/dmnWNXIR3TlfRzXwTG0aycH8aXzzflb59TYNYsmNnj1MaJSP7GD99ul7HasDoPKzeFi
	kRollb8e1V2M4A0zmudzL3LYISvHK6PbY8Y7f8R7nRZ+UDJszOBxFZ/DslJ9hFzXBGiD0k8xCEo
	VSaWeNo3uIWgO1MszozOZcLn5FVpCK1pBfL2m0b0yfMwqOsg+TjZr7chNF6Ya6bzIDOWybxbOOB
	g+3n4ptySsF4F7Ff26X4wd683wSen0qW/2o17bSrtWEB7NFv1UN1IRtnFl6cxrUG5nawCRM4VtT
	FFqgYBgScRyv6OtTUkEkCjH3Ce081lC/Kp3Es8pE41F
X-Received: by 2002:a05:651c:a169:b0:3a2:522:c75 with SMTP id 38308e7fff4ca-3a5a4ecaa35mr14204161fa.4.1789271407042;
        Sat, 12 Sep 2026 20:50:07 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a332737dsm17277051fa.22.2026.09.12.20.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:50:06 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 6/8] ip_tunnel: add drop reasons to the transmit path
Date: Sun, 13 Sep 2026 06:49:35 +0300
Message-ID: <20260913034937.875068-7-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913034937.875068-1-littlesmilingcloud@gmail.com>
References: <20260913034937.875068-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip_tunnel_xmit() and ip_md_tunnel_xmit() encapsulate packets that the
tunnel forwards, and every failure on that path ends in the same plain
kfree_skb().  The device counters separate them a little, but they are
too coarse to act on: tx_errors alone covers an encapsulation failure, a
routing failure, a lookup loop and a packet that is simply too big.

The last one deserves attention.  tnl_update_pmtu() returns -E2BIG for a
packet larger than the path MTU that has the DF bit set, after it has
already sent an ICMP fragmentation needed back to the sender.  That is
path MTU discovery working as intended, yet it lands in tx_errors next
to genuine failures, so a MTU black hole cannot be told from a broken
route by looking at the counters.

No new reason is needed for most of it:

 - SKB_DROP_REASON_PKT_TOO_BIG for the case above,
 - SKB_DROP_REASON_IP_OUTNOROUTES when no route is found,
 - SKB_DROP_REASON_RECURSION_LIMIT when the route points back at the
   tunnel device itself, which is the "dead loop on virtual device" that
   reason describes,
 - SKB_DROP_REASON_NOMEM when the headroom cannot be expanded,
 - SKB_DROP_REASON_NEIGH_CREATEFAIL when the NBMA neighbour lookup
   fails, SKB_DROP_REASON_NO_TX_TARGET when no destination can be
   derived at all, and SKB_DROP_REASON_UNHANDLED_PROTO for a payload
   that is neither IPv4 nor IPv6,
 - SKB_DROP_REASON_TUNNEL_TXINFO, which already documents a packet
   reaching an external mode device without metadata, for the
   collect_md path.

Only the encapsulation failure has no fitting reason, so add
SKB_DROP_REASON_TNL_ENCAP for it.

Drop reasons on transmit are not new: vxlan already reports several of
them from its xmit path, and ip_tunnel_core.c reports
SKB_DROP_REASON_RECURSION_LIMIT.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  7 ++++++
 net/ipv4/ip_tunnel.c          | 41 ++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index fa8bd552122f..30378a0d2272 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -134,6 +134,7 @@
 	FN(GRE_INVALID_HDR)		\
 	FN(GRE_CSUM)			\
 	FN(GRE_TUNNEL_NOT_FOUND)	\
+	FN(TNL_ENCAP)			\
 	FNe(MAX)
 
 /**
@@ -643,6 +644,12 @@ enum skb_drop_reason {
 	 * endpoints and the key the packet carries.
 	 */
 	SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND,
+	/**
+	 * @SKB_DROP_REASON_TNL_ENCAP: failed to build the
+	 * encapsulation header of a tunnel, e.g. an unknown or
+	 * unregistered encapsulation type.
+	 */
+	SKB_DROP_REASON_TNL_ENCAP,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 0260a97e990e..e7757c0a09be 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -580,6 +580,7 @@ static int tnl_update_pmtu(struct net_device *dev, struct sk_buff *skb,
 void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		       u8 proto, int tunnel_hlen)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	u32 headroom = sizeof(struct iphdr);
 	struct ip_tunnel_info *tun_info;
@@ -593,8 +594,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto tx_error;
+	}
 	key = &tun_info->key;
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
@@ -613,8 +616,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0) {
+		reason = SKB_DROP_REASON_TNL_ENCAP;
 		goto tx_error;
+	}
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
 	if (use_cache)
@@ -623,6 +628,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -632,6 +638,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -640,6 +647,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -657,6 +665,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -671,13 +680,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 tx_dropped:
 	DEV_STATS_INC(dev, tx_dropped);
 kfree:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_md_tunnel_xmit);
 
 void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		    const struct iphdr *tnl_params, u8 protocol)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	struct ip_tunnel_info *tun_info = NULL;
 	const struct iphdr *inner_iph;
@@ -705,9 +715,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
+		/* Only the branches below can derive a destination.  If
+		 * none of them matches, the payload protocol is not one
+		 * this tunnel can carry.
+		 */
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		tun_info = skb_tunnel_info(skb);
 		if (tun_info && (tun_info->mode & IP_TUNNEL_INFO_TX) &&
 		    ip_tunnel_info_af(tun_info) == AF_INET &&
@@ -728,8 +744,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -746,8 +764,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 				dst = addr6->s6_addr32[3];
 			}
 			neigh_release(neigh);
-			if (do_tx_error_icmp)
+			if (do_tx_error_icmp) {
+				reason = SKB_DROP_REASON_NO_TX_TARGET;
 				goto tx_error_icmp;
+			}
 		}
 #endif
 		else
@@ -774,8 +794,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0) {
+		reason = SKB_DROP_REASON_TNL_ENCAP;
 		goto tx_error;
+	}
 
 	if (connected && md) {
 		use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -792,6 +814,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -805,6 +828,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -814,6 +838,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -848,7 +873,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -864,7 +889,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3


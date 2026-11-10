Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342037;
	b=v1Hr2zsEzRVBXH1z58Z+2DN5fiKXE/dSadchL8XAmwwrqslycNG9xyN1bSxoe8tppO2U
	 0Lpmjxw65vMCbJES9GoPoowCHKN3NvkYzmyvY2PQItvt1791zcemVqn4iOEgt0Qs0SpeD
	 Hz2KBzDA5e5vFyTkqKGk6vdYI0R4ualQCwWyPo68jp3jxDFijgofmUKlLcRYoX2OlzOFR
	 QK/Z8hrFX9+JaooY9wFydv8gBgD+GWqOPyUUy3GydzqcaodkUAuLmp/pTJay0afpqFPTi
	 mIopam27AGkr8GBbiUA1L1nm0cn5HRlkHDXE+vG09oRatE0cXySI623mqu2hB5xSe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JNaHxAPlnIWxE7zaoc/iWSyWFuol7OYYj+MrFFaSfyY=;
	b=G0H8sHQkdnox+n2aa9bC4CV3IxG/eJ1qxmAImFHb81+yNrGRor4h0jE+FG9e29jywEGh
	 uUjmA/vO8reBY0Uc6Y720Bpd9wfJwXyop64Pz4SakzZkMRliDS4WpVSaPaK17rEQ8i71/
	 /MdtF0CcaN0VaXWno+ML0ypEAoP5xF0CBSKRPtA5WNTDyruwFkvfiTVDQhZqD7iAPB9uc
	 V9Moil2NEJXZ5WNkansq3ChpcD1pYy8INndpwRf8k/9Jdlh0XBGwN1rQGj/6UR/vSuMgT
	 siFD8cAufYxX28qAR7Swb80cpd3l2Mo9qMXCp3YzVal0+j4/urh8aN3FXkxjPHczaug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/DwPts0";
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1D60A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A1D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/DwPts0
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ace304021eso21818801fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342035; x=1794946835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNaHxAPlnIWxE7zaoc/iWSyWFuol7OYYj+MrFFaSfyY=;
        b=S/DwPts0ziWHvgQZdMPeL7g1NlkKp8Sil3EG8sgAfck3avy2O12lEmM8t5DhoIIU2I
         h9FoHkAMuqS7M+Un/YWtot1v3rO23WfO0DvRz+kgXhFltTiN71G+dQRh8qMxVsjZdjFl
         IkUwA2D322uR2noo57atPHbNAN+XZxV/G2LbR0uHdxngS6I1C9C3Xqy/67OvUFwkwmEL
         S7gJazsHFsZQeAUc56mJNPTaybRw5vk5sIV6ftlTXsEwqWqs3YJ8s+92M62YlYUNiaCc
         S1Jz2NxVv1b5rAKE9v8lIhF4KopGKnV1is/yigmR02Bf3onrk3X1dQ8HyNMM+CCDHNrw
         WUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342035; x=1794946835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNaHxAPlnIWxE7zaoc/iWSyWFuol7OYYj+MrFFaSfyY=;
        b=lm64q79ARQFbPdEoiXm46L2iswdtgVUb3TjDPo0c2WLPEphJso0IWk4KG669wmgl5W
         JJ5Tjps9TAF1+y+xZm6mfCtXvw5iLYZW7w88bCfq97pNDYpACcNRTwNsugfrxX5e3dXW
         cf4jMqlTx1KKdg8S/BElZEz1bL8XVENTsSZQ+0PTeWVLjykxPL+XuL60zxL0VfUfIjDp
         ahmUp/prp1LRWdipKEfpt7pO+u1nAzxL3PG5Xx4DJtwSwmZ+DQ1EmJWUnkF8yclngV+J
         /Y6JOmucqpXJx6t+25qr6tJYg9uf8kRIPk/gO+0CfIEw0d7UrVyBIFJiQNRuk3uzGuiR
         GSbQ==
X-Forwarded-Encrypted: i=1; AL+hErG2dRd/q1FOsskGfMNPUSojl8XP7xudlkh2D5JxbjFkYVVjezb+zuSJPF8eHEubniIpevu+a3s+//JNQHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ModqhlkZEQvsbMcYSOAGCADmqBwzN3d77o3+GJnC+LN3A22sq
	DOwrD1beXBE/2ALBOHJ3yIv+Ruk51NXvywAIpa/LiEb28Hnmhq8wSw91BqUe8a4KCB0QtA==
X-Gm-Gg: AYBFou1YuArVoJPMMgRGHiopsIh6ztzCB5bRB9d7kCyDbjuQEWtEaV+yBk8RA4kLg9y
	1f2BwTLtS5Dx5423T84hFvkBaxnwAkY1cNQPFNUxA7CIPyIFJBbOwdHxY16tiC9S6SOfZ/mP41V
	pnkT3dD/50P/3yzsKFdab0qumPh+GrTiM0PGvcOCD2pydNmFJ0H57V24jYKy+8uW2HOmM8ZC63u
	s5ufN1oyMj/6kiN2ovDGn+EW8XOrAjfZt5ftd13e1wDOTZ10A6hPtNRaZqsncaUZwCz+lMPfTW2
	kopaR4LQ8W8LkaxGmNnw1S6DSBAF1fPEfTZ5mhXdu+somfAMOQ7gxKpVs9ydYoeQ7CnGMbEdzft
	ar8RXqZ7/XVMSBvTSGtpiFFW2IQ3pLcGu9MQ/OVRlpZoZpj5nEpQpDYwERVy4O+0Png4onxjCDg
	94n8+0XKeP9EK8wA61C4IruCkIq307LdwYp3LoV76RY4OFtxrA5pB/O0KbA1jQYIxR8asAXUB1L
	h9IsMX9aJON9M+qtX03sWnv3bfHwCJu/plrNk5MU2tIJFwgXRhA+UnIfXBucOFWI2dr/sIxs+Ti
	M5tMrNVtO4dbzhueil7ZcdaotI9f76lLqgOqphsd711jxquO0qJfVqmLtnmX8jqWJWoQ/0OwytQ
	4sQ3Zx9LI1Cj/X85c
X-Received: by 2002:a2e:be9f:0:b0:3ab:2a19:8624 with SMTP id 38308e7fff4ca-3ae09632327mr7669191fa.5.1794342035172;
        Tue, 10 Nov 2026 12:20:35 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.137.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm5945401fa.0.2026.11.10.12.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:20:34 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 7/8] ip_tunnel: add drop reasons to the transmit path
Date: Tue, 10 Nov 2026 23:20:20 +0300
Message-ID: <20261110202021.821224-8-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
References: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() encapsulate the packets sent
through the tunnel, and every failure these two functions detect ends in
a plain kfree_skb(). The device counters separate them a little, but
they are too coarse to act on: tx_errors counts an encapsulation
failure, a routing failure, a routing loop and a packet that is simply
too big alike.

The packet that is too big deserves attention. tnl_update_pmtu()
returns -E2BIG for a non-GSO packet larger than the MTU if it is IPv4
with the DF bit set, or IPv6 and the MTU is at least IPV6_MIN_MTU, after
it has already sent the ICMP error back to the sender. That is path MTU
discovery working as intended, yet among the device counters the drop
only bumps tx_errors, like a failed encapsulation and a few other
failures do. If the ICMP error never reaches the sender, the resulting
MTU black hole cannot be told from those by the device counters. A
failed route lookup and a routing loop do have counters of their own,
tx_carrier_errors and collisions, but in both functions all of these
packets end up in the same kfree_skb() call.

No new reason is needed:

 - SKB_DROP_REASON_PKT_TOO_BIG for the case above,
 - SKB_DROP_REASON_IP_OUTNOROUTES when the route lookup fails,
 - SKB_DROP_REASON_RECURSION_LIMIT when the route points back at the
   tunnel device itself, the case its description gives as an example,
 - SKB_DROP_REASON_NOMEM when the headroom cannot be expanded,
 - SKB_DROP_REASON_NEIGH_CREATEFAIL when the NBMA neighbour lookup
   fails, and SKB_DROP_REASON_NO_TX_TARGET when no destination can be
   derived at all, which includes a payload that is neither IPv4 nor
   IPv6,
 - SKB_DROP_REASON_TUNNEL_TXINFO, which already documents a packet
   reaching an external mode device without metadata, for the
   collect_md path,
 - the reason ip_tunnel_encap() returns since the previous patch, when
   the encapsulation header cannot be built.

Drop reasons on transmit are not new: vxlan already reports several of
them from its xmit path, and ip_tunnel_core.c reports
SKB_DROP_REASON_RECURSION_LIMIT. They are most useful for forwarded
packets, which is what a tunnel gateway mostly transmits: the sender is
another host, which gets an ICMP error for only some of these failures,
so the drop has to be explained on the gateway.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_tunnel.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index f3c5d8424925..924d02d0cc7b 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -586,6 +586,7 @@ static int tnl_update_pmtu(struct net_device *dev, struct sk_buff *skb,
 void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		       u8 proto, int tunnel_hlen)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	u32 headroom = sizeof(struct iphdr);
 	struct ip_tunnel_info *tun_info;
@@ -599,8 +600,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
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
@@ -619,7 +622,8 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
+	reason = ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4);
+	if (reason)
 		goto tx_error;
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -629,6 +633,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -638,6 +643,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -646,6 +652,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -663,6 +670,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -677,13 +685,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -711,6 +720,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
@@ -724,9 +734,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		} else if (payload_protocol == htons(ETH_P_IP)) {
 			rt = skb_rtable(skb);
 			dst = rt_nexthop(rt, inner_iph->daddr);
-		}
 #if IS_ENABLED(CONFIG_IPV6)
-		else if (payload_protocol == htons(ETH_P_IPV6)) {
+		} else if (payload_protocol == htons(ETH_P_IPV6)) {
 			const struct in6_addr *addr6;
 			struct neighbour *neigh;
 			bool do_tx_error_icmp;
@@ -734,8 +743,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -752,12 +763,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 				dst = addr6->s6_addr32[3];
 			}
 			neigh_release(neigh);
-			if (do_tx_error_icmp)
+			if (do_tx_error_icmp) {
+				reason = SKB_DROP_REASON_NO_TX_TARGET;
 				goto tx_error_icmp;
-		}
+			}
 #endif
-		else
+		} else {
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
+		}
 
 		if (!md)
 			connected = false;
@@ -780,7 +794,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
+	reason = ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4);
+	if (reason)
 		goto tx_error;
 
 	if (connected && md) {
@@ -798,6 +813,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -811,6 +827,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -820,6 +837,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -854,7 +872,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -870,7 +888,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3


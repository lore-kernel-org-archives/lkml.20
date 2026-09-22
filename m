Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9DB491587
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115343; cv=none; b=ly4NGj33uHWJzIIiwd9MMdfnQoAPAtWAMmvl0W4i+Qhv0++412/GXGNKlatGBfJmBKRql8LM7Mjo5doNbcHo6cT3dJzRMh3B1sesElt784g5JGZFpRRptK2wzEVBFNBZWCoSxEWh6EhUYX5aHUWokFAiTj98cafUg3DMh9EOvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115343; c=relaxed/simple;
	bh=+ZYr9hJlpv3Thm/GkJbA604cP63Bciii/9KwgO3P1ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lObFiQZsmONdm5Y8lVoc1JD/mNcXcZPduN8rHyQIoF4yjNxPORnXHzn4na/b4hequbc238XabbThBHSmWMQdaat/psmNr2ev1fVBY83ry8P+8di034+HMxIgi9rQqyH2OFNsXm7+hZ/5AGtGanOOvtAxTpbls9sVIFJmlsy4meY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE4QHk2f; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE4QHk2f"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so225156e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790115333; x=1790720133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTTJsYrMOcak4ZY4X29CZhZYIBW9UPLBMkRtT7ScOWU=;
        b=XE4QHk2fUCk6+hLCFc4dlwi7Dz/BDwPd4kNIRLsxQ38NSHO9JjpYtq8wT+8q77O+m9
         KAhW5f7RKjSKIoTbdGQcq0uuPJkP/2B8pTexEXYmYRIV5td9YZ8sv0QCO0+TLbwqsnXY
         R1LJmiCJ49Z5FDir8NyjZCrVRturEOL6y7wCKx7bXQpwuCbncOrlDS52bLAT6wcHHSAL
         ybTQ3nyBQDyEgdYOixKIfzeAKm/o1A5xGucZDadmosdHYQQnriPgWDXaczn8JbDPi7I5
         8o2utXhYXADw55YCko2TZoaYWpFmwBy4pxjZ6ICjPNLTLCR2tuo54KJ4zejRgxzqouux
         +x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115333; x=1790720133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTTJsYrMOcak4ZY4X29CZhZYIBW9UPLBMkRtT7ScOWU=;
        b=XxxgJFFz7djRDt6oenOWLS7OL0ZXngYLTfpAqFMLZom6+OJUxoHIdHnkAxB4ZxMJ28
         3VEZCieAgXYh3lMoRhrfM1vE56AuMZYlCfEfb5AqCUcYHjY2ot+pj8pIfYhWTMSNNS2p
         9OSgn00eKmZ6KzpjZPa1HXfS8i8sL0GEuCwHR0DiktYDb1ZJvnAgabXY3JylNEkn90NK
         8bVqWVC3qX9vWoO9HaZvZQMHFHcOdRXgr/N5VuYjAdouuLKelz2/SfmxZhtX1YQlx+pz
         yadMp/0VizTYbzPCoICB4nmCTLxCGXFjiJTorRCNFv9XgPXUNTM/VmHNRnafKLJCTHp+
         aEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKM1d1k63peL4ljItPtcfYJB/ba5icikLilCntehPJ5/YEt2D3X2a3AquZgwzGTsAut57GeC6Zouc+PSM=@vger.kernel.org
X-Gm-Message-State: AFuF++narCNE7mKjrtuldVJsC+65++Xn9p6oNzoETSi6BF9pmLoLqptB
	2Nnvxc1EJBVcF7aF2R4Q/LW1Zcj7vsohUA1cGFmkyUlCuZQ15bB3Qgms
X-Gm-Gg: AYBFou3UFFUQGX+aeGy4rvm4NUqTK3p08mkXmNWkqYSZzkK0iSTd7jr4x9bSe3q+Jfn
	redDRGVlc6pX+q2jp5coFKL7UOVye8CSLA6EOn+te89Eaa46HxOoW4sLtbTh+Oq4924rwfz60HA
	oG4rx2on2Tbs/ziD3LFbdIGiRUGmi11Wy88LPsVWWTRgRSh+y01gIEHTOn9gglQCHNBpb4nOZQ7
	Yjxmby6al8w0dinfgYPTSX6S0HrbYjQLPHgH+YRt9HJhSN4dw3YiFzZYIwvm3cZRSNStdsx/eDe
	d2Z2FljKuXEmn+qAg+LNrcLF+i6Joa6b46k5VtUh+8oFCNV68tgxz3NnI4bK1uZaGQfu3855RcR
	7Ssp4+svXpkZzopQr1MohvSK8lIy6F44lUAKxtrRmmrQRalEXTUP1PsFKQrNyULsJJTdVs1N4q8
	AywyPG13lV8XlEtEi/h+Qc3CUHRqRv3cij6NBsQZP0dt0hXpvGn6Lo4iU8reds3oBMBJWEUDPk8
	gg/Jwfdcn9xauQogVUrLieDfkdvRbJWJo3fo+JKNYSQwUR2pRgeyGfgh1YCXw==
X-Received: by 2002:a05:6512:3ca5:b0:5b6:1a7c:aa1d with SMTP id 2adb3069b0e04-5b8d89a8001mr188921e87.53.1790115332677;
        Tue, 22 Sep 2026 15:15:32 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm164920e87.17.2026.09.22.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:30 -0700 (PDT)
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
Subject: [PATCH net-next v4 07/10] ip_tunnel: add drop reasons to the transmit path
Date: Wed, 23 Sep 2026 01:15:04 +0300
Message-ID: <20260922221507.3268127-8-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

No new reason is needed for most of it:

 - SKB_DROP_REASON_PKT_TOO_BIG for the case above,
 - SKB_DROP_REASON_IP_OUTNOROUTES when the route lookup fails,
 - SKB_DROP_REASON_RECURSION_LIMIT when the route points back at the
   tunnel device itself, which is the "dead loop on virtual device" that
   reason describes,
 - SKB_DROP_REASON_NOMEM when the headroom cannot be expanded,
 - SKB_DROP_REASON_NEIGH_CREATEFAIL when the NBMA neighbour lookup
   fails, SKB_DROP_REASON_NO_TX_TARGET when no destination can be
   derived at all, and, on the same NBMA path,
   SKB_DROP_REASON_UNHANDLED_PROTO for a payload that is neither IPv4
   nor IPv6,
 - SKB_DROP_REASON_TUNNEL_TXINFO, which already documents a packet
   reaching an external mode device without metadata, for the
   collect_md path.

Only the encapsulation failure has no fitting reason, so add
SKB_DROP_REASON_TNL_ENCAP for it.

Drop reasons on transmit are not new: vxlan already reports several of
them from its xmit path, and ip_tunnel_core.c reports
SKB_DROP_REASON_RECURSION_LIMIT. They are most useful for forwarded
packets, which is what a tunnel gateway mostly transmits: the sender is
another host, which gets an ICMP error for only some of these failures,
so the drop has to be explained on the gateway.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  7 ++++++
 net/ipv4/ip_tunnel.c          | 41 ++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 186d9e70e9cb..a72b84b07daa 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -134,6 +134,7 @@
 	FN(GRE_INVALID_HDR)		\
 	FN(GRE_CSUM)			\
 	FN(GRE_TUNNEL_NOT_FOUND)	\
+	FN(TNL_ENCAP)			\
 	FNe(MAX)
 
 /**
@@ -644,6 +645,12 @@ enum skb_drop_reason {
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
index c94f4c055027..66cb0b86fa79 100644
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
@@ -619,8 +622,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0) {
+		reason = SKB_DROP_REASON_TNL_ENCAP;
 		goto tx_error;
+	}
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
 	if (use_cache)
@@ -629,6 +634,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -638,6 +644,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -646,6 +653,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -663,6 +671,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -677,13 +686,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -711,9 +721,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
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
@@ -734,8 +750,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -752,8 +770,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -780,8 +800,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0) {
+		reason = SKB_DROP_REASON_TNL_ENCAP;
 		goto tx_error;
+	}
 
 	if (connected && md) {
 		use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -798,6 +820,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -811,6 +834,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -820,6 +844,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -854,7 +879,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -870,7 +895,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3


Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB252FE3A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793583; cv=none; b=AKe1wOJtTFk9FMQEKAASl24MzDdMg9IFxfgv6OaJhUT+Wk7GtSfr3R6H5f6bfStBMgk0LXKkwCUa6xhmyQsnNwFdpEQV7nsZv4FgLRWt1fp9+wRhb3XSqxr4U81geS/At8Ia4g9btRSKeRs6WdD5zugWm2hB6Fkd2AJL1Uexi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793583; c=relaxed/simple;
	bh=twfvoMC3+N+PnSeKMbfxHp23xM5ankWQ75YYJKSgQO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HekYdOmXGhEhIeZnhJ/UvOlZoUxWBMb43brmYZgw/qKETrpWiQFfk1Moj0RTUFtwjD6ctCvslmuvTRRcGzkNBYm/QEqE6vtM1su0WbxPp5UO6D69lvuztXc11atXdz8YaCAhgvNGxggQsxSvZP5ZLRneKkPyYFlHi5A+qfPOSlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEcJM54/; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEcJM54/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e428so1729353e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793579; x=1791398379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz4gpHoXaPf9Hiy+IUuDzCmyyNdVUHBAR1t9GRZuVBo=;
        b=qEcJM54/mrTrbnnoi7Q1W4aY5VewUkwsmSfJRdV1jILLZSZgPTyEhYvcJ3wRdsZYeJ
         Ul+5h3x4k5CUCdajAsSElDRWEDewTEoz7khpOhqqH+TwKJtKUKXbrnorsP78bBMb00Kz
         UObFVXBnCK5XvNwFqnmF4rF4ZIZ0fHxdKJaxFkX71Ucm+jTkakYEG6IpZh1CejmRH1G2
         3AF/IAT5zMIbeBbA9AMkXfmuwvLixY2G0H9x33Gs/+KXBADQ4vWbLm05U+GnhNZh5rKy
         S3IaOP/PhOk8Tz+szrLjh2qNT3pUTc/XWOa4XMvYVxGkEr4JiiwRohT/qpMiW4iFaQYq
         WW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793579; x=1791398379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz4gpHoXaPf9Hiy+IUuDzCmyyNdVUHBAR1t9GRZuVBo=;
        b=ektPBd2Tx8ax9VyKPRPNt5OZN8+8kONyny1ZM3fMUwOEMS/4U9fm4ATMqGt5+cKkv5
         EYRNyq/1X4zjyRbxXKicfVF3HdMwTjiTqz8Exe1S1qWPsQmKTMF/VcMbdg+QxzLnwTLM
         OxGc7Ts7mnVwIMv0Gc5dR3o9ayNNfcjfEjeOJ3MOs3c1DM+cCHUOrKkn3uGO9nM+tnWM
         6vVAt5/hoVPggfb0fsHSiiJHws2RcWXxp+jcr9MfnmQxPCNqfze2IAl2tezi6FSqHsz4
         eoR577uKfbRT/WPbR72BZ7eXt4LcLYDJP/oCRY1DmiBGPNw+wAxj2ELDx+y+oKC3ROT8
         1jtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjVkbmzzoQRhqjDO5lM7JTrXwyA2+H5HfiFHAzoZWVm+DYLzYm7GM0fAA5QP63+J1zFOUsL+KwswSixjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD1Ncw09EmJW7w7pj9l8zk1C6vNIHJHkIQzGhx2Mbkfz8Q8adj
	dBLXikbjHj2GeC4hjn0AWiP4QIc4Rg0vOhX4A87j6XkerJmVvtRvNbBj
X-Gm-Gg: AYBFou0m+G+OFW/TV+y/fULxhOyZDg9e0H8Xag7GZH9uEY5GbTxLUse6GRoW5Rk7Y17
	WqokHY5DA0CHb+Pt24RqbP4V8DcYMgNasCHYBRavOWB8t8940d5itn0a2zUbC0RWfoX34jROfde
	hby1m8jz6UG4xi7dYWWLDCOrLYyemBW0sFzjIuXFRTjZWa9TzrEZ3gMmz6Rcdp3ifVrhyOptAJ/
	hh6enIbOJmC8SCa7gqAM5Wz6hMDHp/4ZtD40XJiodvDbf1/oXT5d2j6dw8TMtLKnJIzTYIayCB1
	TMj81PvAbfcUl5iZGYQKdZ7eMjDWgIcAISz8kcJbpQV7IMTWfL+F897IAypAbhSKm6FVkExBCW0
	gv5ircaD9XOZ3FLAdA4eAnsjhZN7/sXEHAclZ43DneP8/J3GGzewYPL7agRhonP1/9jNJ5PrArq
	azeYaTO97IsQ5L3e4uB0RIdDtyWuHd5AhFrQfWZqNfzRbMH0bPmJy24xndEzdbasaK0D9wFRp4G
	Z0wQGoFBLedvNngznOI7Lz0+hobSg9d2MUTdIQp79zq
X-Received: by 2002:ac2:5930:0:b0:5b8:f370:25de with SMTP id 2adb3069b0e04-5ba433af885mr117832e87.8.1790793579460;
        Wed, 30 Sep 2026 11:39:39 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.169.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm156593e87.62.2026.09.30.11.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:38 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 10/14] ip_gre: add drop reasons to the transmit path
Date: Wed, 30 Sep 2026 21:39:06 +0300
Message-ID: <20260930183910.3151873-11-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
References: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each transmit function of ip_gre ends all of its failures in one
kfree_skb() and a tx_dropped increment, so a drop can be traced to the
function and to nothing more precise than "the tunnel did not send it".

No new reason is needed. The length helpers already compute one, so
pskb_inet_may_pull_reason() and pskb_may_pull_reason() are used instead
of their boolean wrappers, and the rest reuses:

 - SKB_DROP_REASON_NOMEM for the headroom expansions, the offload
   handling and the trims,
 - SKB_DROP_REASON_TUNNEL_TXINFO for the collect_md paths, when the
   metadata is missing or incomplete,
 - SKB_DROP_REASON_UNHANDLED_PROTO for an ERSPAN version that is not
   implemented,
 - SKB_DROP_REASON_SKB_CSUM when the checksum starts before the data
   the tunnel is about to send.

Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_gre.c | 104 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 27 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index afd8ece02d7f..58234e857d6c 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -509,6 +509,7 @@ static int gre_handle_offloads(struct sk_buff *skb, bool csum)
 static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 			__be16 proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -517,19 +518,25 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 
 	key = &tun_info->key;
 	tunnel_hlen = gre_calc_hlen(key->tun_flags);
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	/* Push Tunnel header. */
 	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT,
-					      tunnel->parms.o_flags)))
+					      tunnel->parms.o_flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	__set_bit(IP_TUNNEL_CSUM_BIT, flags);
 	__set_bit(IP_TUNNEL_KEY_BIT, flags);
@@ -546,12 +553,13 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
 static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -565,29 +573,41 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 
 	key = &tun_info->key;
-	if (!test_bit(IP_TUNNEL_ERSPAN_OPT_BIT, tun_info->key.tun_flags))
+	if (!test_bit(IP_TUNNEL_ERSPAN_OPT_BIT, tun_info->key.tun_flags)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
-	if (tun_info->options_len < sizeof(*md))
+	}
+	if (tun_info->options_len < sizeof(*md)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto err_free_skb;
+	}
 	md = ip_tunnel_info_opts(tun_info);
 
 	/* ERSPAN has fixed 8 byte GRE header */
 	version = md->version;
 	tunnel_hlen = 8 + erspan_hdr_len(version);
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
-	if (gre_handle_offloads(skb, false))
+	if (gre_handle_offloads(skb, false)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto err_free_skb;
+	}
 
 	if (skb->len > dev->mtu + dev->hard_header_len) {
-		if (pskb_trim(skb, dev->mtu + dev->hard_header_len))
+		if (pskb_trim(skb, dev->mtu + dev->hard_header_len)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto err_free_skb;
+		}
 		truncate = true;
 	}
 
@@ -619,6 +639,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto err_free_skb;
 	}
 
@@ -631,7 +652,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
@@ -665,8 +686,10 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 	const struct iphdr *tnl_params;
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -677,10 +700,13 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 	if (dev->header_ops) {
 		int pull_len = tunnel->hlen + sizeof(struct iphdr);
 
-		if (skb_cow_head(skb, 0))
+		if (skb_cow_head(skb, 0)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 
-		if (!pskb_may_pull(skb, pull_len))
+		reason = pskb_may_pull_reason(skb, pull_len);
+		if (reason)
 			goto free_skb;
 
 		tnl_params = (const struct iphdr *)skb->data;
@@ -690,25 +716,32 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 		skb_reset_mac_header(skb);
 
 		if (skb->ip_summed == CHECKSUM_PARTIAL &&
-		    skb_checksum_start(skb) < skb->data)
+		    skb_checksum_start(skb) < skb->data) {
+			reason = SKB_DROP_REASON_SKB_CSUM;
 			goto free_skb;
+		}
 	} else {
-		if (skb_cow_head(skb, dev->needed_headroom))
+		if (skb_cow_head(skb, dev->needed_headroom)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 
 		tnl_params = &tunnel->parms.iph;
 	}
 
 	ip_tunnel_flags_copy(flags, tunnel->parms.o_flags);
 
-	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags)))
+	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	__gre_xmit(skb, dev, tnl_params, skb->protocol, flags);
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	reason = reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -718,10 +751,12 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
+	enum skb_drop_reason reason;
 	bool truncate = false;
 	__be16 proto;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -729,15 +764,21 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 		return NETDEV_TX_OK;
 	}
 
-	if (gre_handle_offloads(skb, false))
+	if (gre_handle_offloads(skb, false)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	if (skb->len > dev->mtu + dev->hard_header_len) {
-		if (pskb_trim(skb, dev->mtu + dev->hard_header_len))
+		if (pskb_trim(skb, dev->mtu + dev->hard_header_len)) {
+			reason = SKB_DROP_REASON_NOMEM;
 			goto free_skb;
+		}
 		truncate = true;
 	}
 
@@ -758,6 +799,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto free_skb;
 	}
 
@@ -766,7 +808,8 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	reason = reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -776,8 +819,10 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -787,17 +832,22 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 
 	ip_tunnel_flags_copy(flags, tunnel->parms.o_flags);
 
-	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags)))
+	if (gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT, flags))) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
-	if (skb_cow_head(skb, dev->needed_headroom))
+	if (skb_cow_head(skb, dev->needed_headroom)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto free_skb;
+	}
 
 	__gre_xmit(skb, dev, &tunnel->parms.iph, htons(ETH_P_TEB), flags);
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	reason = reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
-- 
2.47.3


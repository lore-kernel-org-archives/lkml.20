Received: from mail-lr2-f14.google.com (mail-lr2-f14.google.com [74.125.230.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E553FD24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569459; cv=none; b=ZLbDHa5MyGnF5gw8oK2Poj/giYPozpS+A+2npHr1OiR9LW7UFLEAasa44zf/EoWjsEMvdgAwSoUZy+5Fir3rCOIBKB8s3jwMaf3MMxjcvCxVa4sLbuvCqVFjYcqfy4AilaMoBuAOE265obuObhAnZ3VQEoF4FOwraGLUnjtiiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569459; c=relaxed/simple;
	bh=dojxVXG3sNV8ng6Av750Gp8Fk5X4IYoTxCHMc36gIOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEaHMXHYrte7rOhGXbT1BgxI4aYvzGLMJzXupTiR6kV7Je7lp8DIAabUUBqs0JPJnTrXMjhE3RiOu8n0zXaZn8/AODbiGZBV8+RwUcDl1DhaGZdCmgc+KC0lrm7OrwbSNm0nNW7oBpXPHntDzD73KaWXexJZNZkKNKWanbPFua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmPJ8Az5; arc=none smtp.client-ip=74.125.230.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmPJ8Az5"
Received: by mail-lr2-f14.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso8196671fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569453; x=1790174253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hESk+k+74OP8gnuSHzDBoTsGcSND2qSgXj7zXhmxe10=;
        b=hmPJ8Az5N8Ig3c3IWC9v6SQ9aq/m8z+K+rqv8RS3XuQd7gITkUBZ/h0Tx2DYpGMEk/
         57CNkMDZih/nMhV4chkocXXam2CQmBF8HPawL3JkQ9fFIAKT9aUfI3CLPO4zGRiDegrw
         zP3zbBDYvTX53MCKZwZB0jDcM3oZ76qmWxjLK39ZfXw8E1DmscMfHD7Dmq3keuTwO04T
         y5FWgrn9qUy7irvsJsRw/gYYxh7wWOAwphlLmExJD4KGoc3/cCpTvQio37kwk4/QUawa
         Ss2cRxMHCJ8fGNlg1BZIwXdiTaOUXl4MkMqN1olR5nduIbBUUQCCtz8b3utFY4vmMpxv
         iF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569453; x=1790174253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hESk+k+74OP8gnuSHzDBoTsGcSND2qSgXj7zXhmxe10=;
        b=V9dysGsmrzsebQTJ/4Ymw+KTE5VcqZKERbQ61Bsix5q9yNxDW2PKa61KoTQTJ795rC
         +Hj+4+HAIj03IUs3W3x0WmDFwGKpV8CqhBsldyZNaKzMKXGopyGe9BmvejIR3k5lO0tS
         9fUYlIf09guAYqwOufmDm9+JWd6EB7qHhIDOzfK21uJoHO9biCDzVvjCygz4g2Flyb8w
         ewZY40Mt9CRqs6CuBq95eBhjoVUZf/TI8jWf0dhrS9r3gFAaniaSX9u2cKQvUAnSC82V
         WeuVlRyz4jYHPGaGc1B9fLfkQJR6aCZjLXQjOcWh6BIGEG31tjgWilrdjhUX/6+gRWx4
         YtMg==
X-Forwarded-Encrypted: i=1; AKwUvBxplqIOXk/ts+krofU3acEjs2oz+ePRZIehI1w+hbdsyhEeLympX7uczDNQtqynYNeqyg2m5ewWweiEW+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kYcDyNoYE45OpBELFC2TQ3SUGRUcl58mYw5xo2zgZBCKDvbPFh
	zhNCabliyX/QnEt+qe9OQeHA8TCHz7TXNv+oOnRTatnNBJ7VhGKi2iNP
X-Gm-Gg: AYBFou3h6ilqpXeSwHb7Ch7zlVRKjCJK1Xh5qu7DxqGPfw3z4WipZiR3MGUk8IU/F/S
	mCJrtFKBsHDgGhL8Gy5GpVQJyFNENufaTj/vOpnMdVRgUp08tJNmR1eeGZGrMhauJ9u06olml6r
	5qWlGwdnGJLYF0Vx5Y8lrLskNNKGjwIbfcpbTSlq/SXUAhsGc/oVt/qDAksnUvCphvZT9NQsnJP
	LCRVpuQlCTEvHhMLn0nCdncczK9dUYIlZFl/2dRw2fbeBHMuwDpRlkTmY2xHJTBlEg+qcu7Qb7q
	uITaze2P+AXiVCU4+7wj8UYX5KQlBw3VPlebnhfYl3hLCU4T028Qbktp7eBmXrCReix/vY8Hv+7
	XyXXHqfJRbCy0EUcugzJid3WOfosrc2aWDYa+EiU2FSID0KaMlFISvIbjmRM52BtnfEpesMlH0q
	zAXOodiUM0SbrMm1C/wl8jlzTbd75fPNzF9ab5H6IElFhsTLsbLFdfPl0TON+3oGw8Ezjvn/umE
	eoCbqwA3qXmcfByTzbN3+8c7D7EuRysmQdOVocMa3YZNKax4dg90R250IcJYDF/
X-Received: by 2002:a05:6512:3f0d:b0:5b8:9943:68dd with SMTP id 2adb3069b0e04-5b8b660c30amr860185e87.7.1789569453093;
        Wed, 16 Sep 2026 07:37:33 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:32 -0700 (PDT)
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
Subject: [PATCH net-next v3 7/9] ip_gre: add drop reasons to the transmit path
Date: Wed, 16 Sep 2026 17:37:15 +0300
Message-ID: <20260916143717.1875082-8-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
References: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The five transmit functions of ip_gre collapse about twenty distinct
failures into a plain kfree_skb() and a tx_dropped increment, which says
nothing beyond "the tunnel did not send it".

No new reason is needed.  The length helpers already compute one, so
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

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_gre.c | 101 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 27 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index dc203937eb9f..373532e90dea 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -507,6 +507,7 @@ static int gre_handle_offloads(struct sk_buff *skb, bool csum)
 static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 			__be16 proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -515,19 +516,25 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 
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
@@ -544,12 +551,13 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -563,29 +571,41 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 
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
 
@@ -617,6 +637,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto err_free_skb;
 	}
 
@@ -629,7 +650,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
@@ -660,11 +681,13 @@ static int gre_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb)
 static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 			      struct net_device *dev)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 	const struct iphdr *tnl_params;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -675,10 +698,13 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
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
@@ -688,25 +714,31 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
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
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -714,12 +746,14 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 			       struct net_device *dev)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 	bool truncate = false;
 	__be16 proto;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -727,15 +761,21 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
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
 
@@ -756,6 +796,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto free_skb;
 	}
 
@@ -764,7 +805,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -772,10 +813,12 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 				struct net_device *dev)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -785,17 +828,21 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 
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
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
-- 
2.47.3


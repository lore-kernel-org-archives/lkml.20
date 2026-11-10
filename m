Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342039;
	b=TXv6VBrxXNRyfR7YPPGOGaQJ8VEINYvdZzIuh+kes3CistoX1siwkDG8CFTnkSsWCVfQ
	 scbrTaIH/iNBVcBysY1r8mTbFoF5gxBbkdcgNWzYjprKicrdX8HMYkilcbwHfLadej/Gt
	 7QDYcoJd70Z72SyK3tqIwM+L5lDVfXHDlmcG1tblFkMDpdWt6hs2Xp73i7/z6eKJs4ZF/
	 3T8UnD5ucY24PWB+wi6v3haaRmcOGFZzwjJW0sP/gcPwYaVXHuBFIyo9U/DCl43LEFIEY
	 lSwSsTpbbr2eUNcebazvq6aRoCqR/cZ88X/wk2W2AlKdRDro02uRrAsUSEBh/pYnDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4SdA7xio5K1KyDei/ibYKt+YyiTSOpzNq4XqXIId8Mc=;
	b=VBvSo4z5wtfHYHI/UMhdjh86OhF2lTNY9TRIImCVIw+BFHPHSYlf4/rwJzxfTxsN/B90
	 cPVmuB/UJuBWJYAtLYcDcMWRk90OzwXrvEg8rmlyPBVF8UbflKHPUyUuM+qrgc4IbTv8d
	 TnLellAZXHTNtJNJho/w7233Bx37CxwVWinbsj7alRcUPdbk7xHVO3/3o+0dz3wwJhIcE
	 wNmbBjpdTw6fx01OUV/zVullLJbzWAOUjYwT0cVHXuHI7As+JHPz5UIBhqOTUt31h6VWs
	 bthydJU4lRK4VSdKIzZnGk4crAHAOGUwtbC44e5Bt9jqmymd/Jc+KBC9yeTLIDQKnyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFsXxhvD;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C760A5BD2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998C760A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFsXxhvD
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab53a99771so20461821fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342037; x=1794946837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SdA7xio5K1KyDei/ibYKt+YyiTSOpzNq4XqXIId8Mc=;
        b=jFsXxhvDc0JD/gAFpujNJL2EMKTPRQ5CayWkzipGtv8hJxxfbl2ZxlLYafcVpLIb0H
         KiUS7QevbxeMwynPZGKmkIFsDuH0IgkErbthnWrJXXAvAzsFMv757eHvG2Gu9iY1Qahy
         bKdY9JoItdCn2yn8IVJ07EJHzCgQzL6+RTYf4e6i4khN9fecBdXJ/1V1hfVi89zjaQT5
         tYzaanntCPoCm3voCvQ9X62sSOm2DIvHEzra6y+rKwo7EJXG9+VdgEuj7+Pc9HuCadO6
         58KMfw/2NLd4zE8/H3Vo80WXDCzsFzt0lwI70QlmqcLJcYe9WCbJlb8FlnXnEQ3xhpD6
         WAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342037; x=1794946837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SdA7xio5K1KyDei/ibYKt+YyiTSOpzNq4XqXIId8Mc=;
        b=HI4UIqO+lxYnHiu+fR40GKXIRt22WYy6xo3yqqrP6vidUK2qdd4JPD2nKOmNky0HQf
         zEkb/P2Ou+0f67Ue224iYfMr2IspaUu7O9dqAabKXClZmqhPkC2x+iA1Ak3VDOE4nE0U
         Gju00r7VMes7pB6lOhAhqr/tkHwdpiItRXxWb6gZoK0g+DM5RfBx84i6ARoaBjXTdQXR
         aVeQCexDTjUMtWLp9bELXh0hbWqGMObZmED7fkc9NoiS2Cf0eOwGbrGgDD3AiJIB+/GX
         Fc3x5y24/9HtbJVal0veXsKJAEFJesMLSPBR4bA+nYZVyvvAKe8A4h2Eq35JfA37hFow
         DIsQ==
X-Forwarded-Encrypted: i=1; AL+hErFdU63L7q1RvPNToxAk2WPCJiugA5VihiDXJdZRZQ2eMJcy2roGAV80jtpcrb5rocgF5KcG04e5PPcULdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XiTzq3n3COpBi7FivYOdaUjQMLpSwg9x7OqiceGgZJHmLcoMS
	evmEzMxMYdwysryjrFoFURFdfmMI9uW4pPYvNskSPIFkoM5jM1y025ud
X-Gm-Gg: AYBFou0U0fMnmj45x1OY755mMTOETVwM9oEYwXUv5Uxb88iuUILVZRcFh6dqSHVje9F
	6CeZJAsEYgX1VujSWAj+Lgy54uIv82rlH9BXaUkDNvgAcjZvE7BV8idij5j/RsLeQRCp68eCEf5
	Zj4dG5qrC/VyUjf7zsRtbYfU4fP2xJmbnC9cg5fg/OxL4cS9FqEuSMmsRLzMNmqwI9mY71Q7m2c
	cnabIvCZeO6lxLufZXajWJhImuhB/iIn53+FpSeCB/PSP7f/gUa6P3u4m5TdmJlKTO8XWxJiIpD
	P0WmRCnMBp4rNW/GEjcMm2bJO+4FmX0VqeQSfd84uBeJP+4XBd4uJn0RRnj25qNIPzsyX6UgBcY
	R51oftSWrvfa13dKHeBMeo4RWBHu1/BJEJp4pgtpXT1vlpJ+IG/llJeH7uxjuojSUdfSec6OS76
	nrX2n2iEr+I4T5Rcwmye3unQfGjQQdtZ2Ck2u9KA1Zc3lXqGtkw4sBo7rDylsUmsvV4ugEQe16i
	V7S2An/o4Eo6xNOlVaSNeux6Efb1mlhCbAuIrKMUzP70I4XUI8xM+bbDnoQgXawatP43PnMlIom
	jxs5SRqeTVA0H8v/josGWg4e0Oe8Yeigk5HlshLKEWTHRiafFhuOm9OlInu+d+Hhzf7MRMtEb50
	6msrYKu0l4EfS7P86
X-Received: by 2002:a05:651c:3605:b0:3ab:43ca:1d9b with SMTP id 38308e7fff4ca-3ae09658ccemr8406621fa.27.1794342036699;
        Tue, 10 Nov 2026 12:20:36 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.137.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm5945401fa.0.2026.11.10.12.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:20:35 -0800 (PST)
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
Subject: [PATCH net-next v6 8/8] ip_gre: add drop reasons to the transmit path
Date: Tue, 10 Nov 2026 23:20:21 +0300
Message-ID: <20261110202021.821224-9-littlesmilingcloud@gmail.com>
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

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_gre.c | 101 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 27 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index c93c395c997a..71e087a7afcf 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -508,6 +508,7 @@ static int gre_handle_offloads(struct sk_buff *skb, bool csum)
 static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 			__be16 proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 	struct ip_tunnel_info *tun_info;
@@ -516,19 +517,25 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
 
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
@@ -545,12 +552,13 @@ static void gre_fb_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -564,29 +572,41 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 
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
 
@@ -618,6 +638,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto err_free_skb;
 	}
 
@@ -630,7 +651,7 @@ static void erspan_fb_xmit(struct sk_buff *skb, struct net_device *dev)
 	return;
 
 err_free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 }
 
@@ -664,8 +685,10 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
 	const struct iphdr *tnl_params;
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -676,10 +699,13 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
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
@@ -689,25 +715,31 @@ static netdev_tx_t ipgre_xmit(struct sk_buff *skb,
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
@@ -717,10 +749,12 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
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
@@ -728,15 +762,21 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
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
 
@@ -757,6 +797,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 				       truncate, true);
 		proto = htons(ETH_P_ERSPAN2);
 	} else {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto free_skb;
 	}
 
@@ -765,7 +806,7 @@ static netdev_tx_t erspan_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 free_skb:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
@@ -775,8 +816,10 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	IP_TUNNEL_DECLARE_FLAGS(flags);
+	enum skb_drop_reason reason;
 
-	if (!pskb_inet_may_pull(skb))
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason)
 		goto free_skb;
 
 	if (tunnel->collect_md) {
@@ -786,17 +829,21 @@ static netdev_tx_t gre_tap_xmit(struct sk_buff *skb,
 
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


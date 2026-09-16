Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF353444B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569455; cv=none; b=hGtYeBvRYEuuArCLDm/tDM4xDW+WrXy85QB2o4JBQBRD35GPoPsnQ1oSsuD5WV2AAKz9MYP+fyIm1siSZOpcZ6rUGneKzk7yii/Ji4IhpSVxp+3IP3x++e0AVacYQu3lMsdfKMNv8sYcmtBe9a+N5IenXZ3vXntAyAm3g0P0kLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569455; c=relaxed/simple;
	bh=jS+nc6FbKntG9f5xc9im/V7LZiEbxMbgUYbRLWRapl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNhfCORCOfXdcHK3SGCMMYMw0qFSrtIIKS++fC6ZCC2vOQb2ZY+wzSBxR5lNFUFEQiczjhOlRP2AwT5vcAYbfmuZWhmmRHqI/Wq8czoNhdJXp+nVje5/QW5lJUGujq+I16gNQMOatGmgyirJSAHKQtHj05xfrhiOqLHe2ux8/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFKKQtAN; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFKKQtAN"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so335119e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569451; x=1790174251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FblbYierjHzQHjiMdh07O9Nt/6J/OwumlrTj+pnoQo=;
        b=UFKKQtANTJkA9qHptmFGSWm8ZdgznUCG4vf6DBOhjfWArS8vYEDkle1lbRaLAL4Zm5
         dNEx4FZ2hZ0YySKA0+QZjlMMuS/x1mUOSUW35s/bzUkzCMQG4+/e1kvrmL6l8vPqenTi
         sPZcTF8ueeFt4YE6orOuDaFAvxEvnkg2/xxtInlF5SCb7SMVoGk4y9LhpLEX304byuuR
         42mHPfE3UDSO7pqPeNaUOmVqh+kTxbL/01A4KvuOL+PtiNQRRXJcDfl60KQhhjNz3+1z
         I8p4+dq7ZZ2gioRxeaA30z+lQCDzz7/awGkL6fefpEOK8g54IppWTn/PZWBo99jQaFED
         za2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569451; x=1790174251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4FblbYierjHzQHjiMdh07O9Nt/6J/OwumlrTj+pnoQo=;
        b=1GhYdTe2QHLqxZcR0YbIMD7ApxAMaT382O1bI1AeX52GQS8qGvRVMCg8zpxkKB2sbw
         ZZQ81MPgIChjanoenkXnRVJzr7xgr77rH6mkbznL1CDFZfdYhrYsQ1UGEY53yjEjtVWU
         nNkM3s0Cmuoe0AD77NgnWDZk3T/TANK/BDcWeE4ZuZC37GZxk/rhuXoilAUleH4B4NcE
         EwFY+y17QK6WsRYBqPWf2gq7WuZn/SyVVVkSBWsk2WnjbytUwFCSY25vTw0HRucQIpYo
         gq77yTiFagJrjilPqwj2uWgu0693QdSsYgPirZbvtY1j5KfXC2DRF6gS3GX/f18jZwy9
         L3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwRTXjqjbMOZdwt7YZhIHMT39jWbGCDJ5hBsCWHYinCVFL4Q/7H6v2Z+WrEwJiGtHLRwhpdNTy8nIwNX7c=@vger.kernel.org
X-Gm-Message-State: AFuF++mVz0prPqaiGSMM1zKzWqDqbkF+eGYynPcvgV3M0RA+T/u5MjT0
	vitniccXX6nEyTv7i/znwzoBfmKsbDVX0QWdYGiYb2qyK/UOKgL2yTuT
X-Gm-Gg: AYBFou0asRacjUao95G24NihWMZHKEHV809gBbFeUFBHhYNMiCJ32qCIKI+QAJYaPyg
	gyPpbcDn6rTM11LxZFep081nuR5r7yCdhS+vCtviBsXwbRMz42HTRWjl5wun+RDdc15TpKzqoQF
	yKF01DfsDYnGcGNGa0V2ns8ASC7vuAS3+iCKDkFAmE5e98VQT0ilfz/oFW5e+udA/tC5ZRFXEsi
	/vL5IGksJJb7fOe7eyUrrHsiqwm29N0hY1ec65C+O3yOm/B3NTVhoE4Lc6/u406DoKm+Z1IYFvd
	PzWiCzrO+zNqSN6Sr6n2pC4w8U23mTDGNR2LOYW6cqxzGnDDoDDoS2A+gAclBc5VCiGhBgtaoYu
	Io/KQorqg/q9CiyPGkSPYfV+ZytB5z9iQjX8AIfJ1L4S9Pe90nVFv/lRMNdfhSXNGAD7crL7khT
	SRp6/6gRKugZXFuAaTOIPRQrFONBPSnt5/bJ3Ly8i9FLnETDigyEUdtaFRmjFTm227VUeaNcU3b
	IORRAlZNHHo7uxzt3EXuHK58JZOdMHI3N4lcb3WYgGPS+nRxClaypbIh3Bus9yB9S/NwITXgeY=
X-Received: by 2002:a05:6512:230f:b0:5b6:10bc:b864 with SMTP id 2adb3069b0e04-5b8b63f8893mr693262e87.18.1789569450683;
        Wed, 16 Sep 2026 07:37:30 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:30 -0700 (PDT)
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
Subject: [PATCH net-next v3 5/9] ip6_gre: add drop reasons to the RX path
Date: Wed, 16 Sep 2026 17:37:13 +0300
Message-ID: <20260916143717.1875082-6-littlesmilingcloud@gmail.com>
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

Mirror the previous patch on the IPv6 side: report
SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND when no tunnel matches the packet,
and tell that apart from a header that is too short
(SKB_DROP_REASON_HDR_TRUNC) and from the allocation failures behind
__iptunnel_pull_header() and the metadata dst (SKB_DROP_REASON_NOMEM),
which so far all ended up in the same plain kfree_skb() in gre_rcv().

ip6gre_rcv() and ip6erspan_rcv() get the same output parameter as their
IPv4 counterparts.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_gre.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 78854cc2dac9..0b270f4ac774 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -454,7 +454,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	return 0;
 }
 
-static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
+static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
+		      enum skb_drop_reason *reason)
 {
 	const struct ipv6hdr *ipv6h;
 	struct ip6_tnl *tunnel;
@@ -473,8 +474,10 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 			tun_id = key32_to_tunnel_id(tpi->key);
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 
 			ip6_tnl_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		} else {
@@ -484,12 +487,14 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 		return PACKET_RCVD;
 	}
 
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_REJECT;
 }
 
 static int ip6erspan_rcv(struct sk_buff *skb,
 			 struct tnl_ptk_info *tpi,
-			 int gre_hdr_len)
+			 int gre_hdr_len,
+			 enum skb_drop_reason *reason)
 {
 	struct erspan_base_hdr *ershdr;
 	const struct ipv6hdr *ipv6h;
@@ -497,8 +502,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	struct ip6_tnl *tunnel;
 	u8 ver;
 
-	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr))))
+	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr)))) {
+		*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return PACKET_REJECT;
+	}
 
 	ipv6h = ipv6_hdr(skb);
 	ershdr = (struct erspan_base_hdr *)skb->data;
@@ -510,13 +517,17 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	if (tunnel) {
 		int len = erspan_hdr_len(ver);
 
-		if (unlikely(!pskb_may_pull(skb, len)))
+		if (unlikely(!pskb_may_pull(skb, len))) {
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return PACKET_REJECT;
+		}
 
 		if (__iptunnel_pull_header(skb, len,
 					   htons(ETH_P_TEB),
-					   false, false) < 0)
+					   false, false) < 0) {
+			*reason = SKB_DROP_REASON_NOMEM;
 			return PACKET_REJECT;
+		}
 
 		if (tunnel->parms.collect_md) {
 			struct erspan_metadata *pkt_md, *md;
@@ -532,8 +543,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id,
 						  sizeof(*md));
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -564,6 +577,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 		return PACKET_RCVD;
 	}
 
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_REJECT;
 }
 
@@ -577,17 +591,19 @@ static int gre_rcv(struct sk_buff *skb)
 	if (hdr_len < 0)
 		goto drop;
 
-	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false))
+	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false)) {
+		reason = SKB_DROP_REASON_NOMEM;
 		goto drop;
+	}
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (ip6erspan_rcv(skb, &tpi, hdr_len, &reason) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
 
-	if (ip6gre_rcv(skb, &tpi) == PACKET_RCVD)
+	if (ip6gre_rcv(skb, &tpi, &reason) == PACKET_RCVD)
 		return 0;
 
 out:
-- 
2.47.3


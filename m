Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D1D52ED49
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793581; cv=none; b=gOF5cuZXmxG5SPjwKYoVeRhUSW8m0CuZjELotgXLPxeHhAt0eHcZD/86JnxLmfqHp+5rw7oWY+Ra3ov8q+zfSnJdXnrY8c96C+to6Vz7wj57v3BHNlHbfREG3Z6oeC1MXKP0p6E36rN3uET2+coQ1F3xn1hO7Ntb/LLwHfEhz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793581; c=relaxed/simple;
	bh=9zf8+gHOhV4Fa7z2WdN9ZpHr4jsWwCOXPnWPxcvVtVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQcwC6/oZAgYGKP/pS7X+jGODTwa8BVqCA5QfbJ9mTpnbObxYG/Zy1Kp9qddh4GZXhu07/jU0Wa8HTEq1PwM/DyAhIs2l/C4gXpbnz2McGQCqAXqTR8nwxEe2JzZl49cI747xaaqvlXEkYJex2Jk5XdreNz71PPngjtfhnSepMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBWOfYlk; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBWOfYlk"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso350193e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793577; x=1791398377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9jol655owLLTNZcTmGMpOCEEtAAB8PD/LanW9S/r+g=;
        b=WBWOfYlkoJiVt3jJraaGRv4FpHqC2G1T9l/dGSjdktcjHwGXrTGVSqXpdRZWa8goLM
         VYAvvquxVc70Gocio5syd7dT6g+M86josmkg+zfQrAhNcKU7UbGHhCxpId726e26auKF
         DOUisEbiCUO4FTpQ+VxbnoaVHkL4l1QJhfAUQtQ6NNZniH5UcXpnhwZeKCZxMEM89t6p
         +oWhOrCuxKz82C6Spu/pPF88U1rfNA7eicgMgjVmEAg+9x17Of4D1UKMA9/SUm9PlgGf
         Eb5nxZ/kKgrAFzCTAbZ/J8TKrb1xr25vlzt6nUC7la+ePam+8MTiOJWxdc+iiQ+S/qBY
         c1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793577; x=1791398377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9jol655owLLTNZcTmGMpOCEEtAAB8PD/LanW9S/r+g=;
        b=QIFOaVkom+qpRkMeVXmBZajS0nChU9mNZZS+ouVMmMx2M/+UEN5wqRu1BbrrB4VOYx
         MbCCXxD0luJ9tGFt7Qe42UFFw9MfK05v+PP0QDjw2wBy7Avod4PMF2rCnDQrbBIbLpqK
         TsYlbJyn+P1XfKeQ2bKbBpAe+33IVvMofXG+Wlce5ZU/uKO0JQHI3cWfrffF/9tvKIIP
         hTKBdpsce2SPlQsMYXuoA5a0FVmXYz5kFh8wXfjWVNmy7bz/atcf45a7icwP05vVFt5t
         QxdXh06C2IYAPxg72njq0rvNqAknKpCf+GJfL7VRb5IIpjmhOuUG9YtZvLAKMQwFI5rb
         wqxA==
X-Forwarded-Encrypted: i=1; AKwUvBw6/KzQgw2eW9wV7VS/7Fj3SpXt6BLZs/ZgeX26Abtee6KDzEYxATnVKVnAJYYwPvZoE6+Q+gQhNd1I2e8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxx8gknAFnu3czZHxLaCtlkThfYWhh5NzCaUCKK4+gHz4d0deC
	KSSWkAkoZoA4hVi9MMqe4UmOzoUrjityfDTqWLdSCqFxC0OwOKsX9HCK
X-Gm-Gg: AYBFou0XTzagQX9ChsT9NpbcDmhuxW5XCJnOsbyNvWKKj2b7lQaY1aJjPNGLDrpbWM7
	umBbyMOhJsy65I3xK+tCxFkDX1oehbbHYtBPijBwlmTXA/7mm6mgsl2S99f+7qLamYwwX6I9Vlv
	43djSmOb2ilMR15d1JRGsQXmp9/+9NKr01ANIj665wZwSQd08DgydQJHewFrJ1Xh+NA9E3tWjdK
	z6yT8aImXb5rjtnErDaNIpUT7u84VmmWFJ/ZXHTs3CbLDZa/wHxMakS0E41ENn+Wfp98ZBIQSvb
	l69yQ7JQIYc0cot3ydwicHV7iPu/wJ/sMbt1MNmJ2d6KZJ0xPhfTGeSwdp81x8DEEgMn5vD3ASs
	Ni42S2piEsDS0pHVuB/1ch65zg1bGOBALuswHFPOyvqQzhzkiB2MCMMs2M1fxQxNO14ZMHnhGx5
	wmPJS5GxAx2eaVU5XvCoNSR+E97WXWp4FevoRwicDMb5taqUy6LaCGTeD1GBdYTczRcN0TVRDLf
	oIzdiXra6X6x9JTTvWr4jS9GF99KgXdjejHDLFpcdEpJQ==
X-Received: by 2002:a05:6512:39c6:b0:5ba:3f76:aca9 with SMTP id 2adb3069b0e04-5ba403e962emr1070451e87.17.1790793576945;
        Wed, 30 Sep 2026 11:39:36 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.169.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm156593e87.62.2026.09.30.11.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:34 -0700 (PDT)
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
Subject: [PATCH net-next v5 08/14] ip6_gre: add drop reasons to the RX path
Date: Wed, 30 Sep 2026 21:39:04 +0300
Message-ID: <20260930183910.3151873-9-littlesmilingcloud@gmail.com>
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

Mirror the previous patch on the IPv6 side. So far gre_rcv() reported
the drops below as SKB_DROP_REASON_NOT_SPECIFIED, all from the same
kfree_skb_reason() call. Now it reports:

 - SKB_DROP_REASON_TUNNEL_NOT_FOUND when no tunnel matches,
 - what pskb_may_pull_reason() returns when an ERSPAN header cannot be
   pulled,
 - what iptunnel_pull_header() and __iptunnel_pull_header() return
   when the pull fails,
 - SKB_DROP_REASON_NOMEM when the metadata dst cannot be allocated.

Unlike ip_gre, gre_rcv() calls the helper before the tunnel lookup, so a
packet whose ETH_P_TEB inner Ethernet header or WCCPv2 extra word is cut
short is reported as SKB_DROP_REASON_PKT_TOO_SMALL whether a tunnel
matches or not.

Like their IPv4 counterparts, ip6gre_rcv() and ip6erspan_rcv() now
return SKB_NOT_DROPPED_YET where they returned PACKET_RCVD and a drop
reason where they returned PACKET_REJECT. That leaves PACKET_RCVD,
PACKET_REJECT and PACKET_NEXT without users, so remove them.
PACKET_REJECT has the value of SKB_CONSUMED, and a stray one in a
function that now returns a drop reason would build silently and be
traced as a consumed packet.

Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/ip_tunnels.h |  4 ----
 net/ipv6/ip6_gre.c       | 49 +++++++++++++++++++++++-----------------
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c0e691..792690ae4f26 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -207,10 +207,6 @@ struct tnl_ptk_info {
 	int hdr_len;
 };
 
-#define PACKET_RCVD	0
-#define PACKET_REJECT	1
-#define PACKET_NEXT	2
-
 #define IP_TNL_HASH_BITS   7
 #define IP_TNL_HASH_SIZE   (1 << IP_TNL_HASH_BITS)
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 25fd290082c4..3333a0ab180c 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -451,7 +451,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	return 0;
 }
 
-static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
+static enum skb_drop_reason ip6gre_rcv(struct sk_buff *skb,
+				       const struct tnl_ptk_info *tpi)
 {
 	const struct ipv6hdr *ipv6h;
 	struct ip6_tnl *tunnel;
@@ -471,31 +472,33 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id, 0);
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			ip6_tnl_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		} else {
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
-static int ip6erspan_rcv(struct sk_buff *skb,
-			 struct tnl_ptk_info *tpi,
-			 int gre_hdr_len)
+static enum skb_drop_reason ip6erspan_rcv(struct sk_buff *skb,
+					  struct tnl_ptk_info *tpi,
+					  int gre_hdr_len)
 {
 	struct erspan_base_hdr *ershdr;
 	const struct ipv6hdr *ipv6h;
+	enum skb_drop_reason reason;
 	struct erspan_md2 *md2;
 	struct ip6_tnl *tunnel;
 	u8 ver;
 
-	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr))))
-		return PACKET_REJECT;
+	reason = pskb_may_pull_reason(skb, sizeof(*ershdr));
+	if (unlikely(reason))
+		return reason;
 
 	ipv6h = ipv6_hdr(skb);
 	ershdr = (struct erspan_base_hdr *)skb->data;
@@ -507,13 +510,14 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	if (tunnel) {
 		int len = erspan_hdr_len(ver);
 
-		if (unlikely(!pskb_may_pull(skb, len)))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb, len);
+		if (unlikely(reason))
+			return reason;
 
-		if (__iptunnel_pull_header(skb, len,
-					   htons(ETH_P_TEB),
-					   false, false))
-			return PACKET_REJECT;
+		reason = __iptunnel_pull_header(skb, len, htons(ETH_P_TEB),
+						false, false);
+		if (reason)
+			return reason;
 
 		if (tunnel->parms.collect_md) {
 			struct erspan_metadata *pkt_md, *md;
@@ -530,7 +534,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id,
 						  sizeof(*md));
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -558,10 +562,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
 static int gre_rcv(struct sk_buff *skb)
@@ -573,17 +577,20 @@ static int gre_rcv(struct sk_buff *skb)
 	if (reason)
 		goto drop;
 
-	if (iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false))
+	reason = iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false);
+	if (reason)
 		goto drop;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+		reason = ip6erspan_rcv(skb, &tpi, tpi.hdr_len);
+		if (!reason)
 			return 0;
 		goto out;
 	}
 
-	if (ip6gre_rcv(skb, &tpi) == PACKET_RCVD)
+	reason = ip6gre_rcv(skb, &tpi);
+	if (!reason)
 		return 0;
 
 out:
-- 
2.47.3


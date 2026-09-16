Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010851FCCE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569453; cv=none; b=TD5Q7jG5becOKsbMB+FXVzJjMoZiB0waHPbH0B1mXF4No7CBOHaCYSH4TQOTYZHWoaxL36Unh3KttzPt5zdB+k9K1LjRVrwx1xU/QrUKNDrN1GuPDwbL09EoCK2QF0ITQRA4684V9plYHDXGGWhamy+3yOOiPBIASS8BHhW05pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569453; c=relaxed/simple;
	bh=VRzImSPQoUL1+TR5Aq1AzNog5kxGpZLs1ElY9xVdIK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqeYzS4KIRJoExBRNk1rO8qctYsgInjpbeZXtQFOoq2bjvydGzkligIE6kSW8djdOgDJvITeCUzE5thWLVZu01mJTfxzaG6PYMJesgHld61/4DdKiD5zZ2AC5PwFScnUZ/ccQVQ0ymxZ4qY36OWLI/brp1+WwfKdAJ7iFascyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkOjbFuI; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkOjbFuI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so932313e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569449; x=1790174249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pnqDmHUn4GuJkxfLfl6U2c0IlVUX25aIG3vt+TH9Zs=;
        b=FkOjbFuIXMCxBwGJbFfxaTbIuCWM7meFB1JeIujDnUQZAx+xoM1JLYWDSvsM/eGCEg
         oV8hd9RGdlACBuZEvx3L7JwdeEnQHroVOgwlRKP8NB91x1fAff9WZOVnTALs2fEpBZmD
         KPTLeqrhz3ZD+eG2jb41a3DfNs1BCbth5KhuvsgNWVFUXHCFbHTDGuexQ7KVvais2jxV
         tuJ1hMX+dc/hQTORbFc1P96ePdCSKRLEJytJSQaTrTqUdbW8/v1MLFlEw4gZa+2qtyFW
         wOFMKiUEBd/+NVyfEbvvN0gc9yWeUfepoVBthe5Po0yjjI8FI78hwG1GJK9GLuM5Clzi
         icQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569449; x=1790174249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pnqDmHUn4GuJkxfLfl6U2c0IlVUX25aIG3vt+TH9Zs=;
        b=PbzZ0C2hfP4JxpsgH9qxpYLzICP+fpQKREGGga2JKjvy/HinzPjeX4WhqFrZ0dU6pQ
         H8qLAhp1BffsVpVTuP/yZoXl/ROL3NqHd7IbtIv74bFSptJpihjiqWJFhtYnnvAZeEOQ
         oNoYNyNmBQvig2tUXhYZRKTGPZ0x/HFwOzyNCuZ94c35kWkV26syBbc6pY57LgaYDDYS
         3/u1HGVCziFmTDy3e06papoClIp/2m+Yitl+DfqTX8EkwS8daxwW254IoHKKs7sVtVG3
         R+F3ro99TAp5T2Sz/Mqb5CCPbtkel7TBXQt/e6TgKdnp8gww8NCPHwh8RGkW/b6lQJhL
         e7Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxwhOb1z4hFZojTcMGSG+r79/5E6JZs1IJKyJnSd0UxXoY6ygJ7P08cXSU61knNIpZB55Ftkg1tK7KG0bI=@vger.kernel.org
X-Gm-Message-State: AFuF++ksYxleLp03CvGgGK4uukcIYu4MJjdZ73QNNlBhLLmZZXmM6KS4
	uR7nYUVPovtP02XCmauCcywaul2wXV/rYaMoR67+VVkqn3/lmHBrJuIf
X-Gm-Gg: AYBFou3YaJ8hdrtdMU0Zd5YnLrHPb8MGzJkKjxuiLU6EALOoKPCcq0dNhHDGwVM4HHX
	2AzqzlYvzhnp1iBVoyN1nBZDCgM77KfToLqvJfIW8z5f7ky4D/iy7bxskv8VqxsyEjFNX0hnVM9
	bZEOEvxz2O5v4u8XivF01tPozhFuhy+PEjls8eNSFLZPIeTllqt1UcSaklUCas3g3cKB+OFWLJO
	AWY6Fygm5+QKvWDEW1/DNbtJyXVdEBVgYP5KoMJf8mQL/SXWwVK/VMhV0UxeTxlMsecM3svBs8J
	tOR3BqdKriZnYt9ulNUVf6gX2Uj2RhqF4aB/Ac2WDjIxVSkfSqr4HjKj22BjVjSpYTlHg/XlZG2
	zq+C4eHTWmkeSo+zRLrWB1OtACM/zeZl7N1e59V65/k+Wbkchwr2Nz0Ln1cj9VrHr7gKRBvhqor
	HERb7aHi57/wTweTx6jNkSRYPcQFBdAq1gv4hbZcH3JIvY2sqgmk6E2UU1UY9TtjtmuazIpKQQ/
	T2ZfbDPRFRxaMv6J+UT9MSzy0Ez8oCuRfcyHairKTemo/9sCKIGpsH/W7iieEKS
X-Received: by 2002:a05:6512:3da8:b0:5b6:183c:5c8c with SMTP id 2adb3069b0e04-5b8b6645ec3mr998401e87.42.1789569448577;
        Wed, 16 Sep 2026 07:37:28 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:28 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/9] gre: make gre_parse_header() report a drop reason
Date: Wed, 16 Sep 2026 17:37:11 +0300
Message-ID: <20260916143717.1875082-4-littlesmilingcloud@gmail.com>
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

gre_parse_header() returns -EINVAL for six different reasons and its
callers turn that into a plain kfree_skb().  The only detail they could
get so far was the csum_err flag, which none of them actually reads:
both ip_gre and ip6_gre declare it, pass it in and then ignore it.

Replace that dead output parameter with an enum skb_drop_reason one and
let the two receive paths report what happened.  Two reasons are added:

 - SKB_DROP_REASON_GRE_INVALID_HDR, for a header carrying an unsupported
   version or the routing bit,

 - SKB_DROP_REASON_GRE_CSUM, for a checksum error, next to the existing
   TCP_CSUM, UDP_CSUM, ICMP_CSUM and IP_CSUM.

The header pull failures reuse SKB_DROP_REASON_HDR_TRUNC, which
documents exactly this case, and gre_rcv() in the demux reuses
pskb_may_pull_reason() and SKB_DROP_REASON_UNHANDLED_PROTO.

A NULL reason keeps the meaning a NULL csum_err had: the caller is not
interested in it and a checksum failure must not be reported.  The
checksum is still computed either way, the packet is just not rejected
over it.  This is what the ICMP error handlers need, as they only get
a part of the original packet.

Tunnel lookup failures still report SKB_DROP_REASON_NOT_SPECIFIED here;
they are addressed in the following patches.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  9 ++++++
 include/net/gre.h             |  2 +-
 net/ipv4/gre_demux.c          | 52 +++++++++++++++++++++++++++--------
 net/ipv4/ip_gre.c             |  6 ++--
 net/ipv6/ip6_gre.c            |  6 ++--
 5 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index e1fdd11c939f..6ae7a604722d 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -131,6 +131,8 @@
 	FN(RECURSION_LIMIT)		\
 	FN(TNL_OPT_MISMATCH)		\
 	FN(TNL_OLD_SEQ)			\
+	FN(GRE_INVALID_HDR)		\
+	FN(GRE_CSUM)			\
 	FNe(MAX)
 
 /**
@@ -628,6 +630,13 @@ enum skb_drop_reason {
 	 * numbering.
 	 */
 	SKB_DROP_REASON_TNL_OLD_SEQ,
+	/**
+	 * @SKB_DROP_REASON_GRE_INVALID_HDR: the GRE header is invalid, e.g.
+	 * an unsupported version or the routing bit is set.
+	 */
+	SKB_DROP_REASON_GRE_INVALID_HDR,
+	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
+	SKB_DROP_REASON_GRE_CSUM,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/include/net/gre.h b/include/net/gre.h
index b55f67ecd2fc..a63f26c3f78e 100644
--- a/include/net/gre.h
+++ b/include/net/gre.h
@@ -33,7 +33,7 @@ int gre_add_protocol(const struct gre_protocol *proto, u8 version);
 int gre_del_protocol(const struct gre_protocol *proto, u8 version);
 
 int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs);
+		     enum skb_drop_reason *reason, __be16 proto, int nhs);
 
 static inline bool netif_is_gretap(const struct net_device *dev)
 {
diff --git a/net/ipv4/gre_demux.c b/net/ipv4/gre_demux.c
index 96fd7dc6d82d..c5d3847848ef 100644
--- a/net/ipv4/gre_demux.c
+++ b/net/ipv4/gre_demux.c
@@ -58,26 +58,44 @@ EXPORT_SYMBOL_GPL(gre_del_protocol);
 
 /* Fills in tpi and returns header length to be pulled.
  * Note that caller must use pskb_may_pull() before pulling GRE header.
+ *
+ * @reason is only written when the header is rejected, so the caller has
+ * to initialise it before the call.
+ *
+ * A NULL @reason means that the caller is not interested in the drop
+ * reason, and also that a checksum failure must not be reported: the
+ * checksum is still computed, the packet is just not rejected over it.
+ * This is what the ICMP error handlers need, as they only get a part of
+ * the original packet.
  */
 int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs)
+		     enum skb_drop_reason *reason, __be16 proto, int nhs)
 {
 	const struct gre_base_hdr *greh;
 	__be32 *options;
 	int hdr_len;
 
-	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
+	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr)))) {
+		if (reason)
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return -EINVAL;
+	}
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
-	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING)))
+	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING))) {
+		if (reason)
+			*reason = SKB_DROP_REASON_GRE_INVALID_HDR;
 		return -EINVAL;
+	}
 
 	gre_flags_to_tnl_flags(tpi->flags, greh->flags);
 	hdr_len = gre_calc_hlen(tpi->flags);
 
-	if (!pskb_may_pull(skb, nhs + hdr_len))
+	if (!pskb_may_pull(skb, nhs + hdr_len)) {
+		if (reason)
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return -EINVAL;
+	}
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	tpi->proto = greh->protocol;
@@ -87,8 +105,8 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		if (!skb_checksum_simple_validate(skb)) {
 			skb_checksum_try_convert(skb, IPPROTO_GRE,
 						 null_compute_pseudo);
-		} else if (csum_err) {
-			*csum_err = true;
+		} else if (reason) {
+			*reason = SKB_DROP_REASON_GRE_CSUM;
 			return -EINVAL;
 		}
 
@@ -116,8 +134,11 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 
 		val = skb_header_pointer(skb, nhs + hdr_len,
 					 sizeof(_val), &_val);
-		if (!val)
+		if (!val) {
+			if (reason)
+				*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return -EINVAL;
+		}
 		tpi->proto = proto;
 		if ((*val & 0xF0) != 0x40)
 			hdr_len += 4;
@@ -132,8 +153,11 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 	    greh->protocol == htons(ETH_P_ERSPAN2)) {
 		struct erspan_base_hdr *ershdr;
 
-		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr)))
+		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr))) {
+			if (reason)
+				*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return -EINVAL;
+		}
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + nhs + hdr_len);
 		tpi->key = cpu_to_be32(get_session_id(ershdr));
@@ -145,16 +169,20 @@ EXPORT_SYMBOL(gre_parse_header);
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct gre_protocol *proto;
 	u8 ver;
 	int ret;
 
-	if (!pskb_may_pull(skb, 12))
+	reason = pskb_may_pull_reason(skb, 12);
+	if (reason)
 		goto drop;
 
 	ver = skb->data[1]&0x7f;
-	if (ver >= GREPROTO_MAX)
+	if (ver >= GREPROTO_MAX) {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto drop;
+	}
 
 	rcu_read_lock();
 	proto = rcu_dereference(gre_proto[ver]);
@@ -167,11 +195,11 @@ static int gre_rcv(struct sk_buff *skb)
 drop_nohandler:
 	rcu_read_unlock();
 	dev_core_stats_rx_nohandler_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, SKB_DROP_REASON_UNHANDLED_PROTO);
 	return NET_RX_DROP;
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return NET_RX_DROP;
 }
 
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 82309efd417e..1894c5746a73 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -439,8 +439,8 @@ static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
 	int hdr_len;
 
 #ifdef CONFIG_NET_IPGRE_BROADCAST
@@ -451,7 +451,7 @@ static int gre_rcv(struct sk_buff *skb)
 	}
 #endif
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IP), 0);
+	hdr_len = gre_parse_header(skb, &tpi, &reason, htons(ETH_P_IP), 0);
 	if (hdr_len < 0)
 		goto drop;
 
@@ -469,7 +469,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 8ebda0b6a78b..78854cc2dac9 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -569,11 +569,11 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
 	int hdr_len;
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IPV6), 0);
+	hdr_len = gre_parse_header(skb, &tpi, &reason, htons(ETH_P_IPV6), 0);
 	if (hdr_len < 0)
 		goto drop;
 
@@ -594,7 +594,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmpv6_send(skb, ICMPV6_DEST_UNREACH, ICMPV6_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3


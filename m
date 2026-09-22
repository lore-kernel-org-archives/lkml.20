Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE0544D5C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115334; cv=none; b=VeoyODTDivsxhLREfwIyANKJsdxWYACbOc9QrqQfA1ZwsDFKUGc7h1naiScpZxMcUT50BFyw/EgYQUGJPyUDze/G1Bk1ybLCy1Toe59Ifdh+vZ+AAW+8sPbHwClo+CQ3eQlUyB3jOdjz2aANLiApYuZs5u3o2DH2leKIgAEaVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115334; c=relaxed/simple;
	bh=JxSk/JP7u4KcR/HLX+vqea16/v4KdwxvKwkPMvzejhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jsw+E091Z1pc2YQMFDibGosP0AiuVBPtIyI1heFvjnVdtVYyUY6DkX1I0B3/ws3KZZwTIp5WCOtroRo5JDR1RA/kuGNYvbdGDSVxY8tiI6ji2dFUA+gQyaGDdQ/BDahpLPBineOYjfAoqc2e2OFVQBV5VPDXvDXI8+ECIbxOlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBnrgjKa; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBnrgjKa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso375977e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790115322; x=1790720122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWc4v88VrqhMj8Mk9GQAEuE7z6ifNAFZMAXLHyiJrME=;
        b=GBnrgjKa496TiwiFX/5+/n3aRIDBp+HGtuutu38bNNxr5SltPLMbzM1gQktXmsljW1
         ICCuSuV552ApZZr0JYZfzWCB8H7ex36kExUR4B7sNASSgdNVpDCCSyLqC2qTueJvTnxa
         krSYxn7vRew8xIk24FQhTI+bvCIAcX+5KN/2XUtM9KBMwxizK3MUwANECXUcalLtD2nI
         NY+eA9POooqY/Rav32/fIvia6RNY2bG+3EUOW7CvJvNIOumOdOHurk+yrQzdIoCaozsg
         w4NxcRQINAufLAM1hC2PZgU08jnKCTEUxfealur/5DkPrNDp9VvZAGN1Iw/3tg08WfrA
         GWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115322; x=1790720122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWc4v88VrqhMj8Mk9GQAEuE7z6ifNAFZMAXLHyiJrME=;
        b=n3SBf84blU3cKLAEUZqwndCHO1WBSJwUhl3UD5nuAbaFM99ojafS5ekUHiYuyFuoUr
         80Bj1mineIWZ5EFfhkjQJpKv3XZRFaaleRDfJvxU17wRQdepTsO1vgK71bvlXPlwJ3Q0
         l0TePWIr30ABpjMowW4fkhmHnd41HkCTiFaGQPhVGVEg+yfvbzyvTjYgLOdN0xdnlh1n
         y8DS+Ox0aeCzW1aC08Oal4xO2DU1NjhDcLzcBdebgiL7lLzWOIOqvlpFLfkwAGbndNUf
         jXHyXdL5u1pF2UlGzSc90x5GM1IrU6mKn+GIPevqV1ffY9+IOqjW19/RwC0ekf31T5Vk
         m5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8bpwA/R85MqkD+7Q9pu5oZDRt3arxad1oAZq+r1wX6jX8tFVYHtLNUMlliX5MpBjZk7L+iYZhfSlVR5o=@vger.kernel.org
X-Gm-Message-State: AFuF++kjxcpIR2VGfM+mbgQ3soeggdWLZ4c3wlJHbOveV0QyIO33aP4L
	uskPd6sox80SEhXfsLBP6jigEUEg4ltqF+TpCnqACLqPRhZZi6z0k+XR
X-Gm-Gg: AYBFou2FFu2kL+8dV/hC9RiFEFX1zHOdt1bXYU2Lm+29zwfJJ0YWXlTr9PKSTr+YLGc
	1e/mzq/gZeNgOrakS2pQRRr1/RhwhXuaNtjp8uTUK30L9T7HkTNcsS+aVazvT2lyjjW5ls9EK6y
	EH6J1wTaZJjVMc/OerZk5hyp1lg8OgsGKE5yMhiZYDYGPgVbWHg91qPEXAaD2IM2GWaurHQsUin
	fLNbdz2kjssuq3ymLepOcV4vbWxorETcI5Rw01VstK9HmpYuYRNgmCs1Tm+78lP6bnqFBHN0f9B
	qlG9tDxKx+X6cQ5HCDhCDsoPe6J//DVJLt3zudQY+vXK3i2gePR+c6BeeDMJmFU5GETgOSP7F1f
	bt9NL5W4eIF/nkQ69GiADsq2vQEfD1G2yAbLechYJGCLr8FUk2tEL7zE+/UCSwtfe4UCZsqlK8Z
	1cDJGHHPrZRNTCFoZPHnLQL6EzGPClTlY7/HXM4zte1zKfz8jrj+Kq6UH7grj40ok0FTCJCL3Kr
	/R0gEKXNr+ibUhMX8PwRaoAWJ0zDn+L6cWuIOhunprz7y1ZmGRqjnnf3q+v0kUqxds2MIhQ
X-Received: by 2002:a05:6512:1290:b0:5b8:c226:fe21 with SMTP id 2adb3069b0e04-5b8d89c15a4mr185478e87.56.1790115321565;
        Tue, 22 Sep 2026 15:15:21 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm164920e87.17.2026.09.22.15.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:19 -0700 (PDT)
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
Subject: [PATCH net-next v4 03/10] gre: make gre_parse_header() report a drop reason
Date: Wed, 23 Sep 2026 01:15:00 +0300
Message-ID: <20260922221507.3268127-4-littlesmilingcloud@gmail.com>
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

gre_parse_header() returns -EINVAL for every failure and its receive
callers turn that into a plain kfree_skb(). The only detail they could
get so far was the csum_err flag, which none of them actually reads:
both ip_gre and ip6_gre declare it, pass it in and then ignore it.

Make gre_parse_header() return the drop reason instead, with
SKB_NOT_DROPPED_YET for a valid header, and let the two receive paths
report it. The header length it used to return is already stored in
tpi->hdr_len, so the callers take it from there. Two reasons are added:

 - SKB_DROP_REASON_GRE_INVALID_HDR, for a header carrying an unsupported
   version or the routing bit,

 - SKB_DROP_REASON_GRE_CSUM, for a checksum error, like the existing
   TCP_CSUM, UDP_CSUM, ICMP_CSUM and IP_CSUM.

The header pull failures reuse SKB_DROP_REASON_HDR_TRUNC, which
documents exactly this case, and gre_rcv() in the demux reuses
pskb_may_pull_reason() and SKB_DROP_REASON_UNHANDLED_PROTO.

csum_err had a second use: the ICMP error handlers pass NULL for it, so
that a checksum failure does not reject the header and the rest of it is
still parsed, as they only get a part of the original packet. That came
with commit b0350d51f001 ("ip_gre: fix parsing gre header in ipgre_err")
and becomes an explicit icmp_err argument. The checksum is still
computed either way.

Tunnel lookup failures still report SKB_DROP_REASON_NOT_SPECIFIED here,
which gre_rcv() sets again once the header is parsed; they are
addressed in the following patches.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  9 ++++++++
 include/net/gre.h             |  5 +++--
 net/ipv4/gre_demux.c          | 42 ++++++++++++++++++++++-------------
 net/ipv4/ip_gre.c             | 18 +++++++--------
 net/ipv6/ip6_gre.c            | 18 +++++++--------
 5 files changed, 56 insertions(+), 36 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index edbe58a22ddf..ffa11206b6ca 100644
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
@@ -629,6 +631,13 @@ enum skb_drop_reason {
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
index b55f67ecd2fc..4cb19abea90d 100644
--- a/include/net/gre.h
+++ b/include/net/gre.h
@@ -32,8 +32,9 @@ struct gre_protocol {
 int gre_add_protocol(const struct gre_protocol *proto, u8 version);
 int gre_del_protocol(const struct gre_protocol *proto, u8 version);
 
-int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs);
+enum skb_drop_reason
+gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
+		 bool icmp_err, __be16 proto, int nhs);
 
 static inline bool netif_is_gretap(const struct net_device *dev)
 {
diff --git a/net/ipv4/gre_demux.c b/net/ipv4/gre_demux.c
index 96fd7dc6d82d..e117056525f0 100644
--- a/net/ipv4/gre_demux.c
+++ b/net/ipv4/gre_demux.c
@@ -56,28 +56,35 @@ int gre_del_protocol(const struct gre_protocol *proto, u8 version)
 }
 EXPORT_SYMBOL_GPL(gre_del_protocol);
 
-/* Fills in tpi and returns header length to be pulled.
+/* Fills in tpi, including the header length to be pulled in tpi->hdr_len,
+ * and returns SKB_NOT_DROPPED_YET, or the reason to drop the packet if the
+ * header is rejected.
  * Note that caller must use pskb_may_pull() before pulling GRE header.
+ *
+ * @icmp_err is set by the ICMP error handlers, which only get a part of
+ * the original packet: a checksum failure does not reject the header then,
+ * the checksum is still computed and the rest of the header is parsed.
  */
-int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs)
+enum skb_drop_reason
+gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
+		 bool icmp_err, __be16 proto, int nhs)
 {
 	const struct gre_base_hdr *greh;
 	__be32 *options;
 	int hdr_len;
 
 	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
-		return -EINVAL;
+		return SKB_DROP_REASON_HDR_TRUNC;
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING)))
-		return -EINVAL;
+		return SKB_DROP_REASON_GRE_INVALID_HDR;
 
 	gre_flags_to_tnl_flags(tpi->flags, greh->flags);
 	hdr_len = gre_calc_hlen(tpi->flags);
 
 	if (!pskb_may_pull(skb, nhs + hdr_len))
-		return -EINVAL;
+		return SKB_DROP_REASON_HDR_TRUNC;
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	tpi->proto = greh->protocol;
@@ -87,9 +94,8 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		if (!skb_checksum_simple_validate(skb)) {
 			skb_checksum_try_convert(skb, IPPROTO_GRE,
 						 null_compute_pseudo);
-		} else if (csum_err) {
-			*csum_err = true;
-			return -EINVAL;
+		} else if (!icmp_err) {
+			return SKB_DROP_REASON_GRE_CSUM;
 		}
 
 		options++;
@@ -117,7 +123,7 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		val = skb_header_pointer(skb, nhs + hdr_len,
 					 sizeof(_val), &_val);
 		if (!val)
-			return -EINVAL;
+			return SKB_DROP_REASON_HDR_TRUNC;
 		tpi->proto = proto;
 		if ((*val & 0xF0) != 0x40)
 			hdr_len += 4;
@@ -133,28 +139,32 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		struct erspan_base_hdr *ershdr;
 
 		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr)))
-			return -EINVAL;
+			return SKB_DROP_REASON_HDR_TRUNC;
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + nhs + hdr_len);
 		tpi->key = cpu_to_be32(get_session_id(ershdr));
 	}
 
-	return hdr_len;
+	return SKB_NOT_DROPPED_YET;
 }
 EXPORT_SYMBOL(gre_parse_header);
 
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
@@ -167,11 +177,11 @@ static int gre_rcv(struct sk_buff *skb)
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
index 5e877018e006..ae50fd0f6792 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -237,8 +237,8 @@ static void gre_err(struct sk_buff *skb, u32 info)
 	const int code = icmp_hdr(skb)->code;
 	struct tnl_ptk_info tpi;
 
-	if (gre_parse_header(skb, &tpi, NULL, htons(ETH_P_IP),
-			     iph->ihl * 4) < 0)
+	if (gre_parse_header(skb, &tpi, true, htons(ETH_P_IP),
+			     iph->ihl * 4))
 		return;
 
 	if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED) {
@@ -439,9 +439,8 @@ static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
-	int hdr_len;
 
 #ifdef CONFIG_NET_IPGRE_BROADCAST
 	if (ipv4_is_multicast(ip_hdr(skb)->daddr)) {
@@ -451,25 +450,26 @@ static int gre_rcv(struct sk_buff *skb)
 	}
 #endif
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IP), 0);
-	if (hdr_len < 0)
+	reason = gre_parse_header(skb, &tpi, false, htons(ETH_P_IP), 0);
+	if (reason)
 		goto drop;
+	reason = SKB_DROP_REASON_NOT_SPECIFIED;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
 
-	if (ipgre_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+	if (ipgre_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 		return 0;
 
 out:
 	icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index c851af22b9fe..d36949cbe9fa 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -389,8 +389,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	struct tnl_ptk_info tpi;
 	struct ip6_tnl *t;
 
-	if (gre_parse_header(skb, &tpi, NULL, htons(ETH_P_IPV6),
-			     offset) < 0)
+	if (gre_parse_header(skb, &tpi, true, htons(ETH_P_IPV6),
+			     offset))
 		return -EINVAL;
 
 	ipv6h = (const struct ipv6hdr *)skb->data;
@@ -566,20 +566,20 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
-	int hdr_len;
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IPV6), 0);
-	if (hdr_len < 0)
+	reason = gre_parse_header(skb, &tpi, false, htons(ETH_P_IPV6), 0);
+	if (reason)
 		goto drop;
+	reason = SKB_DROP_REASON_NOT_SPECIFIED;
 
-	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false))
+	if (iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false))
 		goto drop;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (ip6erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
@@ -591,7 +591,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmpv6_send(skb, ICMPV6_DEST_UNREACH, ICMPV6_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3


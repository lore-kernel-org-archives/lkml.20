Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964648;
	b=msrqwSbas4ENOYixs6kk8EcWEo/moSDsld9UHdwUjUfV5hJEXpTRNPqb5vQUWrwyNC/P
	 yhgHFG0UWIWq07pMQAAhJu8rKbIlt2VYeKIbMPxPIGTlEmpapKB3xZ66VHcnCd71dbNt7
	 04gKTRGFdGu3nwW98qOjmqdkT/1EvXAtYfQWJJ23knqirxe/lto9bhB33XHTZYgSDRAFH
	 PGlB8Tq5J1Ivo2sYzl3GyJZRDTBkXkG3TIbXTfDyHsDeLdK3gDfbV0BBje7CqalZht0e5
	 ZtdEZktQt26y02UOPfgZG21DW+12UtuaCqL9bpSMFJo0naw0QkywVCX/O9e6TILDcOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1+2xlM4ABVIyvOd+vxRkaruaEZYtpY8dRCSvRFGpXm4=;
	b=i6uZhiDDs1aWIe58DP//ZLsZRUZiHP3GOiOPDhMHmszoVm3/RYK4DtnKm77fT7Bku37W
	 Ga7DSFWBUnjaireGHm/RKkGw8/0EMGX5t7u63mGSdy2nIfSvxGX4JaUKJwWsVVR5JXYwq
	 68t0hEZdQZA/oW6Lgl2xMggKXCTmU0NjZQ76xn9WrPo/eELBYJI0p8F6vq+G1QtCKPMOQ
	 d4FlwexZ3CuuzOGOxxjJWaTIqwCuLOe8PGC5DFWIWs1mquprAJlKfrb8ncXBVV/CvCoyX
	 WYFNt9gnMFbZr/BietWESBp7IFSljY/SQ/9WcQYD+Q/qRwtMiYUQ0U50h0lxJU31BQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pWTxfZ/k";
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC160A2610
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFC160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWTxfZ/k
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b33de9d2b1so3154177b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964642; x=1794569442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+2xlM4ABVIyvOd+vxRkaruaEZYtpY8dRCSvRFGpXm4=;
        b=pWTxfZ/kgOaGexZ7R8N+u2fNFn7zqjGqvQ85fkkzdSZsuT54ZbVhtwJEFeV9BUvA2J
         yWdyNs7ZLpn6QyCuExj3iZJ0apc9Gyk8ewajhj/VW0iB8yqt7+82Xe9w+8vpcyieQiAF
         2oArjSo3ILuGJun1mqTSFdnCNoFlY+m0YyrLiWoaLLJuT6Y0GcSjUPsSejMNYrH0D+xf
         bk1ghvUC627uZt2QIzk7tgBwCkcXpzEivn4417hzPiV//NabUuKPO7OEAxB9OO5D5nXE
         1tvhYy/VwpQPOkP2LFzXkEmcCpnfrJCJEBQdSCEj35cZ4DT3p79lFtsnvnJKHUzs7EPf
         RGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964642; x=1794569442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+2xlM4ABVIyvOd+vxRkaruaEZYtpY8dRCSvRFGpXm4=;
        b=VY1j7vhtJj6MtjeutM2MBLpLglqC1vGovgco+rtnWlYyTs6MsalIZMLmWaxU7iCl0Y
         OpOJQNTlcRx/HrBTwD4Ffxr9C2XB4GlOF+ZPhMYFzXkIOwu2yP16d5aoU4E1d69X/VHU
         fAGXp/ERO0WQYNICPFMA3wEMwOHE1ppYPMaIV0hMXBfVBI1MbgGnEk6v7bUD2lr/+3wA
         fygm65KUJRiJVoHBMxcsluYuUZTpKJ3EpTFWB43qiGdLKDua2IckEoVKn+hKaTCCFlYj
         xfsuXObcko618C/vVx90AkUuxCck8BG6IsKOXdcRI9J28BmOmfxcOHOaabpFWerwTzMN
         P3Pg==
X-Forwarded-Encrypted: i=1; AL+hErGljlsuylvhnD0z7sAGl4sCNv11eXOtFWsB/j3roefG/w5WMGJal58w9W3aj1WqMsZyFsujRNeI6gOfeZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2ze363yxX5xRdK5W8m8cS113XXYKbKGVTp7HATWcJHkhtErB7
	s15uOXw4B0QjNzDLSTEDuUqvIA8x1RepX5XFQq9q0VjxCcMoPszcdoOm
X-Gm-Gg: AYBFou3i1OIN5QwLUPKiNf0LCeYpfUaErh2Z4AHmc0Nqk321rONNd9BEPO3OZXpLBSd
	fC3mkin7mM1/JQBL62fKuwMccTllSJhiF7jAXL1i7ATslBz9sO5ebxwRFdMLxZdO8IELBIzi76Z
	L27jkIkpdTThJKBQNWofnXmEkQ6eX8qvqhouD3To/PvYdVnQFGsMT+h4wtZ7td2j3Kdt8Lj2NAf
	5Jxb6dLClNOwvi9AcqT4L5H7CZdKSXofQToO+zXixxhhsMH5E+FOpLNQP4JPcfRhjUuYFExGJ5+
	QKgq/RgmaP5iVsMFqEg2BtR7KttY+gyNkI37cUGSqxWyMzpFgHyx4UbVq0Bj4K8G2a882FUQPCG
	/0n2kzNlCQzW0YDftXcTY2siHjPKCx+qwfd/+3adqyfxyzaloiqwUvjH27ykvDUMRys8IKuGUZl
	6A9Z63v6YCiaNj5mii3hBnMu9oIbAQzw2QyL407ICXlYpCMd9A/GW4iIKnPXDyi37faItyf+wQV
	tatlM4Ezisn3XrRJ6tvhpI/JkwQJk9EEeFjrnKbRBEDqJR0HqMdmxHyvkIIDoPvV/gUfTaIU/oY
	GzVBC6lq427huG/HRd8EWF8=
X-Received: by 2002:a05:690c:5c0d:b0:8b3:2a74:e0de with SMTP id 00721157ae682-8b34178fbeamr7942267b3.14.1793964642364;
        Fri, 06 Nov 2026 03:30:42 -0800 (PST)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f5243sm16883077b3.3.2026.11.06.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:41 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 06 Nov 2026 03:30:08 -0800
Subject: [PATCH net-next 4/6] eth: mpnic: UDP segmentation offload
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-mpnic-lso-v1-4-e943ff1493e4@gmail.com>
References: <20261106-mpnic-lso-v1-0-e943ff1493e4@gmail.com>
In-Reply-To: <20261106-mpnic-lso-v1-0-e943ff1493e4@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Support segmentation of non-encapsulated udp4/udp6 packets. Like for
tcp, the segmentation engine expects the udp csum to be seeded with 0
length.

The HW inverts UDP checksums computed as 0 during segmentation.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  2 ++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  1 +
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  3 ++-
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 33 +++++++++++++++++++-------
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 672ce0a98c22..2cd627d62bf5 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -20,6 +20,7 @@
 #define MPNIC_TWD_L4_TYPE		DESC_GENMASK(33, 32)
 enum {
 	MPNIC_TWD_L4_TYPE_TCP	= 1,
+	MPNIC_TWD_L4_TYPE_UDP	= 2,
 };
 
 #define MPNIC_TWD_FLAG_REQ_LSO		DESC_BIT(35)
@@ -335,6 +336,7 @@ enum {
 
 #define MPNIC_TOF_MODE_IPV4_ZERO_CSUM		CSR_BIT(1)
 #define MPNIC_TOF_MODE_TCP_ZERO_CSUM		CSR_BIT(2)
+#define MPNIC_TOF_MODE_UDP_ZERO_CSUM		CSR_BIT(3)
 #define MPNIC_TOF_MODE_L4_ZERO_CSUM		CSR_BIT(4)
 #define MPNIC_TOF_TCP_FLAG_CLR		0x7e3030		/* 0x1f8c0c0 */
 #define MPNIC_TOF_TCP_FLAG_CLR_FIRST_SEGMENT	CSR_GENMASK(8, 0)
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
index b9a41656f8f7..ab832ec5de0e 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
@@ -304,6 +304,7 @@ static void mpnic_txglb_init(struct mpnic_dev *mpd)
 			      MPNIC_IPV4_ID_MODE_INCREMENT) |
 		   FIELD_PREP(MPNIC_TOF_MODE_IPV4_ZERO_CSUM, 1) |
 		   FIELD_PREP(MPNIC_TOF_MODE_TCP_ZERO_CSUM, 1) |
+		   FIELD_PREP(MPNIC_TOF_MODE_UDP_ZERO_CSUM, 0) |
 		   FIELD_PREP(MPNIC_TOF_MODE_L4_ZERO_CSUM, 0));
 	mpnic_wr64(mpd, MPNIC_TOF_TCP_FLAG_CLR,
 		   FIELD_PREP(MPNIC_TOF_TCP_FLAG_CLR_FIRST_SEGMENT,
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 3a4aa5be57a1..83be45031a30 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -331,7 +331,8 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 		NETIF_F_RXCSUM |
 		NETIF_F_TSO |
 		NETIF_F_TSO_ECN |
-		NETIF_F_TSO6;
+		NETIF_F_TSO6 |
+		NETIF_F_GSO_UDP_L4;
 
 	netdev->hw_features |= netdev->features;
 	netdev->vlan_features |= netdev->features;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index e2e6ab6d3c59..9dd61b6d374c 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -223,29 +223,44 @@ static void mpnic_tx_fill_hdrs(struct sk_buff *skb, struct mpnic_tx_hdrs *hdrs)
 		return;
 	}
 
-	hdrs->l4_type = MPNIC_TWD_L4_TYPE_TCP;
+	if (skb_shinfo(skb)->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))
+		hdrs->l4_type = MPNIC_TWD_L4_TYPE_TCP;
+	else
+		hdrs->l4_type = MPNIC_TWD_L4_TYPE_UDP;
+
 	hdrs->i3len = skb_transport_offset(skb) - skb_network_offset(skb);
 	hdrs->l3_type = ip_hdr(skb)->version == 4 ?
 			MPNIC_TWD_L3_TYPE_IPV4 : MPNIC_TWD_L3_TYPE_IPV6;
 }
 
 static bool
-mpnic_tx_lso(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
+mpnic_tx_lso(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta,
+	     const struct mpnic_tx_hdrs *hdrs)
 {
 	struct skb_shared_info *shinfo;
 	unsigned int l4len, hdrlen;
-	struct tcphdr *tcph;
-	__be16 payload_len;
+	unsigned char *l4hdr;
 
 	if (skb_cow_head(skb, 0))
 		return true;
 
 	shinfo = skb_shinfo(skb);
+	l4hdr = skb_checksum_start(skb);
+
+	if (hdrs->l4_type == MPNIC_TWD_L4_TYPE_TCP) {
+		struct tcphdr *tcph = (struct tcphdr *)l4hdr;
+		__be16 payload_len;
 
-	tcph = (struct tcphdr *)skb_checksum_start(skb);
-	l4len = __tcp_hdrlen(tcph);
-	payload_len = cpu_to_be16(skb->len - skb_checksum_start_offset(skb));
-	csum_replace_by_diff(&tcph->check, (__force __wsum)payload_len);
+		l4len = __tcp_hdrlen(tcph);
+		payload_len = cpu_to_be16(skb->len -
+					  skb_checksum_start_offset(skb));
+		csum_replace_by_diff(&tcph->check, (__force __wsum)payload_len);
+	} else {
+		struct udphdr *udph = (struct udphdr *)l4hdr;
+
+		l4len = sizeof(*udph);
+		csum_replace_by_diff(&udph->check, (__force __wsum)udph->len);
+	}
 
 	*meta |= cpu_to_le64(FIELD_PREP(MPNIC_TWD_L4_HLEN, l4len / 4) |
 			     FIELD_PREP(MPNIC_TWD_MSS, shinfo->gso_size) |
@@ -277,7 +292,7 @@ mpnic_tx_offloads(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 					skb->csum_offset / 2));
 
 	if (skb_is_gso(skb)) {
-		if (mpnic_tx_lso(ring, skb, meta))
+		if (mpnic_tx_lso(ring, skb, meta, &hdrs))
 			return true;
 	} else {
 		*meta |= cpu_to_le64(MPNIC_TWD_FLAG_REQ_CSO);

-- 
2.52.0


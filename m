Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348417;
	b=DDQ9ahE9c47P3+rMuAicgfqyACBuvsYWf/eGB6Y5JZzRkzqm4YESLtEizByBJxWSt0ta
	 TNIEx9nYcTJvJjbIn1gXwZL+GDp8nw84RJfLsxwAJmCdyrGCIzP/Tvsn6UM6pm7iogHZ3
	 7KICxGbBYM0i2d+NNIduOKtqdLH77DTxsSWKMoG/mxLUFKx5Ig7MhkZ+olwOlv5RmmT/G
	 k92ajVUIm7GBhmuUppMauFdz9Ja3UvG75VoEj4PhMhudtzTRbLh28/IuA57/E2RCpbARM
	 o8X5Lw3lJKIvMx89Zhqm5YAFds+j4SIc8cBg7D8vXUyJaxwibiLOHs5OmpfnAtZtJSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8Q93oeh1L0KA6JGez1rg80hL+KIbW3yolr0N99bCVZ4=;
	b=V3GVlTaATHsUIq1GZ1A2Wbi531H0fVQbXnIc9n5wcWcmDjElKoxG63ITD7Cn/3ULkqRK
	 A+4Vy0GtM2oMFFpYnGgAiV3GJVZDtAsyS9aYXNvDD+PmH1CV8h5pnDDpvc2GVs8KlJGyS
	 rIWkI8BiVPFv+HmY/isRMRa7150oji3PBZ7EY8QmM/7DCYBARyVCgYxwPJLS1Ai1sUusN
	 lOUv01LMzTtYIS6bjTBRb6iT7I/vCDxLlETLaBLD/mcyEMCn7IOqkIdrCge9XeCYKpuMD
	 W+hJzbIQOYKAMSoSxO6iOnmbzaWfl3R7QnXLUEoc2gAit1u71EZDyNT8rZk7KiLN8Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj8MvWXQ;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38ED60A381F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38ED60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj8MvWXQ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b315dd057bso19941197b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348416; x=1794953216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q93oeh1L0KA6JGez1rg80hL+KIbW3yolr0N99bCVZ4=;
        b=jj8MvWXQ2hHXgayXt1+hIWo82UTWLUX4ssuhLNOXY3gE6+zMMEktUxzxlvSu7p6H1w
         L+0Klk6BuOvYHCnQgefVa2G1FouALQmWQMPsqRj1w1xh1EWLvUgCzWtXpQSxETfUH0NR
         uUAGq8kfPHPF+qWa8lHNqkQka0BETfedUCcovYRwEnydmYVBMnz6woHe7B9E9hlcTqy2
         tW3Cw/aAtvIrjprjzOG39MrdGQOVxLu22EhoyOIPBnLs+im9BQ87Di0EGXoyQf7Wkajo
         /Pm0yIPv4MB3HjF4xMNXa7mP+Y8b8vNENp2E2v2SIcEbjSFRvVO+h7MAEi9UIZSRmYGO
         dKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348416; x=1794953216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Q93oeh1L0KA6JGez1rg80hL+KIbW3yolr0N99bCVZ4=;
        b=0Hi93eJvL3vtAlTb53ep+xZdznj9gMRkdoAm7bc6bxUBTFMuP1bnPO6Ky6ZBFRNws6
         8u15tXXMemCaxVAwQ7XZORu/KYcdodQM30hjiWxvNnuxfwqL3mW7i/5NJwm4abRCMs1Q
         FLei5njZfsiHk0K0B/ExKrm5Yr5zlse8gpv9l7b3ddl1bD4/BVKw2pro930fc+4s0Wio
         G+DD4J7kQmrF/sSMNM81Jx+IaiA8ellW++0f/DPiUW43Ygy+ikT90wt6ZS5yzc/j65xk
         +M31ZZDsrpb1b0Ihy+Lq+Z6BJ+wF3OVOJCd9VR7dn+jEiV8n7vLwOn1SKvJK/rtdP5Xd
         /0sw==
X-Forwarded-Encrypted: i=1; AL+hErFVdqYI2LuT7l1BNbh8xHqZt02679VtWOIOzZST7cJ9/jQUUstrbtINlMIcR9F0pCPSFSvliF9D4pk0/Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jG259d3Gfp1l9VXPbT/nSbH2UdamFdY6xnJfn/VejwRjbWGcq
	2akD+Doh3P4Udj0PE4a5N6RoNcA1Do27a0K+NTJEglczl4ZhNDLAG15U
X-Gm-Gg: AYBFou0zXJEDOhpwl5GG3pZ2QHQT2jCMH8DhnTQ2rYJhSj55eS7PtvPYT9fzJLU3PJA
	xU4jgQnw++47+RPgTPa3qopdETLM6svHDmvI1sao/CHUK37TxhyF1U1aBSJYk8g3sHt5wWdYLun
	KVd6mHwq6L7ckqa0kYfg6q45ykM2c6jTgSOnR6SM7kgB5Sn5XzSTsB+sCzrmhdeOTGo+MU+zpUm
	mTaWkn0U6sloGM7HXUuEpu0S5Jk0912zNVAD+73xnXlsFnDmb+xi4hZWg9XA+aDMmkyS01Vk1bN
	U+t1oSitfjPtQ9+oTBS+96MzsfHysGlx5dBEUJ1S+qSlK19S32lxL6n+vxBd+HDggGCE0NxIs95
	2V8X0MmFN0o3bFCHIi9lVcx/evvDlZeEeiJHz0Acwf0toQsRXLNVlVGm/yMxB9O2gJzPnnn770o
	q10juYf6hh9O8bo1/usm9ffEssrzmtWhgjUnEi1EJGBt8vBdTqwbprn52xkaqE1oMDUSPsjgFls
	nGR4tM6nzaHqLXCMafKtXYmeJhmPqxj0VoHpUWhQgKwuu8nJg8Hkogiv8bZbvJOfByluRQ1FYNf
	+p2zzVFrILnLBNmtkQBEPBdOCgg=
X-Received: by 2002:a05:690c:580c:b0:8b3:5a91:61e8 with SMTP id 00721157ae682-8b3a820eda8mr4166437b3.69.1794348415928;
        Tue, 10 Nov 2026 14:06:55 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934542bdsm30063897b3.38.2026.11.10.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:06:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 10 Nov 2026 14:06:38 -0800
Subject: [PATCH net-next v2 5/6] eth: mpnic: IPv4 and IPv6 in IPv6 tunnel
 segmentation
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
Message-Id: <20261110-mpnic-lso-v2-5-ccd37b051d08@gmail.com>
References: <20261110-mpnic-lso-v2-0-ccd37b051d08@gmail.com>
In-Reply-To: <20261110-mpnic-lso-v2-0-ccd37b051d08@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

The device can fully segment 4-in-6 and 6-in-6 packet types. Add
mpnic_features_check_encap_gso() to check the skb for some additional
constraints, such as ip6 non-atomic frag ext header.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- derive inner L3 header length from csum_start rather than
  inner_transport_header, which can be stale for DODGY skbs
- check the outer header is IPv6 in mpnic_ipxip6_gso_ok(), since
  SKB_GSO_IPXIP6 can be set by a nested tunnel under an IPv4 outer
- move hw_enc_features setup to the Tx checksum offload patch
---
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  3 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  1 +
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 53 ++++++++++++++++++++++++--
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 2cd627d62bf5..63282916eb13 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -14,6 +14,7 @@
 
 /* Transmit Work Descriptor Format */
 #define MPNIC_TWD_L2_HLEN		DESC_GENMASK(5, 0)
+#define MPNIC_TWD_L3_OHLEN		DESC_GENMASK(15, 8)
 #define MPNIC_TWD_L3_IHLEN		DESC_GENMASK(23, 16)
 #define MPNIC_TWD_CSUM_OFFSET		DESC_GENMASK(27, 24)
 #define MPNIC_TWD_L4_HLEN		DESC_GENMASK(31, 28)
@@ -30,6 +31,8 @@ enum {
 enum {
 	MPNIC_TWD_L3_TYPE_IPV4	= 1,
 	MPNIC_TWD_L3_TYPE_IPV6	= 2,
+	MPNIC_TWD_L3_TYPE_V6V6	= 3,
+	MPNIC_TWD_L3_TYPE_V6V4	= 4,
 };
 
 #define MPNIC_TWD_FLAG_DEST_MAC		DESC_BIT(43)
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index bf3b459ba5be..032a5ee92a08 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -323,6 +323,7 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 	mpn->num_napi = queues;
 
 	netdev->features |=
+		NETIF_F_GSO_IPXIP6 |
 		NETIF_F_SG |
 		NETIF_F_HW_CSUM |
 		NETIF_F_RXCSUM |
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index 2a0560b7dd19..839feb4716b6 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -22,6 +22,7 @@ struct mpnic_xmit_cb {
 
 struct mpnic_tx_hdrs {
 	unsigned int i3len;
+	unsigned int o3len;
 	unsigned int l3_type;
 	unsigned int l4_type;
 };
@@ -218,6 +219,9 @@ mpnic_tx_map(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 
 static void mpnic_tx_fill_hdrs(struct sk_buff *skb, struct mpnic_tx_hdrs *hdrs)
 {
+	unsigned int net_off = skb_network_offset(skb);
+	unsigned int inner_off;
+
 	if (!skb_is_gso(skb)) {
 		hdrs->i3len = skb_checksum_start(skb) - skb_network_header(skb);
 		return;
@@ -228,9 +232,17 @@ static void mpnic_tx_fill_hdrs(struct sk_buff *skb, struct mpnic_tx_hdrs *hdrs)
 	else
 		hdrs->l4_type = MPNIC_TWD_L4_TYPE_UDP;
 
-	hdrs->i3len = skb_transport_offset(skb) - skb_network_offset(skb);
-	hdrs->l3_type = ip_hdr(skb)->version == 4 ?
-			MPNIC_TWD_L3_TYPE_IPV4 : MPNIC_TWD_L3_TYPE_IPV6;
+	if (!skb->encapsulation) {
+		hdrs->i3len = skb_transport_offset(skb) - net_off;
+		hdrs->l3_type = ip_hdr(skb)->version == 4 ?
+				MPNIC_TWD_L3_TYPE_IPV4 : MPNIC_TWD_L3_TYPE_IPV6;
+	} else {
+		inner_off = skb_inner_network_offset(skb);
+		hdrs->o3len = inner_off - net_off;
+		hdrs->i3len = skb_checksum_start_offset(skb) - inner_off;
+		hdrs->l3_type = inner_ip_hdr(skb)->version == 4 ?
+				MPNIC_TWD_L3_TYPE_V6V4 : MPNIC_TWD_L3_TYPE_V6V6;
+	}
 }
 
 static bool
@@ -304,6 +316,7 @@ mpnic_tx_offloads(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 	*meta |= cpu_to_le64(FIELD_PREP(MPNIC_TWD_L2_HLEN,
 					skb_mac_header_len(skb) / 2) |
 			     FIELD_PREP(MPNIC_TWD_L3_IHLEN, hdrs.i3len / 2) |
+			     FIELD_PREP(MPNIC_TWD_L3_OHLEN, hdrs.o3len / 2) |
 			     FIELD_PREP(MPNIC_TWD_L3_TYPE, hdrs.l3_type) |
 			     FIELD_PREP(MPNIC_TWD_L4_TYPE, hdrs.l4_type));
 
@@ -362,6 +375,35 @@ netdev_tx_t mpnic_xmit_frame(struct sk_buff *skb, struct net_device *dev)
 	return mpnic_xmit_frame_ring(skb, mpn->tx[skb_get_queue_mapping(skb)]);
 }
 
+static bool mpnic_ipxip6_gso_ok(struct sk_buff *skb)
+{
+	struct ipv6hdr *ip6h;
+	__be16 frag_off;
+	u8 nexthdr;
+	int start;
+
+	ip6h = ipv6_hdr(skb);
+	if (ip6h->version != 6)
+		return false;
+
+	nexthdr = ip6h->nexthdr;
+	start = skb_network_offset(skb) + sizeof(*ip6h);
+	start = ipv6_skip_exthdr(skb, start, &nexthdr, &frag_off);
+
+	return !frag_off && start == skb_inner_network_offset(skb) &&
+	       (nexthdr == IPPROTO_IPV6 || nexthdr == IPPROTO_IPIP);
+}
+
+static netdev_features_t
+mpnic_features_check_encap_gso(struct sk_buff *skb, netdev_features_t features)
+{
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP6 &&
+	    mpnic_ipxip6_gso_ok(skb))
+		return features;
+
+	return features & ~NETIF_F_GSO_IPXIP6;
+}
+
 netdev_features_t mpnic_features_check(struct sk_buff *skb,
 				       struct net_device *dev,
 				       netdev_features_t features)
@@ -388,7 +430,10 @@ netdev_features_t mpnic_features_check(struct sk_buff *skb,
 	     !FIELD_FIT(MPNIC_TWD_MSS, skb_shinfo(skb)->gso_size)))
 		return features & ~NETIF_F_GSO_MASK;
 
-	return features;
+	if (!skb->encapsulation || !skb_is_gso(skb))
+		return features;
+
+	return mpnic_features_check_encap_gso(skb, features);
 }
 
 static void mpnic_clean_twq0(struct mpnic_napi_vector *nv, int napi_budget,

-- 
2.52.0


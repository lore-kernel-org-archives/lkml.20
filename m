Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348413;
	b=kkggOezikoxDig25d5D6LJ00CeOgdoRNMmdW7b6/YbMlyaDUvan6bjTw6CYLc4Wt1eYq
	 HXmAbICUy3tnjyOy1E3GU3B10CsZXIgihbMqHP1+iYlQrnlr/y/hG1OYV/ojCqX319Od4
	 I8DstUAo3E/+qkLt5wwWUVOU3mMnd2yaXqX3TAO5FS+7Bu3gPsiQ+8hMw5oyXec0P4hGJ
	 qnOyZVOVplCQ7pG1bQnD9btSL9vsUQGer7qXD6/Msup3CJY8DeIq3GGDx92NvR2zn8fEw
	 k5rg0Q2ccesTgv6lA8qzKalv1CPNsflI447S/fiSj9NJFeLnret85cLxl6GuOGmajXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fmbuOZzD+BaFyRyYGcDZqWrVRMkVzZsldzoQsSJcGGs=;
	b=bKxUhYxLGP8M9H+bgAioHd10YX1PimgGXgaRwSbd0buKXS/sQeS5Wp3Umbwlg4TAAwPI
	 +wRIG8F2xyElJ4zIsKZLGkTQihW13eelZBLopREfN0Gku5ioiF/Ryoia3bGobHPLGfXRN
	 G0UBtg/tNYIimcWei3pywjfZFeqS9lR5zEFHEc+ekcgajqelIoYEAplMxU8Im5F4uZKoT
	 YHleMF9wcfqcoNaLVNhGNjWY+0QMDWLdM7lDIxPl+HrquGmpn86tBf8FeHpuXn3GAu78e
	 OUfdSxmh3DOF0hQBPs6DNH58omZc96PndMRkeXgnylGtNDiVDYmMv56dFi4IX3jobog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLY5ZFQx;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6B60A2626
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C6B60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLY5ZFQx
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b394e2af9cso9661247b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348411; x=1794953211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmbuOZzD+BaFyRyYGcDZqWrVRMkVzZsldzoQsSJcGGs=;
        b=pLY5ZFQxAx/pw+HzLwLrocU8KSStJAFB/CVSpHSzbR5Bg76SKnEkbSTA5lmr66XwJF
         EpLR3bdsuL/w3h903Lyg/IyZKZCgKWc9AZEh8PmtGVg19HbJA4kZdj4IAI/5RB7GjBGh
         +MyyN7tlxTd3t+pcDhZX3lF4sD1t5ltXT+QoxHZ4OWhf2xMVNj0YpJvLfrxam5qebqQf
         SRYbbpwokwJ5g1AIY++i1CoO2vgL62Gn12kRYFJ0y/9zlqhrSSwJYU6kHsImbKVX/ZVy
         aFUe7KCSQ2SGkTMFVgHf8H6AQsZ+F/Dxt7Bu2oygyYrNSqu4NhDmUDcMu9WrudwcSCXN
         LFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348411; x=1794953211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmbuOZzD+BaFyRyYGcDZqWrVRMkVzZsldzoQsSJcGGs=;
        b=DKJSZNnsCR6dqR3eBLWwV/hxmjYiAIMI9tmJHL/J0gLWHJM3EpS3MYow3elFnnvFQ+
         9IEo+yMDyv0s6K7aDfizDIdsfjl+yGaeRKTnHW3CF747BzqEChL+DUCwi1heEj6gUcSO
         kxSmRky3hEo78kLYVzwkMyGWCvsq/HB8QkJo+OHRodmRcO0kXjOCoLYUoq3zdAhjMzsF
         n7Fz1NvaC55KGGP/5FgcXLL29QpiuhhVuMNsjASdUxICdeaUfwxwxQTjoCDlCWki45qc
         ipB8tLBFCowT/xTNxt6lTm81xhgMZLAq8vl+FsK7NdtnwWS4OQ6dpJ1pcUu6OrrMcOJe
         BfjQ==
X-Forwarded-Encrypted: i=1; AL+hErFuGfktPMDgvbo/LSrOye6qUViXfYVizbqtuKAoCmPNqGOmOIW4usvUryTSWomznGp6/fP8Lw3rLq0p6OM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vMMJUFCGE7pTk8gHjkNZ+eJI+dKv5PyaXnZ1pyzXmVl5ophbG
	vFvAIefM2d4dcosaiGm7Y489zQwMxwuym6xW/y7Meji2UokSLzKMu2Z2
X-Gm-Gg: AYBFou3JLa5VBWixIHDYgclK6PJqWhleyqmpiGfnxQ4rZoSgiKtr68iS39KlbHsG9+S
	JqlYknit7gl0HraHT6i0jXWoGQdm94ivaQfJUr4kfAgAwMZsYSUB+55xiu9SXzz8DdG8/g7l+eQ
	UBFAS84OxJ/kpTx1ISwYZpgu0o8f4CsAh1k8oWkbFWItNZfq59KdxSp4lKEvUMED+4hCyL4Rd/r
	H7bzUg5tZXQt/YbprFJfwUOdXG9uV5qVIw+uJg95V9oBHioNq4DHfeZ/BDF5UZOA9BVZ/LAinmd
	zDEkqNm4rjxPLFuZnmX/BOHMaYzW1sMDQ3zsleY88bieu8yIqe7CWwgWB2qxsuEzso1mNyMAQag
	3+z2Qmw2e7IJn/hGaZnP1SBhnbizIVKxXMhI3ipPUNjSMTISKDdI/yxnt3HMoXjhBpRHsdOcOwl
	q5tyR2tQJk4Vn4UtpT3K6qR0+eqvHIyFTDwRfIDbwM8c/H2NOb1CJXdYmY4wUFrMJvMPJm9OteC
	UefItJTVyVfET12SeFpc9ZTAU+jXX3qjf7zo9+uBvsiwsniNd44D5KxQJbFu3qfxZvIDcQLuX7v
	BjtspvQUUiujJD6kPri0nXUVDQ==
X-Received: by 2002:a05:690c:dc6:b0:8b0:a8cf:f442 with SMTP id 00721157ae682-8b3a81bf5fbmr3984607b3.64.1794348411377;
        Tue, 10 Nov 2026 14:06:51 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39341d660sm29758877b3.31.2026.11.10.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:06:50 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 10 Nov 2026 14:06:36 -0800
Subject: [PATCH net-next v2 3/6] eth: mpnic: TCP segmentation offload
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
Message-Id: <20261110-mpnic-lso-v2-3-ccd37b051d08@gmail.com>
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

Support segmentation of non-encapsulated tcp4/tcp6 packets. When doing
segmentation the device expects the l4 checksum to be seeded with 0
length.

IPv4 header and TCP checksums that compute to zero are sent as 0 rather
than 0xffff when the HW segments packets. IPv4 IDs are incrementing
starting from the value that is in the skb's IPv4 header.

Count gso wire packets and report via the netdev qstats API.

Completions are counted in wire packets, but dropped TSO skbs are still
counted once per super packet, matching the core's per skb tx_dropped
accounting that gets summed into the same counter.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- count discarded skbs rather than segments in twq.dropped, matching
  the xmit error path and the core's tx_dropped
- report only hw_gso_wire_packets; drop the super-packet counter
---
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    | 27 ++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   | 11 ++++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 14 ++--
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |  1 +
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 88 ++++++++++++++++++++++----
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  1 +
 6 files changed, 125 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 1c86f114ab0c..672ce0a98c22 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -16,8 +16,21 @@
 #define MPNIC_TWD_L2_HLEN		DESC_GENMASK(5, 0)
 #define MPNIC_TWD_L3_IHLEN		DESC_GENMASK(23, 16)
 #define MPNIC_TWD_CSUM_OFFSET		DESC_GENMASK(27, 24)
+#define MPNIC_TWD_L4_HLEN		DESC_GENMASK(31, 28)
+#define MPNIC_TWD_L4_TYPE		DESC_GENMASK(33, 32)
+enum {
+	MPNIC_TWD_L4_TYPE_TCP	= 1,
+};
+
+#define MPNIC_TWD_FLAG_REQ_LSO		DESC_BIT(35)
 #define MPNIC_TWD_FLAG_REQ_CSO		DESC_BIT(36)
 #define MPNIC_TWD_FLAG_REQ_COMPLETION	DESC_BIT(37)
+#define MPNIC_TWD_L3_TYPE		DESC_GENMASK(42, 40)
+enum {
+	MPNIC_TWD_L3_TYPE_IPV4	= 1,
+	MPNIC_TWD_L3_TYPE_IPV6	= 2,
+};
+
 #define MPNIC_TWD_FLAG_DEST_MAC		DESC_BIT(43)
 #define MPNIC_TWD_TYPE			DESC_GENMASK(47, 46)
 enum {
@@ -26,6 +39,8 @@ enum {
 	MPNIC_TWD_TYPE_LAST_AL	= 3,
 };
 
+#define MPNIC_TWD_MSS			DESC_GENMASK(61, 48)
+
 #define MPNIC_TWD_ADDR			DESC_GENMASK(45, 0)
 #define MPNIC_TWD_LEN			DESC_GENMASK(63, 48)
 
@@ -312,7 +327,19 @@ enum {
 /* NIC_CORE_TOF */
 #define MPNIC_TOF_TCAM_DEST_REMAP	0x7e3022		/* 0x1f8c088 */
 #define MPNIC_TOF_MODE			0x7e302e		/* 0x1f8c0b8 */
+#define MPNIC_TOF_MODE_IPV4_ID_MODE		CSR_GENMASK(0, 0)
+enum {
+	MPNIC_IPV4_ID_MODE_FIXED	= 0,
+	MPNIC_IPV4_ID_MODE_INCREMENT	= 1,
+};
+
+#define MPNIC_TOF_MODE_IPV4_ZERO_CSUM		CSR_BIT(1)
+#define MPNIC_TOF_MODE_TCP_ZERO_CSUM		CSR_BIT(2)
 #define MPNIC_TOF_MODE_L4_ZERO_CSUM		CSR_BIT(4)
+#define MPNIC_TOF_TCP_FLAG_CLR		0x7e3030		/* 0x1f8c0c0 */
+#define MPNIC_TOF_TCP_FLAG_CLR_FIRST_SEGMENT	CSR_GENMASK(8, 0)
+#define MPNIC_TOF_TCP_FLAG_CLR_MIDDLE_SEGMENT	CSR_GENMASK(24, 16)
+#define MPNIC_TOF_TCP_FLAG_CLR_LAST_SEGMENT	CSR_GENMASK(40, 32)
 
 /* PEMO_WRAPPER */
 #define MPNIC_OB_ATTR_RO			CSR_BIT(1)
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
index 71d13bec7ec4..b9a41656f8f7 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
@@ -8,6 +8,7 @@
 #include <linux/iopoll.h>
 #include <linux/log2.h>
 #include <linux/sizes.h>
+#include <net/tcp.h>
 
 #include "mpnic.h"
 #include "mpnic_txrx.h"
@@ -299,7 +300,17 @@ static void mpnic_txglb_init(struct mpnic_dev *mpd)
 	 */
 	mpnic_wr64(mpd, MPNIC_TOF_TCAM_DEST_REMAP, 0);
 	mpnic_wr64(mpd, MPNIC_TOF_MODE,
+		   FIELD_PREP(MPNIC_TOF_MODE_IPV4_ID_MODE,
+			      MPNIC_IPV4_ID_MODE_INCREMENT) |
+		   FIELD_PREP(MPNIC_TOF_MODE_IPV4_ZERO_CSUM, 1) |
+		   FIELD_PREP(MPNIC_TOF_MODE_TCP_ZERO_CSUM, 1) |
 		   FIELD_PREP(MPNIC_TOF_MODE_L4_ZERO_CSUM, 0));
+	mpnic_wr64(mpd, MPNIC_TOF_TCP_FLAG_CLR,
+		   FIELD_PREP(MPNIC_TOF_TCP_FLAG_CLR_FIRST_SEGMENT,
+			      TCPHDR_PSH | TCPHDR_FIN) |
+		   FIELD_PREP(MPNIC_TOF_TCP_FLAG_CLR_MIDDLE_SEGMENT,
+			      TCPHDR_PSH | TCPHDR_CWR | TCPHDR_FIN) |
+		   FIELD_PREP(MPNIC_TOF_TCP_FLAG_CLR_LAST_SEGMENT, TCPHDR_CWR));
 
 	mpnic_wr64(mpd, MPNIC_TCM_MEM_INIT_REQ, MPNIC_MEM_INIT_TCM_VAL);
 	mpnic_wr64(mpd, MPNIC_TDE_MEM_INIT_REQ, MPNIC_MEM_INIT_TDE_VAL);
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 35173f8999cb..bde327ad3154 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -207,9 +207,9 @@ static void mpnic_get_queue_stats_tx(struct net_device *dev, int idx,
 	struct mpnic_ring *txr = mpn->tx[idx];
 	struct mpnic_queue_stats *stats;
 	u64 bytes, packets, stop, wake;
+	u64 csum_partial, hw_gso_wire;
 	struct mpnic_q_triad *qt;
 	unsigned int start;
-	u64 csum_partial;
 
 	if (!txr)
 		return;
@@ -228,12 +228,14 @@ static void mpnic_get_queue_stats_tx(struct net_device *dev, int idx,
 	do {
 		start = u64_stats_fetch_begin(&stats->syncp);
 		csum_partial = u64_stats_read(&stats->twq.csum_partial);
+		hw_gso_wire = u64_stats_read(&stats->twq.hw_gso_wire);
 		stop = u64_stats_read(&stats->twq.stop);
 	} while (u64_stats_fetch_retry(&stats->syncp, start));
 
 	tx->bytes = bytes;
 	tx->packets = packets;
-	tx->needs_csum = csum_partial;
+	tx->needs_csum = csum_partial + hw_gso_wire;
+	tx->hw_gso_wire_packets = hw_gso_wire;
 	tx->stop = stop;
 	tx->wake = wake;
 }
@@ -249,7 +251,8 @@ static void mpnic_get_base_stats(struct net_device *dev,
 
 	tx->bytes = base->tx.bytes;
 	tx->packets = base->tx.packets;
-	tx->needs_csum = base->tx.csum_partial;
+	tx->needs_csum = base->tx.csum_partial + base->tx.hw_gso_wire;
+	tx->hw_gso_wire_packets = base->tx.hw_gso_wire;
 	tx->stop = base->tx.stop;
 	tx->wake = base->tx.wake;
 
@@ -322,7 +325,10 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 	netdev->features |=
 		NETIF_F_SG |
 		NETIF_F_HW_CSUM |
-		NETIF_F_RXCSUM;
+		NETIF_F_RXCSUM |
+		NETIF_F_TSO |
+		NETIF_F_TSO_ECN |
+		NETIF_F_TSO6;
 
 	netdev->hw_features |= netdev->features;
 	netdev->vlan_features |= netdev->features;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
index 76ec9811e79e..697b3ebb74b9 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
@@ -17,6 +17,7 @@ struct mpnic_base_stats {
 		u64 bytes;
 		u64 dropped;
 		u64 csum_partial;
+		u64 hw_gso_wire;
 		u64 stop;
 		u64 wake;
 	} tx;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index a35ce8998409..b78f8599bbe8 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -16,11 +16,14 @@
 
 struct mpnic_xmit_cb {
 	u32 bytecount;
+	u16 gso_segs;
 	u8 desc_count;
 };
 
 struct mpnic_tx_hdrs {
 	unsigned int i3len;
+	unsigned int l3_type;
+	unsigned int l4_type;
 };
 
 #define MPNIC_XMIT_CB(__skb) ((struct mpnic_xmit_cb *)((__skb)->cb))
@@ -215,30 +218,81 @@ mpnic_tx_map(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 
 static void mpnic_tx_fill_hdrs(struct sk_buff *skb, struct mpnic_tx_hdrs *hdrs)
 {
-	hdrs->i3len = skb_checksum_start(skb) - skb_network_header(skb);
+	if (!skb_is_gso(skb)) {
+		hdrs->i3len = skb_checksum_start(skb) - skb_network_header(skb);
+		return;
+	}
+
+	hdrs->l4_type = MPNIC_TWD_L4_TYPE_TCP;
+	hdrs->i3len = skb_transport_offset(skb) - skb_network_offset(skb);
+	hdrs->l3_type = ip_hdr(skb)->version == 4 ?
+			MPNIC_TWD_L3_TYPE_IPV4 : MPNIC_TWD_L3_TYPE_IPV6;
 }
 
-static void
+static bool
+mpnic_tx_lso(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
+{
+	struct skb_shared_info *shinfo;
+	unsigned int l4len, hdrlen;
+	struct tcphdr *tcph;
+	__be16 payload_len;
+
+	if (skb_cow_head(skb, 0))
+		return true;
+
+	shinfo = skb_shinfo(skb);
+
+	tcph = (struct tcphdr *)skb_checksum_start(skb);
+	l4len = __tcp_hdrlen(tcph);
+	payload_len = cpu_to_be16(skb->len - skb_checksum_start_offset(skb));
+	csum_replace_by_diff(&tcph->check, (__force __wsum)payload_len);
+
+	*meta |= cpu_to_le64(FIELD_PREP(MPNIC_TWD_L4_HLEN, l4len / 4) |
+			     FIELD_PREP(MPNIC_TWD_MSS, shinfo->gso_size) |
+			     MPNIC_TWD_FLAG_REQ_LSO);
+
+	hdrlen = skb_checksum_start_offset(skb) + l4len;
+	MPNIC_XMIT_CB(skb)->bytecount += (shinfo->gso_segs - 1) * hdrlen;
+	MPNIC_XMIT_CB(skb)->gso_segs = shinfo->gso_segs;
+
+	u64_stats_update_begin(&ring->stats.syncp);
+	u64_stats_add(&ring->stats.twq.hw_gso_wire, shinfo->gso_segs);
+	u64_stats_update_end(&ring->stats.syncp);
+
+	return false;
+}
+
+static bool
 mpnic_tx_offloads(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 {
 	struct mpnic_tx_hdrs hdrs = {};
 
 	if (skb->ip_summed != CHECKSUM_PARTIAL)
-		return;
+		return false;
 
 	mpnic_tx_fill_hdrs(skb, &hdrs);
 
 	*meta |= cpu_to_le64(FIELD_PREP(MPNIC_TWD_CSUM_OFFSET,
-					skb->csum_offset / 2) |
-			     MPNIC_TWD_FLAG_REQ_CSO);
+					skb->csum_offset / 2));
 
-	u64_stats_update_begin(&ring->stats.syncp);
-	u64_stats_inc(&ring->stats.twq.csum_partial);
-	u64_stats_update_end(&ring->stats.syncp);
+	if (skb_is_gso(skb)) {
+		if (mpnic_tx_lso(ring, skb, meta))
+			return true;
+	} else {
+		*meta |= cpu_to_le64(MPNIC_TWD_FLAG_REQ_CSO);
+
+		u64_stats_update_begin(&ring->stats.syncp);
+		u64_stats_inc(&ring->stats.twq.csum_partial);
+		u64_stats_update_end(&ring->stats.syncp);
+	}
 
 	*meta |= cpu_to_le64(FIELD_PREP(MPNIC_TWD_L2_HLEN,
 					skb_mac_header_len(skb) / 2) |
-			     FIELD_PREP(MPNIC_TWD_L3_IHLEN, hdrs.i3len / 2));
+			     FIELD_PREP(MPNIC_TWD_L3_IHLEN, hdrs.i3len / 2) |
+			     FIELD_PREP(MPNIC_TWD_L3_TYPE, hdrs.l3_type) |
+			     FIELD_PREP(MPNIC_TWD_L4_TYPE, hdrs.l4_type));
+
+	return false;
 }
 
 #define MPNIC_MIN_FRAME_LEN	60
@@ -261,9 +315,11 @@ static netdev_tx_t mpnic_xmit_frame_ring(struct sk_buff *skb,
 	*meta = cpu_to_le64(MPNIC_TWD_FLAG_DEST_MAC);
 
 	MPNIC_XMIT_CB(skb)->bytecount = skb->len;
+	MPNIC_XMIT_CB(skb)->gso_segs = 1;
 	MPNIC_XMIT_CB(skb)->desc_count = 0;
 
-	mpnic_tx_offloads(ring, skb, meta);
+	if (mpnic_tx_offloads(ring, skb, meta))
+		goto err_free;
 
 	if (mpnic_tx_map(ring, skb, meta))
 		goto err_free;
@@ -312,6 +368,10 @@ netdev_features_t mpnic_features_check(struct sk_buff *skb,
 	    l2len + i3len + sizeof(struct tcphdr) + MAX_TCP_OPTION_SPACE > 256)
 		return features & ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
 
+	if (skb_is_gso(skb) &&
+	    !FIELD_FIT(MPNIC_TWD_MSS, skb_shinfo(skb)->gso_size))
+		return features & ~NETIF_F_GSO_MASK;
+
 	return features;
 }
 
@@ -319,7 +379,7 @@ static void mpnic_clean_twq0(struct mpnic_napi_vector *nv, int napi_budget,
 			     struct mpnic_q_triad *qt, bool discard,
 			     unsigned int hw_head)
 {
-	u64 total_bytes = 0, total_packets = 0;
+	u64 total_bytes = 0, total_packets = 0, total_skbs = 0;
 	struct mpnic_ring *ring = &qt->sub0;
 	struct mpnic_ring *cmpl = &qt->cmpl;
 	unsigned int head = ring->head;
@@ -357,7 +417,8 @@ static void mpnic_clean_twq0(struct mpnic_napi_vector *nv, int napi_budget,
 		}
 
 		total_bytes += MPNIC_XMIT_CB(skb)->bytecount;
-		total_packets++;
+		total_packets += MPNIC_XMIT_CB(skb)->gso_segs;
+		total_skbs++;
 
 		napi_consume_skb(skb, napi_budget);
 	}
@@ -370,7 +431,7 @@ static void mpnic_clean_twq0(struct mpnic_napi_vector *nv, int napi_budget,
 	if (discard) {
 		local_bh_disable();
 		u64_stats_update_begin(&ring->stats.syncp);
-		u64_stats_add(&ring->stats.twq.dropped, total_packets);
+		u64_stats_add(&ring->stats.twq.dropped, total_skbs);
 		u64_stats_update_end(&ring->stats.syncp);
 		local_bh_enable();
 		return;
@@ -811,6 +872,7 @@ static void mpnic_aggregate_ring_twq_counters(struct mpnic_base_stats *base,
 {
 	base->tx.dropped += u64_stats_read(&twq->stats.twq.dropped);
 	base->tx.csum_partial += u64_stats_read(&twq->stats.twq.csum_partial);
+	base->tx.hw_gso_wire += u64_stats_read(&twq->stats.twq.hw_gso_wire);
 	base->tx.stop += u64_stats_read(&twq->stats.twq.stop);
 }
 
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
index 714f09f4160e..0d732ac4dde9 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
@@ -90,6 +90,7 @@ struct mpnic_queue_stats {
 		struct {
 			u64_stats_t dropped;
 			u64_stats_t csum_partial;
+			u64_stats_t hw_gso_wire;
 			u64_stats_t stop;
 		} twq;
 		struct {

-- 
2.52.0


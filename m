Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348410;
	b=5HoUaUydIkkNZdY2Q0Qxqns6lGyefXzmvzOCYSrWLZlELvIkrhvZUj0la3JPGkmRgJrR
	 JdpSAG8loQu5wlR1yvukUlL64GC3ruNSg0rRXqaP0CE+QzfhIiTs521ZuTAqhJ2E3Q/8g
	 9ZuNj0AeviX3ReZ0sO6Q5xVgl8hZbf+atknbQ+iONOVYXkB1Q1LmBv0D7yVxKwvegUKK5
	 2QCIhNvuNIi/xP1ZqBoScnaC/qzO6kdH9L1YbL+NIGxp7UcyS5wzDe06gjU1igEosIKuj
	 45/VGSfo0AyZ3o0AeKUzYPA1eoXHJeEqBJxWqkdJc+pB1EahuHJIsi7/yt97tNK8fOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+QvLLa7I+uphRNqXDX9jMoSv5QpfZqBR0O8uUyCRaYs=;
	b=bIQ5VwSEoQ9QrCh4CMW4Yzk8v06TPqon0jIBhDBG/TLml3ljB6Menvo5vTAbpImzOcF+
	 fqAYNO+nMdKNJDquUEZfZMhLpG/Akjs7ve7hke8RfEL7SvmUfkr1pAfV8Jao/ApwJ3fy5
	 ya5WyWgnC6OdcU5ZWOBWRFo488d4t8Gj90PblrGqdnLnX6QbJCRIMNyZkQ0zto4uPQCWO
	 Pa/5CK8Q6VEom34hUFCm5cmw5ivTWpV8eDOWJ7SbdfHkipSeTeea4rnlIKzrPbbVOiI3y
	 zJljFQtaaAdifN5gmH49o1dPoF9lflWBByE37uXlsnOTmBfythtF22xkrlI5PCWf2bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXsZA3Zh;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6F60A2613
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A6F60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXsZA3Zh
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b308fca7c3so25891297b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348409; x=1794953209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QvLLa7I+uphRNqXDX9jMoSv5QpfZqBR0O8uUyCRaYs=;
        b=TXsZA3Zhteqdrtu2m1TtwFnoNfPftY9gE88kR387P70lYUOcQ8rHpBeCB5pDjlabeR
         Jk23o3I5dwo/MPig0X08K59ZxVkO6kwy3LiIuuz9AkmgGxbQzLLE40cSezer7/3mJ0WW
         J3kjUgnn2Bkx0gP78xMavT2yNJQXf7Q9kDDQAnqUcfQ82FQb93lR9JCgg2Fi/plapWZw
         Tn5u9RRo2uXr0molTlWuM8V6xvyaCbI+iGnlekv9fZvrtOSeVQTxFQJjJ2SkvSboAN/C
         htuNVFqpF5VEns1enTHxwiiwLB4sDkn6PUT/aR726N5YNrLoaZEvkWirg+X1OaZdBYw/
         LwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348409; x=1794953209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QvLLa7I+uphRNqXDX9jMoSv5QpfZqBR0O8uUyCRaYs=;
        b=N4DvWVmGbB3/di6FElhuwyISoXfg15iR3SKBlim/7XwA9tI5l1VL0OAZ766l+SyWBP
         GIXdWLv5QAQ0nAgBT2jvNf/zV9n2KpssSvR/ZWGSKGeiL+w+9UArXlbUO6FqnSMV8Xpp
         IU8LjhYb8f6izDrJwD4HbuixHijph567WW5IOPXnYKW0hLsFsoGrokXuQsu1/dqs7mJm
         2+p+2XbwiDrQ3ZpL6ViWLDG6XX4knd49kfxjuM7N4xhEEKmV2Na9ptrtByAhwFjeJ5CG
         U2MQ9zNQoALhsREeT5mvXcEf15l2h9vWInBC6sLvJVdJSoGP1qdipII+8IhP2o1v326M
         0Dqg==
X-Forwarded-Encrypted: i=1; AL+hErGd+cArADF6aK8prE9cS1lbwZrHTK7l3bzLzOd0bMIie+Dq8Ct2hL0opcyFoOWS8INiRG8Oy3NuVFEXlbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxaSd31vqZs30/VKBUZXSrqkuGJMXEueI4BRNM8GEVVB/RgeZ
	eOg/pcJlkpmxxVffN/QK9KOzQ/qEj3kPO8GnFBR7dlbeLFe6klsLeXPy
X-Gm-Gg: AYBFou0l89Rfto/vrSLMt6CjG8ZvIyQFBGBBUOb6rzIh4jEpAfCSIIWli9dbH9OagYG
	/6kTkHj8VqXSSnl45klNAr+KijxdD7k52qs+QkkWe2iObybA5BaDd7sCTPLarAu31oBZkfsK1jC
	/Wyp+cgxornxIr41/CiSEdvMlJdqYulSM9fl9Y8DinD2qP/UVMRgcDw/NVM2fnpYDiRgF4cXZC8
	ceY5A9Lhe0isIkY8q0GJcgaRm69PGQHSoKyE7Q80p19rz7rbrRqLGtTkthnW5ofiJQBdnBlJOXK
	eDSD3iETW3rj/TzJBJpWHPAyE0cmLiyfkrPK4wFi21NX2CRYf9NsdcVLfb+gNNFEgtQyF3T6exk
	9oa2+dlK5pgC4Ah0gMpo/e2s1QSDASyb3qIAYUL7PoP1pES1ltadz95b5wueC0FDkoE9bTrFXbv
	fubSegAOOPrkWTSOKKl9Hn+rGPN1C4wNjcSvRbImtdJ8Mi6sXMhaCTDTRM3y2vSECHTdr3f2djA
	XHJtcDWVDs1QszTgAPwIV/NP+0Z16wXvgZKamy8tcwJLyHNCM0DRnOhIOCsBbXIg4tECEf9VegY
	Pu+xrIZvdREZXE7rEQ4hPBi7Fjw=
X-Received: by 2002:a05:690c:4f8e:10b0:8b3:27b8:2bd8 with SMTP id 00721157ae682-8b3a815b34dmr4624327b3.57.1794348409128;
        Tue, 10 Nov 2026 14:06:49 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a06c0sm30478297b3.13.2026.11.10.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:06:48 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 10 Nov 2026 14:06:35 -0800
Subject: [PATCH net-next v2 2/6] eth: mpnic: Rx checksum offload
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
Message-Id: <20261110-mpnic-lso-v2-2-ccd37b051d08@gmail.com>
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

The device reports two Rx completion fields to the driver related to
checksums: l2_csum and l4_csum_unnecessary. l2_csum is the ones'
complement sum of the frame starting from the end of the ethernet
header. l4_csum_unnecessary means the device validated the l4 checksum of
the packet. This is only supported for tcp or udp in
ipv4/ipv6/4-in-6/6-in-6.

Report checksum none/complete/unnecessary counts via netdev qstats API.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- convert l2_csum with cpu_to_le16() before csum_unfold(), since the
  device reports it in network byte order and skb->csum was wrong on
  big-endian hosts
---
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  2 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 14 ++++++++++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |  3 +++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 34 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  3 +++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 62304be203e6..1c86f114ab0c 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -60,6 +60,8 @@ enum {
 #define MPNIC_RCD_AL_PAGE_FIN		DESC_BIT(53)
 
 /* Metadata Completion Descriptors */
+#define MPNIC_RCD_META_L2_CSUM			DESC_GENMASK(47, 32)
+#define MPNIC_RCD_META_L4_CSUM_UNNECESSARY	DESC_BIT(52)
 #define MPNIC_RCD_META_ERR_MAC_EOP		DESC_BIT(53)
 #define MPNIC_RCD_META_ERR_TRUNCATED_FRAME	DESC_BIT(54)
 #define MPNIC_RCD_META_UNCORRECTABLE_ERR_MASK	\
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index d386672738fc..35173f8999cb 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -167,10 +167,12 @@ static void mpnic_get_queue_stats_rx(struct net_device *dev, int idx,
 {
 	struct mpnic_net *mpn = netdev_priv(dev);
 	struct mpnic_ring *rxr = mpn->rx[idx];
+	u64 csum_unnecessary, csum_complete;
 	u64 bytes, packets, alloc_failed;
 	struct mpnic_queue_stats *stats;
 	struct mpnic_q_triad *qt;
 	unsigned int start;
+	u64 csum_none;
 
 	if (!rxr)
 		return;
@@ -181,6 +183,9 @@ static void mpnic_get_queue_stats_rx(struct net_device *dev, int idx,
 		bytes = u64_stats_read(&stats->rcq.bytes);
 		packets = u64_stats_read(&stats->rcq.packets);
 		alloc_failed = u64_stats_read(&stats->rcq.alloc_failed);
+		csum_complete = u64_stats_read(&stats->rcq.csum_complete);
+		csum_unnecessary = u64_stats_read(&stats->rcq.csum_unnecessary);
+		csum_none = u64_stats_read(&stats->rcq.csum_none);
 	} while (u64_stats_fetch_retry(&stats->syncp, start));
 
 	qt = container_of(rxr, struct mpnic_q_triad, cmpl);
@@ -190,6 +195,9 @@ static void mpnic_get_queue_stats_rx(struct net_device *dev, int idx,
 	rx->bytes = bytes;
 	rx->packets = packets;
 	rx->alloc_fail = alloc_failed;
+	rx->csum_complete = csum_complete;
+	rx->csum_unnecessary = csum_unnecessary;
+	rx->csum_none = csum_none;
 }
 
 static void mpnic_get_queue_stats_tx(struct net_device *dev, int idx,
@@ -248,6 +256,9 @@ static void mpnic_get_base_stats(struct net_device *dev,
 	rx->bytes = base->rx.bytes;
 	rx->packets = base->rx.packets;
 	rx->alloc_fail = base->rx.alloc_failed;
+	rx->csum_complete = base->rx.csum_complete;
+	rx->csum_unnecessary = base->rx.csum_unnecessary;
+	rx->csum_none = base->rx.csum_none;
 }
 
 static const struct netdev_stat_ops mpnic_stat_ops = {
@@ -310,7 +321,8 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 
 	netdev->features |=
 		NETIF_F_SG |
-		NETIF_F_HW_CSUM;
+		NETIF_F_HW_CSUM |
+		NETIF_F_RXCSUM;
 
 	netdev->hw_features |= netdev->features;
 	netdev->vlan_features |= netdev->features;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
index 94f7a3355c5c..76ec9811e79e 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
@@ -26,6 +26,9 @@ struct mpnic_base_stats {
 		u64 dropped;
 		u64 alloc_failed;
 		u64 errors;
+		u64 csum_complete;
+		u64 csum_unnecessary;
+		u64 csum_none;
 	} rx;
 
 	unsigned int num_tx_queues;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index 65de6d999d54..a35ce8998409 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -655,9 +655,34 @@ static void mpnic_put_pkt_buff(struct mpnic_pkt_ctxt *ctxt, bool napi)
 	page_pool_put_full_page(page->pp, page, napi);
 }
 
+static void mpnic_rx_csum(u64 rcd, struct sk_buff *skb,
+			  unsigned int *csum_complete,
+			  unsigned int *csum_unnecessary,
+			  unsigned int *csum_none)
+{
+	skb_checksum_none_assert(skb);
+
+	if (!(skb->dev->features & NETIF_F_RXCSUM)) {
+		(*csum_none)++;
+		return;
+	}
+
+	if (FIELD_GET(MPNIC_RCD_META_L4_CSUM_UNNECESSARY, rcd)) {
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+		(*csum_unnecessary)++;
+	} else {
+		u16 csum = FIELD_GET(MPNIC_RCD_META_L2_CSUM, rcd);
+
+		skb->ip_summed = CHECKSUM_COMPLETE;
+		skb->csum = csum_unfold((__force __sum16)cpu_to_le16(csum));
+		(*csum_complete)++;
+	}
+}
+
 static int mpnic_clean_rcq(struct mpnic_napi_vector *nv,
 			   struct mpnic_q_triad *qt, int budget)
 {
+	unsigned int csum_complete = 0, csum_unnecessary = 0, csum_none = 0;
 	unsigned int packets = 0, bytes = 0, dropped = 0, errors = 0;
 	struct mpnic_ring *rcq = &qt->cmpl;
 	struct mpnic_rcq_state *state;
@@ -700,6 +725,8 @@ static int mpnic_clean_rcq(struct mpnic_napi_vector *nv,
 			}
 
 			if (likely(skb)) {
+				mpnic_rx_csum(rcd, skb, &csum_complete,
+					      &csum_unnecessary, &csum_none);
 				napi_gro_receive(&nv->napi, skb);
 			} else {
 				mpnic_put_pkt_buff(&state->pkt, true);
@@ -732,6 +759,9 @@ static int mpnic_clean_rcq(struct mpnic_napi_vector *nv,
 	u64_stats_add(&rcq->stats.rcq.dropped, dropped);
 	u64_stats_add(&rcq->stats.rcq.alloc_failed, alloc_failed);
 	u64_stats_add(&rcq->stats.rcq.errors, errors);
+	u64_stats_add(&rcq->stats.rcq.csum_complete, csum_complete);
+	u64_stats_add(&rcq->stats.rcq.csum_unnecessary, csum_unnecessary);
+	u64_stats_add(&rcq->stats.rcq.csum_none, csum_none);
 	u64_stats_update_end(&rcq->stats.syncp);
 
 	/* Allocate buffers, force dma_wmb(), and then start writing tails */
@@ -806,6 +836,10 @@ static void mpnic_aggregate_ring_rcq_counters(struct mpnic_base_stats *base,
 	base->rx.dropped += u64_stats_read(&rcq->stats.rcq.dropped);
 	base->rx.alloc_failed += u64_stats_read(&rcq->stats.rcq.alloc_failed);
 	base->rx.errors += u64_stats_read(&rcq->stats.rcq.errors);
+	base->rx.csum_complete += u64_stats_read(&rcq->stats.rcq.csum_complete);
+	base->rx.csum_unnecessary +=
+		u64_stats_read(&rcq->stats.rcq.csum_unnecessary);
+	base->rx.csum_none += u64_stats_read(&rcq->stats.rcq.csum_none);
 }
 
 static struct mpnic_base_stats *mpnic_base_stats_prepare(struct mpnic_net *mpn)
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
index a6dff9dc32d6..714f09f4160e 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
@@ -103,6 +103,9 @@ struct mpnic_queue_stats {
 			u64_stats_t dropped;
 			u64_stats_t alloc_failed;
 			u64_stats_t errors;
+			u64_stats_t csum_complete;
+			u64_stats_t csum_unnecessary;
+			u64_stats_t csum_none;
 		} rcq;
 		struct {
 			u64_stats_t alloc_failed;

-- 
2.52.0


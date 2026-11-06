Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964639;
	b=hWaVZcND19uWCMZE0KjEWTI1obBlFsGWfDKt8J7gw6uywWXkhRAEFQnVhlFA6HLnludA
	 NSPzryZ8/9Tls2kICOvhO6BPr7FzpZ4/CMI0LlbsMpSaydE9hDsoiNSlawHSAFWegQWuK
	 Jwqzphxmu5u/sOOVQ0duUwI7UmTc+XxKqRmFwPnUadBY8057J4VFzQA1xK80Ygfqp5HmQ
	 j7WW9QupMyeZkc5qAVyzWAwRJAkK2pXZLSkF8HYOfLQMyMpjgWCuJJsYSniJ0H3rKP71U
	 LPVTc06qWUsb5icjaDK62VIgHepMfAjyBiAOETu4eGrc5VZvSTYgvedgknX1YAd+mRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TKghWzau878d+P/3ACxwFCi2OTeMRAfi/WpTSl8a68c=;
	b=hL4+qTuH0gQ+K3xZVR3wwX0vWusgb56nyI4OPvPkFDm067/9Tsd9jb3MYy607yr4fTBJ
	 b5bY2A7K8wVUJv+uOWP4R3uq1qeCWTNnSEtR42xo+y6PYNsTb8In1VB0nfE65k4jc9q/l
	 03UxgUrAqRkuI9WvAhpWFRtHBfvhy/ib4A5hz6ZW8XRdNR3LCFNIGemAs0qXr9Hqms9+j
	 s0otSzik9wQvdqrOwb5PYpAsielpMl9M8VnDjIs1BDZNJffJnjU7p4quGHIvvNfr3h6Fu
	 QFpcDEhKT0bV1ygIROZow3JIztTErEDULh3K53s3ume47q/1EWEMfS4056W5hsWM6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cn4xkMTt;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15842606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15842606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cn4xkMTt
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b309147589so4047917b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964638; x=1794569438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKghWzau878d+P/3ACxwFCi2OTeMRAfi/WpTSl8a68c=;
        b=cn4xkMTtVGWAfQQu1ylH8slNz4eaRFMrXtFIQfBp8HAUI3Rd5bbWJ21DOT8zgT6S6w
         Aadr2PBtBwwAaexojDStXMWFIf2ZawjcOFLQkjuVOAUUM0HZ8HLh5Vrd4a5OyqgCAg+i
         XwCHHIlaGJzL2IcVE/oOyid6ed2IadfVryMHuNLiPBvhr8YZiX/czi6qpdDhe1Oaof0X
         JQU9ozv5JD5y8PHHrRsf1W6vQIi9DtoE+VnqjOg9Ma7zWtEouhQbnwezTZpQpgqeQkvp
         /Jfvc1Lt1/UxVsFsHsaG9Lsqgi5A8mA2fze59n+MyNHH2oJgJoARCQZ02v3adZ6zTWdc
         ch5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964638; x=1794569438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKghWzau878d+P/3ACxwFCi2OTeMRAfi/WpTSl8a68c=;
        b=XFvKHNL1OShe6HFxIPe9ZLEhL37khGh4yR6/5siJdP5hVe/9aSuZOc6MY7M01IA7A+
         K8sXOGvkwWnItCZ601XCQLOa/+x9tBA1WzSmZaYegHK3MS8fI3YpWJCy2zPZD+GMgCRx
         k/LmmeFs6wE/zSpZiyqRNhCdKPI+Iu7yEERZjocgIBoB5mjxJbNzFd/9o5TiQAEYdu8e
         xF+H9i4bxf2PmE3/obT9eZkDYcYyMaiN5tSq2b5hXtBxX0LvuW22EvYnsmkyDf/RIele
         kdZykqrEbcZ9be+8Eo65lYLr6Av+f6oPixxj80r2UzDEEu6XZBg1mu5IetGhAA8iL7GD
         rRQA==
X-Forwarded-Encrypted: i=1; AL+hErG3bH6ptpIOW9R7BeMrIr40Vspm+CgXDlS42EekHm5aHREeZ6uwtNfK272kaEYMDoMZkl6VDwb4ZSuZ3jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9opBizqsP0MqohSNZEO5CLarxud5DXj5u0lVS/D3go2czhcKE7
	BAFDuCoueEjPiyRUHH3jhgSOOEJgwghqRveez6WPlbMtjJa/u0bAQCRR
X-Gm-Gg: AYBFou384PZ+33di2KE4MnMDFgQduv8ZWy7J8+cHxh3nY7jqTEWlvMV2b275BlT3fDq
	7cw+uarXnKRx8P0c4UNYUNmObrMbLSTCLd7k2Y5QU0ov+5bwE5pb9zz+SnJbj2thadCB6v6TZ8H
	6EDyPoBcLow57yu9dEkhoK+vSg6UvvbRnGCCCWg72Dff0DUvr1eqIyXQlzb8/U0HYOmwLCkIvQ2
	gwnUENvf6yIP8hHWTevumZQWcMnSFjRYpszPtD/5ESNLC30R7KPoEgtBnztf+upKym9JLX31V+U
	sv6Hosc9xmFVLnkYAcB0+nGsCslRmfnyTyhQ/DkfGUPvnLVuaL0ilHLJ4pbfAG5mc3aj3cfEWsP
	ZwmOTFNjL2GwMsJ/C2qmMdC4L9QDWaXcBU9aNqYgRViTuE1lTPTlSowUO/muMB8FYP9UbCKl8Ka
	a24NFbyx9P4MV+pliZDklnJDQDqcyLnX9fGV1IgVsvOQdfdiu3XBSog3ecISvs55FG6RLDymK1l
	gX1sO+sLJ0U9BhH5ycxQeTkWCs2suiBwUiXFw0wY/6JvJSgs+4a7ibDgN5vwbHUjGj30pYlAaM1
	Szvlqhvs6rZaC28+esqyh3Qdg3g=
X-Received: by 2002:a05:690c:9c0a:b0:8b0:d438:a024 with SMTP id 00721157ae682-8b341966129mr11571477b3.37.1793964638115;
        Fri, 06 Nov 2026 03:30:38 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:44::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8880d2sm16574347b3.42.2026.11.06.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:37 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 06 Nov 2026 03:30:06 -0800
Subject: [PATCH net-next 2/6] eth: mpnic: Rx checksum offload
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
Message-Id: <20261106-mpnic-lso-v1-2-e943ff1493e4@gmail.com>
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

The device reports two Rx completion fields to the driver related to
checksums: l2_csum and l4_csum_unnecessary. l2_csum is the ones'
complement sum of the frame starting from the end of the ethernet
header. l4_csum_unnecessary means the device validated the l4 checksum of
the packet. This is only supported for tcp or udp in
ipv4/ipv6/4-in-6/6-in-6.

Report checksum none/complete/unnecessary counts via netdev qstats API.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
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
index 3de5abc20f9a..91b70fe8483c 100644
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
index edb087b12a1e..680625810ec0 100644
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
+		skb->csum = (__force __wsum)csum;
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


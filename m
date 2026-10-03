Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABB4A4400
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062603; cv=none; b=Myfk+N8s5RVYH8Fz50u6nwOgTDms7fQiNN6rgFOXdVSRFpsywO3p+R/YmM5kPGBv367xI9ze4kBZE9F0GoDH91mfcxRtJ6ZIegyEByK5oyYCQx3EjKE45grHl6Mbfjw2+OgUL75rh7+C6kvg+Y6GD1ekj1+2optOA1ZDd42UXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062603; c=relaxed/simple;
	bh=1EeFj1ZlhitmmWxDfH08SGgeO3KfRnyxMcOAjujKwdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=je1nFL0SoQL+2HIBrdo3DrRJEVCo5P91DdejW8ZvnJ1emLCwLfKMC0ygPJAxWMvKO4Jom9KVuJo1FoC6OhckVp86Zyop8wWpA5CiSvLHP7QgEmXXKpQqBCq0jbYXtc1prUNZiMpDgoh1kH9TWs0yGjZWqaeigf1WmAhjaTv6kVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8JPqA3J; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8JPqA3J"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9b7c7f405so584019a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791062595; x=1791667395; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZXqnIYzt9QIr5pps91sOm75Wt59xbsH7uSVOSxPBhc=;
        b=i8JPqA3JCuKKvnXy512tTyDSx8MyaT8eBnYmS4R7buRZO/tyNJWWa5U+6uhSSrbl5Y
         CHEKeUR2qBuTQ5+pvZaMMLLOqgQmhqoPatNDnLFoqAZa0avrLqRXpI/UZA4HyQA0br4f
         +bvqk5AdDJTbzYqChPZNX02kNbNvkrT3fEfABckAQyuhasdA1cwYx/Ny21l9Wf9FntKw
         2bMdsCOF+i+8GEFt42rtLFKVTon0IYdqoOt/XELXKdzecKDMpdsyizJDXO9g3IjX5Obh
         g8+hPXdQc9wYuvKxkeUdU8ya/QxPxkWaPnNimdNVAeDWvd2Ajzmk3id+eBdVwpSEGKYV
         eKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062595; x=1791667395;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZXqnIYzt9QIr5pps91sOm75Wt59xbsH7uSVOSxPBhc=;
        b=yvZ0H6tItkoGP2LQIj1iw3OjTDXizdHk7+rBHc/GYM0SfhpCL+GP6owrx93iNQ+H1x
         BwfiOWYYc1lvHCyDfD8RPBkQKcPAUGO0yll//6+/IyYJ47fPQRDxvZ+OM/kUPOcMX57v
         6thgUR0PLm9jrqLVR0DAa5Dse3/nP/0iclSJDhN2rpi6hgOi4AINTuf6fuskVP3jupY9
         rsNNulvyR7t9kDbuOA74PpvBM0tfEQAE/hFWN6T8DgGeyqT2ldVg7T7slXNA9Pv/oSE0
         JyiTxrIr2qsuVOcThv/vhUqVlLE9jad1yCiNXphPsiNLNRtS7xG+rVweJSip+83PorPM
         MGOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzh2Rt52HGDdxksWS0z6OnQllKlIrBvFjCK3g1PwR8w7vpXQkqp51Xn+XQjKGTwZCTkm4g6vb0UoL0g4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYZ/bMhVzd7JNyx1S1LDcur7NVt3cPBdlmd1MFaHVAjLtNpcSK
	EDv5UHcFLKdH2OsG0pq6/oiMKP4SDQNsZAFqN8bMIu651Xzer9EDmvNAsxZqDrAVnsBAt8Y9t48
	59hualw==
X-Received: from edev16-n1.prod.google.com ([2002:a05:6402:a2d0:10b0:6aa:e8d7:1a1])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4605:b0:6ac:7868:b68a
 with SMTP id 4fb4d7f45d1cf-6afad8ce0efmr2325349a12.9.1791062594530; Sat, 03
 Oct 2026 14:23:14 -0700 (PDT)
Date: Sat,  3 Oct 2026 21:22:40 +0000
In-Reply-To: <20261003212241.3432303-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003212241.3432303-22-lrizzo@google.com>
Subject: [RFC: DMA_PMD 21/22] net/bnxt: Use DMA_PMD memory for tx header
 bounce buffers
From: Luigi Rizzo <lrizzo@google.com>
To: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When dev->dma_pmd_tx_hdrs is enabled, allocate a MAX_TCP_HEADER
bounce buffer per TX ring slot out of the DMA_PMD arena. When the
linear portion of a transmitted packet is at most MAX_TCP_HEADER bytes,
copy it into the pre-mapped bounce buffer instead of calling
dma_map_single()/dma_unmap_single() on every packet.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 45 ++++++++++++++++++-----
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +
 2 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d7728d0c5b6e6..b9c91eb3aaddd 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -680,13 +680,22 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		length = BNXT_MIN_PKT_SIZE;
 	}
 
-	mapping = dma_map_single(&pdev->dev, skb->data, len, DMA_TO_DEVICE);
-
-	if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
-		goto tx_free;
-
-	dma_unmap_addr_set(tx_buf, mapping, mapping);
-	dma_unmap_len_set(tx_buf, len, len);
+	if (txr->tx_hdr_bufs && len + pad <= MAX_TCP_HEADER) {
+		u32 off = RING_TX(bp, prod) * MAX_TCP_HEADER;
+
+		memcpy(txr->tx_hdr_bufs + off, skb->data, len);
+		if (pad && !last_frag)
+			memset(txr->tx_hdr_bufs + off + len, 0, pad);
+		mapping = txr->tx_hdr_bufs_dma + off;
+		dma_unmap_len_set(tx_buf, len, 0);
+	} else {
+		mapping = dma_map_single(&pdev->dev, skb->data, len,
+					 DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
+			goto tx_free;
+		dma_unmap_addr_set(tx_buf, mapping, mapping);
+		dma_unmap_len_set(tx_buf, len, len);
+	}
 	flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
 		TX_BD_CNT(last_frag + 2);
 
@@ -800,8 +809,9 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* start back at beginning and unmap skb */
 	prod = txr->tx_prod;
 	tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
-	dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
-			 skb_headlen(skb), DMA_TO_DEVICE);
+	if (dma_unmap_len(tx_buf, len))
+		dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
+				 skb_headlen(skb), DMA_TO_DEVICE);
 	prod = NEXT_TX(prod);
 
 	/* unmap remaining mapped pages */
@@ -885,7 +895,6 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 			dma_unmap_single(&pdev->dev, dma_addr, dma_len,
 					 DMA_TO_DEVICE);
 		}
-
 		last = tx_buf->nr_frags;
 
 		for (j = 0; j < last; j++) {
@@ -4111,6 +4120,15 @@ static void bnxt_free_tx_rings(struct bnxt *bp)
 
 		ring = &txr->tx_ring_struct;
 
+		if (txr->tx_hdr_bufs) {
+			dma_free_coherent(&pdev->dev,
+					  ring->ring_mem.nr_pages *
+					  TX_DESC_CNT * MAX_TCP_HEADER,
+					  txr->tx_hdr_bufs,
+					  txr->tx_hdr_bufs_dma);
+			txr->tx_hdr_bufs = NULL;
+		}
+
 		bnxt_free_ring(bp, &ring->ring_mem);
 	}
 }
@@ -4181,6 +4199,13 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
 			if (rc)
 				return rc;
 		}
+		if (pdev->dev.dma_pmd_tx_hdrs && i >= bp->tx_nr_rings_xdp)
+			txr->tx_hdr_bufs =
+				dma_alloc_coherent(&pdev->dev,
+						   ring->ring_mem.nr_pages *
+						   TX_DESC_CNT * MAX_TCP_HEADER,
+						   &txr->tx_hdr_bufs_dma,
+						   GFP_KERNEL | __GFP_NOWARN);
 		qidx = bp->tc_to_qidx[j];
 		ring->queue_id = bp->q_info[qidx].queue_id;
 		spin_lock_init(&txr->xdp_tx_lock);
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index c673b2ce4a0d2..b42bbabc0eb98 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -1003,6 +1003,8 @@ struct bnxt_tx_ring_info {
 	struct tx_push_buffer	*tx_push;
 	dma_addr_t		tx_push_mapping;
 	__le64			data_mapping;
+	void			*tx_hdr_bufs;
+	dma_addr_t		tx_hdr_bufs_dma;
 
 	void			*tx_inline_buf;
 	dma_addr_t		tx_inline_dma;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


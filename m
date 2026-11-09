Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268633;
	b=5BsbCPImL4Bsl0attxmtDyHCSgaqW/M0qLSVjqvvUz4ZAIT7SGCcAgdavfKM4kxBb6I9
	 tK0x+YkPlGwLu62IQOD6MK9/uy1rY+qNk4hKMo4IKr1kR/1pJ6vhTBSB9MeA9VTP5z2Md
	 coyMmQvxnMfgrZ8yxLoKD7CCvtFHnJKz/RSMKBg/aGHs8TjcKCmrf60j0ofiEpTN72cZQ
	 NPtFbP4FwjEM5sUH6Mq5JEN0FsNO9a/rqW9Hs27wCcw6RWJypz0mvC7pHBXJ9VWJmCwuG
	 AZQp23rLywyr63NuNQgDf1ko70qVwOpe3qeCiQIEC0RSK88tew5FhE6WQuBrD5bv8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O8eQPRbmSM0PxKcsSe9CO6QxZj9GQ3yxigAUlLTkIWA=;
	b=IW4Cdu9G1u3fkntK005tIy1GVCTNzIaSi0mHrNH33iGgrP3Mh6yODA43Lro6SqTBSv3Z
	 k4c/hc9HRCtWPT+wJYgXpuEZhim/xez7bfTkFls3MdsHnc7dAOpWsurA0agGQlCZu7pLL
	 F+18ywlMXa8HbSn3t+wq1M6ecgFqHFT+WO1JsKtmFQMdxsoKG4Buceb1YTJAUXnje3okI
	 Iub5aazrFbqFFJX3qvx6zzZoYC/xqpa3PIgApBnrC8vkeSMXQYhXuX/xmWq6z9e4d9vlp
	 bS0QeLjHBAGDM039oTEaguKGu9HnIUOPUjlSA4ghj/F52eqQHzHojG9EojfHVIDkArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="At/u6aRN";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At/u6aRN
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so213782966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268631; x=1794873431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8eQPRbmSM0PxKcsSe9CO6QxZj9GQ3yxigAUlLTkIWA=;
        b=At/u6aRNyBVweiy0zcEZwIIjIwwRPUKr7TZTlhF3hR/w6ck5wyxNzvcf0y6+Q6CMpT
         xGPHXBQKyv1NG/g94tG7dSS8v2pn62qVUMLZN5U1mHQSSZW3UkW4wTvciQG/qSf9c2HF
         Gb/XUFNbnEqSY0whRhrU2A1YnXSdzHT1WcMhnMwuUbmT5ZyfAqVA5EMY9GSSobU+/Z+4
         /3YXWVTz9VA3x4eu6gT/m/7dodNNNgKuZJkKpTKWBi3GXQihbMwLinydfE6VDUnWIcpC
         2alfIvukef/cqDoL7FDKWYsPC9ZoWJWOJJfVWNNWxBn47E0cJ/wI2lht2lxW2Qhp2TyL
         eYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268631; x=1794873431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8eQPRbmSM0PxKcsSe9CO6QxZj9GQ3yxigAUlLTkIWA=;
        b=LZGEdfyIWbqs9UDo0WOzxcENRMmb2nrr+zU7bktZ5YwXi1tmoq2gN0eXTWq7HT2z7e
         c6r/mcqRFlGG2fEtNkXqCv/JaFpK8BWk5ImKCS//gmYU3wY+aKBTyGVTp/T5zLx2H38d
         aNP6DyVRE8akcsxeFhxUydFKDQUaNbk+5KSav+yfa9qUTtdzv9Uf4aGQE4qdMiGjMvxC
         /uu4hsZTcRhSv45SRtyw1SWMl1OIrNfQd8qshV91oppN80G6VFq8DuB/3gZwdHWRcH+m
         R/SWUv3bOpjPjtr6oHybwYOMCZ3mL7ulJlPkAFd1f1J66SdcxjK8D7v9TlBLUtcvhc2N
         FKfw==
X-Forwarded-Encrypted: i=1; AL+hErF82dKtObEBSISY+JR3x1IxUr2BBL0NUEHpz3UvsikmCcd8tRXq3WVQ+cCzcI92saWGnE/S9hgdbVmNqx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gX3JOknNOImFgivcYSXiOLAKwp8RFPG2etl/cwgGsVgfy+U2d
	/UX6EZge40A6BA/ZKUmqYIVcWYqBzrXSBwybMJ1fnTFSIFRLqFFObKk7
X-Gm-Gg: AYBFou3vZE91yfFqI2tjRcGwOpyEO1iDcTMovzdlmfz6trSNTcoq1wvT7kgWM7bkJqZ
	awaChY2frvgjjIv3NOVvosXLlV5hEjnQphRvDslw5E3K7cqVoc7VBp7A1IKFD2GuDKquZmK++Ht
	UFw4IpjJrFzMdhkjLHOVCIzXZb3vyOolNR3D8SkEsX1BR3YumLQyfANzyknyL1wv3EQFJyP8h7N
	xHkUYn3UwP2rqHXw5d477VCwg24ddpaLAI0RfTW+GPxp/S0nLmeay4X8sKDYbNjK26DnP6t+Nq4
	ZVLn+wF86yf7f4N6xYlMXYSeNAzLzW8aAx8kMKSTg+D/AVRwMeUiF80EmS8miejg4SFjzS5G2S9
	Z3IcUgIT5yWBG5G0YLJD4SHsivGDPGQW7bCWe4qMH/JaKSc5aSoYusA82t40zt92dKzPikSBPuS
	1vbxmj0HynYkBZgTPVJ//bgrPL7yXaOkBDUQQ9tUzpeAffJUXrdm8/j8Sanp5myrhDTuSueK1oq
	8E0ggaFTHwkZ4Si676k59MSKNOTU4O6oTFgLWWXHiDEV/K2B2EqTCaMqWtLO/9KjKuLPeJ6kF5P
	q2mTTJ/rGT3MdOCQIj2eV09drNHvK81whTKSoWX9l5UPddXx8QDF6Z5athkCzDnxs/QtsqYkU8b
	q
X-Received: by 2002:a17:906:3db:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c50494f374emr55535466b.9.1794268631110;
        Mon, 09 Nov 2026 15:57:11 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:10 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/7] net: bcm4908_enet: release the TX ring on stop
Date: Tue, 10 Nov 2026 00:56:56 +0100
Message-ID: <20261109235700.2586821-4-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcm4908_enet_stop() disables the TX DMA but leaves the ring as it is:
the skbs of frames not completed yet stay mapped and are never freed,
and their descriptors keep DMA_CTL_STATUS_OWN. The next open starts
the indexes from 0 again over those descriptors, so the DMA can send
from a buffer that has been freed, and start_xmit() finds OWN set on a
slot it is about to use.

Unmap and free the skbs left in the TX ring on stop, clear slot->skb
once poll_tx() has freed it, and clear the TX descriptors when the ring
is initialised.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 727ad1e96..8008b44a4 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -312,6 +312,10 @@ static void bcm4908_enet_dma_ring_init(struct bcm4908_enet *enet,
 	enet_write(enet, ring->st_ram_block + ENET_DMA_CH_STATE_RAM_BASE_DESC_PTR,
 		   (uint32_t)ring->dma_addr);
 
+	/* A descriptor the stopped DMA never completed still carries OWN */
+	if (ring->is_tx)
+		memset(ring->cpu_addr, 0, ring->length * sizeof(*ring->buf_desc));
+
 	ring->read_idx = 0;
 	ring->write_idx = 0;
 }
@@ -495,6 +499,23 @@ static int bcm4908_enet_open(struct net_device *netdev)
 	return 0;
 }
 
+static void bcm4908_enet_tx_ring_clean(struct bcm4908_enet *enet)
+{
+	struct bcm4908_enet_dma_ring *tx_ring = &enet->tx_ring;
+	struct device *dev = enet->dev;
+	int i;
+
+	for (i = 0; i < tx_ring->length; i++) {
+		struct bcm4908_enet_dma_ring_slot *slot = &tx_ring->slots[i];
+
+		if (!slot->skb)
+			continue;
+		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_TO_DEVICE);
+		dev_kfree_skb_any(slot->skb);
+		slot->skb = NULL;
+	}
+}
+
 static int bcm4908_enet_stop(struct net_device *netdev)
 {
 	struct bcm4908_enet *enet = netdev_priv(netdev);
@@ -510,6 +531,7 @@ static int bcm4908_enet_stop(struct net_device *netdev)
 	bcm4908_enet_dma_rx_ring_disable(enet, &enet->rx_ring);
 	bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring);
 
+	bcm4908_enet_tx_ring_clean(enet);
 	bcm4908_enet_dma_uninit(enet);
 
 	free_irq(enet->irq_tx, enet);
@@ -686,6 +708,7 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 
 		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_TO_DEVICE);
 		dev_kfree_skb(slot->skb);
+		slot->skb = NULL;
 
 		handled++;
 		bytes += slot->len;
-- 
2.56.0


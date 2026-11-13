Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614340;
	b=hjlQvdJfnF/nTraopTEndH/KBPJ6beUkTDUF0z4bo/68FEZSAk3tpOfgHTt79ryL5IAu
	 /b3ZODvPt1FP1Gkz1huaMXcgn1nclJMgDHiVhe2wRHwApSdz2jLt82ZJZgrBrZheGN5PF
	 QrRi9yCOipQZCQdnpoagDApKznLozdo12X/Y9LvQk4Ki5z6Z9RG5nVBTbqSdqInoOMmZt
	 z+7n79aY1F7gJwSN97ON0tbP9Y0ZX2S+RINI2UBf0r1k0hBW6uI7VEYAZoji26KCfesfN
	 iWdmKSnDBIlE3KkxB/U6eiO7iSbWNAePddb8u9TOpxRb0SSrD/UP73qePVhxsYzTk9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Pepq2A4WKZmF6w0WlkghcRpHRzAUJfXoIxu9RlQ910=;
	b=fydAy1KBWe1JbbzR4FWffpCYwtKQUT86qRnfQowg9iG3nCCBQW+3Qyl3q05vW3G4D7jV
	 d3kP/w6qxanW4voqrP4xjEzVq9OhtmXemaJMZPAObK172t7h+c4zHu4YM6qQ/D3VKpA4W
	 I52fsrd2oDCNiHR4ssJ6/fnRGX5xxYri9OJOHcGo5W2fbTi9O45hHT1avL5zO43WZJw1E
	 Z7ESLmTLim4vnJtEelBVTKG+KK1/WvCWaChzxD7pZrhHf1anRiwAHDjs6RBgr2nHqdaeI
	 31/707RbyoyxxS50DxRhceuGaQhwXIWoTjKHcPp1VTrOG6FX1O9z1u5VDC7KaqG6fyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrCuwHOY;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD40606A8B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD40606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrCuwHOY
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so340148866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614338; x=1795219138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pepq2A4WKZmF6w0WlkghcRpHRzAUJfXoIxu9RlQ910=;
        b=NrCuwHOYgV4ML7Uvhrza6QCGf+wxHKRuU5futIcFv5UyBNhScnxuASynx+jyQe/x5t
         r7lWwV+cvr6XY/QFKG1T1SziaGWSGa9V+nPOkWoglZIYLmM+r8bmnQfDPlPpHjBerXqT
         FV4bRozj+RLhkw6ZHlmOU+Qvza4IM0Ld6Lx99ES3T9L+57dlaAfkny9m4ouHUPqaZXuF
         TCWYuo+C1vs2+l+E4I82OwmPIEx7f2WZSNK+GVgKRdAH/XJBPG4HQapPTWxD4sAs9TTG
         gFmYlfpPs3uEyUIrf4meQa3qpg4eEeB+9mk+oyVahb8UtcDJ9hmopad1kyY1UdX//Ngw
         GMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614338; x=1795219138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pepq2A4WKZmF6w0WlkghcRpHRzAUJfXoIxu9RlQ910=;
        b=nt5vK9kgcL2oQPHCTEs8XMqhxLQZijtkpg5AiOo/d+PEFBteGmwXfCRnMMzGTgGKV2
         y1EhHBsDn6wGPIU4VNqoseUFPY7BcH4UCSM5nhRXLeyWdWjhY/lI8q7X77PneliAKQvU
         ++Ppev+qIPG39h0Y1ABVmCvPdi/0MSkfhrRgW46IfTgl7skR5fnLJTNmisGByimvicCS
         2pntB+YLCbmj+ppDt3NpLFypepYp9eM3A2fJyKNHRXVBV8X9+sEx1xplSp5ZFieEO5Fw
         IIz7FZQKzIl7yA0eqSHZh9FHC57o84hEYhYQ4hII9AMf7sK0vm2nFuNtyIZzbCqen3d+
         Mrbg==
X-Forwarded-Encrypted: i=1; AL+hErH6i4y8+uEFqyD1axEPzk2maoj/W/17VxY6YM3bateMrnYRJka0n4h77Delc6M2b1PcBKWCYHWSdf0XRo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rWmnV/TPWdvaWOX/d7wo0XuLllGffyvc+BDs/mGvFRxDS+veN
	q62AYSTg8qOFMlADna/sXADY6kwU+1VWJYaLHKUMFMOu+/8D+YCg9ndm
X-Gm-Gg: AYBFou12evlyQrSTyYv8w+9ChqoQWvMt2SgHxUbYQGOnnaz3LRPdXPbAIk/qbXHPJlm
	wLxbSlam88KPDTmmGNbDMx5+aund9Egc9olS2HypdywoJp93NhkS9FSgvRXSZvHUZnPdkN8jKiR
	n5/v5NwxhyqD4L4VBvB4PdeQ2ymeIjZd6X7ddAjQ07Zx1Ze/B2qlz7rq2wLrrWmokNrLrjOdw9P
	fzm3nT3wVsS6izUZ9CPx3lD7/pHCVu8MVaymAOorvt7pq3Zd2bco0hc8V5lNF4GhV3OEKgJVe01
	WCfoJwFbfuIP/4FLsNZEQ3Z8BAsZkC7plo4qu8pOfniPw0ZyGEFFnHmf0Cmn1WNarCeKOFEOque
	RcfK25f+LcAgamLcXPIiPMldMLg7UHqzdrMgwtnpJt8zku4huoudrqhBxDpy1bhaITDfIy7PwCl
	1rNu8bDOI4w0jQ/9DA9flkEYXeQR5LbpvK505ZwgvBuPW44/wbZm+bOrniWctX6zQWx1gGXY5T6
	fuRgRhTxPymiyXOF1Zbtx0UlwNPQLmgAH8GpKasQFglpGvMjYKnV8390vfP/7wIAGsIQ8hYqAq1
	ylTHTUt/T8Pb/r7VMbBVhNb7NgIgxRBP6/SDVqa8bdGRGwDi6UgBm9tBVxsY5w==
X-Received: by 2002:a17:907:3f88:b0:c3f:153a:865f with SMTP id a640c23a62f3a-c509643ad99mr359722566b.40.1794614337579;
        Fri, 13 Nov 2026 15:58:57 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:57 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 3/7] net: bcm4908_enet: release the TX ring on stop
Date: Sat, 14 Nov 2026 00:58:43 +0100
Message-ID: <20261113235847.517308-4-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-1-kudzo51@gmail.com>
References: <20261113235847.517308-1-kudzo51@gmail.com>
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
the skbs that poll_tx() has not freed yet stay mapped and are never
freed, and the descriptors the DMA has not sent yet keep
DMA_CTL_STATUS_OWN. The skbs, the socket memory they hold and their
mappings leak. The next open starts the indexes from 0 again over
those descriptors, so the DMA may send stale frames from before the
stop, and if the first descriptor still has OWN, start_xmit() stops
the queue before it enables the DMA, with nothing left to wake it.

Wait for the TX DMA channel to stop, as is already done for RX, then
unmap and free the skbs between read_idx and write_idx and leave the
ring empty, so that nothing can free them a second time. If the
channel does not stop in time, leave the skbs alone rather than free
them while the DMA may still read them. Clear the TX descriptors when
the ring is initialised. A descriptor that start_xmit() is about to
use then never carries OWN, so drop the check that stopped the queue
on one. The RX helper's timeout warning said TX; make it say RX.

Found by reading the code; I have not seen these on the hardware.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 55 ++++++++++++++++----
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index b1738d954..bb42b6ecd 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -7,6 +7,7 @@
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
@@ -313,6 +314,11 @@ static void bcm4908_enet_dma_ring_init(struct bcm4908_enet *enet,
 	enet_write(enet, ring->st_ram_block + ENET_DMA_CH_STATE_RAM_BASE_DESC_PTR,
 		   (uint32_t)ring->dma_addr);
 
+	/* A descriptor the stopped DMA never completed still carries OWN */
+	if (ring->is_tx)
+		memset(ring->buf_desc, 0,
+		       ring->length * sizeof(*ring->buf_desc));
+
 	ring->read_idx = 0;
 	ring->write_idx = 0;
 }
@@ -362,10 +368,22 @@ static void bcm4908_enet_dma_tx_ring_enable(struct bcm4908_enet *enet,
 	enet_write(enet, ring->cfg_block + ENET_DMA_CH_CFG, ENET_DMA_CH_CFG_ENABLE);
 }
 
-static void bcm4908_enet_dma_tx_ring_disable(struct bcm4908_enet *enet,
-					     struct bcm4908_enet_dma_ring *ring)
+static int bcm4908_enet_dma_tx_ring_disable(struct bcm4908_enet *enet,
+					    struct bcm4908_enet_dma_ring *ring)
 {
+	u32 tmp;
+	int err;
+
 	enet_write(enet, ring->cfg_block + ENET_DMA_CH_CFG, 0);
+
+	/* Wait for the channel to stop, as for RX, before freeing buffers */
+	err = read_poll_timeout(enet_read, tmp, !(tmp & ENET_DMA_CH_CFG_ENABLE),
+				10, 2000, false, enet,
+				ring->cfg_block + ENET_DMA_CH_CFG);
+	if (err)
+		dev_warn(enet->dev, "Timeout waiting for DMA TX stop\n");
+
+	return err;
 }
 
 static void bcm4908_enet_dma_rx_ring_enable(struct bcm4908_enet *enet,
@@ -391,7 +409,7 @@ static void bcm4908_enet_dma_rx_ring_disable(struct bcm4908_enet *enet,
 		usleep_range(10, 30);
 	} while (!time_after_eq(jiffies, deadline));
 
-	dev_warn(enet->dev, "Timeout waiting for DMA TX stop\n");
+	dev_warn(enet->dev, "Timeout waiting for DMA RX stop\n");
 }
 
 /***
@@ -496,6 +514,25 @@ static int bcm4908_enet_open(struct net_device *netdev)
 	return 0;
 }
 
+static void bcm4908_enet_tx_ring_clean(struct bcm4908_enet *enet)
+{
+	struct bcm4908_enet_dma_ring *tx_ring = &enet->tx_ring;
+	struct device *dev = enet->dev;
+	int i;
+
+	for (i = tx_ring->read_idx; i != tx_ring->write_idx;
+	     i = i == tx_ring->length - 1 ? 0 : i + 1) {
+		struct bcm4908_enet_dma_ring_slot *slot = &tx_ring->slots[i];
+
+		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_TO_DEVICE);
+		dev_kfree_skb_any(slot->skb);
+	}
+
+	/* Leave the ring empty, so that nothing frees these skbs again */
+	tx_ring->read_idx = 0;
+	tx_ring->write_idx = 0;
+}
+
 static int bcm4908_enet_stop(struct net_device *netdev)
 {
 	struct bcm4908_enet *enet = netdev_priv(netdev);
@@ -509,8 +546,10 @@ static int bcm4908_enet_stop(struct net_device *netdev)
 	netdev_reset_queue(netdev);
 
 	bcm4908_enet_dma_rx_ring_disable(enet, &enet->rx_ring);
-	bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring);
 
+	/* Leave the TX buffers alone if the channel may still read them */
+	if (!bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring))
+		bcm4908_enet_tx_ring_clean(enet);
 	bcm4908_enet_dma_uninit(enet);
 
 	free_irq(enet->irq_tx, enet);
@@ -549,13 +588,6 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	if (!netif_txq_maybe_stop(txq, bcm4908_enet_tx_free_descs(ring), 1, 1))
 		return NETDEV_TX_BUSY;
 
-	/* Hardware removes OWN bit after sending data */
-	buf_desc = &ring->buf_desc[ring->write_idx];
-	if (unlikely(le32_to_cpu(buf_desc->ctl) & DMA_CTL_STATUS_OWN)) {
-		netif_stop_queue(netdev);
-		return NETDEV_TX_BUSY;
-	}
-
 	dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
 	if (unlikely(dma_mapping_error(dev, dma_addr))) {
 		dev_kfree_skb_any(skb);
@@ -563,6 +595,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 		return NETDEV_TX_OK;
 	}
 
+	buf_desc = &ring->buf_desc[ring->write_idx];
 	slot = &ring->slots[ring->write_idx];
 	slot->skb = skb;
 	slot->len = skb->len;
-- 
2.56.1


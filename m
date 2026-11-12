Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513065;
	b=b0aPW6aci1BYib0UVVunBqgnf3nvFIZEAlo1ZchTO4M15wArMbgLZneOn5cv/MbQPEvf
	 GSSnOLMNJHK3GSb5LA4u1wFTqCmFNkYwle7hu4vnyh4szOQpKNkQz4dE4qjBxy0lZZA+0
	 95GSBb1lq1FTw5Fy1bf7lOB5FUTDTUBvNj/wtWZwYOOf+cVLA7x7M8yWV1mHWbRO64wHo
	 lAYmmUdQt6mun7TFyvDJw6idbRgy8+oWCB3u9/97bwd8l6CtZRtdLSrkoYzsBkGzbZc8o
	 LqC3b2liN19HCM6Ibo/azGXzR1S89I1WIBpdSU2JAN7AJnR5W4NYLMsDvuGcnvI5Szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lHIWKtfmtBCOjxCfX2OCXtoPEhN9gzeNFaeY7u549Js=;
	b=dx2+yyfqGwNLu1rOj261f+82gZ98cInjPhGIvxDlf4vrq7Nq89Qp3WlGLWmMogIf5oI+
	 ELdb8LDzPnumyPcXQsktSLyH9EFvaYbGieoynYMoYWaozHHlJm5nOvXVSGUJk8havKXOF
	 0PTOrYCxw0tCZf07WiY6lcFkvLnn4xOfWsvZFLzL+Xanu8mOka1aWPxwIG+3IzClCjl09
	 SBjJFzvK5qBsyAgy6jQZ6d8sikUX2HPz9Xvwc4H1bivEJ/apON2EfYL3j4dj/SKkwoyim
	 cTvXmpWWZnwcQCMrk/KcYm//7xt4/pQb20/NwtL1c85WI/eedMTtQiO88e7FaGYcVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9fAf4LD;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B1606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32B1606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9fAf4LD
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d58c50743so19441366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513063; x=1795117863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHIWKtfmtBCOjxCfX2OCXtoPEhN9gzeNFaeY7u549Js=;
        b=o9fAf4LDSUMdcFvQH7Dnhdh1Tx+tmHs5WZ9kxiJALp+sou7fcCnHuE+C+Rn9s3y9mR
         7B1u3h+ux4lsHoyVRpezTblFKwk5glCdgC7dYNii8qG8xkqTO471cG82ZXRrnITsXJgS
         Eum43606NOo0JwWFtQpLJBY8Yq9X2xJHi9cjJCklHRIXV3hrnHcT3XWZ9Jsc/zQNYFbt
         mFna6QXwHaZhWfLoXQ7ZWyCJwjYPRcf5HmYInSOlEN92Q6h259hKP5RmQzS7GnHV0ltp
         Dd2HvM4CO5AxJpGPs5WgjaN57HabFjrKdPAdYIfMC2loMTK+dMCJ2ZxnVXmHRtNndjFa
         z0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513063; x=1795117863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHIWKtfmtBCOjxCfX2OCXtoPEhN9gzeNFaeY7u549Js=;
        b=19eKnxRllhxWdJwIIDKzNMfCe/OQQZ+gZAMft12iqEUdWDGOXWd3O1m1iekTXV592L
         EmLkuKlCRcJooUPWJBnuyVFKINNTPArGDahPb7Tc79jrDW52KvvqpO1nsy/tflAhBAHD
         PDQF9SgJ0VEkQhr++suI5m+kTp2nhaVFcXx2GXfTILOXgWZ38Aa5g7YiqogFMVfRTTzl
         wZYlb5evlegnHneRk3XbV/JeOjM4GMi8GQDNgB9LoLLJTOhDHGFEq2pQ/UxkIL1VKwvx
         QdI2vp/5EOtIV2dJYh8PfRvijCBBc/QwBRtyivNIkvhh5Q5kb3sXo6OGOfK1WZZy6npm
         Ofqw==
X-Forwarded-Encrypted: i=1; AL+hErGh6KJXz8W+zi5uFvJ+t5R/lH/z5egDs3SHMsGC4ZGIXGkQ83ieadtBXkfMwFd9EqWpt3cwXDv3storIsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GGvPm24n5HwH7jvuKoCYYAZjOKNApUApfj2q3AxHEfS6nKAW1
	39Oi2OK7tN7omEkgmclCNM+V9FWPktFKQ6X4DA8n5AAr8aJFVAXXy0S5
X-Gm-Gg: AYBFou1KBYIGd9QmrdWuWDJdGz3qSDJwIJdZPNsmPPPv1kB05F58/nKJzD5mC/sPgMf
	A4ydcaYdXSapLOhyNlDHbzAs44NveW2cD6H94l8nahGIYLa734dwBGZiSlVPlYKvCwJpujF/pD0
	o6Heg3B8LJE9iIiOL9HKHd4BZrkbzkl4fZ3WWv2WPK166gYT6gMYIWsEAoXvTo8UUKrGRjOMaj+
	Hi7PgDV6EoL3b05IecGZBVJ9lymg9OMAtVOGUdZzMd5I4BzzRdBoNDP+bdQs5LeT6MT3bJ9szGG
	9vVJDrm5vzBi3CHvSDoP3HYFn3kdpRffWxp4gSBB1OtvOLLmr3DIcSiGBjzyaxf8PQ6Wlzpk0mF
	QyVHPwygz3yQLBKtXTn606N9i6dNoW+Khf41ZmOroANGqrzrNV2Gh5G5KfrrVekKWhnHkvnHXbE
	pA1oKGA5SZDzkAzuaiUarYs8hO0PZFvnLi+BNsFbsKShJIo7nLzX2qMxeAzDVxksfSq7ZoQSctR
	6QJKh71nKZTvcpT1nk6qxDSgAJru7gXy/UebhMaWrnOTgh3j4AxDg4iVecLrh5C4Ypa3uvMes3r
	XwHEzUpX3LFTh0G5pAvNLkrUNIhtSNQtae6YFxUM
X-Received: by 2002:a17:907:c13:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c5096442d6bmr25370966b.33.1794513063267;
        Thu, 12 Nov 2026 11:51:03 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:02 -0800 (PST)
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
Subject: [PATCH net v2 3/6] net: bcm4908_enet: release the TX ring on stop
Date: Thu, 12 Nov 2026 20:50:48 +0100
Message-ID: <20261112195051.597102-4-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112195051.597102-1-kudzo51@gmail.com>
References: <20261112195051.597102-1-kudzo51@gmail.com>
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
unmap and free the skbs between read_idx and write_idx, and clear the
TX descriptors when the ring is initialised. A descriptor that
start_xmit() is about to use then never carries OWN, so drop the check
that stopped the queue on one. The RX helper's timeout warning said
TX; make it say RX.

Found by reading the code; I have not seen these on the hardware.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 46 ++++++++++++++++----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index b1738d954..a28adef03 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -313,6 +313,11 @@ static void bcm4908_enet_dma_ring_init(struct bcm4908_enet *enet,
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
@@ -365,7 +370,22 @@ static void bcm4908_enet_dma_tx_ring_enable(struct bcm4908_enet *enet,
 static void bcm4908_enet_dma_tx_ring_disable(struct bcm4908_enet *enet,
 					     struct bcm4908_enet_dma_ring *ring)
 {
+	unsigned long deadline;
+	u32 tmp;
+
 	enet_write(enet, ring->cfg_block + ENET_DMA_CH_CFG, 0);
+
+	/* Wait for the channel to stop, as for RX, before freeing buffers */
+	deadline = jiffies + usecs_to_jiffies(2000);
+	do {
+		tmp = enet_read(enet, ring->cfg_block + ENET_DMA_CH_CFG);
+		if (!(tmp & ENET_DMA_CH_CFG_ENABLE))
+			return;
+		enet_write(enet, ring->cfg_block + ENET_DMA_CH_CFG, 0);
+		usleep_range(10, 30);
+	} while (!time_after_eq(jiffies, deadline));
+
+	dev_warn(enet->dev, "Timeout waiting for DMA TX stop\n");
 }
 
 static void bcm4908_enet_dma_rx_ring_enable(struct bcm4908_enet *enet,
@@ -391,7 +411,7 @@ static void bcm4908_enet_dma_rx_ring_disable(struct bcm4908_enet *enet,
 		usleep_range(10, 30);
 	} while (!time_after_eq(jiffies, deadline));
 
-	dev_warn(enet->dev, "Timeout waiting for DMA TX stop\n");
+	dev_warn(enet->dev, "Timeout waiting for DMA RX stop\n");
 }
 
 /***
@@ -496,6 +516,21 @@ static int bcm4908_enet_open(struct net_device *netdev)
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
+}
+
 static int bcm4908_enet_stop(struct net_device *netdev)
 {
 	struct bcm4908_enet *enet = netdev_priv(netdev);
@@ -511,6 +546,7 @@ static int bcm4908_enet_stop(struct net_device *netdev)
 	bcm4908_enet_dma_rx_ring_disable(enet, &enet->rx_ring);
 	bcm4908_enet_dma_tx_ring_disable(enet, &enet->tx_ring);
 
+	bcm4908_enet_tx_ring_clean(enet);
 	bcm4908_enet_dma_uninit(enet);
 
 	free_irq(enet->irq_tx, enet);
@@ -549,13 +585,6 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
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
@@ -563,6 +592,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 		return NETDEV_TX_OK;
 	}
 
+	buf_desc = &ring->buf_desc[ring->write_idx];
 	slot = &ring->slots[ring->write_idx];
 	slot->skb = skb;
 	slot->len = skb->len;
-- 
2.56.0


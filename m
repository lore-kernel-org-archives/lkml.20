Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268632;
	b=HWLElgd17mIgyQd45Ul+k+3o/u7TczwDYA7m2nLlEP3XbdX18cg01rRu3yXIVPsUKOmi
	 WoM+E/Wv2/8nQp81r+yAbFVC/LT8UkLw35OqExHexyJ1zwcmZQfI/oFT1zBvOe+ff2Wt6
	 +vlFJVigUTX5Sglha464VO25+N6MUdRQTmkbTCRdrXU67jY6k/FkHcVxQKB77cMQWtxDb
	 4uJ+wHi/8y6IUwsA/YwYi9fWyAbWZneio26FGS9VxGLiNDfDfoMdmzU0FjCkBip7fw63+
	 tqQ+hK+YAunQh5N5581g0ekfztV9/UewQ14L9VKMVIBZIrKYkEvsA0rwHB7X3CJ8j3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncaad3j/dxgibE3927tLBSEquBTsdAGZ7shltnhjFtY=;
	b=gIRMcb9wmQAN3JKIGFT5dH+WLGfbBzWVz0tQW6f2AH0ubyIIZvxUTz4UlPd1oyTZpwcb
	 ZZDHJ2lyZ+cWqfLXkqRjRm4W3NX94ex8vjyHxMyNDSs8HNbbhMrjHR1jO7hvPm2o65/E/
	 Jo/J3VVcZRg8CbPLzaEhiHd18RZ0cqgjajubos61mU9RPlENiAuaARkkPXSCrJPTUUOOG
	 eZFi/PKFU31KElq+6WNTqYHXMgTdbVWzA/FG3slYzfEPH3i4vr/KV3qcW01BL2gouvLBo
	 yWggRbzA4fXTk9NAu9Xrtr5F7XTAQZs026riq0zFclRcrvdmC50K75KVIuqnqXDCc1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JciWTFuw;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87AF60A2600
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87AF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JciWTFuw
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso253833166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268630; x=1794873430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncaad3j/dxgibE3927tLBSEquBTsdAGZ7shltnhjFtY=;
        b=JciWTFuwNRvXqnYoL5ENEGUB5QBsSjsowHfjUTawSpm4aGcCsueJkINjZPNwMiXONZ
         O/GjVrYxOQN/il1bI4x9hQP1yHPvmkXkDUYu3vl0VUvzmtovMpJhU5Rx/46WHJAfCWgQ
         wKlNxKsPMH7ISr2KSjnriMgnKiLGwFNdNVBi+0Y1Ctge2dze9pAm9Rl+yFt442rOwlAB
         JcI4xcOI6asAMO9/iNLv3ldXDRxHUZhiQRQUmzVqmmNwnEEBHXHjaRT3q24trFFk7ayg
         4kIISoitUXm8I/ybuK53YQgLLfGUiynJp0eXT3t2YjQq46iGZMBRqwcSsiptiRsvmecb
         WgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268630; x=1794873430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncaad3j/dxgibE3927tLBSEquBTsdAGZ7shltnhjFtY=;
        b=WICF77qRFUl29oPIzkp8aIl7yroZqOmr/H4CCiPlkxnqUYeWxIJHHKKtiHhjYy1NR8
         LXzozeDcyAuOYp9QNWnDBdyLgFhH6rzI/K61Br4OFUzTOYupjWDOLLD1Xq3rCZ2meug4
         fWmGxjlGKWZaSjj5ciVPD0eGZUAPZLnfK0VXzR+fwseRP9QwtUFk7TQGK4TFEtmAf9Nn
         0/+XkYLgZC3RRbB+4WCPKif0uMxfTf76gP2GilkKeZ/cbk3O7+mOoYFvXxJ3YUdfLJCF
         a9/BC8w0SJQZZDsq0+G9fs7t10JVfThVRFg7zLCCjZ3rzwoJORCQba1sd4ZEHG3FhFkV
         3+xQ==
X-Forwarded-Encrypted: i=1; AL+hErGQhDhiBEKN1f7eka7Yc3kg5mBr565nK/4jt747ji7ZKcXU48eki5HQMoil1AtGtTl8sm6K+Ht6ayawmrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DI03TaZInP7jJDWSJjVAkmWQjGIgBTkVctFLFoJV8a2RExgXA
	LhL3+NmzD3zVBu7OAdOSuPTD5YAWNFjY+CLDsf0SlkewwLBwPpMLlDYg
X-Gm-Gg: AYBFou2npB3+B4N19Mc2b56tjMpDwY2gxgxEpFdBKZwOMGy/nq/A7c3IhEZObtmshvh
	8YUqhSXwfPkTHqYY96AHOEf5TpuDUmt8eLjK8qw4mqyqUmtb6Eerl3Yop6Mq8mzWBAIJd7XQYQu
	K8jhgcb7nb3YLgsXSK2Sr/Bf+RSkkWaYTwxN8lOiBgZ0jr2xQVeV6OJhybo0AjJAxm7FS9BPihX
	uN6+tN4I2bsnuyKuiR2rBb9A4Cn+N2sxUF8MG+2gaXcPGQHBRBrqxdB6abD67uaRYE5qn4/hwDh
	0ln8P0HHVtzVX47F34tFULxIIa8DZzs0leTZCwSmu3A2UpFlCv2RN0ol20QuK7oT7fNmZQJcMQ0
	CSo7JKZ8FadRcsum3Mbi7r43FpSOLaAW8OFhSuzRs2De452bSC/CHlS+EwIZ0LU4RnS3kYep8nt
	k8lLdqKT3SHcydM0WqVqH9cex39h5fdiaaRKDz4UyxwpXoq2ZTLpzOKr1FEle/p2Ur0QTRmc293
	gB3/Tf4fp5ShgT8n0c4wdBrrsNRVlU+xIYOpvSO6zXWRKUksELHQG5tXKyEFl4r4vtNyvf3IOYy
	gJRv1RZ44RRNaegVmlBS/LrFyugZfYQla/E4UVllV5x9iov+0oG2Wx7K
X-Received: by 2002:a17:906:ae8b:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c50496a9c15mr52726066b.18.1794268629784;
        Mon, 09 Nov 2026 15:57:09 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:09 -0800 (PST)
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
Subject: [PATCH net 1/7] net: bcm4908_enet: fix the TX ring wrap
Date: Tue, 10 Nov 2026 00:56:54 +0100
Message-ID: <20261109235700.2586821-2-kudzo51@gmail.com>
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

start_xmit() wraps write_idx at length - 1 and sets WRAP on the
descriptor at length - 2, while poll_tx() wraps read_idx at length,
and the free descriptor count is taken from length. With read_idx at 0
and write_idx at length - 2 the count comes out as 2, the frame is
queued and write_idx wraps to 0 == read_idx: a full ring looks empty.
The following frames overwrite slots whose skbs were never unmapped
or freed, their bytes stay in BQL, and the queue stops for good with
nothing left to wake it.

On a TP-Link Archer AX6000 this stopped all wired traffic under
sustained TX load (about 1.4 Gbit/s through the switch's CPU port):
tx_packets froze, nothing was logged, and BQL showed about 185 KB in
flight against a limit of about 10 KB.

Use every descriptor, with WRAP on the last one, wrap both indexes at
length and keep one descriptor free, so that read_idx == write_idx can
only mean an empty ring. Stop the queue as soon as the ring is full
and wake it from poll_tx() once there is room again, with the usual
barrier pairing.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 52 +++++++++++++-------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index fd2715f84..01a3e1d01 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -518,6 +518,16 @@ static int bcm4908_enet_stop(struct net_device *netdev)
 	return 0;
 }
 
+/* One descriptor always stays unused, so read_idx == write_idx can only
+ * mean an empty ring
+ */
+static int bcm4908_enet_tx_free_descs(struct bcm4908_enet_dma_ring *ring)
+{
+	int free = READ_ONCE(ring->read_idx) - READ_ONCE(ring->write_idx) - 1;
+
+	return free < 0 ? free + ring->length : free;
+}
+
 static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_device *netdev)
 {
 	struct bcm4908_enet *enet = netdev_priv(netdev);
@@ -525,20 +535,14 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	struct bcm4908_enet_dma_ring_slot *slot;
 	struct device *dev = enet->dev;
 	struct bcm4908_enet_dma_ring_bd *buf_desc;
-	int free_buf_descs;
 	u32 tmp;
 
 	/* Free transmitted skbs */
 	if (enet->irq_tx < 0 &&
-	    !(le32_to_cpu(ring->buf_desc[ring->read_idx].ctl) & DMA_CTL_STATUS_OWN))
+	    !(le32_to_cpu(ring->buf_desc[READ_ONCE(ring->read_idx)].ctl) & DMA_CTL_STATUS_OWN))
 		napi_schedule(&enet->tx_ring.napi);
 
-	/* Don't use the last empty buf descriptor */
-	if (ring->read_idx <= ring->write_idx)
-		free_buf_descs = ring->read_idx - ring->write_idx + ring->length;
-	else
-		free_buf_descs = ring->read_idx - ring->write_idx;
-	if (free_buf_descs < 2) {
+	if (unlikely(bcm4908_enet_tx_free_descs(ring) < 1)) {
 		netif_stop_queue(netdev);
 		return NETDEV_TX_BUSY;
 	}
@@ -562,7 +566,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	tmp |= DMA_CTL_STATUS_SOP;
 	tmp |= DMA_CTL_STATUS_EOP;
 	tmp |= DMA_CTL_STATUS_APPEND_CRC;
-	if (ring->write_idx + 1 == ring->length - 1)
+	if (ring->write_idx == ring->length - 1)
 		tmp |= DMA_CTL_STATUS_WRAP;
 
 	netdev_sent_queue(enet->netdev, skb->len);
@@ -572,8 +576,17 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 
 	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
 
-	if (++ring->write_idx == ring->length - 1)
-		ring->write_idx = 0;
+	WRITE_ONCE(ring->write_idx,
+		   ring->write_idx == ring->length - 1 ? 0 : ring->write_idx + 1);
+
+	/* Stop while the ring is full; poll_tx() wakes the queue once there is room */
+	if (unlikely(bcm4908_enet_tx_free_descs(ring) < 1)) {
+		netif_stop_queue(netdev);
+		/* Pairs with smp_mb() in poll_tx(), which may have freed descriptors meanwhile */
+		smp_mb();
+		if (bcm4908_enet_tx_free_descs(ring) >= 1)
+			netif_start_queue(netdev);
+	}
 
 	return NETDEV_TX_OK;
 }
@@ -655,14 +668,15 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 	struct bcm4908_enet_dma_ring_bd *buf_desc;
 	struct bcm4908_enet_dma_ring_slot *slot;
 	struct device *dev = enet->dev;
+	int read_idx = tx_ring->read_idx;
 	unsigned int bytes = 0;
 	int handled = 0;
 
-	while (handled < weight && tx_ring->read_idx != tx_ring->write_idx) {
-		buf_desc = &tx_ring->buf_desc[tx_ring->read_idx];
+	while (handled < weight && read_idx != READ_ONCE(tx_ring->write_idx)) {
+		buf_desc = &tx_ring->buf_desc[read_idx];
 		if (le32_to_cpu(buf_desc->ctl) & DMA_CTL_STATUS_OWN)
 			break;
-		slot = &tx_ring->slots[tx_ring->read_idx];
+		slot = &tx_ring->slots[read_idx];
 
 		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_TO_DEVICE);
 		dev_kfree_skb(slot->skb);
@@ -670,9 +684,10 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 		handled++;
 		bytes += slot->len;
 
-		if (++tx_ring->read_idx == tx_ring->length)
-			tx_ring->read_idx = 0;
+		if (++read_idx == tx_ring->length)
+			read_idx = 0;
 	}
+	WRITE_ONCE(tx_ring->read_idx, read_idx);
 
 	netdev_completed_queue(enet->netdev, handled, bytes);
 	enet->netdev->stats.tx_packets += handled;
@@ -683,7 +698,10 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 		bcm4908_enet_dma_ring_intrs_on(enet, tx_ring);
 	}
 
-	if (netif_queue_stopped(enet->netdev))
+	/* Pairs with smp_mb() in start_xmit() after it stopped the queue */
+	smp_mb();
+	if (netif_queue_stopped(enet->netdev) &&
+	    bcm4908_enet_tx_free_descs(tx_ring) >= 1)
 		netif_wake_queue(enet->netdev);
 
 	return handled;
-- 
2.56.0


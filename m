Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459227;
	b=MvKevEpJwqXf67N3SAeyJZNIfqhOcVPg5mmxWzJNm9AIk3a8LUmzy2QcNffNN6pWLKCk
	 B9WTrW/UzKLRzutj7hx2e7S/51bAa7g04htVVwmSYduiYGmKnqS3tNvErXAOHSEXMAe7v
	 XQ89FfpbGDjmuKVRH7AWxjUJB0Xjvq+UJq6YyQJHZuiWbMdfEsKyp+i8Z2fBfD1HLjOiq
	 JOXbbilpnKWjmHMz5YzGYAcue+HceevJBJhBjmQOaIhCHcCWu22fH3vzhWTiuEf5puiOQ
	 Mcg/uOsC/2eWw3KTA8cE3imUqGKeYeqJsZfVutdKupmF7vRI/2lQcfcIX/BoDTb3Hww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aReQhoQDtTjsXQU7L8MfhGPbTYfsAF+OFRMYwi8UI4I=;
	b=c4P+h5PanqREn4ZBxK+WZAOHOxKVE+M1BK/1Z6Qny2762PAwf/pVJb0q+bo+gwTXqGLq
	 LQ4ZJqjBYhTDkBmgRUHOQHzYDV6Mlb0kIp+0yjoLlZ8K/IyyJEwofpubLfMKwXhpzvs8s
	 CUg3RHZ6pBeeWbrByGakMCwzXrJCHRuKX4qmeW+6Ra2kve+NpXhup05KEcEFAH1cUShhV
	 PQkjOhRS/ojw4uxckAQ0BIuVKQwFmFfw/VGOfmvbi6Ch/KzKFgs1ePCDbx2BxGeVxvvMM
	 9eu6IIjPKuhC/QR8dPL7D2JpJxi7fNe/Npmoz4BcdEBYXmwysjiKNkM6Ad059qdvL3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OO941wBz;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B645606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B645606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OO941wBz
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7154528eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459226; x=1795064026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aReQhoQDtTjsXQU7L8MfhGPbTYfsAF+OFRMYwi8UI4I=;
        b=OO941wBzSWdMLo4wQ9thfK8QgXLDpqmIeX3mxdrhKhazrWjN4RKBRPpqehxIM19qkK
         1UPMhaCGZuieeimncw6kbFuQIcaR0YsNA/yzyg/mbarqMiHkqwHYYm4fx1D211gplKMk
         WYORIdPuFG0TChlouMdmAjc9WgHd+tCJFNxuo95Uo4nfnjEe9jXy6va3Tx7jNohYJevj
         25mtyRJRCXiC54lH2NRf7duME4Mvq72/W8z/WmwORIyO01vpdyICKLOp+3lKiywsUEHC
         ggdQCp9o+8hND2oVPZ9RAS09+CBRHewiBc9uzJAAJXtIvT49Cq1wGmgMJiq1APRAXfAo
         lpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459226; x=1795064026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aReQhoQDtTjsXQU7L8MfhGPbTYfsAF+OFRMYwi8UI4I=;
        b=APJv9/K0npmoAFfHGN+dTY2SUSInVFQ0/6ion99Y1ReqQ7wsxuYF9MNtRgZqQ/mTdX
         vv6dM8m6fkup1aRvnmE5lIJXVtqYM/14bNrS5UNrU0uDGN/1Tr1jTUfzeZ2TF/8A4tjb
         JQ3PPZbSVipQpO4ZDG53leRQVTmiaZ5ejfopby/4Yfw722mai/5hN8gi7dTRezsSqtw3
         v1outgokxIabKo6GoN6KUeC50mmn2CR9Q6cnUyxso/iZCczYwfHfftPifzcRsPBbrDX0
         xQZr9hAGEBmJiBHwRFSYvW5WvAlh9DpaqpfJlNWnsoGBs68BmKOJkBO7UMqfMMueiLsJ
         CaOw==
X-Forwarded-Encrypted: i=1; AL+hErERgoOj0Gd8ERdphdhSNciI0d41M9qp1TGpLCJy2U5Ssq+k7OOF8hB6uvjnAH2ATEcJOAzwNXMsvybF3XM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BPbHm+SFZAAoCJ2b7eZ7TJVMFiy+jTGkDfjvmAgNhAHHg6Ryh
	yTl6Z89s56RNr+vcbmsqaa8E3nnFVLl9GDDr02qYULJRj7ZLrtO4BK6g
X-Gm-Gg: AYBFou2jRujDZQojnXNff4tp2FofhQ7Xg6JBZYQ8/yy0EsCEiT0BhrO1lt934L0ra2N
	J/nqaCnV3KWGDdj74uBsuc81bjrxTM9Fut1v00LBDkBDxXi/hKqT5yCaOIaZsO+1iF+z3uybsmI
	aX2fZ5zSyFoZUoZzmskF7ncKvuk89x8VgAEE2miw2Dxj8zjJjPga4Q47GuO/vmx6WC4QnGtyVWJ
	4bLmXyHQsOOudRomkEhJCpmtYETZfYeGy/1MTuyRM/bXK1+QhlutLOlfweK6trWDP53SoTUIj57
	cRvAZeMUsTlU+6J/jB9p9vq5RXTDzMiNCph+WP53swL617g00SoJlKU+EQnCadX9v+PjCF6OAUV
	gp7xMPpdEDt8r8vqfGU+OF3N2baFavqBR08IG/dU5O3T+dZzqz72LKsExtYJ218x7bibHqi9uUt
	T7vBbaRzfpOkQUhs2OCOyvH+59JaLio+Oybl4ia3ZwKVh+If8EM8SsgU3qEuguY/o00B1YMsKvy
	yMZCPWDxAn/oIszgZ+iKNiNpqlyQUi/bctmrn6ViEniQfpKmY6C/LVtZELcdrN7r7VljNB9KPFi
	4Rn64JgQHg==
X-Received: by 2002:a05:693c:20c3:20b0:343:9eb1:9940 with SMTP id 5a478bee46e88-37686759540mr4770613eec.26.1794459225474;
        Wed, 11 Nov 2026 20:53:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:41 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 05/12] net: au1000: serialize TX completion with packet submission
Date: Wed, 11 Nov 2026 20:52:47 -0800
Message-ID: <20261112045301.3669532-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

TX completion runs in hard IRQ context while ndo_start_xmit updates the
same descriptors and ring state without locking. An interrupt between
netif_stop_queue() and setting tx_full can miss the wakeup and leave the
queue stopped until the watchdog runs. Use the existing IRQ-safe device
lock in both paths to serialize reclamation and queue state changes.

When submission reclaims a completed descriptor at tx_head, advance
tx_tail before reusing it so the interrupt handler does not wait on the
new packet while older completions remain pending. Consume the copied
skb after releasing the lock with dev_consume_skb_any(), which also
handles netpoll entry with hardware interrupts disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 6b2e216a8361..5ce106d0389f 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -872,7 +872,9 @@ static void au1000_tx_ack(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	struct tx_dma *ptxd;
+	unsigned long flags;
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_tail];
 
 	while (ptxd->buff_stat & TX_T_DONE) {
@@ -889,6 +891,8 @@ static void au1000_tx_ack(struct net_device *dev)
 			netif_wake_queue(dev);
 		}
 	}
+
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 /*
@@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	u32 buff_stat;
 	struct db_dest *pDB;
 	int i;
+	unsigned long flags;
 
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_head];
 	buff_stat = ptxd->buff_stat;
 	if (buff_stat & TX_DMA_ENABLE) {
 		/* We've wrapped around and the transmitter is still busy */
 		netif_stop_queue(dev);
 		aup->tx_full = 1;
+		spin_unlock_irqrestore(&aup->lock, flags);
 		return NETDEV_TX_BUSY;
 	} else if (buff_stat & TX_T_DONE) {
 		au1000_update_tx_stats(dev, ptxd->status);
 		ptxd->len = 0;
+		aup->tx_tail = (aup->tx_tail + 1) & (NUM_TX_DMA - 1);
 	}
 
 	if (aup->tx_full) {
@@ -1009,8 +1017,9 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 
 	ptxd->buff_stat = lower_32_bits(pDB->dma_addr) | TX_DMA_ENABLE;
 	wmb(); /* drain writebuffer */
-	dev_kfree_skb(skb);
 	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
+	spin_unlock_irqrestore(&aup->lock, flags);
+	dev_consume_skb_any(skb);
 	return NETDEV_TX_OK;
 }
 
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268632;
	b=jx0LDO6b5gyFfY9nzm9KSP06pnxk0FY/2dBbxLgq0QLbClbvVFbiAfO55uEeImlUcsjQ
	 KmA/rvwoJA6ORMfKytVdJq/9i497ZJBKHCQkXWuemly83kkijhURK2gJmJF+FijPZKZ+6
	 HMW6lBtG4PFi0zEmlzK64VNW0h67eJQoFoYnypYSwqj6nYiGMDD4QNylRqcg+kB2UqAAK
	 MuNiJ3vyzSXtViM2Tf5u1F8TAVX/9x4wM00MZ0UsnGmN3K4JTBh2SkanQ/Hgp9EH77MeL
	 dPiXh34aJqDMs+gPPABGvL+Q1/lwPjN5YLhh2tnprUUv48ofALelgSYNWMJmhqzTX/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2HfnaBPYg3WKFac5pdvEXkz4OF4nU+7Wrx4suqm86rk=;
	b=JYY/rH/a3j0WNvLpkRbMtGEeyY9MiYufyE/AMPOstcj1BBjiEneSpZXC0xAHTtEI6Anw
	 7WhxStZzfmHReH/xVD8V8uWZu2ioI9ytQJtzGEoHs0LDDMnlT90V+mJQnTXJuj9MvqvdO
	 kxZ55wCJAO9LxxIVi3edTxX3NB4sZBuzMK37ii4DShlTE6v6R6oz+xe1diL2KhTBiuxOW
	 +wD99qx0vLSn5B9aeIw2iCVLWHuyrfbH2W2zb3hNOAgtiMdrkup/tUrCPcrA7UPO7t1SF
	 S4eSKROtR1gOqkx2SXmnYaY4zoKbjMR+fKd2tKkr1A35NImHbb9CjNH4AaYxRc3aEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+7GOkCI;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518E60A260B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3518E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+7GOkCI
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d21051042so223284666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268630; x=1794873430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HfnaBPYg3WKFac5pdvEXkz4OF4nU+7Wrx4suqm86rk=;
        b=H+7GOkCIJN/d3/JlCCHY7oHITgnmXbKTixiafwogxUc/5Unn4kppA5F2fcv5GRHqg+
         5SsQoRbtS9NZrFsSbyCbTpVbqqArTMKFwexo+Fcw7B0gBCGfJE2RLGNDljUeAhw0taAE
         GzCh3I5sVczomsokWVbhM7XJl2qcV8a2UHoHf8AWdmKcPvczKILRDqaV961VX4bFB/EG
         8Zo2258hiiyrILdsHVY2yBmeIHxR9YEgNJZmuv/KwHBhTnB9rA+P50CjoIYSUUCj8TJU
         nd2QIJ6nvcunD0AajWGg4MaioY+AOZUIUqYUhgN/eeBJYxzxl8f4eOFqCe1OEG1kcQtv
         rh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268630; x=1794873430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HfnaBPYg3WKFac5pdvEXkz4OF4nU+7Wrx4suqm86rk=;
        b=hX+Ett2oSw7q71lAhCXCRCKLQPhFuBgpVyRiaDKwq9KLR8V5YqxWxKI/ZRpD2f2qZN
         9HYPnXz5IULPdlHGdHPIR4gOFWLtuSBv/YWjowh6k6rcR6F5vGeXpDGA8GBB8e/Z9+RM
         H6cyLSYpK317h24YGuBesFwKLUA/Jz7Kf+jIPwRhTmO4eqbP7V0mhoN6WSh+DUBYkgA1
         BeNpytjdYxXJumPucYOPr5JgvHpcApOI9PB4nvJfto4drOZVy3MiKbv7VBqwcaTohSow
         ykTn50WVG5WeThkNcxwShScoCorV4PnzuuEInkHNrXQcw78xEnAoH6r2pMCpymB2PZdd
         XpBQ==
X-Forwarded-Encrypted: i=1; AL+hErEHL+20if/KDJsxnSgswY4TMbzXgwN2CLUTrr3InvXiR92A+ZdO6vC9Qsh1DYHRPgpC8RKhjfNBvOx+Qis=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zYU7auIOOUG0Kx/5hVJ/u0Jw5UK0ASnG/d5C8R0pN5Wn2wRmB
	lRJanXLysCnE4KPTHiDzMHPm9NW7zkbyKwygZKJ1QHxdFtfjSKKIHbiI
X-Gm-Gg: AYBFou2xaUOaqlJvup/fmD1XB6ZecOewL8t6qGYsqf+AWlwl8XJxmnmET1mNHNySDWN
	cBwucqN8AnmlfU0uYTcc8LX6fGki432O+EUEhatIeg8kuLmowRB+K0kQycv55o94wwnewXnQCcO
	bHBuD/toonkZmqg6p4ylyFomJftiOhx+iChXiOq35vC6DM50AnkSDEkw/8/o2eBDqtFNDIkP5Sk
	ZZ4da5TOzT+auox6DCn81nsNPMxf9oToQQ3O15Oi7B2dnvF4NxL5/UjjlRi+s/4S4dxmpUyuxNR
	vDY8Hi6KO4yeJT60r1AE+IL7xypGs+RMC/yxR/JME1Vt3+1SyOttOkWEOXV7u9Lc+pIInXb6KJI
	cISel5X+iYVkSmG8g+/IIGkPBfDTHn21jkqQpBe6MmwmuQLruKKCBhZi+ykgcrt8/SW/Jhzxdmc
	wBMkgYIL97Cg/TV7rJqzC5HWo5rYb/a6Fa725ik7ROPrvtcOIV8Qw013ViGh5jZiWXHOjMCMvN4
	ggDFBpogroTilk0COM+1MEIFl4ezx1ZM6JmSUzbUC81k5dGmupR5SP/kFYT4X3U79+GqZftO6M8
	pe7bDptmJicKckU4HYcwgpnWL+gwJLKH7f5as1aZ/JZNVrNGpd3/xAw=
X-Received: by 2002:a17:907:a88d:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c504a710e76mr57150966b.15.1794268630492;
        Mon, 09 Nov 2026 15:57:10 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.09
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
Subject: [PATCH net 2/7] net: bcm4908_enet: drop a TX frame whose DMA mapping failed
Date: Tue, 10 Nov 2026 00:56:55 +0100
Message-ID: <20261109235700.2586821-3-kudzo51@gmail.com>
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

When dma_map_single() fails, start_xmit() returns NETDEV_TX_BUSY after
it has already stored the skb in the slot. The stack requeues the same
frame and retries it at once, and the skb is left in a slot that never
gets a descriptor. A failed mapping is not something a retry fixes:
free the skb, count it as dropped and return NETDEV_TX_OK. Map the
buffer before the slot is touched.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 01a3e1d01..727ad1e96 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -535,6 +535,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	struct bcm4908_enet_dma_ring_slot *slot;
 	struct device *dev = enet->dev;
 	struct bcm4908_enet_dma_ring_bd *buf_desc;
+	dma_addr_t dma_addr;
 	u32 tmp;
 
 	/* Free transmitted skbs */
@@ -554,12 +555,17 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 		return NETDEV_TX_BUSY;
 	}
 
+	dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(dev, dma_addr))) {
+		dev_kfree_skb_any(skb);
+		netdev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
 	slot = &ring->slots[ring->write_idx];
 	slot->skb = skb;
 	slot->len = skb->len;
-	slot->dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
-	if (unlikely(dma_mapping_error(dev, slot->dma_addr)))
-		return NETDEV_TX_BUSY;
+	slot->dma_addr = dma_addr;
 
 	tmp = skb->len << DMA_CTL_LEN_DESC_BUFLENGTH_SHIFT;
 	tmp |= DMA_CTL_STATUS_OWN;
-- 
2.56.0


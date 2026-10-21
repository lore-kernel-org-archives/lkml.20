Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541867;
	b=S6MSJrutNBu9zuDUPM0y0ppblM7C85V2nn01TVsgSKCZL/gCxdwBYgf8eFvM8fXjEfwt
	 XpaLCzytpBQCfTxtSBWeNtQ/mHSK8m2mS6vIT34X+quMJc1E/N6bUQC12cVqrOph5dRRU
	 EO77Bnq4Z3fbcHJHPSS5syAFIgIEqPQO1sPfl+M2PXFqyYVKee1EAVZXaXSWzofrDYcRQ
	 ZMlOLKbJhbwyy/ZPMB90KBJXiEPPE7zHs0A3MdGDFMZRStvFZ8sqeMx3bn0DRNzsJL92Y
	 Qk8W3h2B9zYA7ptBl65BvZA1MyYsM8JNq9j2GtLMGW80HDKyTVmDxvodnmdBqUerjfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lt5khUmxw1gOh/n0LWJhaeEcTc68Du7k7RW7yXiy7Vc=;
	b=LbemXJ23bYD8Mv/lcMgqG/oQBxkTJqL1/uePodepmdgCthgfMTpcPmsywWw5kvApcgqc
	 hfJwJ0yOjwXzypiq2u/wosztdo2Ia/XSYZ3U1cwbwm3MkoMOeKlZU1Ccmjx4ZKyuBuVSN
	 all/OU/OgCjwe89nu/M7mb/fMhxi4KvexrhqcYn6RA9klGAMipNdimb6vzzkYWoYcblyW
	 X9Dmk5TPKu6HMvlCv5rzZ484pdvbq847O1rarTiarhn0QBonpWAcLUUEagkrylLS2mE3Q
	 7KO75yqD/bpPo6C0CIS2//VFRI/gKP0X6hUVvh92uFFAZIO3isnBrqORrFNeESAwZEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cQKJTXtP;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD30E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cQKJTXtP
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso42418a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541866; x=1793146666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt5khUmxw1gOh/n0LWJhaeEcTc68Du7k7RW7yXiy7Vc=;
        b=cQKJTXtPOqOBfFDsdmTJkZ2OP3TUQ+Y7iAfiMLRmfMLaIqO0Erebw7x2fl65rR0bGh
         sbjaFbYwRmB6kLa0h0kE2q74WqZs/o3MZgPrRBnZK/rL+g+zM/SRNseY288b/1ROKBxl
         fNq75cihBGfySJuNAyMTyIGgm0wu65y/Cxiwj+YoX6i8mon51QsSMEGIAdNdpR5WUP3j
         1gfAx96eeFXrJCoNlqPqr4aII+X7Qj9c/MobJv8GDGKk9ZbJdkm/pJeMowAnJFViHZ3n
         hP+vk55GI6uy5SEzGFn0ALTe1QTHOY4KceT31X1uYHu74UsvLASz09PFWJC3ADKKF4R0
         yeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541866; x=1793146666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lt5khUmxw1gOh/n0LWJhaeEcTc68Du7k7RW7yXiy7Vc=;
        b=s0WcdVMzHIZ7/UbleNWkE1Fka0thUFpXTJwohAeWK5JVLHQMcRnK1gPrmgwO3oLEU4
         9yg1l3wExXLPviERDqy9Nor3DhOdJx2kjL72iU/PFz1JOJNHAU7mFfG4wIvR4bOHDgq5
         /8AFz9BMFLSJdMS2C0PakmXxV1TdK8teoJdbfwuQ6DWB/B95rEJ+CZr6FFUKxec05GD4
         ip1GaSMh4RTA2uDx6rh3ezarIlRVQTxDslDuk5AiRMdVSVnKMiWVO3KOEsdAC/l5uZ2k
         vkb7HNrYGmNboKzs0Ng4fH4ZrNZJUguuvqnoPNxZRb0217TT8QBs8Sf+7MFbdEThx8NL
         Leiw==
X-Forwarded-Encrypted: i=1; AKwUvBxlWD7vWxbhyeg6Xh0s16VH2o0wN0pjTz8W2Eifs2EBs+o0pK2MQyW/RLF5FGi26wjeEh0vO3hCPTKf3ic=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwfO3XtcCuaNo1ofxPViBpx2ptzL+Opoe4SHWl8bJpu0sufn+r
	oIZ/BQy7X7opMUx8s1huu/Oi+RHCA5Ter626AbMLZMCvsmk/QAL+iu7K
X-Gm-Gg: AYBFou2jxkyIPrcrrDfVxC3zTfQNnUYlOvsVhCG1+JuSqptQGHfmHnZvGhtz2ZDrBJ5
	epbObojGZtVnPAGjvN5PDZEeRpwGGcLerugZV1s1CGV463gi26ImIP8Wm8kNfHbEFsLoECXKqlE
	ehzwKLctNoaIa0fgt2WKKq3sTc3OzxAzRzK4uYK1CSoncUtwYLjY4GVcSg7uwJCaRp/7TtULPkx
	Tp1tKzkvu+QXJH7vhVakpNUy5QxqBsDKZEloTEE9s8FG1T2f+sbjjcvCTvW03rTt03wZJQt/xvi
	Gk/jhjDgpMfKupqr1Q8ogqu4ouO1kjC6F5ClVbl/6ws5JH3+UEZH3Ywa7Z12g7R1n3gAf+PQTlk
	PCuVq3Zt2X2pB1Ax6CT9jUBSId08pntl3XVR3ZNo7QWz0EcMYkEIym93ngl9nwkngc5dM6mkQYF
	riCnxKTP/v+0kLUJeiiTNV5x12VQW+bbYZkC/irV/0o7/8DesQitANXmUERvHGTpl3ORYB5/fjY
	adlXpB1ni09z1wqASQclArBMju4mxVjj5ukp/xP9IqGiSLpNEmgkxqFsGUblE2r6kmuZui6aylI
	4ZEzvlQ7n7x5Xo37C3ATkhXUWhjhEyEU/P+2Yi9dcWCcvdkJZzcucd/E6A==
X-Received: by 2002:a17:90b:2f85:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ad86f6e8camr387246a91.39.1792541866147;
        Tue, 20 Oct 2026 17:17:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f38df2sm547894a91.2.2026.10.20.17.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:17:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: bgmac: fix TX DMA unmapping and slot cleanup
Date: Tue, 20 Oct 2026 17:17:44 -0700
Message-ID: <20261021001744.2042320-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When mapping a fragment fails, bgmac_dma_tx_add() unwinds with the
wrong slots. It passes the failed fragment's slot->dma_addr, which
holds the mapping error, to dma_unmap_single() for the head. The
fragment loop indexes from ring->end instead of ring->end + 1, so it
unmaps the head a second time as a page and leaves the last mapped
fragment mapped. None of the affected slots get their dma_addr cleared
either, which includes the head slot when mapping the head fails.

bgmac_dma_tx_ring_free() unmaps every slot with a non-zero dma_addr,
so tearing down the ring unmaps these addresses again. It also frees
the skbs of pending TX slots but leaves slot->skb and slot->dma_addr
set. The slots survive a down/up cycle, and bgmac_dma_tx_add() only
sets slot->skb on the last slot of a packet. If a slot with a stale
pointer is later used for the head or a fragment of a scatter/gather
packet, bgmac_dma_tx_free() frees the old skb a second time when that
slot completes.

bgmac_dma_tx_ring_free() also picks dma_unmap_single() or
dma_unmap_page() by looking at slot->skb, which is set on the last slot
of a packet, while the head was mapped with dma_map_single() and the
fragments with skb_frag_dma_map().

In the error path, unmap the head and each mapped fragment from their
own slots, and clear dma_addr on every slot the failed packet touched.
In bgmac_dma_tx_ring_free(), choose the unmap function by the SOF flag
of the descriptor like bgmac_dma_tx_free() does, unmap before freeing,
and clear both fields.

Fixes: 9cde94506eac ("bgmac: implement scatter/gather support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: merge two patches into one
 drivers/net/ethernet/broadcom/bgmac.c | 41 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index e66856337d33..55d126c7d35c 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -205,19 +205,24 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
 	return NETDEV_TX_OK;
 
 err_dma:
-	dma_unmap_single(dma_dev, slot->dma_addr, skb_headlen(skb),
-			 DMA_TO_DEVICE);
+	slot->dma_addr = 0;
 
 	while (i-- > 0) {
-		int index = (ring->end + i) % BGMAC_TX_RING_SLOTS;
-		struct bgmac_slot_info *slot = &ring->slots[index];
-		u32 ctl1 = le32_to_cpu(ring->cpu_base[index].ctl1);
-		int len = ctl1 & BGMAC_DESC_CTL1_LEN;
-
-		dma_unmap_page(dma_dev, slot->dma_addr, len, DMA_TO_DEVICE);
+		index = (ring->end + 1 + i) % BGMAC_TX_RING_SLOTS;
+		slot = &ring->slots[index];
+		dma_unmap_page(dma_dev, slot->dma_addr,
+			       skb_frag_size(&skb_shinfo(skb)->frags[i]),
+			       DMA_TO_DEVICE);
+		slot->dma_addr = 0;
 	}
 
+	slot = &ring->slots[ring->end % BGMAC_TX_RING_SLOTS];
+	dma_unmap_single(dma_dev, slot->dma_addr, skb_headlen(skb),
+			 DMA_TO_DEVICE);
+
 err_dma_head:
+	slot->dma_addr = 0;
+
 	netdev_err(bgmac->net_dev, "Mapping error of skb on ring 0x%X\n",
 		   ring->mmio_base);
 
@@ -535,17 +540,19 @@ static void bgmac_dma_tx_ring_free(struct bgmac *bgmac,
 		unsigned int len = ctl1 & BGMAC_DESC_CTL1_LEN;
 
 		slot = &ring->slots[i];
-		dev_kfree_skb(slot->skb);
 
-		if (!slot->dma_addr)
-			continue;
+		if (slot->dma_addr) {
+			if (le32_to_cpu(dma_desc[i].ctl0) & BGMAC_DESC_CTL0_SOF)
+				dma_unmap_single(dma_dev, slot->dma_addr,
+						 len, DMA_TO_DEVICE);
+			else
+				dma_unmap_page(dma_dev, slot->dma_addr,
+					       len, DMA_TO_DEVICE);
+			slot->dma_addr = 0;
+		}
 
-		if (slot->skb)
-			dma_unmap_single(dma_dev, slot->dma_addr,
-					 len, DMA_TO_DEVICE);
-		else
-			dma_unmap_page(dma_dev, slot->dma_addr,
-				       len, DMA_TO_DEVICE);
+		dev_kfree_skb(slot->skb);
+		slot->skb = NULL;
 	}
 }
 
-- 
2.56.0


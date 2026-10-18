Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7063D47C5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365233; cv=none; b=tyi2Me40kgKC6HnHwJ/z1HigXwvCOO8Dt2h3ILU6iT5eneCMnHLYMoLdLJq9U5C7y/JjhQ+PLUjOAIx6HGoglVaTR5w4wr4aQUWZRHLkYq7q9jfjltPoXXmRYbhcT2m0h4yTXHxoI3x8gl7Ogyv+lTpioLzMrhMfpvEDiHV5Hqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365233; c=relaxed/simple;
	bh=H+S/vF7zqBlmZmD9v/uR+QGG8M1L5rQ9//Aah8cWcGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6+fvy0Wwbf9vpWwQnKZ9wkQVg73b3YKf1/wnSwcn3Vpk0c3BjyyEh792c8lytSKIjyYyMJuBfc4TCH/RNyru71TI9SOylT7rWVuv//FT4ZtVrqjZYFtJbTHX57hCOVZxYNFSOjxz+crY5fP2k6xkTRPPB0Dmjh3PMVRXAAYDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6swpvV4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6swpvV4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so1185313a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365232; x=1792970032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vPqHr+Gg0B5YUPN0hepny7OsCrNhKrVgDwpy9W2Jn9c=;
        b=M6swpvV45jZPtM9cKPK+0su8gNDsfv9Da18tRU0YTB8P0ZEOgJQosmemrLcHii7y4K
         I1tdMXUexVjxZhwKTnVdCpH0T93Ft9+qKQq55MmVyJ1KpUGoh1j3qD94/rRnA3LnWBEq
         nWLIciJSiYuQfWqBfTmnmVs5GBcoMscoAwlJvDydtEEbzkH+NQHmbB9GpeJ9E7CvdvWf
         gxxbPCPgKNX0FC8XrPa/VQ+c3rTxFTdCYR8D1N8w1fO7JbCZfovqj2olIYAiU6FYIpkT
         btQOCHdguIlqWQvcmfJXC2t8at2alcUxD4dr339SpeheB+fo81DZsu2zFtpFh8YhPWgV
         8OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365232; x=1792970032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPqHr+Gg0B5YUPN0hepny7OsCrNhKrVgDwpy9W2Jn9c=;
        b=QVJn/9K2y6uJc7uj7W99pe4x3uwLgHs2jidep6aS9Q9FwhFvcd/tw3v+y4TWiTlyPI
         wI/aSjO0df/H4tl0Tu1FDEmLtC8Ki4MHgTx6exfpsIi+PgBDYp++a+3eNW5n8AnBV5u0
         X55UYdp3Noe+u9dwkkcIkuJNJQT/FERc9IiUbO92eSXpMI3uYCbY1JBlNaJyySuAq5Fr
         DE6wgqIQpvo2iUoWHJNWAaIUJRznfSc/zh57XHDv0OzkGOUvKwieVUzXYFJY7QNHcw/A
         fE744aAyM486CFiILUuBazUPYazzcaLIbKmHQw0b29MhQxKpmXTEFkFYJeYWVRl5W3li
         pNlg==
X-Forwarded-Encrypted: i=1; AKwUvBy/FES9B3Kys2DnGHu3LY8xXqVxGjSZG53wuS2Hn0suYZYvOKJVSU7qS4VbVELhLFoswdyVfD4YSEcdk1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT4mLDmAceJTrnOJkHuMbcQSPr3ZNuqrrF0W2uU4INA124ACbX
	cbSl65VWtIMVW6/P++V/Nqc1hQfR9JzBF2id7c5xsevzjBwYa/57Bp8f
X-Gm-Gg: AYBFou2VqTtwElTMqQwbd2UkWOj5+EiM/LYfs4j9LuhOAnZIdDqHjI2MvA7RBaZsrkE
	9XPU03vWII2HY5b9IuEwLGp5w1hHD54/qDEXqZo8eWwxGH62DakdpyLe7QPpVgcUHNvJhmD0chE
	VW+0Vqcb1VVYx2PBgFHTJSQeD7mx2p+6FpvYFul5WcLIgjAVUyQAYHDBtCh07snHtCaY7de4uxN
	Wpz1nxp+spOUGg2amwJGK6Y4dFbKDOGHRFDFXXR+r6ZLZ156Shgiyd+KATnKGUPt1PFXc4KAXAp
	onLHNU5ox2btE5HREKKt3ZtybK+50NGPQz5GhURffEeLulWLBZn5jt5ma1mPTroQ0X3dchF0BJc
	lsr8LL9VymN4tGGC/t6mOEYfiVbqPIYfz/7bnKu8rzV2zOl5fP0OwBY+3WrjxVU/XEym3SKxqUz
	5k9uPL4IIupIV87f5YgXDNbsniU1gx4glbNv7uYnJbbMK/iHtoy/JVt0T0DPiZYwVv83Sa7/z8N
	PRU1wHnCX5ZMjaKv1IKReBC47gc2DrBaHRSYW31zQbb52tUfn56ECYqhzx/CK7FXL0xgptEkDcG
	mtL4q/TVuQRh8HKlXEFhZPMXzvtJ6rvsa5hOeb68wmT3o2yTRw==
X-Received: by 2002:a17:90b:2f84:b0:3ac:7613:1ec3 with SMTP id 98e67ed59e1d1-3acef29cff4mr4311436a91.37.1792365231878;
        Sun, 18 Oct 2026 16:13:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc492fa54sm13087225a91.13.2026.10.18.16.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:13:50 -0700 (PDT)
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
Subject: [PATCH net] net: bgmac: fix TX DMA unmapping on fragment mapping failure
Date: Sun, 18 Oct 2026 16:13:48 -0700
Message-ID: <20261018231348.36884-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mapping a fragment fails, bgmac_dma_tx_add() unwinds with the
wrong slots. It passes the failed fragment's slot->dma_addr, which
holds the mapping error, to dma_unmap_single() for the head. The
fragment loop indexes from ring->end instead of ring->end + 1, so it
unmaps the head a second time as a page and leaves the last mapped
fragment mapped.

None of the affected slots get their dma_addr cleared either, which
includes the head slot when mapping the head fails.
bgmac_dma_tx_ring_free() unmaps every slot with a non-zero dma_addr,
so tearing down the ring unmaps these addresses again.

Unmap the head and each mapped fragment from their own slots, and
clear dma_addr on every slot the failed packet touched.

Fixes: 9cde94506eac ("bgmac: implement scatter/gather support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 1835266fdd09..134eff89f787 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -208,19 +208,24 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
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
 
-- 
2.56.0


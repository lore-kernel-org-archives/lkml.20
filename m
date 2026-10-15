Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A24A206F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073045; cv=none; b=dyz0v1u/f+UG0FQHpOOITBnxSUCC0h3GDQ8b8ZTAlVsp/kWMDilYZa1s1KsycJow0FLQU0gDVUIqraOi3OaBB9rdWEQ1qxzFz/CRbvXGPcknaQo794MrHzdVuGepf3SP9zUQe2JsNQsgM8FxN/A4M1n9g+y1HHgBHautPot6ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073045; c=relaxed/simple;
	bh=WnyZVcSqcrDAMAr3wsgBugh5iJthOjasuaQpP6wl2no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UP/ZSCCVnZwaS32Ax+w46Brk954YXGrrzQGc+Wpp4vRwnf8IY+pMBeGICbdl8cFdkuHuVa0CY5ZmaqPtIk1KEMt42Q1KPZpAaOS+nn/UbL4L3K3vdiipFoYLhDm4cC01VlmkHP1qIzu1iCPpBmEU1TobskOtdO8I2nVEY1gWPtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhnhiCqg; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhnhiCqg"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab12c074f1so416601fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073042; x=1792677842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=KhnhiCqgPoWAis6qYRLFIOGx5IbzFTvDgtTaW3yTULuCixBcvoqTPr5QdpWBpJmce8
         lRn4xd+AxAoLXL7pMp0pOUoQf5AAXpYBqMF/P3gQdtoLtdVgQm9wJvtqsEP49LRTvKTy
         Pucrrf832VU5Y582f6f3VuXE+Wk+M+njxokD4JrhmW1D4ybF7355AUtBCGqjWD0XVqrT
         LchpbI1btNdo7VRletmSZ/hGELcQPc0U+g52QUPcoX93nHZxh4KDae5zYBtgJ0HXsXbE
         jDz9dwnYOOQAQI9yBd8HaefwUD7JztC26WvCzrbFWZwcjxHVfQwTfdAeC7pLO1sIhhXy
         oRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073042; x=1792677842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=I+fmYlDGDY2JL8hhZFp0x6XlYWzSivkmjMjs7qiBNWv3hKcj74Am2XUe2vFzmxUnAG
         5RINJ5HTr8yCp2lrcNpF0sSz7QmG+Qlblf6f4D2Qj/C3UVfh/eFybUwRVJQ0G+SuHOLe
         hWvdzWze+dsaVA1gBFdvr8s1yrgSUOFXCEbZXHiSOhAdBHQr7QPKC3COcKCnSAG7qbDi
         LrAaS4NtwNpWSPTpq2IICQzhS8932aDcTsuuelb1R5nJ1Hn6QQodBVGWNuj+c+GYsJo+
         xzqtXKd4zBIGxszuykvzA9BtxshYhIX+jNBV/2Nb8RG9E8zSeYgdErmepNB/wkFI0IMc
         sMpA==
X-Forwarded-Encrypted: i=1; AKwUvBxlGhsdwZawI/aMV/ebI1eZ2rWQu4cS6o1fum/ekgkZ/EMXkpJXGIqRTNs++0mRm0SFfPDGljhjRHz8WaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPn/TqyUd4qoRRBDSsXjckbqPXjbV1ICMSfkQUhsGINtlAFLYT
	tkdAFmXHUgHqxYOGaNtexXYW738gtkhpZ91YAxuGj5pZAS7A05Bs9wQ/
X-Gm-Gg: AYBFou2+/ve6qzy8jptzrtTjN86u7MVkyI8AhkfnV0j3VuChJ1mIiSbw3/jvHu0ZbjL
	MEIC+4IQJfTgV5+0wMlli03p8c5yu+xOL92qKkpfZLT5EwR+1tp3UvL6RauloLPeF2Qhqy7kTCW
	UE0rsr1AfSwfoR6RfNc/izuJIiX70a9ZbFqZMk04lg+ZlyVNUy9VD1i2lwJ4jNPD58qhoJIvzvr
	tDNjXxk/jyVbVu3G8CwFNZPYR+lFN1p/ZAnRvps7tPaTNNCfm7vG4Q7qKVcUzTw+zwqV1F+DVft
	0YFD2KmH0lvHgULGL8975X2k428L0F5snHzKSrAZr9Pv82KXtP/S7GLfqJoqa/5MUqy/PhBOApY
	2MY91exjrXsPpogKDg/ivhqkEAtRYknkiWup3eUxWy37o9oinQpuh1kCshsi4zwj0x8qnR1WzQh
	aOviCqVLy0SmpAN/feBkHfTgDELkKuWKIZ51CLGwq94HrBOdN7lSVMm44qNXWPE+h67v9gPssyR
	YLvhRTRbjDmsFf3L7CQPo2RbjwfTpfLaxVhePPvtAKMeV2TaL0r/78sEsJ094E3uMQ=
X-Received: by 2002:a05:6512:3c9f:b0:5bc:f871:2810 with SMTP id 2adb3069b0e04-5bcf8712b1bmr4822198e87.5.1792073040655;
        Thu, 15 Oct 2026 07:04:00 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48defca3fd0sm8412267f8f.15.2026.10.15.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:03:59 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org (open list:MEDIATEK ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix dma_unmap_single() size
Date: Thu, 15 Oct 2026 16:01:09 +0200
Message-ID: <20261015140110.41988-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mtk_wed_wo_queue_refill(), the entry->buf is DMA mapped with length
q->buf_size which saved in entry->len. However, in mtk_wed_wo_dequeue(),
the same buffer is DMA unmapped with length buf_len which is set to
SKB_WITH_OVERHEAD(q->buf_size).

Change the size to q->buf_size.

This was discovered with static analysis and was only compile-tested.

Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 7063c78bd35f..4f720ec53e20 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -99,7 +99,6 @@ static void *
 mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		   bool flush)
 {
-	int buf_len = SKB_WITH_OVERHEAD(q->buf_size);
 	int index = (q->tail + 1) % q->n_desc;
 	struct mtk_wed_wo_queue_entry *entry;
 	struct mtk_wed_wo_queue_desc *desc;
@@ -123,7 +122,7 @@ mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		*len = FIELD_GET(MTK_WED_WO_CTL_SD_LEN0,
 				 le32_to_cpu(READ_ONCE(desc->ctrl)));
 	if (buf)
-		dma_unmap_single(wo->hw->dev, entry->addr, buf_len,
+		dma_unmap_single(wo->hw->dev, entry->addr, q->buf_size,
 				 DMA_FROM_DEVICE);
 	entry->buf = NULL;
 
-- 
2.53.0


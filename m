Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507946A5FD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141992; cv=none; b=HnqOO/qo1yP2giwMy+FMdekYiEUFhKru3aFQhESsL4MowDv2L2l5v3VUF3YMXqfdXn25h8DNZuRZPYdRcvEH9A3LF0X+myE4k3tECyXJRiBwqfpuOU8RcuMiGLcy3gxuyaKx0QPCNcKiC58DX+un6ejudgYoBkGALwWo8WGr34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141992; c=relaxed/simple;
	bh=rUJYQSuI+MzYXfpzfZnBP1kIyuFVh0MGSn+0u0Ma/Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7FSVqzzEqtcvcPy3d6xnU7dSfD3K1+XTCOS+k3YRiEBDPrVKNqWib62tUsEMMQHpXkGqDHnvV03TIXl8Qjt7+jK5X15RtntrY18k/R/AOgJl/Q4QhAtMyvZoR4YULUGkruUl5+GF8SwvGrUCe0ooTWlNb2vMThPGqrI8bvXG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qryOYlQz; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qryOYlQz"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso3405828a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141990; x=1792746790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/o83MrjUD3Eacil49PDH6LIS7qqkykZOJ1j61n2I+M=;
        b=qryOYlQz1ki6fc1Gdon0JUpEWMvoirk2Gs/z5hwvW1vVxyI1tYurVKeVBlLEntNXbP
         rh0dc9EJBXHjLq+lUwHsjtHv3Se3HqcEIKtF/2FxVpZy/oT/V4Sd6tntKfbJHiqgssop
         3o3HR8p/huSTj54+uAk9ID4NzTF+iBQBG+7xA69NaUQhzuLcQrYvmOxIVcNQr3rBPOmd
         sI4sXXoIWbuC1KnAhlVgp2XpJxbbAoAornlqR6mP+OcrO+Icf8G/qpX0IjVN65brfPjk
         cyfJ9D7paf/dxgpCGHuLMUa3zPjlUT5Jya9lbfyCD4lfVdsQdIa7zyopqsNH29SyW8iW
         A0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141990; x=1792746790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/o83MrjUD3Eacil49PDH6LIS7qqkykZOJ1j61n2I+M=;
        b=mH7cIyaL2BSs0WYoC4QGQ//6Ny4rYzK4XxfniVcVbcyouaCiofI5edR1GgPr2A2pLP
         qNl8fCnv5cEJOUjkXtqSV+xVRF6XP+zauVKYldS2c8ENaFjt1+GaHq2eOee3y23e5BY4
         hFzQNg/XCBDDjbBA/sKgWODVE1SGiydgiebNtHM24hYPJPW8BvP4VsA93U6WDInNj6Kt
         B6tSp/wXSb5/s+cLNChKJ/+PRqz9ceQ2ipatO3OTLi3BWvGtZQJBlIUQsvgMiUb0LaEz
         ZbXPap4RFjD4Rbx24Y7lNfwJ8mB2pLT6FHjThHixNJq7QRhklerJlE24ObHFmlk+tOCD
         WzkA==
X-Forwarded-Encrypted: i=1; AKwUvBwGXSuih9tb+XjZ2lCXCKl7XlAPVa8Mad5PeJ6p3uAAq/H9FL85UUAVqa5qw6xI7w7YrkHviZfnGcjyX4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUglBCM8L45sh9AT6t4RUGNY2IjXTPhoWzjTWyn7up4YgYNIw9
	ok4ba479ipMk+M93235Duiw5XMtGprLpr8xYNRCXw7PLzk17jBWFBg/X
X-Gm-Gg: AYBFou3M5KtfNtE4DhIqFPsMKWH+81lQ6QOohOwOf8IYqcW7j5lAKueDwJpgLmRyNiV
	rfIAY+FO/lwzh6RmvfoUd9gxKE3Wk9ztRxQQO6gOkpcfwgfWnlW/aGIerocV9UW9D6Mi5i0olX+
	NafCDqsd4wN1LzK51e7UkVG5YrlS4kccSwntC+HvQx/CwC10JS/I5yzpSXN1YGUjBK24/8fV64H
	tSOjTmJpZtp70Fs9ztM8jVCO/KyNiB5CaNj+w7UX8kg+0yp1lS+Ias4KO+qrh2sm5+DQxBgCgDJ
	eNqUQWmu0Oy82BWFLQPYJ2JmPMNax9lzpzH51ebUNy86r7Ez5fGDRWWkQVXuWbPlFCFSIYOZXxK
	QPPJX+518fakBaHUQj6kevC1WRB/7dFBIG37x9d27Wxh87P2D1hmV9lhWcg/NiBndjEB3SRYQL5
	TuX/yrxMLK6TtbopF6GQf7zlnAfxRg0+F6RR/b0f8ED2xm78SRfqQym5UOwQ8u6wotTsolZIGoe
	i0CtPlX8CEORxp0Q/SoNvNmph+X4FwJJAtU9jtnYfv5q/0hLQ==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr18771119a91.12.1792141990180;
        Fri, 16 Oct 2026 02:13:10 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:09 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:36 +0800
Subject: [PATCH net v5 4/5] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-4-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141974; l=1493;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=rUJYQSuI+MzYXfpzfZnBP1kIyuFVh0MGSn+0u0Ma/Pk=;
 b=L0as7tLnYzXS+Bqtr1fz9FPvuHKDSa9tmnSYahzb18gVgM0Oe4uBm+MqAIXLmIL6GfYKXrcr0
 5E3tQHHvbQZC3w3g8mnFEM6uuaJT56L7ZPMaub/Q74s526GTmqiIVyJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index b8264435acbe..3a7c2bb33691 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2355,6 +2355,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
+
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
 			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +

-- 
2.47.3


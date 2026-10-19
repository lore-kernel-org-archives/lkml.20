Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C8504587
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420408; cv=none; b=czQ+P6t22XKYjcxyYGyS/4CqLP9KsKw4LgqIjSizpnrZicgkX5v3DCGEPUdmYgSIPzB1oHGEUCOwCZhxExkfmaCU2NABTK8AniB8gbQJvuDn2F3PIKhpH2X7/y5y7faX3PO2suzTA7xbCK1kC2C5CcsX/94eUYbU91bOAkyQIxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420408; c=relaxed/simple;
	bh=HkPfe4TwSkVsbnZmS4H8xckQ8k5iAfFxgOmrbcXbDY4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WoqvBbqJhwpHTear01vPWbFGBJl04iIk8ORgIO85Z4Z/A7RKhTm83at1d6QN2JQyQoPjtR22oClhYoFLnhBI5P8mwoH/MI5fG4F/R8Ev5YN2AAsGNq2Mk9QFioHvbqTZ26jjheS7OEUvIRDOM2k4sNxCdvsQD4ANjWWFmqXV63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYkvkZ6+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYkvkZ6+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a056ced618so48128b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792420407; x=1793025207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjxEHDZhnxdkStUSnVdQe9iZZzJrl+XY6zteXqLUhxo=;
        b=BYkvkZ6+I2101KxneXqIrnwd0x9FAN8CDp6MlXghoF/zAegQ2x4TPXi8zzZ8yvfxpa
         naOrhjf0yzux96+Nu34k3aUlERG/gJ0VqEIY4BBIS9+DJGJdw8Ne7nZuLL1PCYmfEYvU
         pcuGFt+4EqpHFrvJaBoEKYJSqlfw02z3Qetd98b23PIk7+Ih9XuIHXwN5GLzHj77kRWi
         Gd2yCElCcAXK8ZG1IH43CQy9O4L/QjqyvjSdQqCjAW12AnC3q3D7ANwtwn2+ncTVcSK8
         nlrNDcQSNp2mhfYKBgc79ktfByvl7YYwHyNrxOLZUxTOcm1LYGfG1+7Is8NNJ6sMFZNs
         ViYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420407; x=1793025207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rjxEHDZhnxdkStUSnVdQe9iZZzJrl+XY6zteXqLUhxo=;
        b=YjrNjY6/95+RVk4efMOAIHKmZ9U8tWu94jwMYkZ8N8tpQCbjY+zI4GD6GZSSeimAjs
         I2FNbkeH/Oj5B6t7jGD5+qheCwHWFk3o4L3o1edNwNAHGQYxphkcrAhKbGlSB6HF5sds
         PGUvvZZblbGj9QUhfHCQ9D5d7YtlwoMP3TVsJypUw6BRiuUdNQzo6PGxt060qLoW7Diq
         /y0fHHM5qtzQ24hAk/Immk+48A1Uhtsk53zjqGYj77O7pRRie2B/lmgYNCOCYDz1zlNj
         qcrht9fyM9fT6AXFdrfRPsrLviXIYpg+kHsPTPY8CmxhAvlC2zh/1nfpOTI/eHJ6E2g7
         Fkrg==
X-Forwarded-Encrypted: i=1; AKwUvBwbp/oS8qwqEbCq41QoF8ywzM4hG+RL5RZU3jABOZm2w9WpMadxDJelJG0VBuVyIinxGBChCNQ+dcRxpRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/9Md5wkLebuKThMR3He0Xj1K6T7uykokb1WuEBZ3YUoRASBhL
	MK6e+HJ3sGONIQ6Y1shwRQt3bH2/Zy9uKKbI/emgTkqUkn497nlCrCuc
X-Gm-Gg: AYBFou2Cs6CLA6IFdFcrIcwI2fUdWmSGlz1LX7ljRCzrX0VA4mU59UQlOiqqd2kqtOK
	xPTYLqP6gKI/a6XzNuTayU2UTIFrBaoQA67IxDRxAjgrTKLzHzKoyVJ481ujP6MgtY46ikfKFzg
	ICt7TmdQXGH2pkOnFDpJsugZMlu4jNWyeJ7ioEHnt4gozCz9jMpgkNZEgYvrh5y9buvoPsRxwy2
	kqS+/MHa2ZS83iCCxLBenKkh+JfBk7W31hS1aCyu4ZeEr4TCkEw0gttYi803E8GO/rVe/xMI3LD
	cfOZcV9vo21W3DlCrJsLipRRZCC3B6liuj2QxstY3x77QJ56XovKoyKB3TvqMc9g0rQLRVzGqWd
	HfZpTMN65k1urvqWe/uHy46LloZlW91LNtmxrG0qD3SYX0EuVptlhQsoCcW67u/ZZd+YOV3KhZo
	5JGLz3i9b4Jlr67SpMD7H+nvZ51ACH8aewksPTuzX43ywtl2a/ARstIgU1SzCdPRDsvizGcF/ti
	949OP8=
X-Received: by 2002:a05:6a00:4807:b0:89d:88bc:d9f5 with SMTP id d2e1a72fcca58-8a04ba25e3amr6477601b3a.3.1792420406628;
        Mon, 19 Oct 2026 07:33:26 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:db98:829a:1281:5d10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a06a6407e0sm1249239b3a.5.2026.10.19.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:33:26 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Guanxin Li <bruceli20040604@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: wmt-sdmmc: release DMA descriptors after stopping the host
Date: Mon, 19 Oct 2026 22:33:17 +0800
Message-ID: <20261019143317.2222236-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wmt_mci_remove() currently frees the DMA descriptor buffer before
calling mmc_remove_host() and freeing the controller IRQs. The
controller may still be using the descriptors, and an interrupt
handler may still access them during this window.

Stop the MMC host and free both IRQs before releasing the DMA
buffer to prevent DMA or interrupt accesses to the freed memory
during device removal.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
Changes in v2:
- Wrapped commit message lines to comply with the 72-column limit.
- Moved the DMA buffer comment next to dma_free_coherent().

 drivers/mmc/host/wmt-sdmmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 489daee4f4fc..55675aa8d08a 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -895,15 +895,15 @@ static void wmt_mci_remove(struct platform_device *pdev)
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS0);
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
 
-	/* release the dma buffers */
-	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
-			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
-
 	mmc_remove_host(mmc);
 
 	free_irq(priv->irq_regular, priv);
 	free_irq(priv->irq_dma, priv);
 
+	/* release the dma buffers */
+	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
+			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
+
 	iounmap(priv->sdmmc_base);
 
 	clk_disable_unprepare(priv->clk_sdmmc);
-- 
2.43.0


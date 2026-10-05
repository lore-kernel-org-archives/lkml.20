Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C437DEA9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238000; cv=none; b=ffOS7dZuSUlL3Nb3F3HvkWF9o+aB088GtaYKNPa7N5f8JibpL4CVLleJWTMmD7NMiqBmxvIEMvZ57ERExhYlN5tPT04LeK3INShtsvSxFHPEYKZSbeAGO46StUmK7/2Q+wonJjTMHBjOLHH6fFZ9kTPcE6iEyOif76db1KkIVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238000; c=relaxed/simple;
	bh=V251f68AK2V7fciivPQ3/BNfSprJGGjRz02NZzkvc9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ln3z5YxdRVamLCcqYlXyT8vkyoXqpMRTB4hrB2s8UCdrKz7Ke2PmOKeab2uFn8nprI82cKnLNUuy29wW/eHpWzgTPB+SeJnudX/355oOkf3ZMxQezUvp27Tnsx7aedxdGepRFHgcOxG8JnDFyHNy86TGLzuEfiiJq6zaOCJd0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sO7zk+53; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sO7zk+53"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso11706185ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237999; x=1791842799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTKWejYowm2p4DJaJvyyuvQbEpNVbY+JknPKvn9wkJo=;
        b=sO7zk+53ykV2XWNu41c6R1tEIaGqsYLAraUqTSqbYEFfDNYoDDVt9/o73U7eNCLmw7
         PzgAlGVjCoXzEbDmlulF78XmMblyYXu1m7knHqfyyhLGGGKtwur0pUafAfnfkJ4py4yl
         EAIm15MkddaZj/iQnGk6MOAPIT+eR+PK8f/y/DFF5lUFw1prJKM+bK+prAGTbyCFyLcH
         XSMsqFMAqQSxQ/Pm0hS3GAcz9wwcc6hTg0c6naXp6QA64XLshWnHMo0QdzSm4dNNSLQD
         KzxYO9/wJ/2F04LM1ssgo78ZvHAfFfFtOMOhjOXOM59icycGAu5cVPpOPpoRLPJQzxh/
         RVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237999; x=1791842799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTKWejYowm2p4DJaJvyyuvQbEpNVbY+JknPKvn9wkJo=;
        b=csO1wyxm0V2JhrU9Xt7fWs4xZG+CvNEyz8bJv4C54k2zDmeHJrfMGw8S/XIpNuylRG
         ubyMWw/cOUCNpJ2qQOClyuSdBW2Ry2aYOwy5xO/LsXX0sUvRAzyfCSpHdiHlk0clLTM4
         IgSsWiZDYze2UebMrqqv5y62yokPXr2MYz2WVrTSphO456NZaGjUI1x4AU5HwoLQJj+6
         ZSgS4gBuUhG89K+VGglRrwGtbcaqanU3xhBbE4dmvBtRG2X46fGtOnAoAJPRW+OyiTOT
         4X5C8eO5su0ViTwQl+otPhvxj5pabDqR3SmBWS2K+MZpT18oY60GxMfenP7UP0PhTGZJ
         1kaQ==
X-Forwarded-Encrypted: i=1; AKwUvByTBU/lCOvj1OXz+KS0Ju2+vLqPb5A9YCLNT3Oj/p2AOlS4idLI8PY5MgmvkeoYmiVQS5RVkqacT91H3v0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKc8+1D2enALBnlKDvCL0zvM8VYZmyZH/ZSEZ4tvMMaCYbZ2N5
	kGdcS7GxEPn/K4jM9QtixNsqYvxEB/2irCIKBbZDI4D9+svjhARkETAK
X-Gm-Gg: AYBFou2CBeMBjgQXEvPKqHkouMsl8nqDjL9H27FjIWcu22ELglFFs3rfvsmUJUXpIOB
	1kmaRDw8hdPcAnnEkxIvv8WJ1euCXLSgV6sCpLSocO98Y76Y4EUtJoZJTJrwnKo68CbHGWxllL9
	AMiZfBD9rYoHyxDvsQRiMyqSruMII0IIsG/TglCMbFj43WtR0FMGS6jtxPdZT6ARcd+tIKMSvIh
	Ub51zs9T5nlp4OutrXqPGWrstL0wTDwJtvd68vRidkyU/cV7vZ99bzB5ED5l2BGvhkWzNHHLPG6
	3duzENBWs4dqRAq4bWuJOu4+B3YX0vhmkm9WfMGWPugfbSF/A9w+odYYk3i7P5+om/usv/FxonA
	aEph69wT1utHSl7l1hrDPsWBH3/+v9tc31Le3G66H90PPblAMa6swoxLMIYVQXwT8a7SK9+ULR/
	CSMXXfaKTMuFjVOhnQl2kt6g77V5sXe6+4HJCrrccmMJWZUvDKJ+W+D6SDHJEhkELukZ8s5vCMG
	dSOOtKeD+igOjPTVy+cyMuGflXQhjMANvQMgJeWCVfgDYobAkFQFzx+BrnnxgJl
X-Received: by 2002:a17:903:191:b0:2dd:c053:d741 with SMTP id d9443c01a7336-2e49b684cffmr118013695ad.40.1791237998457;
        Mon, 05 Oct 2026 15:06:38 -0700 (PDT)
Received: from LAPTOP-BEQ9FFIS.localdomain (60-250-51-133.hinet-ip.hinet.net. [60.250.51.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecbdd3sm13723035ad.48.2026.10.05.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:06:31 -0700 (PDT)
From: Pin-Hao Chen <billy920225@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pin-Hao Chen <billy920225@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: stm32: fix double free of SRAM buffer on MDMA fallback
Date: Tue,  6 Oct 2026 06:05:28 +0800
Message-ID: <20261005220528.7199-1-billy920225@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the "rxm2m" MDMA channel cannot be obtained, the driver frees the
SRAM buffer and falls back to DMA-only mode. However, sram_rx_buf is
left pointing to the freed buffer.

As a result, stm32_spi_unprepare_msg() may clear the released SRAM
area, while stm32_spi_remove() or a later probe error path may free the
buffer again, triggering BUG_ON() in gen_pool_free_owner().

The probe error path also checks sram_pool instead of sram_rx_buf. If
the SRAM allocation failed and a later probe step fails,
gen_pool_free() may therefore be called with an unallocated buffer.

Clear sram_rx_buf after freeing it on the MDMA fallback path and use
the buffer pointer to determine whether cleanup is needed.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Cc: stable@vger.kernel.org
Signed-off-by: Pin-Hao Chen <billy920225@gmail.com>
---
Found by code inspection. Compile-tested only (ARM multi_v7_defconfig,
W=1 and sparse); no hardware was available for runtime testing.

 drivers/spi/spi-stm32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index be88e62075af..605b847d8773 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2511,6 +2511,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 					gen_pool_free(spi->sram_pool,
 						      (unsigned long)spi->sram_rx_buf,
 						      spi->sram_rx_buf_size);
+					spi->sram_rx_buf = NULL;
 					dev_warn(&pdev->dev,
 						 "failed to request rx mdma channel, DMA only\n");
 				}
@@ -2548,7 +2549,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (spi->mdma_rx)
 		dma_release_channel(spi->mdma_rx);
 err_pool_free:
-	if (spi->sram_pool)
+	if (spi->sram_rx_buf)
 		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
 			      spi->sram_rx_buf_size);
 	if (spi->dma_rx)

base-commit: fd99864b0ac936e870c7ae28354c5cd3dad5efd0
-- 
2.53.0


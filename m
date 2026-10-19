Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D264A3F34
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418033; cv=none; b=VYBGdmtI+NjgwVtSFya5KPMBD/oWnL2H1hCkVU5thya4i97otPpJa8fXH37cURneea7MpTjGEF0ylx/O5WcCgoNpAd7CuZpDg4RkTE1W817wf6M1EIDk4BDUzbr7r6pZOO29hUN2iNpyu4kiTixBwBFBL8cjRPpqBT68TzE3Azw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418033; c=relaxed/simple;
	bh=zsoRutJnx4JOxfaFJBrKcctpwUrhOWkjDKLwKrTyt+A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=N8R6XPYQenzrjF84BqPKEa841iTFDJBzWZco1if0vSHelH2cYDLVJh9cIncEv0pW3a4QrRtQp2WNoxR8C34wLjwZGlHYykcfBVQvikUPzkaLb4jVINkooGfDyohbwVaP8zF8SrZelonzAIm9Mb0urtI367ehH/sTHsGWI0xc8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeoXrWKi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeoXrWKi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so80671a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792418032; x=1793022832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZf5l3nm0qL9va+rXssexyiV+xjPumJIrkIx3ruN0bU=;
        b=SeoXrWKirbXBeNeSjS1nnmPbYH0YJ9yPBcBM2W5HSIN98o9CfpW1oppwLQhOqGKWa9
         7p1Ag89cZOLotss2IegljDWpEA2j3bn89gBqL/DbuGCgzpaJbc/0MV6F14YkMOcU8LBH
         sMhX7CEFMk3YdSo0Xoi9iBuj7TcTfHy/4k5zD9LgVB76TFVAGwja8w/5DBB92rvBt4Mq
         At1vSmGb8zul80TgeLSQLuxsyiBI597ONxGWt3Obco2OTwiAKYaLWlveVdnaSgOvNSij
         xT4AoEj+uCE/ocucYtTFBiI3w7IYEm4svhQHkZP8wRetKolKBD9yT615Oz5GBBNQjNY3
         tC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418032; x=1793022832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZf5l3nm0qL9va+rXssexyiV+xjPumJIrkIx3ruN0bU=;
        b=URKyxXNIEfzBxfL1o/ZkY8VUHtnGSh7ff5Jr4K6Y9zDvRNEYvoUtZ+ynxv2tWSax+2
         l3vdCJbFm8yDqpB42Oey2WXmo2DhHEb0aBi5anFZTQZrqq8wLofTq+Dq7trRUENwl8+7
         +43L1X8KsMMBq60NJ7zpRK+2lxhwKODmq16935tlB2sTIQm0O6KSAyD4CBS9qc61QavZ
         A1ycMSbzLMI/xCoeWpgE2nEdkXPDfovJ1aVdskoHE2PsZZSP0wNmCfTox0sRl7FQkuNh
         o0uIcJPad9RM8diWsfU/31QUh8GXp2mCrxJKCssyfkhI6iYvgj2AvV/UpmD2Qu7/OpHH
         U30Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbsUPGO4g9YLSeRzpkBDVaKa4/aMxghxrB3kW1zPf9edINLezHlIrcjX6w0pfpTdSRRrFXmQ2esDXYDXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL0DIA7HmzG6lMspnZN7iuirTBtE1qFEDM8ojNJ2BpRbAcqpCF
	9XDhuUUffrC9GABT2QhNnw7TEcQ9R+5GpqCVvM68lTrQ4MjrYLLVXgCB
X-Gm-Gg: AYBFou1MYi7GvDRjMz9Q2GNqcDzAz8FGLndMBAMEpQu368Ceummw8mxi3vAVbsI3Bnv
	nMImAvGr8Qdh0DKynda3cbrjphjWfFs+hYIeVAusbDuufGzAUHJ4Et6N/T/BShh55gh9JHHHTzM
	zhD9WFepnSGDKEFXZjLCwNAGotZqnmjUY7nRaf6qpaD7Un4+1N1+RxrGUXLRFV1AVa3ZuVurZp4
	8yxFah12v5FOZlGvPlsWZSZOjSmFO70ZnLuG/4jPRDg+wF0KTyTN6VKZemK01kfixxcWXw02iGm
	C8HqN6vaPH8TXOCx0oigovO/7PArgYTTTiXL/8jV+Gy0N5Ha/BkItEIkkqYw1Tx3+vMoUuXMRvG
	ikp0Z2MiSE9aOud5JFhBSZRCaSf/57qHyS2zdZQk0SK8ZPgofgXt9psvEAL49uERLTIITx+s5P/
	gDKadK/FZzWDQZhCShGnwHCYPEsk4ZVd5g47+PNUa3Qe73ajooyozThb/oPbd2mJ0ltFBCtyeRW
	fRW+7dXyb2xadHYTA==
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr10757870a91.1.1792418031830;
        Mon, 19 Oct 2026 06:53:51 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:db98:829a:1281:5d10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm23337328a91.9.2026.10.19.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:53:51 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Guanxin Li <bruceli20040604@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: wmt-sdmmc: release DMA descriptors after stopping the host
Date: Mon, 19 Oct 2026 21:53:07 +0800
Message-ID: <20261019135307.2074577-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wmt_mci_remove() currently frees the DMA descriptor buffer before calling
mmc_remove_host() and freeing the controller IRQs. The controller may still
be using the descriptors, and an interrupt handler may still access them
during this window.

Stop the MMC host and free both IRQs before releasing the DMA buffer to
prevent DMA or interrupt accesses to the freed memory during device removal.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/mmc/host/wmt-sdmmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 489daee4f4fc..c44befabc909 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -896,14 +896,14 @@ static void wmt_mci_remove(struct platform_device *pdev)
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
 
 	/* release the dma buffers */
-	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
-			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
+
 
 	mmc_remove_host(mmc);
 
 	free_irq(priv->irq_regular, priv);
 	free_irq(priv->irq_dma, priv);
-
+	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
+			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
 	iounmap(priv->sdmmc_base);
 
 	clk_disable_unprepare(priv->clk_sdmmc);
-- 
2.43.0


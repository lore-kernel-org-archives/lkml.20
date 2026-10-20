Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510618;
	b=z4qT5ra4rEOfyBe3RU3ftMsKkgDEXX0KUrihULjagEQd2MqII75usRvoZRA4duSLvRWL
	 +bzOrxI16//7vB9tA4tqa8h4+i8NXjOrgg4ssH6/K3Dmn9q55GPtrAaTM8yQ5GaDotdaT
	 q2rWhSTE2mFjHuoRydlLOCgjUynzqaKKULNYSr2/8o7wwkRKvfJ7ngJo0TDEidDEfNH5t
	 rziZQqWNS5XRhxeQIImWovtP1Iy634NE0Mqxug8BdV7BgLIARSfkkBOaC1Rxve7vcgIVf
	 eYAHhIg1CHtBqU34spT6vm4DuyfwB9ax/63jZYxROfYoWNH15vIasg1Ccp+nLGemOPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=;
	b=EnecwFoEVDZYaN1lq0g+wrHjPX37Z+NC1CuuvauPhqzit6doa//rYZy1tbJd8IInRJ7g
	 EqM3wmtK9knvnJdK6CU1nHFK7CcnDnPJrHnLzhG7amkbxcxgkO7fEzI53ZbGpjiap5Nhn
	 cgdeD3okh9nE4BBp4I+wNfNAo9rNTPS4tqyZ67DtC0vGQKgckTuKsdZsYgASg4ElnfoOU
	 3xUoetxwzviIiba6wfTaqc0fubmvs3Sf+q0nOg+0gomYUYRmiqcUcHubZ0E4jie8NunYf
	 k8FqLw1LLq9OGIbDa88nQXPrxTD9yfIp4hDuticJoZcH6cLYz0f+bq8kRpOjzZlLukQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QxwPQKAT;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C539606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C539606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QxwPQKAT
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d01548ac96so1507415ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510617; x=1793115417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=;
        b=QxwPQKATMMhq1wcaCoghwBql8AJi3xjPSAVIYzLLmzrdmYVKsQ2onos0epejV9xXNm
         db3Pp9xm6ceGTfW90WhW3oOfIt5noanhnvThBIrnznlX35Fg+JCEBF4zo69y8IWFrEct
         i7mpzY+riOHUuW+S0V/Tps/rbJYjulQwAGxtsJnjcLNc7mbOx8lI+j4x6wJsvV1Zi687
         4ecu2uV2EKVt5USTxElS6gxk/SRAlso+goKjgL/5Cq5ZUXArC4WYSr8eEenxx8wXKKGX
         0SRJ0AHvCUw1ULKJk7uFFEQiHyFkXlJiuwUJoG4QDBPtkGPo5jaHU0SZeSHxaa7NqVnM
         DCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510617; x=1793115417;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsiPImWCvspsQxeNXp3kuF7NO55DXC+1f0q/BU544lY=;
        b=nRtTex5WXmGIQlkqlO+bkR48+dfoRKTvHfUIE6tMt7646+bby6QvnS8Ic/HTDWAwg1
         KZazylyQL1hWskhx4zBhu8KjShz5FOvf6SuyDZK+QAwaylW7c7+YerZmsAniWNgomKu+
         lewZKO7wqi3D4zOXoh2nF41PqSWhFX8KCNLLNrA3gfhoFVoGhuVB9Uaq9/LA53mtlyOW
         v5nOmy2vEZSooxELoM1zbQOqW3gen+UnC7FT5kOtgAlItb2HAOVwEtLFYeOINT4OkJ0z
         gb/ZoL9kW6T/UFIdpXcUTqB+qaIjXWQg1i1H6dxu4yiXQsQ8atheLTwz53G6sIgRnFL3
         zlRA==
X-Forwarded-Encrypted: i=1; AKwUvByaMfB/Jhahy7EVBJyKyqNFII46GNes9qrisPt9NNxdc0apvawkIkZLLpAO/YBt22GS+WJ3hq5nIrSAoOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpQvGFQaK4ZEhjsNsuu9wPU6iTEquXeIWOCc2+XG3tCIjQiFyf
	B5YBjOlul0eIjlOZFGwyqXkQR0N+JCI5bNmyfughmv/D1Goy5d2Q5lyh
X-Gm-Gg: AYBFou1EvzrJcIRCLrS0j5zzaCvkUedgFq64kWizvU+L5jtZBgUDn+NsqK6RZmb7u9B
	SQqE3nAhEL78kE0mod1G5ZQJI4s2TcrjWVQiBtbeuoQco2bsaaC02QfQKSTF9pwPMfYG4SryVC9
	hJ8WTyUCY4Kq/zWNYzHhnfBORRYzP8EqUIDmgf7hF9rVk7+NC7pQJMMgllMtBZ/HglAl2a4SPep
	eUyyPQCm+748nYCoU8wEjQnjmnsvTd9n/qLI55ULtBxSrp29kvXBPWFOyHW24SzznE2/vS+NxhA
	aA5gVZ8ftMImZsbWqOghbLiJX/cpSz7aIzRfQT7bl5H85n0LdYBYr/RTLEGXXf0XFUuDPxUTVK6
	GUbBwjI9EuSftTpCXU0mxqa5RaG/knS3vfvSeyryPZcdG4yT3P43BmMUZj09IieF1cArG5pEVGx
	doVTQ/7A4blX5/Fmr+WnhPPbtSOMBPv6y/0jeApoymZvieNhIW0Yqf4NDw2loQDRF/1x+xVIG1D
	bgps3q+NWyaHGmy4kQ8gngp6g==
X-Received: by 2002:a17:902:fdad:b0:2e9:4f73:83d4 with SMTP id d9443c01a7336-2e9a6d2404amr167599885ad.4.1792510616796;
        Tue, 20 Oct 2026 08:36:56 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486970sm736655ad.62.2026.10.20.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:36:56 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH] mmc: sunxi: fix clock and runtime PM leaks on probe failure
Date: Tue, 20 Oct 2026 23:36:47 +0800
Message-ID: <179251060762.3832.10358805890614600473@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

sunxi_mmc_resource_request() enables the bus, card, output and sample
clocks before returning. Several failure paths later in
sunxi_mmc_probe() leave them running:

 - If devm_request_threaded_irq() fails, the clocks enabled by
   sunxi_mmc_enable() are never disabled.
 - If dma_alloc_coherent(), mmc_of_parse() or sunxi_mmc_init_host()
   fails, probe only frees the DMA buffer and the mmc_host.
 - If mmc_add_host() fails, runtime PM has already been enabled, but
   pm_runtime_disable() is never called.

Besides leaking the clocks, this leaves the clock enable counts
unbalanced, so a reprobe (for example after -EPROBE_DEFER) calls
clk_prepare_enable() on the same clocks again.

Disable the IRQ and the clocks in the probe error path, and disable
runtime PM on the mmc_add_host() failure path. Also handle a failure of
devm_request_threaded_irq() in sunxi_mmc_resource_request().

Tested with QEMU's orangepi-pc machine: with forced sunxi_mmc_init_host()
and mmc_add_host() failures the MMC clocks stay disabled in clk_summary,
and a normal probe with an emulated SD card still works.

This issue was found by manual code inspection.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
Cc: stable@vger.kernel.org # v4.18+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6d73f3..437fdadb5950 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1354,8 +1354,13 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
 		goto error_disable_mmc;
 	}
 
-	return devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc_irq,
-			sunxi_mmc_handle_manual_stop, 0, "sunxi-mmc", host);
+	ret = devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc_irq,
+					sunxi_mmc_handle_manual_stop, 0,
+					"sunxi-mmc", host);
+	if (ret)
+		goto error_disable_mmc;
+
+	return 0;
 
 error_disable_mmc:
 	sunxi_mmc_disable(host);
@@ -1385,9 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
-	if (!host->sg_cpu)
-		return dev_err_probe(&pdev->dev, -ENOMEM,
-				     "Failed to allocate DMA descriptor mem\n");
+	if (!host->sg_cpu) {
+		ret = dev_err_probe(&pdev->dev, -ENOMEM,
+				    "Failed to allocate DMA descriptor mem\n");
+		goto error_disable_mmc;
+	}
 
 	if (host->cfg->ccu_has_timings_switch) {
 		/*
@@ -1467,7 +1474,7 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	ret = mmc_add_host(mmc);
 	if (ret)
-		goto error_free_dma;
+		goto error_disable_rpm;
 
 	dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
 		 mmc->max_req_size >> 10,
@@ -1475,8 +1482,13 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 
 	return 0;
 
+error_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
 error_free_dma:
 	dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
+error_disable_mmc:
+	disable_irq(host->irq);
+	sunxi_mmc_disable(host);
 	return ret;
 }
 
-- 
2.54.0.windows.1


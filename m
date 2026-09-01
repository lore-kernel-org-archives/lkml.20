Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3436921E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223368; cv=none; b=qQXWwo+Nc72kUb9uXzIicx3eUzAOo6YE2LoUo75juo6WCYKGUV9lgBXDxBihXa2/C4pZJq5GnBF3wFETbQgAgjLFfq5eliokZxweEAp62KWmtWAmZ3ktCiWbdCngFRem86R5c+LzxRIXx0f6Ft8gkA/Yoi2+m89U3U716AVlF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223368; c=relaxed/simple;
	bh=KdMNDBqZqxmcpTa/hgYEqTjCMbfkO3FX5YQNlA4Ocdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VBVIaFXXkjZtmLYfb9+r8U01MybyfLJGNOKKbeuXLDrQ9SQKtbsQs9uo6SbQKeaacSvtzEq9en7CcaKbT9DfFY01zGu3Lio0oLG1QoFREFMnWZ0+fIPGXGBk5YeAKdz3iXVLJxlR9RXxADNv20Az5cVKsw4aoi7FGkNIiMhiZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVWYl8xX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVWYl8xX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d956fe30a0so2095745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223365; x=1788828165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Drs41gfRbkz9E/g2UXqU53W+EdIQvwTjq1Q9bophnJo=;
        b=TVWYl8xXhG+rb+mpzEcHhBC+I7NU8qfwANjeOaqMO5FKBuSSKDKkmzurQKzCWsmmxv
         j2OyNbU2PFQRxOOfht8l98YSPf7IAvUBYNBEoXAtonHHogxW67py6yIE7v9oTK6jRbD7
         Of7TB6OxQL9fi8OTt9cTkEBN97arJVOJe6f64Zc1v/B1t3AAafQmNKdm4HwqbDi3o1MA
         4EYU2Pi1lGO2i1VD2DsVwiOoMItrjIZij2U9ADYUBOXQzjowb7kSHprsL6fSzzCQd860
         uogH5KPhBaPbA76Iei/cjiG30d1yL/8uRyWwuylOr0CDzh4kxE2aWneTvt+OCmV2xiQC
         JP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223365; x=1788828165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Drs41gfRbkz9E/g2UXqU53W+EdIQvwTjq1Q9bophnJo=;
        b=RkZXu1ssIDGgazlf2LHXAr3rstp77O16vgpAel+KwokBCq/wRzxH2R6I3v+UYye2Bh
         jYSDY8G/GLwFQPOMBAOZ0n+HDrzG5FdP4ULhi2/78BgEwlDMkaifQkfF8HGJB3t0uUL5
         PfMsLfcaIxr2YbTbf4aj5pne5GHOzWWMvxODsAlo8BAI7ycewIVNRUDjhHlRUOtpA3Ys
         EflwA0baU1KRQdsLMK52eMKdnb1zBBKKkJCPfaBV9nWZDy11QwB7zvZdFbb8bH4nt19t
         49JrZATUuuMICxF+8QHKHZTtqP0PQGY8B1CH7ZlJWxvjVQJgofT1b+/Ma1r0mqdzcgdo
         qcKw==
X-Forwarded-Encrypted: i=1; AKwUvBwfRZ3RzCT2AR8oR7n2JTUa1xmIwrN+3MxCHi8S3Bob1oFYW53ABWKu5vHCyYPbHS3y61Ofq/p2rPgubyw=@vger.kernel.org
X-Gm-Message-State: AFuF++m4ymTqwlfXwpCjDxvBprlRDhLYQiuoSC3Cmr73YnEcafLbVflY
	p29pJ+GKY4IOp2cw9u72frdp+aakswqx/vOL3zKMJoSddXOZ39ETQEF0
X-Gm-Gg: AYBFou0YjbfZuKKWIpVOzFGrYKL09zzEQ8WLxFiHbCLOKdvTB8rIze/9KWOhRX3mrO5
	h7A6P88mMrVEAiPGye31g7b2lvsJ2eVxekslOcBszSw+kXjSKjovyRrV+GrWaB1CPHgRt95GgO8
	8QL6FNW83UlqRt38GlwaMCp6GCutMSRMJBrfIEEzEIVAdIm5yWEbjTuDiPWkFk/4GMUvyiZR8mb
	0NsyMSdc4VNqM009bvA2X3yBuC2hyB3o1hdD2MULnnf/MCYcD5E98C52q3sneyC1iMvx3iSJTjI
	bsLoDcAEC+6GQhS9fvuyfKLIFrK8i1GnkcJlGdcgY5NGTEdnEJp9oTNMGx7K8HunwETJSXszf2h
	B/bkiuLxFBUlWsydcDG28ABI9wKxtHeRvJIULxhkK/HopndpO7w+RQ9u9H24geX0Vi2fnng4xAH
	lbLjrhxosGFjobsesUWIsh3FeEOR+a5fpU9ZCdgWO4tLRXyjbzYnM0JbQalpq01nlrUhXPkyhvt
	r1Gqw6BiRFazigDhKZhz0Uq6MCOArxukLJjeTjU0nCW9JsWRtLTeBEMUUqdQvZlZcIeE5SBBbIi
	6XdLKPd+X7z6pT+y/Osi/AWyoRS+lXXg5GK8A4vIdcosRtZZ
X-Received: by 2002:a17:903:1b47:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d94a8e0e7dmr64909435ad.12.1788223365199;
        Mon, 31 Aug 2026 17:42:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d9055ddfdcsm27702395ad.18.2026.08.31.17.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:42:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mmc: sdhci-pxav3: use managed clock enablement
Date: Mon, 31 Aug 2026 17:42:43 -0700
Message-ID: <20260901004243.50052-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_clk_get() plus clk_prepare_enable() with the managed
variants devm_clk_get_enabled() and devm_clk_get_optional_enabled().
The core clock becomes optional, which removes the IS_ERR() guards
in runtime suspend/resume and lets devms unwind the clocks, so the
manual clk_disable_unprepare() calls in the probe error paths and
remove are dropped.

clk_prepare_enable() and friends are NULL safe, so no need to check if
the optional clock is present.

Also handle failures of clk_prepare_enable() in runtime resume instead
of ignoring them: a failed enable would leave controller register
accesses hitting unclocked hardware. Bail out before resuming the host
and unwind clk_io when enabling clk_core fails. This also drops the
now unused pltfm_host variable from remove().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/sdhci-pxav3.c | 42 +++++++++++++++-------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index d082c4e21aa9..db9dfa92cb57 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -414,19 +414,18 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
 	pltfm_host = sdhci_priv(host);
 	pxa = sdhci_pltfm_priv(pltfm_host);
 
-	pxa->clk_io = devm_clk_get(dev, "io");
+	pxa->clk_io = devm_clk_get_enabled(dev, "io");
 	if (IS_ERR(pxa->clk_io))
-		pxa->clk_io = devm_clk_get(dev, NULL);
+		pxa->clk_io = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(pxa->clk_io)) {
 		dev_err(dev, "failed to get io clock\n");
 		return PTR_ERR(pxa->clk_io);
 	}
 	pltfm_host->clk = pxa->clk_io;
-	clk_prepare_enable(pxa->clk_io);
 
-	pxa->clk_core = devm_clk_get(dev, "core");
-	if (!IS_ERR(pxa->clk_core))
-		clk_prepare_enable(pxa->clk_core);
+	pxa->clk_core = devm_clk_get_optional_enabled(dev, "core");
+	if (IS_ERR(pxa->clk_core))
+		return PTR_ERR(pxa->clk_core);
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 	/* enable 1/8V DDR capable */
@@ -435,17 +434,17 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "marvell,armada-380-sdhci")) {
 		ret = armada_38x_quirks(pdev, host);
 		if (ret < 0)
-			goto err_mbus_win;
+			return ret;
 		ret = mv_conf_mbus_windows(pdev, mv_mbus_dram_info());
 		if (ret < 0)
-			goto err_mbus_win;
+			return ret;
 	}
 
 	match = of_match_device(of_match_ptr(sdhci_pxav3_of_match), &pdev->dev);
 	if (match) {
 		ret = mmc_of_parse(host->mmc);
 		if (ret)
-			goto err_of_parse;
+			return ret;
 		sdhci_get_of_property(pdev);
 		pdata = pxav3_get_mmc_pdata(dev);
 		pdev->dev.platform_data = pdata;
@@ -500,27 +499,18 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
 err_add_host:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-err_of_parse:
-err_mbus_win:
-	clk_disable_unprepare(pxa->clk_io);
-	clk_disable_unprepare(pxa->clk_core);
 	return ret;
 }
 
 static void sdhci_pxav3_remove(struct platform_device *pdev)
 {
 	struct sdhci_host *host = platform_get_drvdata(pdev);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
-	struct sdhci_pxa *pxa = sdhci_pltfm_priv(pltfm_host);
 
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 
 	sdhci_remove_host(host, 1);
-
-	clk_disable_unprepare(pxa->clk_io);
-	clk_disable_unprepare(pxa->clk_core);
 }
 
 static int sdhci_pxav3_suspend(struct device *dev)
@@ -561,8 +551,7 @@ static int sdhci_pxav3_runtime_suspend(struct device *dev)
 		mmc_retune_needed(host->mmc);
 
 	clk_disable_unprepare(pxa->clk_io);
-	if (!IS_ERR(pxa->clk_core))
-		clk_disable_unprepare(pxa->clk_core);
+	clk_disable_unprepare(pxa->clk_core);
 
 	return 0;
 }
@@ -572,10 +561,17 @@ static int sdhci_pxav3_runtime_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_pxa *pxa = sdhci_pltfm_priv(pltfm_host);
+	int ret;
 
-	clk_prepare_enable(pxa->clk_io);
-	if (!IS_ERR(pxa->clk_core))
-		clk_prepare_enable(pxa->clk_core);
+	ret = clk_prepare_enable(pxa->clk_io);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(pxa->clk_core);
+	if (ret) {
+		clk_disable_unprepare(pxa->clk_io);
+		return ret;
+	}
 
 	sdhci_runtime_resume_host(host, 0);
 	return 0;
-- 
2.55.0


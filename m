Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B743E9E0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495446; cv=none; b=iMlOImysFl8Nre9BrHlrM5d/FU4lL1Mjx949OoqP3Z7oZIVY1ux3mu62cTtj5bwkWEVnMVm8v27Soy7VNnmv3Lq9Dfzs0IUGiJpZu/Tm5HCox83KBZ/J8BzVzBV8wPLabSotESTyYjV+GDszjpRLgG7GwYbJ+r1+uLHyA6KLF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495446; c=relaxed/simple;
	bh=81Wt2XNXyDYl6WVqtpYa6ASNpSXJnaXUIKefTZDGZ5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YPLguZrr83agBL0atK+l2SMX25+1DlJjbWgVKwt17HSz/QoOcO9Gamn86OxBiT2gGFgtPWGmeLEY332tPwPaVa6JyPRoHBr0EG/heCKOEnVwIq7ps2ahJsAFsYoBBmy+3T+krwPYwcDQ+MllLTQOssj/F/m0CaqhsSdJzNRM0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4wMaTrp; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4wMaTrp"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso3490667b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495443; x=1790100243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khs60W/bWwQ0dXZ2MP5QYed4YHEwEj2/sVCmkwijT0U=;
        b=D4wMaTrpDOC8dzctQdcuWoC4wYp0e89B8JTPMVuI4LyqP57Bh8kfdc25RmytsM3zYM
         wrE7W8fqKMdTbB54C3hEq7R0xDsPeqrIs7f5pqIEBB0AkcQ5JcSv1z1LyuZmLQ0iIXvy
         ToglwqcXyxkKor/MOYnJRWGNOROefcGZU4OXeoq0L7KVkEZmm2AeqGVdD2C1iVd7pyVM
         I3jhym6GVZuWw3gQjJa7x/0+oY6Ulcqq/AE0VkzVCsSVypuktmr8Ocy9YBKtwYu895oe
         Zd3xUzCfSSle4j3qKzm2hz+ApdkU4xFoZbqG0mFlcJfn32ttqMChZi/NIYiF3uVoVWfs
         TBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495443; x=1790100243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khs60W/bWwQ0dXZ2MP5QYed4YHEwEj2/sVCmkwijT0U=;
        b=ttJTdjnzoWmOCLBALHdv+a0GG0bCYVnrwHpVNyeGXaKcOR0mZ/C8pnJBbEexChUSbI
         YBig8ZiaJfHkBUWhpUJddzZqMmUt0cUrPqf2SFEumA14dHq6acyyJsUtDaKOHvHVLqlo
         J099nQhRCGAHWpaO9ypJ5p7dmP4LtlCGGi3BhgEdIeqvSZjKdBRmfVLhRv/A1z3FN2Cx
         blaURZAWZzViugUZOJvde2c+ElPIivkMFhXQv22m9B6kjX4jO23p107v6h2Q4VuEaSw7
         L1955Mx5YHXneFpwTK7tkKyWekvJEV7BaR4GiPGqYE5Qf8TGMcsEBVtRcfFBCNeGpFX8
         VQ5w==
X-Forwarded-Encrypted: i=1; AKwUvByUr53GGsJCkaphG6sToYi4M3LmPfLntxEg5aaDV1yJPiDfTT7GELfD8h+jzRKpLTDVdtKQWG2g60y1vW4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQP65laRHAaH7Llj/bFbwnRERQU5u53/swRGg9968+MYmsylft
	T8svh/lT5KXZdSB55uc2NLFVVGeTujJ7W3bWSCvJV+h5jxRNaPfrIY4N
X-Gm-Gg: AYBFou2p0Me/dO/fjUSedLyv9CDxRKC7y1XDofyyEZPvUmbe9533+P+eRDcHmpj+LSZ
	PQ0wiogyfEBG/ks5TlxUTno+9qRRq5tMB0ZiPYeGDYuPlJhvSa1gpebwyHcw2LLG0jF6ZO6N0YD
	DNc8vnT3FB95Hd7NOCiQlAj16DaNtZ+WmC5zreY4bks+h/b6ZMlVzot+X7Q4y+RHa6wJhSm46Nd
	zYJZjzsrFnwZpgi52quIbXJhYK0zKlrOd0qtYHWR5U3lCx+IfPkZ2RYfT4ovOQ48pDLwNvmIQns
	MQNJ1LH94PhnQwTeMpQHXuFRl7iVHAwvlsg+JDzl2ydeayN4wjlIvN8MA3xcInk6NOI91mTwSgq
	DLDB0aDNCI7szGSPeSX96yioHLfKWUqlkpjpUtCPfGwiLHpv6YXV7SqGlNIG1y6WSQ+HMVlLhLL
	T6bRX6gkmnoUh7/k5F0Q3lhFJeLWI6Mokqwfmais5nT+Scy+sHdLvn2+R3EDski6wXRGWof89wR
	PIJtzAXS0M5jqJDwqYV0MNQVj6+LM0rVz9LE4WVXGocUDqV/mcHIi+7TUABrtIJRkOMgYmk62LF
	y2S9q6UKuPseOm+4yi4/ZwlRZ3LKZu3MJJDaUn0uMBzADGXO
X-Received: by 2002:a05:6a20:2d2a:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3db404e0837mr18295102637.11.1789495443315;
        Tue, 15 Sep 2026 11:04:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm337275a12.27.2026.09.15.11.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:04:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mmc: sdhci-pxav3: use managed clock enablement
Date: Tue, 15 Sep 2026 11:04:01 -0700
Message-ID: <20260915180401.7809-1-rosenp@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/sdhci-pxav3.c | 42 +++++++++++++++-------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index f39764ffd4a0..c2ad801dc9a8 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -413,19 +413,18 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
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
@@ -434,17 +433,17 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
 	if (device_is_compatible(dev, "marvell,armada-380-sdhci")) {
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
@@ -499,27 +498,18 @@ static int sdhci_pxav3_probe(struct platform_device *pdev)
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
@@ -560,8 +550,7 @@ static int sdhci_pxav3_runtime_suspend(struct device *dev)
 		mmc_retune_needed(host->mmc);
 
 	clk_disable_unprepare(pxa->clk_io);
-	if (!IS_ERR(pxa->clk_core))
-		clk_disable_unprepare(pxa->clk_core);
+	clk_disable_unprepare(pxa->clk_core);
 
 	return 0;
 }
@@ -571,10 +560,17 @@ static int sdhci_pxav3_runtime_resume(struct device *dev)
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


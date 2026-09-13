Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1233D6EE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311569; cv=none; b=HwNG1PHhdAC2Oi0XEGscxHQgzVnl5TmOCVDgw/WsLQL93rLcitUse4/GaBJzVDOQVzl+a9y5khdKmxZSMfYqlFig2a1tdNmOKNIjCno9WPd1QBPk0Rw1DePi76iXQ1xXHkGXiwvwdXPHc6CVSLL4CxAts7FnvJDcfHCGoJpu1nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311569; c=relaxed/simple;
	bh=YSeTXGq1Y5urvm2AfNfvAhzNyUp8BTVNviU+imO++Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUyfDZKEnxkxYGI+M1vMFLzPikJA1q4aRYzq2pSADnu/dp8x3EXEIboyCnPGMhG8vRWvv5sl9QHg0VcrI2YdGo5jw8ttHpGpF78eAKXkoIfjwOlek+xMtlGddawgS+pHtviujK7avM5JbsIFU6KRgpsuQX+0e7vRWy/CHHAJpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9nWPm5k; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9nWPm5k"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1359257a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311563; x=1789916363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxAiZIWTohCHE3URqspBODvbQB2hR6En63VyQJNJmas=;
        b=P9nWPm5ktdxTi8vygHLvmupNqrNpRSKZbgm0UBX2H3lqWDcC3O/f2Wy+wkeA8bGCV+
         c9uINg12A3cCISGcFUDOHWLqtKLY0n1IXZmX+0bR7n2WFUkrk91dD1GxiC+pFioWengd
         TARnC2EkKekkk6Kmjv0yjvgUkkmhQQWSi7JJC0SAwMhTPLmV0i8lSjANvv53mGQTZjLE
         iZOl7BoN32JGGCtqxRwzPGN2hrlm7gOoL7VISHUjvevarPlYlin/4heW61OSXE0UpExp
         vmalsg4B5zqEpKaMQrjnDzQMD+eEPWcBy7wFelKJHA2gNSTAFCpaoAX/+Gi+z8UWFEur
         Q+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311563; x=1789916363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxAiZIWTohCHE3URqspBODvbQB2hR6En63VyQJNJmas=;
        b=WG+ZpnJ6JoNwRzPVp9WTttL4nYGIJQEWkGTKEgF7ikDOszJxdWdnV4HAL8QWvBCbR2
         DukgZWw8vrAKhplmdtA5n8e8T64dqvRnv/OfjyhUcaxms3S2AMAcy2P8mWY20c8jS7Fd
         7xHTIWHYeXzCboMZ9l7lfKorE6AEWaLTHZvloy5rIQ9aopFwwDk0ZPSQswMdoKpnog5n
         f9ckkCYyFyuim+eOCGeeM6esh2596sREAC8t7K90TjLUQx+QmodGz8XaV9c2hOiCvIOb
         CiQtbTcpBhhRUNFCst+PoHcy6cohAapu5Z0XgsIYlVbyOR7ycvHBjXWQGYj4c48rGFwT
         rzhQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/nBrrxf72Ff2PFnZI2roCCiclVK2YN/+z4mwts7NUWeuqqoqpwvMtKH4kMtyb4qHIVaC4ecVnBzxDSIY=@vger.kernel.org
X-Gm-Message-State: AFuF++lQVNHkKJWe3fYIEGcU1JE4i8uSdptoXhtLCsaXfepQzQA1nOXG
	8TDPpee4uM/e2dt9qGz2/qpRjPiVSTpiwzu8QfIVqVMtC2jHxUwb5ukK
X-Gm-Gg: AYBFou1CNKnoHlLM9VDKbfAbUcaFz56jTtFce/qL8C92/UysG2HaiUmFtCPixbqDXaL
	CTcmVc/3CWJhceRIySjg58AAHd3tf8q1VQe/Xe2Xvlmwz5mrDMVmYcImrQTEuig1EBNVUluLH5L
	oaMh0q/O3piyF5F2YOevWbKKa/rQqGjT2FuaSUGLUKB/mS5hyeXksQrzWj1Xm3T7HJcOQRCJaGd
	L4fTE3DG9lBePv5NB0kURz2B/+bZF0HaFI+KwabMi5whNnpcl6dc+NFX+ZJGlbL2lYBcE08WJfD
	y8OGWYFoWYpcUhE71nvU/VAElUgB4VtFwJqjo0J1pPg8tyhUp0ReUPA7JeTN+CmUM733wQx4Reg
	4VdrgrdrJHcg7Sr4n+LeA6Xb/pAbrFmO+SLjT5Mrz72sKbZ/OBgwNjHBtU1H1dcoUwcOpHZ9gd/
	0uwSKCuICuSTtV/KXDp2V/MGcZfslgcJYWOFQqpWI2mREG4wAdkM0q63PKEhVb5aqNxUka8S4v4
	545TCTWVsA=
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr26213072a91.23.1789311563420;
        Sun, 13 Sep 2026 07:59:23 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:22 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 1/9] thermal/drivers/exynos: Optimize clock lifecycle with devm helpers
Date: Sun, 13 Sep 2026 20:28:29 +0530
Message-ID: <20260913145905.9404-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the managed clock APIs to prepare and enable the TMU clocks in
exynos_tmu_probe().

Replace devm_clk_get() followed by manual clock preparation or enabling
with devm_clk_get_prepared(), devm_clk_get_optional_prepared(), and
devm_clk_get_enabled(). This also allows the manual clock cleanup and
error handling paths to be removed.

Preserve the existing requirement for the triminfo clock on
SOC_ARCH_EXYNOS5420_TRIMINFO when using the optional clock API.

This simplifies the probe and remove paths and ensures clock resources
are automatically released when the device is removed or probe fails.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 86 ++++++++--------------------
 1 file changed, 25 insertions(+), 61 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 56717bb50d60..e75040222ccf 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,44 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS5433:
-	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(dev, "tmu_sclk");
-		if (IS_ERR(data->sclk)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
-			goto err_clk;
-		} else {
-			ret = clk_prepare_enable(data->sclk);
-			if (ret) {
-				dev_err(dev, "Failed to enable sclk\n");
-				goto err_clk;
-			}
-		}
-		break;
-	default:
-		break;
+		return dev_err_probe(dev, PTR_ERR(data->clk),
+				     "Failed to get tmu_apbif clock\n");
+
+	data->clk_sec = devm_clk_get_optional_prepared(dev,
+						       "tmu_triminfo_apbif");
+	if (IS_ERR(data->clk_sec))
+		return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+				     "Failed to get tmu_triminfo_apbif clock\n");
+
+	if (!data->clk_sec && data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
+		return dev_err_probe(dev, -ENOENT,
+				     "Failed to get tmu_triminfo_apbif clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5433 ||
+	    data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get tmu_sclk clock\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
-	if (IS_ERR(data->tzd)) {
+	if (IS_ERR(data->tzd))
 		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
-	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1103,31 +1082,16 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 						| IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(dev), data);
 	if (ret)
-		goto err_sclk;
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk:
-	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
-	return ret;
+	return 0;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.55.0


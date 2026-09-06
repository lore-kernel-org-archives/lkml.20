Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CEC3932C6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675544; cv=none; b=tugAtbih033QZVIm6QX6nNEq3M56nybv40fRHfF/docEp9JfCZ7ZV0dJR1O7kz1LCHFdFF8XIZO4xmLk3clfe5PbYdZDy9P8YjiP0OG/UOmh/kRBvjqSv+7s4vE7AYRLL9a9SjarerfCTJK/lqgFWzTLOsTOH+RzKl+1MOsdSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675544; c=relaxed/simple;
	bh=YrTo+zdkKpV5+yJvFwK8zA6/u2dpSvDVFjumOIdiThw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nE/i6IEtH27gEE1x6fSZrOMUdRj6Nmzq6G6LYmsveIsGZj9m8aqSyHKzSt7YiYBizGLjvUPqm3JpBDF/Hj2cIWy7f9xtgT2W1Fn6tCu3Qo1x0CAQ2RtUfaXuSo7GjHC16JClR2IJtFeuh+X9sBp8AksN4fw/1K72jAW9+MsEiqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsb0OBvW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsb0OBvW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1975098a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675542; x=1789280342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=Gsb0OBvWZG5hgVnCleCwk7SOind03/0P5yIBjOZlwk3tdqZ9VRFGrw5VNEYXB7D8lo
         S+eZ3CZKusS1w6z2fZwAHgeG/fHZOS94pjpjrXVlSjtGHMnl2fMnKmDGW0KIXgAAyr+V
         kh6OQ4TY1DzFWgAusyAyzsJa39WE85etLpowMGs/01n3Ay1hiV/yLyQbnaE51C+G0+we
         W6xhQpvByD+UoNlaPDZ6x7IPjgVljha/1KWJngM/bcqoignSu7uzO/C5VQkUK7bH7GFY
         iiQ6ulUOy1b8vzIevMETXYSsLrFNYRFYHHD84km2AI3j95iPlQY5/q/ZCiEz3HwJhXYi
         E3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675542; x=1789280342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=mzSSbRJPl4jzp026v+bK91dKoguyPdW/1qzLU1uIkq3FAaCqE+3giZR57ObHIbqSr5
         J8zI/cTJI1mM6EsUcPw/krKJrLuRX8DHA8Rb/tSjItuQj2AyDF4CSbN/RUsEyhiTGn7g
         GzTzkXf3o1jYGvz43XZ9JbDhXXbbJ0SLYLcO+8JS77IyFcQj56n7zxHVIiLOcUor8Gzu
         eD3P0mPD683HOZuAY6FDquGwTt1c1mrb3SIHmyU0OgEWBNjThZVSKgl9EOGOoqtnVhbC
         XyrgtEay5lQtHzbJ0sJOmMC7magd8CWDOfPwTNwq0AneZmTyUuXRjwDHj39Z4E1KH2IO
         FXSA==
X-Forwarded-Encrypted: i=1; AKwUvBy7ESO9rwOJT4kFulhRQTqnw8gzKx0GEUuM6vUJG1z23aLtDNxuvklnRSSUgxGcgsTEbatqGCku42mSRXc=@vger.kernel.org
X-Gm-Message-State: AFuF++nY7zWg+dfHPWq0i07G4i9GtR/tY5MZNXK2WaR7I5zsbSE5iKn4
	eLHEXpv+vm/so3XHKydFRz4w1ObPdtlxL0/vaEIqBYDQMz7rF+G/Yrvi
X-Gm-Gg: AYBFou3yheCOskrSfMXKzonntzXbxuxhYcnzk6iI1M58t8WPFMIJ0gy8cZx/RwhZSLt
	i+8YWwpD53jQfPSGgyVQmEWAoP3bHTT5ivvQ7vDaP/pX6Bpcfuuqd1pg0aGct+42uRHehNQPvAO
	lqyI2DHZV6dfRtKR4+Ol5R/FppbKCaibcyRV6b1jBGAbzdyZJEr/5BdLfYLLxaRElDTX4BEw2qR
	8mSLUfBYPSItEokgieKC/TBFjFuZcJhQXIWFCGfvO//ZRVAsUwVTJh29vZUNixgU3IYfBregsJs
	QmSEwnl6hqxdkuCezcYBUN3yf+eL12BDfOiX+m0WofWT9ElpuEN/UZMp3NQY77J7cbhXRYgz7Li
	32oZBaMeJXNUJPb5q1lMK+2lr9SA8Gb65xCCEXqpOBDxGXYUdQfLnOlAZh30+7DRRw1ZneavCbv
	34pfPtlK5CVp3LZv5pvIDTv5vU+DcIZmNkKK80m0q+mxWjsh1IVKarQcHCzK0=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr24578243a91.16.1788675542370;
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:53 +0530
Message-ID: <20260906061755.5103-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c         | 4 ++--
 drivers/devfreq/imx8m-ddrc.c      | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 4c22be728f6a..bda788909887 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -364,8 +364,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 					       passive_data);
 	if (IS_ERR(drv->devfreq)) {
 		ret = -EPROBE_DEFER;
-		dev_err(dev, "failed to add devfreq device: %ld\n",
-			PTR_ERR(drv->devfreq));
+		dev_err(dev, "failed to add devfreq device: %pe\n",
+			drv->devfreq);
 		goto out_remove_opp_table;
 	}
 
-- 
2.43.0


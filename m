Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78951AEDB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571301; cv=none; b=K2eQ3A8bDDl+SNyybqDAJlCGPEn6Jn/0UvbXDUFBiYMpQgzbR6411xIVIbrj8GB5UrzmBdXy42BwcUHtd+1XZzVKI9zl/2zw7YcUWsUGvRjkpWNt9+vxXv8fC1GtKcLy9VthijAfO0E2zXLk00x3Mv0r6djmQKZfPwEgLj9Ne1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571301; c=relaxed/simple;
	bh=VZ9MFlUOyfdQk5w4IWgVhdMOncD+otSh5cbz9FDpze8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIhOnJ44B4U4iYRSYaLXaayq0SgznMOXYcWK+4NpNbA00sxBz0Vj7DuXz777DPBvR6ngiu7Abw1TfdFe1OhEavE3u0KZxJocAXVrNG8OT50XjTKFzm622hHbC6DgkPSZ++LnnKaVTN8IkCP/zlDqGgOZk7cAAxaOalTpeV3pO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4puQm4+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4puQm4+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso1226325e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571292; x=1792176092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ/rPgu28+IKGXoI2cnUBCzKXJ/3423PKk5SsfjhJXA=;
        b=h4puQm4+0NQ5ch9J7j1VaIKCWI4rnFkCQR+e4eV+ebKIs0UstTfUctK2DEdmcU4JlV
         CxIBw6t64yqa8zbv3D93GCP2qa6I3tLXwV2QLvlQ6vNPaG5dLGu6slwBGCz91WYYlDxP
         SbCfU3GvcRWd0Yxp2VxVnTsYOX6dhNaAl5fjd6Iybs4f7y2oJzt+ma7/pt/Cf7BTyDtW
         aVuRTe1z5O0Avl95hKqd+wot9r0vT6cxTZ0t1P7mBXeMaf4FPbhG6YjvvMl2L7EDlMXg
         GvOm//RqBQtO+13mDP/XEp/XwFA22FjOPfsFTehR5t8xWU/9RDI9m6D6y0CZbPmlyeta
         xreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571292; x=1792176092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ/rPgu28+IKGXoI2cnUBCzKXJ/3423PKk5SsfjhJXA=;
        b=hlQmfgFRlRS9wXOeDZKL+3fZly5PlHeOhMU3dxtcIu2csUF51h4eG5APcYYonmW0y/
         6jY0b+XoP4ltYDOd9PSwY1mOBAz70pSIm1Bi+/B9wox/PjYKQ+oowXruWkaQm9hV3UWE
         1qfXa2pQ60P/v0bHvXpo5ito9mToEMiGjHAqblPs2s4o5uxWDqkbfTKng+Z3I8ziEHmC
         f7wtb4Kv7owsrDysHJVsS/uCvzYcqUq3tRlsfIub76em9vuBPJOUXQ0RwK/QBt/Eq7Zc
         KLctKkyWZ60ZbtNkWloPi1gPlZz7iRmpk0hi3x0OzF4EtYr9NIWm9sXl1Mz/MytAy/eb
         iwyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYXGvR/0yKBotr1PsIZncv514bW4v+aH6Dbx5PjsvTMiya5myTbV+N0tdwvMAcLUN4A0oEHl5Whv4NehU=@vger.kernel.org
X-Gm-Message-State: AFuF++laM9JG2H+9rpO5CxnsS12nBMjAFlpGR4caPt5v+kxXKLIaq0ee
	LmZb+9HlKQqXegUY2Uumd/10VUjiU5Qbi2/2D4t1X5D9DQZ2W755WMsl
X-Gm-Gg: AYBFou2Pu1+4GcyJlF8hZAqlv7qcye2tVG3pM4V+1vnUa7gH1KtN9hyCCzsRf/OLvtD
	wkjzXZMf6iFgK+LD4adsYx7bwWoTLvSkisWfoHzH0cBsp2e0jb657uLvcmPdBtwc3aWZ22M/msK
	HPVYUqrUT7a20Gwd0YEN1XeI69X26+2hMvXh/3ySgDudFb8G9udPhkvPvkgxbmmFRByIz49uPx7
	j/R9xKSMqDbrhWWTIdWNQ75CvtixAWjb2IRg5b2AAMWueK6C+Rzi2UAPfJSz/E3Xa9TujrqUOGt
	O6wJLq0uciUmNhhfAdox4vasJAsvjEaWBQjkhI3lKDcW36XrWv2rYMwaxAYxpj6zFDzowRVtdea
	spCCPdG4+bPtYK4IfNem4pTkUD0nWqXV9qJQ1ATmg1mfAvHr8NFh3Hb/Rz5IZHK7W04OWoqk6K4
	P8uNNiXgOE80nMfbej4J8U9QQZfzNcaAOuK3wMiJUSHlZJvXNiuqQiZXu744L1RGcZayodbDYfT
	Qgrk9gCuDveoOyOEMgAU3TsScQPqpWu+gEFMPH+zHJZUzYLFT1HyzcmxuS7uqwo87NnjS32aowy
	IKKaC6xV7NS3fwTTEg==
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18e4b91f8mr52099645e9.20.1791571292496;
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/8] iio: adc: rzt2h: Add optional reset support
Date: Fri,  9 Oct 2026 19:41:18 +0100
Message-ID: <20261009184122.1378797-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H.

Assert the optional reset when the ADC is runtime-suspended and deassert it
on runtime resume before performing calibration. Assert the reset again if
calibration fails.

Use a shared reset control to support SoCs such as RZ/V2N where the reset
line is shared between multiple ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 58e33fd0249c..62120d218515 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
@@ -91,6 +92,7 @@ struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
 	const struct rzt2h_adc_chip_info *chip_info;
+	struct reset_control *rstc;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -710,6 +712,10 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adc);
 
+	adc->rstc = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(adc->rstc))
+		return PTR_ERR(adc->rstc);
+
 	ret = rzt2h_adc_parse_properties(adc);
 	if (ret)
 		return ret;
@@ -771,10 +777,22 @@ static const struct of_device_id rzt2h_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 
+static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
+{
+	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+
+	return reset_control_assert(adc->rstc);
+}
+
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
 	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	int ret;
+
+	ret = reset_control_deassert(adc->rstc);
+	if (ret)
+		return ret;
 
 	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
 		return 0;
@@ -786,11 +804,15 @@ static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 	 */
 	fsleep(1);
 
-	return rzt2h_adc_calibrate(adc);
+	ret = rzt2h_adc_calibrate(adc);
+	if (ret)
+		reset_control_assert(adc->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rzt2h_adc_pm_ops = {
-	RUNTIME_PM_OPS(NULL, rzt2h_adc_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzt2h_adc_pm_runtime_suspend, rzt2h_adc_pm_runtime_resume, NULL)
 };
 
 static struct platform_driver rzt2h_adc_driver = {
-- 
2.55.0


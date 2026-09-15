Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14694BCAD6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494114; cv=none; b=b4yRQ2AGI2tn6L6cypK2zPjfJ4WS9H3IHt3J1Ln2gCpDWP5gKHkKnHXjfMr8rY8VoGo8Dim+d3r8fY/UchqyVy60sMcmAMrEqVBCZyvGYRnopDrnJlrAm1WL02XaYJzpbv5kuJhvLTpwiWvrk2IrYf8aRpSlZIIyShO2/1TojbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494114; c=relaxed/simple;
	bh=xHQpPZGkwnSYzPAzjFUyP0XG0WV1yIObkQuB3Uh6NO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHL1PzHn3GVENqFuklvfrQTyGDb5iaMQIXxjIBfwrxKs9vyR/JyUuj/jmXxNkadASo6AgBc083xst8ze1+0iybVQ0A5B7DbcMomXM/M2fAhHRf9JEMzcfqV5KziesFxTsr2Gr2j5fCkGKQ+ubA4tU+dZEe5o/4MGoasz6j/zqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2S+kkJy; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2S+kkJy"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so23511e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494109; x=1790098909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=arBE55z8KyRmkXgdTs2/FCieeTQlbYHFLN+eX7wLIfo=;
        b=h2S+kkJyndVUItDeT28GdWPxbA4MhZ2JkZhyPF5IPMCS2BUxX+7OheHShkNJpMLtzB
         kLI9igv1BJydEFbKHRh/Tnh3iOYsNcPoQ1HteAnVbI103ekl06sCDK0MhUBPWaiGvRVr
         iK7tVOhHIyKmOC7TeIMnVOT64aB48Vfy6/ZlgWhiBjEiUnH529nyYEsRF+C4HUb1jwYc
         fkc44FjzLhpwQzLGtPXo2n8gtG0bPQjsQOOIs7744vYuclVdll6QbMSxPrGhg54CFaOv
         X0v6FSgVBFxMV3Zq5nFMriLGSEs/gHmzBgeNnF/2Un/o3pqwGTnx5n4U52zoTDmvOiZz
         dFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494109; x=1790098909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arBE55z8KyRmkXgdTs2/FCieeTQlbYHFLN+eX7wLIfo=;
        b=nRTx59nttySIaiJFWKJ2FijAglFxqt+XtlkBgNjZMcx0yPpLhEd+M7UYGvd2Hb9paK
         dgAc8l24uMuPzNjSrzjSCFsLPgqWlLrxDPn2brO2MqsQzR81AiqwgxbY/bIolrPRC1DO
         xau65tPiIKnNrxIGZc/02AKVhtuxjnHjgxj9vZ7FrWkNjnDnrhTld65V+Fw04yQVTgFP
         nN1CiIIRnqGhXyycYhk12IGZZh6AHb9IBH4pLPE65uZUN14ywKe82HG1OSymG4oWM5Yg
         kE3ZNsGUC+j3ZJ2hZJFO7TMe640ycIa+BoBpfCtSv8H0Vd5o0roqFOnK1ybkB08E5dqI
         WX6g==
X-Forwarded-Encrypted: i=1; AKwUvBx9/bnj3nuANZdtNEzbt1CQbHLWovAQptwB8iN3GAtCyhZqP/h/7cDvivga9GSOXu3WEA707ezTjmbrSUg=@vger.kernel.org
X-Gm-Message-State: AFuF++kVMdbgx5p7AzmXFa82DFRL/t7/NEGZHWfifQw7xfqvuTIUQ7oQ
	2iy+eaiEKFD3g6RZU9h/Hvp0+DTJwkvbOdefql6abuETI65+IZohP0k=
X-Gm-Gg: AYBFou33zQ3JSk3CLwukNfaOzVDefn2pVwIRuu6BcUD04kgJTfK++/38/d+5FcS7p/q
	Zz/hV8rkVRfBcPvAKi5waLJ5kRM35rBH6Hjz2KRpgp/IKcK9e18XAdl4AC7ofisLjm/kpCcseLe
	DJaMmiTuA0JcADm9wCrpxF+qalBibTLTzve7LjDdc96vSlqJb68fEA2nTN0Qg1Yw7iMWMzt6bnT
	uxOS0l9sREBtiP0Me9ZlHiNWJ8QUcJboJrZMcTmSy/1B7FwCCjFULoi3CPg0GyISKDKxx1WJYTz
	yOqwXKiJGC2zW5syKZrASyNkUSgY4+1rS0qRVgEG/ZEcQoJ/13qC+IODKqoznKVEVBmLu6o/VUs
	0WZgsksX8VtWQCPIxFU/1isp0U8+sBtPRSU85ah5LP5VYvANUvHNqELN/3MLEw2/GMAwbl4aQkM
	EgoTOfTKpuaDyk/B+QGnSIJKiytXxoIfOqxg9F+/Lfg79h+nPrx4qirUcN7ADcqw==
X-Received: by 2002:a05:6512:2287:b0:5b8:b37f:164 with SMTP id 2adb3069b0e04-5b8b37f0300mr968389e87.48.1789494109295;
        Tue, 15 Sep 2026 10:41:49 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b5789779sm123779e87.1.2026.09.15.10.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:41:48 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH] thermal/drivers/airoha: Request the EN7581 IRQ after zone registration
Date: Tue, 15 Sep 2026 20:41:28 +0100
Message-ID: <20260915194128.42508-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EN7581 IRQ is requested before the thermal zone is registered, and
the handler passes priv->tz to thermal_zone_device_update(). Unbind
leaves the monitor interrupt enabled, so an interrupt pending on the
next bind fires while priv->tz is NULL. On a Nokia XG-040G-MD this
oopses in thermal_zone_device_update(). On unbind, devres also frees the
zone before the IRQ.

Request the IRQ in post_probe, after zone registration.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
Independent of the AN7583 series v2:
https://lore.kernel.org/all/20260915191131.25214-1-sochnev.v.74@gmail.com/

 drivers/thermal/airoha_thermal.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index 77b3a1af271f..ea3e2649c280 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -528,7 +528,7 @@ static int en7581_thermal_probe(struct platform_device *pdev,
 	struct device_node *chip_scu_np;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
-	int i, irq, ret;
+	int i;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -567,16 +567,6 @@ static int en7581_thermal_probe(struct platform_device *pdev,
 	of_address_to_resource(chip_scu_np, 0, &priv->scu_adc_res);
 	of_node_put(chip_scu_np);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					en7581_thermal_irq, IRQF_ONESHOT,
-					pdev->name, priv);
-	if (ret)
-		return ret;
-
 	en7581_thermal_setup_monitor(priv);
 	en7581_thermal_setup_adc_val(dev, priv);
 
@@ -586,6 +576,18 @@ static int en7581_thermal_probe(struct platform_device *pdev,
 static int en7581_thermal_post_probe(struct platform_device *pdev)
 {
 	struct airoha_thermal_priv *priv = platform_get_drvdata(pdev);
+	int irq, ret;
+
+	/* After zone registration: the handler uses priv->tz */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					en7581_thermal_irq, IRQF_ONESHOT,
+					pdev->name, priv);
+	if (ret)
+		return ret;
 
 	/* Enable LOW and HIGH interrupt (if supported) */
 	regmap_write(priv->map, EN7581_TEMPMONINT,

base-commit: b115930d716defc3a7daa2bc2ae2465d864b7114
-- 
2.55.0


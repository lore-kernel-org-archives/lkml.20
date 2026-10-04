Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1CC3CEBB9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132367; cv=none; b=L0brq8kJmwB0uaaofQPslmHi9EbfUTHzB6b3I2AnoOgyK/YVYBY4wVAdQPFgZXqL292vn09gYKbsIbLYLUAKObuWioNQzqhzE4qvD/+97HDT095+Pfen3mH1jDxFwn3O2QWEReYkr1h7Osa2NBH+SEYrOXwrJsI56MXuzWEOoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132367; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGEKaxscoPdkgcp6TTl6b0ORuEhTn67yKkOTKqr5uABPgI6YMqLqyIZvH8E5bngbodR8FPhWOb2QHldGmGEsc8+ZvVA7gjpZ05TlrwIqByvCbp/qTHwbRPo42g7PQOchIC5neaL5LP61NWgvvVcw+DnYqjCrmclv3MRWl10dqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDpKvVTf; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDpKvVTf"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so476673f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132364; x=1791737164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=HDpKvVTfylXk+A1ZKTrXmCchUZnM8elde2BeB/WRLWy8CGYPcVmeTC8a85ZQIoIXBu
         UfKaCaJiLrRD8amqntPODL9L/qx5oaX1b1ztGpwoLPRIQflXG8wZTw9TEKb88huI5kY1
         bthPMkyd/XNM0KanOow41sxZ7xquY/DgVNHcDE56vxzmT1DBnQ+SapE95hfGDPgEG19s
         cdOUXxoYF8YMw228vC6EmtI5eH1sx6n3DyL8ttb5P7mF778URQ9Oom1wKRvdr2VwJu0j
         fHbUOrBwFXca/RNeSkroOJtZ/vfmgIPIAeNldX9SRpvUahPhuifl5HoVSd2S2cUEw6jG
         pQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132364; x=1791737164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=0qwoIDygWMhSw168cinvcm8Hc+B3aT0BTkS533oAnF4mcYh8fn3y5RFqojoCvkDO98
         rZ5vq0KzQ5jGfDZXYsg/TBvjsO8e7KYNdsftwbU7Vjh4LuoOzIAHsrS+ac32ft1uUi2N
         hM61HRi+zTqYNUOssMNZ2oSsD+WuEgIEiHOaeT8Qdzzw2JGrezt/jubbr/Bosfd/klDH
         W/0/gKxwTk9Gw9+nJUgHUAeNLT/pGkh4YU+5M7khYiykICjuht0AcKnD3fptJeNHEnls
         ErL49QZtiGEkyTYPEEFcDuXGQjE13loR3yaRCLtfV3tV9TPZlMIWOKLEsQC0DV8INBXH
         udDQ==
X-Gm-Message-State: AFq9FYIs5yiUQL/xxc+1xZpXN1SxpAcUv3Et1gSk31mBsXT7EbNKRl/9
	Brk4RGHkax8YlBlWIyB1Xf1IH+Bmyli3x3R6wgqr24uECbEG3gMAb5Ef
X-Gm-Gg: AYBFou2fIhpUmVyVrtN/dX02td0n9rwi30D9O0O3vW5cYrc24vusH/U8f8cZAN0Bpbx
	toqLE6D8vGXu5m8dn779TrQ+sIhZh5/WNQVIwBj6HHAXUqiRZzyc3ex9/TCA/zO2zPKJxzWNCdZ
	Y7kGCVVdpHbaWmtvfbBB97WuNFNbHTzGGf8ztA9g62VjoI/D8Acc6UKmFiH+FnLhnjtCoIgNYtH
	w+mlrSXwmNvJeXzJIlLa1tl4/DGqeBGhlq1CdR1/pvJAO/Zn0O3dcgRkQmLhTFBtmAUJDxaRPRd
	2qIN3VoCBrPMA3axqo3QeOeXh0rEdyZNXLjL+vkA9GUIjZssJWrnKMKTBFw5HChYn9Swp1xiQPj
	/zPuFkZ/K+40ES/68Z9Usu1JEiyE0Kl2KrQfH51fi/iiHwMCkTe62fhfQbaVBOA3uKnZiGEFRX1
	CP+yqCZMQXV8cTFnqCT8PSsh0ZdaM81CWJ5p3bnTifFfs43pg8JyeOA7Ggwp8uT5kpOUwBTaUcZ
	IiRoz0oHnEKpyzeSW8=
X-Received: by 2002:a05:6000:18a8:b0:487:57d:18e4 with SMTP id ffacd0b85a97d-48b1276ad48mr14676290f8f.41.1791132364197;
        Sun, 04 Oct 2026 09:46:04 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/3] mfd: max8907: Remove platform_data based probing
Date: Sun,  4 Oct 2026 19:45:39 +0300
Message-ID: <20261004164540.198446-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164540.198446-1-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 7bac1d6517717..363ac80c0593b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,13 +184,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index e59aa7a3ee546..907ed3fca5e97 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91AE4C7546
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980168; cv=none; b=CcwuQkwxO3nuyYTnYiYoswYfsBERLC1TAOgHu5ae3u6oDBy37ZZe7I95UgW1Jz+pCSt+vdqLmvZMCoN1qWcbPZJJyHCJxNGqgZWoc0UzFKjv4vfkDGz53WhypWZqNZvzIKJwcQy9g3MChLwO5fC0cLsg0uaQ1+kw4TI3ODxscZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980168; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDoYOxfpF9Ngne/sI+4jKA14usSODncqqWQXcl9SpDhko32vsyfqHFj2EUjl/130wkFTA0Ypdf1fwlyUCvZAOX4okJI+3dyaSQokd6w9WBYi+fvC0RYatPv640fiHHfsH1wkJ8mgPR46NwE38j5FIjE4TFzBVjFHZKdAQqlir9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHHPLb7+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHHPLb7+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso31529795e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980165; x=1792584965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=XHHPLb7+gjAHBa6y87eTX4Y17wbqGd0yAzETfem9bUhxOidACkUXPL+8PFn5TIs9DO
         Am5WZ7H4o6fFnTWOxLDpPlfmkp/ijZZHUzdyHs1NzIVZvPSA8OgL4gbus0pKW4G10ly1
         hH5Pv2jFRGWKdbK3B/xipEyRv8/L5gZPhq1hlwMuAGRiG6zKKqFOpXcZA/bjRNINUgqS
         JHE0Z82bpzUm8ULbRgdXXmruPM4L9c51lQ+jz98fkcR3mBW17GOviCKxbYc+gVj68FWo
         Kr6xWMgcqMQ/FmaSwLobwE37I0vwacud0kukcGJ41a87bZWuWhbH1FAEdHN16xxRShXx
         OIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980165; x=1792584965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=0/PHonLGnXvJ6nHi3YFueKly+iDG9vx9TP04T9BsB4mCi8zb4jzEhn47ADl6nWMf1I
         mQfBFHedRk3rgrsGdV12AZd4ayi84ebWKGGErb5wm6J3Jval1hnAhUFpQRHoVjs5uTc9
         nyA0PZLHgX/gV2xDOTfklwSBFZF8oNNSZpdpJhLD4R17EzOGhydcwoczQJ6mJXVc8a/n
         MjJF/8xEURbvtwpKok6CJHWUrLjHIwONc83/ISgvCNLpB0EXkJdEVoyOs2bcnazi+D6m
         0I7wmkuCFbMwAfshq9lwJe2S3QqFG4sYTzxPWfEILWcHJPQkI72CBYjLY8FYcVfjnt//
         fJQQ==
X-Gm-Message-State: AFq9FYKSR3DQM3uyh4UE3YZ5Y9ZxGd/I8Lx9a5j2V730xF+zs0ymXiFR
	+jA/9Tb3ZaYwi+uIzqgMFexiAQMBIl5NKfSk9lmK1D1ottHJn2z2OvC7
X-Gm-Gg: AYBFou3+ReApd6uem5Ngs2UZ6hwCXBpUbHrMDwbrwDCn/HN/M0L8DUVWpon65VDzAdy
	gwWIZo3CYsYQ95BtGrGW52NVRwWDvdo4TXNUhtYvvAuzAwXbtImWdyeq0jarBciyphPHQzX2fVA
	BvF+PjkzLB3UJImGAsbi7ZYVgozLifWogT59DoA40QFLppHOG7lM2uTyOHWluMIQruVB5WL4ihu
	vxHb7FSJ4h5LR67T/1bSrqXWEdcsD7AVqbzoaB/mj4u8VqTifKJ9p2KyCI4SAS+roanoD7KRT5S
	77lfK9PF2NFVRkuGBJcdGZe+p6zlZOa8sfccKbez+f5R5noT64gTWiWwWWrib/x5rR/5Qk+omXz
	TFSveTZe+XXGktL2Xt0Hp+srsNWCLZ8aBFvmBzEoJQ/tAduSkVfqYMU8p6iUbAWchFzjwmoLaRD
	ZnLd2dakuoOCD4MBiEHQFkJjFnJkeXFQFuFc2qLg2MdBcQ537T8fnmqfSPXWBJJSRIISFChrgtW
	0NGCi3eXj/maO1lL5A=
X-Received: by 2002:a5d:5e88:0:b0:48d:bafc:a3f6 with SMTP id ffacd0b85a97d-48dbafca4a1mr32494960f8f.0.1791980164766;
        Wed, 14 Oct 2026 05:16:04 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:16:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3 RESEND] mfd: max8907: Remove platform_data based probing
Date: Wed, 14 Oct 2026 15:15:43 +0300
Message-ID: <20261014121544.138958-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121544.138958-1-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
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


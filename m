Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B213CF21D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132369; cv=none; b=UaJtOu/TuGLeo98gO+bTbZ4urAAqxxW97rvh8wVXEOZTygvkJcbtSZqpSrZvJXxkho3G6K4rZIjJ4HhtMLMSDe3E0jnac0GNg+3WKl8OAiPrX4BbBkpRBFxJCpmxIAebK2L2ZIloO9Cjkii2UfTslW9DKTCzr39veG9BB+a5pDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132369; c=relaxed/simple;
	bh=KQQfKGP3gaA4IHCfke4mkG2Sh9hJChUtdoHtqWoQYAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH2M0MGwQEblq2JwRDYdEt65LjAMINtIjhCg8zYDrXgIWM2On/reLPFAnojV/j1yC8RubU1vqaL126sosEfUE0FryfsFWitU7Q1mnn6oL5S05hHKl1eqIwkmaJFwfAecSKfPDTqNTntOf/f9OuIxhQpOq9f2FVspy0rJep4f4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSbs4GGr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSbs4GGr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so10685935e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132366; x=1791737166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=SSbs4GGrXk+mTxAVKO6JXnJGl3ukHvjA+JfAYEH+yTsuCKnPiRMqe4+lw7nUH6HegS
         LpLbn5VrNdPQX+rvUIR9uq5kWuAA34zo0H8KZbbEzp9PPVbu5/ezYStLskf+vJgRRNmh
         HbkgLtdJYd/oM+yfyQd53BqcvqxFtlQBBZqtGRNmyVDg73Ldr6m8KbUs4hhGxnSj0/nN
         DlpwFrcoHOvoJktiHZ018eNLV8zZtyiuySbYK1EFhtG3whxQBwLBKJ99NFUR5EHun0O0
         58aHpH2bCclt/3faI8bjsnje93TwwMdLEvKctQGM6Bn9Zt9cC1V03yEZjAz2TLCYhiOA
         2Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132366; x=1791737166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=UsWy3IAJcola+J9w5LSSW3HfYv0DFLGj5hywTGf1VgJCvPtolEW6alc3kuUQYnYi9J
         ofcr1wY/XM2/jhCysDB75bONeGQgOGKCOjOewrVZfL6Gayd8lfKRy3Ve9tjoLjR8W+/l
         xXn2o0na/TQmhczhY+6KGknnGITfM/N4j3Y5M3GdgMUQLGSwqjkn58ibCxtXgVKT4dE0
         eEYGkRoITriMLvmfOEwsfhNrv0Q44OnwpTWjSib8CmiVguEresakS71NckLbAH6n8Orb
         +/ZKZqRZeQpldzUoCUfuRZoyXbJ3AAFFStebo7x8zzXXBZTmxNClTgjrfOJJYTlbcrMr
         VVIQ==
X-Gm-Message-State: AFuF++n8x0Os/7IygjLMUtqJo2qwRF/YELET7yAB6DAV9fK4XI08vgkl
	uxQlIFw915mg6zUR5368JpQpeImJMLCTCi88s2mJ+HcK4csn0XFbol2f
X-Gm-Gg: AYBFou37TLVUXay15vnPCA09ZEPVLjX76scqTKVHTtNBtcZqqKHxZC+jjmBM4OdL8H8
	lWThL1/xA2lPT+7j8VBE9V80JD4zoWRo4fleaa92LfYF7gDo+fFUcaOzVHn/5HAW0dFzrOu20eh
	QsGsnmL2TTU7A91qITZhzgaGl9gh2Tjrpsvw+q2pKXN9fATKblov20HRbch2evr0h7vaSpmHfvs
	I2VvaCn1bnnbQi5ryXm0RkN/mSLYz+eC8hwH0vuA94s0IR6J6jq80VZda6kD9YOfXuxpQ+0taDP
	7bUXAtBcKV8UIuSlhu2cWst4e4N/wyE+J8uhaIoVptPZ73s9l6fAr4EMGCVWX9q7Qv19Ba3EI63
	EoeR7Ygb5GWzxlBvQYmIk27KdHS4ILCDFoCTtvLYjsH+40m5NQfh+AKgcq1EqgU8ulAtJ2eUDNW
	XDNMo0elBSXwqwjHhrfi6X8WbuXz2imlN2M50IbkbXvEwjJ68EMek065SwLsEF4YD9V4VyjnU/9
	m9zjFhldrZz3SkpGJY=
X-Received: by 2002:a05:600d:82c7:b0:4a1:714d:ef9 with SMTP id 5b1f17b1804b1-4a1714d114emr26581485e9.27.1791132365517;
        Sun, 04 Oct 2026 09:46:05 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:04 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun,  4 Oct 2026 19:45:40 +0300
Message-ID: <20261004164540.198446-4-clamor95@gmail.com>
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

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_sys_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..9c40f0551a8ce 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,23 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to restart device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +209,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_regmap_gen;
 	}
 
+	if (device_property_read_bool(&i2c->dev, "system-power-controller") ||
+	    device_property_read_bool(&i2c->dev, "maxim,system-power-controller")) {
+		ret = devm_register_sys_off_handler(&i2c->dev, SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register poweroff handler\n");
+	}
+
 	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
 	if (IS_ERR(max8907->i2c_rtc)) {
 		ret = PTR_ERR(max8907->i2c_rtc);
@@ -250,11 +265,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_add_devices;
 	}
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
-	}
-
 	return 0;
 
 err_add_devices:
-- 
2.53.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96244D1797
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405090; cv=none; b=t84tldJ5EQZc7HTIHLj16c8Yh3bYlbn5JypiSoBvI7OGxI87JZwlapw+rK5PHJT5JZaDi5PClSMOViDEflKPLrI3pq/0ada6NVjb42hMqrv4l8KHDslYxc6NEKIb+FAgWvYgH+zSpobplg1fU49xSo2YDnzxRpDLMLnup+9WA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405090; c=relaxed/simple;
	bh=sqCIMnD8UHq4cYgyih9RIt9I2cXXCk78at9FV6ocUlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZil9ZisKkbNa+BR2cCVl/+1abEgFSLnnzfR87RyWFGtPFDxPdbCpj6W/qQFjnL8LhWdaxGd2e/Q1dYh+pLfvCFTWl/5vjk8lKY2GfLHmrnb8OzHiOkuRc5S3rDxCDxGLXaDWXirrudmnLm9vfoH0WcL1pFbsCtFOs/V6xjYMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyEE4bjA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyEE4bjA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso9820605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405085; x=1793009885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNkLZTwapqyq2r44IWjpZEsiFPN5BHL3ClrmVJTbINs=;
        b=QyEE4bjASux9tklGWF2dPM4JMhUec9zcoLpwcwD3/AsRyA6jmV1rnFdrLQQja/g7dc
         6x7kg7SeFBQWTjW2iaVzCSy3GWFYLxtsjV+mKkYqOsxw+trqBbyWvJTlAEvuYilE8wUL
         AJRLQoCRLhbDPqgS/7tYSs9NqFOCvGH/NB54CiBJKNivdHPoxAaMsi+BFf433oMTrmbc
         gEF/cuoXgmuFwNtOVBGQ6I9bv2RIm6qtRQnAbVYoUfhuiQoXENKt7yuuU6Z440kOMjjJ
         o6LOXkLxUl6CjQfCF3Dwnir0Mbxgl+tngdWCDWFWZYnWQrfXIkjja19vbow10VcKWb4a
         yUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405085; x=1793009885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNkLZTwapqyq2r44IWjpZEsiFPN5BHL3ClrmVJTbINs=;
        b=iA2dGbTLu16prD961bT+23KT2kol/p6txm2mYaklXhfkFMsxNjE6gHBcwGDRMJKfWG
         2t9HyDpIT1GuZ6UoflfCN4Ls+plBfHfAxWcp7Y58Pcc0W5ZrpOmm3kQV486ruNBNARtn
         Wfol1ZyH9KUrsMFOM9wjnqXhalm+mIsySWHw0w6uwmWGrlYyCICHBITlFd0t4f3tlDfe
         OzF2B3SAXKbI30rFY++FH0fTqwudOSRGdtKv6Yo0hqqr9IhSfnlq+6JIcMoTGxyiDkie
         ZKK7qp2Caecxwe6yyHIcJB1dAAYtfpwGx34xiz4gHhmk52Uik3itmEfxECg8caydV4Wv
         trvg==
X-Gm-Message-State: AFq9FYLhIvBX47xmyr3cYGza9Lz/nEX3WOTsj+VXi4s3GP8tMi87DkWh
	m+GDXKq15bs75KyumvHMmp8l7+6nws1SW/5RAnlO/ASNPgdfDSbc4B4c
X-Gm-Gg: AYBFou2aWAKCbXdlOPoPhUwVfcqnU0/n5/ruMtNQ3lC628PNqpMej7L1IZyKTfFr2GM
	ubM6OLrkUfjdDAA/TlG6s9U7XB74NcoH4KQhPEfPYAXDrihrPl58moWx+NlPZwfutHX1wu6IcBy
	ZXtW8AuN9fh0l1i+D9HTCrCeaSMZS+UoXjhpf3JtZqCThfvjeSFZAuM8evrgP8kO35AzkOYX2+D
	FGQn/TzU5oHyOwxNulz2jZcuhNruMWAEPS0LN7p+iDpwClCsSy8IxPkhhHM8q4sCwd5HLqieidF
	ZjYcAGYRlDWKHjZysKN0ebziwjdY3zHhDHqawvWbt1TFQQncd6Zd+74oJNXtQj2b21H29MXiu0N
	DqAQNbQ3HDLdhdwnIPF/snLNitmAHqscU2vmGbseUNmtnLFsVHWf2TmZwAvIGA0aDsz1hSKuuTR
	cmJjwNYBZLN0Px7M5Cq/0AddT6udwHuydrqv40Fm0AkplyBQdVJCEiWMQmsK/qtEbGovYYUeI4p
	ZDx4d01sQtlk+P3CH9QQEjSmYOiXg==
X-Received: by 2002:a05:600c:19c6:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a1e01e1f69mr98023875e9.5.1792405085021;
        Mon, 19 Oct 2026 03:18:05 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:04 -0700 (PDT)
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
Subject: [PATCH v3 3/4] mfd: max8907: Switch to resource-managed versions of helpers
Date: Mon, 19 Oct 2026 13:17:49 +0300
Message-ID: <20261019101750.125439-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 128 +++++++++++++++---------------------------
 1 file changed, 44 insertions(+), 84 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..fab44be7ced57 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -182,73 +182,61 @@ static void max8907_power_off(void)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
+	if (!max8907)
+		return -ENOMEM;
 
-	max8907->dev = &i2c->dev;
+	max8907->dev = dev;
 	max8907->i2c_gen = i2c;
 	i2c_set_clientdata(i2c, max8907);
+
 	max8907->regmap_gen = devm_regmap_init_i2c(i2c,
-						&max8907_regmap_gen_config);
-	if (IS_ERR(max8907->regmap_gen)) {
-		ret = PTR_ERR(max8907->regmap_gen);
-		dev_err(&i2c->dev, "gen regmap init failed: %d\n", ret);
-		goto err_regmap_gen;
-	}
+						   &max8907_regmap_gen_config);
+	if (IS_ERR(max8907->regmap_gen))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_gen),
+				     "GEN regmap init failed\n");
 
-	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
-	if (IS_ERR(max8907->i2c_rtc)) {
-		ret = PTR_ERR(max8907->i2c_rtc);
-		goto err_dummy_rtc;
-	}
-	i2c_set_clientdata(max8907->i2c_rtc, max8907);
-	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
-						&max8907_regmap_rtc_config);
-	if (IS_ERR(max8907->regmap_rtc)) {
-		ret = PTR_ERR(max8907->regmap_rtc);
-		dev_err(&i2c->dev, "rtc regmap init failed: %d\n", ret);
-		goto err_regmap_rtc;
-	}
+	max8907->i2c_rtc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_RTC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_rtc))
+		return PTR_ERR(max8907->i2c_rtc);
 
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED,
-				  -1, &max8907_chg_irq_chip,
-				  &max8907->irqc_chg);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add chg irq chip: %d\n", ret);
-		goto err_irqc_chg;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_on_off_irq_chip,
-				  &max8907->irqc_on_off);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add on off irq chip: %d\n", ret);
-		goto err_irqc_on_off;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_rtc, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_rtc_irq_chip,
-				  &max8907->irqc_rtc);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add rtc irq chip: %d\n", ret);
-		goto err_irqc_rtc;
-	}
+	i2c_set_clientdata(max8907->i2c_rtc, max8907);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
-			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-		goto err_add_devices;
-	}
+	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
+						   &max8907_regmap_rtc_config);
+	if (IS_ERR(max8907->regmap_rtc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
+				     "RTC regmap init failed\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
+				       &max8907->irqc_chg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add chg irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_on_off_irq_chip,
+				       &max8907->irqc_on_off);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add on off irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_rtc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_rtc_irq_chip,
+				       &max8907->irqc_rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
+
+	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
 	if (pm_off && !pm_power_off) {
 		max8907_pm_off = max8907;
@@ -256,33 +244,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	}
 
 	return 0;
-
-err_add_devices:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-err_irqc_rtc:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-err_irqc_on_off:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-err_irqc_chg:
-err_regmap_rtc:
-	i2c_unregister_device(max8907->i2c_rtc);
-err_dummy_rtc:
-err_regmap_gen:
-err_alloc_drvdata:
-	return ret;
-}
-
-static void max8907_i2c_remove(struct i2c_client *i2c)
-{
-	struct max8907 *max8907 = i2c_get_clientdata(i2c);
-
-	mfd_remove_devices(max8907->dev);
-
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-
-	i2c_unregister_device(max8907->i2c_rtc);
 }
 
 #ifdef CONFIG_OF
@@ -305,7 +266,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0


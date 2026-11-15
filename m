Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733323;
	b=jPRkgbNtyMuRF8pZOFTRvFgPnChbRhS9Co50RTFmDGe5w/sU0S0IfnzeoI/6xtlcWzE+
	 MFFj+IAzSKK/e+WAiU3/gX+TLcxMT2GeyoKE6pv1fWIxZll7VrJGQmZS7VA+t9KmB86lm
	 dRh7n1Y2obWKqeCSecW1Rnv1ao+V9DYTMTuzZRXRYkI9mVZRJJ5/blb/1YSpvgcIk3Pc0
	 mMC8dSR6Py1RHqLBypA+KA5BaonEopX/FkgrLipCTm5aKNSrelDqRpXzj4BFajVUjqZCJ
	 gRHmngw85Q7cOtV5xBf4l+KORGTuNzbGtQPVtGX3B2aSLCyycqXVhwoin3WgJl3mXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
	b=kvFCwIIh0l1ZzoriL1qjRNKSoQP18QeY36/WQagE1+fstKSALcS4Q0U/fnM6lsLDTcZP
	 3cF+vnka8RjuBK6Xg3+4TJxlFL6YDWtGibYpWGM8U8UQDO+3ymz3T0ZHO6/FIZmxi0YW4
	 KE2XbqmsfNdq5HjKH2SQsIVD/wHD6JTmKsrNSbtEtK8Z6VJugbc5mnIl5psuFQM8XcXns
	 UYTXUqDfMke6JIkNYIYKubX96cr3h/EeSpy6nnUEoNb9dfRjeQh3wgNm6M2EadiJqqJ0+
	 HLUN/1HfGyXW1KTRWbjG1q4lWOodFkAPsXerwucAsD56fly26Tgss56tNONpAPAQ0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxUXaTxl;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE7B606A89E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE7B606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxUXaTxl
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40f29667e6so454259666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733321; x=1795338121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=HxUXaTxlJ+9mFTqgNZ2o5vNOYRonALoI3shVgtEBS9y9QjxPnFRxV1k+YfSkj79Sk5
         wk28whhtdnuDQeVQUQYevMte6OE+DKGUbZz8vpVDSCLMjdR2LI6NP58KOKsHOc58jNRN
         zY2MNx9qk8LJ8ld9lansQMC12SergoYqx+XdiDdJQ+0SjJWt9HqTqRcqReQHb2VnjyED
         WqPvoVKRLQuSlYdOM6r8NdoXtUouO1LQ0QlytrjzxyuBRNopG/LAb3vY4UgeDBmijQs+
         grZRhdx04y/+WqEjpUa89sp+x9xwQ2eU1bZza64SblmNhmIeao0SN746JrUOAHf6lSz+
         BGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733321; x=1795338121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=dNKfhSShjoqvhlqIjNUaZhILQyCwC7iSJ1wMI0FAuOlxDKOzkky017u3OJanaHQelp
         MHO15syVlKu1c8f3wNx7ymxENdYo2/sJqNUXR8912Fug7eAV7zj73ad8z8j9WRK6JGsr
         hQyZO+z5XwtSmeMw/ZZRffhMNhyYasTyTiTVtamViAjbhfAHevi2aWuHG6fD8ED/V5tF
         gvW4dN+32E11mkh2hKUjZpKq/SyTa928wlxfMnTptXwoO4uszuNyf2FJZINlA/WnqwvO
         pyJg2Kir6ACIrZ8TsWK/0jQroHNXdipou9CV3PfucSNj5nDtbmFBjcHNuyxg0tFDwDlS
         ad4w==
X-Gm-Message-State: APuU4Z8jeVjcOjkYeW+8DZi62SlQEfaHDvX+g4vZYn2K1H+j0UHqa/ug
	J0DX624zJDGKJRh8ce6VJYuyyGtU229EN2iaItkuUdXBIe1ySCogKxZv
X-Gm-Gg: AYBFou1fQ59n6Mb78Dl5sk0gj2dIm5jeGOTlL7+JrV0ApwOk4Lu2pbC64UuCaqiOeqI
	nhOfa6OnxZhX0sgOxBTQsyxFY6S1QC2/4LGUbc/hgqkNBzU4QkeiKnhCEZ6V03kzYUMOjdbOvmY
	LeJjN9PPRZV4va4x2yypcwCsadPAYXE/E22lZNDeEYO9j93VK6qhdb/O4yjkolCGD4BaS2B3qVO
	iFX9Fdh+kDODz7oQv1zVc6bSJwFFF75v+ohMZMiqgfjjdrSWpPgJZtS+ty/Izbs4yMGP/lGWMgz
	22yGF9VJB2/owOdetLgDtYudm2sOtdPBhdIT2NleD1fvS3t02E3yCKK5ej4fWEMmo5rZ8gxY7sI
	O0uJnN3Uqz7S/Z5/5Vi+eGnECNoTmphL3ALJTRU0Uym8tefhYudIc61ykUc5gh3Hw3HQHDVMnfm
	EaO77/X1bJgdGVlifYyQZ7amKB3G0YlZytBdfVsGvUqgE8wc4pKIwmmd0Cuz/jM4wIrn9ZG/woN
	TWr/7RH3oc4xr88q3oxZ6AFDyvduGH/j6inlo+vsFVm86FRVwUNjuPQPhUDa7qYDMROE1SMxiZx
	+ZIvVM7bPSZPOv3d/lDORpLBbbPo9cBTKiAb1XjVA79aJSGpKmjTU3Jv9vgrQpg2kDw1Hy0UJaS
	VpmntQNDPYw==
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c50965421ebmr588354466b.44.1794733320589;
        Sun, 15 Nov 2026 01:02:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
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
Subject: [PATCH v5 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Sun, 15 Nov 2026 11:01:45 +0200
Message-ID: <20261115090147.95337-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 127 ++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 84 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index d5d40d2c7c425..f6d7a4ce9712f 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -182,73 +182,60 @@ static void max8907_power_off(void)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc_obj(dev, struct max8907);
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
@@ -256,33 +243,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
@@ -305,7 +265,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0


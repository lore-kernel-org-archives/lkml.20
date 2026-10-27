Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101615;
	b=fZYWbSHKetvDb8pJlGDseKXPy5Szl8dg1g8SVVj15dTM51zseleg/4ZXH+NCAclBN0Jj
	 +NW36yQ2lvFldePq8v0KQ0FOIuEFj7DvEnEhiPFFG/x6cfir52HPzF6ndMHCKPGOGrrbv
	 B0+59OreH+L79FUdv5a5A0N7dJcxZ8W3WNHpHW7yeFK8vS2M/F6d8tl+JZuw9fsQrQRPS
	 ovoXRB0XVemOq+528CXGzxUPl63H9HAEiExaUZKoqtaZ5WlyfqlMpgWUJMcf4Svceaizd
	 xqrqo7bEsHKkhGCUL85L5uECoCtKdfkinE7DQc/14wp5MjwghQ9/4HYlspuEGVyB+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
	b=WHcnMGoGuZwPH4XEdfQL0/ixKGKnE7nzU+T+uZHU8AQehOH+l5fcmau7IbZdvZD7R3+j
	 DsSs+EuAzPOizwKHiYaLrwvIiypdVssWZCaiRkxnu9rBkfE99YcFkxkSvE/LXws5Jqe70
	 GCxmYCxK2Uu0K65wb1OVnhBSy7hnT0yDzi0NYtdz5LJTQRtkgUc9dpK4B8+75wOb0AYPC
	 SHN5kvbKwx141wjOaxM22Sc9SzyO/8fXvzE6Cv/58sYEDNCFn6x0BuGqkgrf2XELKM/Ch
	 3RutI7nqE3H5tuwztqm7B9e/ttNeRWPMRqKpBqBNKG2k6YZaOd+86CxhqtP7boGqflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXJ7qE4U;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9026606A874
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9026606A874
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXJ7qE4U
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c450ab1483cso548896566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101613; x=1793706413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=RXJ7qE4U+shAUP2bMUZqaFSGHokR26tFXhMVkM8UO3Hs1Ji/G5Y3LoTa/KhmX64/Up
         Om2ZN19LQf3eSxw0uwmVwZcEDAYFmMI+GpDXV7sVfvmaNB7od8i+uSyVsEx7BOqlQnd6
         exHM/yJRfBdyFcWptMl7L8WB/tMHcKPjGKxWuTvec5mpNCx4+Upe1VALwPifvEpkwa0L
         t5xIleUJiqsYam1E9vgv1TvFQzRdrKTMPvExzG5LtgovOKuYbGER4+QIO8iE/hccy6cx
         RdBprgvm6DoQhGfFLEsFGwWXdJB2k2bl5QIJbohG+89Mp2WLwHeAdvKM/ZCdQdBw53eq
         WaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101613; x=1793706413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=W61nLhMg/uOunTnrx280TjTizRBCIadXRAds2vf8Iyc+IIhc1t6ZQbGICVhNgJk97o
         MkUAf/0sHkiHNEd7yWDNCBpMmBCuROwwFospHAv8ei1l7ETTQpKSptG4o3WkeEnH/Ces
         2GB0QA0ewEldNNU8L/bYTitEM686ZEVzFsGB6SK78/W0Oq6snFjYRPD7LEnmoPD/o467
         kkgCryXOH9CbzFMVtMU+0MltgV4kSiiNxxhsOhJcKfoqpY/PavQSgGsmx0drqaMH6Nrb
         Ty32fiM7nxmi3hGfKJOqgz2f60lI+Z02c8p1WCES99gkf46PSIueBRcPBl8QmUwNbxgH
         D7fg==
X-Gm-Message-State: AFq9FYIvTDiKDd3DnwbTp1trD/jDXax2hB0vDM1U2CG3Bx7unDTJZfpi
	6wVMANsDo51le47LPew77xKv9yym7a8j+4w9mNMgeBMQwRFupSnplUNh
X-Gm-Gg: AYBFou09+rFHnIfZP7hsQmYHUPRjNZna8SdqqU2+msjpxC9E23X8kM54HrLc5q3rESH
	qS2cMXPMu0rSyHlg/bO4IEBMgp0yJENp+doakeG2h6HYg85+1Ol/Si55zPogQoG4SYqLTKVbP6s
	44EWW4gV62WELjdGv7zkd3Ncu5mKeF57P5qYkOCDr2wQPJwU3sUezwHcvPojXhgpp8Q+l3OGo0v
	MwgcpwsHkico45SCzHJ3cmlhSQmRoWN8qNC3egpQxCE+nt0/g2kxTinoG9bOm6R1ZOamLe4zJe/
	potvJkIebWuCaF/1hhw9dvz/s9B3de7ZR3YluLr0rFePjlLOs9tyu+dnNuOzaChFNyeeFla1d0L
	vISgINa128cwRZOv+VC3fT8/u6lJJ9elEE/676OKRdEitsjnWmBoNHmN4uDfCSUXtFo3IhQbv8o
	xhm2XhDaG2gvizaT2qhOQfFvNsNgyQGlnIeKWrm7O/WD5bsnbRw6UQHdHSEPPZXDGTaiTLE2jOg
	aF5ickEJERblJ4ibWA3NaAbmd5RqM45mSpuAJ1Kw/z0Lw6fiWDg5PIkalFoV4Jpt7hSVV4TXOIa
X-Received: by 2002:a17:907:3ccc:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c46bde7eabemr1005881666b.36.1793101612946;
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
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
Subject: [PATCH v4 3/4] mfd: max8907: Switch to resource-managed versions of helpers
Date: Tue, 27 Oct 2026 13:46:33 +0200
Message-ID: <20261027114634.79706-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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
index 363ac80c0593b..2a38e00a10c3b 100644
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


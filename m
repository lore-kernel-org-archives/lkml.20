Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975390;
	b=GhNfAZcVxPdzy/qYOSTKEcdoXsGJ0E04iGvHGuaOtiiWik7iRrAQr0ywr+IwrRGXuXNP
	 GEi9zf2BIkIiuRnO3uc+QCT4WhppfnHFn+VYaCmwQEjrFqO0zzbl/fMo43OCT3kjRCmOB
	 oZQVAKcY5yZUpM3YbP3HDHC3rq6jWYo5oKLACVnHRNGNrEaxa9YpcXKJEPD1jR6aB4jg8
	 q+fvNIhP4FWfVwn6hk7LZwCcI00ndQNcAm2NzphR586pSfT46qxZYH7QAsfGF2G+Nx7iz
	 dEZg+/oAJNIxvqVmWGi+rCKhs+PmRY0HcGTarvrXauORXsj2W4gllXlFn3bcSxKiAWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O/qxsvaefVxVArT/+E8r19mK8E8V/hwArN6Zs5LqTAI=;
	b=1FxG/bEWq0tLedPVnf1shXuV+5eQ4SICksRxPj2I+ct9jagc5YY61lFxWz/F1tvj8JTJ
	 7gPMLSUuQtdp9/EAjrQCFJ2kNMMo1MVmga6CqFNPucBhctSWddSIWRYtDWjjveQS/lL9A
	 I8AHDwh4MaFF0T4T8BK/CaGAiA8+7cHQWvqL5bTR9IJBc1MSPpWuBF1Q7iSYoNkiWAP00
	 PyocDOL3HfnzLX+XlPT34SIq7PE0LSYU10Teie4Igf0IlvbiQ83a/WvXWOSUGb4tcYhCV
	 jTyJrBQMGte5N5YvXjOr64j5TvzLXucpOIKjZ7oKIsYVVDjCTRfefaElJOolBz3eBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=er1GJDY0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84581606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84581606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=er1GJDY0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso15496055e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975389; x=1793580189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/qxsvaefVxVArT/+E8r19mK8E8V/hwArN6Zs5LqTAI=;
        b=er1GJDY0w8nif12DXCCsUV0c/CLAacnBj3rr7Am0iJ+ud/42wkaoLofDQe93F/s+gS
         2gLZ1qKrODT1SRGtzn12lZwFE9QgqzDHbhtIzIAKiDBaveDqM9IvfyARh68rQkPjGY5P
         uxgOX40j3yXuOt4tkHBJJ/vJZALRmV53YcZOkc7Z9YX/Xa+4S30deSRWhcbt5FfJE/Kg
         ze3p55tbNbCuKB0sCbYJeTOeGMy0dr1p922CRuun+wPdy1JR9fC1KkkPNbThq9ICTKOa
         ximt2cfC9mcIvdipoTZ2ZEO/sRAyV0X4V5tVwhfo0gEyHHe7dczv1W14vEAy9HL0cC1Q
         SKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975389; x=1793580189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/qxsvaefVxVArT/+E8r19mK8E8V/hwArN6Zs5LqTAI=;
        b=Bt8iQIGDKTTrKglk9DmC9DQ2N+5iDQkRdlpwgbxaXhS+e/Cd82DPCXKwrPytjE6Hq+
         JjV1/gfxBXLIu/2Kj0UNMto3YenP1Wf/+PgvW2UwSisNvM/hc5sJaMjkbTCUfIOu7XAs
         EIPUKv94ejxNO6t3qfetf4zRrwUsX+IhltQNzxO907e1Nv09+Alyj7sXpmIF+LtTC1r5
         yjHpUON9jZ6t1G/rZBMX7qO0YAveGV+RFmdLqRPXoNYX9LKqbVpsW0dL7tEXb3Z4/QQd
         ZHfmXF0s+YORdIRyCEw5AWg721dxEHAuquVEH4+tkIIpeiANB0mjZ0yx3hyt5BKON+HL
         NWKg==
X-Forwarded-Encrypted: i=1; AKwUvBwFfC4lA/obsVqW4hprv2xwPLkVCxmnE/gUxIjx8ezB/U42j1NXtklRv3+CNhXaUTPB21HJx8xxuvy+a38=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoxAjruXj+PLUZvn/NotgILZejbLUMMeujMhich9aIsnEURyC4
	56R55S9mx8BQjiMmnAyqP5G3rR0mbRM+gwnL0s2TR5LxG3xon/ljQA44
X-Gm-Gg: AYBFou1OBH69QvbVb28K+V+d6Gbh+CKFUVTer7HRIXnpAAWNxrLUzcSVu46jpYdWp2N
	jobzcSJtRiYAkT1MNou+5ZEevDBg6JnE7AHEmQLr6p3g2zss1YL9gZjevHvSn8908tB8TzgK6pp
	2OadaiU3CUGBikOiYDABvW2HI/VjcYx97ZRTPPn6687xCtXZuk5r8eiY6GNLAQ8SSLrG6sc0ykx
	EHhYcpQg/pvn6wnhdJkSvyZILZqAW9bte3CjDpsyYY2N9sYnFa9XNU0sfKoG4nWjO5c8/M7aKiP
	D2cFc4/2hvQqho1UaD7qFAzFn0Rr5K6eZrkb2hTpRdztjP07/vIhTuLU+jBcMULalqt6/znTEkx
	tRDk0/ov3X9kAlpAyI78SR4MVpw6svOt+yXMfc8qbV53ZBtx5qrmT7h1cO/EvaULWYN7IHVhNu5
	QdZPoOCjLOTsA3nUr7VWKb0q3LJQvc0vBGLbaCUZLVQ4q/KiXHqcF6o7322h0H9+TDyvADUFbPI
	Diq8wpEQzXzk4pR/qO0/InKCrD0Ho2hnSS+DjOOk/1/T22exctqdgV38hUkVO3GKeqATIU4JTfY
	RYKrMg0UOjP5iBa7WG5CbNqp1PrXkcRTOAE=
X-Received: by 2002:a05:600c:4715:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a35acbeeffmr89845025e9.28.1792975388950;
        Sun, 25 Oct 2026 17:43:08 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:07 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] regulator: sy7636a: wait for power good, then switch VCOM_EN
Date: Mon, 26 Oct 2026 00:39:15 +0000
Message-ID: <20261026003918.155321-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

Wait for power good on enable, as the TPS65185 and FP9931 drivers do.

The VCOM_EN line was requested but held low. When it is wired, let it
switch VCOM after power good.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/sy7636a-regulator.c | 77 +++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 382bab017784..5705599d1b55 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -7,8 +7,10 @@
 // Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
 //          Alistair Francis <alistair@alistair23.me>
 
+#include <linux/completion.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/sy7636a.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -17,11 +19,14 @@
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
+#define PGOOD_TIMEOUT_MSECS 200
+
 struct sy7636a_data {
 	struct regmap *regmap;
 	struct gpio_desc *pgood_gpio;
 	struct gpio_desc *en_gpio;
 	struct gpio_desc *vcom_en_gpio;
+	struct completion pgood_completion;
 };
 
 static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
@@ -65,13 +70,58 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
 	return ret;
 }
 
+static irqreturn_t sy7636a_pgood_handler(int irq, void *dev_id)
+{
+	struct sy7636a_data *data = dev_id;
+
+	complete(&data->pgood_completion);
+
+	return IRQ_HANDLED;
+}
+
+/* wait for the rails to be good, then switch VCOM on with VCOM_EN if wired */
+static int sy7636a_enable(struct regulator_dev *rdev)
+{
+	struct sy7636a_data *data = dev_get_drvdata(rdev->dev.parent);
+	int ret;
+
+	reinit_completion(&data->pgood_completion);
+	ret = regulator_enable_regmap(rdev);
+	if (ret)
+		return ret;
+
+	wait_for_completion_timeout(&data->pgood_completion,
+				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
+	ret = gpiod_get_value_cansleep(data->pgood_gpio);
+	if (ret <= 0) {
+		regulator_disable_regmap(rdev);
+		return ret ? ret : -ETIMEDOUT;
+	}
+
+	if (data->vcom_en_gpio) {
+		gpiod_set_value_cansleep(data->vcom_en_gpio, 1);
+		usleep_range(500, 700);
+	}
+
+	return 0;
+}
+
+static int sy7636a_disable(struct regulator_dev *rdev)
+{
+	struct sy7636a_data *data = dev_get_drvdata(rdev->dev.parent);
+
+	gpiod_set_value_cansleep(data->vcom_en_gpio, 0);
+
+	return regulator_disable_regmap(rdev);
+}
+
 static const struct regulator_ops sy7636a_vcom_volt_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.map_voltage = regulator_map_voltage_linear_range,
 	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
 	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
-	.enable = regulator_enable_regmap,
-	.disable = regulator_disable_regmap,
+	.enable = sy7636a_enable,
+	.disable = sy7636a_disable,
 	.is_enabled = regulator_is_enabled_regmap,
 	.get_status = sy7636a_get_status,
 };
@@ -104,7 +154,7 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct gpio_desc *gdp;
 	struct sy7636a_data *data;
-	int ret;
+	int irq, ret;
 
 	if (!regmap)
 		return -EPROBE_DEFER;
@@ -136,7 +186,6 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 				     PTR_ERR(data->en_gpio),
 				     "failed to get en gpio\n");
 
-	/* Let VCOM just follow the default power on sequence */
 	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
 						     "vcom-en", GPIOD_OUT_LOW);
 	if (IS_ERR(data->vcom_en_gpio))
@@ -156,6 +205,26 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	irq = gpiod_to_irq(data->pgood_gpio);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "no power good interrupt\n");
+
+	init_completion(&data->pgood_completion);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, sy7636a_pgood_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"sy7636a-pgood", data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to request power good interrupt\n");
+
+	/* VCOM switched by the VCOM_EN line; otherwise it follows the power on sequence */
+	if (data->vcom_en_gpio) {
+		ret = regmap_set_bits(regmap, SY7636A_REG_OPERATION_MODE_CRL,
+				      SY7636A_OPERATION_MODE_CRL_VCOMCTL);
+		if (ret)
+			return ret;
+	}
+
 	config.dev = &pdev->dev;
 	config.regmap = regmap;
 
-- 
2.52.0


Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93054457BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559887; cv=none; b=SBqajQfTu3qHNAGeEXra9P4mW5/Gf7EOQ94xixod/qSXVfBMTk8wSBglgybmK4yzh4Y476iZLcJ0lIXhl9e1STK7TVJgr5sJyieVbfcYlwN07m0MixBPyq7Atpvrm7N63SgEL+U289pKr2yMvgmuKsj1J4L6VWyLqp7pcEl/wXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559887; c=relaxed/simple;
	bh=tuKhK0Enx5k//K8I0pTMmNB+pTPJg1C2xYOO+ZfG/4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM5VmWm2H1XmzYZLhMhnRmjvU7Vt8Q9PtbgDDXgEyJYTQTGI2yP3k2r/9epvxduuSc7A9kSmEowA2pTnqSuaaA2fjZNNU2VanC8N3UvZFx3Z+lGh+sZMZ2q1xJ6m9Ot8FKHEVem6pXivRrrOR2akLu/TpeKQ+Aia4XC58kE72GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CTcYZdky; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CTcYZdky"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b5b727be96so1216978b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559881; x=1789164681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUIxvk5kQkVheOAAkQoSx1rVGdCSgrXOvmXyBL2x3MA=;
        b=CTcYZdkyX55xobtONwJru6rF9xc+jULpK7k/o8JtxRivDynnlmnNSEW1dBltzXcSha
         QFX86wNkHGUHELQNiW1+t6iHexsIVUdXY554WxFJccyYcrCFSI7tgYgnHCJcW3FoeISb
         BX5EKGgC2bW0BsUETUm3Y8h+/1c7IJTrgyon9YFOLspwIUdfFlc2imIBGiwAhMMVZ05V
         XsUpa6Rl3eQ/2sbdAnL/GEL4sWC3vFYozDeebmOfSHOLIKw4HJG+zbpQthIJZ6i0etND
         FoyxmLv/XtdaOL+O4drFXdvkVhNYcaBnAiRWqJYr4Iofa2Dls29ESpt0/4iTWmAaN+YR
         cPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559881; x=1789164681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUIxvk5kQkVheOAAkQoSx1rVGdCSgrXOvmXyBL2x3MA=;
        b=dwE/48yE3+Sr1WB2PCAFcj6TsfmwDYOszxCEMde2E3XHO1K1ekkCXYLc49+8b7q+2U
         t8/i/fwpFGQrZZrFz6qxgxBVR03xb7PAA03w2z17Ngo86WYGEiQ3PGeHqZ4u7DY7o6s/
         cIGFoNOm6ubZDk4o8LoGQRq6bSYhSLLmweP+W13bOkbjhNBbmPm27eswPG0Eu7C5ZmHT
         kXOXtTY/kQABNTV8BZuDYuwSSebYte2QKOTrUbCqF/jvPcSMnbBBGfm4K+8nTzvJFVSb
         +v43mVqijnpXg/XbUTdUBXg5UDrObj0SwsvT473zUBp/UrV00rH7dYWRr7bWyjaB1y8E
         S4aw==
X-Forwarded-Encrypted: i=1; AKwUvBwAOAaFGV6tP1JBEoq0iLk+KqRNFyIi8KCrgP38OIKA8064L6S4o/jgStBoO/Fry4yF7xvwK25x5X2hJyY=@vger.kernel.org
X-Gm-Message-State: AFuF++mLZnhQwF1Ys57rt5c8pWmG8/u+GZs5poo5yWQqUgHkIbCOZw/S
	4rwsl27TMGcgjIgpKA2ZaJDxNG3YyMncDNJZknEATgPI/i5kpToOxM92ykQP5TAYJbDoQSu0wHP
	H/8FG
X-Gm-Gg: AYBFou2IPZHR6+FjhTUza3+8nyWsiTKb6uXSSoZvPJQnUUu/igY0e2wuZ42NT3VMuxM
	cxY7VFPGEfyZcji4rfTOVNaYb+cXZ0C28JWCh3b0llcvP/Dmw41WPinid1uAw/qTd4GYf6Jk/d8
	j+F1zl0RFyDIhGp0fjoYXcWLl5Vn9k4ZA38UfL/TnXVWKXjBSdk5fBHShKKHdYoof9UpLKnLPVV
	2PCp8RFdPbgmIHOFTJjxGmYlxy8uXGn10WUKz6wSVlT4/G51C11bRW2eLaWdOo71DAJiMHikeh1
	YKYVXJItH7IrdRAThxh+nmUnhKI0QpqnwmHPYQvlRePWpyE3XpW9w42KBjtLpJRKPrhMbjHz3bT
	gu4wVzQYaMS19gVzJfGqZ6g3iNn0X2fa2ZVmc2enire1bLKidwMOD0EkL916adbFqEgz6znbBEP
	1JkEPM0djhC1n2bRazsGFV6R/ltUup6xC2ewys7QpB/AaJhEMVnRM+zMf3LOsItQRgjg==
X-Received: by 2002:a05:6808:1808:b0:4b9:a8ac:489 with SMTP id 5614622812f47-4b9a8bb6cb5mr4583694b6e.39.1788559881056;
        Fri, 04 Sep 2026 15:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:20 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:51 -0500
Subject: [PATCH v2 06/10] iio: adc: ti-ads112c14: support external clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-6-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tuKhK0Enx5k//K8I0pTMmNB+pTPJg1C2xYOO+ZfG/4E=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0HYU1VGAhx6DJvsdJa8HFsdTJCF/HJi3+GJM
 IrNV7NFj8aJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptB2AAKCRDCzCAB/wGP
 wMrgCACBtFq3ykEwE7rzzjexkhflcZ9jY3gPOb0hs28Afbej5b23jJ2+akNWv99LLVYBlGKNy2O
 RZgLoM4++INRz/b+cJRGgtYp9fSeX2L1y3PW3urCYtRrQbsItL+B/dKw4X+5Ovfgi5QZFhT0pU/
 lrB5HX9uNW7Fub2jZ/DLdnbmh+dgAjaMHN3eA4i2el8qGONZb4kEwdG7eJRpMh1SS7R3KtnXyWf
 SmhfAHgxCCExTvuTvEeq0bi9Dir26au7acmLjPKaaaDRd9URRCLAy6roU8Hbd9DxsTeRjm2ZQ7S
 xuOKlJ+ao2GVDX+uR/+pVV9zWpmGjs0+X/NpXndnEE6lAUIw
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add support for an external clock source to the TI ADS112C14 ADC driver.
The unused fclk_Hz field is added in preparation for filter support.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index c03789c3d95e..55462fc57752 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -11,6 +11,7 @@
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/crc8.h>
 #include <linux/delay.h>
@@ -178,6 +179,8 @@ static const u32 ads112c14_pga_gains_x10[] = {
 	200, 320, 500, 640, 1000, 1280, 2000, 2560,	/* 8 - 15 */
 };
 
+#define ADS112C14_INTERNAL_CLK_Hz 4096000
+
 #define ADS112C14_I2C_CRC8_POLYNOMIAL 0x07
 DECLARE_CRC8_TABLE(ads112c14_crc8_table);
 
@@ -268,6 +271,7 @@ struct ads112c14_data {
 	struct iio_trigger *drdy_trig;
 	/* Synchronizes access to register value fields. */
 	struct mutex lock;
+	long fclk_Hz;
 	int drdy_irq;
 	struct completion drdy_completion;
 	bool continuous_mode;
@@ -1536,6 +1540,7 @@ static int ads112c14_probe(struct i2c_client *client)
 	const struct ads112c14_chip_info *info;
 	struct iio_dev *indio_dev;
 	struct ads112c14_data *data;
+	struct clk *clk;
 	bool need_avdd_ref, need_ext_ref;
 	u32 refp_uV = 0;
 	u32 refn_uV = 0;
@@ -1628,6 +1633,12 @@ static int ads112c14_probe(struct i2c_client *client)
 		return dev_err_probe(dev, -EINVAL,
 				     "external reference measurements require either refp-supply or ti,refp-refn-resistor-ohms property\n");
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clk\n");
+
+	data->fclk_Hz = clk ? clk_get_rate(clk) : ADS112C14_INTERNAL_CLK_Hz;
+
 	/* It takes some time for the internal reference to stabilize. */
 	fsleep(10 * USEC_PER_MSEC);
 
@@ -1698,6 +1709,10 @@ static int ads112c14_probe(struct i2c_client *client)
 			return dev_err_probe(dev, data->drdy_irq,
 					     "failed to get drdy interrupt\n");
 
+		if (clk)
+			return dev_err_probe(dev, -EINVAL,
+					     "cannot use both DRDY and CLK - they share the same pin\n");
+
 		/*
 		 * REVISIT: would probably need to implement a pin controller in
 		 * order to support open drain option here.
@@ -1737,6 +1752,20 @@ static int ads112c14_probe(struct i2c_client *client)
 			return ret;
 	}
 
+	if (clk) {
+		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
+					 ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+						    ADS112C14_GPIO_CFG_GPIO_CFG_INPUT));
+		if (ret)
+			return ret;
+
+		ret = regmap_set_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
+				      ADS112C14_DEVICE_CFG_CLK_SEL);
+		if (ret)
+			return ret;
+	}
+
 	ads112c14_populate_tables(data);
 
 	indio_dev->name = info->name;

-- 
2.43.0


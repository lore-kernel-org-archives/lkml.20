Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F53DC4A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559878; cv=none; b=U2xvaKzQb21BZg3GK2MLAaKR+B8cvAbRelPdqj2pfUmZxQT3DzjcdyKsvvVeozA7M9+1jCInDvDwOlQf/PhzmxI1LMlKTGpzUkGVMI3ezNE1TpYHVgdbD/UkPNPVioJNOzDqDGThYbcggFD4ue17FgfABL+Flx8EDmYsdZ4QIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559878; c=relaxed/simple;
	bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfssB2F5lERGuoljyHfuvyeNKQslzDFdCokqVjqJ+hkvOBiy/QIwUHvYYS2TH9gRfl+QGE2RAY9+ODT/UiSetCGEtwJ4zCqzclH1LEedyW06M04LXDiRdvN3n0zOT63eSaCJBlWxhk55iUWbFalYLTdQSGmGg2hnE2KRh3Lcps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PRp0911S; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PRp0911S"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b39befc6a8so954939b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559872; x=1789164672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=PRp0911SBDp2kxwkv+WsdWmSzo37wbt1NscB1lRCuBjwGLpMum+yRi4xZdIYA+bE6e
         /x+0Sj8hBHWnWgxsXpzbMTu+CEaLRJrlVuWZkmfOuvAv8ZljFhjVeAhOcIhnlsGqmuMy
         k/IfIKmueBOWFRrWdWT5uyjP5v0I8XcF//oZoChbS7PZ2SWZQzYeUVjo30TidQop1EKo
         wMPqGkNysBfXcE0VMR98kU9e9R56cum86tGXtgDJw6VcS2mQuUrmiGQT8qh/KdYm2Y9Q
         PqzLI7ZT1M2ud2jC6VasX96h3ECGIacYesLoDhpGxGwisxIfvAulHfMovA0BYjkm8f0t
         oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559872; x=1789164672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=ECZDENYCWsMWdy+Djsb+NprecgzQLox2iPYYEwPQaMx2nvuoFZQ1FzzEKGs4jrrWd5
         EQEElsAJfFSAnqjqcR4npVTOa1RFqjlgUdpBMGvpS09deVN5nTkqDm2FOWAUMVBcZjmM
         dHQgskE8PvHvyYHsoRUnjHg+S0/NCwUBfNe6X2P6ofMxfRBI65hC6J2QuKNwgF2jVBeT
         fi+S3qra553jq/3fGylqyiyzsmuYxAegzDhZbqLpzWdUjKrjvhaaWlEsHB0/vKbw7DLm
         aYPKnnRG9qWmcDzJJnyLvDZIaAiQ/F8iAfYFwDb06ca5nJJK8wS65pfAdDZfVwJfmDPg
         A7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9PN4tdTMHJlewB3dhCmjMxEb8Y7o+SeUy7QkT/wKX+/H6uiILbDAHqzOJvV3aUXoKSsaPSY71WVU8zO4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDODYIph8PkLxhYu0lyE7gM5yjlvLWvbcJYC74cLqfnMQsmijy
	2wc5qwV7Bs5o6uuS8Yp6wTMyBkHFheIfOs+8VAJSfWRZQH2gBtmpL9RS1qsINxgPVGU=
X-Gm-Gg: AYBFou3vswRwguJ4sRtzWNwFYVkKbyBQueifXTYOL50lmfEyaqvHe3CK9B4gfTl8vqX
	BDaRU8gXMGTo3aqaZkg4hJ6iyJSTIUoBdlPcSF4BgCVh0ZlG1k4suk3+1P0LdUO1BShe+pPsNrk
	iu00xvY7j1d7U3Uj5PKXuIG02ilZnz+Gsdj2rFh89mAZ38nOp++J6R3IcLCVFEKs3x5zrkUjwL2
	UWNNMg/qZHsBYE0m+SO2OcEhhJCkNuXPJuJ7legBXFeiNKCnKyCWidUdt4jto9gY0ALtsn98Kl8
	/QQUvj+lBTfAFOxmwnQK2O0wUsV6dLm2Qmi7OkZk+NFq0Wno+89REPOmYzyjP7158k5yEmwTG3K
	nxfdVcF7Rbpi2Fi4KUlKqqIqt6Sqnj8lmTLybqh38KX9cqNP9YE4ESLlbghALkrbzTHug+uTqBD
	x/55SzqSL39oasgJIj8euYHdghbA/t/3JvoC25cOyHgPo19AVoBZtInxODFDBXWtdseg==
X-Received: by 2002:a05:6808:bd0:b0:495:f85b:38c0 with SMTP id 5614622812f47-4b9622bd05amr6970721b6e.12.1788559871881;
        Fri, 04 Sep 2026 15:11:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:11 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:46 -0500
Subject: [PATCH v2 01/10] iio: adc: ti-ads112c14: add DRDY interrupt
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-1-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0G3M+uBhqsEPf5gJgli+9VzwuNxMeOriZst5
 X025WDRUWeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptBtwAKCRDCzCAB/wGP
 wBGAB/4msLmdoxHeNkgTAbnuYoIAdb817nGdND14bB7D4VccDAJpcnLVZ5eiD8BIFcDB/hABGeA
 v/8lTz/NV/yN+JI2rrTtHC0yQLLEk4PuPas7e5AkQj+LkOVcYUbQqFIDemKFoRN6XvYTpN+U+PT
 uPg7ij3j0G7xqtA7AWZbIsWlj9R33CrM9mZCJBjyCexmE6h+EM82TxPsLEAhtNupqOdizRAOOI5
 oTmlqTOMeWfr0ypaAQ1qsKCmqADqgzHn0ljIed+BlWKK94t8Axmz2y8Hj3tNyoENu+dIYq1CxE/
 9acUC3nvKLWDYx7IXuC0Wm8eBeX5RjRn7wGTx930vet3nT4u
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add handling for the DRDY interrupt to wait for data ready events rather
than polling (only when it is wired up).

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---

Small note: the hard-coded 100 ms timeout will be replaced in a future
series with a dynamic value, so I didn't bother with a macro or comments
to explain why the value was chosen.

And passing indio_dev instead of data to irq is intentional as it will
be used in the next patch.
---
 drivers/iio/adc/ti-ads112c14.c | 100 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 60eab4852ba2..63b819339788 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/completion.h>
 #include <linux/crc8.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
@@ -19,6 +20,7 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
+#include <linux/interrupt.h>
 #include <linux/math64.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -117,9 +119,15 @@
 #define   ADS112C14_GPIO_CFG_GPIO2_CFG			GENMASK(5, 4)
 #define   ADS112C14_GPIO_CFG_GPIO1_CFG			GENMASK(3, 2)
 #define   ADS112C14_GPIO_CFG_GPIO0_CFG			GENMASK(1, 0)
+#define     ADS112C14_GPIO_CFG_GPIO_CFG_DISABLED	  0
+#define     ADS112C14_GPIO_CFG_GPIO_CFG_INPUT		  1
+#define     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL  2
+#define     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_OPEN_DRAIN 3
 
 #define ADS112C14_REG_GPIO_DATA_OUTPUT			0x0C
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC		BIT(7)
+#define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DAT_OUT  0
+#define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DRDY	  1
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_SRC		BIT(6)
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO3_DAT_OUT	BIT(3)
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_DAT_OUT	BIT(2)
@@ -251,6 +259,8 @@ struct ads112c14_data {
 	struct regmap *regmap;
 	/* Synchronizes access to register value fields. */
 	struct mutex lock;
+	int drdy_irq;
+	struct completion drdy_completion;
 	bool i2c_crc_enabled;
 	u32 avdd_uV;
 	u32 ext_ref_uV;
@@ -265,6 +275,16 @@ struct ads112c14_data {
 						 ARRAY_SIZE(ads112c14_sys_mon_channels));
 };
 
+static irqreturn_t ads112c14_drdy_irq_handler(int irq, void *private)
+{
+	struct iio_dev *indio_dev = private;
+	struct ads112c14_data *data = iio_priv(indio_dev);
+
+	complete(&data->drdy_completion);
+
+	return IRQ_HANDLED;
+}
+
 static bool ads112c14_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -581,12 +601,45 @@ static int ads112c14_prepare_sys_mon_channel(struct ads112c14_data *data,
 	return 0;
 }
 
+static int ads112c14_wait_for_conversion_irq(struct ads112c14_data *data)
+{
+	unsigned long remaining;
+	int ret;
+
+	reinit_completion(&data->drdy_completion);
+
+	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
+			   ADS112C14_CONVERSION_CTRL_START);
+	if (ret)
+		return ret;
+
+	remaining = wait_for_completion_timeout(&data->drdy_completion,
+						msecs_to_jiffies(100));
+
+	return remaining ? 0 : -ETIMEDOUT;
+}
+
+static int ads112c14_wait_for_conversion_poll(struct ads112c14_data *data)
+{
+	u32 reg_val;
+	int ret;
+
+	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
+			   ADS112C14_CONVERSION_CTRL_START);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(data->regmap,
+					ADS112C14_REG_STATUS_MSB, reg_val,
+					FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
+					1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
+}
+
 static int ads112c14_single_conversion(struct ads112c14_data *data,
 				       const struct iio_chan_spec *chan,
 				       u8 *buf, bool for_scan)
 {
 	struct i2c_client *client = to_i2c_client(regmap_get_device(data->regmap));
-	u32 reg_val;
 	int ret;
 
 	guard(mutex)(&data->lock);
@@ -601,15 +654,10 @@ static int ads112c14_single_conversion(struct ads112c14_data *data,
 			return ret;
 	}
 
-	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
-			   ADS112C14_CONVERSION_CTRL_START);
-	if (ret)
-		return ret;
-
-	ret = regmap_read_poll_timeout(data->regmap,
-				       ADS112C14_REG_STATUS_MSB, reg_val,
-				       FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
-				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
+	if (data->drdy_irq)
+		ret = ads112c14_wait_for_conversion_irq(data);
+	else
+		ret = ads112c14_wait_for_conversion_poll(data);
 	if (ret)
 		return ret;
 
@@ -1391,6 +1439,38 @@ static int ads112c14_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	if (device_property_present(dev, "interrupt-names")) {
+		data->drdy_irq = fwnode_irq_get_byname(dev_fwnode(dev), "drdy");
+		if (data->drdy_irq < 0)
+			return dev_err_probe(dev, data->drdy_irq,
+					     "failed to get drdy interrupt\n");
+
+		/*
+		 * REVISIT: would probably need to implement a pin controller in
+		 * order to support open drain option here.
+		 */
+		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
+					 ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+						    ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL));
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_DATA_OUTPUT,
+					 ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC,
+					 FIELD_PREP(ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC,
+						    ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DRDY));
+		if (ret)
+			return ret;
+
+		init_completion(&data->drdy_completion);
+
+		ret = devm_request_irq(dev, data->drdy_irq, ads112c14_drdy_irq_handler,
+				       0, dev_name(dev), indio_dev);
+		if (ret)
+			return ret;
+	}
+
 	ads112c14_populate_tables(data);
 
 	indio_dev->name = info->name;

-- 
2.43.0


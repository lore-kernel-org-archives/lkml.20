Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA23CF209
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869421; cv=none; b=NDnzDZSXuAUB/R16SrOKuzuGpX0G2oUzHS8/5NUglk16mUue1RTlmwWgF47yEes5o2yYVZus/bs7dg7fx5wCltYHto4zONupn1yTA+PndaHsipYVWQvLY5SVtF1Jx0BvM+zqXlm1HkFFHj2Mk3qMX8XHW7nyj5hFO0X65XCu+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869421; c=relaxed/simple;
	bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwV8L/u1jXIpJqWJf780XzHZQeR/cpShs+YymXpqhwGqRGb+9VIrvRM5vVAhIRcpLGi++8/MnJjEYu7zLci5cQpGU7VCLRBXX2MCaU+qQaYY34IR7ESxn9R48P5b3Et65py2iib5UQJXcA1re3gUmDqB3E9Dir2Uz48HWbYmXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bj9n86/4; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bj9n86/4"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-448b69cfc6dso513555fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787869411; x=1788474211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=Bj9n86/454/r0A5Rz30RgYmgEUzHeIJZ/uje9shf9gzih+oovpz6r40xX11R63es+k
         UszRfDxw0Zj9M1q2nDgPST4DEvUaU5Zenzd3qHA/0aZsC2C8d1R+eTe2OWdJe0RAJBKt
         n2UKoE3Owz7bcZeWTIJWKDZKfGCQzN9gcUtykeQSc3aYscSZwg957OB3qcbFSb1Ql2jq
         my5UowA7++8OL+0jWxrs1RADhUXJ2OXcgiJKDPWhzC12E9G1NaqvKIUH7piyl4bBzJtb
         DqaTQ7gB5wEnpWeei6TX63m7GjfpcSTQ+6XJWScjtnpYy9adSCxUqDJJ/XsiA+PkkySn
         oNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869411; x=1788474211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=J3L2zHq1zAXhr4F7lvSr6zmgAB4GT9Rau4i+fJ2F+LyOJB11NQU1/QvdhkUbgymo15
         EF5JAoZhLr0hjLcrh/q3+Y+VMC4WxBdW3ZCoATFUhElUDOEg9LA0AKVjixBFVyn/nzvA
         whBV5Ea/eKe5cbIPv356FxkpiagjoXKJcwvT7sbvgaYeNzNcbnJ1PxNYgyiH27O0r8Sf
         n2uMn09/IfuVyQxHfh15NgjCX+JCclfKBnGTwpOcwOdZY8EEjqMedy2nlattXBR/Joib
         cIQorbezVkW6fTfzRW6xf1lFkhMxER7+wZrzzizcUTHkxqbARGtnzRQP1jNRM+riNkcG
         dHRw==
X-Forwarded-Encrypted: i=1; AHgh+RqQxEJDFWZsyV7TUxvOyrkkBZYFL7amPI8zOckXCmD+ZUrGCN3NPPbbTdsO6hDy+LAgtO0seMLPBAtYzAo=@vger.kernel.org
X-Gm-Message-State: AFuF++klsDwWyXwGWBxNGF6ttqm1eqZnoOdR0z7wi36S6lkdiMDY8qD8
	UV0/iZq3y3Crrnh5F+gagX7xfNcxEhAfdnzBHnwGSF979CeFn/xEVjRAY4kS6LQisMo=
X-Gm-Gg: AR+sD126a9uRIRJzvZZAOJFAd3WvqMKmzGRPaKF2xnID3PbqbXDlevYz52qkSTQ4J4o
	YZj2OOJDWSZCxO9SOF+bSibCdVS/vufB+P8M9V7fAsyDPdx8myFE+gMSqUonzCi7BraBw2qjSeo
	IvEt6LowcvQ97qIlYB4K3ODUFCdY00RaRW1/siNvKClEXDNXNPoKzC+66g1hk5SkRdChi+AnMLt
	3jLHgq/tCp+L2rEPLkOq0Vaz55bprEMiNwoL1zBIGpctFNjj63zCjhNowkKj3Ya2GUTpTNCuhZg
	jawEtrhhqqlERRqKDV8NpbYID3a+P7MYfKYfS2+5O1m72Ni+fwFUu0l5KlYhZJo9/FJURPdl2L3
	rSmdqW22zYNxIzHGtmIXfffe3DXlTjruqVsuDbUjDwdMs+5I5hPrXf+3TSHfXYXNoseQ8O3M32g
	QOwE0D4gG12vV85KKRbkj7apAf9M0OkDYriFE46G0Tq8QGq0bNjSAJMRc8H8zP1OzWTt2TGsg1x
	Hyc
X-Received: by 2002:a05:6870:340c:b0:417:4693:ca0 with SMTP id 586e51a60fabf-46837336748mr3287799fac.14.1787869411000;
        Thu, 27 Aug 2026 15:23:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d288:6f77:e285:6925])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46736445d6csm3176880fac.2.2026.08.27.15.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:23:30 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 27 Aug 2026 17:22:53 -0500
Subject: [PATCH v4 1/3] iio: adc: ti-ads112c14: add DRDY interrupt support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-1-1e51a6e20a69@baylibre.com>
References: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
In-Reply-To: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqkLjL4zBRwoqqPUTVf7uUQ/AGhhA7trbe/0MLE
 jXD4Q5bhk2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapC4ywAKCRDCzCAB/wGP
 wI9VB/wOUhPd+nshKlotSaCWLOXFgUr+QeZ7Sf1Pt/vGSoCOcObHFrujg3gPRKNUbl5yncXYgpj
 BybatK1G3EV/fcQgWRVOJ5iTT2czeznwN4rubcXiBJRb4MDehx2eI0sPEB+8aT8ncwEAEiikiVw
 z9vvY0LnW8DwPMbyo33WZI2zkiGG2gGN9CXqGgwgvSWJWK0f6O0ryipEYOfh8ix8JL7HgZsJvtr
 nXLgDb6+R2O6LFQLveVOmE40F+33FnNRgW8bjtlPTib1/xS/oIU5obhJijpglRZ5vJi+vO+IBgz
 5Vxqry0Gedl5kuBneT8zkvh4Aro1p8H2CcvNLkAeNKd134Us
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


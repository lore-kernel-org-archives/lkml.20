Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD33BED01
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215629; cv=none; b=UFqb+8EEu4JR2a0VLhIvpMCVwaTwxCda+3gqanUXq8ZBJgYlEGDGTlGyZ+E+gsiL46os0mbA4BkJaIN4Wwrfw88mVqq2V/8rw1M3QE1PAOMzeUE8ju73l2bX3up+1V3nLQrDz6btxHzSxej7SH+2eJvwY61qlaKoSw/b/AbyIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215629; c=relaxed/simple;
	bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dp8D75IdqI+iXY+gBtHb9HEOrkvQAA9iQyDTSJ32hcPMbinPXBGSsbdDbcclLH6wkbIv/Q4NOvmv4LxoxY4TrLbzdap5f19MU1SEQP9QUYJgu70114pHoQCIP8l7hLSieJTjTHZO7lO3Djp9On9R59EcilCTshtdYT0Do+jgrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q1kaeiw7; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q1kaeiw7"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f5a781972fso2354627a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788215626; x=1788820426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=Q1kaeiw7xTe/mxxX0Zfbv5UULdBruD6h5CKghw5SuG/VAad25xXTf9nUv6N0h0J63b
         mNoYGK3zTsgDLtry48Bc48pJMmr0vb5IMnF7z4r1HSmvzkjebUbTgYV/JwVaw4cx9Pjo
         XO2ePD3m73SUyTUSMK373pnb4u9x5wajjawcGNlbzB/d6GXMcyWGyWHdIJFu5AmYtLf5
         HQpmaYx+kT82anwOIanj+Fb4vx29QpnHT9NIuvX7QpVnE1LKc17S/936znnkaUZggbKq
         xPCyZLuPOboD9qhnCTgugs3bRE6XVLMUFWZ/QQyScS6Ow9UVwf1VvYJC1you8PNsGkQR
         JT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788215626; x=1788820426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNTRuf05CTvv6ajYQ262DYaZCyLOnZ0DLR4E2AczWeM=;
        b=bAW1vXLmLqr5NYJu7JuERCRxWR0xX6/08o7pKiaoFX5xPAA4FUzVOc30dWzt0NdUet
         UY4u+onWS3V5DNuUigUuu3OR2XtGJuaxU080PfesQmP7beKENsVtalmbyfvxEyu1GHnX
         YzbKeqwsmze/l14dMKEYJTP17TYJGW4VCKbSSEqxbyB2LJrHkzP0J7fka4q6BtWAdqpH
         hivonrYeRDC9tvyh8dOZBVindjeRDTMrVryL0yRZKPelT5wRi48vNTDBFJmiT8PMHPNK
         Szx1Zob1Gj728/LzRQb0O3gBgT3KWa/P8/aktMCLPLSoUfY/0lt3zIhy73NuTYg1rkeP
         7fwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgYQwjKBRLnKKFwIQHH2YK5QFIQeRz2QD4f/bIITtz3+DmnEb+l9kMlD++AriDlp85M5U+IZnaEHolPlM=@vger.kernel.org
X-Gm-Message-State: AFuF++n0TCGYbQGUceIEeDoAfpvQYlCONzyIVWwFwqcRBdHqsAJnP1OH
	mEjM4Fp0ULUxFzdX2lfohc2WIhPPvzO+W9+AQyKXDh0ia80Ox004i9TaAyhBBuuY9PCJkD8q0dH
	vBPdj
X-Gm-Gg: AR+sD125s37lq6MOIOU0CQVnqgceoNr3QDcvmSX9tCqKOZ9o1hVsOWDz6B0YX/qaloF
	Oia7XAdERlNyHj/DgR3ob95WWlk8Mnxz/5Zk/Q9dM1hpvLRHczbPHyGY4LtMD8gnGiBNhgpyftu
	Zfq0qSZ8SChZ3fjsaKqX8ix8+wr8AApyRRCSn5Pi17/I0VAjeQ3RmKmcqYeewGSdr0ZQM3pAGBT
	k4rKCKYCfeRNldGQ8fizwgQI1iS/G9FETjImQG4w0qAw8FQXuMs80GB5aOxZWJneWXtgoU/RDtU
	jDlpqOHX0viC+wcKIeEzh5ZGGAwa5G1mIllKVNoDuIgRMgFLzxA+bJ+NXrBpEGEHLr1TLqD+SQK
	jGYjg9n9ysOhLEEbG/pYY/rBC6fwi4oDwVuPNQoOg1hXnrWeJE4NuEbJS60TQO4RotojNNvVkzE
	PreZEpbsvAIx3uaJu8pXgh7GORAwXXuwLtSfmb0Ij5KKWBG0eUvCMxBzCX7NUp9nfWfQ==
X-Received: by 2002:a05:6830:2117:b0:7e7:8dc0:3951 with SMTP id 46e09a7af769-7f6879f9436mr5424341a34.8.1788215625827;
        Mon, 31 Aug 2026 15:33:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7efe09sm9190551a34.11.2026.08.31.15.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:33:45 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Mon, 31 Aug 2026 17:33:05 -0500
Subject: [PATCH v5 1/3] iio: adc: ti-ads112c14: add DRDY interrupt support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-1-76f80a04b94f@baylibre.com>
References: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-0-76f80a04b94f@baylibre.com>
In-Reply-To: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-0-76f80a04b94f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NDSDpivYarXePwTSDpiVgkViP53hrWoSMytekojHNS0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqlgEpK+CHXZEgZyX1eY20//e+JjIuqN/diYxeS
 PFRBARhmw+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapYBKQAKCRDCzCAB/wGP
 wIa/B/9Kaa7VniIy4q2e3CBryijGHVAOgB4nJ5l3/Y8jzDGSvPt6wcH5ELV/8h3PVaeb4USMRMB
 K6Tk2j8zQ10j9vo8imSjuD7Nj0qtbZg8gQ0A18f2mWJUOTL37IOTqOmVBsPmneoG0Yb0t4m65LO
 hJVFeNj1sJACs2jl3wYnekdHJz09zKEVEo07QaIFNbsCvgw4cOEgUH/lPEV1GOMUFIy9bBozl9C
 tKmv/8K5SsgPWMm5phnKz7oF3tXWwXcvYzT9VpON9BKbpovM+/zFQaezipHAl72Iz4Ea//7AqrW
 2/G6b6OuxylfYllrw8IgP99nyIaHTd2iTgBKL/upocvsumrF
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


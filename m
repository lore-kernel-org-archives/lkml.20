Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733898;
	b=MCE2vTkIuQoo6PR2pA8GTOGMuUYjHh5k2qwoMhCbTo+s8RB1VEtJ3vwNrQx4PgnKi0kG
	 +DIPAbNe+WMAyWmBcI0B1F7NKbKEylWZuW7oNvCMaujE19UQWJelZFbv7ENw6jnwYoEGo
	 EfdHEbUx1/vAsh56YAItutURPYk248ycAhFtzWZ0WrXYbW2pfUlm/aynQ/cEVUgcfMF+e
	 WM5L+Dpe6A5h5MZCZXc6Ek1SbZewYyhBCiOIy4I+IUwlnhjddXsJrwbybBAKzxDkZmbI2
	 My1LxRex4HAjsmUgTieIfPDWLUGLKQ7GiuifrofrVJTCD+d+BGXmsRZZtkMGXouzG6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
	b=vFFHOgCJywfxj9/tDyNHXWWwCEwS5xfYQpDfVYMos9f/bw0QsSlsP0S0sZtp6aNRmshl
	 YwxyeOyS1Igc8uY1XZwshp6Q8s9NFNz/JmMN9NfWFVE0zqgk54NPMWrrcJ2oYXo938ziC
	 lY3Uddbz5axy8ZU0uZelTkgQbTubhxn6dEfeGAbK4ly86mt35XjLsKrWaN5YwYLntst+Y
	 6JxzckyyTuNkXQ9tPTmdEzGog2TSQ+HURv+X286ICkwtWy0iiF9iMpvL25J1I7i7II27A
	 1s4JtmVfRy2PbVBswFvAeVPWU1HlgxrmEPE7NeHRriykllOFYyx8EzeJEA2uW/zHGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHTpmVAm;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C19606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C19606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHTpmVAm
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d30639709so370158766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733896; x=1795338696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=tHTpmVAmuXfO6xhACr2ooRjFyAE/c3XHioSsoHEEY70qgft9KyR6+jvRKcUi9spInK
         bSAskAVmr4C8q1qzC0ju6lUW1Y/pOb3TjPNWwcEazWhK/p0JkzvEHaA+yWPX/fOFDxoq
         cMs3+tHM9APPJObX9pMx0LwqBIJ1S9W/rnZGqnh9FL3H6MkktME8QoI/g4HCjBYBcSjh
         4q7TcGbGUKmWZYj9FwBboNtASOa2X8ii2bJIAkVWQ2Q5AI1KgDYYENf4Da/pCjqE/v9C
         mixIvyoKdRq5uTC/TFciZDsNZZax4Z2oi6afJADXWxaHIC73NZV02ksn3+V+lOMToI9B
         QBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733896; x=1795338696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=zxlZ4MKz0IE+p8beYxWIlW1g2Rz9kYBZDOno2drhzKMtqes46wDltYgNoBGWz5ho9N
         xUT0+U2dTLeBwMi3hmkAL9Tf4zWqcUBM4vFeWF9EVhGSHldl0zIvZV7ZHv75QBCDiRDu
         ZOnotVN5O9kwGy5qDf1I9uSTZKaT8GhEULTFN/dl6UymiO8yQbbwU/gy/n0ty2c41zOB
         eGnGVBFUbV0PxUhJzQFS3nDqOC2Q02/2SVR1qXss+34CLUlHDpS56cE0AN1QzNpgeBsz
         8e1GgBTzQBes4g6S+ojoe3klW8lmsqZEhKQeN3zne6U714yLnaxHqvubzdqW0Bw9LSda
         13ew==
X-Gm-Message-State: APuU4Z+S3i20VvQ2S4anCSkUEo5ZnyS5wqhWrIv5pjV1ma2PNHL/G3xX
	ZlvoJ0pSKedWmjU2bD3/rKOe9a2Q64NwFERlrY5b+XFT4CnCtWM7QAWG
X-Gm-Gg: AYBFou2b1ArS2zUKUAa6wSKSZt60Z8l49aU0nP92Dr7QgpyNaeqJ9XOtp/tDMbP39uE
	99Uqs/BfjbovwoXoAlvf9CS79Pm+fk3n0zrgZAW3S/2DySCAKBbF5qxgPxcAfqV7/bfvxIXOHcW
	W+5oTB0x2+0nBignlfPjaDv+6ouXiM8jBynFutOemOvEBQtUOnc/LJh+8cuMCvw0cnUSukW4gx4
	NNlWh6wSyX5Ms5SCT00PCdoESwhw8e/AI4Lup3FdycoGgXospiyLOqDW6ZWp/6bXgRoK+lG/+ml
	RqZ5hYGLXkic+ydspQJkvdmJKmzBkfOzXlg9mbisGXMI2LCrDkTcYreMHWgZxDFCMsuk4jizStG
	8SvCiBVfgVpcW9ucYVFvgmsM8Rc1e8zhU6Q7ZFcHIgIsJKZO9xI4fIjVwLexk5+lHP2P9Uvc2Bu
	aa/ne0s/NnhUF6UD2W1TWQpuQk2bN/VhdgX508ghEOAbOW+y1owU1FciLkdW6tMo4JnwgnHA9PD
	X5xjTS+BgmnZfapCnxjVY0dmB3lV1wwsp9mEKmvXahFqecEHDIstVe+FXsk9XCx4OzRV2eIEGiP
	BQHk+/YOdzCFQ6xiZ6IZnyyy6E7velLz4vsb39VQSxuc1knAkNVFkYYTUPGaOj9NcA8rSEdIXGX
	dUECwIc4wnllnch6GHHLa8e4t+wZbHVU=
X-Received: by 2002:a17:906:c14d:b0:c50:5cd7:2901 with SMTP id a640c23a62f3a-c509640bfa8mr557945766b.23.1794733896267;
        Sun, 15 Nov 2026 01:11:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 3/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:19 +0200
Message-ID: <20261115091120.108684-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/adc/Kconfig       |  10 ++
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/max8907-adc.c | 169 ++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f8456c8039883..4d5bd8f93fb8c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1176,6 +1176,16 @@ config MAX77541_ADC
 	  To compile this driver as a module, choose M here:
 	  the module will be called max77541-adc.
 
+config MAX8907_ADC
+	tristate "Maxim MAX8907 ADC driver"
+	depends on MFD_MAX8907
+	help
+	  Say yes here to build support for 8 channel 12-bit ADC
+	  interface found in the Maxim MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here:
+	  the module will be called max8907-adc.
+
 config MAX9611
 	tristate "Maxim max9611/max9612 ADC driver"
 	depends on I2C
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index d7bb4815df61c..8e6755315aa35 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_MAX14001) += max14001.o
 obj-$(CONFIG_MAX34408) += max34408.o
 obj-$(CONFIG_MAX40080) += max40080.o
 obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
+obj-$(CONFIG_MAX8907_ADC) += max8907-adc.o
 obj-$(CONFIG_MAX9611) += max9611.o
 obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
diff --git a/drivers/iio/adc/max8907-adc.c b/drivers/iio/adc/max8907-adc.c
new file mode 100644
index 0000000000000..1776032efc913
--- /dev/null
+++ b/drivers/iio/adc/max8907-adc.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/mfd/max8907.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_ADC_SCHED_AUTOSCH_ENABLE	BIT(1)
+#define MAX8907_ADC_SCHED_AUTOSCH_TIME		BIT(0)
+
+#define MAX8907_TO_REG(n)			((n) & 0xff)
+#define MAX8907_TO_MEASURE(n)			(((n) >> 8) & 0xff)
+
+enum {
+	TDIE, THM, ISNS, VMBATT, VBBATT, VCHG, AUX2, AUX1
+};
+
+static const u32 max8907_default_ref[] = {
+	[TDIE] = 4096,
+	[THM] = 4096,
+	[ISNS] = 4096,
+	[VMBATT] = 8192,
+	[VBBATT] = 8192,
+	[VCHG] = 8192,
+	[AUX2] = 2500,
+	[AUX1] 4096,
+};
+
+#define MAX8907_CHAN(_type, _idname, _datasheet_name) {		\
+	.type = (_type),					\
+	.address = MAX8907_REG_##_idname##_MSB |		\
+		   MAX8907_REG_##_idname##_MEASURE << 8,	\
+	.indexed = 1,						\
+	.channel = (_idname),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
+			      BIT(IIO_CHAN_INFO_SCALE),		\
+	.scan_index = (_idname),				\
+	.scan_type = {						\
+		.format = IIO_SCAN_FORMAT_UNSIGNED_INT,		\
+		.realbits = 12,					\
+		.storagebits = 16,				\
+		.endianness = IIO_CPU,				\
+	},							\
+	.datasheet_name = (_datasheet_name),			\
+}
+
+static const struct iio_chan_spec max8907_adc_channels[] = {
+	MAX8907_CHAN(IIO_VOLTAGE, TDIE,   "tdiode"),
+	MAX8907_CHAN(IIO_VOLTAGE, THM,    "thermistor"),
+	MAX8907_CHAN(IIO_CURRENT, ISNS,   "isense"),
+	MAX8907_CHAN(IIO_VOLTAGE, VMBATT, "vmbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VBBATT, "vbbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VCHG,   "vcharge"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX2,   "aux2"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX1,   "aux1"),
+};
+
+static int max8907_adc_read(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	struct regmap **regmap = iio_priv(indio_dev);
+	__be16 data;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_write(*regmap, MAX8907_TO_MEASURE(chan->address), 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->address), &data, sizeof(data));
+		if (ret)
+			return ret;
+
+		*val = be16_to_cpu(data) >> 4;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		*val = max8907_default_ref[chan->channel];
+		*val2 = chan->scan_type.realbits;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info max8907_adc_info = {
+	.read_raw = &max8907_adc_read,
+};
+
+static int max8907_adc_init(struct regmap *regmap)
+{
+	u32 value;
+	int ret;
+
+	/* Enable internal voltage reference. Exact purpose of bits is not known. */
+	ret = regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK(1, 0), BIT(1));
+	if (ret)
+		return ret;
+
+	/* Check for internal reference IRQ */
+	ret = regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT, value,
+				       !(value & MAX8907_MASK_NREF_OK), 0, 1000);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
+				  MAX8907_ADC_SCHED_AUTOSCH_TIME,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
+}
+
+static int max8907_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct iio_dev *indio_dev;
+	struct regmap **regmap;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*regmap));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	regmap = iio_priv(indio_dev);
+
+	*regmap = max8907->regmap_adc;
+
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = max8907_adc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(max8907_adc_channels);
+	indio_dev->name = dev_name(dev);
+	indio_dev->info = &max8907_adc_info;
+
+	/*
+	 * The ADC does not require a dedicated node; hence, the PMIC is set as
+	 * the iio_dev parent to enable the use of the PMIC node phandle in the
+	 * Device Tree bindings.
+	 */
+	iio_device_set_parent(indio_dev, dev->parent);
+
+	ret = regmap_set_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			      MAX8907_MASK_INT_REF_EN);
+	if (ret)
+		return ret;
+
+	ret = max8907_adc_init(max8907->regmap_adc);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static struct platform_driver max8907_adc_driver = {
+	.driver.name = "max8907-adc",
+	.probe = max8907_adc_probe,
+};
+module_platform_driver(max8907_adc_driver);
+
+MODULE_ALIAS("platform:max8907-adc");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 ADC driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


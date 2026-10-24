Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883651;
	b=5Zd263+6VfnHBHplGzz/TMQTsHy5unWUbi38ah1T7Dd07Y2wvojmKySHEm8dy7duCTGA
	 DFy3BhJoEBqyq8Um3KKAK/v0OVw3MSglsBTcJiP6AI5AXqbASQhrjEzYroL2QxI/nacVh
	 viHkdglI9IIS4Dwq6nFQPxIdoR9MxqcHbKasfbIA5tfqw3ayw3XA9u4+dt/NbutZu+4Nz
	 Ifu9R1Fj7yWhfzmVxcpQBX7Q21grItOEdqtjkHcq1QzUCytCkSeUmj5f0UB39etN9UEDY
	 rZLep/mvh1GYdy7uvcamebkQ1LEGYNkzkEBNsIaMIqHmQPxCepj+TKKqZX4PgNrVEog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
	b=xnNh20mDBUiqu5upSF5+oegcBMWEdINAqa8as34mf/NZvmREcIN36nEC1vV9gVSE0MRm
	 p0pEOcWwUDyIsop17fulXX+ZrytcsCmpTPc232RaRMKkP8C2JPJG6CKdw5FDJiWaErRYe
	 SQZl2vXCzylH6r4x+rMhNp6yknE80pBp6NR105Zlvsnsftd1Hzad7tlwwU8Gcyjm0kT3k
	 Y8INhIWIXiMRRI2I15hFPW6YPXuCBLRS7SqDy2aTQliiv0HCYj9Qs9xTI+5wNRedzYB4p
	 tlfTzWXbhMMZnSzntjpCjilGHViEFoTl/RIVkHwb45udiZhZC4S7RonlX9ZcZxytGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C6TFmIlo;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424A606A322
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9424A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C6TFmIlo
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7bec5112765so1434226137.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883648; x=1793488448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
        b=C6TFmIlo4tzFwlOqjZlJ7PU2N1JOTqfZcINSpdz07QbbiJqKQYb9F+ClwbQIfbdcka
         EZF5TFJYPQwhAhxBN2pIakxIhyXxUAlaUIzOKon4nrHq4b1aNQc5NyBZHLokXg8e2AeZ
         KSWKdXDlv0ss8ugexmWbJkGcCJkzoHZnjE8NH/pIITcLxnj5EqV2fyTMjBPIJFOl9NK0
         2QMFHJX9oILbGanxGBHPj6D3T5NRq00P9lOznVv8vm05hfkk54cvIr2XB3czrt7KqSs5
         RDLEV0AU3bl1czE7ZvNBjB0hv24bYMDwT487S4XaEW5JR8ikfs7VDMO5oX1RiL1R6vp1
         lHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883648; x=1793488448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
        b=B/HiJyiYbuknlztGfRR83SaG5CELFQlIEgoCoAAsYcEQppp78QtFy4rglQJSXcMUQ4
         HHVsgf0B0u/g+sdHF1ODf953mkLbyLmZJA5YWui/a50Qx5EMHbGcAphc5geAHQJXpTXG
         zKoIqNRFYwZgaBrUIXJe+KDYHBl1cdAfruKHvvIfb3j1NmTmhZDHYbQltHPENJNTvFru
         hMjg8ECv6ca9yMlWlwj+5gRn2Sn/F58Y4gIkWL/H4bFN1iSMTOuIOKLKthnrze176IpL
         +IEvxsZDB7+sCK8YDJ/TZ22ujq0V3ilvI0HHpOKPg/hWdp8CanA6nxLat67GEwtYGYe8
         9twQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlHavJ2IR46P9E5+XQaoNunmNpuloB0mD123ugE+uP8ESEQvIgOuaIkf6wFhdtVUu0GVi+I3sFcuGEyxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr6JObYO1nstYU0XPU9JAQ5Ge0K0MEFSoRrXtLx66aS8EqzCKI
	WpAmMQZuTR5JZVCLcS3zav/hMPed1bLniggTvJ/TlcZCZaa80j6rFFDC
X-Gm-Gg: AYBFou0Bfrf7zUYC3K2vkUq7J68bchwovUsVYWzxB8utVR0WS4KchtLbhve4wCK5RCj
	W9sPVD/EoctENMX5UmWlVsQ8FAb2KNF/9HEBf99d0uO7AGub7bHPPZ4yfowi+qM5qFWcIlW1s+6
	22PGuArW+RprC1CFSW9JXKZYP+2zYYpegNajxAC93dh+Cp3HXgOc/CsU4owpUC0t83f8a/rD0Kk
	79D0WfGnlwrEszyXTTo4kSadECebV2NUKVRK8Q2FLJLk3aLVOrTg62+LV6MBWyI8PikE/IGhjd9
	2SBFPfiKp1V4EAB7KjWiT+gfvH2xjXtmoOWgCZlKgC0sF3yI8WVK8Oi96O8npJPnWpmtkGSVRMv
	p0nuiE8N21bHE/fNMpJX81BK5Ucg0vdcFUeiW84E63mg/1S/KfhhJ2mU6FCcXeE5KDvoizI2x6f
	AGWVE0CXTlX4nYqtGH8IKoWHesWpSN6+bubu8x5jSjS/4pCSwvI6JNkUjL9JE+RfMs+UTGg5+Xe
	v4oD34uXpht9Wqw72z6zT010f+TaD6LIUouy8tth2xuKxGMG6OJF8JwqK+yqG/by74uXREENgWw
	TUH8
X-Received: by 2002:a05:6102:5245:b0:7cc:3eb0:6ef4 with SMTP id ada2fe7eead31-7ce5cdfb267mr1031775137.29.1792883648516;
        Sat, 24 Oct 2026 16:14:08 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:07 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] iio: adc: ti-ads1298: fix scale, ID check, regmap and Kconfig
Date: Sat, 24 Oct 2026 20:13:32 -0300
Message-ID: <20261024231335.280955-4-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024231335.280955-1-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
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

Fix four smaller issues:

- The scale divides the reference, in whole millivolts, by the gain
  before it is reported. With the internal 4 V reference, it is 0.099 %
  low at gain 6, 0.101 % at gain 12 and 0.025 % at gain 3. Report
  VREF / (gain * 2^23) as an IIO_VAL_FRACTIONAL; sysfs still shows it
  with nine decimals, now without the error.

- Only the channel codes 0, 1 and 2 of the ID register are defined; an
  ID of 0x93, for example, gives 10 channels. The IIO core then reads
  past ads1298_channels, and the RDATA transfer writes past rx_buffer.
  Refuse the reserved codes as an unknown ID.

- The driver uses regmap but does not select REGMAP, and fails to build
  where nothing else selects it, such as tinyconfig with SPI, IIO and
  TI_ADS1298 on x86_64.

- Bit 0 of CONFIG3 is a read-only status bit and the GPIO register
  reads the pins, but both are cached, so a read through debugfs returns
  a stale value; debugfs can also write ID, LOFF_STATP and LOFF_STATN.
  Mark CONFIG3 and GPIO volatile, and the other three not writeable.

The ID check was found by review and reproduced on an emulated device
only, where KASAN reports the read past ads1298_channels.

Fixes: 00ef7708fa60 ("iio: adc: ti-ads1298: Add driver")
Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 drivers/iio/adc/Kconfig      |  1 +
 drivers/iio/adc/ti-ads1298.c | 29 ++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f32f678f7..a29ed8f45 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1924,6 +1924,7 @@ config TI_ADS1298
 	depends on SPI
 	select IIO_BUFFER
 	select IIO_KFIFO_BUF
+	select REGMAP
 	help
 	  If you say yes here you get support for Texas Instruments ADS1298
 	  medical ADC chips
diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index f5965b994..b390c13ae 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -75,6 +75,7 @@
 
 #define ADS1298_REG_LOFF_STATP	0x12
 #define ADS1298_REG_LOFF_STATN	0x13
+#define ADS1298_REG_GPIO	0x14
 #define ADS1298_REG_CONFIG4	0x17
 #define ADS1298_MASK_CONFIG4_SINGLE_SHOT	BIT(3)
 
@@ -373,11 +374,10 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 		return -EINVAL;
 
 	gain = ads1298_pga_settings[pga_idx];
-	*val /= gain; /* Full scale is VREF / gain */
+	/* Full scale is VREF / gain, signed, hence the -1 */
+	*val2 = gain << (ADS1298_BITS_PER_SAMPLE - 1);
 
-	*val2 = ADS1298_BITS_PER_SAMPLE - 1; /* Signed, hence the -1 */
-
-	return IIO_VAL_FRACTIONAL_LOG2;
+	return IIO_VAL_FRACTIONAL;
 }
 
 static int ads1298_read_raw(struct iio_dev *indio_dev,
@@ -680,8 +680,11 @@ static void ads1298_quiesce(void *data)
 	ads1298_wait_rdata_idle(priv);
 }
 
+/* CONFIG3 holds the read-only RLD_STAT; GPIO reads the pins */
 static const struct regmap_range ads1298_regmap_volatile_range[] = {
+	regmap_reg_range(ADS1298_REG_CONFIG3, ADS1298_REG_CONFIG3),
 	regmap_reg_range(ADS1298_REG_LOFF_STATP, ADS1298_REG_LOFF_STATN),
+	regmap_reg_range(ADS1298_REG_GPIO, ADS1298_REG_GPIO),
 };
 
 static const struct regmap_access_table ads1298_regmap_volatile = {
@@ -689,12 +692,23 @@ static const struct regmap_access_table ads1298_regmap_volatile = {
 	.n_yes_ranges = ARRAY_SIZE(ads1298_regmap_volatile_range),
 };
 
+static const struct regmap_range ads1298_regmap_read_only_range[] = {
+	regmap_reg_range(ADS1298_REG_ID, ADS1298_REG_ID),
+	regmap_reg_range(ADS1298_REG_LOFF_STATP, ADS1298_REG_LOFF_STATN),
+};
+
+static const struct regmap_access_table ads1298_regmap_writeable = {
+	.no_ranges = ads1298_regmap_read_only_range,
+	.n_no_ranges = ARRAY_SIZE(ads1298_regmap_read_only_range),
+};
+
 static const struct regmap_config ads1298_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.reg_read = ads1298_reg_read,
 	.reg_write = ads1298_reg_write,
 	.max_register = ADS1298_REG_WCT2,
+	.wr_table = &ads1298_regmap_writeable,
 	.volatile_table = &ads1298_regmap_volatile,
 	.cache_type = REGCACHE_MAPLE,
 };
@@ -704,6 +718,7 @@ static int ads1298_init(struct iio_dev *indio_dev)
 	struct ads1298_private *priv = iio_priv(indio_dev);
 	struct device *dev = &priv->spi->dev;
 	const char *suffix;
+	unsigned int nu_ch;
 	unsigned int val;
 	int ret;
 
@@ -717,7 +732,11 @@ static int ads1298_init(struct iio_dev *indio_dev)
 		return ret;
 
 	/* Fill in name and channel count based on what the chip told us */
-	indio_dev->num_channels = 4 + 2 * (val & ADS1298_MASK_ID_CHANNELS);
+	nu_ch = FIELD_GET(ADS1298_MASK_ID_CHANNELS, val);
+	/* 0, 1 and 2 are 4, 6 and 8 channels; the other codes are reserved */
+	if (nu_ch > 2)
+		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", val);
+	indio_dev->num_channels = 4 + 2 * nu_ch;
 	switch (val & ADS1298_MASK_ID_FAMILY) {
 	case ADS1298_ID_FAMILY_ADS129X:
 		suffix = "";
-- 
2.43.0


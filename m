Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883655;
	b=brzNBTxyg+ZKP1tn1OiHOxx5dLkcEizPt/w9vG9tdHV6gtSTdw6ECg4oYvrenrIpUzvk
	 OelaZRtysNnQifgGYnwGcTJSAsvqVxp1W/67rCZ6oRHs7N6Ema4d4Adu6/Av5S1vFxOBi
	 IrPuJ/FLDAM75zNtCOH2zXHZbRKeMQmIeo+VZ839IwkgQduXzcPS5hawlC/4coPi1XKr4
	 JqqK3FTiv5EOTuLSwbYuz699XS5Y0F/kxqCoS4YbkpCYTFg4VuLjJ47/edMH5+EtvchHt
	 cieRDzclvHiL17sYXJ3N2u8qmZkFnxgrxX/w0PSAxrCCxVF6+AlOTfxOYkF/UIzMVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VU+PRp8E+r2gsR8UrQr9iiFb4OtLPockRgEmkyRdn3I=;
	b=DQCug11J57krH6cM1+d5VqaaDE+F51x4j2RuOS58zr3iTBkkO7WDMjspa7+u4YyKSv1/
	 fXN6Hxc44Cnk5q7lT2PBDKEO+GYixbwbUJ2kRQu+eRYfMYgujtWFAlOxLVOoe5No0Aqcq
	 rnRDEYPlctc12tKbtPypeio8/BoYyhVTGaUHir9JPO4rNOD6Xj4V7dgsq/VhT/ymk66Dv
	 eo60cEAUAiQ9UNwflV2UGMV82cSFoR4yOgnqHQ9JFRVPwUcilxaMN/4uq/+csROn6vooX
	 UJUkpCf8w9jFpt+JI+Bw1umnYeNJ6FhkROcb9dfS8vsnG9/5CMROeaX6S2QuuPNnJLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AzulYp8A;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79743606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79743606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AzulYp8A
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7bec5112765so1434261137.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883654; x=1793488454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VU+PRp8E+r2gsR8UrQr9iiFb4OtLPockRgEmkyRdn3I=;
        b=AzulYp8A6Wf4nq2XC3cgt7egA1O5t+FvdyeSEIPOQ/iCpA2qpwFd6eDvKS/aOJXwCz
         YxGxRAo/eHgxNUup5cGm8DUpSPcLByz4pFkFhz0gF7wblBXS5PbmpCV2Uz93vX4JLfTk
         6hqywKbyWbj3JXiBUZptGNZukRZnHzDaArkJ2lG+x14dh62dACZVCUepQF84AelBv9p8
         F+9HBYRYXaoE8cJS58EdXWEInxan97mX0o/habkhjhSJmKbig10bUSBGyBNxXUPAr5TQ
         1uTaK2vrxBOhcC+QitH5YbDGZ3kv8EXHkKeUJmGLrJPrO8sJUovkImghvVEUnG9+s5Xg
         /XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883654; x=1793488454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VU+PRp8E+r2gsR8UrQr9iiFb4OtLPockRgEmkyRdn3I=;
        b=1LXg5/Vmq+gfNLWeXpDtx/2oqYcKvhjPTvXC0mtdqYzEE3ztzQMLOaQ8CJEdmvKP+f
         CO97cZ8X6jfnGRasOww3sKFy82XT0KLxyPeH0f5rRMBx3jY4v0lq0LK18b+Gg5njTknz
         m65grSwlq1bEmyOj8QNITWuf4eI3FW4y+4NNfAZdcvDMzH0Y3V8enCtErQGVMVrWAlgR
         7e6YCvOuDtjJc+QMm2klKmvvic9m/w5PXoHV9Jopp+9yqFGSqkSINm6KHYCkRCmOD0Dq
         89IlF8FJ63RbZYQGXWmomANkn/AEyFH9RYLTORMlSJPv5YsMtPtZQ1K0RtDn6UJK9DRX
         61Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxFjTUPSmQLmAhdFJU4R/mAZ7XpbPbZeW8mznBaiFp2y0Tf5RN7mgeOEfn0s2917NDcFLTReHjjwhRyB9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYItagHacnVB9BY1EuiKhkRteROubMCivSNGO59HubamJf9Foxzi
	FCzTy/dAbztM8IjcbekefWuW1k6aYwlHzFJLvTj9vNPbnm5t60Y7Vnaw
X-Gm-Gg: AYBFou0eL+e+tqSG+L0LqwiVdOD+055mJVdO+9IEULXPpTDOcA4JhIAzbgNssCrdil/
	4y9AglrhxN80JhU5IpkHYobEHgOr2aL8lkoZ0nHTbTTVSoeDZBov/QDlzefMDvB8U3VaBs4Di7C
	YYBiB0SWX8tursDltJpwipx0r1RAVZSFUFlUwxhuSSs+0Hr4Drc2qI6dmEwtV68pGkxTXfl2y1C
	jbH5VzYvYUSTlCyclrcpAjvyclpk0EfTEhlWnUdOH2t8GOsXJYZXa3EzTA6kpYaRyl8KkosPKAM
	tDSGXPgSI8SAGPZvybhBPaE6IRT0iIiYCB0eqykdRI32bzAFcmtxQcaIrtI5M56R6MPgS1+rYxH
	WuQVA04GLbT+gaPR6L7HczdV87BreRRLoBCJHtHH5Qv1TfgehTQsEU1KNzOCDlXKicT18dKlPBT
	zCXKMaAHAIkDg54y66hoc1LaTdvHQNLZGuI8+sbHk4SHw4mwVwa8bk7dV9LakLDBhfF6gx4Heg1
	YPIPOg/+vWSn2Vb5JeQtN9BX1sPVXAYqO3iM8zqwF6tMtuk/9TtmzVIEkRwf2lanWXJgRyUvKQI
	I2XX
X-Received: by 2002:a05:6102:809e:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ce5ccc3247mr1067852137.13.1792883654381;
        Sat, 24 Oct 2026 16:14:14 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:13 -0700 (PDT)
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
Subject: [PATCH v2 4/6] iio: adc: ti-ads1298: prepare for more chip families
Date: Sat, 24 Oct 2026 20:13:33 -0300
Message-ID: <20261024231335.280955-5-stephanbrrs8@gmail.com>
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

The ADS1299 has the register map of the ADS129x, with other gains, data
rates, reference and ID layout. To support it in this driver, collect
what differs between families in a chip info structure, given as match
data. The private structure has carried an unused chip_info pointer
since the driver was added.

The chip info holds:
- the regmap configuration and the PGA gain table;
- the data rate rules: the base shift, whether CONFIG1 has an HR bit,
  and the oversampling ratio at DR = 0;
- the internal reference, whether CONFIG3 has the VREF_4V bit, and the
  reserved bits of CONFIG3 that must be written as 1;
- a callback that checks the ID register and sets the channel count and
  the name, as the ID layouts differ; bit 3 alone tells them apart.

No functional change.

Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 drivers/iio/adc/ti-ads1298.c | 132 +++++++++++++++++++++++++----------
 1 file changed, 96 insertions(+), 36 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index b390c13ae..5ad543bdf 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -49,8 +49,6 @@
 #define ADS1298_REG_CONFIG1	0x01
 #define ADS1298_MASK_CONFIG1_HR			BIT(7)
 #define ADS1298_MASK_CONFIG1_DR			GENMASK(2, 0)
-#define ADS1298_SHIFT_DR_HR			6
-#define ADS1298_SHIFT_DR_LP			7
 #define ADS1298_LOWEST_DR			0x06
 
 #define ADS1298_REG_CONFIG2	0x02
@@ -66,6 +64,7 @@
 #define ADS1298_MASK_CONFIG3_PWR_REFBUF		BIT(7)
 #define ADS1298_MASK_CONFIG3_RESERVED		BIT(6)
 #define ADS1298_MASK_CONFIG3_VREF_4V		BIT(5)
+#define ADS1298_VREF_4V_MV			4000
 
 #define ADS1298_REG_LOFF	0x04
 #define ADS1298_REG_CHnSET(n)	(0x05 + (n))
@@ -105,6 +104,31 @@
 #define ADS1298_SPI_RDATA_BUFFER_SIZE_MAX \
 		ADS1298_SPI_RDATA_BUFFER_SIZE(ADS1298_MAX_CHANNELS)
 
+/* What differs between the chip families the driver supports */
+struct ads1298_chip_info {
+	/* Checks the ID register, and sets the channel count and the name */
+	int (*parse_id)(struct iio_dev *indio_dev, unsigned int id);
+	const struct regmap_config *regmap_config;
+	/* PGA gain for each value of the GAIN field of CHnSET */
+	const u8 *gains;
+	unsigned int num_gains;
+	/*
+	 * The data rate is f_CLK >> (dr_shift + DR). With an HR bit in
+	 * CONFIG1, dr_shift is that of the high-resolution mode, and the
+	 * low-power mode shifts one more.
+	 */
+	unsigned int dr_shift;
+	bool has_hr;
+	/* Oversampling ratio at DR = 0 */
+	unsigned int osr_base;
+	/* Internal reference, in millivolts */
+	unsigned int vref_mv;
+	/* CONFIG3 has the VREF_4V bit, which selects a 4 V internal reference */
+	bool has_vref_4v;
+	/* Reserved bits of CONFIG3 that must be written as 1 */
+	unsigned int config3_reserved;
+};
+
 struct ads1298_private {
 	const struct ads1298_chip_info *chip_info;
 	struct spi_device *spi;
@@ -286,6 +310,7 @@ static int ads1298_read_one(struct ads1298_private *priv, int chan_index)
 
 static int ads1298_get_samp_freq(struct ads1298_private *priv, int *val)
 {
+	const struct ads1298_chip_info *info = priv->chip_info;
 	unsigned long rate;
 	unsigned int cfg;
 	int ret;
@@ -302,10 +327,10 @@ static int ads1298_get_samp_freq(struct ads1298_private *priv, int *val)
 		return -EINVAL;
 
 	/* Data rate shift depends on HR/LP mode */
-	if (cfg & ADS1298_MASK_CONFIG1_HR)
-		rate >>= ADS1298_SHIFT_DR_HR;
+	if (info->has_hr && !(cfg & ADS1298_MASK_CONFIG1_HR))
+		rate >>= info->dr_shift + 1;
 	else
-		rate >>= ADS1298_SHIFT_DR_LP;
+		rate >>= info->dr_shift;
 
 	*val = rate >> (cfg & ADS1298_MASK_CONFIG1_DR);
 
@@ -314,6 +339,7 @@ static int ads1298_get_samp_freq(struct ads1298_private *priv, int *val)
 
 static int ads1298_set_samp_freq(struct ads1298_private *priv, int val)
 {
+	const struct ads1298_chip_info *info = priv->chip_info;
 	unsigned long rate;
 	unsigned int factor;
 	unsigned int cfg;
@@ -327,9 +353,9 @@ static int ads1298_set_samp_freq(struct ads1298_private *priv, int val)
 	if (val <= 0)
 		return -EINVAL;
 
-	factor = (rate >> ADS1298_SHIFT_DR_HR) / val;
-	if (factor >= BIT(ADS1298_SHIFT_DR_LP))
-		cfg = ADS1298_LOWEST_DR;
+	factor = (rate >> info->dr_shift) / val;
+	if (factor >= BIT(ADS1298_LOWEST_DR + 1))
+		cfg = ADS1298_LOWEST_DR; /* Lowest rate, in LP mode */
 	else if (factor)
 		cfg = ADS1298_MASK_CONFIG1_HR | ilog2(factor); /* Use HR mode */
 	else
@@ -340,11 +366,10 @@ static int ads1298_set_samp_freq(struct ads1298_private *priv, int val)
 				  cfg);
 }
 
-static const u8 ads1298_pga_settings[] = { 6, 1, 2, 3, 4, 8, 12 };
-
 static int ads1298_get_scale(struct ads1298_private *priv,
 			     int channel, int *val, int *val2)
 {
+	const struct ads1298_chip_info *info = priv->chip_info;
 	unsigned int pga_idx;
 	int ret;
 	unsigned int regval;
@@ -356,13 +381,16 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 			return ret;
 
 		*val = ret / MILLI; /* Convert to millivolts */
-	} else {
+	} else if (info->has_vref_4v) {
 		ret = regmap_read(priv->regmap, ADS1298_REG_CONFIG3, &regval);
 		if (ret)
 			return ret;
 
 		/* Reference in millivolts */
-		*val = regval & ADS1298_MASK_CONFIG3_VREF_4V ? 4000 : 2400;
+		*val = regval & ADS1298_MASK_CONFIG3_VREF_4V ?
+		       ADS1298_VREF_4V_MV : info->vref_mv;
+	} else {
+		*val = info->vref_mv;
 	}
 
 	ret = regmap_read(priv->regmap, ADS1298_REG_CHnSET(channel), &regval);
@@ -370,10 +398,10 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 		return ret;
 
 	pga_idx = FIELD_GET(ADS1298_MASK_CH_PGA, regval);
-	if (pga_idx >= ARRAY_SIZE(ads1298_pga_settings))
+	if (pga_idx >= info->num_gains)
 		return -EINVAL;
 
-	gain = ads1298_pga_settings[pga_idx];
+	gain = info->gains[pga_idx];
 	/* Full scale is VREF / gain, signed, hence the -1 */
 	*val2 = gain << (ADS1298_BITS_PER_SAMPLE - 1);
 
@@ -414,7 +442,7 @@ static int ads1298_read_raw(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 
-		*val = 16 << (*val & ADS1298_MASK_CONFIG1_DR);
+		*val = priv->chip_info->osr_base << (*val & ADS1298_MASK_CONFIG1_DR);
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;
@@ -713,31 +741,20 @@ static const struct regmap_config ads1298_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
-static int ads1298_init(struct iio_dev *indio_dev)
+static int ads1298_parse_id(struct iio_dev *indio_dev, unsigned int id)
 {
 	struct ads1298_private *priv = iio_priv(indio_dev);
 	struct device *dev = &priv->spi->dev;
 	const char *suffix;
 	unsigned int nu_ch;
-	unsigned int val;
-	int ret;
-
-	/* Device initializes into RDATAC mode, which we don't want */
-	ret = ads1298_write_cmd(priv, ADS1298_CMD_SDATAC);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(priv->regmap, ADS1298_REG_ID, &val);
-	if (ret)
-		return ret;
 
 	/* Fill in name and channel count based on what the chip told us */
-	nu_ch = FIELD_GET(ADS1298_MASK_ID_CHANNELS, val);
+	nu_ch = FIELD_GET(ADS1298_MASK_ID_CHANNELS, id);
 	/* 0, 1 and 2 are 4, 6 and 8 channels; the other codes are reserved */
 	if (nu_ch > 2)
-		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", val);
+		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", id);
 	indio_dev->num_channels = 4 + 2 * nu_ch;
-	switch (val & ADS1298_MASK_ID_FAMILY) {
+	switch (id & ADS1298_MASK_ID_FAMILY) {
 	case ADS1298_ID_FAMILY_ADS129X:
 		suffix = "";
 		break;
@@ -745,19 +762,57 @@ static int ads1298_init(struct iio_dev *indio_dev)
 		suffix = "r";
 		break;
 	default:
-		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", val);
+		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", id);
 	}
 	indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads129%u%s",
 					 indio_dev->num_channels, suffix);
 	if (!indio_dev->name)
 		return -ENOMEM;
 
-	val = ADS1298_MASK_CONFIG3_RESERVED; /* Must write 1 always */
+	return 0;
+}
+
+static const u8 ads1298_gains[] = { 6, 1, 2, 3, 4, 8, 12 };
+
+static const struct ads1298_chip_info ads1298_chip_info = {
+	.parse_id = ads1298_parse_id,
+	.regmap_config = &ads1298_regmap_config,
+	.gains = ads1298_gains,
+	.num_gains = ARRAY_SIZE(ads1298_gains),
+	.dr_shift = 6,
+	.has_hr = true,
+	.osr_base = 16,
+	.vref_mv = 2400,
+	.has_vref_4v = true,
+	.config3_reserved = ADS1298_MASK_CONFIG3_RESERVED,
+};
+
+static int ads1298_init(struct iio_dev *indio_dev)
+{
+	struct ads1298_private *priv = iio_priv(indio_dev);
+	unsigned int val;
+	int ret;
+
+	/* Device initializes into RDATAC mode, which we don't want */
+	ret = ads1298_write_cmd(priv, ADS1298_CMD_SDATAC);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, ADS1298_REG_ID, &val);
+	if (ret)
+		return ret;
+
+	ret = priv->chip_info->parse_id(indio_dev, val);
+	if (ret)
+		return ret;
+
+	val = priv->chip_info->config3_reserved; /* Must write 1 always */
 	if (!priv->reg_vref) {
 		/* Enable internal reference */
 		val |= ADS1298_MASK_CONFIG3_PWR_REFBUF;
 		/* Use 4V VREF when power supply is at least 4.4V */
-		if (regulator_get_voltage(priv->reg_avdd) >= 4400000)
+		if (priv->chip_info->has_vref_4v &&
+		    regulator_get_voltage(priv->reg_avdd) >= 4400000)
 			val |= ADS1298_MASK_CONFIG3_VREF_4V;
 	}
 	ret = regmap_write(priv->regmap, ADS1298_REG_CONFIG3, val);
@@ -785,6 +840,10 @@ static int ads1298_probe(struct spi_device *spi)
 
 	priv = iio_priv(indio_dev);
 
+	priv->chip_info = spi_get_device_match_data(spi);
+	if (!priv->chip_info)
+		return -ENODEV;
+
 	/* Reset to be asserted before enabling clock and power */
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio))
@@ -836,7 +895,8 @@ static int ads1298_probe(struct spi_device *spi)
 	init_completion(&priv->completion);
 	init_waitqueue_head(&priv->idle_wq);
 	spin_lock_init(&priv->irq_busy_lock);
-	priv->regmap = devm_regmap_init(dev, NULL, priv, &ads1298_regmap_config);
+	priv->regmap = devm_regmap_init(dev, NULL, priv,
+					priv->chip_info->regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
@@ -896,13 +956,13 @@ static int ads1298_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ads1298_id[] = {
-	{ .name = "ads1298" },
+	{ .name = "ads1298", .driver_data = (kernel_ulong_t)&ads1298_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ads1298_id);
 
 static const struct of_device_id ads1298_of_table[] = {
-	{ .compatible = "ti,ads1298" },
+	{ .compatible = "ti,ads1298", .data = &ads1298_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ads1298_of_table);
-- 
2.43.0


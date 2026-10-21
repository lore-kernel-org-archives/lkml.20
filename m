Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578533;
	b=GbSw3K02tPQNp84BZ01jG27ZN4QdlsPsnc3Ze9gfwrGI8m6qKsu6WrxW0NnbrbFyX01a
	 +6ZThrAFSTIINnvo3Ib8UGaRjvEDgdIbBqpPsjdy7mti33IPsulSqBZ4EXRR67GOyuApt
	 whvH5fE5a6zGi5Rp2La+77g7CmDUlIvEUTSZWagAgthQuLGhUHy/oafSHaPsWQDvBOdFM
	 dB1JIxavjtHVCr++QB7TD4tUhViiUehPbErP5n4gAWQW7tCvua3D9TCtLVCwAipQRQv1C
	 agEbHyItX+ON90VUEu2id8tQjZf8Nfti5wY8RollslD2ls+TLLT42BaWYk2KqjmU44g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578533;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=oCnVrt4wqaxqrWRUReIpaxwEocd5X62y11lS7htifyc=;
	b=TZ38ddw6hd6m9PWhaqDeJrbtA2lc00mG3h1s6MOgav3fBVbnZ+H1p8JO8hcx6FugkhAX
	 mulSwNPnU+K4voaphvSebVbmnvqvm4oxHJT86BjSabVJrxWiC31z9Bi+R+eoBGU0IS3C2
	 dhuewXMS6o0uW8FyVZUaC8lCvhpWpRhgIMmHAwdzyWySdIiXRVPNxRUCOru8clY26v0Nj
	 gBbCCzTsi6oFRAjx0kPmojCE2MkjII/sjKQktA5LSOUndInADT6t3O3Xllwmqmy+ssyRc
	 Lu+n2ZYFJa2ZYgLVysi2tgzyVnEt7duT7V6Sg6fx2SLDqTogXwu5MEOcV7sbp/fmMgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1juXvcAT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCABA606A323;
	Wed, 21 Oct 2026 10:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCABA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1juXvcAT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68E564E41297;
	Wed, 21 Oct 2026 10:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DBEF606E3;
	Wed, 21 Oct 2026 10:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60CFE10328E21;
	Wed, 21 Oct 2026 12:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oCnVrt4wqaxqrWRUReIpaxwEocd5X62y11lS7htifyc=;
	b=1juXvcATeFDSqe+T47mejooo2qHtkglvKYKqagTGGt+Ytoa+1XIeNE41qgJb7ZeuFH0HG9
	oOgiRAQUc+5EGFqB1g4GgWKhbVxJRd3N3bb9aBe102X6K7N4FhUmLtCXP3d4w6vD0dFPda
	oJn4AA5UcAR9P7Tu+nOISnCIh+t0ZC8I/jlD8JN6HSmRHPbOa/4BqGyWTKaRKGp0VCyS1D
	dXiL0yQ5q6fL2Kpwy3/bImdDtZ1jKLqT+DiB6G4WePG9iwPy2teTGhCDDeGCrUjygoh8Tj
	Ymrog00+cmpGLC7mnHaNDuA0A0Kub9iGBsiK3HH2qQTudmtfkdq1ok9YIS9ROg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 21 Oct 2026 12:27:46 +0200
Subject: [PATCH 5/5] regulator: Add TI LM51772 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=28695;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=pBpr5SRcjVcG5oxGJ1f7ekRGA+Hajp4Rgi0d9ZC9078=;
 b=7wBrqYqKG4UioYivj3mHh1ZNSUmIBCxHA9y7N0iU9ZsxCf1fhg8RpqM5edbi32zNuOlB3jodS
 wn46GX6iatBCktXOdXzIVrHVm5fLLJT/IkrTiuiQt6EWSnUVC1ukNtU
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add driver for the TI LM51772 buck-boost voltage regulator.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |  11 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/lm51772-regulator.c | 826 ++++++++++++++++++++++++++++++++++
 4 files changed, 839 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c958e116cd66..a4c59be2551c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27465,6 +27465,7 @@ TI LM51772 BUCK-BOOST REGULATOR DRIVER
 M:	Paul Louvel <paul.louvel@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
+F:	drivers/regulator/lm51772-regulator.c
 
 TI LMP92064 ADC DRIVER
 M:	Leonard Göhrs <l.goehrs@pengutronix.de>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7d151433747b..ce43a1dea33d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -519,6 +519,17 @@ config REGULATOR_LM363X
 	  One boost output voltage is configurable and always on.
 	  Other LDOs are used for the display module.
 
+config REGULATOR_LM51772
+	tristate "TI LM51772 voltage regulator"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This driver supports the TI LM51772 buck-boost controller, designed
+	  for USB Power Delivery applications. It provides a software
+	  configurable buck-boost output voltage and a fixed auxiliary 5 V LDO
+	  output, both controlled over I2C. The driver supports voltage
+	  setting, current limiting and fault/thermal reporting.
+
 config REGULATOR_LOCHNAGAR
 	tristate "Cirrus Logic Lochnagar regulator driver"
 	depends on MFD_LOCHNAGAR
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6aabcc54382a..783eda233e25 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
 obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
 obj-$(CONFIG_REGULATOR_FP9931) += fp9931.o
 obj-$(CONFIG_REGULATOR_LM363X) += lm363x-regulator.o
+obj-$(CONFIG_REGULATOR_LM51772) += lm51772-regulator.o
 obj-$(CONFIG_REGULATOR_LOCHNAGAR) += lochnagar-regulator.o
 obj-$(CONFIG_REGULATOR_LP3971) += lp3971.o
 obj-$(CONFIG_REGULATOR_LP3972) += lp3972.o
diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/lm51772-regulator.c
new file mode 100644
index 000000000000..b5259f277243
--- /dev/null
+++ b/drivers/regulator/lm51772-regulator.c
@@ -0,0 +1,826 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI LM51772 I2C regulator driver
+ *
+ * Datasheet: SNVSC22D (September 2025)
+ *
+ * Copyright (c) 2026 Bootlin
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/linear_range.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/coupler.h>
+#include <linux/regulator/driver.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#define LM51772_SENSE_RES_DEFAULT_MOHM		10
+
+#define LM51772_VCC1_LDO_UV			5000000
+#define LM51772_VCC1_LDO_NV			1
+
+#define LM51772_ILIM_THRESHOLD_MIN		0x0A
+#define LM51772_ILIM_THRESHOLD_MAX		0x8C
+
+/* Register map (datasheet table 8-1) */
+#define LM51772_REG_CLEAR_FAULTS		0x03
+#define LM51772_REG_ILIM_THRESHOLD		0x0A
+#define LM51772_REG_VOUT_TARGET1_LSB		0x0C
+#define LM51772_REG_VOUT_TARGET1_MSB		0x0D
+#define LM51772_REG_PD_STATUS_0			0x21
+#define LM51772_REG_STATUS_BYTE			0x78
+#define LM51772_REG_USB_PD_CONTROL_0		0x81
+#define LM51772_REG_MFR_SPECIFIC_D0		0xD0
+#define LM51772_REG_MFR_SPECIFIC_D1		0xD1
+#define LM51772_REG_MFR_SPECIFIC_D2		0xD2
+#define LM51772_REG_MFR_SPECIFIC_D3		0xD3
+#define LM51772_REG_MFR_SPECIFIC_D4		0xD4
+#define LM51772_REG_MFR_SPECIFIC_D5		0xD5
+#define LM51772_REG_MFR_SPECIFIC_D6		0xD6
+#define LM51772_REG_MFR_SPECIFIC_D7		0xD7
+#define LM51772_REG_MFR_SPECIFIC_D8		0xD8
+#define LM51772_REG_MFR_SPECIFIC_D9		0xD9
+#define LM51772_REG_IVP_VOLTAGE			0xDA
+
+#define LM51772_ILIM_THR_STEP_UV		500
+#define LM51772_ILIM_THR_MIN_UV			5000
+#define LM51772_ILIM_THR_MAX_UV			70000
+
+#define LM51772_VOUT_TARGET1_MASK		GENMASK(11, 0)
+
+/* USB_PD_CONTROL_0 bits */
+#define LM51772_FORCE_DISCH			BIT(1)
+#define LM51772_CONV_EN2			BIT(0)
+
+/* STATUS_BYTE bits */
+#define LM51772_STAT_OTHER			BIT(0)
+#define LM51772_STAT_CML			BIT(1)
+#define LM51772_STAT_TEMP			BIT(2)
+#define LM51772_STAT_INPUT			BIT(3)
+#define LM51772_STAT_IOUT			BIT(4)
+#define LM51772_STAT_VOUT			BIT(5)
+#define LM51772_STAT_OFF			BIT(6)
+
+/* MFR_SPECIFIC_D0 bits */
+#define LM51772_EN_VCC1				BIT(5)
+
+/* MFR_SPECIFIC_D1 bits */
+#define LM51772_EN_THER_WARN			BIT(7)
+#define LM51772_THW_THRESHOLD_MASK		GENMASK(6, 5)
+#define LM51772_EN_NINT				BIT(4)
+#define LM51772_CONV_EN				BIT(0)
+
+/* MFR_SPECIFIC_D2 bits */
+#define LM51772_DISCHARGE_STRENGTH_MASK		GENMASK(3, 2)
+#define LM51772_DVS_SLEW_RAMP_MASK		GENMASK(5, 4)
+#define LM51772_DVS_SLEW_RAMP_DEFAULT		0
+
+/* MFR_SPECIFIC_D3 bits */
+#define LM51772_EN_IVP				BIT(7)
+#define LM51772_SEL_IVR				BIT(6)
+#define LM51772_VDET_EN				BIT(5)
+
+/* MFR_SPECIFIC_D6 bits */
+#define LM51772_CONFIG_SYNC_PIN_MASK		GENMASK(7, 6)
+
+/* MFR_SPECIFIC_D8 bits */
+#define LM51772_SEL_FB_DIV20			BIT(7)
+#define LM51772_EN_CDC				BIT(6)
+
+/* MFR_SPECIFIC_D9 bits */
+#define LM51772_SEL_ISET_PIN			BIT(5)
+#define LM51772_PCM_WINDOW_LOW_MASK		GENMASK(4, 0)
+#define LM51772_PCM_WINDOW_LOW_MAX		0x1F
+#define LM51772_PCM_WINDOW_LOW_DFLT		0xC
+#define LM51772_PCM_WINDOW_LOW_STEP_PERMILLE	25
+
+#define LM51772_IVP_VOLTAGE_DFLT		0xFF
+
+#define LM51772_DIV10_MIN_UV			1000000
+#define LM51772_DIV10_STEP_UV			10000
+
+#define LM51772_DIV20_MIN_UV			3300000
+#define LM51772_DIV20_STEP_UV			20000
+
+#define LM51772_N_REGS				2
+
+struct lm51772_priv {
+	bool iset_pin;
+	bool nint;
+	u32 sense_res_milliohms;
+	u32 ovp_thres;
+};
+
+static int lm51772_regulator_set_thermal_protection(struct regulator_dev *rdev,
+						    int lim, int severity, bool enable)
+{
+	static const struct linear_range thw_range_celsius = LINEAR_RANGE(95, 0, 3, 15);
+	unsigned int regval = 0, mask = 0, selector = 0;
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	struct device *dev = rdev_get_dev(rdev);
+	long celsius = 0;
+	bool found;
+	int ret;
+
+	if (severity != REGULATOR_SEVERITY_WARN)
+		return -EOPNOTSUPP;
+
+	if (lim != 0) {
+		celsius = kelvin_to_celsius(lim);
+
+		ret = linear_range_get_selector_low_array(&thw_range_celsius, 1, celsius, &selector,
+							  &found);
+		if (ret || !found)
+			return -EINVAL;
+
+		selector = thw_range_celsius.max_sel - selector;
+
+		regval |= FIELD_PREP(LM51772_THW_THRESHOLD_MASK, selector);
+		mask |= LM51772_THW_THRESHOLD_MASK;
+	}
+
+	regval |= FIELD_PREP(LM51772_EN_THER_WARN, enable ? 1 : 0);
+	mask |= LM51772_EN_THER_WARN;
+
+	dev_dbg(dev, "thermal protection set to %ld deg C (selector 0x%02x, enable %d)\n", celsius,
+		selector, enable);
+
+	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, mask, regval);
+}
+
+static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
+{
+	int ret;
+
+	ret = regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0,
+				 LM51772_CONV_EN2,
+				 FIELD_PREP(LM51772_CONV_EN2, enable));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0,
+				  LM51772_CONV_EN,
+				  FIELD_PREP(LM51772_CONV_EN, enable));
+}
+
+static int lm51772_get_conv_en(struct regmap *regmap)
+{
+	unsigned int pd_ctrl, cfg0;
+	int ret;
+
+	ret = regmap_read(regmap, LM51772_REG_USB_PD_CONTROL_0, &pd_ctrl);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D0, &cfg0);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(LM51772_CONV_EN2, pd_ctrl) || FIELD_GET(LM51772_CONV_EN, cfg0);
+}
+
+static int lm51772_regulator_enable(struct regulator_dev *rdev)
+{
+	return lm51772_set_conv_en(rdev_get_regmap(rdev), true);
+}
+
+static int lm51772_regulator_disable(struct regulator_dev *rdev)
+{
+	return lm51772_set_conv_en(rdev_get_regmap(rdev), false);
+}
+
+static int lm51772_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	return lm51772_get_conv_en(rdev_get_regmap(rdev));
+}
+
+static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
+{
+	static const struct linear_range ovp_ranges[] = {
+		LINEAR_RANGE(4000000, 0, 0x17, 500000),
+		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
+	};
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	struct device *dev = rdev_get_dev(rdev);
+	unsigned int selector;
+	bool found;
+	int ret;
+
+	ret = linear_range_get_selector_low_array(ovp_ranges, ARRAY_SIZE(ovp_ranges), lim_uV,
+						  &selector, &found);
+	if (ret || !found)
+		return -EINVAL;
+
+	dev_dbg(dev, "OVP set to %d uV (selector 0x%02x)\n", lim_uV, selector);
+
+	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, selector);
+}
+
+static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	const struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	int ret;
+
+	/*
+	 * The LM51772 uses hardcoded OVP thresholds. Update the OVP threshold
+	 * to match the new voltage.
+	 */
+	if (priv->ovp_thres) {
+		ret = regulator_list_voltage_pickable_linear_range(rdev, selector);
+		if (ret < 0)
+			return ret;
+
+		ret = lm51772_set_ov(rdev, ret + priv->ovp_thres);
+		if (ret)
+			return ret;
+	}
+
+	return regulator_set_voltage_sel_pickable_regmap(rdev, selector);
+}
+
+static int lm51772_regulator_set_over_voltage_protection(struct regulator_dev *rdev,
+							  int lim_uV, int severity, bool enable)
+{
+	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	int ret;
+
+	/* OVP cannot be disabled. */
+	if (!enable)
+		return -EOPNOTSUPP;
+
+	/* There is no OVP warning. Error is not applicable. */
+	if (severity != REGULATOR_SEVERITY_PROT)
+		return -EOPNOTSUPP;
+
+	priv->ovp_thres = lim_uV;
+
+	ret = regulator_get_voltage_rdev(rdev);
+	if (ret < 0)
+		return ret;
+
+	return lm51772_set_ov(rdev, ret + priv->ovp_thres);
+}
+
+static int lm51772_regulator_get_current_limit(struct regulator_dev *rdev)
+{
+	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int ilim_reg;
+	int current_uA;
+	int ret;
+
+	if (priv->iset_pin)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(regmap, LM51772_REG_ILIM_THRESHOLD, &ilim_reg);
+	if (ret)
+		return ret;
+
+	ilim_reg = clamp_val(ilim_reg, LM51772_ILIM_THRESHOLD_MIN, LM51772_ILIM_THRESHOLD_MAX);
+
+	current_uA = (ilim_reg * 1000 * LM51772_ILIM_THR_STEP_UV) / priv->sense_res_milliohms;
+
+	dev_dbg(rdev_get_dev(rdev), "current limit: %d uA (ilim_reg 0x%02x, sense_res %d mOhm)\n",
+		current_uA, ilim_reg, priv->sense_res_milliohms);
+
+	return current_uA;
+}
+
+static int lm51772_regulator_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
+{
+	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	u64 voltage_uV = ((u64)priv->sense_res_milliohms * max_uA) / 1000;
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	u8 ilim_reg;
+
+	if (priv->iset_pin)
+		return -EOPNOTSUPP;
+
+	if (voltage_uV < LM51772_ILIM_THR_MIN_UV || voltage_uV > LM51772_ILIM_THR_MAX_UV)
+		return -EINVAL;
+
+	ilim_reg = voltage_uV / LM51772_ILIM_THR_STEP_UV;
+
+	dev_dbg(rdev_get_dev(rdev),
+		"set current limit: %d uA (ilim_reg 0x%02x, sense_res %d mOhm)\n", max_uA, ilim_reg,
+		priv->sense_res_milliohms);
+
+	return regmap_write(regmap, LM51772_REG_ILIM_THRESHOLD, ilim_reg);
+}
+
+static unsigned int lm51772_status2err(unsigned int status_reg)
+{
+	unsigned int errors = 0;
+
+	/*
+	 * The BUSY bit in the status register is not applicable outside device startup.
+	 * Ignore it.
+	 */
+
+	if (status_reg & LM51772_STAT_TEMP)
+		errors |= (status_reg & LM51772_STAT_OFF) ? REGULATOR_ERROR_OVER_TEMP
+						    : REGULATOR_ERROR_OVER_TEMP_WARN;
+
+	if (status_reg & LM51772_STAT_IOUT)
+		errors |= REGULATOR_ERROR_OVER_CURRENT;
+
+	if (status_reg & LM51772_STAT_VOUT)
+		errors |= REGULATOR_ERROR_OVER_VOLTAGE_WARN;
+
+	if (status_reg & LM51772_STAT_CML || status_reg & LM51772_STAT_OTHER)
+		errors |= REGULATOR_ERROR_FAIL;
+
+	if (status_reg & LM51772_STAT_INPUT)
+		errors |= REGULATOR_ERROR_UNDER_VOLTAGE;
+
+	return errors;
+}
+
+static int lm51772_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
+	if (ret)
+		return ret;
+
+	*flags = lm51772_status2err(reg);
+
+	return 0;
+}
+
+static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid,
+			     unsigned long *dev_mask)
+{
+	struct regmap *regmap = rid->data;
+	unsigned int reg, errors;
+	int ret;
+
+	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	errors = lm51772_status2err(reg);
+
+	for (size_t i = 0; i < rid->num_states; i++) {
+		rid->states[i].errors = errors & rid->states[i].possible_errs;
+		rid->states[i].notifs = regulator_err2notif(rid->states[i].errors);
+
+		if (reg & LM51772_STAT_OFF)
+			rid->states[i].notifs |= REGULATOR_EVENT_DISABLE;
+
+		if (rid->states[i].errors || rid->states[i].notifs & REGULATOR_EVENT_DISABLE)
+			*dev_mask |= BIT(i);
+	}
+
+	rid->opaque = reg;
+
+	return 0;
+}
+
+static int lm51772_irq_renable(struct regulator_irq_data *rid)
+{
+	struct regmap *regmap = rid->data;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	if (rid->opaque && rid->opaque == reg) {
+		ret = regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
+		if (ret)
+			return REGULATOR_FAILED_RETRY;
+
+		return REGULATOR_ERROR_ON;
+	}
+
+	rid->opaque = 0;
+
+	return REGULATOR_ERROR_CLEARED;
+}
+
+static int lm51772_vout_of_parse(struct device_node *np,
+				 const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
+{
+	u32 sense_res_milliohms, active_discharge_strength, pcm_window_low;
+	struct lm51772_priv *priv = cfg->driver_data;
+	int ret;
+
+	ret = of_property_read_u32(np, "ti,active-discharge-strength-milliamp",
+				   &active_discharge_strength);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		active_discharge_strength = 0;
+	} else {
+		if (active_discharge_strength < 25 || active_discharge_strength > 75 ||
+		    active_discharge_strength % 25)
+			return -EINVAL;
+
+		active_discharge_strength = active_discharge_strength / 25 - 1;
+	}
+
+	priv->iset_pin = of_property_read_bool(np, "ti,iset-pin");
+
+	ret = of_property_read_u32(np, "ti,pcm-window-low-permille", &pcm_window_low);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		pcm_window_low = LM51772_PCM_WINDOW_LOW_DFLT;
+	} else {
+		if (pcm_window_low % LM51772_PCM_WINDOW_LOW_STEP_PERMILLE)
+			return -EINVAL;
+
+		pcm_window_low /= LM51772_PCM_WINDOW_LOW_STEP_PERMILLE;
+		if (pcm_window_low > LM51772_PCM_WINDOW_LOW_MAX)
+			return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "ti,sense-res-milliohm", &sense_res_milliohms);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		priv->sense_res_milliohms = LM51772_SENSE_RES_DEFAULT_MOHM;
+	} else {
+		if (!sense_res_milliohms)
+			return -EINVAL;
+
+		priv->sense_res_milliohms = sense_res_milliohms;
+	}
+
+	ret = regmap_update_bits(cfg->regmap, LM51772_REG_MFR_SPECIFIC_D2,
+				 LM51772_DISCHARGE_STRENGTH_MASK,
+				 FIELD_PREP(LM51772_DISCHARGE_STRENGTH_MASK,
+					    active_discharge_strength));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(cfg->regmap, LM51772_REG_MFR_SPECIFIC_D9,
+				 LM51772_PCM_WINDOW_LOW_MASK | LM51772_SEL_ISET_PIN,
+				 FIELD_PREP(LM51772_PCM_WINDOW_LOW_MASK, pcm_window_low) |
+				 FIELD_PREP(LM51772_SEL_ISET_PIN, priv->iset_pin));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int lm51772_of_parse(struct lm51772_priv *priv, struct device *dev, struct regmap *regmap)
+{
+	static const char *const sync_pin_modes[] = {
+		"input-rising",
+		"input-falling",
+		"output-rising",
+		"output-falling",
+	};
+	static const struct linear_range ivp_ranges[] = {
+		LINEAR_RANGE(4750000, 0x00, 0x94, 125000),
+		LINEAR_RANGE(23500000, 0x95, 0xff, 250000)
+	};
+	bool ivp, ivr, cable_drop_compensation, found;
+	unsigned int sync_pin, selector, uv;
+	const char *mode;
+	u32 ivp_thres;
+	int ret;
+
+	ivp = device_property_read_bool(dev, "ti,ivp");
+	ivr = device_property_read_bool(dev, "ti,ivr");
+	priv->nint = device_property_read_bool(dev, "ti,nint");
+	cable_drop_compensation =
+		device_property_read_bool(dev, "ti,cable-drop-compensation");
+
+	if (ivr && !ivp) {
+		dev_err(dev, "ti,ivr requires ti,ivp\n");
+		return -EINVAL;
+	}
+
+	ret = device_property_read_string(dev, "ti,sync-pin", &mode);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		sync_pin = 0;
+	} else {
+		ret = match_string(sync_pin_modes, ARRAY_SIZE(sync_pin_modes), mode);
+		if (ret < 0)
+			return -EINVAL;
+
+		sync_pin = ret;
+	}
+
+	ret = device_property_read_u32(dev, "ti,ivp-thres-millivolt", &ivp_thres);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		ivp_thres = LM51772_IVP_VOLTAGE_DFLT;
+	} else {
+		ret = linear_range_get_selector_low_array(
+			ivp_ranges, ARRAY_SIZE(ivp_ranges), ivp_thres * 1000,
+			&selector, &found);
+		if (ret || !found)
+			return -EINVAL;
+
+		ret = linear_range_get_value_array(
+			ivp_ranges, ARRAY_SIZE(ivp_ranges), selector, &uv);
+		if (ret)
+			return -EINVAL;
+
+		if (uv != ivp_thres * 1000)
+			return -EINVAL;
+
+		ivp_thres = selector;
+	}
+
+	ret = regmap_update_bits(
+		regmap, LM51772_REG_MFR_SPECIFIC_D3, LM51772_EN_IVP | LM51772_SEL_IVR,
+		FIELD_PREP(LM51772_EN_IVP, ivp) | FIELD_PREP(LM51772_SEL_IVR, ivr));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D6, LM51772_CONFIG_SYNC_PIN_MASK,
+				 FIELD_PREP(LM51772_CONFIG_SYNC_PIN_MASK, sync_pin));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D8, LM51772_EN_CDC,
+				 FIELD_PREP(LM51772_EN_CDC, cable_drop_compensation));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(regmap, LM51772_REG_IVP_VOLTAGE, ivp_thres);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct regmap_range lm51772_readable_ranges[] = {
+	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
+	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD),
+	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1_MSB),
+	regmap_reg_range(LM51772_REG_PD_STATUS_0, LM51772_REG_PD_STATUS_0),
+	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
+	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTROL_0),
+	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
+};
+
+static const struct regmap_access_table lm51772_readable_table = {
+	.yes_ranges = lm51772_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lm51772_readable_ranges)
+};
+
+static const struct regmap_range lm51772_writeable_ranges[] = {
+	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
+	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
+	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD),
+	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1_MSB),
+	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTROL_0),
+	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
+};
+
+static const struct regmap_access_table lm51772_writeable_table = {
+	.yes_ranges = lm51772_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lm51772_writeable_ranges)
+};
+
+static const struct regmap_range lm51772_volatile_ranges[] = {
+	regmap_reg_range(LM51772_REG_PD_STATUS_0, LM51772_REG_PD_STATUS_0),
+	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE)
+};
+
+static const struct regmap_access_table lm51772_volatile_table = {
+	.yes_ranges = lm51772_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lm51772_volatile_ranges)
+};
+
+static const struct reg_default lm51772_reg_defaults[] = {
+	{ LM51772_REG_CLEAR_FAULTS, 0x00 },	{ LM51772_REG_ILIM_THRESHOLD, 0x64 },
+	{ LM51772_REG_VOUT_TARGET1_LSB, 0x58 }, { LM51772_REG_VOUT_TARGET1_MSB, 0x02 },
+	{ LM51772_REG_STATUS_BYTE, 0x00 },	{ LM51772_REG_USB_PD_CONTROL_0, 0x01 },
+	{ LM51772_REG_MFR_SPECIFIC_D0, 0x32 },	{ LM51772_REG_MFR_SPECIFIC_D1, 0x09 },
+	{ LM51772_REG_MFR_SPECIFIC_D2, 0x40 },	{ LM51772_REG_MFR_SPECIFIC_D3, 0x20 },
+	{ LM51772_REG_MFR_SPECIFIC_D4, 0x03 },	{ LM51772_REG_MFR_SPECIFIC_D5, 0x3F },
+	{ LM51772_REG_MFR_SPECIFIC_D6, 0x15 },	{ LM51772_REG_MFR_SPECIFIC_D7, 0x28 },
+	{ LM51772_REG_MFR_SPECIFIC_D8, 0x84 },	{ LM51772_REG_MFR_SPECIFIC_D9, 0x2C },
+	{ LM51772_REG_IVP_VOLTAGE, 0xFF }
+};
+
+static const struct regmap_config lm51772_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &lm51772_readable_table,
+	.wr_table = &lm51772_writeable_table,
+	.volatile_table = &lm51772_volatile_table,
+	.max_register = LM51772_REG_IVP_VOLTAGE,
+	.reg_defaults = lm51772_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(lm51772_reg_defaults),
+	.cache_type = REGCACHE_MAPLE
+};
+
+static const struct regulator_ops lm51772_reg_ops = {
+	.list_voltage = regulator_list_voltage_pickable_linear_range,
+	.map_voltage = regulator_map_voltage_pickable_linear_range,
+	.get_voltage_sel = regulator_get_voltage_sel_pickable_regmap,
+	.set_voltage_sel = lm51772_regulator_set_voltage_sel,
+	.set_over_voltage_protection = lm51772_regulator_set_over_voltage_protection,
+	.set_thermal_protection = lm51772_regulator_set_thermal_protection,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.get_current_limit = lm51772_regulator_get_current_limit,
+	.set_current_limit = lm51772_regulator_set_current_limit,
+	.get_error_flags = lm51772_get_error_flags,
+	.set_ramp_delay = regulator_set_ramp_delay_regmap,
+	.is_enabled = lm51772_regulator_is_enabled,
+	.enable = lm51772_regulator_enable,
+	.disable = lm51772_regulator_disable
+};
+
+static const struct regulator_ops lm51772_fixed_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap
+};
+
+/*
+ * For < 24V, voltages are set in 10mV monotonous steps.
+ * For >= 24V, voltages are set in 20mV monotonous steps.
+ */
+static const struct linear_range lm51772_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 0, 99, 0),
+	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 100, 2399, LM51772_DIV10_STEP_UV),
+
+	REGULATOR_LINEAR_RANGE(LM51772_DIV20_MIN_UV, 0, 164, 0),
+	REGULATOR_LINEAR_RANGE(LM51772_DIV20_MIN_UV, 165, 2400, LM51772_DIV20_STEP_UV)
+};
+
+static const unsigned int lm51772_voltage_ranges_sel[] = { 0,  0, 1, 1 };
+
+static const unsigned int lm51772_ramp_delays[] = { 40000, 20000, 1000, 500 };
+
+static const struct regulator_desc lm51772_regulator_descs[] = {
+	{
+		.name = "vout",
+		.of_match = of_match_ptr("vout"),
+		.of_parse_cb = lm51772_vout_of_parse,
+		.regulators_node = of_match_ptr("regulators"),
+		.id = 0,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.ops = &lm51772_reg_ops,
+		.linear_ranges = lm51772_voltage_ranges,
+		.linear_range_selectors_bitfield = lm51772_voltage_ranges_sel,
+		.n_linear_ranges = ARRAY_SIZE(lm51772_voltage_ranges),
+		.n_voltages = 100 + 2300 + 165 + 2236,
+		.vsel_reg = LM51772_REG_VOUT_TARGET1_LSB,
+		.vsel_mask = LM51772_VOUT_TARGET1_MASK,
+		.vsel_reg_oversize = true,
+		.vsel_range_reg = LM51772_REG_MFR_SPECIFIC_D8,
+		.vsel_range_mask = LM51772_SEL_FB_DIV20,
+		.active_discharge_reg = LM51772_REG_USB_PD_CONTROL_0,
+		.active_discharge_mask = LM51772_FORCE_DISCH,
+		.active_discharge_on = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 1),
+		.active_discharge_off = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 0),
+		.ramp_reg = LM51772_REG_MFR_SPECIFIC_D2,
+		.ramp_mask = LM51772_DVS_SLEW_RAMP_MASK,
+		.ramp_delay_table = lm51772_ramp_delays,
+		.n_ramp_values = ARRAY_SIZE(lm51772_ramp_delays)
+	},
+	{
+		.name = "vcc1",
+		.of_match = of_match_ptr("vcc1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = 1,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.ops = &lm51772_fixed_ops,
+		.fixed_uV = LM51772_VCC1_LDO_UV,
+		.n_voltages = LM51772_VCC1_LDO_NV,
+		.enable_reg = LM51772_REG_MFR_SPECIFIC_D0,
+		.enable_mask = LM51772_EN_VCC1,
+	},
+};
+
+static int lm51772_setup_irq(struct device *dev, struct regmap *regmap, int irq,
+			     struct regulator_dev *rdev[LM51772_N_REGS], bool nint)
+{
+	int common_errs = REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN |
+			  REGULATOR_ERROR_FAIL | REGULATOR_ERROR_UNDER_VOLTAGE;
+	int per_rdev_errs[] = {
+		REGULATOR_ERROR_OVER_CURRENT | REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+		0,
+	};
+	struct regulator_irq_desc irq_desc = {
+		.name = "lm51772-irq",
+		.data = regmap,
+		.map_event = lm51772_irq_map_event,
+		.renable = lm51772_irq_renable,
+		.irq_off_ms = 1000,
+		.reread_ms = 200,
+	};
+	void *retp;
+
+	retp = devm_regulator_irq_helper(dev, &irq_desc, irq, 0, common_errs, per_rdev_errs, rdev,
+					 LM51772_N_REGS);
+	if (IS_ERR(retp))
+		return PTR_ERR(retp);
+
+	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, LM51772_EN_NINT,
+				  FIELD_PREP(LM51772_EN_NINT, nint));
+}
+
+static int lm51772_probe(struct i2c_client *client)
+{
+	struct regulator_dev *rdev[LM51772_N_REGS];
+	struct regulator_config config = {};
+	struct device *dev = &client->dev;
+	struct lm51772_priv *priv;
+	struct regmap *regmap;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(dev, -ENOMEM, "unable to allocate driver private data\n");
+
+	priv->sense_res_milliohms = LM51772_SENSE_RES_DEFAULT_MOHM;
+
+	ret = devm_regulator_get_enable_optional(dev, "vin");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "unable to get vin regulator\n");
+
+	regmap = devm_regmap_init_i2c(client, &lm51772_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "unable to init regmap\n");
+
+	config.dev = dev;
+	config.driver_data = priv;
+	config.regmap = regmap;
+
+	ret = lm51772_of_parse(priv, dev, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to parse dt node\n");
+
+	for (size_t i = 0; i < LM51772_N_REGS; i++) {
+		rdev[i] = devm_regulator_register(dev, &lm51772_regulator_descs[i], &config);
+		if (IS_ERR(rdev[i]))
+			return dev_err_probe(dev, PTR_ERR(rdev[i]),
+					     "unable to register regulator %s\n",
+					     lm51772_regulator_descs[i].name);
+	}
+
+	ret = lm51772_setup_irq(dev, regmap, client->irq, rdev, priv->nint);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to request irq\n");
+
+	return 0;
+}
+
+static const struct of_device_id lm51772_of_match[] = {
+	{ .compatible = "ti,lm51772" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lm51772_of_match);
+
+static const struct i2c_device_id lm51772_id[] = {
+	{ "lm51772" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, lm51772_id);
+
+static struct i2c_driver lm51772_driver = {
+	.driver = {
+		.name = "lm51772",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = lm51772_of_match,
+	},
+	.probe = lm51772_probe,
+	.id_table = lm51772_id
+};
+
+module_i2c_driver(lm51772_driver);
+
+MODULE_AUTHOR("Paul Louvel <paul.louvel@bootlin.com>");
+MODULE_DESCRIPTION("TI LM51772 I2C regulator driver");
+MODULE_LICENSE("GPL");

-- 
2.56.0


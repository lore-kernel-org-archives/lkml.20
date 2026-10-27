Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094006;
	b=WG0JPaCOppngtm9JvslMDTfZL7StvAzhb+qadmZqnb+JHcq5C06mvLXZtvphzHNioNEB
	 1iSZRFQ62MQ14gvEUJ6OjTpafoBmiwdzxn1oXPeDvhnYjWZeG/yJ9oEK3e8L+7Evv2da7
	 VzJ+lsp5xb3eAkSQUEq7q3UqeFfObh7p9KzRuL1dDqyeC82AWXlZpEoqHXdBv9UBVZvay
	 lQ9YRdlCnqJfc0tbJMet8XJRDZmvvYInJ4SIgOgg2P3ms6VQKFQutkteJ+sCP8eorzX+3
	 hAeIsLLqWXU2VhlIVCLBjOXVSyb3lMlW2pfImDL9bpgPDLZrnkn6d0TpbetOmCuczuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094006;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=Bdi/nEI95TsAhrjyd14rgPY6urPnfIgtVLR695DYWL0=;
	b=fYr9tq7/p/dCWoXt/hpq7ME7LxkS6eMGzOjxIx+UdfwDB7bTMO7p/ygSoRAlBG7Jn0mv
	 wpKssKDrkDDLZVSVTQ1icGqjose59/xa7hs12fvQayEzL2Mf1ikvKA+0AxNv7QnMnWae0
	 xRuXlZXW9OpWDHnYPA1qCJwLCulwpDxn8bfDKr8bZaqoCX/usdNGkksqrPtzvFZxVffCK
	 omBNHxP7UB3L0A0kFBefk26kiLRA+K5LgTukGxfr/QuBe5ffDlMeDd+L5Wre3ICcGqs+D
	 Dy0t+KFgdUclE5vQdkxmTkwgWhV3eiJkT8dTRS9u/Ulto9FlGMWEjxaZOCcUamFpyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wnz3BdxQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04032606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04032606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wnz3BdxQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7A861A12CB
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CFD5603BD;
	Tue, 27 Oct 2026 09:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BF2710329087;
	Tue, 27 Oct 2026 10:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793094002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bdi/nEI95TsAhrjyd14rgPY6urPnfIgtVLR695DYWL0=;
	b=Wnz3BdxQrcCMbG9436nKFbo2kYbAV8JHABVwIDBlj8q74cEAnXuLWzVy6vs63OQfrCD9M2
	3fWDjL1AX0HcPTCSY1PQKfNUVM0i3Zt/0H71C9dsvzJ6pG5byWhlzoKx/SC025IOiZ0q0O
	07kkslB7PVgxeI8X0JDZg3drDxo3zOo5MbLuKtXU1hjChTmrnOR/jRPg5Zaq1UISEfyge/
	2qopReim4WdUE8q6vJrq5kAa1fqx2D7qfy/0aEAgDRJCHIaJbCAU+2u9f7lRbxmMmBQM1o
	IP6bsA84+CgIoQ0fUYV0sibSAIJZm/jjEmF/j6klghTflsHbcNXJxUh6ikOwmg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Tue, 27 Oct 2026 10:39:26 +0100
Subject: [PATCH v2 4/4] regulator: Add TI LM51772 support
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
Message-Id: <20261027-paul-lm51772-v2-4-b2a767e34722@bootlin.com>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
In-Reply-To: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793093986; l=29906;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=FTTCifNy2C5wtq/p6l4nhOhsMAsRmlKxOznHtXlDAdU=;
 b=6c5Anu/kRkaF8at8PwvNSlKoZr4sJJBw74lDpN0JS8SWg1K4+6DQD+vvyr2LdVn9yWSDNJR+0
 Mj03u6elqbdCRGOGb52IrmG0QcCqco4Rk+eWJnRAQkBozHnl9Ixargn
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add driver for the TI LM51772 buck-boost voltage regulator.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |  11 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/lm51772-regulator.c | 850 ++++++++++++++++++++++++++++++++++
 4 files changed, 863 insertions(+)

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
index 000000000000..66f4541b5099
--- /dev/null
+++ b/drivers/regulator/lm51772-regulator.c
@@ -0,0 +1,850 @@
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
+#include <linux/find.h>
+#include <linux/i2c.h>
+#include <linux/linear_range.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/coupler.h>
+#include <linux/regulator/driver.h>
+#include <linux/string.h>
+#include <linux/units.h>
+
+#define LM51772_SENSE_RES_DEFAULT_UOHM		10000
+
+#define LM51772_OVP_DEFAULT			0x3F
+
+#define LM51772_VCC1_LDO_UV			5000000
+#define LM51772_VCC1_LDO_NV			1
+
+#define LM51772_DISCHARGE_STRENGTH_MIN_UA	25000
+#define LM51772_DISCHARGE_STRENGTH_STEP_UA	25000
+#define LM51772_DISCHARGE_STRENGTH_MAX_UA	75000
+
+#define LM51772_ILIM_THR_MIN			0x0A
+#define LM51772_ILIM_THR_MAX			0x8C
+#define LM51772_ILIM_THR_STEP_UV		500
+#define LM51772_ILIM_MIN_UA			500000
+#define LM51772_ILIM_MAX_UA			7000000
+#define LM51772_UA_TO_ILIM_SEL(sns_uOhm, uA) \
+	div_u64((u64)(sns_uOhm) * (uA), MICRO * LM51772_ILIM_THR_STEP_UV)
+#define LM51772_ILIM_SEL_TO_UA(sns_uOhm, sel) \
+	div_u64((u64)(sel) * LM51772_ILIM_THR_STEP_UV * MICRO, (sns_uOhm))
+
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
+/* Register map (datasheet table 8-1) */
+#define LM51772_REG_CLEAR_FAULTS		0x03
+#define LM51772_REG_ILIM_THRESHOLD		0x0A
+#define LM51772_REG_VOUT_TARGET1_LSB		0x0C
+#define LM51772_REG_VOUT_TARGET1_MSB		0x0D
+#define LM51772_REG_USB_PD_STATUS_0		0x21
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
+#define LM51772_STAT_IOUT			BIT(4)
+#define LM51772_STAT_VOUT			BIT(5)
+#define LM51772_STAT_OFF			BIT(6)
+
+/* MFR_SPECIFIC_D0 bits */
+#define LM51772_EN_VCC1				BIT(5)
+#define LM51772_CONV_EN				BIT(0)
+
+/* MFR_SPECIFIC_D1 bits */
+#define LM51772_EN_THER_WARN			BIT(7)
+#define LM51772_THW_THRESHOLD_MASK		GENMASK(6, 5)
+#define LM51772_EN_NINT				BIT(4)
+
+/* MFR_SPECIFIC_D2 bits */
+#define LM51772_DISCHARGE_STRENGTH_MASK		GENMASK(3, 2)
+#define LM51772_DVS_SLEW_RAMP_MASK		GENMASK(5, 4)
+
+/* MFR_SPECIFIC_D3 bits */
+#define LM51772_EN_IVP				BIT(7)
+#define LM51772_SEL_IVR				BIT(6)
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
+
+struct lm51772_priv {
+	bool iset_pin;
+	bool nint;
+	u32 sense_res_micro_ohms;
+};
+
+static const unsigned int lm51772_ramp_delays[] = { 40000, 20000, 1000, 500 };
+
+static int lm51772_regulator_set_thermal_protection(struct regulator_dev *rdev, int lim,
+						    int severity, bool enable)
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
+	ret = regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0, LM51772_CONV_EN2,
+				 FIELD_PREP(LM51772_CONV_EN2, enable));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0, LM51772_CONV_EN,
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
+		LINEAR_RANGE(4000000, 0, 0x18, 500000),
+		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
+	};
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	struct device *dev = rdev_get_dev(rdev);
+	unsigned int sel;
+	bool found;
+	int ret;
+
+	ret = linear_range_get_selector_high_array(ovp_ranges, ARRAY_SIZE(ovp_ranges), lim_uV, &sel,
+						   &found);
+	if (ret || !found)
+		return -EINVAL;
+
+	dev_dbg(dev, "OVP set to selector 0x%02x\n", sel);
+
+	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, sel);
+}
+
+static int lm51772_regulator_set_over_voltage_protection(struct regulator_dev *rdev, int lim_uV,
+							 int severity, bool enable)
+{
+	int ret;
+
+	if (!enable)
+		return -EOPNOTSUPP;
+
+	if (severity != REGULATOR_SEVERITY_PROT)
+		return -EOPNOTSUPP;
+
+	/* Use default OVP threshold when no limit is requested. */
+	if (!lim_uV)
+		return regmap_write(rdev_get_regmap(rdev), LM51772_REG_MFR_SPECIFIC_D5,
+				    LM51772_OVP_DEFAULT);
+
+	ret = regulator_get_voltage_rdev(rdev);
+	if (ret < 0)
+		return ret;
+
+	return lm51772_set_ov(rdev, ret + lim_uV);
+}
+
+static int lm51772_regulator_get_current_limit(struct regulator_dev *rdev)
+{
+	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int sel, current_uA;
+	int ret;
+
+	if (priv->iset_pin)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(regmap, LM51772_REG_ILIM_THRESHOLD, &sel);
+	if (ret)
+		return ret;
+
+	sel = clamp_val(sel, LM51772_ILIM_THR_MIN, LM51772_ILIM_THR_MAX);
+
+	current_uA = LM51772_ILIM_SEL_TO_UA(priv->sense_res_micro_ohms, sel);
+
+	dev_dbg(rdev_get_dev(rdev), "current limit: %d uA (ilim_reg 0x%02x, sense_res %d mOhm)\n",
+		current_uA, sel, priv->sense_res_micro_ohms);
+
+	return current_uA;
+}
+
+static int lm51772_regulator_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
+{
+	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int current_uA;
+	unsigned int sel;
+
+	if (priv->iset_pin)
+		return -EOPNOTSUPP;
+
+	if (min_uA > LM51772_ILIM_MAX_UA || max_uA < LM51772_ILIM_MIN_UA)
+		return -EINVAL;
+
+	if (max_uA > LM51772_ILIM_MAX_UA)
+		max_uA = LM51772_ILIM_MAX_UA;
+
+	sel = LM51772_UA_TO_ILIM_SEL(priv->sense_res_micro_ohms, max_uA);
+	sel = clamp_val(sel, LM51772_ILIM_THR_MIN, LM51772_ILIM_THR_MAX);
+
+	/* Check if the selected value is still within the allowed range after computation. */
+	current_uA = LM51772_ILIM_SEL_TO_UA(priv->sense_res_micro_ohms, sel);
+	if (current_uA < min_uA)
+		return -EINVAL;
+
+	dev_dbg(rdev_get_dev(rdev), "set current limit: %d uA (sel 0x%02x, sense_res %d mOhm)\n",
+		current_uA, sel, priv->sense_res_micro_ohms);
+
+	return regmap_write(regmap, LM51772_REG_ILIM_THRESHOLD, sel);
+}
+
+static unsigned int lm51772_status2err(unsigned int status_reg)
+{
+	unsigned int errors = 0;
+
+	/*
+	 * The BUSY bit (bit 7) is only meaningful during device startup.
+	 * The INPUT bit (bit 3) reports a VIN_UV condition, which is not a
+	 * regulator output error. Ignore both.
+	 */
+
+	if (status_reg & LM51772_STAT_TEMP)
+		errors |= (status_reg & LM51772_STAT_OFF) ? REGULATOR_ERROR_OVER_TEMP :
+							    REGULATOR_ERROR_OVER_TEMP_WARN;
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
+static int lm51772_regulator_set_voltage_time(struct regulator_dev *rdev, int old_uV, int new_uV)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int reg, slew_rate_uv_per_us, sel;
+	struct device *dev = rdev_get_dev(rdev);
+	int ret, delay_us;
+
+	ret = regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D2, &reg);
+	if (ret)
+		return ret;
+
+	sel = FIELD_GET(LM51772_DVS_SLEW_RAMP_MASK, reg);
+	slew_rate_uv_per_us = lm51772_ramp_delays[sel];
+
+	delay_us = DIV_ROUND_UP(abs(new_uV - old_uV), slew_rate_uv_per_us);
+
+	dev_dbg(dev, "voltage change from %d uV to %d uV, slew rate %d uV/us, delay %d us\n",
+		old_uV, new_uV, slew_rate_uv_per_us, delay_us);
+
+	return delay_us;
+}
+
+static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid, unsigned long *dev_mask)
+{
+	struct regmap *regmap = rid->data;
+	unsigned int status, reg, errors;
+	bool dev_off;
+	size_t bit;
+	int ret;
+
+	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &status);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	errors = lm51772_status2err(status);
+	rid->opaque = status;
+
+	dev_off = (status & LM51772_STAT_OFF) != 0;
+
+	ret = regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	for (size_t i = 0; i < rid->num_states; i++) {
+		rid->states[i].errors = errors & rid->states[i].possible_errs;
+		rid->states[i].notifs = 0;
+
+		for_each_set_bit(bit, &rid->states[i].errors, BITS_PER_TYPE(rid->states[i].errors))
+			rid->states[i].notifs |= regulator_err2notif(BIT(bit));
+
+		if (dev_off)
+			rid->states[i].notifs |= REGULATOR_EVENT_DISABLE;
+
+		if (rid->states[i].errors || dev_off)
+			*dev_mask |= BIT(i);
+	}
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
+static int lm51772_vout_of_parse(struct device_node *np, const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
+{
+	u32 sense_res_micro_ohms, active_discharge_strength, pcm_window_low;
+	struct lm51772_priv *priv = cfg->driver_data;
+	int ret;
+
+	ret = of_property_read_u32(np, "ti,active-discharge-strength-microamp",
+				   &active_discharge_strength);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		active_discharge_strength = 0;
+	} else {
+		if (active_discharge_strength < LM51772_DISCHARGE_STRENGTH_MIN_UA ||
+		    active_discharge_strength > LM51772_DISCHARGE_STRENGTH_MAX_UA ||
+		    active_discharge_strength % LM51772_DISCHARGE_STRENGTH_STEP_UA)
+			return -EINVAL;
+
+		active_discharge_strength =
+			active_discharge_strength / LM51772_DISCHARGE_STRENGTH_STEP_UA - 1;
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
+	ret = of_property_read_u32(np, "shunt-resistor-micro-ohms", &sense_res_micro_ohms);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret != -EINVAL) {
+		if (!sense_res_micro_ohms)
+			return -EINVAL;
+
+		priv->sense_res_micro_ohms = sense_res_micro_ohms;
+	}
+
+	ret = regmap_update_bits(
+		cfg->regmap, LM51772_REG_MFR_SPECIFIC_D2, LM51772_DISCHARGE_STRENGTH_MASK,
+		FIELD_PREP(LM51772_DISCHARGE_STRENGTH_MASK, active_discharge_strength));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(cfg->regmap, LM51772_REG_MFR_SPECIFIC_D9,
+				 LM51772_PCM_WINDOW_LOW_MASK | LM51772_SEL_ISET_PIN,
+				 FIELD_PREP(LM51772_PCM_WINDOW_LOW_MASK, pcm_window_low) |
+					 FIELD_PREP(LM51772_SEL_ISET_PIN, priv->iset_pin));
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
+	cable_drop_compensation = device_property_read_bool(dev, "ti,cable-drop-compensation");
+
+	if (ivr && !ivp)
+		return -EINVAL;
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
+	ret = device_property_read_u32(dev, "ti,ivp-thres-microvolt", &ivp_thres);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	if (ret == -EINVAL) {
+		ivp_thres = LM51772_IVP_VOLTAGE_DFLT;
+	} else {
+		ret = linear_range_get_selector_low_array(
+			ivp_ranges, ARRAY_SIZE(ivp_ranges), ivp_thres,
+			&selector, &found);
+		if (ret || !found)
+			return -EINVAL;
+
+		ret = linear_range_get_value_array(
+			ivp_ranges, ARRAY_SIZE(ivp_ranges), selector, &uv);
+		if (ret)
+			return -EINVAL;
+
+		if (uv != ivp_thres)
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
+	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS_0),
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
+	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS_0),
+	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
+	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS)
+};
+
+static const struct regmap_access_table lm51772_volatile_table = {
+	.yes_ranges = lm51772_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lm51772_volatile_ranges)
+};
+
+static const struct reg_default lm51772_reg_defaults[] = {
+	{ .reg = LM51772_REG_CLEAR_FAULTS, .def = 0x00 },
+	{ .reg = LM51772_REG_ILIM_THRESHOLD, .def = 0x64 },
+	{ .reg = LM51772_REG_VOUT_TARGET1_LSB, .def = 0x58 },
+	{ .reg = LM51772_REG_VOUT_TARGET1_MSB, .def = 0x02 },
+	{ .reg = LM51772_REG_STATUS_BYTE, .def = 0x00 },
+	{ .reg = LM51772_REG_USB_PD_CONTROL_0, .def = 0x01 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D0, .def = 0x32 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D1, .def = 0x09 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D2, .def = 0x40 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D3, .def = 0x20 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D4, .def = 0x03 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D5, .def = 0x3F },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D6, .def = 0x15 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D7, .def = 0x28 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D8, .def = 0x84 },
+	{ .reg = LM51772_REG_MFR_SPECIFIC_D9, .def = 0x2C },
+	{ .reg = LM51772_REG_IVP_VOLTAGE, .def = 0xFF }
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
+	.set_voltage_sel = regulator_set_voltage_sel_pickable_regmap,
+	.set_over_voltage_protection = lm51772_regulator_set_over_voltage_protection,
+	.set_thermal_protection = lm51772_regulator_set_thermal_protection,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.get_current_limit = lm51772_regulator_get_current_limit,
+	.set_current_limit = lm51772_regulator_set_current_limit,
+	.get_error_flags = lm51772_get_error_flags,
+	.set_ramp_delay = regulator_set_ramp_delay_regmap,
+	.set_voltage_time = lm51772_regulator_set_voltage_time,
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
+static const struct regulator_desc lm51772_regulator_descs[] = {
+	{ .name = "vout",
+	  .of_match = of_match_ptr("vout"),
+	  .of_parse_cb = lm51772_vout_of_parse,
+	  .regulators_node = of_match_ptr("regulators"),
+	  .id = 0,
+	  .type = REGULATOR_VOLTAGE,
+	  .owner = THIS_MODULE,
+	  .ops = &lm51772_reg_ops,
+	  .linear_ranges = lm51772_voltage_ranges,
+	  .linear_range_selectors_bitfield = lm51772_voltage_ranges_sel,
+	  .n_linear_ranges = ARRAY_SIZE(lm51772_voltage_ranges),
+	  .n_voltages = 100 + 2300 + 165 + 2236,
+	  .vsel_reg = LM51772_REG_VOUT_TARGET1_LSB,
+	  .vsel_mask = LM51772_VOUT_TARGET1_MASK,
+	  .vsel_reg_oversize = true,
+	  .fixed_ovp = true,
+	  .vsel_range_reg = LM51772_REG_MFR_SPECIFIC_D8,
+	  .vsel_range_mask = LM51772_SEL_FB_DIV20,
+	  .active_discharge_reg = LM51772_REG_USB_PD_CONTROL_0,
+	  .active_discharge_mask = LM51772_FORCE_DISCH,
+	  .active_discharge_on = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 1),
+	  .active_discharge_off = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 0),
+	  .ramp_reg = LM51772_REG_MFR_SPECIFIC_D2,
+	  .ramp_mask = LM51772_DVS_SLEW_RAMP_MASK,
+	  .ramp_delay_table = lm51772_ramp_delays,
+	  .n_ramp_values = ARRAY_SIZE(lm51772_ramp_delays) },
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
+			  REGULATOR_ERROR_FAIL;
+	int per_rdev_errs[] = {
+		REGULATOR_ERROR_OVER_CURRENT | REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+		0,
+	};
+	struct regulator_irq_desc irq_desc = {
+		.name = "lm51772-irq",
+		.data = regmap,
+		.map_event = lm51772_irq_map_event,
+	};
+	void *retp;
+
+	if (!nint) {
+		irq_desc.renable = lm51772_irq_renable;
+		irq_desc.irq_off_ms = 1000;
+		irq_desc.reread_ms = 200;
+	}
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
+		return -ENOMEM;
+
+	priv->sense_res_micro_ohms = LM51772_SENSE_RES_DEFAULT_UOHM;
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
+	{ .name = "lm51772" },
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
+	.id_table = lm51772_id,
+};
+
+module_i2c_driver(lm51772_driver);
+
+MODULE_AUTHOR("Paul Louvel <paul.louvel@bootlin.com>");
+MODULE_DESCRIPTION("TI LM51772 I2C regulator driver");
+MODULE_LICENSE("GPL");

-- 
2.56.0


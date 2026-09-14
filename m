Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9904A3D33
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420294; cv=none; b=fpo4Wfl3h+EBN1PnpAqhlRwHzpH3xOOnHu1EM0J88pyVKOH73OcvDK740eMToQDHATsDDQp0BPp6mfFRqNCGbT7K7tIBfmV+9ED0eU8rWSCXkXNkNHjwax+8pENPvlM08pGx0cWjGiFDzaBlciRZQ6QdhRz/7JIzF2AVm/C4KMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420294; c=relaxed/simple;
	bh=MT8sDGgmi+VnXl2CGP2Enoev1en9znyBtD06gddifuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BF45+ZbujaxCpp/aytSxhJHqwgtqJ2Gx1RtwSc3/12sLSK6zf2SIc0nRG1wNpcP/hktO4HhF42rqUryrZcFI2oL33/98NEXLIzX9LisRmz+HKW1cS0e1APF1DsLulEhjBeJWXjNJsj36/I2x3WMA6hcNq5w4YqwxA0BhQ/hRIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq55Kofl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq55Kofl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ACA1F00893;
	Mon, 14 Sep 2026 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420292;
	bh=JllXSUHy+b3zdtDBvkgrDgyujMMYgJPstjjx5MbnyKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xq55KoflHzkIH9n+kai8ahZwNeA5gJkRu9PxA4hK5GhxkxxWbxWDNhYtzSkOzkFyL
	 uXTp0q9eG1AtbBCXOJxQulrAmE6Dxn/vT668Cj365fWHjTET7bg8oxHqyzZTgxk9Rr
	 jdYnt2bd0lq5WKlOeJ1LRuD72DR90MM5XbuJBSJryKxdVTx4zlAri4ZXHj4ODCvOFB
	 tCDLfrF3hTZQvTsKakMGpN47Z2pC2/Ha8qWU2REngYVPWIeswk4mU1qvPywHEGQBW+
	 qWoe8W0Utq/XGASjhRzyTp7pB3KRUW/SEMzjCALPVUIFHDhOTNBUNeC2p8GMo3xd99
	 Ft/oyCsS+aZSA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:21 +0200
Subject: [PATCH v4 08/10] regulator: ab8500: Add buck converter support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-8-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Register the SMPS1, SMPS2, SMPS3, ARM, APE and MOD buck converters on
AB8500 and the VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM buck
converters on AB8505 so that the new device tree nodes can supply
consumers. Match each variant through its own device tree node names.

AB8500 SMPS3 supplies Vsafe and AB8505 VSAFE occupies the corresponding
control and selector registers at 0x0405 and 0x041b through 0x041d.
AB8500 VAPE and AB8505 VSMPSC instead use 0x0402 and the 0x040e through
0x0410 selector registers. Keep separate AB8505 regulator descriptors
and identifiers so these variant-specific rails are not conflated.

Describe the hardware selector ranges and follow the selector-control
registers when reading or changing voltage. This accounts for AB8505
using Sel2 after reset, its additional selector registers and its
separate 7-bit VARM range. Use the AB8500-compatible and low-range OTP
profiles found on the supported platforms for the other rails.

SMPS1 through SMPS3 and VSMPSA, VSMPSB and VSAFE also expose enable and
low-power mode control. Keep the ARM, APE, MOD, VARM, VSMPSC and VSMPSM
rails voltage-only since their on/off state is managed with the SoC.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 461 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 452 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index d1540099104c..130febf2680a 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -9,10 +9,12 @@
  * AB8500 peripheral regulators
  *
  * AB8500 supports the following regulators:
- *   VAUX1/2/3, VINTCORE, VTVOUT, VUSB, VAUDIO, VAMIC1/2, VDMIC, VANA
+ *   VSMPS1/2/3, VARM, VAPE, VMOD, VAUX1/2/3, VINTCORE, VTVOUT,
+ *   VUSB, VAUDIO, VAMIC1/2, VDMIC, VANA
  *
  * AB8505 supports the following regulators:
- *   VAUX1/2/3/4/5/6, VINTCORE, VADC, VUSB, VAUDIO, VAMIC1/2, VDMIC, VANA
+ *   VSMPSA/B/C/M, VSAFE, VARM, VAUX1/2/3/4/5/6, VINTCORE,
+ *   VADC, VUSB, VAUDIO, VAMIC1/2, VDMIC, VANA
  */
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -39,6 +41,12 @@ enum ab8500_regulator_id {
 	AB8500_LDO_ANAMIC2,
 	AB8500_LDO_DMIC,
 	AB8500_LDO_ANA,
+	AB8500_BUCK_SMPS1,
+	AB8500_BUCK_SMPS2,
+	AB8500_BUCK_SMPS3,
+	AB8500_BUCK_ARM,
+	AB8500_BUCK_APE,
+	AB8500_BUCK_MOD,
 	AB8500_NUM_REGULATORS,
 };
 
@@ -57,6 +65,12 @@ enum ab8505_regulator_id {
 	AB8505_LDO_ANAMIC2,
 	AB8505_LDO_AUX8,
 	AB8505_LDO_ANA,
+	AB8505_BUCK_SMPSA,
+	AB8505_BUCK_SMPSB,
+	AB8505_BUCK_SAFE,
+	AB8505_BUCK_ARM,
+	AB8505_BUCK_SMPSC,
+	AB8505_BUCK_SMPSM,
 	AB8505_NUM_REGULATORS,
 };
 
@@ -172,9 +186,17 @@ struct ab8500_shared_mode {
  * @mode_val_idle: mode setting for low power
  * @mode_val_normal: mode setting for normal power
  * @voltage_bank: bank to control regulator voltage
- * @voltage_reg: register to control regulator voltage
+ * @voltage_reg: first register containing a selectable regulator voltage
  * @voltage_mask: mask to control regulator voltage
  * @expand_register: additional register used to select an extra voltage
+ * @voltage_ctrl_bank: bank containing the voltage selector control
+ * @voltage_ctrl_reg: register containing the voltage selector control
+ * @voltage_ctrl_mask: mask selecting one of the first voltage registers
+ * @voltage_ext_ctrl_bank: bank containing the extended selector control
+ * @voltage_ext_ctrl_reg: register containing the extended selector control
+ * @voltage_ext_ctrl_mask: mask selecting one of the extended voltage registers
+ * @voltage_ext_reg: first extended voltage register
+ * @voltage_ext_regs: number of extended voltage registers
  */
 struct ab8500_regulator_info {
 	struct device		*dev;
@@ -202,6 +224,14 @@ struct ab8500_regulator_info {
 		u8 voltage_reg;
 		u8 voltage_mask;
 	} expand_register;
+	u8 voltage_ctrl_bank;
+	u8 voltage_ctrl_reg;
+	u8 voltage_ctrl_mask;
+	u8 voltage_ext_ctrl_bank;
+	u8 voltage_ext_ctrl_reg;
+	u8 voltage_ext_ctrl_mask;
+	u8 voltage_ext_reg;
+	u8 voltage_ext_regs;
 };
 
 /* voltage tables for the vauxn/vintcore supplies */
@@ -300,6 +330,40 @@ static const struct linear_range ldo_vaudio_ranges[] = {
 	REGULATOR_LINEAR_RANGE(2600000, 7, 7, 0),
 };
 
+/*
+ * AB8505 buck ranges except VARM are selected by OTP.  The supported
+ * platforms use the AB8500-compatible profiles for VSMPSA/B and the low
+ * profiles for VSAFE, VSMPSC and VSMPSM.
+ */
+static const struct linear_range buck_low_voltages[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 53, 12500),
+	REGULATOR_LINEAR_RANGE(1362500, 54, 63, 0),
+};
+
+/* VSMPS3 and VSAFE have a 7-bit selector, but the same low range. */
+static const struct linear_range buck_low_7bit_voltages[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 53, 12500),
+	REGULATOR_LINEAR_RANGE(1362500, 54, 127, 0),
+};
+
+/* AB8505 VARM uses a separate 0.6 V to 1.39375 V selector range. */
+static const struct linear_range ab8505_buck_arm_voltages[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 127, 6250),
+};
+
+/* VSMPS1 and the VSMPSA AB8500-compatible profile clamp to this range. */
+static const struct linear_range buck_smps1_voltages[] = {
+	REGULATOR_LINEAR_RANGE(1100000, 0, 32, 0),
+	REGULATOR_LINEAR_RANGE(1112500, 33, 48, 12500),
+	REGULATOR_LINEAR_RANGE(1300000, 49, 63, 0),
+};
+
+/* VSMPS2 and the VSMPSB AB8500-compatible profile clamp to this range. */
+static const struct linear_range buck_smps2_voltages[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0, 57, 0),
+	REGULATOR_LINEAR_RANGE(1812500, 58, 63, 12500),
+};
+
 static DEFINE_MUTEX(shared_mode_mutex);
 static struct ab8500_shared_mode ldo_anamic1_shared;
 static struct ab8500_shared_mode ldo_anamic2_shared;
@@ -558,11 +622,67 @@ static unsigned int ab8500_regulator_get_mode(struct regulator_dev *rdev)
 	return ret;
 }
 
+static int ab8500_regulator_get_voltage_reg(struct regulator_dev *rdev,
+					    u8 *voltage_reg)
+{
+	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 regval;
+	unsigned int selector;
+	int ret;
+
+	if (info->voltage_ext_ctrl_mask) {
+		ret = abx500_get_register_interruptible(info->dev,
+							info->voltage_ext_ctrl_bank,
+							info->voltage_ext_ctrl_reg, &regval);
+		if (ret < 0)
+			return ret;
+
+		selector = (regval & info->voltage_ext_ctrl_mask) >>
+			(ffs(info->voltage_ext_ctrl_mask) - 1);
+		if (selector) {
+			selector = min_t(unsigned int, selector,
+					 info->voltage_ext_regs);
+			*voltage_reg = info->voltage_ext_reg + selector - 1;
+			return 0;
+		}
+	}
+
+	if (!info->voltage_ctrl_mask) {
+		*voltage_reg = info->voltage_reg;
+		return 0;
+	}
+
+	ret = abx500_get_register_interruptible(info->dev,
+						info->voltage_ctrl_bank,
+						info->voltage_ctrl_reg, &regval);
+	if (ret < 0)
+		return ret;
+
+	/* The three hardware selector layouts all use consecutive registers. */
+	switch (info->voltage_ctrl_mask) {
+	case 0x0c:
+		selector = min((unsigned int)((regval & 0x0c) >> 2), 2U);
+		break;
+	case 0x24:
+		selector = regval & BIT(5) ? 2 : !!(regval & BIT(2));
+		break;
+	case 0x04:
+		selector = !!(regval & BIT(2));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*voltage_reg = info->voltage_reg + selector;
+
+	return 0;
+}
+
 static int ab8500_regulator_get_voltage_sel(struct regulator_dev *rdev)
 {
 	int ret, voltage_shift;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
-	u8 regval;
+	u8 regval, voltage_reg;
 
 	if (info == NULL) {
 		dev_err(rdev_get_dev(rdev), "regulator info null pointer\n");
@@ -571,8 +691,15 @@ static int ab8500_regulator_get_voltage_sel(struct regulator_dev *rdev)
 
 	voltage_shift = ffs(info->voltage_mask) - 1;
 
+	ret = ab8500_regulator_get_voltage_reg(rdev, &voltage_reg);
+	if (ret < 0) {
+		dev_err(rdev_get_dev(rdev),
+			"couldn't read voltage selector control\n");
+		return ret;
+	}
+
 	ret = abx500_get_register_interruptible(info->dev,
-			info->voltage_bank, info->voltage_reg, &regval);
+			info->voltage_bank, voltage_reg, &regval);
 	if (ret < 0) {
 		dev_err(rdev_get_dev(rdev),
 			"couldn't read voltage reg for regulator\n");
@@ -583,7 +710,7 @@ static int ab8500_regulator_get_voltage_sel(struct regulator_dev *rdev)
 		"%s-get_voltage (bank, reg, mask, shift, value): "
 		"0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
 		info->desc.name, info->voltage_bank,
-		info->voltage_reg, info->voltage_mask,
+		voltage_reg, info->voltage_mask,
 		voltage_shift, regval);
 
 	return (regval & info->voltage_mask) >> voltage_shift;
@@ -594,7 +721,7 @@ static int ab8500_regulator_set_voltage_sel(struct regulator_dev *rdev,
 {
 	int ret, voltage_shift;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
-	u8 regval;
+	u8 regval, voltage_reg;
 
 	if (info == NULL) {
 		dev_err(rdev_get_dev(rdev), "regulator info null pointer\n");
@@ -603,10 +730,17 @@ static int ab8500_regulator_set_voltage_sel(struct regulator_dev *rdev,
 
 	voltage_shift = ffs(info->voltage_mask) - 1;
 
+	ret = ab8500_regulator_get_voltage_reg(rdev, &voltage_reg);
+	if (ret < 0) {
+		dev_err(rdev_get_dev(rdev),
+			"couldn't read voltage selector control\n");
+		return ret;
+	}
+
 	/* set the registers for the request */
 	regval = (u8)selector << voltage_shift;
 	ret = abx500_mask_and_set_register_interruptible(info->dev,
-			info->voltage_bank, info->voltage_reg,
+			info->voltage_bank, voltage_reg,
 			info->voltage_mask, regval);
 	if (ret < 0)
 		dev_err(rdev_get_dev(rdev),
@@ -615,7 +749,7 @@ static int ab8500_regulator_set_voltage_sel(struct regulator_dev *rdev,
 	dev_vdbg(rdev_get_dev(rdev),
 		"%s-set_voltage (bank, reg, mask, value): 0x%x, 0x%x, 0x%x,"
 		" 0x%x\n",
-		info->desc.name, info->voltage_bank, info->voltage_reg,
+		info->desc.name, info->voltage_bank, voltage_reg,
 		info->voltage_mask, regval);
 
 	return ret;
@@ -726,6 +860,26 @@ static const struct regulator_ops ab8500_regulator_linear_range_volt_ops = {
 	.map_voltage	= regulator_map_voltage_linear_range,
 };
 
+static const struct regulator_ops ab8500_buck_ops = {
+	.enable			= ab8500_regulator_enable,
+	.disable		= ab8500_regulator_disable,
+	.is_enabled		= ab8500_regulator_is_enabled,
+	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
+	.set_mode		= ab8500_regulator_set_mode,
+	.get_mode		= ab8500_regulator_get_mode,
+	.get_voltage_sel	= ab8500_regulator_get_voltage_sel,
+	.set_voltage_sel	= ab8500_regulator_set_voltage_sel,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_ops ab8500_buck_voltage_ops = {
+	.get_voltage_sel	= ab8500_regulator_get_voltage_sel,
+	.set_voltage_sel	= ab8500_regulator_set_voltage_sel,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
 static const struct regulator_ops ab8500_regulator_mode_ops = {
 	.enable			= ab8500_regulator_enable,
 	.disable		= ab8500_regulator_disable,
@@ -967,6 +1121,137 @@ static struct ab8500_regulator_info
 		.update_val_idle	= 0x0c,
 		.update_val_normal	= 0x04,
 	},
+
+	/* Buck converters */
+	[AB8500_BUCK_SMPS1] = {
+		.desc = {
+			.name		= "BUCK-SMPS1",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_SMPS1,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_smps1_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_smps1_voltages),
+		},
+		.load_lp_uA		= 20000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x03,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x13,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x03,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8500_BUCK_SMPS2] = {
+		.desc = {
+			.name		= "BUCK-SMPS2",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_SMPS2,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_smps2_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_smps2_voltages),
+		},
+		.load_lp_uA		= 20000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x04,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x17,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x04,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8500_BUCK_SMPS3] = {
+		.desc = {
+			.name		= "BUCK-SMPS3",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_SMPS3,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 128,
+			.linear_ranges	= buck_low_7bit_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_7bit_voltages),
+		},
+		.load_lp_uA		= 50000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x05,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x1b,
+		.voltage_mask		= 0x7f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x05,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8500_BUCK_ARM] = {
+		.desc = {
+			.name		= "BUCK-ARM",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_ARM,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_low_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x0b,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x00,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8500_BUCK_APE] = {
+		.desc = {
+			.name		= "BUCK-APE",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_APE,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_low_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x0e,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x02,
+		.voltage_ctrl_mask	= 0x24,
+	},
+	[AB8500_BUCK_MOD] = {
+		.desc = {
+			.name		= "BUCK-MOD",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8500_BUCK_MOD,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_low_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x41,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x40,
+		.voltage_ctrl_mask	= 0x04,
+	},
 };
 
 /* AB8505 regulator information */
@@ -1265,6 +1550,152 @@ static struct ab8500_regulator_info
 		.voltage_reg		= 0x29,
 		.voltage_mask		= 0x7,
 	},
+
+	/* Buck converters */
+	[AB8505_BUCK_SMPSA] = {
+		.desc = {
+			.name		= "BUCK-SMPSA",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_SMPSA,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_smps1_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_smps1_voltages),
+		},
+		.load_lp_uA		= 20000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x03,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x13,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x03,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8505_BUCK_SMPSB] = {
+		.desc = {
+			.name		= "BUCK-SMPSB",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_SMPSB,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_smps2_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_smps2_voltages),
+		},
+		.load_lp_uA		= 20000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x04,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x17,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x04,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8505_BUCK_SAFE] = {
+		.desc = {
+			.name		= "BUCK-SAFE",
+			.ops		= &ab8500_buck_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_SAFE,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 128,
+			.linear_ranges	= buck_low_7bit_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_7bit_voltages),
+		},
+		.load_lp_uA		= 50000,
+		.update_bank		= 0x04,
+		.update_reg		= 0x05,
+		.update_mask		= 0x03,
+		.update_val		= 0x01,
+		.update_val_idle	= 0x03,
+		.update_val_normal	= 0x01,
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x1b,
+		.voltage_mask		= 0x7f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x05,
+		.voltage_ctrl_mask	= 0x0c,
+	},
+	[AB8505_BUCK_ARM] = {
+		.desc = {
+			.name		= "BUCK-ARM",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_ARM,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 128,
+			.linear_ranges	= ab8505_buck_arm_voltages,
+			.n_linear_ranges = ARRAY_SIZE(ab8505_buck_arm_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x0b,
+		.voltage_mask		= 0x7f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x00,
+		.voltage_ctrl_mask	= 0x0c,
+		.voltage_ext_ctrl_bank = 0x04,
+		.voltage_ext_ctrl_reg	= 0x28,
+		.voltage_ext_ctrl_mask = 0x07,
+		.voltage_ext_reg	= 0x24,
+		.voltage_ext_regs	= 4,
+	},
+	[AB8505_BUCK_SMPSC] = {
+		.desc = {
+			.name		= "BUCK-SMPSC",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_SMPSC,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_low_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x0e,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x02,
+		.voltage_ctrl_mask	= 0x24,
+		.voltage_ext_ctrl_bank = 0x04,
+		.voltage_ext_ctrl_reg	= 0x2a,
+		.voltage_ext_ctrl_mask = 0x03,
+		.voltage_ext_reg	= 0x2b,
+		.voltage_ext_regs	= 2,
+	},
+	[AB8505_BUCK_SMPSM] = {
+		.desc = {
+			.name		= "BUCK-SMPSM",
+			.ops		= &ab8500_buck_voltage_ops,
+			.type		= REGULATOR_VOLTAGE,
+			.id		= AB8505_BUCK_SMPSM,
+			.owner		= THIS_MODULE,
+			.n_voltages	= 64,
+			.linear_ranges	= buck_low_voltages,
+			.n_linear_ranges = ARRAY_SIZE(buck_low_voltages),
+		},
+		.voltage_bank		= 0x04,
+		.voltage_reg		= 0x41,
+		.voltage_mask		= 0x3f,
+		.voltage_ctrl_bank	= 0x04,
+		.voltage_ctrl_reg	= 0x40,
+		.voltage_ctrl_mask	= 0x04,
+		.voltage_ext_ctrl_bank = 0x04,
+		.voltage_ext_ctrl_reg	= 0x47,
+		.voltage_ext_ctrl_mask = 0x03,
+		.voltage_ext_reg	= 0x45,
+		.voltage_ext_regs	= 2,
+	},
 };
 
 static struct ab8500_shared_mode ldo_anamic1_shared = {
@@ -1740,6 +2171,12 @@ static struct of_regulator_match ab8500_regulator_match[] = {
 	{ .name	= "ab8500_ldo_anamic2", .driver_data = (void *) AB8500_LDO_ANAMIC2, },
 	{ .name	= "ab8500_ldo_dmic",    .driver_data = (void *) AB8500_LDO_DMIC, },
 	{ .name	= "ab8500_ldo_ana",     .driver_data = (void *) AB8500_LDO_ANA, },
+	{ .name = "ab8500_buck_smps1",  .driver_data = (void *)AB8500_BUCK_SMPS1, },
+	{ .name = "ab8500_buck_smps2",  .driver_data = (void *)AB8500_BUCK_SMPS2, },
+	{ .name = "ab8500_buck_smps3",  .driver_data = (void *)AB8500_BUCK_SMPS3, },
+	{ .name = "ab8500_buck_arm",    .driver_data = (void *)AB8500_BUCK_ARM, },
+	{ .name = "ab8500_buck_ape",    .driver_data = (void *)AB8500_BUCK_APE, },
+	{ .name = "ab8500_buck_mod",    .driver_data = (void *)AB8500_BUCK_MOD, },
 };
 
 static struct of_regulator_match ab8505_regulator_match[] = {
@@ -1756,6 +2193,12 @@ static struct of_regulator_match ab8505_regulator_match[] = {
 	{ .name	= "ab8500_ldo_anamic2", .driver_data = (void *) AB8505_LDO_ANAMIC2, },
 	{ .name	= "ab8500_ldo_aux8",    .driver_data = (void *) AB8505_LDO_AUX8, },
 	{ .name	= "ab8500_ldo_ana",     .driver_data = (void *) AB8505_LDO_ANA, },
+	{ .name = "ab8505_buck_smpsa",  .driver_data = (void *)AB8505_BUCK_SMPSA, },
+	{ .name = "ab8505_buck_smpsb",  .driver_data = (void *)AB8505_BUCK_SMPSB, },
+	{ .name = "ab8505_buck_safe",   .driver_data = (void *)AB8505_BUCK_SAFE, },
+	{ .name = "ab8505_buck_arm",    .driver_data = (void *)AB8505_BUCK_ARM, },
+	{ .name = "ab8505_buck_smpsc",  .driver_data = (void *)AB8505_BUCK_SMPSC, },
+	{ .name = "ab8505_buck_smpsm",  .driver_data = (void *)AB8505_BUCK_SMPSM, },
 };
 
 static struct {

-- 
2.55.0


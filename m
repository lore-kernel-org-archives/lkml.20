Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09873E3D85;
	Thu,  3 Sep 2026 06:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416490; cv=none; b=ieNruauF1v6FtpDwtuTgQzScpW5zOEEKwgA/hUF5a2QlMzeljSYXqXzntpw+CAVZtNHRG2bHoeKRkbtN2FQQRCcfIuzjbZYcccui3RkI7DmDbAqVthMxfb4Wonm0y+EUMEHOiVh3czdN+HR/8ZvfY5eJY8ce8Wkt3SefpNjVmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416490; c=relaxed/simple;
	bh=x7g9ptmYcfcTuZ5r9Y1tjbsM9DstgxEqg+EcSbBeJhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A47s1r+68g3aH4ppficQtB/cVq2hnZMs5WB0shbs5FfG38OUdAiBVfWDqeLKV1xDO4jIyRSF3bY3u5GNelUnQbZeJysuCbBdhDbvrombw5wvjq4ZBTxOdKpaqbIRm8Ro4S1ZgB+Oymt0QxrX2B8viOeHGRhCfQEWj72/h6vZca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 91F532003CF;
	Thu,  3 Sep 2026 08:21:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 329882001FE;
	Thu,  3 Sep 2026 08:21:26 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BC4B218000B7;
	Thu,  3 Sep 2026 14:21:24 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	Frank Li <frank.li@nxp.com>
Subject: [PATCH v18 5/8] regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub
Date: Thu,  3 Sep 2026 11:51:05 +0530
Message-Id: <20260903062108.2712296-6-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <frank.li@nxp.com>
Reviewed-by: Mark Brown <broonie@kernel.org>

---
Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - Add .enable_time = 5000 through P3H2X4X_LDO_ENABLE_TIME_US to all four
   LDO descriptors, so the regulator core applies the post-enable
   settling delay

Changes in v16:
 - Mark the p3h2x4x_regulators[] descriptor array as const
 - Keep the standard MFD dev_get_drvdata(pdev->dev.parent) parent-context
   access and the shared include/linux/mfd/ header (used only by the parent
   and its children)

Changes in v15:
 - No change

Changes in v14:
 - Use the shared MFD protected_reg_lock instead of a regulator-private mutex
   to serialize protected register access across P3H2X4X child drivers
 - Rework protected register handling into explicit unprotect/protect helpers
   and restore the original protection state after each regulator operation
 - Ensure protected registers are restored even if enable, disable or
   set_voltage_sel fails

Changes in v13:
 - Serialize register unlock/modify/lock sequences using a device-level mutex to
   avoid races between regulators.
 - Ensure proper module auto-loading by adding platform device ID table.
 - Improve error handling in register guard paths to avoid operating on locked hub.

Changes in v12:
 - No change

Changes in v11:
 - No change, added Reviewed-By tag

Changes in v10:
 - No change

Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - No change, added Reviewed-By tag

Changes in v6:
 - Use DEFINE_LOCK_GUARD_1 for reg lock/unlock

Changes in v5:
 - Updated dev_err_probe() for regmap_init failure.
 - Updated module description

Changes in v4:
 - Split the driver into three separate patches (mfd, regulator and I3C hub)
 - Introduced driver for on-die regulators in NXP P3H2x4x I3C hub
---
---
 MAINTAINERS                                   |   1 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++++++++++++++
 4 files changed, 301 insertions(+)
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d482a23c0bf7..bdf54313bc5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19772,6 +19772,7 @@ L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 F:	drivers/mfd/p3h2840.c
+F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
 F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786..00b152d95d42 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1020,6 +1020,16 @@ config REGULATOR_MTK_DVFSRC
 	  of Mediatek. It allows for voting on regulator state
 	  between multiple users.
 
+config REGULATOR_P3H2X4X
+	tristate "NXP P3H2X4X regulator support"
+	depends on MFD_P3H2X4X
+	help
+	  This driver provides support for the voltage regulators of the
+	  P3H244x/P3H284x multi-function I3C Hub device.
+
+	  Say M here if you want to include support for this regulator as
+	  a module. The module will be named "p3h2840_i3c_hub_regulator".
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8df8..a07702a49be4 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
+obj-$(CONFIG_REGULATOR_P3H2X4X) += p3h2840_i3c_hub_regulator.o
 obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
 obj-$(CONFIG_REGULATOR_PCA9450) += pca9450-regulator.o
 obj-$(CONFIG_REGULATOR_PF0900) += pf0900-regulator.o
diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regulator/p3h2840_i3c_hub_regulator.c
new file mode 100644
index 000000000000..244f2a4f70f3
--- /dev/null
+++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ * NXP P3H2X4X regulator driver file contain functions for enable/disable regulator
+ * and voltage set/get.
+ */
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define P3H2X4X_LDO_AND_PULLUP_CONF				0x19
+#define P3H2X4X_LDO_ENABLE_DISABLE_MASK				GENMASK(3, 0)
+#define P3H2X4X_CP0_EN_LDO				        BIT(0)
+#define P3H2X4X_CP1_EN_LDO				        BIT(1)
+#define P3H2X4X_TP0145_EN_LDO					BIT(2)
+#define P3H2X4X_TP2367_EN_LDO					BIT(3)
+
+#define P3H2X4X_NET_OPER_MODE_CONF				0x15
+#define P3H2X4X_VCCIO_LDO_CONF					0x16
+#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK			GENMASK(1, 0)
+#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK			GENMASK(3, 2)
+#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK			GENMASK(5, 4)
+#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK			GENMASK(7, 6)
+#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_LDO_COUNT					4
+#define P3H2X4X_LDO_ENABLE_TIME_US				5000
+
+struct p3h2x4x_regulator_dev {
+	struct regulator_dev *rp3h2x4x_dev[P3H2X4X_LDO_COUNT];
+	struct p3h2x4x *p3h2x4x;
+	struct regmap *regmap;
+};
+
+struct p3h2x4x_reg_state {
+	unsigned int orig;
+	bool restore;
+};
+
+static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev)
+{
+	struct p3h2x4x_regulator_dev *priv = rdev_get_drvdata(rdev);
+
+	mutex_lock(&priv->p3h2x4x->protected_reg_lock);
+}
+
+static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev)
+{
+	struct p3h2x4x_regulator_dev *priv = rdev_get_drvdata(rdev);
+
+	mutex_unlock(&priv->p3h2x4x->protected_reg_lock);
+}
+
+DEFINE_LOCK_GUARD_1(p3h2x4x_reg, struct regulator_dev,
+		    p3h2x4x_reg_guard_enter(_T->lock),
+		    p3h2x4x_reg_guard_exit(_T->lock));
+
+static int p3h2x4x_reg_unprotect(struct regulator_dev *rdev,
+				 struct p3h2x4x_reg_state *state)
+{
+	int ret;
+
+	state->restore = false;
+
+	ret = regmap_read(rdev->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			  &state->orig);
+	if (ret)
+		return ret;
+
+	if (state->orig == P3H2X4X_REGISTERS_UNLOCK_CODE)
+		return 0;
+
+	ret = regmap_write(rdev->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			   P3H2X4X_REGISTERS_UNLOCK_CODE);
+	if (ret)
+		return ret;
+
+	state->restore = true;
+
+	return 0;
+}
+
+static int p3h2x4x_reg_protect(struct regulator_dev *rdev,
+			       struct p3h2x4x_reg_state *state)
+{
+	if (!state->restore)
+		return 0;
+
+	return regmap_write(rdev->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			    state->orig);
+}
+
+static int p3h2x4x_regulator_enable(struct regulator_dev *rdev)
+{
+	struct p3h2x4x_reg_state state;
+	int ret, ret2;
+
+	guard(p3h2x4x_reg)(rdev);
+
+	ret = p3h2x4x_reg_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable_regmap(rdev);
+	ret2 = p3h2x4x_reg_protect(rdev, &state);
+
+	return ret ? ret : ret2;
+}
+
+static int p3h2x4x_regulator_disable(struct regulator_dev *rdev)
+{
+	struct p3h2x4x_reg_state state;
+	int ret, ret2;
+
+	guard(p3h2x4x_reg)(rdev);
+
+	ret = p3h2x4x_reg_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_disable_regmap(rdev);
+	ret2 = p3h2x4x_reg_protect(rdev, &state);
+
+	return ret ? ret : ret2;
+}
+
+static int p3h2x4x_regulator_set_voltage_sel(struct regulator_dev *rdev,
+					     unsigned int sel)
+{
+	struct p3h2x4x_reg_state state;
+	int ret, ret2;
+
+	guard(p3h2x4x_reg)(rdev);
+
+	ret = p3h2x4x_reg_unprotect(rdev, &state);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_voltage_sel_regmap(rdev, sel);
+	ret2 = p3h2x4x_reg_protect(rdev, &state);
+
+	return ret ? ret : ret2;
+}
+
+static const struct regulator_ops p3h2x4x_ldo_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = p3h2x4x_regulator_set_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = p3h2x4x_regulator_enable,
+	.disable = p3h2x4x_regulator_disable,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const unsigned int p3h2x4x_voltage_table[] = {
+	1000000,
+	1100000,
+	1200000,
+	1800000,
+};
+
+static const struct regulator_desc p3h2x4x_regulators[] = {
+	{
+		.name = "ldo-cp0",
+		.of_match = of_match_ptr("ldo-cp0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_CP0_EN_LDO,
+		.enable_time = P3H2X4X_LDO_ENABLE_TIME_US,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-cp1",
+		.of_match = of_match_ptr("ldo-cp1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_CP1_EN_LDO,
+		.enable_time = P3H2X4X_LDO_ENABLE_TIME_US,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tpg0",
+		.of_match = of_match_ptr("ldo-tpg0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_TP0145_EN_LDO,
+		.enable_time = P3H2X4X_LDO_ENABLE_TIME_US,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tpg1",
+		.of_match = of_match_ptr("ldo-tpg1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_TP2367_EN_LDO,
+		.enable_time = P3H2X4X_LDO_ENABLE_TIME_US,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK,
+	},
+};
+
+static int p3h2x4x_regulator_probe(struct platform_device *pdev)
+{
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
+	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
+	struct regulator_config rcfg = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	int i;
+
+	p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
+	if (!p3h2x4x_regulator)
+		return -ENOMEM;
+
+	p3h2x4x_regulator->p3h2x4x = p3h2x4x;
+	p3h2x4x_regulator->regmap = p3h2x4x->regmap;
+
+	platform_set_drvdata(pdev, p3h2x4x_regulator);
+
+	device_set_of_node_from_dev(dev, dev->parent);
+
+	rcfg.dev = dev;
+	rcfg.regmap = p3h2x4x_regulator->regmap;
+	rcfg.driver_data = p3h2x4x_regulator;
+
+	for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev), "Failed to register %s\n",
+					     p3h2x4x_regulators[i].name);
+		p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
+	}
+	return 0;
+}
+
+static const struct platform_device_id p3h2x4x_regulator_id[] = {
+	{ .name = "p3h2x4x-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, p3h2x4x_regulator_id);
+
+static struct platform_driver p3h2x4x_regulator_driver = {
+	.driver = {
+		.name = "p3h2x4x-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = p3h2x4x_regulator_probe,
+	.id_table = p3h2x4x_regulator_id,
+};
+module_platform_driver(p3h2x4x_regulator_driver);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB Regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


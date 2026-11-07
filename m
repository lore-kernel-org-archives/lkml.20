Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016224;
	b=YP+uwLZqqEFtG4NLUdZcyK1sNpY97rFdnI0sjEVnpAgPb199MGHRjOE3LVjyoHaYSs2Y
	 egdQ74t8VApqG4SOXUX5L6G8TLsqVMzSy1mtucWR+oYhX0R3nRU9hNqcP1SO3hGNSZTjA
	 XFgfVn/Or+fxHYA7VLjnlmrE2wQprX5Fas8tuhREe2OS5SHCYnOLx79yazrXn2IW9BXbO
	 BG8HIGa9ZmXQ0E3bWiAsi02LWsdMY7Qzue3Y6zDLJquf8magJ0+xubci11kPfihD5RYDV
	 wbQC1s+vzHMlQCh6Bwhb0folFUbmYnT1Ppq5ajBOQjjklw9gqnVRl8vCYY4D8fWeIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016224;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=lQhKFhqTK/py/+bxxobhuRvMFWyvoqHPsKRi9pJf9NE=;
	b=f0jblmfe8mVl12iDDGCvkgEqfI+oCtjUeQVrexV1IZS24JKZamWqQDPTlTXRAsvf4zwt
	 tcVnU4A/WuuAGpZZC2nuftMHUZyRtqlx6EkrkifVYzfM6YjlTH9B8dAu6Kbxvj7n36tWN
	 vSeUIHA24ZHiAQnOFKWMXPApazk7i/K2KAXbJuTISTSdyzJqmkOtYbmd7AFL1g22gdTkG
	 3c37Y4R10zCJXEI5SgpweCcn6JL4vf1mkK4STUKV07xs7oOahIvCV2vIdYnqFY5p2P3IC
	 t1DVTgFRWFfQrks5Rc+8Ky0Y2DZCdXUgPeIAV9zfI3L2RwpfNevbv+6Is6G/GofHguA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="R/oRnoU1";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED64606A330;
	Sat,  7 Nov 2026 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED64606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=R/oRnoU1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=lQhKFhqTK/py/+bxxobhuRvMFWyvoqHPsK
	Ri9pJf9NE=; b=R/oRnoU1QS9SDdhj6KZYQh+sOJnOuvl6nKEe/4ckPUnqGBwzSt
	HXiB5sPL9h4jjVaJX81nfHPJbbS64YzrDJbWJwThTDB8Q9vfWp8oOiE1VL2FnKiP
	NGZ/HUmmwzS6MIzzkvGa2c0/kdgCySGp2MGt/t6cZqUC6559S2Kiyi3eY=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.197])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnlyvWg+5quEKSAA--.1389S4;
	Sat, 07 Nov 2026 09:50:18 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 2/2] regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
Date: Sat,  7 Nov 2026 09:50:14 +0800
Message-ID: <20261107015014.22374-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAnlyvWg+5quEKSAA--.1389S4
X-Coremail-Antispam: 1UD129KBjvJXoW3ZrWfGF4kKrWxuFyUCrWfZrb_yoWkXw13pF
	s8Jas3Kr4kGrWFgrZ7Ar1IvF1Ygrs2qryayry8C3yfZw17AFy2qF9a9FW5AFyDGrn7XFyS
	qayUJa48CF4DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyM5lDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2ruKtgCVAA1sB

The WL2868C is an I2C camera power management IC with seven LDOs.
LDO1 and LDO2 are fed from VIN12 and cover 0.496 V to 1.512 V with a
7-bit voltage selector; LDO3 and LDO4 share VIN34, and LDO5 to LDO7
have one input each, covering 1.504 V to 3.544 V with an 8-bit
selector. All outputs step by 8 mV.

Every output is gated by a per-LDO bit in the enable register, and the
whole chip is additionally gated by the SYS_EN bit in the same
register. The driver sets SYS_EN together with the LDO bit on enable
and requires both to read back before reporting the regulator as
enabled, because no output comes up while SYS_EN is clear. An
optional active-low RST_N GPIO is released during probe, followed by
a 1 ms delay for the device to come up, and is asserted again when
the driver is unbound.

The enable register is written as a whole rather than updated bit by
bit: the per-LDO bits can be preset by the firmware while SYS_EN is
clear, and setting SYS_EN together with a single LDO bit would then
switch the preset outputs on as well. The driver therefore tracks the
set of LDOs enabled by consumers and writes exactly those bits, so
enabling one output cannot power another one. That set is seeded from
the register during probe, so an output the firmware left on is not
cleared by the first enable() of a different one, and disable()
commits the tracked state only after the register write went through,
so a failed write cannot make a later enable() switch off an output
that the core still believes is on.

The I2C interface is powered from the higher of VIN7 and VSYS, so the
"vsys" supply is enabled for as long as the driver is bound, before
the device ID is read; without it the device does not answer on the
bus.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/regulator/Kconfig             |  11 ++
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/wl2868c-regulator.c | 246 ++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/regulator/wl2868c-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa7..f0a604afe5 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1877,6 +1877,17 @@ config REGULATOR_VQMMC_IPQ4019
 	  This driver provides support for the VQMMC LDO I/0
 	  voltage regulator of the IPQ4019 SD/EMMC controller.
 
+config REGULATOR_WL2868C
+	tristate "Will Semiconductor WL2868C regulator"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Support the seven LDO outputs of the Will Semiconductor WL2868C
+	  camera power management IC.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called wl2868c-regulator.
+
 config REGULATOR_WM831X
 	tristate "Wolfson Microelectronics WM831x PMIC regulators"
 	depends on MFD_WM831X
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6aabcc5438..37ffa93a9c 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -214,6 +214,7 @@ obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress-regulator.o
 obj-$(CONFIG_REGULATOR_VQMMC_IPQ4019) += vqmmc-ipq4019-regulator.o
+obj-$(CONFIG_REGULATOR_WL2868C) += wl2868c-regulator.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-dcdc.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-isink.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl2868c-regulator.c
new file mode 100644
index 0000000000..64baeeacf3
--- /dev/null
+++ b/drivers/regulator/wl2868c-regulator.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Will Semiconductor WL2868C seven-channel camera regulator driver.
+ *
+ * Copyright (C) 2026 Qianhui Xu
+ */
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define WL2868C_DEVICE_ID		0x00
+#define WL2868C_DEVICE_ID_VALUE		0x82
+#define WL2868C_LDO_ENABLE		0x0e
+#define WL2868C_SYS_ENABLE		BIT(7)
+#define WL2868C_LDO_ENABLE_MASK		GENMASK(6, 0)
+
+struct wl2868c {
+	struct regmap *regmap;
+	/* LDO enable bits owned by consumers, in WL2868C_LDO_ENABLE layout. */
+	unsigned int enabled;
+	/* Protects enabled. */
+	struct mutex lock;
+};
+
+static int wl2868c_enable(struct regulator_dev *rdev)
+{
+	struct wl2868c *chip = rdev_get_drvdata(rdev);
+	unsigned int bits = rdev->desc->enable_mask;
+	unsigned int ldos;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	/*
+	 * The enable register is written as a whole on purpose. SYS_EN gates
+	 * every output of the chip, and the per-LDO bits may be preset by the
+	 * firmware while SYS_EN is still clear: setting only SYS_EN and our own
+	 * bit would then bring the preset LDOs up as well. Writing the register
+	 * with the bits of the LDOs consumers have enabled, and only those,
+	 * keeps the other outputs off. chip->enabled was seeded from the
+	 * register in probe(), so an output the firmware left on is carried
+	 * over instead of being cleared by the first enable.
+	 */
+	ldos = (chip->enabled | bits) & WL2868C_LDO_ENABLE_MASK;
+	ret = regmap_write(chip->regmap, WL2868C_LDO_ENABLE,
+			   WL2868C_SYS_ENABLE | ldos);
+	if (ret)
+		return ret;
+
+	chip->enabled = ldos;
+
+	return 0;
+}
+
+static int wl2868c_disable(struct regulator_dev *rdev)
+{
+	struct wl2868c *chip = rdev_get_drvdata(rdev);
+	unsigned int bits = rdev->desc->enable_mask;
+	unsigned int ldos;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	/*
+	 * SYS_EN stays set while at least one output is enabled; the per-LDO
+	 * bits of the other outputs stay clear so that setting it cannot
+	 * switch anything else on.
+	 */
+	ldos = (chip->enabled & ~bits) & WL2868C_LDO_ENABLE_MASK;
+
+	/*
+	 * The tracked state is committed only once the register write went
+	 * through: a failed write leaves the output on, and the regulator core
+	 * keeps its own use count unchanged, so dropping the bit here would
+	 * make the next enable() of another output switch this one off.
+	 */
+	ret = regmap_write(chip->regmap, WL2868C_LDO_ENABLE,
+			   ldos ? WL2868C_SYS_ENABLE | ldos : 0);
+	if (ret)
+		return ret;
+
+	chip->enabled = ldos;
+
+	return 0;
+}
+
+static int wl2868c_is_enabled(struct regulator_dev *rdev)
+{
+	unsigned int mask = WL2868C_SYS_ENABLE | rdev->desc->enable_mask;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, WL2868C_LDO_ENABLE, &value);
+	if (ret)
+		return ret;
+
+	return (value & mask) == mask;
+}
+
+static const struct regulator_ops wl2868c_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = wl2868c_enable,
+	.disable = wl2868c_disable,
+	.is_enabled = wl2868c_is_enabled,
+};
+
+/*
+ * LDO1 and LDO2 have a 7-bit voltage selector, the other five have an 8-bit
+ * one; all of them step by 8 mV.
+ */
+#define WL2868C_LDO(_num, _supply, _min, _n_voltages, _vsel_reg, _mask, _en) { \
+	.name = "ldo" #_num,				\
+	.of_match = "ldo" #_num,			\
+	.regulators_node = "regulators",		\
+	.id = (_num) - 1,				\
+	.type = REGULATOR_VOLTAGE,			\
+	.owner = THIS_MODULE,				\
+	.ops = &wl2868c_ops,				\
+	.supply_name = _supply,				\
+	.min_uV = _min,					\
+	.uV_step = 8000,				\
+	.n_voltages = _n_voltages,			\
+	.vsel_reg = _vsel_reg,				\
+	.vsel_mask = _mask,				\
+	.enable_reg = WL2868C_LDO_ENABLE,		\
+	.enable_mask = _en,				\
+	.enable_time = 150,				\
+}
+
+static const struct regulator_desc wl2868c_regulators[] = {
+	WL2868C_LDO(1, "vin12", 496000, 128, 0x03, 0x7f, BIT(0)),
+	WL2868C_LDO(2, "vin12", 496000, 128, 0x04, 0x7f, BIT(1)),
+	WL2868C_LDO(3, "vin34", 1504000, 256, 0x05, 0xff, BIT(2)),
+	WL2868C_LDO(4, "vin34", 1504000, 256, 0x06, 0xff, BIT(3)),
+	WL2868C_LDO(5, "vin5", 1504000, 256, 0x07, 0xff, BIT(4)),
+	WL2868C_LDO(6, "vin6", 1504000, 256, 0x08, 0xff, BIT(5)),
+	WL2868C_LDO(7, "vin7", 1504000, 256, 0x09, 0xff, BIT(6)),
+};
+
+static const struct regmap_config wl2868c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x25,
+};
+
+static void wl2868c_reset(void *data)
+{
+	gpiod_set_value_cansleep(data, 1);
+}
+
+static int wl2868c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regulator_config config = { .dev = dev };
+	struct regulator_dev *rdev;
+	struct gpio_desc *reset;
+	struct wl2868c *chip;
+	unsigned int id, value;
+	int ret, i;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	mutex_init(&chip->lock);
+	config.driver_data = chip;
+
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset GPIO\n");
+
+	if (reset) {
+		ret = devm_add_action_or_reset(dev, wl2868c_reset, reset);
+		if (ret)
+			return ret;
+		fsleep(1000);
+	}
+
+	chip->regmap = devm_regmap_init_i2c(client, &wl2868c_regmap_config);
+	config.regmap = chip->regmap;
+	if (IS_ERR(config.regmap))
+		return dev_err_probe(dev, PTR_ERR(config.regmap),
+				     "Failed to create regmap\n");
+
+	/*
+	 * The I2C interface is powered from the higher of VIN7 and VSYS, so the
+	 * system supply has to be up before the device can answer at all. It
+	 * stays enabled for as long as the driver is bound.
+	 */
+	ret = devm_regulator_get_enable(dev, "vsys");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable the system supply\n");
+
+	ret = regmap_read(config.regmap, WL2868C_DEVICE_ID, &id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read device ID\n");
+	if (id != WL2868C_DEVICE_ID_VALUE)
+		return dev_err_probe(dev, -ENODEV, "Unexpected device ID: %#x\n", id);
+
+	/*
+	 * Seed the tracked set with the outputs the firmware left enabled, so
+	 * that the first enable() or disable() of any output preserves them.
+	 * The regulator core reads the state back through is_enabled(), which
+	 * does not look at this set.
+	 */
+	ret = regmap_read(config.regmap, WL2868C_LDO_ENABLE, &value);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read the enable register\n");
+
+	chip->enabled = value & WL2868C_LDO_ENABLE_MASK;
+
+	for (i = 0; i < ARRAY_SIZE(wl2868c_regulators); i++) {
+		rdev = devm_regulator_register(dev, &wl2868c_regulators[i], &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register LDO%d\n", i + 1);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id wl2868c_of_match[] = {
+	{ .compatible = "willsemi,wl2868c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wl2868c_of_match);
+
+static struct i2c_driver wl2868c_driver = {
+	.driver = {
+		.name = "wl2868c",
+		.of_match_table = wl2868c_of_match,
+	},
+	.probe = wl2868c_probe,
+};
+module_i2c_driver(wl2868c_driver);
+
+MODULE_DESCRIPTION("Will Semiconductor WL2868C regulator driver");
+MODULE_LICENSE("GPL");


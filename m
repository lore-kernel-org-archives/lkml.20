Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395500;
	b=hE6E673bbterKtMay+39IYIYeQ52387tbqA135116UQt7U7HDc3N39HQ0SZLiLcPPzDs
	 AZyO1x0QJaWMxpC1i5ua+Kdbnbg2jsW+sEXURMfXS8pxKCVYrpvl+JzfQl3MmzDQAqd8m
	 P7D+zi0NUTi3YzyfcB9rBSplyo2n5VCV2Br8ioQuILJOwWC6z3pkKyXC4UD7G2/DmERDv
	 AoqQPPQnj20cqlbfAYdYQz6yTAAsdTxY5lTTLT4sXx1lQEtAl2dOaUrWSP1KXv6NWFE7I
	 I+KAmMV2VjGjUV/lCsD1KlPnGEP9ZPDJD1olsCApYp21G09dCmGAnPKpDom5fYb5YFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395500;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=sVET9U6Olae3ij1GltrusDOWgBLbCdRc42l+G7Z1Llc=;
	b=uS7ONUZqsiKbO6k8W4UxSQ0ra8HoPBDY4TIEk+UezfS4klse/M04H8h/2DVSVI5Skbo7
	 8iCkkBSmFa9fe4ZmcLqAOmQ73562JavGbWaD1IXN+zyDgz9x53KPQ6kjtvNmMHJ2QCl5l
	 58krrl22Jz4Twjj1F9tsEu0qH+pYx/3y2vhMOKitDSoZ35Z/KpSSdONPbNpu4LokV9aDe
	 DEWjXtg8/K/uT7j1sYCi3rM3Ta3dfcaAbRITlg7TXVzwR481R1KwMnziAGy4tyVUXepNC
	 Xn5sSWp0ns7UbsPGieHl+06LShT494K3SAcz2qK+SWYWhBsqglNAwUD+uF2dqpoqGdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=v3NyKAI+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57468606B414;
	Wed, 11 Nov 2026 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57468606B414
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=v3NyKAI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=sVET9U6Olae3ij1GltrusDOWgBLbCdRc42
	l+G7Z1Llc=; b=v3NyKAI+eQv660xQ+bBmueHICGlklCs04CuH2Y8yTJIIe8oEzg
	WwPteNqn0D+KmeRGBoMG9E8nURjtIgv+Qb5g98p1T86e+jehGO0yYw4BlS8TL7l1
	8td2TTY26rBcDCm4vhcheg23cuP0wrttQdk5vU/0Pdeo5Zm2z8lJCClNw=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.178.45])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3QEVkTfRqfLWsAA--.2531S4;
	Wed, 11 Nov 2026 19:11:34 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 2/2] regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
Date: Wed, 11 Nov 2026 19:11:32 +0800
Message-ID: <20261111111132.1296892-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3QEVkTfRqfLWsAA--.2531S4
X-Coremail-Antispam: 1UD129KBjvAXoW3ZrWxAw4fuFWkWF1rZFW5Wrg_yoW8Jw4DCo
	WIqr1F9a18Kr4rW3yFkF1UC347XrWjkw15Z3W5GFs5uFyDZF13Crya9ay3XF13tr4UKrW7
	u34ftrnxGF4xJFZ3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYZ7k0a2IF6w4kM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87
	I2jVAFwI0_Jryl82xGYIkIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyM5lDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREIB2rzcNlJ1wBKs7

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
optional active-low RST_N GPIO starts asserted, is released only after
the control supply is up, followed by a delay for the device to come
up, and is asserted again before the supply is disabled on unbind.

The enable register is written as a whole rather than updated bit by
bit: the per-LDO bits can be preset by the firmware while SYS_EN is
clear, and setting SYS_EN together with a single LDO bit would then
switch the preset outputs on as well. The driver therefore tracks the
set of LDOs enabled by consumers and writes exactly those bits, so
enabling one output cannot power another one. That set is seeded from
the register during probe, but only when SYS_EN is already set: with
SYS_EN clear the per-LDO bits are presets for outputs that are off,
and seeding them would make the first enable() of one output switch
all of them on. disable() commits the tracked state only after the
register write went through, so a failed write cannot make a later
enable() switch off an output that the core still believes is on.

The control logic and the I2C interface are powered from the higher of
VIN7 and VSYS. The driver enables VSYS, falling back to VIN7 on boards
that do not describe VSYS, and keeps it enabled for as long as it is
bound: without it the device does not answer on the bus. The device ID
is read only after the control supply is up and RST_N has been
released.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |  11 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/wl2868c-regulator.c | 280 ++++++++++++++++++++++++++
 4 files changed, 293 insertions(+)
 create mode 100644 drivers/regulator/wl2868c-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 435beaf95..5a3913c45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29063,6 +29063,7 @@ M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
+F:	drivers/regulator/wl2868c-regulator.c
 
 WILOCITY WIL6210 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a54919..79bdba077 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1851,6 +1851,17 @@ config REGULATOR_VQMMC_IPQ4019
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
index 134eee274..662f31a14 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -211,6 +211,7 @@ obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress-regulator.o
 obj-$(CONFIG_REGULATOR_VQMMC_IPQ4019) += vqmmc-ipq4019-regulator.o
+obj-$(CONFIG_REGULATOR_WL2868C) += wl2868c-regulator.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-dcdc.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-isink.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl2868c-regulator.c
new file mode 100644
index 000000000..55e44cbfc
--- /dev/null
+++ b/drivers/regulator/wl2868c-regulator.c
@@ -0,0 +1,280 @@
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
+/* RST_N must be released after the control supply is up, not before. */
+#define WL2868C_RESET_RELEASE_US	1000
+/* Time the device needs after RST_N is released before it answers on I2C. */
+#define WL2868C_STARTUP_US		1000
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
+	 * register in probe() when SYS_EN was set, so an output the firmware
+	 * left on is carried over instead of being cleared by the first
+	 * enable; when SYS_EN was clear no output is on at all.
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
+	struct wl2868c *chip = rdev_get_drvdata(rdev);
+	unsigned int mask = WL2868C_SYS_ENABLE | rdev->desc->enable_mask;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(chip->regmap, WL2868C_LDO_ENABLE, &value);
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
+static void wl2868c_reset_assert(void *data)
+{
+	gpiod_set_value_cansleep(data, 1);
+}
+
+/*
+ * VIN7 and VSYS both feed the control logic and the I2C interface, which run
+ * from the higher of the two. The binding requires at least one of them, and
+ * whichever is present has to stay up for as long as the driver is bound:
+ * without it the device does not answer on the bus at all.
+ */
+static int wl2868c_enable_control_supply(struct device *dev)
+{
+	int ret;
+
+	ret = devm_regulator_get_enable_optional(dev, "vsys");
+	if (ret != -ENODEV)
+		return ret;
+
+	ret = devm_regulator_get_enable_optional(dev, "vin7");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable the control supply\n");
+
+	return 0;
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
+	/*
+	 * RST_N starts asserted and is released only once the control supply is
+	 * up. The reset action is registered after the supply action on
+	 * purpose: devres unwinds in reverse order, so RST_N is asserted again
+	 * before the supply is disabled on unbind, not after.
+	 */
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset GPIO\n");
+
+	chip->regmap = devm_regmap_init_i2c(client, &wl2868c_regmap_config);
+	config.regmap = chip->regmap;
+	if (IS_ERR(config.regmap))
+		return dev_err_probe(dev, PTR_ERR(config.regmap),
+				     "Failed to create regmap\n");
+
+	ret = wl2868c_enable_control_supply(dev);
+	if (ret)
+		return ret;
+
+	if (reset) {
+		fsleep(WL2868C_RESET_RELEASE_US);
+		gpiod_set_value_cansleep(reset, 0);
+		ret = devm_add_action_or_reset(dev, wl2868c_reset_assert, reset);
+		if (ret)
+			return ret;
+		fsleep(WL2868C_STARTUP_US);
+	}
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
+	 * SYS_EN gates the whole chip: while it is clear no output is up, the
+	 * per-LDO bits are only presets and is_enabled() reports every output
+	 * as off. Seeding them in that state would make the first enable() of
+	 * any single output switch all the presets on.
+	 */
+	ret = regmap_read(config.regmap, WL2868C_LDO_ENABLE, &value);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read the enable register\n");
+
+	if (value & WL2868C_SYS_ENABLE)
+		chip->enabled = value & WL2868C_LDO_ENABLE_MASK;
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
-- 
2.53.0


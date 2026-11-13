Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557963;
	b=kld/RM6a06yuUNfV1mfJVZHnMA/9mGElVGNGAS130knxNJgrN+KJXkhKaSCBdp9fJjqu
	 zJZ/CvTMAydgBWijiaZ7A70FJWo4DOYUNPVvwIUkihOxLun+FRkYOod11to0oeJM4p0WK
	 xSzlh0NcV6QxWEWZxWQxRDTfFCaMllYgin1Q+2hlwrl1pJDWMmtbTGPwl1jDgF+pl3mRj
	 hdKSV8G3ozA4NkRsBY3t5k8DCVDvGdTrr4k+dTswqg+l7Zt+TsT6GXB2gf+qAwE0oE0Ay
	 Z4H2/ODHo0l7CGDnlOmVO22sojn+js2jFn/dWYUcAwNS63ygJaOkKL+tNJJtN6ROgeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557963;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=iO3C0qwkx/2/OW6tUnlCC7klG0lJ071qcVyOmvICxIg=;
	b=iNeYSJDnIHjk9mSvxzWLJhasNOKxCEB4+4vz3CmzkNK5Oc3BCyS3A0OiSaiJhyTV6+bl
	 Svv3miViKWveQMbkF2oUvSFhBwtGWE9rdLDd63xifHsriL46vMKbB3bu7gJOaYjTHXUVY
	 mS4MOJB5RqqbTm9XLhbMHdxtkujfbnckabvLHJGgixoDe85+LiaWGBn7H81NLnVquTiSM
	 GFmJUzxHtDsMJZhwMv/G7T3VBncLQfp0o0gQnzWGrzglweq770VI9yRL9TRP4ukSGhVev
	 JDV1YG3CZFJmlIqRJZdEe29jejgfaIdraOP/x5wAezxSmOQvV5b1F01aVqhUFj1ebpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Jd36x9XX;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC00606A321;
	Fri, 13 Nov 2026 08:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Jd36x9XX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=iO3C0qwkx/2/OW6tUnlCC7klG0lJ071qcV
	yOmvICxIg=; b=Jd36x9XXMkoGeAuuqhG16Dh5hEpatfyy+B8Me1bdr1MDdfMT61
	p8MbjDfgmJNTGNlgWYGfarxNy/SBPAp2nZik+vjszP1o3+6N6O2NS501k3XzyrR9
	unAfXhxJAYd3iIVD9mNSFILWTVbqxbkxtOxUw2A2Iq0m7nWTYQIJpTIsI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBX1DgCyPZqlSK4AA--.7571S4;
	Fri, 13 Nov 2026 16:19:19 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 2/2] regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
Date: Fri, 13 Nov 2026 16:19:14 +0800
Message-ID: <4ad69e8cfdef799d2f33ce1fdd43e539a2f515f5.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBX1DgCyPZqlSK4AA--.7571S4
X-Coremail-Antispam: 1UD129KBjvAXoW3ZrWxAw4fuFWkWF1rZFW5Wrg_yoW8XrWrAo
	WIqr1Y9w48tw4rW3yFkF1UC3srXrWjk34rZ3W5KFs5uFyDZ3W3C34a9ay3XFnxtr4UKrW3
	u34ftrnxGF4xJFZxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYu7k0a2IF6w4kM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87
	I2jVAFwI0_Jryl82xGYIkIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5iXo3UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAfsE

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

The LDOx_SEQ fields also have to be taken over: a non-zero slot moves
that output from the LDOx_EN bit to the power-up sequencer, and writes
to the enable register then have no effect on it (datasheet WL2868C
Rev 1.4, "0x0A, 0x0B, 0x0C and 0x0D: LDOx_SEQ", p.35). The binding
describes no sequencing, so the driver clears the four slot registers
during probe and keeps the enable register as the only control path;
otherwise enable() and disable() would silently do nothing for an
output a slot had claimed. The reset value is 0 and no known board
programs it, but firmware runs before us and may.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |  11 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/wl2868c-regulator.c | 301 ++++++++++++++++++++++++++
 4 files changed, 314 insertions(+)
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
index 000000000..9ffb08dcb
--- /dev/null
+++ b/drivers/regulator/wl2868c-regulator.c
@@ -0,0 +1,301 @@
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
+/* 0x0a..0x0d: seven 4-bit LDOx_SEQ slots; 0 = driven by LDOx_EN in 0x0e. */
+#define WL2868C_LDO_SEQ		0x0a
+#define WL2868C_LDO_SEQ_LEN		4
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
+	static const u8 no_seq[WL2868C_LDO_SEQ_LEN];
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
+	 * LDOx_SEQ[3:0] (0x0a..0x0d) assigns an output to one of the seven
+	 * power-up sequencer slots; any value but 0 moves that LDO from the
+	 * LDOx_EN bit in 0x0e to the sequencer, where writes to 0x0e have no
+	 * effect (datasheet WL2868C Rev 1.4, "0x0A, 0x0B, 0x0C and 0x0D:
+	 * LDOx_SEQ", p.35). The binding describes no sequencing, so clear the
+	 * slots: every output then stays under the enable register this driver
+	 * owns. The reset value is 0 and no board is known to program it, but
+	 * firmware can, and a stale slot would make enable() silently inert.
+	 * Outputs a slot had turned on are switched off here; no consumer is
+	 * up yet at probe time.
+	 */
+	ret = regmap_bulk_write(config.regmap, WL2868C_LDO_SEQ, no_seq,
+				WL2868C_LDO_SEQ_LEN);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear the sequencer slots\n");
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


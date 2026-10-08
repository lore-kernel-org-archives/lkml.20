Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212CE4EE85E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475072; cv=none; b=Y+LBvGlXjP/yDZYOW7xFJvItC1STjpz76pl2zjTclGAGACwCe4wrba3/JWcNbIxFMDuifVeaXmdaX9V1G8CzE/f2jIEIZzlYGHdCwbc1M0xdMoqbrs+EBgCnMUQ2lrpMSQsaNF7qsPY+96DnPb9IHSlzLmqY0i4bzpceXA9PdvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475072; c=relaxed/simple;
	bh=GYaNcMnDJAfcqCXVh17hTtuv4JbRBa/vGN+ZOqJNw0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmApqF2JORC2nc/WDUSeHkqyRXPtaaBVPHpsid4MUjGKUMKuuBA70OQ9eQkW6aUDcQK+7Dyq7rhHK3hW34osoHaim5ITYg5iiF7qHNsbraAyRGy7X7zij50lq3QIRwze8vG/SPqZK/CcnmS2Uud91H61TkNfSJS4WwSgAtm3i5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVX4+0x5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVX4+0x5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1922201a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475067; x=1792079867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+XVD3uwzmDWCWp/mX7S+gfsHb2oR5SqS6SuR0tf/BY=;
        b=UVX4+0x5xz64RpBNEYWIADbJuX5w3SyM8hqiamIc/02tP5fjE4qv/Rxz/OUjrPfyVk
         YswZCRVRKDtysYdr0y5RTtEXTiOxvMUN3z6060w7D3fu0rhg/96rsfTApc29qFqnmHUc
         FDKZCNKQ/C8vySH2gYzEOVle2P9YPs+5ybRLkxA/NAcD51IQVJmDpHhnWBv7Vbl3fCm8
         LFq+zyRz9T+0IHOAyyYGayIkLIiCNEhDoOB40cBZGs5plbm7ka3OJQUrXHdeBm0Al/7M
         sEHodVCTfP73Hj7oJy1zZvNuk04E/Lj4eCG874/wiUgdUwWYGp1pA+T0Glc3KEy954Ci
         QiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475067; x=1792079867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+XVD3uwzmDWCWp/mX7S+gfsHb2oR5SqS6SuR0tf/BY=;
        b=WQe6aggtU9ueqvX/9FdtXMf7UKj8Hs+Q3YrsR76bzdpJSBikBoQIDFaDbaMvd/Qk1U
         dw7M/J679FgSp5paThkOui0pjryIj+kUl7m+jUvZQ40w+C35nhdjGFKybRkfdM2WQhkd
         S8cOV7+CiG3Oo3NZWRz/ZtvWDKrs6zyI60dlr2BLvf6X3a/gJdmqv5iCtScL4MQRw4yY
         v8gkgYveupj1cZogD6KXeStuEiSOMBZmnL1sVHxN3fCxP5H8XwXofL3JH447DdH3WGlN
         UuU4QeWnT8dxHHaid64p0z7xPaWEDPV/nJYLBMi+VnLSgA5szDdiGtp64akfjs0vvz09
         mWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ky0wkf4uFdQ3vbkSb3zcz3nhE1UGaZdK4C0Kyx+rLnZaMm0mif9VX6xarAFsVfzcOZHh/u1VoaqZJk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz+FYhnuU3kibaXT8wwLFdFXM10zlmG1xbxNlrP4eI+m5bblDS
	AJDvVSJDIuRZ+Ao8DphJq5wLr13vjX8/VyyNKcGMtHy3MWjJN+e3wTRT
X-Gm-Gg: AYBFou3YxoJVljvFFqEGxGgTB7K1BOb/jlenUn79fR38uT26Z+odEleZxEKnKZ0xR7t
	LYsR3/Aa8bUgmfEEPhot1x5Ppii6rAtss+z8KxmLvkHN9H54/nzquQBp5+B3VIj2urqUDyAdvdZ
	9cJR591fQXkYHlqLfWe+4UsfXTNatvK/qTFezunde2/Z8e09x/Z/CRkY+5WxIQiJPDGWe7mxlFz
	gYPT1vcU/0qOSRwggIi/gNSZ1Rxf6KyEcBQHorNuXhcLSTjv1zCCXu/jeBUhZ/LrYS6qsbwir5D
	nL2ZVaK1Tq25ptU8Iwo9kQ32mZ61fxsXNXZo+FeBmiZVsNZGrE3wPVrmQjWeecKBqzdsxh/U8wS
	Mpypv2y4q6S8kHEamG4kQyvxmROS1IkPPp4cfRTEzj7JXKpqUmPxoTFBxCCE7ylE17PWUL2QUew
	YimjP+qJKq6hTfqlOYhsq2B+3foXij6/7rov+3UDeXhArhi8BkViqNoz9D0AF6rYYTWwm8lQ7UI
	TdkctHdM+zXib8wP+ICuiQqbQ==
X-Received: by 2002:a17:902:d983:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2e6004ebcafmr54280905ad.42.1791475062492;
        Thu, 08 Oct 2026 08:57:42 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0aesm27694045ad.28.2026.10.08.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:57:42 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] regulator: histb: add voltage regulator driver
Date: Thu,  8 Oct 2026 23:57:25 +0800
Message-ID: <20261008155727.3801095-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008155727.3801095-1-mmyangfl@gmail.com>
References: <20261008155727.3801095-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the voltage rails on HiSilicon STB SoCs which are
controlled by the PMOC block through a PWM signal, as described by the
hisilicon,histb-volt binding.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS                         |   7 ++
 drivers/regulator/Kconfig           |   7 ++
 drivers/regulator/Makefile          |   1 +
 drivers/regulator/histb-regulator.c | 163 ++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 drivers/regulator/histb-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..a77731922891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11910,6 +11910,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB VOLTAGE REGULATOR DRIVER
+M:	David Yang <mmyangfl@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml
+F:	drivers/regulator/histb-regulator.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786..210130783f72 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -487,6 +487,13 @@ config REGULATOR_HI6421V600
 	  HiSilicon Hi6421v600 PMU / Codec IC.
 	  This is used on Kirin 3670 boards, like HiKey 970.
 
+config REGULATOR_HISTB
+	tristate "HiSilicon STB voltage regulator support"
+	depends on ARCH_HISI || COMPILE_TEST
+	help
+	  This driver provides support for the voltage regulators of the
+	  HiSilicon STB SoCs, including Hi3798cv200, Hi3798mv100, Hi3798mv200.
+
 config REGULATOR_ISL9305
 	tristate "Intersil ISL9305 regulator"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8df8..9fa44d180458 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_REGULATOR_HI6421) += hi6421-regulator.o
 obj-$(CONFIG_REGULATOR_HI6421V530) += hi6421v530-regulator.o
 obj-$(CONFIG_REGULATOR_HI6421V600) += hi6421v600-regulator.o
 obj-$(CONFIG_REGULATOR_HI655X) += hi655x-regulator.o
+obj-$(CONFIG_REGULATOR_HISTB) += histb-regulator.o
 obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
 obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
 obj-$(CONFIG_REGULATOR_FP9931) += fp9931.o
diff --git a/drivers/regulator/histb-regulator.c b/drivers/regulator/histb-regulator.c
new file mode 100644
index 000000000000..77073a646e49
--- /dev/null
+++ b/drivers/regulator/histb-regulator.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: MIT OR GPL-2.0-or-later
+/*
+ * Regulator driver for the PWM controlled voltage regulators of HiSilicon STB
+ * SoCs
+ *
+ * May work on Hi3716mv410/420 Hi3796mv100/200 Hi3798cv200/mv100/mv200 but not
+ * throughly tested
+ *
+ * Copyright (c) 2026 David Yang
+ */
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * Duty cycle + 1 and period + 1 are counted in periods of the oscillator
+ * clock (usually 24 MHz), and a larger duty cycle means a lower output
+ * voltage.
+ */
+#define HISTB_DUTY		GENMASK(31, 16)
+#define HISTB_PERIOD		GENMASK(15, 0)
+
+/* 24 MHz / 240 = 100 kHz, arbitrarily chosen but should be enough */
+#define HISTB_PWM_PERIOD	240
+
+struct histb_regulator {
+	struct regulator_desc desc;
+	void __iomem *base;
+	int min_uV;
+	int max_uV;
+};
+
+static int histb_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct histb_regulator *priv = rdev_get_drvdata(rdev);
+	u32 val;
+	u32 period;
+	u32 duty;
+	u64 uV;
+
+	val = readl_relaxed(priv->base);
+	period = FIELD_GET(HISTB_PERIOD, val);
+	duty = FIELD_GET(HISTB_DUTY, val);
+
+	/* an empty counter range leaves the output high */
+	if (duty <= 1 || period <= 1)
+		return priv->max_uV;
+
+	duty--;
+	period--;
+	if (duty >= period)
+		return priv->min_uV;
+
+	uV = (u64)(priv->max_uV - priv->min_uV) * duty;
+
+	return priv->max_uV - DIV_ROUND_CLOSEST_ULL(uV, period);
+}
+
+static int histb_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
+				       int max_uV, unsigned int *selector)
+{
+	struct histb_regulator *priv = rdev_get_drvdata(rdev);
+	unsigned int duty;
+	u32 val;
+
+	if (min_uV >= priv->max_uV)
+		duty = 0;
+	else if (min_uV <= priv->min_uV)
+		duty = HISTB_PWM_PERIOD;
+	else
+		/* rounding down keeps the output at or above the request */
+		duty = DIV_ROUND_DOWN_ULL((u64)(priv->max_uV - min_uV) *
+					  HISTB_PWM_PERIOD,
+					  priv->max_uV - priv->min_uV);
+
+	val = FIELD_PREP(HISTB_DUTY, duty + 1) |
+	      FIELD_PREP(HISTB_PERIOD, HISTB_PWM_PERIOD + 1);
+	writel_relaxed(val, priv->base);
+
+	return 0;
+}
+
+static const struct regulator_ops histb_regulator_ops = {
+	.get_voltage = histb_regulator_get_voltage,
+	.set_voltage = histb_regulator_set_voltage,
+};
+
+static int histb_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct histb_regulator *priv;
+	struct regulator_init_data *init_data;
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, &priv->desc);
+	if (!init_data)
+		return -ENOMEM;
+
+	priv->min_uV = init_data->constraints.min_uV;
+	priv->max_uV = init_data->constraints.max_uV;
+	if (priv->min_uV <= 0 || priv->max_uV <= priv->min_uV) {
+		dev_err(dev, "invalid voltage range (%d..%d uV)\n",
+			priv->min_uV, priv->max_uV);
+		return -EINVAL;
+	}
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->desc.name = dev_name(dev);
+	priv->desc.type = REGULATOR_VOLTAGE;
+	priv->desc.ops = &histb_regulator_ops;
+	priv->desc.owner = THIS_MODULE;
+	priv->desc.continuous_voltage_range = true;
+
+	config.dev = dev;
+	config.init_data = init_data;
+	config.driver_data = priv;
+	config.of_node = dev->of_node;
+
+	rdev = devm_regulator_register(dev, &priv->desc, &config);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "failed to register %s\n",
+				     priv->desc.name);
+
+	return 0;
+}
+
+static const struct of_device_id histb_regulator_of_match[] = {
+	{ .compatible = "hisilicon,hi3798cv200-volt" },
+	{ .compatible = "hisilicon,hi3798mv100-volt" },
+	{ .compatible = "hisilicon,hi3798mv200-volt" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, histb_regulator_of_match);
+
+static struct platform_driver histb_regulator_driver = {
+	.probe = histb_regulator_probe,
+	.driver = {
+		.name = "histb-regulator",
+		.of_match_table = histb_regulator_of_match,
+	},
+};
+module_platform_driver(histb_regulator_driver);
+
+MODULE_DESCRIPTION("HiSilicon STB PWM voltage regulator driver");
+MODULE_AUTHOR("David Yang <mmyangfl@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.53.0


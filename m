Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925836654F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582354; cv=none; b=NsPIfoG5HGFuKdwhtLZZX+4eErpKAxmPCtY/gxcLhZj7QDrToNgHXd82NUUn+AvKrYn/GzytapOhzFNM+pC04RxQflr30XHM8wJal1z/ikouB7H3tLo+yC+AA1jgLvC82XBxGSO6Pzhy6KwlxJYph6GrsJmaAMh6R9YPYK5Opx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582354; c=relaxed/simple;
	bh=fAarTEsD39Bj5TZbxwO1RrsggqaZxYhogPeMoP6yiTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbjwanU7+jfeR/Utihv+WRlgUQZRRhusyL9wzygPam3Dn+F08IiuTK+0wR/9fC89LmviVCUDPSMEFjF7QAy6UHKtADkZNi5eYbmrLNof62TvvF5n2pKLTGaazCGxFqsn/8+nP2uxt5WQJwZQc3Lxzpzru8QLp1Wjil2EsbhTAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+FfqPH0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+FfqPH0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd76b1361dso910885ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582353; x=1792187153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wC2FuBb/O3g6Rt7s523Wfx3QYhvIVNlthZrOLjwRJlk=;
        b=O+FfqPH06UwRrHCaGuVfZ1JSmCGIzEJqQvGGtE1eCCfx13UIN2pUEo7gpu6szSzPzR
         vaXw4F/Enx7mQDX+zdvHuedq59VmqSgqIPhsXSZgHlVEn2tAyxSgUTwSyWuftGcTpKC8
         gFJ7Lxfjy9NxI80TZbAA/fjvTngTl4QlpbyuJmnqmpwQpp+xZoElNrnXeDR4mDLIf2/n
         oC66C3n3jo/n4MhNpD+1xJGHAhxOI8JyeL8pJ84SFwfDgqyKlCceyDCjDQOFhkwAhnfo
         gere/Sx7QxfVUWeO9DWKYZiXTj2PLwgw+GJorSS9m28NETWRscn4jZityRp+AGwGnSmI
         jdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582353; x=1792187153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wC2FuBb/O3g6Rt7s523Wfx3QYhvIVNlthZrOLjwRJlk=;
        b=SciMgPZZoLR2/TDHs8DjZzemp/M/gU0E/5F526TSiren3yPQqWYe5MRbeQIUQ908gD
         HEbGbl6x7mIdjx8jAu1bcCNSrzXQc/aB0WekO3EpNLLE0MQrseZl6O8WCSp4sgIIVEFP
         fDyJjK3agA6uk8AQbGMN5p3ZOvBplq828JkovIm3YMldBRCaSY6IsZ6RZJ6Fs8itL3Uo
         08n6UKw89UJeLeQlbBATjlAZRWYxwwiEcZzf6Ob4sknbXejY4feWXiCfqLlUWnZu1MkV
         jFGJ0JxM9TTYdm/6pau00v2WNWKpTQYoSbste2mJkehn9H4viHJlDgbJqqOLzcbZylri
         mj+w==
X-Forwarded-Encrypted: i=1; AKwUvBwKLez7wnm4w1JKyJ+QxWcerLaTpU+6h6JqhhlEIT9nuW2n+hWZLE9JuBj/vONLQScSzOZ8nQosxtQxHiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVrPRvn76/RBLjAMNzO7lNi/6u3Uz4uV6aINP+u71O5AZk1U/p
	DRUy8esVA7R0VolAxLgXSuyWPYkplC5VvtQfj3TzetiA2Bnrx1+wBd/n
X-Gm-Gg: AYBFou2kM34n/TsflqkBCXVeXqVZQNwOZmKQtDWYrszt5aDX2miIOXPAGagPyJcM/I4
	O4JNtBf75+vzUv4WJVWvp5aJPnY95ny+zPbybmCRLmUVIO3usZM1fO0ZfbD0f6DvDJApygnoYc8
	lIfkyc29HHWLEbQ3kH/ttTlLsoqILJ2Y7lN/Xel3wsuVcylbV+dSLAx9pJWM8AljNJAksQxlue5
	YzVAmt6bbSpbwT+knLq4L1TkJ4JpfmgxQ+RvvrX8H4K+P4xV09m4QFcgu+f9FWig/wvkkR3Jax7
	grVoHBIs3HAnY6svyswmCR7S2w7ZTnUVGPEETJhpFgyym665Or4ONZdcv9zP8BMz4o2Sccbu43r
	aw19aA5AumhXXwNWACS2RJW5SqfyDyvXa2FLCl5kTcFUDhQ8ku7C36cMszMrqpzzA5cWigAbnQq
	q1gHbaONsRuJAWWXdJr5d8wEJdurC6fX1xqUYV+m8t9vQxKXyBp4KQCG2udJ2Z/u8FynmheIgFv
	XPpq6f7XBGGBrw2tygbs8zEaNyLZ+jgu+yDMw==
X-Received: by 2002:a17:903:3885:b0:2e7:c818:a091 with SMTP id d9443c01a7336-2e842e0cbc5mr30088495ad.57.1791582352396;
        Fri, 09 Oct 2026 14:45:52 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.215.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e54asm16615975ad.13.2026.10.09.14.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:45:51 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] regulator: histb: add voltage regulator driver
Date: Sat, 10 Oct 2026 05:43:40 +0800
Message-ID: <20261009214404.722628-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009214404.722628-1-mmyangfl@gmail.com>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the voltage rails on HiSilicon STB SoCs which are
controlled by the PMOC block through a PWM signal, as described by the
hisilicon,hi3798cv200-regulator binding.

The name conventions follow those of pcie-histb.c.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS                         |   7 ++
 drivers/regulator/Kconfig           |   7 ++
 drivers/regulator/Makefile          |   1 +
 drivers/regulator/histb-regulator.c | 162 ++++++++++++++++++++++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 drivers/regulator/histb-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..18b86d69ad07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11910,6 +11910,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB VOLTAGE REGULATOR DRIVER
+M:	David Yang <mmyangfl@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
+F:	drivers/regulator/histb-regulator.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786..a059c5b2bafc 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -487,6 +487,13 @@ config REGULATOR_HI6421V600
 	  HiSilicon Hi6421v600 PMU / Codec IC.
 	  This is used on Kirin 3670 boards, like HiKey 970.
 
+config REGULATOR_HISI_STB
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
index 5a764cec8df8..a2efd2bc3e0d 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_REGULATOR_HI6421) += hi6421-regulator.o
 obj-$(CONFIG_REGULATOR_HI6421V530) += hi6421v530-regulator.o
 obj-$(CONFIG_REGULATOR_HI6421V600) += hi6421v600-regulator.o
 obj-$(CONFIG_REGULATOR_HI655X) += hi655x-regulator.o
+obj-$(CONFIG_REGULATOR_HISI_STB) += histb-regulator.o
 obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
 obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
 obj-$(CONFIG_REGULATOR_FP9931) += fp9931.o
diff --git a/drivers/regulator/histb-regulator.c b/drivers/regulator/histb-regulator.c
new file mode 100644
index 000000000000..c6d8defc81da
--- /dev/null
+++ b/drivers/regulator/histb-regulator.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: MIT OR GPL-2.0-or-later
+/*
+ * Regulator driver for the PWM controlled voltage regulators of HiSilicon STB
+ * SoCs
+ *
+ * May work on Hi3716mv410/420 Hi3796mv100/200 Hi3798cv200/mv100/mv200 but not
+ * thoroughly tested
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
+static int
+histb_regulator_set_voltage(struct regulator_dev *rdev, int min_uV, int max_uV,
+			    unsigned int *selector)
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
+	{ .compatible = "hisilicon,hi3798cv200-regulator" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, histb_regulator_of_match);
+
+static struct platform_driver histb_regulator_driver = {
+	.probe = histb_regulator_probe,
+	.driver = {
+		.name = "hi3798cv200-regulator",
+		.of_match_table = histb_regulator_of_match,
+	},
+};
+module_platform_driver(histb_regulator_driver);
+
+MODULE_DESCRIPTION("HiSilicon STB regulator driver");
+MODULE_AUTHOR("David Yang <mmyangfl@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.53.0


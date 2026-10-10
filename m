Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA374A99A3
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637246; cv=none; b=lrv3ujFI5yufGY3Q+KMYthX4igbiQcduz2zeXj00gkLgZN4n6x+GFB8q350oWTKsSz6UqmmzMYsE3hWKP33N/U/1+qh2YOYBcAPgl8wxqhahqMC/hj4Oy7GRBbwp89RzSmYriYjkbx/CXBFgV/3IAN9DfnhrKM0Qqazujppu1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637246; c=relaxed/simple;
	bh=HdygoRF6oEk1SkwGhEtVhXOCKvExlr02A9uruapDZTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=am259PjNfu4yO+BMnkraTcz6AGBaaRgj9kDIoIWR6Ad2jcGryEHTSfN/pt9kqw2e91KR8GOIg7Ty/kGs91oFLQx3fPrCY5879j4TXLaRspkx804HhnDYNWVy+3bOAL7FF7fxm/utP3eUKAdv7O+DXkKEcPl/yrHvYI0a/98AGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4jaYpr7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4jaYpr7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso4450575e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=E4jaYpr7OBgzFcwimWa8Mb5mwkCGoT0Z12NTki549AC1SLeSJA4fm6sPRLKJ9gLuQE
         pR+Q5ZLsRsH3crZDR9ENSb8zNzkW31NwKJ4w8juRksUBzy5Pr1Ehw69pzVS7Nk08mfSd
         wxrPqGXp+F0UdvhdrDiXFaB0g6SJaR9xC5jhwJkKzplTYswBA0E64MOb9JCZqZOBMQc9
         qeIo0y/fVTsoL08Cx0GglZstNjV0WFabdXlz92wYqsCJa7ovKelpOgP6rL4NjQCI6PI0
         TGSMdMICXliU/SQ0duG7KSWOkvkqQAWZuZgg/SVcKCUCAB927DnLUP2srfVHlZEBSc3D
         V9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=in7UaPxfffDsF4B7QQJvIEaXR0cgs5PNeoMdm10+6/4i7r3wAtpsZxkrsFi1BVRZ2S
         dl48tUx1dFK2pmlYWdKhJGqjOUIld7qVRhS2O55GNfERlK97NKo2G1KyiM1vwmqlLqQm
         mP4E1TOzef6QLZeMvUsvmoCovjZzhD2VAu0D8tQWuqDDu7Iz79U+pfAWGnIgw8VutcEF
         KdKHB62yPE+g+c4ZjFPhSRrfkZTLvRB5ejDnJp0wkcafCTxSf2fR3nVm9gP1p7PG4j19
         AkfH1HQsL79v4xc1wuyolZFaqEj3IRwBYxgU316xTLQ3duXxKqAFpfPR5oxZ6IU8edwh
         HrAg==
X-Forwarded-Encrypted: i=1; AKwUvBwGXxfL/NPHs8DSagm0K2hrev5CJNCb1Jksd8ryfXwA34ToxJoBktaCV9drUwc5yRsjCBKnE67ef48Uteo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy1X9ZhEW29BdqV5Qt5DmTEFrM5lLHnEIE+l90lT5ugpnkmEMM
	rXjEUwQX7nQk2FtKGo0JhHhw0L0XuMlJgAWUVIPiF/0gKFUpgM+HRZiI
X-Gm-Gg: AYBFou1GS0rSRiTPTKe0Lug8gXZ7mvxBWcUBO37ggEuNz2/5ts/sgX+Ox4tcrUAbVDr
	tfauyWUkn7T6FJaFuiE7f4Ns75WKShLLNVbKgJZQI4i1KPFYdh7YqxN0hnlG+JigkClDcBgPc0z
	Od8zm9wbLUWXw4dxGCOYnIZ4g+gfnuMJN0fCfwJZYZvn/u/gffkDEmP1Gbzh89XwCRyZq0tU+Od
	a1bMToBW0iSthsVcB+i/yFRE0B9Uj0ySFl59Asy6p+FJ63T6ScZ0fy7+yzSfcwlig8Hwbs/cqjh
	OHEc61NueCCNJp1NuIIZZ0SBAyGcoxzpsZPfMFZQDpKt9ruey5Re79jOpV8GkX+mlow7ZyIqUao
	ez2U5a7iD/OxHrbPwuO594gXaZMiCDUulf1ZWNyX+YE5/FRvfYfKUochoH9e7bjCJfql5v8fULS
	efbGFBWekg8CUMY51Gax+m3PPUywnRxrOz+cl/hymSP/r74dBpYz4yXOphzOqWlCechsmDbDu4l
	B87ujIBrXL3X3FLKFZOWGVQMrzxvxL6CF+x6LKFFkWx9dikzLFYkpGHI37lg26iqFMap7xcG45Q
	uUgtGEOXcwX3KjCGGM4/1njqdK2jsbfzoTn0g8AEDF/dLsjZQFu+8OuQkMN4Kg==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr88069255e9.16.1791637238622;
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sat, 10 Oct 2026 13:59:47 +0100
Message-ID: <20261010130024.177503-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the six banks using the generic GPIO implementation and enable
the register clock before accessing the bank.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/gpio/Kconfig          | 12 ++++++
 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpio-zx279128s.c | 78 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/gpio/gpio-zx279128s.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8e..3ae51a3c10 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -902,6 +902,18 @@ config GPIO_ZEVIO
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
+config GPIO_ZX279128S
+	tristate "ZTE zx279128s GPIO support"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select GPIO_GENERIC
+	help
+	  Say yes here to support the GPIO controller of the ZTE zx279128s
+	  SoC. It has several banks of 16 lines each, which boards such as
+	  the ZTE ZXHN H3600 use for LEDs, buttons and reset lines.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gpio-zx279128s.
+
 config GPIO_ZYNQ
 	tristate "Xilinx Zynq GPIO support"
 	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b..a57ed7ec71 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -223,5 +223,6 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
 obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
+obj-$(CONFIG_GPIO_ZX279128S)		+= gpio-zx279128s.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
 obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
new file mode 100644
index 0000000000..8f37b908bb
--- /dev/null
+++ b/drivers/gpio/gpio-zx279128s.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s GPIO controller
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/*
+ * Each bank has 16 lines, one bit per line in each register. The registers
+ * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supported
+ * yet.
+ */
+#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
+#define ZX279128S_GPIO_DATA	0x14	/* line level */
+#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
+#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
+
+static int zx279128s_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_generic_chip_config config = { };
+	struct device *dev = &pdev->dev;
+	struct gpio_generic_chip *chip;
+	void __iomem *base;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
+
+	config.dev = dev;
+	config.sz = 2;
+	config.dat = base + ZX279128S_GPIO_DATA;
+	config.set = base + ZX279128S_GPIO_SET;
+	config.clr = base + ZX279128S_GPIO_CLEAR;
+	config.dirout = base + ZX279128S_GPIO_DIR;
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
+
+	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
+}
+
+static const struct of_device_id zx279128s_gpio_of_match[] = {
+	{ .compatible = "zte,zx279128s-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx279128s_gpio_of_match);
+
+static struct platform_driver zx279128s_gpio_driver = {
+	.probe = zx279128s_gpio_probe,
+	.driver = {
+		.name = "zx279128s-gpio",
+		.of_match_table = zx279128s_gpio_of_match,
+	},
+};
+module_platform_driver(zx279128s_gpio_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s GPIO controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57661486424
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962587; cv=none; b=nevWRQfE6Ol3EqnZLJe4e6IRXzDKDkTAOL+DH17wG22jHSZNTgqLDVxBPBvj/Y8sG6wMMsA4IvgbhCaLEXUkQY5vNUY/2yy3KTRQ7O6w4qPCX/CpVd2a7jeHASeI86QcWaF3WdgoGavgJuGVFseKEHUtJUCxVojudm7s26RDGIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962587; c=relaxed/simple;
	bh=WJKB5AqHEZTsvrW+lSioRC2HMOJVGvkqGyxHuzZ1YTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTkfiofu6EYllue3K62rIKSYwQxxjxEDhSalTffz8LvsvgeeS18MvjriDwxw4Vv1ZFPf2cJzmUG0xzLMdCa2lWVksIISbbrmtADBb/JzLHlamgF0CnsgPk7V4xEVNAISQHcYG+YLMceNGb9oP1wIR65zhywYBYhzAuBCxgLLCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/z7zsmF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/z7zsmF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afe75f055so88977f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962579; x=1792567379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pGbuhM4bK1nzx8/KQJOMrqGkDCt/rhGN2Bb+/oVkck=;
        b=C/z7zsmFrZQobTdY5GOBNRE7N9CahQys6G1QHEdDmMFSBsiWK7t8r5htVuNHxG9eA4
         NwjmtVJ8HGYON7C/9iokncFYJnarUhnund3ikm4Wp0S3Ezqvlz4JZy0DF/THaYj82ktd
         M5dZPFB9AzDM8bkVnWIIcRult7nurbir0vsYG5ZhPOpvTP95kqPTgwrTNsrnFa7W4PmE
         7fcVwFjP6LV9V0aD7zco83pvaaliX+fvpUvg3+py1ExpSg5zAVAOL7w/IogJ2zNaDNyh
         +qMMBEknS5/5JFTfgBh5+DJRfJUalasOcmqlQRQr6JIIvJsk9CwNVPVBWJUHfH68RDnZ
         krpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962579; x=1792567379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pGbuhM4bK1nzx8/KQJOMrqGkDCt/rhGN2Bb+/oVkck=;
        b=Q2T3+jfVqFkf39nAXXD8Qna70qaV4H20sVvmNjONj/UxX8RYQQH3Xgwa8BpKJcrW8P
         x6vGYy0f15oI9ODq8eeqxpXzQMwrXqzydtxtOLDIXEaegxLsRHEyBt4fthRZbqOjU7BF
         F3gJs7xbogF4HCTvogGY06ZZML2HfficQO1b/2pPq9E3jnlNkStdvTpSC6Y3bj/Bq5x5
         n9414J2pKpZZcirEBxXAIBP723ktsnRorivDvcllM7RwjFRvo6+3OQLQ7DhAdPm5a6Bp
         2xxZP+d+xD+fe550fICjnP0HenUPX+BNqQrKpTQuHsgRSYpdWAUfPZJ2aThdjUuX54Sp
         UqWg==
X-Forwarded-Encrypted: i=1; AKwUvBzN2+9R9tL9S9j3a2iWcdUPalOCbVPxDhk7Lq6LcEW96sgUdQLsv2qHxmh9aoexLuvb9RW+sIoReZZR1hQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcPxEZVSwYjaurrHD0YcD8A4ePepwnrKVcs9uUOD1wge/C+jLR
	D+dIeKM5fFdyF9PqLEjxp7ySMqV/Z2C51/Y1K2FEGrWJ4vunsjTWw5Wb
X-Gm-Gg: AYBFou2Uxwm52eYf190fLse0d+htCPnnhoxW38RMtMYoQz7Dze0CKvTc9elwZX59iXS
	IBO7AygrcPeRH1u1Q8EuptvZLy9I0ai8dE3Kwh4YepWSxYv803EfGavgEYQA2wXmPtLEvEAt2SN
	rzPnU+d9kIUZvpUGALbyolMrMahdc/yTc0SR0gcoxN4yjACvaX2QHxbP495GyFpE839ImXCA6gj
	FFxA1fLAsPHBItL74gZLUWi4/j4+kLL/Q1GlhkVQlAALTdHK/1z0/Iaj+dg7qvidqlS3JyE3TQb
	frJuxSLW4ZNcxNweR14fCrNJOThhVkWQH53rwzMtbPIabT2B4vrESa21uWwEHAAXON8YIEjzTQb
	zq+8a9r3pQXeOTa54jZD0mfwjxTbpHXWa+CpouZqlFemR0lY/W2MyOX3oDrbWyTwpgaxjo2WhFg
	kV9UAv3rDm+EZfvDyzsLR2Ki74xBGDaeo5TrtrEItf8Yc9Uv8ra02eZs941ia+zJOrR3AYdmvoo
	giWgecffZjfKoQtanuZEDwVmxIO4EtGlBDGNJbN20B+Rgp37mt/Xgd+y+6cGLM3p/LArxQtUOA8
	rsJ/AFn2FC7RQlEylC3O0ue9ehrFGo9eMMnbj5v1l0x34k8DylwGMfiRgcVwAA==
X-Received: by 2002:a05:6000:4b0b:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48dbaaef91emr28940606f8f.31.1791962579326;
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:58 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 08:20:48 +0100
Message-ID: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the six banks using the generic GPIO implementation and enable
the register clock before accessing the bank.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/gpio/Kconfig          | 12 ++++++
 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpio-zx279128s.c | 79 +++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
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
index 0000000000..71eb6b5d82
--- /dev/null
+++ b/drivers/gpio/gpio-zx279128s.c
@@ -0,0 +1,79 @@
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
+	config.sz = 4;
+	config.dat = base + ZX279128S_GPIO_DATA;
+	config.set = base + ZX279128S_GPIO_SET;
+	config.clr = base + ZX279128S_GPIO_CLEAR;
+	config.dirout = base + ZX279128S_GPIO_DIR;
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
+
+	chip->gc.ngpio = 16;
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


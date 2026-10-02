Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038A148A8D1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936063; cv=none; b=jrwWa0d5g3UhJE7Ja7LLbbVPYPhF6qzkfEOZ+btoQiYHxHAowqVPjQH671eKESVU7D2Xz84mbyxdoGFNF4XmZ2sHYDgsUZ5HtNRX+L7DO5FSgb2e5n1HHcWDhr2MuCK+w/qTa2RTW+qsPpu+L1UbIo/DAb4P44Nq38tOcvMhJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936063; c=relaxed/simple;
	bh=bQy5JpM3Y5NfxXIwj7fzpqEP12bzJrf61wAcsSTfQYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TaZn2XErDpLtYNh2I7Fp0IbuyEdxoLl/w8rg/e2l3zNiYGQcgbfwNWYRIYmn0cW91vS/FYL1rGz9IrZgmsixirt/tV9uJInPJboLDaPmrd5tM3o2oabi1zTDLXTRcWs8qDyF5P2GWV8V7s3rLYVLQxaJVqBc8/M2kuKR4kWqfos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkDa7bqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkDa7bqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8081F1F00893;
	Fri,  2 Oct 2026 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936061;
	bh=pT+ZnRpoLxk64dFOjxlzE7oGUChV9PsbvXJQJEtcyIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hkDa7bqP+7WYS5vVd4jJeng+GwdI3PFn2xy4VVLrTqQEyB99IZI7ijJ+GudqLt/jF
	 Wyomra21ISLBf6KRKas6eMdL8nPQ7xIzEE+jBqRwpjk2TN0qgNyw0fies0+w0MDXDH
	 VzW/YhXRpLXGX4eqMD4+UUvKp9HkdlFnZbnFa+MfL7hDoP3kvnX9tfSt5DLREH9cEI
	 gq6Il0Zq70yfpBWO2WLU5CvadGtF6+D6UHe18dxz/oyXqJJv5KerE2UBKloowrtlas
	 gY3fwD5Bi01dtOkyGKisPU49wDeKehdHOh/0ezCvQmtvL2OycfHQQb9R7RJlRECPiR
	 pz0NFajZoMGCw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>,
	Ben Grisdale <bengris32@protonmail.ch>,
	Andy Shevchenko <andy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 7/9] nvmem: add mt6323 PMIC EFUSE driver
Date: Fri,  2 Oct 2026 11:13:50 +0100
Message-ID: <20261002101352.1084447-8-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Vivchar <rva333@protonmail.com>

Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
thermal sensor calibration values.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 MAINTAINERS                  |  5 +++
 drivers/nvmem/Kconfig        | 11 +++++
 drivers/nvmem/Makefile       |  2 +
 drivers/nvmem/mt6323-efuse.c | 83 ++++++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 drivers/nvmem/mt6323-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..6ec0ed61260c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16718,6 +16718,11 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6323 PMIC NVMEM DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+S:	Maintained
+F:	drivers/nvmem/mt6323-efuse.c
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index df65e7ecfa21..083a5e528960 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -328,6 +328,17 @@ config NVMEM_MTK_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called efuse-mtk.
 
+config NVMEM_MT6323_EFUSE
+	tristate "MediaTek MT6323 PMIC EFUSE support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MFD_MT6397
+	help
+	  This is a driver to access hardware related data like sensor
+	  calibration, etc.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called efuse-mt6323.
+
 config NVMEM_MXS_OCOTP
 	tristate "Freescale MXS On-Chip OTP Memory Support"
 	depends on ARCH_MXS || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2bbfb9ff1885..5e70bad9f0f9 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -53,6 +53,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
 nvmem_meson_mx_efuse-y			:= meson-mx-efuse.o
 obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
 nvmem-microchip-otpc-y			:= microchip-otpc.o
+obj-$(CONFIG_NVMEM_MT6323_EFUSE)	+= nvmem_mt6323-efuse.o
+nvmem_mt6323-efuse-y			:= mt6323-efuse.o
 obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
 nvmem_mtk-efuse-y			:= mtk-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
new file mode 100644
index 000000000000..de5e30215c22
--- /dev/null
+++ b/drivers/nvmem/mt6323-efuse.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6323/registers.h>
+
+#define MT6323_EFUSE_DOUT_BASE	MT6323_EFUSE_DOUT_0_15
+#define MT6323_EFUSE_SIZE	24
+
+static int mt6323_efuse_read(void *context, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	struct regmap *map = context;
+	u16 *buf = val;
+	u32 tmp;
+	int ret;
+
+	/*
+	 * A manual loop using regmap_read is required because PWRAP is not
+	 * a continuous MMIO space, but rather a FSM that doesn't implement the
+	 * necessary read callback for the regmap_read_raw and regmap_read_bulk
+	 * functions.
+	 */
+	for (size_t i = 0; i < bytes; i += sizeof(*buf)) {
+		ret = regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
+		if (ret)
+			return ret;
+
+		*buf++ = tmp;
+	}
+
+	return 0;
+}
+
+static int mt6323_efuse_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6323 = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.name = "mt6323-efuse",
+		.stride = 2,
+		.word_size = 2,
+		.size = MT6323_EFUSE_SIZE,
+		.reg_read = mt6323_efuse_read,
+	};
+	struct nvmem_device *nvmem;
+
+	if (!mt6323 || !mt6323->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get parent\n");
+
+	config.dev = dev;
+	config.priv = mt6323->regmap;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id mt6323_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6323-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt6323_efuse_of_match);
+
+static struct platform_driver mt6323_efuse_driver = {
+	.probe = mt6323_efuse_probe,
+	.driver = {
+		.name = "mt6323-efuse",
+		.of_match_table = mt6323_efuse_of_match,
+	},
+};
+module_platform_driver(mt6323_efuse_driver);
+
+MODULE_DESCRIPTION("MediaTek MT6323 PMIC EFUSE driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


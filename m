Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753023;
	b=GuRh6aYK5xOiVnMByJkAsnlVlp7qmnF5bFqGbk9T8Sf5giEdnl7uR7WrMDr+T2aEdDoD
	 S/N5qAhrL4L8vix0DExV7zRprM5m7C7Cl5JBqXYTuza+XW1DQYEunNuc5OLMnON0wO0K7
	 TSIpqEvn4GdT4bt8wWCh3A71nmszvRp1G4jB8Y5PaB3PTiqUtSSMOWXyOE7SJcFwqZUYC
	 kay8pZMu+czo4hJpFrInzxUDUCUxT5y5H+Z2TkFfaX6twl3reLEcEDGpCtU7eciaDsUQO
	 F3Q/AF73GZxfCY3ethH11KVRzFVIiLfDMKu5b1vxpl9b+wdm10OxW+S6flp8eaOSVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
	b=cKtn+RWbaOoifgsGht2C4RgoI77JJki9+k0Yib4mIDDa+nlWVubKmZ/vj4lEPa9w8eqZ
	 GO2SiC/MN57dPM5FQGL4KedzJhk4flhh1zQw68+kK9jIh01tna1rgQiwJ8XDpPE8JEQP2
	 GFGaIOrPv08ptbIzb+OMgQXQin4qbV4/m+N4FhcLagTsVbhpQABlhor1v6e1xiYm2Hc9G
	 Tw1FzUeb910ifzINkxIK0sOd+iQEqkG9F8SzWZraDx9cdACFJRqYisuNrhQwAj1lAy6Do
	 ZX0PKneiQU+I5ebiH/Y+mothy51PFqVzv+81/Rn9VmaE7nQVIhyuqvhCl31tfYMjtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="ol/KSp7X";
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A6606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31A6606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ol/KSp7X
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso59594fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753021; x=1794357821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
        b=ol/KSp7XVFdVB01YoQs2MELzWYX2ZjphzCP8oTbpmssndfxcHCScswHIBo0AfzFPVj
         fQsRsxnRk9iDn3sldoJqsb587cfjPNtNNGCdfq3frTgV/bXXb+b3WZTBSG1YolHqoZFI
         HApixlIWrd/821e903wFbAHqSPuUSIXxbJ9J/a42vIQOv9pl3Ccg+CkSnulFH6/ppPzD
         RRm/kKo4ARO48rgKR4joXpyQJUx3kdI6f/M3If8QV8jEnyHfiCwj0aswzP23DjldMaVj
         9jt/mJr6EPJ8D+LIb7d52BVX5TiUW8Hw82L8M2ow1aVgXPpv8k/da/y5TcanQZqkJ1e2
         Jinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753021; x=1794357821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
        b=Ns7tx4sFP2QfFUCgWQDuB4fKaGMY8zcQhSuxFve9lYuEbUe/Rg4Rt3UkR9Zgw2zvk7
         1W6r21ufCQ2SF2bR9uZ/MBp5FcBmRhk2I36EiY5NBUyraJQb/pa4uMNh4d/dwmnBZ1ZK
         gjTFOx4t0IGYHZl11djzypOzUhmTs+mhDk2dcS/K2RgRY0hIE0KccbO4KiQkYJ3FR3GH
         c8LwkWuYU3p/Bv/whEAruy+qp0rPL9OCQz4cXxFjsHrPD9E9j+P71NMe5bu2F7JvM85N
         pcRglM3QC2HwHa7O6S+AmTrAFBr71oONLj0yi9l0slpCfVPzHOR9LtB5SMmJdmcSpd6c
         0Gyw==
X-Forwarded-Encrypted: i=1; AKwUvBwEEy1IDEhoTQVZwBRHmj49gy1KmiLXtvFft8xX42ndAQ6sEqeeYv+1HHoxggJeWMPnLqB8StR0Dt+315U=@vger.kernel.org
X-Gm-Message-State: APuU4Z82QpW9eQAJ5BqTOazkqHHMCNmin2t9q3958/socpxji8BcA4Fm
	RfATtImGbQljxnC1ewmxvp9Gr+UXHe0jbBRmx4Rld1KaWW7F1VWrY1GkqnyAeczEhEw=
X-Gm-Gg: AYBFou0Klis2uOTjYawCV+WixzX2biMTE3jW5zi8sUhxNbt2OW9lzvNBQd1pvHMhMWe
	UghxKiXXYhd95PxYmMLBfRvUl7jZFQwxNi2ARFaw/Sj8k3Gc5KJqMVLOgk5ooeQG9TVZzpKc9qi
	k4Ky25fHGoBhjm7mHl1yJs+A8MxEQt2+DZiywKaXEtqR3+5i3iQ1uBy3HyVnjMGaxL8RWjnqntO
	s06xXvTahRy9w70yRDb3SgdUJgQCycB6Ob2RrHdtYvfQdkypiqoxM1XaBMTI+9ETnb/8Xa2UO/n
	afacjORsymdguAFgFLo0OEAQ5Lps+SzDC90txXq1+gJ+w1/A1OoPUEse1m7lMC3MrRhaPappu3d
	uUJtaRTTDUBSLXWsO0h4CUMsZ2DkicWUhyqT2DySXtLmLPTcy3stVRrV8uTlAWbQbf+0G2ZU8oA
	V2u8W4+q/slEbhb8dvdMQU/S4CQF8dNAFLFCDjOmr+RuIYnwFW/JMXeVGesBdfwTnn5Si2d+BS3
	TdVUwzxqXquXpWSLmZoPIuvODji6WRKzV22UWFp0G83sbE/pSf8WCQnK8RZYlY5UMOIfGPCgWx7
	QQ5UP8v+5TxfFALNxzY/vkl4t90FteghXCU=
X-Received: by 2002:a05:6870:16f1:b0:48f:e0f6:c45e with SMTP id 586e51a60fabf-4a907722e6fmr9609953fac.44.1793753021390;
        Tue, 03 Nov 2026 16:43:41 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:41 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] reset: toshiba: introduce a TC9564 SoC reset driver
Date: Tue,  3 Nov 2026 18:43:31 -0600
Message-ID: <20261104004332.2141282-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
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

Define a new platform driver that manages reset signals implemented by
the Toshiba TC9564 SoC.  There are 13 reset signals available, but
currently only the resets that are (or will soon be) used are defined
to be controllable.

Two registers manage the state of the resets.  The registers are
accessed via a regmap supplied by a system controller.  Access to
the memory region is provided via a BAR on a PCIe endpoint function
embedded in the TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                  |   7 ++
 drivers/reset/Kconfig        |  12 ++++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-tc9564.c | 135 +++++++++++++++++++++++++++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 drivers/reset/reset-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ee01aed56508d..8389b11fe6e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28355,6 +28355,13 @@ F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.ya
 F:	drivers/soc/toshiba/tc9564-syscon.c
 F:	include/dt-bindings/soc/toshiba,tc9564.h
 
+TOSHIBA TC9564 RESET DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	drivers/reset/reset-tc9564.c
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f3..8c1b08f4eebe6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -358,6 +358,18 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TC9564
+	tristate "Toshiba TC9564 reset support"
+	depends on SOC_TOSHIBA_TC9564_SYSCON
+	select MFD_SYSCON
+	default SOC_TOSHIBA_TC9564_SYSCON
+	help
+	  This enables support for the reset controller embedded in the
+	  Toshiba TC9564 SoC.  The state of reset lines is controlled
+	  via MMIO to a region managed by a system controller; this
+	  ensures access to the region is coordinated between this and
+	  the clock and XGMAC (stmmac) drivers.
+
 config RESET_TENSTORRENT_ATLANTIS
 	tristate "Tenstorrent atlantis reset driver"
 	depends on ARCH_TENSTORRENT || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3f..6ddded26309ef 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TC9564) += reset-tc9564.o
 obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
new file mode 100644
index 0000000000000..fcd58d5f1962f
--- /dev/null
+++ b/drivers/reset/reset-tc9564.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/soc/toshiba,tc9564.h>
+
+#define RST_CTRL0_OFFSET	0x1008
+#define RST_CTRL1_OFFSET	0x1010
+
+struct tc9564_reset {
+	u32 offset;			/* RST_CTRL0_OFFSET/RST_CTRL1_OFFSET */
+	u32 mask;
+};
+
+#define RESET_INIT0(_name, _bit)	__RESET_INIT(_name, 0, _bit)
+#define RESET_INIT1(_name, _bit)	__RESET_INIT(_name, 1, _bit)
+#define __RESET_INIT(_name, _reg, _bit)			\
+	[RESET_##_name] = {				\
+		.offset	= RST_CTRL ## _reg ## _OFFSET,	\
+		.mask = BIT(_bit),			\
+	}
+
+static const struct tc9564_reset tc9564_reset[] = {
+	RESET_INIT0(MSIGEN, 18),
+
+	RESET_INIT0(MAC0_MAC, 7),
+	RESET_INIT0(MAC0_PMA, 30),
+	RESET_INIT0(MAC0_XPCS, 31),
+
+	RESET_INIT1(MAC1_MAC, 7),
+	RESET_INIT1(MAC1_PMA, 30),
+	RESET_INIT1(MAC1_XPCS, 31),
+};
+#define RESET_COUNT	ARRAY_SIZE(tc9564_reset)
+
+static void reset_manage(struct reset_controller_dev *rcdev,
+			 unsigned long id, bool assert)
+{
+	const struct tc9564_reset *reset = &tc9564_reset[id];
+	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
+	u32 mask = reset->mask;
+
+	regmap_update_bits(regmap, reset->offset, mask, assert ? mask : 0);
+}
+
+static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	reset_manage(rcdev, id, true);
+
+	return 0;
+}
+
+static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	reset_manage(rcdev, id, false);
+
+	return 0;
+}
+
+static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	const struct tc9564_reset *reset = &tc9564_reset[id];
+	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
+	u32 val;
+
+	regmap_read(regmap, reset->offset, &val);
+
+	return val & reset->mask ? 1 : 0;
+}
+
+static const struct reset_control_ops reset_control_ops = {
+	.assert = reset_assert,
+	.deassert = reset_deassert,
+	.status = reset_status,
+};
+
+static int tc9564_reset_probe(struct platform_device *pdev)
+{
+	struct reset_controller_dev *rcdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np;
+	struct regmap *regmap;
+	int ret;
+
+	parent_np = dev_of_node(dev->parent);
+	if (!parent_np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	/* Note: MMIO regmap (no error checking needed when used) */
+	regmap = device_node_to_regmap(parent_np);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get config regmap\n");
+
+	rcdev = devm_kzalloc_obj(dev, *rcdev);
+	if (!rcdev)
+		return -ENOMEM;
+
+	rcdev->ops = &reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->dev = dev;
+	rcdev->of_node = parent_np;
+	rcdev->nr_resets = RESET_COUNT;
+
+	dev_set_drvdata(dev, regmap);
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
+	return 0;
+}
+
+static struct platform_driver tc9564_reset_driver = {
+	.probe = tc9564_reset_probe,
+	.driver = {
+		.name = "toshiba-tc9564-reset",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_reset_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Reset Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:toshiba-tc9564-reset");
-- 
2.53.0


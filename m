Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753021;
	b=P3pnL2xaTwTDuLRwkAQBztOAOlX+wWZLe+4nG39R3qUjOjJn7uO05zvJn51T2f0YVO+y
	 Iy8WunfcFktw8AdhaTMHSobF2p7OJGwhlt9IsowkshAOVJlhCaysecANqBpcoeEtE6ILj
	 HQD16T0a4uorDTgxsEDEclfkSfXXs27WdSUXfD7aFsu8+6LeiI9hjSK2cSp/bEidxQKAO
	 3FwFq+iQ2JE4YIAUtRYMHdY+m9fvg3gZggFnApOFWxuqS8ewcKveCGpujO2vJQW7ep3ps
	 lWqA4gXPyThCaB0aWwGz39B6U06813sgXPIz7EC1mdGLNs4wNsTzP31gcTcdxAWXj7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
	b=f0ZldC+r2mSOzrjWWW+sUeW4r7qVe1yGTEIHQr8CSEFVwOcK4F50wZDaRzbGBX9FwumE
	 0xJhxyuMdb9y3DLYRNl9zzNVLlUUfk3MUka8hN2C1ElbMbVOOYgabNUnJt+uNjBZu0pvh
	 Ok1ZD/LoK8RkPH/LoqKa41bvPrkfHhPkY3jmDv6e/KnONO8uAJ3rmZ7CCzDCvm7SfnUJd
	 P5ms0O2S4gY9W9baxFtDRlxCcrlc54W8tNVgevldXgWEjbJZBlWoVwMKamGQQgO3Jahzv
	 fcknGufd3BG1BxRuzcufAvVLgwTays/xt4FHr/yRGBIh33+czbnR6cAkTZSHJx/e/Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KWK3XuMX;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DA606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KWK3XuMX
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4911df1e196so151032fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753019; x=1794357819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
        b=KWK3XuMXQ8W4uCZD+je8QaoQeIPXxP00bQKLEv9CtpgbFTTK/7vXJtV9zFnaxouzr4
         S5XAsqG2x2PLiRtbLJmmzK+YhUwM6oA6X12z06ag8yidBc8vBMo6EySplTKAHjHngOVC
         jkuxtBTKv7bUwGuSX+BRD/ghD2+sPrG8T5MagqoHMMRQPLEvh5zyYcfBFqEaw3KDTmA6
         3EHqwScSuBwC4cf9LWIQ4+2cwOse0iLnl4wBS821TXtLcZfRhTIEWWMGmy40H6kb9guV
         nWjyEnCYFC7aJlVdQRGJGfKWQFvq8IgsM3fGhGFkLXo0SlS74e/oA/NxJxxvdhygbSqL
         8H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753019; x=1794357819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
        b=rrYe7yDv7ZA3rDBtF0g3j3fmvT48lc8zF9GHaa1SaK44e5Ifhllv5tNqf381Pektlm
         nfUI0z+Ehsw0ZGcl9+yVd9a/ZNu9dGwpSD4pqmCMqxXtlSTCAy60O5vLdyDJDIyWqJ+5
         U1UwiIWb5u6rNTKJzGH1RDlGvmln+XriNN++tVysG6R9I61jvFpCxKylWE0Te8XuZn4p
         wDbAGxHJZ8npCtHShdBUNyTzCUt8782B8bpv2Y+ziLG5F2fgjcBO6jNU2MMT7uhwII+u
         nEoT13xoX9GJrZH7j+G8F9d1iKZKRl/YEZo5+QRsaZaSKiXoMXanCnFdCsNy/oSHzwLf
         Xq6Q==
X-Forwarded-Encrypted: i=1; AKwUvByFaxZXOmrhC2eijz8Br/6DtkdjzWc6bA4qxpl0aF6VMC1kwxSqiSeTVYembX+VRSc4gLLR8Qif1Go/Reg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fS9Itb2PMmzMdvQzcmo3tl30gB6E+Ww2MBLc+IOVxXUHwZ49d
	2xvRYmGsUdM+TJcHFQT3/r8sGzZKt/A/2sg+y0v14v53o/ICLenlxLjdT9Q3XK2GvrY=
X-Gm-Gg: AYBFou1m7gUjfHDgbvft272h/wadJStBYCuCoWwLxASzLpm9cmFt2zOhrkkthx4nFTs
	DPMaxOfg/2NseqDFGViJ5e1FOOS2T113FxTfc+yVC4KDQvLwdWkv3+7HqkPl92L6QHn9Qi4Udo8
	kKptx26CA5MTm8CzPV6UvU2VW2l4I5T/PpnCdl3yPiyhuYIgtNkkPAXIn5KN83meqImY3ngVWpS
	Yhba5pQ8rAyalqYKe25ijAoKkbfxdEotamWP5GASlpFRoOLxwvWG+PF7LxwuTovFI1UVsKSHoor
	/BuMKCQR7yIm/mqhmjr8CXC4PCTJBU7mKaW/7GdGGIGntdqxAXKXPbfT7ElxTg0gnJDvIPepN1v
	xpHkQktFnZRQxV9/AsDgIj6dLzI2n8R1KMLqh/NyXzVsXDIVvaeVdN1zWGiz+dgNyzLxXCxzNdV
	l+LZFMcXPmEhcYLwb1WryN5tuimUKEPHrc71H5Qa60X4JB28i9pA5BM+3Y00iQCzLc1EKdp7F/D
	p7ZcRHkY03Xzjr2jv092XNu48OLqcVs1TPf+JMzlRUybKnqEdlZoosRpAZX97uE6+thPLWxVUb1
	ZT91spnQecgy2wHn07Sc2OyutTC+5U8jNhs0q50UW/gwgaBjSUVtSM8=
X-Received: by 2002:a05:6871:284:b0:475:e235:8fc with SMTP id 586e51a60fabf-4a9076716acmr8645005fac.26.1793753018893;
        Tue, 03 Nov 2026 16:43:38 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:38 -0800 (PST)
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
Subject: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
Date: Tue,  3 Nov 2026 18:43:29 -0600
Message-ID: <20261104004332.2141282-3-elder@riscstar.com>
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

Introduce a new system controller driver for devices found within the
Toshiba TC9564 SoC.  The system controller manages access to an 8 KB
region, and implements controllers for a set of clocks as well as a
set of resets.  The region also includes registers that indicate when
initialization is done for the chip's two Ethernet interfaces.

The SoC has a single 25 MHz input clock, and from that derives clocks
of various rates used by functional blocks within the chip.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                         |  1 +
 drivers/soc/Kconfig                 |  1 +
 drivers/soc/Makefile                |  1 +
 drivers/soc/toshiba/Kconfig         | 12 +++++++++
 drivers/soc/toshiba/Makefile        |  3 +++
 drivers/soc/toshiba/tc9564-syscon.c | 42 +++++++++++++++++++++++++++++
 6 files changed, 60 insertions(+)
 create mode 100644 drivers/soc/toshiba/Kconfig
 create mode 100644 drivers/soc/toshiba/Makefile
 create mode 100644 drivers/soc/toshiba/tc9564-syscon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1b29169e0e9..c25ee6e0f1c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28345,6 +28345,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
+F:	drivers/soc/toshiba/tc9564-syscon.c
 F:	include/dt-bindings/soc/toshiba,tc9564.h
 
 TOSHIBA WMI HOTKEYS DRIVER
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 483cbdcae1534..f655d368e0fb6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -29,6 +29,7 @@ source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
+source "drivers/soc/toshiba/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/vt8500/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 5a3efd68355cd..150f7f4f05560 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -35,6 +35,7 @@ obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
+obj-y				+= toshiba/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
 obj-y				+= vt8500/
diff --git a/drivers/soc/toshiba/Kconfig b/drivers/soc/toshiba/Kconfig
new file mode 100644
index 0000000000000..91adcbe71905c
--- /dev/null
+++ b/drivers/soc/toshiba/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SOC_TOSHIBA_TC9564_SYSCON
+	tristate "Toshiba TC9564 config system controller support"
+	depends on TC9564_PCI
+	depends on MFD_CORE
+	default TC9564_PCI
+	help
+	  This enables support for the config system controller for the
+	  TC9564 SoC.  It implements an MMIO regmap to manage access to
+	  two pages of I/O memory, and serves as a clock and reset
+	  controller for IP blocks within the chip.
diff --git a/drivers/soc/toshiba/Makefile b/drivers/soc/toshiba/Makefile
new file mode 100644
index 0000000000000..18dc03507b320
--- /dev/null
+++ b/drivers/soc/toshiba/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_SOC_TOSHIBA_TC9564_SYSCON)	+= tc9564-syscon.o
diff --git a/drivers/soc/toshiba/tc9564-syscon.c b/drivers/soc/toshiba/tc9564-syscon.c
new file mode 100644
index 0000000000000..0d0e2422b82d0
--- /dev/null
+++ b/drivers/soc/toshiba/tc9564-syscon.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell tc9564_config_syscon_cells[] = {
+	MFD_CELL_NAME("toshiba-tc9564-clock"),
+	MFD_CELL_NAME("toshiba-tc9564-reset"),
+};
+
+static int tc9564_config_syscon_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    tc9564_config_syscon_cells,
+				    ARRAY_SIZE(tc9564_config_syscon_cells),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id tc9564_config_syscon_match[] = {
+	{ .compatible = "toshiba,tc9564-config-syscon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc9564_config_syscon_match);
+
+static struct platform_driver tc9564_config_syscon_driver = {
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= tc9564_config_syscon_match,
+	},
+	.probe = tc9564_config_syscon_probe,
+};
+module_platform_driver(tc9564_config_syscon_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 config syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


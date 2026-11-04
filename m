Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771940;
	b=gZSg1m+AMRcHUv6leKO8XtmpXqjaX0h2F1m2nyxA3jHm2mqdOxOfj2yMPBQhwE4lGE1a
	 8lFfioOdB5FunjJbaH0Yu7jX97TXZSs6SUQNGSZ0emN/83ewlvVRzkwxc5xnz1sv5P9Dk
	 JhRtIKQaYKUV7jfR+ZgZ63tQWWszf+sc6ovaMyE7g62fVWM1P5d8cIlcXBALTVuuqMtbp
	 vU/E48KaHBnGZ6IKJCh6IlBzwjhOGF8R5I3YkY92gwg+oaSP6KopBROnvpFY6bZ2T7wSI
	 6q6qalA8oyf0ux/+BrTgxlmRGHMsneK4SRKK7lalWsldk0vhYzZbLrWl9FvYcWpcL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
	b=BRwiVx4BNCoPNUt8mOam1Ee7rbM2XToBHb4V+aqNmPwCM3xPH1xiIDE+tqme+/4F3nwq
	 LfnXXYppUTcguUnFts9ChUUgQrIQjGxdbCVyTVRS8WMligpUAfwku6clNt96F9r5V71nh
	 Ev54dLPVkcBH0sX5aAJgMtMy6ElemdyIY6vukxhhYrnvjv/LlIlgh1erWEoO5AwLN2+sO
	 w1h+junIpw4JlhEETtUUGXUM2pn6muC+DkGxSvxQHhS5kw39CapJIVau1DWklUV0aS9e3
	 LN1LXzpNgS2vP/uWY/by3WSRSUvmeF6HT/YOxkELZRy5bUIF5D4ODZFGOcQDvj+Zr+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2PEFlIz;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CD606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2PEFlIz
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e831e86ebfso2160315ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771939; x=1794376739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
        b=S2PEFlIzgh2X2Wc5fr8YtTq3cIE0JGCGFsB9fd64iC2Ww1RpV6S/0+NPTQQ49m5Jt4
         ROvi0xEvolfAg6ZHzAn8+RKeJvo9CXzozzdbJhXfVtbDG59rf1fi72DGwybneL8epE7z
         QGw4Q3AvPXGqYe+A2Ly+24bfqezdU/KZX3jBjCto6xuwSjteIyzFraIN6wc/sIWc2Wec
         S3pvn2HR3s/SEZk89XChrKCS1Oid12QawqyjSsdQVmdeouDk2RKFoD9gjgpCnLRNwCvk
         p1p7y95x0RNVciS1oEvsEQC3PAjlIOGtHh3gaAWTNQtyNz2BuGYKxrvmH3keJyTe6kyO
         Crkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771939; x=1794376739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
        b=iz0R9bZVCEd3VkkCDH1d0yACrKPLf73HgqnoHci4ATjrheituDl8xxlEwZ4rCrT9fr
         bVMfrJUngn0lfBOEEK3zBf24Er6awv6tNmykn/4aNjyukjdRJ01DJkA04By6se/VwRkR
         jvptc5eNp+PA2g07ywB4OAYDE5gMdMRn8orpWPAD9de9qt4sZAxxEWFFS02QdAmCQ7pQ
         czakVmiBW8zbmqeIrQI3utBrjkkZvu7uTdIR2/8x0CHAbd9dMAVBu7HAOHzJiQ47qo/w
         Y3kGewb1DrQROJo7eIe0MNmE8Vg33JIyJsPxUhfidVZr0HV1NVhVG3pe136OOJT2H60d
         ZVdA==
X-Forwarded-Encrypted: i=1; AKwUvBxV+jfQkprJS1iLYMrco0c7shxYq2GrMhs4TyV1CLI6iRLuOgMHMf0o8agXCzmecxGlIbzfx2zDW6KMFK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vhx06TsEHWs/7UWCIw6ON5oiFtfsceOnWdxJZihiJDB+bMkLr
	CoFwBWCq4uWa+9xOI2hCxe2AAbCkBG+DJ5Ha6vrxTU1KlnohbSaG+Ffe
X-Gm-Gg: AYBFou3TN34F88PEdFBqTc0AWoEjznh7JWAUTu1k1jS2LGi0hD7m0Vkn6lGbISM77A+
	Kea6QfztO13/EaUvPoCE5iRqLunwKzr73QjDVHixRJ77fEJ/pi6NTK0h4bSbjnLCL5JFH4iQE7q
	48/Dkv4p0Dun++9WndVG7MXn0s+vuuiOjuI9JTPn+08kMFmERhXm6rRz5uW+q7q0nQQR6SSDkv8
	tULgWsOZWu/wou/jEGP2WPaWXIEBQhJG+dESMC1C90Aq6XrRElA3Y/td8Z+Mb4hyIYsnfnsGctf
	UQVAntgDZwtiO9YqX3xz97jQOAs2UAqLDk4GMiHdsGqyvo7XMbkbb6WESa6NjdZqnGHXPi8Uzbp
	C/n49u6oVyfCtCu/o7ekiGX3aTDnAlVq1f/4LmgDJg9QhDf+NXg2/2qFjtO5FAVNXxkAaV5jXWQ
	K3G1KSQNqQR5yQK/Z02MPt1P+QiHHoXtK7F629WocawrKyN8BqS+fjCr1FYrUcuvwChE2CLgXs8
	G2d1vEuNRx4Dm3kLu4Q5nMcRq5ulFy165lnGatUus9jCndkG8xVPOYgW7pW9DRTNn/wtpJrceD+
	3pZdWeincXGinCV7SjrF6ayZqEtMnOj8sbtJ2pNGxXmBBYaBIxJwvQu/MVi8LMk+O9wOOTRCg16
	kjQO2k016hovzLfIeDUeKatqhZChoei+3RXyhDipVOw3ZlT8b6rXC2iN+2R0TKm6MYrN8XYu55+
	5o+w==
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr12547083a91.0.1793771939022;
        Tue, 03 Nov 2026 21:58:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:58 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 3/8] clk: ath79: move the ath79 clock driver to drivers/clk
Date: Tue,  3 Nov 2026 21:58:47 -0800
Message-ID: <20261104055852.152340-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

The ath79 PLL clock code only uses the clk API and its own PLL and SRIF
registers now, so move it from arch/mips/ath79 to drivers/clk, like
the Ralink clocks before it. Copy the register definitions it uses
from asm/mach-ath79/ar71xx_regs.h into the driver, so it no longer
needs the mach headers, and drop the unused ath79.h and common.h.

The driver stays a CLK_OF_DECLARE one, as the MIPS timer needs the CPU
clock from plat_time_init(). COMMON_CLK_ATH79 defaults to ATH79.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 MAINTAINERS                                   |   8 +
 arch/mips/ath79/Makefile                      |   2 +-
 drivers/clk/Kconfig                           |  12 ++
 drivers/clk/Makefile                          |   1 +
 .../ath79/clock.c => drivers/clk/clk-ath79.c  |   6 +-
 drivers/clk/clk-ath79.h                       | 194 ++++++++++++++++++
 6 files changed, 218 insertions(+), 5 deletions(-)
 rename arch/mips/ath79/clock.c => drivers/clk/clk-ath79.c (99%)
 create mode 100644 drivers/clk/clk-ath79.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..d1d11bb49875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4352,6 +4352,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 F:	drivers/rtc/rtc-atcrtc100.c
 
+ATHEROS 71XX/9XXX CLOCK DRIVER
+M:	Alban Bedel <albeu@free.fr>
+M:	Antony Pavlov <antonynpavlov@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml
+F:	drivers/clk/clk-ath79.*
+F:	include/dt-bindings/clock/ath79-clk.h
+
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
diff --git a/arch/mips/ath79/Makefile b/arch/mips/ath79/Makefile
index 0fb3aaf42149..5df55b5e1c15 100644
--- a/arch/mips/ath79/Makefile
+++ b/arch/mips/ath79/Makefile
@@ -6,6 +6,6 @@
 # Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
 #
 
-obj-y	:= prom.o setup.o common.o clock.o
+obj-y	:= prom.o setup.o common.o
 
 obj-$(CONFIG_EARLY_PRINTK)		+= early_printk.o
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d4178..9a3ca7d31c06 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -66,6 +66,18 @@ config COMMON_CLK_APPLE_NCO
 	  found on Apple SoCs such as t8103 (M1). The blocks are typically
 	  generators of audio clocks.
 
+config COMMON_CLK_ATH79
+	bool "Clock driver for Atheros/Qualcomm ath79 SoCs" if COMPILE_TEST
+	depends on ATH79 || COMPILE_TEST
+	depends on OF
+	default ATH79
+	help
+	  Support for the PLL controller of the Atheros/Qualcomm ath79
+	  family of MIPS SoCs: AR71xx, AR724x, AR913x, AR933x, AR934x,
+	  QCA953x, QCA955x and QCA956x. It provides the CPU, DDR, AHB and
+	  MDIO clocks, derived from the board's reference clock. The clocks
+	  are set up early, as the MIPS timer needs the CPU clock.
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 52d138d4ffc8..589d2ef9dc89 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -58,6 +58,7 @@ endif
 # please keep this section sorted lexicographically by file path name
 obj-$(CONFIG_COMMON_CLK_APPLE_NCO)  	+= clk-apple-nco.o
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
+obj-$(CONFIG_COMMON_CLK_ATH79)		+= clk-ath79.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
 obj-$(CONFIG_COMMON_CLK_BD718XX)	+= clk-bd718x7.o
diff --git a/arch/mips/ath79/clock.c b/drivers/clk/clk-ath79.c
similarity index 99%
rename from arch/mips/ath79/clock.c
rename to drivers/clk/clk-ath79.c
index 85f747cf37a8..c5da404c9c48 100644
--- a/arch/mips/ath79/clock.c
+++ b/drivers/clk/clk-ath79.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Atheros AR71XX/AR724X/AR913X common routines
+ *  Atheros/Qualcomm ath79 PLL clocks
  *
  *  Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros.com>
  *  Copyright (C) 2011 Gabor Juhos <juhosg@openwrt.org>
@@ -21,9 +21,7 @@
 
 #include <asm/div64.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
-#include "common.h"
+#include "clk-ath79.h"
 
 static struct clk *clks[ATH79_CLK_END];
 static struct clk_onecell_data clk_data = {
diff --git a/drivers/clk/clk-ath79.h b/drivers/clk/clk-ath79.h
new file mode 100644
index 000000000000..12d7488eb5d2
--- /dev/null
+++ b/drivers/clk/clk-ath79.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Atheros/Qualcomm ath79 PLL and SRIF registers, as in
+ * asm/mach-ath79/ar71xx_regs.h
+ */
+
+#ifndef __CLK_ATH79_H
+#define __CLK_ATH79_H
+
+#include <linux/bits.h>
+
+#define AR71XX_APB_BASE		0x18000000
+#define AR934X_SRIF_BASE	(AR71XX_APB_BASE + 0x00116000)
+#define AR934X_SRIF_SIZE	0x1000
+#define AR71XX_PLL_REG_CPU_CONFIG	0x00
+#define AR71XX_PLL_FB_SHIFT		3
+#define AR71XX_PLL_FB_MASK		0x1f
+#define AR71XX_CPU_DIV_SHIFT		16
+#define AR71XX_CPU_DIV_MASK		0x3
+#define AR71XX_DDR_DIV_SHIFT		18
+#define AR71XX_DDR_DIV_MASK		0x3
+#define AR71XX_AHB_DIV_SHIFT		20
+#define AR71XX_AHB_DIV_MASK		0x7
+#define AR724X_PLL_REG_CPU_CONFIG	0x00
+#define AR724X_PLL_FB_SHIFT		0
+#define AR724X_PLL_FB_MASK		0x3ff
+#define AR724X_PLL_REF_DIV_SHIFT	10
+#define AR724X_PLL_REF_DIV_MASK		0xf
+#define AR724X_AHB_DIV_SHIFT		19
+#define AR724X_AHB_DIV_MASK		0x1
+#define AR724X_DDR_DIV_SHIFT		22
+#define AR724X_DDR_DIV_MASK		0x3
+#define AR933X_PLL_CPU_CONFIG_REG	0x00
+#define AR933X_PLL_CLOCK_CTRL_REG	0x08
+#define AR933X_PLL_CPU_CONFIG_NINT_SHIFT	10
+#define AR933X_PLL_CPU_CONFIG_NINT_MASK		0x3f
+#define AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT	16
+#define AR933X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT	23
+#define AR933X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
+#define AR933X_PLL_CLOCK_CTRL_BYPASS		BIT(2)
+#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT	5
+#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK	0x3
+#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT	10
+#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK	0x3
+#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT	15
+#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK	0x7
+#define AR934X_PLL_CPU_CONFIG_REG		0x00
+#define AR934X_PLL_DDR_CONFIG_REG		0x04
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_REG		0x08
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_REG	0x24
+#define AR934X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define AR934X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define AR934X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define AR934X_PLL_CPU_CONFIG_NINT_MASK		0x3f
+#define AR934X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define AR934X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define AR934X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define AR934X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
+#define AR934X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define AR934X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define AR934X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define AR934X_PLL_DDR_CONFIG_NINT_MASK		0x3f
+#define AR934X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define AR934X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define AR934X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define AR934X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_PLL_BYPASS	BIT(2)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_PLL_BYPASS	BIT(3)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_PLL_BYPASS	BIT(4)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_SHIFT	5
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_SHIFT	10
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_SHIFT	15
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPUCLK_FROM_CPUPLL	BIT(20)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDRCLK_FROM_DDRPLL	BIT(21)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHBCLK_FROM_DDRPLL	BIT(24)
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL	BIT(6)
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_UART1_CLK_SEL	BIT(7)
+#define QCA953X_PLL_CPU_CONFIG_REG		0x00
+#define QCA953X_PLL_DDR_CONFIG_REG		0x04
+#define QCA953X_PLL_CLK_CTRL_REG		0x08
+#define QCA953X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define QCA953X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define QCA953X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define QCA953X_PLL_CPU_CONFIG_NINT_MASK	0x3f
+#define QCA953X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define QCA953X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define QCA953X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
+#define QCA953X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define QCA953X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define QCA953X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define QCA953X_PLL_DDR_CONFIG_NINT_MASK	0x3f
+#define QCA953X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define QCA953X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define QCA953X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define QCA953X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define QCA953X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA953X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA953X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
+#define QCA953X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
+#define QCA953X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define QCA955X_PLL_CPU_CONFIG_REG		0x00
+#define QCA955X_PLL_DDR_CONFIG_REG		0x04
+#define QCA955X_PLL_CLK_CTRL_REG		0x08
+#define QCA955X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define QCA955X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define QCA955X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define QCA955X_PLL_CPU_CONFIG_NINT_MASK	0x3f
+#define QCA955X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define QCA955X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define QCA955X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
+#define QCA955X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define QCA955X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define QCA955X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define QCA955X_PLL_DDR_CONFIG_NINT_MASK	0x3f
+#define QCA955X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define QCA955X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define QCA955X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define QCA955X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define QCA955X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA955X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA955X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
+#define QCA955X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
+#define QCA955X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define QCA956X_PLL_CPU_CONFIG_REG			0x00
+#define QCA956X_PLL_CPU_CONFIG1_REG			0x04
+#define QCA956X_PLL_DDR_CONFIG_REG			0x08
+#define QCA956X_PLL_DDR_CONFIG1_REG			0x0c
+#define QCA956X_PLL_CLK_CTRL_REG			0x10
+#define QCA956X_PLL_CPU_CONFIG_REFDIV_SHIFT		12
+#define QCA956X_PLL_CPU_CONFIG_REFDIV_MASK		0x1f
+#define QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT		19
+#define QCA956X_PLL_CPU_CONFIG_OUTDIV_MASK		0x7
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_SHIFT		0
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_MASK		0x1f
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_SHIFT		5
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_MASK		0x1fff
+#define QCA956X_PLL_CPU_CONFIG1_NINT_SHIFT		18
+#define QCA956X_PLL_CPU_CONFIG1_NINT_MASK		0x1ff
+#define QCA956X_PLL_DDR_CONFIG_REFDIV_SHIFT		16
+#define QCA956X_PLL_DDR_CONFIG_REFDIV_MASK		0x1f
+#define QCA956X_PLL_DDR_CONFIG_OUTDIV_SHIFT		23
+#define QCA956X_PLL_DDR_CONFIG_OUTDIV_MASK		0x7
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_SHIFT		0
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_MASK		0x1f
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_SHIFT		5
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_MASK		0x1fff
+#define QCA956X_PLL_DDR_CONFIG1_NINT_SHIFT		18
+#define QCA956X_PLL_DDR_CONFIG1_NINT_MASK		0x1ff
+#define QCA956X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA956X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA956X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_DDRPLL	BIT(20)
+#define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_CPUPLL	BIT(21)
+#define QCA956X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define AR934X_SRIF_CPU_DPLL1_REG	0x1c0
+#define AR934X_SRIF_CPU_DPLL2_REG	0x1c4
+#define AR934X_SRIF_DDR_DPLL1_REG	0x240
+#define AR934X_SRIF_DDR_DPLL2_REG	0x244
+#define AR934X_SRIF_DPLL1_REFDIV_SHIFT	27
+#define AR934X_SRIF_DPLL1_REFDIV_MASK	0x1f
+#define AR934X_SRIF_DPLL1_NINT_SHIFT	18
+#define AR934X_SRIF_DPLL1_NINT_MASK	0x1ff
+#define AR934X_SRIF_DPLL1_NFRAC_MASK	0x0003ffff
+#define AR934X_SRIF_DPLL2_LOCAL_PLL	BIT(30)
+#define AR934X_SRIF_DPLL2_OUTDIV_SHIFT	13
+#define AR934X_SRIF_DPLL2_OUTDIV_MASK	0x7
+
+#endif /* __CLK_ATH79_H */
-- 
2.56.0


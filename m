Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254902;
	b=WqzpDI4UrDxtvAy+aIl2nem853uuz6PjaMB0cMqbkLYx+Ml3ksG7n9lukJnhSOKRBX+H
	 4x71iA+mly9TD7i85Fk8TRAnp003t1U5NjkbXoGBH8sf1/hYbO7H4yyVje4KtT/Yndmqz
	 OM7LMrsw9nTExtFS0RU4c6SJ9YaNmNGIRm/QMy2sKmbYlQqTUEnLZslH1G9+zwNOKJnHy
	 Qat3iasRsPRB9ttXT7EY+xL2pgU1qrr2yZBFUO89E1VFbb35ixz439cLqrLjl7JoNTwDb
	 4xDhvtRihNVxNxvojuO7CXTQzPui0nVrh9Pm/aXeFRpItEM09m7UFHuw6PZsYqRFcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=;
	b=TjHOQB2OtNDG33kTkC9wShWCIyliEuHGuy4+n53btxSLhLBKUxGrvlo0apLZBdr2liIr
	 lUoI5w+f9Mk2Yc2gFmNQjvN+Ig491AdQ1juH3dnb7phQ46AAhH0YKQGR3f2gUa7IwrLU4
	 CeU0+Kj9iYMc0TmmuTyYh/aTfWodTq7PGcSL+GK5AyBNa6VJgZGhyYkII4HfL29GzcYxV
	 TGrH5KYCz8LOj4expTGc5ZCbjyrvCsn7ugOvKQowHozO5E5DyRCqHVbGgdfvlN6cJO/Fs
	 hwH0aPOf0GAsE1KPlHj/r5SFMDtxFiQhI9Fn1lBJRl7GM4uTm1gASkGvHr4dS8C+utA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnB8jfVk;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09BB606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09BB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnB8jfVk
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4919a880834so834543f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254900; x=1794859700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=;
        b=qnB8jfVkeZYYccJoKtIqJ09VJv1yZXeB6rIB9m3cs87DC3US96MwhSnbj6EPNBkxkp
         4dbQcF/Pi1o05d1tCaQPFhaX12qn1dgeFlgfNKom/qjLuVIhOgu3YKpg81oNYGAY3mIQ
         CLUcpbmLwrf4leFZZLL4UvZhyuZmHb0vBUExsGzL+Hg3XPtgdq8PLep3XpDVGtQd6XTW
         xH1I71fkDTyQM4g2H3Qqm/LHxCJzXKutZq+BMtBpF7EEssPp8bOjuc7xxycI/MiA47iy
         oyFzKmV/9tHkE79I1JJIFyGOa3EIf0mipU2dT17JNx72nNdmRQNcMyp37WWZ/evaCBQ+
         gA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254900; x=1794859700;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/d1U0A2dfiNuwij3Ofh6GUJRUsPvJzrc8bAF4ywOpeQ=;
        b=0OJPYyTyNBThh4hAYkAKLBew+/ae9q6HOKooDDhO6LW2QlN08Nu+GJuhjF9gNZVz61
         dn7hTHX2fzuh5Jq1XlaVvRBPyy9pHv9vU6mdFLePyoFj2TJT51zNcqIkt70LOuMkuBjn
         dH856PJkh5HLcrfKD11z/kXRkNb1pEBlBGrIJeqIHE6bdUmNkrBgWr6yoPytEgPB6kj4
         JPQ+CCd3i9eiOgEYArvP6im2MFNNrbT0dX45AcVZDz/0gOrRQyVGZiRoqcsku5uvJsb7
         idCeazeJllcvOSh6pWFeO6UYsGHnr9N/UEhuwZ085TD7PRVaV6naQr2SS273GzOc0Hem
         bH+A==
X-Gm-Message-State: APuU4Z8t/xCezMD62E6vuwuUAeRyPh2I2Wcy9l5Duu2XW7Io7V6++e9z
	OSSDWiiXZ5KusIBIKGmCdWFpC5ksjoDxLrSlVjg197IEHIvjkQxj9DsvLk+kGyaM3ro=
X-Gm-Gg: AYBFou32gdQQ8QZZCM9GBXc+8vpf/Sp/9sq6EucKm5aSAEGT6pLD3RKXbzL4ywbInD9
	Z8fqq8G+fcQjitfGYlPvZlcVoUFTPOQ5dbZCG0ZhkohRSnb16ZDwg8WnqNzBF13g/pfCnSyR9M3
	nqHJTXO0F6rc82lH9p9e63ILl1HBi48Nys7xg6dohetjtdT3wYMerkPG+U2B3VZWbY/3+LTYomw
	Smrz/1kJkfaZXGsJ+wPEZmvXzKc4EAiCgPC7w0bB2m3LT0w+5rqjPcDzI7nl/wpgS5zbxlsnw+Q
	aa3Y9VZJPSCfqnpp0guXIt0p2A6WNkgdqoK56QlLSaXRXYyIsgitBMcTkl3YEWEyl/3JRnBJ31z
	+AkzXkE32/4xyx/39VgCNSwZBwl0eT3qHi7JckQa4JXhp5B8qIzE/PPHKpdAMeNVshWhx620vo5
	b8suPCSJ30ZgYTF6oKhrwhOI81vJOlUi1j9V9fzipk2+71r/UajOXopwkEhrAtQzVZykN7F3eYl
	TScpGtl2DlyPELU4lTxSU6v5beQ9Ub1n7hrpE7Bs1H4cDJIIh4KKL2EtL+0F8arTnkE0/hpEK9T
	Ta8pa62DIPgPaOkW0Vj8jcB+UcxBkPiKSjoa78bt
X-Received: by 2002:a05:6000:18a3:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49830e767fdmr972903f8f.51.1794254900091;
        Mon, 09 Nov 2026 12:08:20 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835859080sm1003909f8f.19.2026.11.09.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:08:19 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 09 Nov 2026 23:08:04 +0300
Subject: [PATCH v14] reset: zte: Add a zx297520v3 reset driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ5AMBAAvyJ71kSrEXxFHFq2rAPSRUTj74rjT
 CYTgNETMtRJAI8HMS1zBKnTBLrRzAMK6qMAlalCyqwS16kqj4ybyF1htNPW9qWB2K8eHZ3frGl
 /5t1O2G3vAO77AQWijM9uAAAA
X-Change-ID: 20261109-zx29reset-3f6a4f4bbd8a
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13429;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=snZfNSAC20sZnLBmUI69XM4PLRaPCMcGcxywFTp19Qc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBq8igy0yQgqmTxgtDAI9aP+ifSpl2uvHBxs4brL
 Z7xWGsJOm+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCavIoMhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK++g//YTpcUxJ/uZJW+HzsLewaMwlbaIyaSN/
 svfqBNRQC22MyZDp9RQvlpJzY8/0Lz9a51+2Oy1cu/9YgJkSJ7nGXmD/rW2sGEZ4jQXPY7MFh2c
 BKahDISAqAPxjsACaIG8wa8hmo1WYXSV2AN0oZdW0JhvI9my3lmU4RTV426zw899ccKY9LHegQR
 07pRS8Plut9GyslHYSeYKcM+cdtW1vnZrssmydYkPUAgw6TDiB64Jp7N1LGQxv+QJZrZDSMZlW4
 gP1h21YaLw/MEfpL1tNXVtrvq2lWcK2Nggr9Xgabi1G9+lsde0RfxDYiFZCQovkvSvoRio48TT0
 jNR/s4t/LjpAHcedzaI4lSC4SB9Sc/njh1nTOtH4B30y+si7hSK7H2Fi9QAr4KpO8zmnFn8wVp5
 ezw4oYZm14Ou529lhk5hewNbwLv05y8UvB+QVKWSx1OIlYOQ7Bk4fJvddsbk3Im2p/Pl6905cog
 82WrAST/JRsjdqO0Vc+mVCWRDwmrBwSo38dTlFMkkM4gm6XWYCsWreTK4DG8YFNPYjTn9UVRbxE
 OJGPENxh/i7+XuLXVbeC8/3IgJAWHuXVzlsRz2Lk9k3MwHKoz4aIj3tQnkpvCCR8JllJhkntWOi
 uv4SLnnZZUXlqcUTyk5KJmjdxu8geAbzfWpAmz5hudOeGBePt748=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This drives the MFD child devices created by the zte-zx297520v3-crm
driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v14: Stand-alone submission of the reset driver for inclusion. The DT
bindings are already upstream, so the driver builds as-is.

I have removed the line from MAINTAINERS because it will conflict with
the patch submitted to the MFD tree for the MFD driver linked below:

https://lore.kernel.org/mfd/20261108-zx29clk-v14-1-48694e5a9d10@gmail.com/

v12: Correct SSC reset from bit 24 to bit 28 in matrix+0x94.

v10:
Add ZSP reset in matrixcrm

v9:
Remove HSIC and USB PHY resets, the phy driver will access them through
the shared regmap directly
Sort include files alphabetically
Depend on HAS_IOMEM due to "select MFD_SYSCON" (Sashiko). This has some,
but not consistent, precedent in the same file

v8: Select MFD_SYSCON for COMPILE_TESTing this driver without the MFD
parent driver.

v7:
Add MODULE_DEVICE_TABLE (Philipp)
Add DDR control and LSP resets

v6:
Add a comment wrt checking all bits in .status() (Philipp)
include cleanup (Philipp, Sashiko)

v5:
Make top and matrix MFD children instead of aux devices
Split USB PHY reset into its own reset ID
Remove USB reset wait code - this will be handled via syscon from a
future minimal phy-zx29-usb driver
---
 drivers/reset/Kconfig                |  13 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 237 +++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..e68e33a35fec 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -438,6 +438,19 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on HAS_IOMEM
+	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	select MFD_SYSCON
+	help
+	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
+	  controllers are required for booting this board and are part of the
+	  clock and reset management controllers on this board, so you will also
+	  need MFD_ZTE_ZX297520V3_CRM. Enable this if you are building a kernel
+	  for a ZTE zx297520v3 based board.
+
 config RESET_ZYNQ
 	bool "ZYNQ Reset Driver" if COMPILE_TEST
 	default ARCH_ZYNQ
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..8cff33919b29 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -53,5 +53,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
 obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
+obj-$(CONFIG_RESET_ZTE_ZX297520V3) += reset-zte-zx297520v3.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-zte-zx297520v3.c
new file mode 100644
index 000000000000..6a5711446502
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+/* Most devices on the zx297520v3 SoC have one reset bit per clock line. As a rule of thumb, the
+ * lower bit disconnects the device from the bus, similarly to turning off PCLK - registers read 0
+ * or hang indefinitely. Unlike PCLK, this reset may have a lingering effect after deasserting.
+ * E.g. timers will be disabled, but retain their counter value.
+ *
+ * The other bit resets the actual device registers.
+ *
+ * For some devices, e.g. GMAC, both reset bits behave in the same way: They disconnect the device
+ * and registers will have their default state after deasserting. For devices that have two reset
+ * bits, both need to be deasserted for the device to function.
+ */
+struct zte_reset_reg {
+	u32 mask;
+	u16 reg;
+};
+
+struct zte_reset_data {
+	const struct zte_reset_reg *resets;
+	unsigned int num;
+};
+
+struct zte_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	const struct zte_reset_reg *resets;
+};
+
+static inline struct zte_reset *to_zte_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct zte_reset, rcdev);
+}
+
+static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+	int res;
+
+	/* Devices with two reset bits need both deasserted to work. So only report them as
+	 * deasserted if both bits are set.
+	 *
+	 * assert()/deassert() will always clear/set both. The only reason a device might be in a
+	 * hybrid state is an unexpected handover state from the bootloader.
+	 */
+	res = regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static const struct reset_control_ops zx29_rst_ops = {
+	.assert		= zx29_rst_assert,
+	.deassert	= zx29_rst_deassert,
+	.status		= zx29_rst_status,
+};
+
+static const struct zte_reset_reg zx297520v3_top_resets[] = {
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixcrm.
+	 */
+	[ZX297520V3_ZSP_CORE_RESET]  = { .reg = 0x13c, .mask = BIT(0)            },
+
+	[ZX297520V3_UART0_RESET]     = { .reg =  0x78, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_I2C0_RESET]      = { .reg =  0x74, .mask = BIT(8)  | BIT(9)  },
+	/* Only one reset. Bit 5 is settable but does not do anything observable */
+	[ZX297520V3_RTC_RESET]       = { .reg =  0x74, .mask = BIT(4)            },
+	[ZX297520V3_TIMER_T08_RESET] = { .reg =  0x78, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T09_RESET] = { .reg =  0x78, .mask = BIT(2)  | BIT(3)  },
+	/* Only one reset. Bit 0 is settable but does not do anything observable */
+	[ZX297520V3_PMM_RESET]       = { .reg =  0x74, .mask = BIT(1)            },
+
+	/* I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one reset bit per controller.
+	 */
+	[ZX297520V3_GPIO_RESET]      = { .reg =  0x74, .mask = BIT(3)            },
+	[ZX297520V3_GPIO8_RESET]     = { .reg =  0x74, .mask = BIT(2)            },
+
+	[ZX297520V3_TIMER_T12_RESET] = { .reg =  0x74, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_TIMER_T13_RESET] = { .reg =  0x7c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_TIMER_T14_RESET] = { .reg =  0x7c, .mask = BIT(2)  | BIT(3)  },
+	[ZX297520V3_TIMER_T15_RESET] = { .reg =  0x74, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_TIMER_T16_RESET] = { .reg =  0x7c, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T17_RESET] = { .reg = 0x12c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_WDT_T18_RESET]   = { .reg =  0x74, .mask = BIT(12) | BIT(13) },
+	[ZX297520V3_USIM1_RESET]     = { .reg =  0x74, .mask = BIT(14) | BIT(15) },
+	[ZX297520V3_AHB_RESET]       = { .reg =  0x70, .mask = BIT(0)  | BIT(1)  },
+
+	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 for USB up, but
+	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to report ready.
+	 * Thus polling the status is the responsibility of the USB PHY driver.
+	 */
+	[ZX297520V3_USB_RESET]       = { .reg =  0x80, .mask = BIT(4) | BIT(5)   },
+	[ZX297520V3_HSIC_RESET]      = { .reg =  0x80, .mask = BIT(1) | BIT(2)   },
+};
+
+static const struct zte_reset_data zx297520v3_topreset_data = {
+	.resets = zx297520v3_top_resets,
+	.num = ARRAY_SIZE(zx297520v3_top_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_matrix_resets[] = {
+	[ZX297520V3_CPU_RESET]       = { .reg =  0x28, .mask = BIT(1)            },
+	[ZX297520V3_ZSP_BUS_RESET]   = { .reg =  0x3c, .mask = BIT(0)            },
+	[ZX297520V3_DDR_CTRL_RESET]  = { .reg = 0x100, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(28)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+	[ZX297520V3_LSP_RESET]       = { .reg =  0x80, .mask = BIT(0)            },
+};
+
+static const struct zte_reset_data zx297520v3_matrixreset_data = {
+	.resets = zx297520v3_matrix_resets,
+	.num = ARRAY_SIZE(zx297520v3_matrix_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_lsp_resets[] = {
+	[ZX297520V3_TIMER_L1_RESET]  = { .reg = 0x04,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L2_RESET]    = { .reg = 0x08,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L3_RESET]    = { .reg = 0x0c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_PWM_RESET]       = { .reg = 0x10,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2S0_RESET]      = { .reg = 0x14,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x18: Not writeable */
+	[ZX297520V3_I2S1_RESET]      = { .reg = 0x1c,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x20: Not writeable */
+	[ZX297520V3_QSPI_RESET]      = { .reg = 0x24,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART1_RESET]     = { .reg = 0x28,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2C1_RESET]      = { .reg = 0x2c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI0_RESET]      = { .reg = 0x30,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LB_RESET]  = { .reg = 0x34,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LC_RESET]  = { .reg = 0x38,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART2_RESET]     = { .reg = 0x3c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_LE_RESET]    = { .reg = 0x40,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LF_RESET]  = { .reg = 0x44,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI1_RESET]      = { .reg = 0x48,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_L11_RESET] = { .reg = 0x4c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TDM_RESET]       = { .reg = 0x50,  .mask = BIT(8)  | BIT(9)  },
+};
+
+static const struct zte_reset_data zx297520v3_lspreset_data = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->parent->of_node;
+	const struct zte_reset_data *data;
+	struct zte_reset *rst;
+
+	if (!id)
+		return -ENODEV;
+	data = (const struct zte_reset_data *)id->driver_data;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = data->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = data->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = of_node;
+	rst->rcdev.dev = dev;
+
+	rst->map = device_node_to_regmap(of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct platform_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-topreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_topreset_data,
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixreset_data,
+	},
+	{
+		.name = "zx297520v3-lspreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lspreset_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
+
+static struct platform_driver reset_zx297520v3 = {
+	.probe = reset_zx297520v3_probe,
+	.driver = {
+		.name = "reset-zx297520v3",
+	},
+	.id_table = reset_zx297520v3_ids,
+};
+module_platform_driver(reset_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-zx29reset-3f6a4f4bbd8a

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>


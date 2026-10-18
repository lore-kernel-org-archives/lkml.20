Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763EF396D1A;
	Sun, 18 Oct 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339691; cv=none; b=Yf9m+9ajaJctxyYKF/IYzDtFLWujk+PfatusCGBS55EDkVmIOZBhs1e37Bw0pkWHlnp1x6IAWgwo7dEMFLWaEnwJquSBYwbN4PVlXjiu0Fn21ePVc84JMKaB7+YpqpU4WdG/Q/XAB/j9s79M26yzt38huzeCjcyMhsQfIMZodug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339691; c=relaxed/simple;
	bh=yq8K08enrw6LbdKWSUYJzI74zbQr5VilXXUQIO7rM2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1dooWi6ctvpqw5AFttVqlrmDmunKgW9K678QPfj0KqWpDz8M+Ao9adA39YTg4SuuX+3arHQREgAl6frCDc4U3Snw8i4IEK+PS8OQDzRnec3gNbVw0/tJmL0JLCW2RuQ0R+xZCuLjPy+4EnhNC1Ftymq+jpz0IGqUuJL1r8IpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pdr8ppQE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pdr8ppQE"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6sxxE1115127, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=BRdEzroK7tRi1zf0m1UlJOB2ul0AtD9698fQJ/SD/gU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=pdr8ppQEdJS0SyhUoUUwZ/GfmnJF3CJ/UBTI9XEdOiEqHanv8esSz7jQ41wxGcgIw
	 jh/9DYFI2ncBnII2qMemAK/D9Z05y3FH0EpTtqacwphMbxfvcdEqLgZvYcjVoJ7C6+
	 cKqVL+80p+6mMbSV4IEB6Y7sxaFixMpy5GvhZint5lmrUaScBNNz0UfNetJRx3nV0Z
	 H/TSFkffPhbk/2kNf8CQyx31OPkg1IO2lKrvIfYRU1cKczoJ+gU9Ep3P3x96bC4Ndp
	 oDwLSN+M+8mgXxPLxb9rHhBgS9iaaly5XoujlV71TygMYiY5ssMxBMXLP0gaKvlVv/
	 z4wrcIkRoQ0yQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6sxxE1115127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 5/8] irqchip/realtek-rtd1319: Add driver for Realtek DHC RTD1319 SoC
Date: Mon, 19 Oct 2026 00:06:50 +0800
Message-ID: <20261018160653.3940371-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: James Tai <james.tai@realtek.com>

Add support for interrupt controller driver found on Realtek DHC RTD1319
SoCs.

Signed-off-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS                           |   1 +
 drivers/irqchip/Kconfig               |  11 ++
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-realtek-rtd1319.c | 188 ++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aae6d91fe39e..1ff7cd959ea3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3486,6 +3486,7 @@ F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 F:	drivers/irqchip/irq-realtek-intc-common.*
+F:	drivers/irqchip/irq-realtek-rtd*
 F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cddbf9915510..3c0c04330640 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -287,6 +287,17 @@ config REALTEK_DHC_INTC
 	select IRQ_DOMAIN
 	select MFD_SYSCON
 
+config REALTEK_RTD1319_INTC
+	tristate "Realtek RTD1319 interrupt controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select REALTEK_DHC_INTC
+	help
+	  Enable support for the Realtek RTD1319 SoC Interrupt Controller.
+	  Each Realtek DHC SoC has two sets of interrupt controllers, each
+	  capable of handling up to 32 interrupts.
+
+	  If unsure, say N.
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index bc8f5c534a4a..ba3e6b68c085 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_IXP4XX_IRQ)		+= irq-ixp4xx.o
 obj-$(CONFIG_JCORE_AIC)			+= irq-jcore-aic.o
 obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
+obj-$(CONFIG_REALTEK_RTD1319_INTC)	+= irq-realtek-rtd1319.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-rtd1319.c b/drivers/irqchip/irq-realtek-rtd1319.c
new file mode 100644
index 000000000000..b5f32f3b5912
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-rtd1319.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTD1319 interrupt controller driver
+ *
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include "irq-realtek-intc-common.h"
+
+#define ISO_NORMAL_MASK		0xffffcffe
+#define ISO_RTC_MASK		0x00003001
+#define MISC_NMI_WDT_MASK	0x00000004
+#define MISC_NORMAL_MASK	0xffffc0d2
+#define MISC_UART1_MASK		0x00000028
+#define MISC_UART2_MASK		0x00002100
+
+#define ISO_ISR_EN_OFFSET	0x40
+#define ISO_ISR_OFFSET		0
+#define MISC_ISR_EN_OFFSET	0x80
+#define MISC_ISR_OFFSET		0xc
+
+enum rtd1319_iso_isr_bits {
+	RTD1319_ISO_ISR_TC3_SHIFT		= 1,
+	RTD1319_ISO_ISR_UR0_SHIFT		= 2,
+	RTD1319_ISO_ISR_LSADC0_SHIFT		= 3,
+	RTD1319_ISO_ISR_IRDA_SHIFT		= 5,
+	RTD1319_ISO_ISR_SPI1_SHIFT		= 6,
+	RTD1319_ISO_ISR_WDOG_NMI_SHIFT		= 7,
+	RTD1319_ISO_ISR_I2C0_SHIFT		= 8,
+	RTD1319_ISO_ISR_TC4_SHIFT		= 9,
+	RTD1319_ISO_ISR_TC7_SHIFT		= 10,
+	RTD1319_ISO_ISR_I2C1_SHIFT		= 11,
+	RTD1319_ISO_ISR_RTC_HSEC_SHIFT		= 12,
+	RTD1319_ISO_ISR_RTC_ALARM_SHIFT		= 13,
+	RTD1319_ISO_ISR_GPIOA_SHIFT		= 19,
+	RTD1319_ISO_ISR_GPIODA_SHIFT		= 20,
+	RTD1319_ISO_ISR_ISO_MISC_SHIFT		= 21,
+	RTD1319_ISO_ISR_CBUS_SHIFT		= 22,
+	RTD1319_ISO_ISR_ETN_SHIFT		= 23,
+	RTD1319_ISO_ISR_USB_HOST_SHIFT		= 24,
+	RTD1319_ISO_ISR_USB_U3_DRD_SHIFT	= 25,
+	RTD1319_ISO_ISR_USB_U2_DRD_SHIFT	= 26,
+	RTD1319_ISO_ISR_PORB_HV_SHIFT		= 28,
+	RTD1319_ISO_ISR_PORB_DV_SHIFT		= 29,
+	RTD1319_ISO_ISR_PORB_AV_SHIFT		= 30,
+	RTD1319_ISO_ISR_I2C1_REQ_SHIFT		= 31,
+};
+
+static const u32 rtd1319_iso_isr_to_scpu_int_en_mask[32] = {
+	[RTD1319_ISO_ISR_SPI1_SHIFT]		= BIT(1),
+	[RTD1319_ISO_ISR_UR0_SHIFT]		= BIT(2),
+	[RTD1319_ISO_ISR_LSADC0_SHIFT]		= BIT(3),
+	[RTD1319_ISO_ISR_IRDA_SHIFT]		= BIT(5),
+	[RTD1319_ISO_ISR_I2C0_SHIFT]		= BIT(8),
+	[RTD1319_ISO_ISR_I2C1_SHIFT]		= BIT(11),
+	[RTD1319_ISO_ISR_RTC_HSEC_SHIFT]	= BIT(12),
+	[RTD1319_ISO_ISR_RTC_ALARM_SHIFT]	= BIT(13),
+	[RTD1319_ISO_ISR_GPIOA_SHIFT]		= BIT(19),
+	[RTD1319_ISO_ISR_GPIODA_SHIFT]		= BIT(20),
+	[RTD1319_ISO_ISR_PORB_HV_SHIFT]		= BIT(28),
+	[RTD1319_ISO_ISR_PORB_DV_SHIFT]		= BIT(29),
+	[RTD1319_ISO_ISR_PORB_AV_SHIFT]		= BIT(30),
+	[RTD1319_ISO_ISR_I2C1_REQ_SHIFT]	= BIT(31),
+};
+
+enum rtd1319_misc_isr_bits {
+	RTD1319_MISC_ISR_WDOG_NMI_SHIFT	= 2,
+	RTD1319_MISC_ISR_UR1_SHIFT	= 3,
+	RTD1319_MISC_ISR_TC5_SHIFT	= 4,
+	RTD1319_MISC_ISR_UR1_TO_SHIFT	= 5,
+	RTD1319_MISC_ISR_TC0_SHIFT	= 6,
+	RTD1319_MISC_ISR_TC1_SHIFT	= 7,
+	RTD1319_MISC_ISR_UR2_SHIFT	= 8,
+	RTD1319_MISC_ISR_RTC_HSEC_SHIFT	= 9,
+	RTD1319_MISC_ISR_RTC_MIN_SHIFT	= 10,
+	RTD1319_MISC_ISR_RTC_HOUR_SHIFT	= 11,
+	RTD1319_MISC_ISR_RTC_DATE_SHIFT	= 12,
+	RTD1319_MISC_ISR_UR2_TO_SHIFT	= 13,
+	RTD1319_MISC_ISR_I2C5_SHIFT	= 14,
+	RTD1319_MISC_ISR_I2C3_SHIFT	= 23,
+	RTD1319_MISC_ISR_SC0_SHIFT	= 24,
+	RTD1319_MISC_ISR_SC1_SHIFT	= 25,
+	RTD1319_MISC_ISR_SPI_SHIFT	= 27,
+	RTD1319_MISC_ISR_FAN_SHIFT	= 29,
+};
+
+static const u32 rtd1319_misc_isr_to_scpu_int_en_mask[32] = {
+	[RTD1319_MISC_ISR_UR1_SHIFT]		= BIT(3),
+	[RTD1319_MISC_ISR_UR1_TO_SHIFT]		= BIT(5),
+	[RTD1319_MISC_ISR_UR2_TO_SHIFT]		= BIT(6),
+	[RTD1319_MISC_ISR_UR2_SHIFT]		= BIT(7),
+	[RTD1319_MISC_ISR_RTC_MIN_SHIFT]	= BIT(10),
+	[RTD1319_MISC_ISR_RTC_HOUR_SHIFT]	= BIT(11),
+	[RTD1319_MISC_ISR_RTC_DATE_SHIFT]	= BIT(12),
+	[RTD1319_MISC_ISR_I2C5_SHIFT]		= BIT(14),
+	[RTD1319_MISC_ISR_SC0_SHIFT]		= BIT(24),
+	[RTD1319_MISC_ISR_SC1_SHIFT]		= BIT(25),
+	[RTD1319_MISC_ISR_SPI_SHIFT]		= BIT(27),
+	[RTD1319_MISC_ISR_I2C3_SHIFT]		= BIT(28),
+	[RTD1319_MISC_ISR_FAN_SHIFT]		= BIT(29),
+	[RTD1319_MISC_ISR_WDOG_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+};
+
+static const struct realtek_intc_mask rtd1319_intc_iso_cfgs[] = {
+	{ ISO_NORMAL_MASK, },
+	{ ISO_RTC_MASK, },
+};
+
+static const struct realtek_intc_info rtd1319_intc_iso_info[] = {
+	{
+		.isr_offset			= ISO_ISR_OFFSET,
+		.scpu_int_en_offset		= ISO_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask	= rtd1319_iso_isr_to_scpu_int_en_mask,
+		.subset_mask			= rtd1319_intc_iso_cfgs,
+		.subset_num			= ARRAY_SIZE(rtd1319_intc_iso_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1319_intc_iso_desc = {
+	.banks    = rtd1319_intc_iso_info,
+	.bank_num = ARRAY_SIZE(rtd1319_intc_iso_info),
+};
+
+static const struct realtek_intc_mask rtd1319_intc_misc_cfgs[] = {
+	{ MISC_NORMAL_MASK, },
+	{ MISC_NMI_WDT_MASK, },
+	{ MISC_UART1_MASK, },
+	{ MISC_UART2_MASK, },
+};
+
+static const struct realtek_intc_info rtd1319_intc_misc_info[] = {
+	{
+		.isr_offset			= MISC_ISR_OFFSET,
+		.scpu_int_en_offset		= MISC_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask	= rtd1319_misc_isr_to_scpu_int_en_mask,
+		.subset_mask			= rtd1319_intc_misc_cfgs,
+		.subset_num			= ARRAY_SIZE(rtd1319_intc_misc_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1319_intc_misc_desc = {
+	.banks    = rtd1319_intc_misc_info,
+	.bank_num = ARRAY_SIZE(rtd1319_intc_misc_info),
+};
+
+static const struct of_device_id realtek_intc_rtd1319_dt_matches[] = {
+	{
+		.compatible = "realtek,rtd1319-intc-iso",
+		.data = &rtd1319_intc_iso_desc,
+	}, {
+		.compatible = "realtek,rtd1319-intc-misc",
+		.data = &rtd1319_intc_misc_desc,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, realtek_intc_rtd1319_dt_matches);
+
+static int rtd1319_intc_probe(struct platform_device *pdev)
+{
+	const struct realtek_intc_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return realtek_intc_probe(pdev, desc);
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(realtek_intc_rtd1319_pm_ops, realtek_intc_suspend,
+			       realtek_intc_resume);
+
+static struct platform_driver realtek_intc_rtd1319_driver = {
+	.probe = rtd1319_intc_probe,
+	.remove = realtek_intc_remove,
+	.driver = {
+		.name = "realtek_intc_rtd1319",
+		.of_match_table = realtek_intc_rtd1319_dt_matches,
+		.pm = pm_sleep_ptr(&realtek_intc_rtd1319_pm_ops),
+	},
+};
+module_platform_driver(realtek_intc_rtd1319_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek RTD1319 Interrupt Controller Driver");
-- 
2.43.0


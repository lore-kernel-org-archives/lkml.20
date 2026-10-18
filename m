Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CBD3B442F;
	Sun, 18 Oct 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339686; cv=none; b=FPP5gXCDnSgppmbSbPK+Sox3Lxlug2fQ9Rz/oMxm6bxmaVJHX9rO+8q3WRu9/bDX2xvP9dBGwpi8PqzEqUOJcNdUvdteaYZIrS8h5jJKVHIaX2peE4wSSmCWTjYWOupob0MPTBZLm/Nc4lvoXTx6+vckl7NRD5NSnKldMVRlKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339686; c=relaxed/simple;
	bh=5o8o8kZYSMnjarxH9YfCVYRCKXqWg1gqK/Pri1INTYE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWmJ3OLa3w1TyrimulqhvzS+/f7AkI/XnHq5H4uJDC4Qa1za72LeqkrQOInBQa1Bg+PWFtyDlc3Vd09kS5v9uxgqyqPIqzXtc5rOKwDqGrj13cqLrROSl7QQkBsleo6wfJDrF3nDfW47EpWHJK6bFHDpM2n3HW0CpmumE1zbtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=UQu/zURL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="UQu/zURL"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6swX61115131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=URikOntyHo3z7LXEsAygMPExlLcJc8u/0W1YcezPrwU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=UQu/zURL7CkMynYek185DEbd2CzWq6N5MW/Sk2POqjP8BrHUFiL79/Mifj/2hRjCt
	 ccWJ/18ivl6ng+6Pnpmm87XQtHPrrLsPuG6H0L6JnbHHVcf/npzgl4mY1wFsf9mYsP
	 KI6Pp1xXCHT0blMxfIOB4DMl5HKOumQH0VUQnmGG/E2/U2Zvui+5hGHrRj0kd4smxE
	 Gt1FV2FjjKG6mFvB7uE7u+R8/u+ybOe5hUqtyk6tcRZhxn+E8MlqHnp6TmB85Sl/xa
	 cySwMoe5GtisESrmIadC1MobFhEDs+8CrXBhMxECqFVSDG1IP9+yV4pu71MAgI8JBI
	 hGObJjUaBjc/g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6swX61115131
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
Subject: [PATCH v5 6/8] irqchip/realtek-rtd1319d: Add driver for Realtek RTD1319D and RTD1325 SoCs
Date: Mon, 19 Oct 2026 00:06:51 +0800
Message-ID: <20261018160653.3940371-7-eleanor.lin@realtek.com>
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

Add support for interrupt controller driver found on Realtek DHC RTD1319D
and RTD1325 SoCs.

Signed-off-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/irqchip/Kconfig                |  11 ++
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-realtek-rtd1319d.c | 197 +++++++++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319d.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3c0c04330640..8f4bfd3d5ec1 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -298,6 +298,17 @@ config REALTEK_RTD1319_INTC
 
 	  If unsure, say N.
 
+config REALTEK_RTD1319D_INTC
+	tristate "Realtek RTD1319D and RTD1325 interrupt controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select REALTEK_DHC_INTC
+	help
+	  Enable support for the Realtek RTD1319D and RTD1325 SoCs Interrupt
+	  Controller. Each Realtek DHC SoC has two sets of interrupt
+	  controllers, each capable of handling up to 32 interrupts.
+
+	  If unsure, say N.
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ba3e6b68c085..32a2e2d8a79c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_JCORE_AIC)			+= irq-jcore-aic.o
 obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
 obj-$(CONFIG_REALTEK_RTD1319_INTC)	+= irq-realtek-rtd1319.o
+obj-$(CONFIG_REALTEK_RTD1319D_INTC)	+= irq-realtek-rtd1319d.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-rtd1319d.c b/drivers/irqchip/irq-realtek-rtd1319d.c
new file mode 100644
index 000000000000..4bac12c02cbe
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-rtd1319d.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTD1319D and RTD1325 interrupt controller driver
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
+#define ISO_NMI_WDT_MASK	0x08008090
+#define ISO_NORMAL_MASK		0xf7ff7f6e
+#define MISC_NORMAL_MASK	0xffe0ded6
+#define MISC_UART1_MASK		0x00000028
+#define MISC_UART2_MASK		0x00002100
+
+#define ISO_ISR_EN_OFFSET	0x40
+#define ISO_ISR_OFFSET		0
+#define MISC_ISR_EN_OFFSET	0x80
+#define MISC_ISR_OFFSET		0xc
+
+enum rtd1319d_iso_isr_bits {
+	RTD1319D_ISO_ISR_TC3_SHIFT		= 1,
+	RTD1319D_ISO_ISR_UR0_SHIFT		= 2,
+	RTD1319D_ISO_ISR_LSADC0_SHIFT		= 3,
+	RTD1319D_ISO_ISR_WDOG1_NMI_SHIFT	= 4,
+	RTD1319D_ISO_ISR_IRDA_SHIFT		= 5,
+	RTD1319D_ISO_ISR_SPI1_SHIFT		= 6,
+	RTD1319D_ISO_ISR_WDOG2_NMI_SHIFT	= 7,
+	RTD1319D_ISO_ISR_I2C0_SHIFT		= 8,
+	RTD1319D_ISO_ISR_TC4_SHIFT		= 9,
+	RTD1319D_ISO_ISR_TC7_SHIFT		= 10,
+	RTD1319D_ISO_ISR_I2C1_SHIFT		= 11,
+	RTD1319D_ISO_ISR_HIFI_WAKEUP_SHIFT	= 14,
+	RTD1319D_ISO_ISR_WDOG4_NMI_SHIFT	= 15,
+	RTD1319D_ISO_ISR_TC8_SHIFT		= 16,
+	RTD1319D_ISO_ISR_VFD_SHIFT		= 17,
+	RTD1319D_ISO_ISR_VTC_SHIFT		= 18,
+	RTD1319D_ISO_ISR_GPIOA_SHIFT		= 19,
+	RTD1319D_ISO_ISR_GPIODA_SHIFT		= 20,
+	RTD1319D_ISO_ISR_ISO_MISC_SHIFT		= 21,
+	RTD1319D_ISO_ISR_CBUS_SHIFT		= 22,
+	RTD1319D_ISO_ISR_ETN_SHIFT		= 23,
+	RTD1319D_ISO_ISR_USB_HOST_SHIFT		= 24,
+	RTD1319D_ISO_ISR_USB_U3_DRD_SHIFT	= 25,
+	RTD1319D_ISO_ISR_USB_U2_DRD_SHIFT	= 26,
+	RTD1319D_ISO_ISR_WDOG3_NMI_SHIFT	= 27,
+	RTD1319D_ISO_ISR_PORB_HV_CEN_SHIFT	= 28,
+	RTD1319D_ISO_ISR_PORB_DV_CEN_SHIFT	= 29,
+	RTD1319D_ISO_ISR_PORB_AV_CEN_SHIFT	= 30,
+	RTD1319D_ISO_ISR_I2C1_REQ_SHIFT		= 31,
+};
+
+static const u32 rtd1319d_iso_isr_to_scpu_int_en_mask[32] = {
+	[RTD1319D_ISO_ISR_SPI1_SHIFT]		= BIT(1),
+	[RTD1319D_ISO_ISR_UR0_SHIFT]		= BIT(2),
+	[RTD1319D_ISO_ISR_LSADC0_SHIFT]		= BIT(3),
+	[RTD1319D_ISO_ISR_IRDA_SHIFT]		= BIT(5),
+	[RTD1319D_ISO_ISR_I2C0_SHIFT]		= BIT(8),
+	[RTD1319D_ISO_ISR_I2C1_SHIFT]		= BIT(11),
+	[RTD1319D_ISO_ISR_VFD_SHIFT]		= BIT(17),
+	[RTD1319D_ISO_ISR_GPIOA_SHIFT]		= BIT(19),
+	[RTD1319D_ISO_ISR_GPIODA_SHIFT]		= BIT(20),
+	[RTD1319D_ISO_ISR_PORB_HV_CEN_SHIFT]	= BIT(28),
+	[RTD1319D_ISO_ISR_PORB_DV_CEN_SHIFT]	= BIT(29),
+	[RTD1319D_ISO_ISR_PORB_AV_CEN_SHIFT]	= BIT(30),
+	[RTD1319D_ISO_ISR_I2C1_REQ_SHIFT]	= BIT(31),
+	[RTD1319D_ISO_ISR_WDOG1_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1319D_ISO_ISR_WDOG2_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1319D_ISO_ISR_WDOG3_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1319D_ISO_ISR_WDOG4_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+};
+
+enum rtd1319d_misc_isr_bits {
+	RTD1319D_MISC_ISR_UR1_SHIFT		= 3,
+	RTD1319D_MISC_ISR_TC5_SHIFT		= 4,
+	RTD1319D_MISC_ISR_UR1_TO_SHIFT		= 5,
+	RTD1319D_MISC_ISR_TC0_SHIFT		= 6,
+	RTD1319D_MISC_ISR_TC1_SHIFT		= 7,
+	RTD1319D_MISC_ISR_UR2_SHIFT		= 8,
+	RTD1319D_MISC_ISR_UR2_TO_SHIFT		= 13,
+	RTD1319D_MISC_ISR_I2C5_SHIFT		= 14,
+	RTD1319D_MISC_ISR_I2C4_SHIFT		= 15,
+	RTD1319D_MISC_ISR_DRTC_HSEC_SHIFT	= 16,
+	RTD1319D_MISC_ISR_DRTC_MIN_SHIFT	= 17,
+	RTD1319D_MISC_ISR_DRTC_HOUR_SHIFT	= 18,
+	RTD1319D_MISC_ISR_DRTC_DATE_SHIFT	= 19,
+	RTD1319D_MISC_ISR_DRTC_ALARM_SHIFT	= 20,
+	RTD1319D_MISC_ISR_I2C3_SHIFT		= 23,
+	RTD1319D_MISC_ISR_SC0_SHIFT		= 24,
+	RTD1319D_MISC_ISR_SC1_SHIFT		= 25,
+	RTD1319D_MISC_ISR_SPI_SHIFT		= 27,
+	RTD1319D_MISC_ISR_FAN_SHIFT		= 29,
+};
+
+static const u32 rtd1319d_misc_isr_to_scpu_int_en_mask[32] = {
+	[RTD1319D_MISC_ISR_UR1_SHIFT]		= BIT(3),
+	[RTD1319D_MISC_ISR_UR1_TO_SHIFT]	= BIT(5),
+	[RTD1319D_MISC_ISR_UR2_TO_SHIFT]	= BIT(6),
+	[RTD1319D_MISC_ISR_UR2_SHIFT]		= BIT(7),
+	[RTD1319D_MISC_ISR_I2C5_SHIFT]		= BIT(14),
+	[RTD1319D_MISC_ISR_I2C4_SHIFT]		= BIT(15),
+	[RTD1319D_MISC_ISR_DRTC_HSEC_SHIFT]	= BIT(16),
+	[RTD1319D_MISC_ISR_DRTC_MIN_SHIFT]	= BIT(17),
+	[RTD1319D_MISC_ISR_DRTC_HOUR_SHIFT]	= BIT(18),
+	[RTD1319D_MISC_ISR_DRTC_DATE_SHIFT]	= BIT(19),
+	[RTD1319D_MISC_ISR_DRTC_ALARM_SHIFT]	= BIT(20),
+	[RTD1319D_MISC_ISR_SC0_SHIFT]		= BIT(24),
+	[RTD1319D_MISC_ISR_SC1_SHIFT]		= BIT(25),
+	[RTD1319D_MISC_ISR_SPI_SHIFT]		= BIT(27),
+	[RTD1319D_MISC_ISR_I2C3_SHIFT]		= BIT(28),
+	[RTD1319D_MISC_ISR_FAN_SHIFT]		= BIT(29),
+};
+
+static const struct realtek_intc_mask rtd1319d_intc_iso_cfgs[] = {
+	{ ISO_NORMAL_MASK, },
+	{ ISO_NMI_WDT_MASK, },
+};
+
+static const struct realtek_intc_info rtd1319d_intc_iso_info[] = {
+	{
+		.isr_offset		 = ISO_ISR_OFFSET,
+		.scpu_int_en_offset	 = ISO_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1319d_iso_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1319d_intc_iso_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1319d_intc_iso_cfgs),
+	},
+};
+
+static const struct realtek_intc_desc rtd1319d_intc_iso_desc = {
+	.banks    = rtd1319d_intc_iso_info,
+	.bank_num = ARRAY_SIZE(rtd1319d_intc_iso_info),
+};
+
+static const struct realtek_intc_mask rtd1319d_intc_misc_cfgs[] = {
+	{ MISC_NORMAL_MASK, },
+	{ MISC_UART1_MASK, },
+	{ MISC_UART2_MASK, },
+};
+
+static const struct realtek_intc_info rtd1319d_intc_misc_info[] = {
+	{
+		.isr_offset		 = MISC_ISR_OFFSET,
+		.scpu_int_en_offset	 = MISC_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1319d_misc_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1319d_intc_misc_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1319d_intc_misc_cfgs),
+	},
+};
+
+static const struct realtek_intc_desc rtd1319d_intc_misc_desc = {
+	.banks    = rtd1319d_intc_misc_info,
+	.bank_num = ARRAY_SIZE(rtd1319d_intc_misc_info),
+};
+
+static const struct of_device_id realtek_intc_rtd1319d_dt_matches[] = {
+	{
+		.compatible = "realtek,rtd1319d-intc-iso",
+		.data = &rtd1319d_intc_iso_desc,
+	}, {
+		.compatible = "realtek,rtd1319d-intc-misc",
+		.data = &rtd1319d_intc_misc_desc,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, realtek_intc_rtd1319d_dt_matches);
+
+static DEFINE_NOIRQ_DEV_PM_OPS(realtek_intc_rtd1319d_pm_ops, realtek_intc_suspend,
+				realtek_intc_resume);
+
+static int rtd1319d_intc_probe(struct platform_device *pdev)
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
+static struct platform_driver realtek_intc_rtd1319d_driver = {
+	.probe = rtd1319d_intc_probe,
+	.remove = realtek_intc_remove,
+	.driver = {
+		.name = "realtek_intc_rtd1319d",
+		.of_match_table = realtek_intc_rtd1319d_dt_matches,
+		.pm = pm_sleep_ptr(&realtek_intc_rtd1319d_pm_ops),
+	},
+};
+module_platform_driver(realtek_intc_rtd1319d_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek RTD1319D and RTD1325 Interrupt Controller Driver");
-- 
2.43.0


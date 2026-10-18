Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3064C1502;
	Sun, 18 Oct 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339688; cv=none; b=pqqSFCtHjMPp9ZHpes2Rsa47iq4hZ2R0nnq7xrjLLnRMjkZzfjMI7b/OMAk2EgOOGN1YOlAFfA7kxVRSjw26GPIKYxqvvO/kEpTpUbLbXD1vZ+qopmhcZQiL8JYR5J/vLrAdKuS1K4K0MeUWk40iv9YgNSM+iLIHLTaHRCsZ+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339688; c=relaxed/simple;
	bh=46/b4AgQ4UCepGlM4/VGoZstUkt+EJoWHmSG4O+ID1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7H8o6AP1yKUeiQ55reIfpOlxG84qDtezfPJmFWhFexqN5zfhEaRtJMt4bkxS1NqEz3nUqc+oKkUvNNO/rYNh4gyHq2g1TxIHvwSk2/yTZRTjz9VmU0QCrm2hN9I6mJ9lQqfv9ZbOmfRQ1R7SvYS5SVA5WigKstRJTzbT9dtlhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Y6KYyZqW; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Y6KYyZqW"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6swZ61115131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=gpd8dlNH87xa6bpqFXkqwDZ6FUbZKS1hPxE6Xy/cfSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Y6KYyZqWnjJ87IHDbq0YrHCwmf+5NCqHt423IMvlIo/QNAY/mdhQSIa7Y3VXCbd+H
	 zE0X2tFxieq58EGU4sU0BWtR7f/a7YeXM9e3o3ocxVDRpBcJ1sHhi3wqByRNWjZaxw
	 f7GklADs7NyjHyZplIKwoQoXFsj6TEX1+yqm0+0Ci/VOMpz1flWxmiN5pTMB9UfxaQ
	 BihGpDwZcGYjHpHJ/iz+1Uiy58jY462G/RBsH8ZgJF+ug4/YJdENeSpGJSIExN/vZk
	 PeigjuVsBmtVHJDyK0Y6uYaAk6D11fkDyKX3AJ58tdUsBybIajoWfhZU1gMbcKe3wZ
	 6iyHCLWrC988Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6swZ61115131
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
Subject: [PATCH v5 7/8] irqchip/realtek-rtd1619b: Add driver for Realtek DHC RTD1619B SoC
Date: Mon, 19 Oct 2026 00:06:52 +0800
Message-ID: <20261018160653.3940371-8-eleanor.lin@realtek.com>
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

Add support for interrupt controller driver found on Realtek DHC RTD1619B
SoCs.

Signed-off-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/irqchip/Kconfig                |  11 ++
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-realtek-rtd1619b.c | 187 +++++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-rtd1619b.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8f4bfd3d5ec1..2598f6a82cc2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -309,6 +309,17 @@ config REALTEK_RTD1319D_INTC
 
 	  If unsure, say N.
 
+config REALTEK_RTD1619B_INTC
+	tristate "Realtek RTD1619B interrupt controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select REALTEK_DHC_INTC
+	help
+	  Enable support for the Realtek RTD1619B SoC Interrupt Controller.
+	  Each Realtek DHC SoC has two sets of interrupt controllers, each
+	  capable of handling up to 32 interrupts.
+
+	  If unsure, say N.
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 32a2e2d8a79c..acc515fc6f9a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
 obj-$(CONFIG_REALTEK_RTD1319_INTC)	+= irq-realtek-rtd1319.o
 obj-$(CONFIG_REALTEK_RTD1319D_INTC)	+= irq-realtek-rtd1319d.o
+obj-$(CONFIG_REALTEK_RTD1619B_INTC)	+= irq-realtek-rtd1619b.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-rtd1619b.c b/drivers/irqchip/irq-realtek-rtd1619b.c
new file mode 100644
index 000000000000..689e7f517a76
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-rtd1619b.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTD1619B interrupt controller driver
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
+#define ISO_NMI_WDT_MASK     0x08008090
+#define ISO_NORMAL_MASK      0xf7ff7f6e
+#define MISC_NORMAL_MASK     0xffffded6
+#define MISC_UART1_MASK      0x00000028
+#define MISC_UART2_MASK      0x00002100
+
+#define ISO_ISR_EN_OFFSET    0x40
+#define ISO_ISR_OFFSET       0
+#define MISC_ISR_EN_OFFSET   0x80
+#define MISC_ISR_OFFSET      0xc
+
+enum rtd1619b_iso_isr_bits {
+	RTD1619B_ISO_ISR_TC3_SHIFT		= 1,
+	RTD1619B_ISO_ISR_UR0_SHIFT		= 2,
+	RTD1619B_ISO_ISR_LSADC0_SHIFT		= 3,
+	RTD1619B_ISO_ISR_WDOG1_NMI_SHIFT	= 4,
+	RTD1619B_ISO_ISR_IRDA_SHIFT		= 5,
+	RTD1619B_ISO_ISR_SPI1_SHIFT		= 6,
+	RTD1619B_ISO_ISR_WDOG2_NMI_SHIFT	= 7,
+	RTD1619B_ISO_ISR_I2C0_SHIFT		= 8,
+	RTD1619B_ISO_ISR_TC4_SHIFT		= 9,
+	RTD1619B_ISO_ISR_TC7_SHIFT		= 10,
+	RTD1619B_ISO_ISR_I2C1_SHIFT		= 11,
+	RTD1619B_ISO_ISR_HIFI_WAKEUP_SHIFT	= 14,
+	RTD1619B_ISO_ISR_WDOG4_NMI_SHIFT	= 15,
+	RTD1619B_ISO_ISR_TC8_SHIFT		= 16,
+	RTD1619B_ISO_ISR_VFD_SHIFT		= 17,
+	RTD1619B_ISO_ISR_VTC_SHIFT		= 18,
+	RTD1619B_ISO_ISR_GPIOA_SHIFT		= 19,
+	RTD1619B_ISO_ISR_GPIODA_SHIFT		= 20,
+	RTD1619B_ISO_ISR_ISO_MISC_SHIFT		= 21,
+	RTD1619B_ISO_ISR_CBUS_SHIFT		= 22,
+	RTD1619B_ISO_ISR_ETN_SHIFT		= 23,
+	RTD1619B_ISO_ISR_USB_HOST_SHIFT		= 24,
+	RTD1619B_ISO_ISR_USB_U3_DRD_SHIFT	= 25,
+	RTD1619B_ISO_ISR_USB_U2_DRD_SHIFT	= 26,
+	RTD1619B_ISO_ISR_WDOG3_NMI_SHIFT	= 27,
+	RTD1619B_ISO_ISR_PORB_HV_CEN_SHIFT	= 28,
+	RTD1619B_ISO_ISR_PORB_DV_CEN_SHIFT	= 29,
+	RTD1619B_ISO_ISR_PORB_AV_CEN_SHIFT	= 30,
+	RTD1619B_ISO_ISR_I2C1_REQ_SHIFT		= 31,
+};
+
+static const u32 rtd1619b_iso_isr_to_scpu_int_en_mask[32] = {
+	[RTD1619B_ISO_ISR_SPI1_SHIFT]		= BIT(1),
+	[RTD1619B_ISO_ISR_UR0_SHIFT]		= BIT(2),
+	[RTD1619B_ISO_ISR_LSADC0_SHIFT]		= BIT(3),
+	[RTD1619B_ISO_ISR_IRDA_SHIFT]		= BIT(5),
+	[RTD1619B_ISO_ISR_I2C0_SHIFT]		= BIT(8),
+	[RTD1619B_ISO_ISR_I2C1_SHIFT]		= BIT(11),
+	[RTD1619B_ISO_ISR_VFD_SHIFT]		= BIT(17),
+	[RTD1619B_ISO_ISR_GPIOA_SHIFT]		= BIT(19),
+	[RTD1619B_ISO_ISR_GPIODA_SHIFT]		= BIT(20),
+	[RTD1619B_ISO_ISR_PORB_HV_CEN_SHIFT]	= BIT(28),
+	[RTD1619B_ISO_ISR_PORB_DV_CEN_SHIFT]	= BIT(29),
+	[RTD1619B_ISO_ISR_PORB_AV_CEN_SHIFT]	= BIT(30),
+	[RTD1619B_ISO_ISR_I2C1_REQ_SHIFT]	= BIT(31),
+	[RTD1619B_ISO_ISR_WDOG1_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG2_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG3_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG4_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+};
+
+enum rtd1619b_misc_isr_bits {
+	RTD1619B_MISC_ISR_UR1_SHIFT	= 3,
+	RTD1619B_MISC_ISR_TC5_SHIFT	= 4,
+	RTD1619B_MISC_ISR_UR1_TO_SHIFT	= 5,
+	RTD1619B_MISC_ISR_TC0_SHIFT	= 6,
+	RTD1619B_MISC_ISR_TC1_SHIFT	= 7,
+	RTD1619B_MISC_ISR_UR2_SHIFT	= 8,
+	RTD1619B_MISC_ISR_UR2_TO_SHIFT	= 13,
+	RTD1619B_MISC_ISR_I2C5_SHIFT	= 14,
+	RTD1619B_MISC_ISR_I2C4_SHIFT	= 15,
+	RTD1619B_MISC_ISR_I2C3_SHIFT	= 23,
+	RTD1619B_MISC_ISR_SC0_SHIFT	= 24,
+	RTD1619B_MISC_ISR_SC1_SHIFT	= 25,
+	RTD1619B_MISC_ISR_SPI_SHIFT	= 27,
+	RTD1619B_MISC_ISR_FAN_SHIFT	= 29,
+};
+
+static const u32 rtd1619b_misc_isr_to_scpu_int_en_mask[32] = {
+	[RTD1619B_MISC_ISR_UR1_SHIFT]		= BIT(3),
+	[RTD1619B_MISC_ISR_UR1_TO_SHIFT]	= BIT(5),
+	[RTD1619B_MISC_ISR_UR2_TO_SHIFT]	= BIT(6),
+	[RTD1619B_MISC_ISR_UR2_SHIFT]		= BIT(7),
+	[RTD1619B_MISC_ISR_I2C5_SHIFT]		= BIT(14),
+	[RTD1619B_MISC_ISR_I2C4_SHIFT]		= BIT(15),
+	[RTD1619B_MISC_ISR_SC0_SHIFT]		= BIT(24),
+	[RTD1619B_MISC_ISR_SC1_SHIFT]		= BIT(25),
+	[RTD1619B_MISC_ISR_SPI_SHIFT]		= BIT(27),
+	[RTD1619B_MISC_ISR_I2C3_SHIFT]		= BIT(28),
+	[RTD1619B_MISC_ISR_FAN_SHIFT]		= BIT(29),
+};
+
+static const struct realtek_intc_mask rtd1619b_intc_iso_cfgs[] = {
+	{ ISO_NORMAL_MASK, },
+	{ ISO_NMI_WDT_MASK, },
+};
+
+static const struct realtek_intc_info rtd1619b_intc_iso_info[] = {
+	{
+		.isr_offset		 = ISO_ISR_OFFSET,
+		.scpu_int_en_offset	 = ISO_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1619b_iso_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1619b_intc_iso_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1619b_intc_iso_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1619b_intc_iso_desc = {
+	.banks    = rtd1619b_intc_iso_info,
+	.bank_num = ARRAY_SIZE(rtd1619b_intc_iso_info),
+};
+
+static const struct realtek_intc_mask rtd1619b_intc_misc_cfgs[] = {
+	{ MISC_NORMAL_MASK, },
+	{ MISC_UART1_MASK, },
+	{ MISC_UART2_MASK, },
+};
+
+static const struct realtek_intc_info rtd1619b_intc_misc_info[] = {
+	{
+		.isr_offset		 = MISC_ISR_OFFSET,
+		.scpu_int_en_offset	 = MISC_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1619b_misc_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1619b_intc_misc_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1619b_intc_misc_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1619b_intc_misc_desc = {
+	.banks    = rtd1619b_intc_misc_info,
+	.bank_num = ARRAY_SIZE(rtd1619b_intc_misc_info),
+};
+
+static const struct of_device_id realtek_intc_rtd1619b_dt_matches[] = {
+	{
+		.compatible = "realtek,rtd1619b-intc-iso",
+		.data = &rtd1619b_intc_iso_desc,
+	}, {
+		.compatible = "realtek,rtd1619b-intc-misc",
+		.data = &rtd1619b_intc_misc_desc,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, realtek_intc_rtd1619b_dt_matches);
+
+static DEFINE_NOIRQ_DEV_PM_OPS(realtek_intc_rtd1619b_pm_ops, realtek_intc_suspend,
+			       realtek_intc_resume);
+
+static int rtd1619b_intc_probe(struct platform_device *pdev)
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
+static struct platform_driver realtek_intc_rtd1619b_driver = {
+	.probe = rtd1619b_intc_probe,
+	.remove = realtek_intc_remove,
+	.driver = {
+		.name = "realtek_intc_rtd1619b",
+		.of_match_table = realtek_intc_rtd1619b_dt_matches,
+		.pm = pm_sleep_ptr(&realtek_intc_rtd1619b_pm_ops),
+	},
+};
+module_platform_driver(realtek_intc_rtd1619b_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek RTD1619B Interrupt Controller Driver");
-- 
2.43.0


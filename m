Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C62492E2A;
	Mon, 28 Sep 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588021; cv=fail; b=vD5Ye6HEJifZxz4Bqq1XYP6bTdcU0iBnQxEb+D6eCII8J9lRMjC8VyeOD3sHqwitOwC1Or1ophpb7cxNEYaumHk3QORYhESQM5kwVwYX3wIsP4+0Xb8+5MYyYEIpA1TkuTvlU6Rz2+55TqcmXoSJgim4nsGE2ybIveNcCTxmsIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588021; c=relaxed/simple;
	bh=seQ5fulfGgjrEjFuR61kUfZJEFwC1HE5OE87BeKrFL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UOdeuZT/ej/d+8DRL8+HieLnWStyRSNoQHaFBdiOwSS8wumuu45ZsHlBaj/M2pJVdUyngoHPXAFD7X1Zpxtg98TMXfkI+SsBZSeM8Dd4rQT1yaEzPiIwifbWXWYSacYwVee1/EndJsylqnUqP//P/jPOgeIQmRNg4J+xT69zK+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IfYSAnBI; arc=fail smtp.client-ip=40.107.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IfYSAnBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWjd3ZF9WCGYd732PI2peUvOKNepS5YunuLPhOh3TfSQ654mvJYErmoF7+x9ULQhZcTb5kbua/+HOajGhTybj4oNQZgJxMHdHJepis4Vve+PdI5KVQXsNhEGAavd9R5YhvE2Y5AR/FUG5LrzpclJJoc1agklFYNoKeSxxnvDzCfHEsB+ZEHLkcnOhL6qpo0gnWXYm5aqLW1pNqlqqLR5ikxoEHMEgBQsIFDbHVGYyLIRFlz6EfiJ4B3bEmmHhTI793H7mkk/AXvS04nKlXNAw78V/cLHjyoJNOu4v87Fr8uHK29tD+Z9cLelw8t6YcQ6uu2+hW1uxVICm+xDOIFBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sryoc/ub/Ayzx+DZoXvtBMvOE2/9MAsWSnA3Eamr1No=;
 b=F7h9SPg1UZL3VSg7w/N4GpsSpwTAt9a4+cv5Js5YstDPmp+1QKMFWERu4dVv3RsSwCGivv4OiZZMkKiYMbuTkAAftivCordSTRsDHQdDPkx+DUf0xXkJPs5Z7/RNlMXRfGBq9RPX9N9dSkvBpMhy2Ql91pxErJLDoRYWxZhJfGJQjZHMU6Dko1IthChHR77UuMklD8ITotwW6wMtfidCdwvTkTaICs9oLZ1eX12eCsGZ2EaYxjER0t6R6nO2ure70wbpV9P7yhnPzAStKUgJy3kXUryAM7Ai5cb9c/jnYAAu/zLV2dbL1PDQoaslZeHgtk/F8CsuR+5QU3CwNB7FfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sryoc/ub/Ayzx+DZoXvtBMvOE2/9MAsWSnA3Eamr1No=;
 b=IfYSAnBIlKmRes6Z5D04gi8D0yqQ99GD2MA+WZZpPHgIxy84NQJZx+fHfnE4bosRsWcL7bvV+XVj7UDk3VXHte9v9L1qVCJUw4WF/KnWe5yyaV4vuRkspmnP1NsD0bfa4wJ3XyaBImkXViwat0IzOFb5bMkSgfTORyn55jLhwTI=
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:33:33 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::48) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 09:33:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:33:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:16 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 04:33:13 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Mon, 28 Sep 2026 15:03:04 +0530
Subject: [PATCH v4 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-smmu-changes-v2-v4-2-3c79a14cd806@amd.com>
References: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
In-Reply-To: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790587986; l=11174;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=mgzHbrNVYpgRoq1X4XeQlMZrVBS3XvIKQgVnhg2zjXY=;
 b=L6qbY8BcUXU2CD0cRH9cdD+KOSAPgB9WmL544LgOyxuDWJ8friUb9U5rJUvf8ep2ubQxuDPlT
 AkbWwpME0lSDEppQUDgSNUQlhFuureNxoMiTboQ9ZRBnNxeqcPnLDuf
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: e64398ba-fdf8-4d8a-cb14-08df1d439070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P3oFA66XFb5LkRrwN4M14IKMBMoXzOciI/0wgf3cPLwfeRGxtelvJmKH9EJW1jQhPG/CtSzUZroMe+f6JXiVcWxN+lamuOPcwKxgN4l16a68dptt3eD226ge0MsHF/Y0iWz3yVgxpetkiRWvisQ6XkIXFRU5SAJZUM5LzntSdd1Yx9IQPFYi1/JsXBiTSErn1d9+kkV+B/7SJVYvXBdBnf5oAYwcBtg27oa5J3nmYP0CIztnXJwkZY8bL+DMW2FrVkzMLLrROYPaauBioYL2ulO12KInYRqn73jI4QEDIiQs8IE7k2cDQQ+GsFooFCCW+rfbODkIJVdSt7mjG5tjnG4pnXY2gKJRmOkyCEgE0WBZ5CPXpXfL7t7FqHi99s4N/pFWqCKd8LUT0dP6Br13+R0t7bavoeKjb3C2DggoJlDyaKxr4dXUeDlFqMDxtvAWfZJcJLR6qrABiXT7C5ZUGZ/tvBGIjA5qI0lf0Iw0bZbZ3lvA9zkxHdy7TpsSGSfOm7JTZBodLjOFBEuf3RFchtCPBUUV9vozJQoY6aeVgwSzRJZF2C+AGtepb3TLy0QX5/2fain2puVogkQ0/6S/PIXDqr/aBDQwnyOlPAlrGNMrqB60TWtfCe5pYF3fjJuijLCZzjWNikSaNCyKcPyF8SntRlb5P8PO0p/HKzcFWFiydcY5JPVXDY6o9bkVhl4KupobLC9Xf4/XmEJlknIjog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NdnfBducUYt9CL8I8r2Pzt1boBaYvGMIEg8FUauvxKQd18yE/kuYQIpWf24K9ldRqOOCPPOJG2TCMUtG4ez0WBxknVF51yPbaaUdrHIdbMWLaUPDYT82pKf+lx6QvjflWPV6Z9u/+Tp+vfdQXPqeH4xHgWnIhH4j/aoHz57fVbF4atgd8nHElzWBS/AtwfmrmKF9lgvpetE1SE3DmfK/yGXi9fGmHDCbpamatyorF1cLkzdWtuOywisgjwvTSqqo30ROLOBfFa/SyaiHCsLNCvFLdZouTQLDkvBEzV1GUKaGRJEwN9BrNYxe7SQBwtxoerY2ONHo2KHogL/3fnqHaUp3wcorQo4pQb2PbUx+zgVXuxgHsiaTGPpks+kYR75bxo/FmXWgcdT0LMOIcYjXrqCFq9rh6tLPrWLse9OTd3wwdyeFJ5FoAa/SrRPF9YjC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:33:33.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64398ba-fdf8-4d8a-cb14-08df1d439070
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

The Xilinx Versal NET SoC implements a Control and Status Register (CSR)
block in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL
interrupts. Interrupts are enabled, cleared, and acknowledged
through this block by writing to the relevant registers. Once an
interrupt is acknowledged, it is forwarded to the parent interrupt
controller for further processing.

Add an irqchip driver for the CSR block. The driver registers as an
interrupt controller and chains to the upstream SMMUv3 driver, so
that the standard SMMUv3 driver does not require modification while still
supporting Xilinx SoCs.

The CSR block can also gate the SMMUv3 CMDQ_SYNC completion interrupt
(bit 1), but it is intentionally left unsupported. The Linux arm-smmu-v3
driver signals CMDQ_SYNC completion via polling or MSI and never requests
a wired CMD_SYNC interrupt, so there is no in-kernel consumer for it.
Exposing it as a child line would only risk spurious, never-acked
interrupts, and it is omitted from the DT binding for the same reason.

This driver is intended to operate in conjunction with the ARM SMMUv3
driver and the kernel's IOMMU DMA infrastructure. These dependencies
are not selected directly in Kconfig to avoid introducing dependency
recursion.

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
 MAINTAINERS                           |  10 ++
 drivers/irqchip/Kconfig               |  10 ++
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-xilinx-smmu-csr.c | 249 ++++++++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e50747a621c..40ef350285a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30141,6 +30141,16 @@ F:	Documentation/misc-devices/xilinx_sdfec.rst
 F:	drivers/misc/xilinx_sdfec.c
 F:	include/uapi/misc/xilinx_sdfec.h
 
+XILINX SMMU CSR IRQ DRIVER
+M:	Anirudha Sarangi <anirudha.sarangi@amd.com>
+M:	Tushar Nimkar <tushar.nimkar@amd.com>
+L:	git@amd.com
+L:	linux-arm-kernel@lists.infradead.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
+F:	drivers/irqchip/irq-xilinx-smmu-csr.c
+
 XILINX TRNG DRIVER
 M:	Mounika Botcha <mounika.botcha@amd.com>
 M:	Harsh Jain <h.jain@amd.com>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b795..81a2c9107601 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -842,4 +842,14 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
 
+config IRQCHIP_XILINX_SMMU_CSR
+	bool "Xilinx SMMU CSR Interrupt Driver"
+	depends on ARCH_ZYNQMP
+	select IRQ_DOMAIN
+	help
+	  This driver does the initial handling of SMMU interrupts before
+	  forwarding them to the ARM SMMU v3 driver.  It is intended for
+	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
+	  interrupts.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd8471..16a5fd126c9a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_IRQCHIP_XILINX_SMMU_CSR)	+= irq-xilinx-smmu-csr.o
diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xilinx-smmu-csr.c
new file mode 100644
index 000000000000..397ba709e306
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Versal Net SMMU CSR interrupt controller driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * Vendor CSR block that gates the ARM SMMUv3 wired interrupts. Chains
+ * off the single GIC parent line and demultiplexes the CSR status into
+ * three children (eventq, gerror, priq), each enabled/acked
+ * via SMMU_CSR_IER/IDR/ISR that the ARM SMMUv3 driver requests individually.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/* Interrupt types */
+#define SMMU_INTR_EVENT		BIT(0)
+#define SMMU_INTR_GLOBAL	BIT(2)
+#define SMMU_INTR_PRI		BIT(3)
+
+/* Mask for the SMMU interrupts this driver demultiplexes */
+#define SMMU_INTR_ALL		(SMMU_INTR_EVENT | \
+				 SMMU_INTR_GLOBAL | SMMU_INTR_PRI)
+
+/* Every interrupt source the CSR block implements (incl. unsupported CMD_SYNC) */
+#define SMMU_INTR_HW_ALL	GENMASK(3, 0)
+
+#define SMMU_CSR_ISR		0x24	/* Interrupt Status (raw, W1C)   */
+#define SMMU_CSR_MASK		0x28	/* Interrupt Mask (RO): 1 = masked */
+#define SMMU_CSR_IER		0x2c	/* Interrupt Enable (W1 to unmask) */
+#define SMMU_CSR_IDR		0x30	/* Interrupt Disable (W1 to mask)  */
+
+/**
+ * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
+ * @base:	MMIO base address of the CSR registers
+ * @domain:	Interrupt domain for the child interrupts
+ * @parent_irq:	parent (GIC) interrupt this block is chained to
+ * @lock:	protects the SMMU_CSR_IER/IDR/ISR read and writes
+ */
+struct xilinx_smmu_csr {
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	int			parent_irq;
+	raw_spinlock_t		lock;
+};
+
+enum xilinx_smmu_csr_irq {
+	SMMU_CSR_IRQ_EVENTQ = 0,
+	SMMU_CSR_IRQ_GERROR = 2,
+	SMMU_CSR_IRQ_PRIQ = 3,
+	SMMU_CSR_IRQ_NR,
+};
+
+static u32 xilinx_smmu_csr_hwirq_mask(irq_hw_number_t hwirq)
+{
+	if (hwirq >= SMMU_CSR_IRQ_NR)
+		return 0;
+
+	return BIT(hwirq) & SMMU_INTR_ALL;
+}
+
+static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IDR);
+}
+
+static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IER);
+}
+
+static void xilinx_smmu_csr_irq_eoi(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
+	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_ISR);
+}
+
+static struct irq_chip xilinx_smmu_csr_chip = {
+	.name		= "xlnx-smmu-csr",
+	.irq_mask	= xilinx_smmu_csr_irq_mask,
+	.irq_unmask	= xilinx_smmu_csr_irq_unmask,
+	.irq_eoi	= xilinx_smmu_csr_irq_eoi,
+	/* Defer sticky ISR clear until the threaded SMMU handler drains it. */
+	.flags		= IRQCHIP_EOI_THREADED,
+};
+
+static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
+{
+	struct xilinx_smmu_csr *csr = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	u32 status, mask, active, pending, spurious;
+
+	chained_irq_enter(chip, desc);
+
+	/*
+	 * SMMU_CSR_ISR latches raw, pre-mask status, so gate it with the mask
+	 * register to only act on sources that are actually enabled.
+	 */
+	status = readl(csr->base + SMMU_CSR_ISR);
+	mask = readl(csr->base + SMMU_CSR_MASK);	/* 1 = masked */
+	active = status & ~mask;
+
+	/*
+	 * Defend against any enabled source this driver does not demultiplex
+	 * (e.g. CMD_SYNC). It would never be acked and would livelock the
+	 * parent line, so mask and clear it here.
+	 */
+	spurious = active & ~SMMU_INTR_ALL;
+	if (spurious) {
+		writel(spurious, csr->base + SMMU_CSR_IDR);
+		writel(spurious, csr->base + SMMU_CSR_ISR);
+	}
+
+	pending = active & SMMU_INTR_ALL;
+
+	while (pending) {
+		irq_hw_number_t hwirq = __ffs(pending);
+
+		if (generic_handle_domain_irq(csr->domain, hwirq)) {
+			/*
+			 * No mapped consumer: mask and clear so an unexpected
+			 * source cannot spin the parent line.
+			 */
+			writel(BIT(hwirq), csr->base + SMMU_CSR_IDR);
+			writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
+		}
+
+		pending &= ~BIT(hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int virq,
+				      irq_hw_number_t hwirq)
+{
+	struct xilinx_smmu_csr *csr = d->host_data;
+
+	if (!xilinx_smmu_csr_hwirq_mask(hwirq))
+		return -EINVAL;
+
+	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_fasteoi_irq);
+	irq_set_chip_data(virq, csr);
+	irq_set_status_flags(virq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops xilinx_smmu_csr_domain_ops = {
+	.map	= xilinx_smmu_csr_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static int __init xilinx_smmu_csr_init(struct device_node *node, struct device_node *parent)
+{
+	struct xilinx_smmu_csr *csr;
+	int ret;
+
+	if (WARN_ON_ONCE(!parent))
+		return -EINVAL;
+
+	if (irq_find_matching_fwnode(of_fwnode_handle(node),
+				     DOMAIN_BUS_ANY))
+		return -ENODEV;
+
+	csr = kzalloc(sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&csr->lock);
+
+	csr->base = of_iomap(node, 0);
+	if (!csr->base) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	/*
+	 * Start from a known state: mask and clear *every* source the block
+	 * implements, including CMD_SYNC (bit 1) which this driver does not
+	 * service. The CSR ORs (status & ~mask) onto a single parent line, so
+	 * a source left unmasked and latched by a prior boot stage (firmware,
+	 * kexec) would assert the line forever with no one to ack it. Masking
+	 * the whole set here makes that impossible; the ARM SMMUv3 driver
+	 * unmasks the sources it needs via the child irq_unmask() callbacks.
+	 */
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_IDR);
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_ISR);
+
+	csr->domain = irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_IRQ_NR,
+					       &xilinx_smmu_csr_domain_ops,
+					       csr);
+	if (!csr->domain) {
+		pr_err("%pOF: failed to create irq domain\n", node);
+		ret = -ENOMEM;
+		goto unmap;
+	}
+
+	csr->parent_irq = irq_of_parse_and_map(node, 0);
+	if (!csr->parent_irq) {
+		pr_err("%pOF: failed to map parent irq\n", node);
+		ret = -EINVAL;
+		goto remove_domain;
+	}
+
+	irq_set_chained_handler_and_data(csr->parent_irq,
+					 xilinx_smmu_csr_irq_handler, csr);
+
+	pr_debug("%pOF: Xilinx SMMU CSR interrupt controller registered\n", node);
+
+	return 0;
+
+remove_domain:
+	irq_domain_remove(csr->domain);
+unmap:
+	iounmap(csr->base);
+free:
+	kfree(csr);
+	return ret;
+}
+
+IRQCHIP_DECLARE(xilinx_smmu_csr, "xlnx,versal-net-smmu-csr",
+		xilinx_smmu_csr_init);

-- 
2.34.1


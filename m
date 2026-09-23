Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B0455619;
	Wed, 23 Sep 2026 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147819; cv=fail; b=a0V16V6METzbBYN5t78L2tXB5PXVcNGJqMTE4hxzk0wUn6bDd52ZndJkn2V6/YIkqURhMly0VyZveIXxxBAwTZoRAf1sltQdbTdXJe5/7bv8IR07WfK6mFrcDlZB0yhP5UzjT9GbYc38y6DgDsjSY1XpxLtsXL4TTSFcsP6IBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147819; c=relaxed/simple;
	bh=cd1s4Azjiaan3QJ6KCdCEE+IW2xrOsLFs8yNsIAxA64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FQvPA/nIqT5p+BvJBDYnKmN5sX9SdGPE+M8dNBShqSlQX0ljnVJN71K0Mz7BiRTlLkOa6htl33eZRieHXRAgqtRYHLOLlXluymFsRg+qlwncgKr4q8brqYkv6bZ9GmLu0a1tZwNmGHoNVk9J5hB2ONzmweiUv7KCveizfzWcaiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sjoO3zIE; arc=fail smtp.client-ip=40.107.208.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sjoO3zIE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSsyWBCVNb2oshyOnGKVWs590nv/vMAMiKHqq2lB93IrS2+pDQkNLN7y5yUN4R3um1U0+XPpDuM0gYyycqaMMrg3VTnRjHnMige7qDJuRoLuyBamhL1wal2aCDFR/Nn5RBU4kZXavw19ivgOSuEXWu1ShqMa1PYnS8bZWBorf2oHlOc+N8dixN2C0ZB/GqXG1EIOaJOg/qHku6pdOR9Snq1HVs2KkARupv5sg8s5tQg32UKCHUkuJPAQM9st74NqgZ3pmwCSt2ZWmGgw70gQj9QwAs+uJHFdYPWxJDqJo08z9uxyhD5j+x9XOi/9rGfHXwKCPSH60p11HZIou/ydTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/bt75G82cMvb378MAxC3qJ8KBtckfkerQp+3s0MMbI=;
 b=PUQzA001/tTzarlHuO0YcVk7h7n2j9N2Ob/CUxXjn9Tgdx0HEa5VCAkJiiwPrduLeAYhzTfkzPfUFF2Po3xSvVqIvm9SLrbmN9zkT6OIiNk1MkAVgqOX6TtCRhxhP2nEzDIEDpiTuGoFLz8W2Ae7QHRJsnNkkR/QiCYmL3Qzutv1pFsM1N1RDpEuN5cYQ58KGkM3WXehBnQuaEGfunbX/FZN1MrNLE1C1hBcZborj6bm/ppy5S5mTPbZSxz9BBjr/Ugnu8MAZFWEys/Pat06zurhp3cy5gZS/LlnbMhu5SvI+EO6u+56HyDdrhWRqQTErETTwim3tvgnjwi8KVeCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/bt75G82cMvb378MAxC3qJ8KBtckfkerQp+3s0MMbI=;
 b=sjoO3zIEi+Me8cvQNWik2yjZ4/eJM8cyRYa9cc0HGJ9iISLj9QFGupJ4+2KBX75G2/Qf0PZC5Q63BvXMtuAdza07YfQHA5G6JOnOnYNsXwLGaMu8dKWnh/lUn4/RHU7zI6cEvTqDLrOfqc9H2NhWbK5kWnwNQ2Vso4nxij7pJ90=
Received: from CH0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:b0::7)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:16:50 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::2f) by CH0PR03CA0002.outlook.office365.com
 (2603:10b6:610:b0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Wed,
 23 Sep 2026 07:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 07:16:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 02:16:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 02:16:44 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 02:16:41 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Wed, 23 Sep 2026 12:46:32 +0530
Subject: [PATCH v3 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-smmu-changes-v2-v3-2-87bd09ba9605@amd.com>
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
In-Reply-To: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790147794; l=11062;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=WyuIzVc50YtXxAnU4kOXkRWx8weDO8F0rXwCtnqZHfQ=;
 b=aIQ0G/E85BEhWJn0Ojyx/czCvTiTAfvtOMBE4oa30HB9etCsP/J03PZMheoBjVA0MP6flRBl6
 zJd76PGQYeKAIUZdRWMU4PG0fxDia7ial4GenPN90MHMy5ECWi6cQIW
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a7aac8-ad09-4cc6-7cb6-08df1942a2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EB0uL2w76VrjrT8+uhI56L4cBbrmh764WUBVSrSFAPBvaCM2v1YLJ6CqLRXr9VCAOClF2jnUQa1HiaMEgau1sc1z5dmDBwNZJ2vwL2LWOFSirdufWe07K9Ob7Zgm6+sotnO3AyjmZqDlNbkmzX5ZVfE9n+0zG2V7KyAi76bg6ZCelm8PnHJHtoeE2QGLPVOllyIXuOeOuUMqgbTbi6jN/Cs/lP7a98NpHlkZ0FFds1Mg77TGZOkI5TLQ1ynSXCKBlpI7VGNsb3kz65KD1LsSZRKDa8T3p22gPxgMZZn9toh8/WXnsTcEVfwzMy92a6W1v1R3thnq1j0DOhfFZFpR+YZ4Z5IYEgzyubiCDpVpX5e5+DkGQHTn6DwrhKl26vCssZg5MA2lDYW8R3CWW51T+bbOv/SezIOMSEXEYAr484Jm1OLbcejCXdYzViH4LKJ7V1CL0BvBu0czpmszDWw9+I0q/Xq7bBA9gR66JFxnsIQShfgpPZGWJtQLxWn5zvjsZeQASmRF3J3JGNNknoKMY4q73UcFgU3/x6o/0VWjYabbq2io5dklopzmN4zDMVJXmszNBmN4hU5qzjlmDZNluNu/xLEXw6DLwvLXI6pVFG29dD3VHNGPezaLF4ldIqurXlCxICwAETaSIAKW+9O3ZQgIokoQlNddeYXb/wryF/uN5Bg9XDxh7IYGHPJJzvKucRaENvqtLlTjnL2aF2lZvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z/mnNW0DxcH/bg6n7ghSbZS3pRqvViWrnjcZaDiMleCDTsAafJXwnY851H3n2SG9HkjSuWpUwjhPeO6fGbAWSK/GP5SlN/9JSn7SwL1ejFFxT9OsWi1WCIqXgbwtrky7W1MscpnEK9yJW291L0JO2GXGONSVgA5AFeJiNH+AShmWjvfuaXHOzNwy3G9oeP9rBrm3v6VdMJW7LtF3UwPEI7LOt3cKJ+f1HFOUxcagZX4NIkn/L9gxum4sxyZ85l7pnkoF2kB5D8V/kJtGD4WVC3OAF+Q2sNExVwhK1/piKjKaezabiTdXSwqVoOs60PFbeBF9oH6oWFcFaZGCZK3Pe6m5ElT2qTu75W3MQSla7MshNu4pXtaz/0+1EBPXh+OD0pdnVFFgGMxZO+F/mMzMFRozaiJfhiMHNiUgS4+KqJDAbeFJjqKCPB+mZ65u8Be9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:16:50.1374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a7aac8-ad09-4cc6-7cb6-08df1942a2ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176

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
 drivers/irqchip/irq-xilinx-smmu-csr.c | 247 ++++++++++++++++++++++++++++++++++
 4 files changed, 268 insertions(+)

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
index 000000000000..b29aafd01dbe
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,247 @@
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
+static void xilinx_smmu_csr_irq_ack(struct irq_data *d)
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
+	.irq_ack	= xilinx_smmu_csr_irq_ack,
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
+	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_level_irq);
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


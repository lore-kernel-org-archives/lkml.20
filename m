Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16937187E;
	Fri, 18 Sep 2026 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713633; cv=fail; b=WPuvZUCYtNLgtpCJoHLMC3/Yl5sxMv7rBobKlITrFFsko8RaRlKW+xcg1hCz/dXDxCqGGFYVAyjaxqmsfnHZ6tbDpEPjHRozgsH9a8TXICmSgcompfEyZ18cYrOvf+oQr0cyTiEVycYvTiY5NRyr7Kao9AmQCjTwbm9/s5du9+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713633; c=relaxed/simple;
	bh=9oTVsPlRFDkCyBZWMiLCTllbS7I6/GmCNOtXWx9/Tr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TtRt1fYmbUDtKw+sdjK7oSlALPT7Y508D/vsguOUGQoZyQoPFR5F7OwyMSESgPoj4nYcNsDWEX2p8b4+i0BV6kD5uJ+wQCQEuzuw5O1gBhuagp8bE8NItFTCWNd0bAaTRRMtQojlgc/jjLoafN/3X7qdfyXR+YRGWVCx5bYjEBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JTZi7/KZ; arc=fail smtp.client-ip=52.101.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JTZi7/KZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCJOxzQBeY/B1Dn6DaOpnmrG/D1TwhQydCnxJyCko+ODwybzo69TiCG0a8E/YXTR7tg2lEMCAF9n7qYnHh2ydOUvWIqhXid3vNJq18qbQCxGXVZwvaYB7dhG4f9b0R42bGh3x+cET2+AWGFbG5pHrdOTzbxvE1RSlTEQ3Ha/gDsUuYKYdEKSYBbhGKqGbgAAnJT7znkwyr4mKqDS/RIKquOlvqGpv+NqHP0IyI7lRe55ZNQVfNNFvI+K4qz9UOS9VM1b4V3CPjFroJVz8KWtl2tLh50Oy3oKmbN9wNjItpq0kV9L8fnMOWZWpC6WQUgPeqoqHyv1M/CoWzmrHSLdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43LRIBP4hUgndMXgMuSIhgQuKckQnewLdCiFY4Fk/os=;
 b=pp+DZBVeeG6rt27d+nEQ2R/nsAHogXjxYtd5PPu9n4cIBOk0oBtU+5ebVrXggx7ejxMb/tAPSpWwsY+y9RvOKoAHz0+twtTi2iD/mvrtqMeiYeSwBfB/i4Poq1EPuWvagNoMlVRZk+BWolqn9DcwSCX1v8ghJorc3Le3azVLQXuAEvlwkyJC6eihCvuoNrtQJ5rQxrxVeopW67f0mPQsSPm0GZJAXm4Yk++ULgUrwMI5onGs8ebp/bLvGv6WnTTU64Bd+fH8bnGgk1gorO9cyYQ9jZdywLbzNJ7Advzgqnxw3Fxy0tBzjlGHukcwZ7YD/wdNWZmnHJQ+37Q4wDa3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43LRIBP4hUgndMXgMuSIhgQuKckQnewLdCiFY4Fk/os=;
 b=JTZi7/KZ+A/BrT6Dcddd0ltCk06mko/BHnESBwgxFtcvWGZq7o3kte+oMwCmk9xZ7YKHSweyq5528UUhsSTxKTZ7qT0NN1I6uzY9Mm+wK0jRDTOQBLR0ujrJIb0uqEceFBxJHvcPTWafZcR7DHu2AECtwbAGsL19GTKUa3I8lJs=
Received: from SJ0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:a03:3a1::12)
 by FT1PR12MB679827.namprd12.prod.outlook.com (2603:10b6:170:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:40:26 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::4c) by SJ0PR03CA0367.outlook.office365.com
 (2603:10b6:a03:3a1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 06:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 06:40:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:21 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 01:40:18 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Fri, 18 Sep 2026 12:09:34 +0530
Subject: [PATCH v2 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-smmu-changes-v2-v2-2-adda681ab983@amd.com>
References: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
In-Reply-To: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789713611; l=9690;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=aN5LkxJWjSxzVVL/Ex/rhtXwc0Gk49BcrM/v+OqPWSA=;
 b=Aknz2eOmBa85QODsjY9WynZwMTzBGx3Wv+18fGC4zv3EwV3Q8kmL3VcDvGSBbGFWdiAdLupv2
 /lhYLp21+aaDs2BoxnvGyb8KLn67ooFvgMmGl7ClDRTbaBDQyQFygtn
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|FT1PR12MB679827:EE_
X-MS-Office365-Filtering-Correlation-Id: 14dc7b6b-2212-4073-1ffc-08df154fb8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rpUl1Mr7Aa4DL7fRqKPumn19852ZNs+0rZ+jZIzMhidos59es12OHmaU8nDFoptjZNqeczg2nTWsy2EgI7Yu4ys+VZPSEaVuPkNlnCxxwnfy7tk8vTBATYXwYpv9YmZFUrUm24g9jITUa7iOhRIxVHSLZ97GucZ5IcHBCwNUMbOwjBBHv/7ZLoCMbCrimSBfnF/4RWkUOCIzAPrF9yz/UzmaxBprAr1WIOKZHfUDRGOwR6yasJ9saKhloi1I+4zB+DgyB7irSxoJf7ZFtgJGFYRubKr/woq3/mWzpWjlXZ/gFx/jWBHByrxHluWpgqU8I/5orandu/ol94rGaQQ3yHVIzRcrjBLJt8X7myYZ24DDhsMwUhhJ84XLhn8NkWta6szEBnEV2BQ3ffYrbBRMXSJEcdBWd1Z+A7fNedo5gj8USCT0d0rOHjV0lZtLQVbqaL0jq8d7dy1xiqU7frJSOg3sIlqzEPybkKoPN7zDu9PUJHxP6H2kgswu9LOpA17egi/SgxtFRMfvmJ/tjhl4VqFyIumYcjoJ9gItNS0vIc4bNG7rqd+sLOs80xzH0Yj0HkwdwCcz7knPXe3NJ1mYQuI5sDGwP81/4UoZE1aAFrFd1y4ozVTMLbYJSFWZ2deiRyJlK+LVVPrxMKql4vykSUvnCB98VoZwJf+C2E1vBokDwTwORnWrDqA+kbN1DM0x+eJAkT7Qydh1OTeMmbkiFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yn9cy8P9gLkMLvHKjfdVzHpZry+tgLpKUnwnGlXmeemeCFNR34PyNaTAMIhbePx/xbT2yjdHyjOpevuimJIV/ym/+Fvk0FNB45LwBg3vzMPnvKZjMs+y9tRDF5ac2zmDoP9RGWSYwvDkhsJ+8HguOhxf52MZYiuKNAKYG7OtSzPy/W3eANPObQlttOirYQ/78rQHBrytvunN+16PTpeWjKhy8YjvzHw8p9groW4mhwUz+bbiUuzqntBUB1Tw+YloJTKkATg91aiAwAxSOPVRcSyzjvfFRM3o6LpUE45LWNaD9jajkOdQewwbeND9l/83lw8VyuKw+wIDvqZSBGdO1FCC93qlsFdXOhZnvQ8m66Uo7hsZSe/rlPyv0gMqRD9Q2Grx85gYeHW/qosIa4TYjtgi4naXDDSzE1FQ2ndzDZc0BaRoLCiV5eZZpeuezDJp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 06:40:25.6459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14dc7b6b-2212-4073-1ffc-08df154fb8d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB679827

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
 drivers/irqchip/irq-xilinx-smmu-csr.c | 216 ++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+)

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
index 000000000000..d9b575c6c58b
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,216 @@
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
+/* Mask for all SMMU interrupts */
+#define SMMU_INTR_ALL		(SMMU_INTR_EVENT | \
+				 SMMU_INTR_GLOBAL | SMMU_INTR_PRI)
+
+#define SMMU_CSR_ISR		0x24	/* Interrupt Status */
+#define SMMU_CSR_IER		0x2c	/* Interrupt Enable */
+#define SMMU_CSR_IDR		0x30	/* Interrupt Disable */
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
+	u32 status, pending;
+
+	chained_irq_enter(chip, desc);
+
+	status = readl(csr->base + SMMU_CSR_ISR);
+
+	/* Only service sources we support; SMMU_CSR_ISR latches raw status */
+	pending = status & SMMU_INTR_ALL;
+
+	while (pending) {
+		irq_hw_number_t hwirq = __ffs(pending);
+		int ret;
+
+		ret = generic_handle_domain_irq(csr->domain, hwirq);
+		if (ret)
+			pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu: %d\n",
+					   hwirq, ret);
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
+	/* Start from a known state: all sources disabled, latches cleared. */
+	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
+	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);
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


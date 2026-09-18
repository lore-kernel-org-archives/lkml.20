Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896723E9F9E;
	Fri, 18 Sep 2026 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713629; cv=fail; b=kiT5NvEQSneunLQWuiLVCmRNzQWxUK/M2uHxDw6/vDb/Y7OoDhGYiSlZoJYM76XdkCw6TMkXFbvbJYlOk32l1ChmJB0OBs2y1HVh1F2YZlNpb0y9X8Wsd76vNDm17rAVbN/uzS7exhkvqgq0ADJfMYFODmaRPoRpgN9tlV9Qcmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713629; c=relaxed/simple;
	bh=C+jvHUyi5Y2dzypWGc5HeO5Q2CaEejdlMp7TQ+qNjRY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Dm1n+kuOtoKnEeiFv1qZm94L5OxtORxSiopaOcOolZucFCwyX9mThDaVTnqiEbIrZIjCGxqGz0h+NEq31NcGDDrTVMBI/h/WJ221fJtusWxCyb/ZjCJbdA5INlQjJhcKtULIF5le2UyaCkqbmo4o9w9N5iMCNpeWp2tZvrNvetk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CWtkvlQ1; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CWtkvlQ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqTP9YvlUbSFkdGmaTgcDoOaQ14J0GdYt/g26hQwlzKm4S27CXczsnZBwYJW1H7dAbuee9cxbsyn6eJ3BJC+ucZTYROeJ9tPAifOUNa2ovu/5XBQGJa8CtpJMFYev7HJSzKNiEIbGhT4S31RCOek6AWuyohBhBygDuFIGko25q8oeSz3R6E3Xhzkw+lYKv0/8jp+1YgQQSSQNVKLwoH1/wjC4kDoHPrmS/lDfDJsFRkWJk0X4hmkTy9gsWnR7zzofA556F61gOSyyWjSQsfjWFQFwnXQjMKd/RR+rkysxTzY1yQafNBE47AkZffgPDWLVMAof7qgjkB2+aE2bwq/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc2CpmxZlpGXRPdZK9C2V9KLfjRfcmf31HZv41npPEk=;
 b=ngMAJ5en3pxfxWd5+oe4GhW27GRGt1aN82gwbM5r6sUW6bZSkBSLYupO2nVT3JZtHdCGXGnd6q+Yk9t+d7p6YaHsJA6jo4vR0UCYsLYFXP+DauoflDsJzyhO4HmMvi1J1T9Ib6Y4ymxglQuLj0say0ckUuHp658hEB8xd4y2+JL5xX1Oa6fUJ95/e0L7ul153PdiCAm5bopF3l7VlmwDumQVJfBoGYrZQpKClhaZdYHeONNIfk6FPSE8rpdvBJtpa07x/tdxb1jKjlSqTJP6Pjp2MKqhXTWdMDla5g3etfsQDVrsx9+7QkQasHHUh2jKLQSbbnWiIXwxen5N9cH7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc2CpmxZlpGXRPdZK9C2V9KLfjRfcmf31HZv41npPEk=;
 b=CWtkvlQ1YFxXrtDKZWSh1CX17TEs6Iy+azIZbZAGtwh+SK0XN81K0BkTmwjRhOwM3BaPBDEMXfcTOmDM7i5Kl9YfhpAnKxS3oLJB/th6GPOUxd/MZtZSvuNDZFjZHY+rDnUuuUVIPmKyBAe5J9rZoZxckIPHrk4xdiUsqTruYzE=
Received: from SJ0PR13CA0099.namprd13.prod.outlook.com (2603:10b6:a03:2c5::14)
 by CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:40:21 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a4) by SJ0PR13CA0099.outlook.office365.com
 (2603:10b6:a03:2c5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Fri, 18
 Sep 2026 06:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 06:40:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:14 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 01:40:11 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Subject: [PATCH v2 0/2] Add Xilinx Versal NET SMMU CSR interrupt controller
 support
Date: Fri, 18 Sep 2026 12:09:32 +0530
Message-ID: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXcrGoC/yXM3QpAQBCG4VvRHJtisVq3IgeswSg/7SAl925x+
 PT1vRcIOSaBIrjA0cHCy+yhwgDsUM89IbfeoCKlIxPnKNO04z8JHgqN7fI0yVpttAH/Wh11fH7
 FsvotezOS3d4M3PcDUu6vOnMAAAA=
X-Change-ID: 20260917-smmu-changes-v2-9cf7435d6969
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789713611; l=2228;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=C+jvHUyi5Y2dzypWGc5HeO5Q2CaEejdlMp7TQ+qNjRY=;
 b=xyh/09gl4AiYqhM5vQjGWv4iJihqouYXamWOLoSe6DZHoNhJTml/i8vgrE+rUX7xfjPiCpyLB
 gof0JIWWALBD5SQq+bA2Uxejg4+fsrarZ2F3Aqmlerq/uRumLGCE8jQ
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|CHXPR12MB999244:EE_
X-MS-Office365-Filtering-Correlation-Id: 59da483d-9f84-4e92-2d66-08df154fb57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|6133799003|11063799006|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	O044vQWGROm/gGq9jFqCQ310WgQAzGOHxpePxNE1Wrmt1LspmIzPsz7PuaiLAbD0M7Dmc4bXzIBQhdejyYzHTUihnBrNF75oUVEttW3LUMGekgGns0cPTJEIMIBrBPsfsdm6mpNaSXizRfnVm1w9RjiAZn6IC2OCVAjrl3SZ29b/jGy4xr6ZKized0QHFl17azu+PPmkdPiZAH4+mawy6mjV6EebkSP9KYFqOizfMTuzllfYIuMvJUUZrI1DkkqK1f/CVYCkjDloKsImP+GRps6uO98JUP6BrJ/XbgzQ24IAWfVI2O0p+IWJCShovEfll5I3vCJ44DdK6Da694Ti39XIE+mcr5CcBhBHTDgISdhYjuF/dP4gJ0ZvlNgE6lCgti4rQZINJf9By/yZEQxvSYcLTL1zm3swUE2XghIdNwrUGlQYffBwQsc3qtsfpZEKe4D38qFBDiCetZ6xw31t/enToCllrTfAO8/Q6u8EoTBgGFWd0UIF29ApPGPR1GtW45v94Wb364nB+Kcg68YONYZJJM0A3tbf23+J7z86PzNXLrW5669DufIVR+WWQjqJe3n2hhno5Y9ImYGWDf8fFJfTt3KtFIMeec7+9JlRBl8vffdBEDyTMCcsq7V3KRZHpcOFHTsCNC0tlNdSJMJV+Hc9i1n22UXk3M05SLm9kpw07y/GLYOpD/M5Lh5+xNMHqK7lkFh2m6+mhS8BkBq9YA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(6133799003)(11063799006)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bKXXOcHmAYyCxz5eH+vStaAo/8cegurxBCvHkqDH4iUlAbzw9usVfwg061mRX4NGRxyeQo6zvPWWh8ld5y7l8WjTGtPWQxDi60JaicWapCqnqVMyMWi1KhWL2zeoUt0Tpb4Wi4mBvN+hiuPb6Q6JtgtNDql0G5nxKg7VYQ3ckdzMDP5Woxk/Z8SYBkWHz8r09Nu/033PiHblCGGB1Jn9SRB1mHb+l9UUjozsr5VeuYnIyax4dZqKRCgAeL87zrdTmZJui3S7aC4n4cQhu/pxTr0hkgAIQf6CHvZdey3hl34VjBaAF7SW2qhn8V70oFPft00LGPsLPJY37S6Ua9tHFOdl1VNp154WXKfYHTn2eVXpLouM1NEkWH9hgItk22bzKa4kv58nrIRTqD6W/i574S7VnrxQt4b3KP1RTGHOV9q8n0VFF0aqloYKg8GPHheA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 06:40:20.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59da483d-9f84-4e92-2d66-08df154fb57d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999244

On Xilinx Versal NET, the ARM SMMUv3 EVENTQ, PRIQ and GERROR interrupts
are routed through a vendor-specific Control and Status Register (CSR)
block, where they must be enabled, cleared and acknowledged before being
forwarded to the parent GIC.
This series adds a small irqchip driver for the CSR block that chains to
the standard arm-smmu-v3 driver, so the generic SMMUv3 driver needs no
changes.
Patch 1 adds the DT binding.
Patch 2 adds the irqchip driver.

Changes in v2:
- Posted as a proper threaded series with a cover letter (v1 patches
  went out individually).
- dt-bindings (Krzysztof):
  - Dropped the irrelevant arm,smmu-v3 consumer node from the example.
  - Dropped the unused "smmu_irq_csr" label from the example.
  - Dropped the redundant "binding" from the patch subject.
- irqchip driver (Thomas):
  - Aligned kernel-doc member descriptions and used "interrupt"
    instead of "IRQ".
  - Used guard(raw_spinlock)() in the mask/unmask/ack callbacks and
    addressed the comments related to lock handling.
  - Thomas suggested using devm-managed allocation and irqdomain APIs;
    however, the driver is registered via IRQCHIP_DECLARE() and has no
    associated struct device, so devm APIs cannot be used. This code is
    left unchanged.

Link to v1:
https://lore.kernel.org/all/20260817105233.1557748-1-tushar.nimkar@amd.com/
https://lore.kernel.org/all/20260817105251.1557770-1-tushar.nimkar@amd.com/

Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
Anirudha Sarangi (2):
      dt-bindings: interrupt-controller: Add Xilinx Versal NET SMMU CSR
      irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

 .../xlnx,versal-net-smmu-csr.yaml                  |  75 +++++++
 MAINTAINERS                                        |  10 +
 drivers/irqchip/Kconfig                            |  10 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-xilinx-smmu-csr.c              | 216 +++++++++++++++++++++
 5 files changed, 312 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-smmu-changes-v2-9cf7435d6969

Best regards,
--  
Tushar Nimkar <tushar.nimkar@amd.com>


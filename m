Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089443;
	b=ZZQBZCq70uOZSbvYY9IRUmGN4JQoeJL9xYG4paFYB0I/JW31LfmA67Imt2B+ZtcLhzyg
	 wQfILNKaFpUOR0Kd1gmq8GAwNJswaCX8IeMVwXxbQLs76e35NHxOojq2b+7AK2HesRkxC
	 kRJAQLcu6w4ap83sWtrCuMb8nICDo7ikv+z27G1p8bFJRmxAUKEdKX3m7+TX5IY02wREO
	 04KXyJUVmKfqiq9uXqIt3pGbRwGulGSBh5xXCIYNxibYDWUTZRqB4eOcNXrcpv5MHq0Cq
	 r81gA9FoF9sKEWx6KiuP/RyL8Q6VQE3I16JukGsvt0Qhp+F60DQH3aHMSP3daWUdmlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089443;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NxBObVsltdbynxq1pWk2bCUk68mBss/DalUZwaFBnLQ=;
	b=I2yN/htNywLXgFNZljg+i5hyi8O6Pz6MFch0yTZcDotr1rIfRHfw9DdGz3eykRyoZ/4t
	 3jhnQQYQ3SMJ35kTg9hULwJ39kFMJ2az0Oh7bGcGcXWKTVCzuk3Fak+2u82Ki2ZqusdJP
	 h6f1Eihq5+kbPU3bEh6sNUFHJE6qmkk5taR5+g96+03mXdIwd1GlQ+6wGo0RrFVoZMw/i
	 R1oSV511bXIv1p+IohvpE6trwP4rA40XNoSydxBosWMywvRcX7Bv4YMDgh7z0gvzEU4aE
	 Sizasqw0V4UfGPelN4q+oM8myiSPqJcQlGOsGZAA6Y7Ky8WJOl9H9z7dXu2HlVlLyJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jYIOYpxb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DF606A33B;
	Sat,  7 Nov 2026 22:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3DF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jYIOYpxb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqxghxyJnDif+cLhyJBO/AWAovArbAeQ4PtjR365hUu2wG4bEbdbjDnABA/sEli/cKLZWOhzQDFWV0L4UAimJ5VKq8wrkF6/x7u+lTTBdhJZM8hJqdGJPl4De6bBIEQ9KCsr96atCyAMxl6CO0WZr2Anc0HzPdHtxhM5fQcMBPJX6L/lfXvF1yMttmvUMg1wyKCybCwzDuTXSrwukoPbsdnGilkL+G7L4xAIq68sEDPUNeh7ugI4Nwutx/7ImqOvoZU/z0IwvfyHzHNS/gKAV/y65X8fnz3+W8W5B7MqwHWNlrEdaoMVw6eulcRLGaL+dtWE5bF/VJXg+jOR7LJdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxBObVsltdbynxq1pWk2bCUk68mBss/DalUZwaFBnLQ=;
 b=ycQTaic70hGZcCaCp1aTglUoeJgfcsh5mmmwt/4LgE3tIPvaq78VE3dwy8dBHboAucuZjIjCfKy2EUg6XC6TiatiR4GB7//CmEhLjHRUnIflxstz4fad+98wTXJ9YUShCWxC4iIPxmnWomtwM1XMBXvet9kR4jm8kUqrNgqoE8YwkhzUxi4z00fxK/Qprj5Rf0GLxAdppxAG/AQaVSUEVBnDPDCmonnNlxZvB9xq9/ZC36hs1pQX2JrcgL0Yc6vCVBcyibl++cK893Yd8pmNh3hQS1NHjRq4UX4l2e4lX2iLboGkhWxc8z5oXlaCBRAenQleF9zuC8+HR1n/vYzGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxBObVsltdbynxq1pWk2bCUk68mBss/DalUZwaFBnLQ=;
 b=jYIOYpxb0ybvTjejkcxiKVD7QaZfqZ/FycnfPBwYgTRoS2MlLY1o/DCaIZZP1/hvZcuW199V3yG8v8/asQJVX9diK8TB5TlTJ5oPaT1lgsgknvRzDkxdR7v+13FNCx5llbWhxVDz623ZHWIzpTjlik9dXM2wqMypAGsqx708vCE=
Received: from BN8PR04CA0066.namprd04.prod.outlook.com (2603:10b6:408:d4::40)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 7 Nov
 2026 22:10:34 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:408:d4:cafe::72) by BN8PR04CA0066.outlook.office365.com
 (2603:10b6:408:d4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:32 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 02/11] soundwire: amd: add ACP7B/7E/7F hardware backend
Date: Sun, 8 Nov 2026 03:37:57 +0530
Message-ID: <20261107220913.4058072-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f9f0fc-46af-44c3-e0b0-08df3d1bf139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|261102123227099003|22082099003|56012099006|11063799006|10067099003|261022075727099003|261026135527099003|261021135927099003|261026130827099003|261022113327099003|261021130227099003|261026140227099003|261022115727099003|261009223027099003|261028144727099003|261022105027099003|261021123027099003|261021133027099003|261026121527099003|261021121427099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tJlGz+ngNnK4eHuhMICxmwjhkdGGxD/5fVtMU3IQ3H/Yni0PQW+eiUyNSklNuUi5jQOO2pC+UnPdS6pnYpGb2UHDkhhWiVbs6fe+vuCLM5Wafjen6owqxAPcgGuwu37bfMxZJI8MLJeUFKzyGFyRcSwhK/lmccK4Y7v65STTj9Ycd9e2Jp4KxtD6nH+Qd4q3wiVvKq8Zd1rM2JooW5hVFT6KoSQDsfkbH85emGSf+MWcrzbVB5Zmw9LcPg+Wrs5oDjHXeSMnIfVeQ/lDPPBuMHRmDquIRF1sK3WEicbWYjhKH4NXFVfdKl1JKeGvCZV8i6V1YLUrql7vdYAJrNes4R3nxsZSEd3g3CupD2CLzYNKxZI9MlIPs/qU1PFWX1Ihdpx3KEdNIzk2Raue5aFxRZpePPvx/2QlG87WMFTh9V/6rDq2PWNZRM5DdK/kSRygLkOti0jCeTLRNGEBnxV/QNBplv0R6m7rIr+f1qKolTDuTAmDOFTF/VywZUQ3UNn1XmTveQvmRoSB9GBrKZRJI5ZHggrPP8A9iIw/xBsLjUG0rlOdZFLmt01fxVpguB2ZTFHSVP6UeMXszR8QXGRi3EOe6XOU724lGnYOvGWe3OU7s0Re0M9jENixgsqKycZcwL/o+uyST5YvqtAk2oNnamumLgeELjx5E+a5pnfq4dYyIt0egj2/MuGtDtvWXQl8UyVDf3UPiPlmsWYq/rh3ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(261102123227099003)(22082099003)(56012099006)(11063799006)(10067099003)(261022075727099003)(261026135527099003)(261021135927099003)(261026130827099003)(261022113327099003)(261021130227099003)(261026140227099003)(261022115727099003)(261009223027099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021133027099003)(261026121527099003)(261021121427099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VtNzu2klDKM8mf9WfghrplL/cncq9UEnF47Py0ILMqTz4NtF9Lozx2+JYn00AIXnqf24IOpsm3XJaoYsGbJ//VhbUN8iWe/XWaPGB7EHV6itthgLxb8E5f9GjLU1rPr6xRxOeAYVyfkvyZTT/6KBHmzk+UChtn3TlAyqHizxrPXmH3W3jtmfte6a+ymq9cRYhhC7Guh0l4AlDy/4g39CEGGYFimCnLdCo13c9EQi2UFtUutvy+zKBUCQaw4uk+q//nlztk/zbpDZdciY+rBXKBLNJgk9G+H4bgrPdB4q7jweY4FiF0FYhXlDw7NFAgQVDVfBTIhonz62aZhGocyUgCILI3QUOY+S42tZpNzOiFzW7k3ahTVPICxf1J7pcuPgBy/M1YjSIngc57d98OuKLGj6agy0LYWmYCadZHFNs3y3abP852g9XRO55F9bCws/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:33.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f9f0fc-46af-44c3-e0b0-08df3d1bf139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135

Add amd_acp7x_manager.c implementing the hardware backend for
ACP7B/7E/7F revisions: IRQ thread, slave status work, port
configuration, DAI PCM capabilities, and hw_ops/port_ops tables.

Wire the new backend into amd_manager_common.c by extending the
per-revision switch/case in amd_sdw_update_slave_status_work(),
amd_sdw_irq_thread(), amd_sdw_hw_init_ops(), and
amd_sdw_manager_probe(). The probe reads ACP7X_SW_GLOBAL_CAPABILITIES
to determine TX/RX port counts and sets the ACP7x-specific mmio base
using the ACP7X_SDW_MANAGER_REG_OFFSET stride.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/Makefile             |   2 +-
 drivers/soundwire/amd_acp7x_manager.c  | 949 +++++++++++++++++++++++++
 drivers/soundwire/amd_manager.h        |   7 +
 drivers/soundwire/amd_manager_common.c |  49 ++
 4 files changed, 1006 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/amd_acp7x_manager.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 1011599c20e7..11f7aa8b0476 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,7 @@ soundwire-bus-y += irq.o
 endif
 
 #AMD driver
-soundwire-amd-y := amd_init.o amd_manager_common.o amd_acp63_manager.o
+soundwire-amd-y := amd_init.o amd_manager_common.o amd_acp63_manager.o amd_acp7x_manager.o
 obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
new file mode 100644
index 000000000000..33fc9ced48b6
--- /dev/null
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -0,0 +1,949 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * SoundWire AMD ACP7x (ACP7B/7E/7F) Manager hardware ops
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/pm_runtime.h>
+#include <linux/wait.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "bus.h"
+#include "amd_init.h"
+#include "amd_manager.h"
+
+#define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
+
+static u32 acp7x_sdw_manager_reg_mask_array[AMD_ACP7X_SDW_MAX_MANAGER_COUNT] = {
+	ACP7X_SDW0_EXT_INTR_MASK,
+	ACP7X_SDW1_EXT_INTR_MASK,
+	ACP7X_SDW2_EXT_INTR_MASK,
+	ACP7X_SDW3_EXT_INTR_MASK,
+};
+
+static struct sdw_manager_acp7x_dp_reg acp7x_sdw_dp_reg[] = {
+	{ACP7X_SW_TX_DP0_FRAME_FORMAT, ACP7X_SW_TX_DP0_0_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP0_0_HCTRL_BANK0, ACP7X_SW_TX_DP0_0_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP0_0_LANE_CTRL_BANK0, ACP7X_SW_TX_DP0_0_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP0_0_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP0_FRAME_FORMAT, ACP7X_SW_TX_DP0_1_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP0_1_HCTRL_BANK0, ACP7X_SW_TX_DP0_1_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP0_1_LANE_CTRL_BANK0, ACP7X_SW_TX_DP0_1_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP0_1_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP0_FRAME_FORMAT, ACP7X_SW_TX_DP0_2_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP0_2_HCTRL_BANK0, ACP7X_SW_TX_DP0_2_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP0_2_LANE_CTRL_BANK0, ACP7X_SW_TX_DP0_2_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP0_2_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP0_FRAME_FORMAT, ACP7X_SW_TX_DP0_3_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP0_3_HCTRL_BANK0, ACP7X_SW_TX_DP0_3_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP0_3_LANE_CTRL_BANK0, ACP7X_SW_TX_DP0_3_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP0_3_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP1_FRAME_FORMAT, ACP7X_SW_TX_DP1_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP1_HCTRL_BANK0, ACP7X_SW_TX_DP1_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP1_LANE_CTRL_BANK0, ACP7X_SW_TX_DP1_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP1_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP2_FRAME_FORMAT, ACP7X_SW_TX_DP2_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP2_HCTRL_BANK0, ACP7X_SW_TX_DP2_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP2_LANE_CTRL_BANK0, ACP7X_SW_TX_DP2_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP2_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP3_FRAME_FORMAT, ACP7X_SW_TX_DP3_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP3_HCTRL_BANK0, ACP7X_SW_TX_DP3_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP3_LANE_CTRL_BANK0, ACP7X_SW_TX_DP3_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP3_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP4_FRAME_FORMAT, ACP7X_SW_TX_DP4_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP4_HCTRL_BANK0, ACP7X_SW_TX_DP4_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP4_LANE_CTRL_BANK0, ACP7X_SW_TX_DP4_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP4_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP5_FRAME_FORMAT, ACP7X_SW_TX_DP5_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP5_HCTRL_BANK0, ACP7X_SW_TX_DP5_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP5_LANE_CTRL_BANK0, ACP7X_SW_TX_DP5_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP5_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP6_FRAME_FORMAT, ACP7X_SW_TX_DP6_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP6_HCTRL_BANK0, ACP7X_SW_TX_DP6_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP6_LANE_CTRL_BANK0, ACP7X_SW_TX_DP6_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP6_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_TX_DP7_FRAME_FORMAT, ACP7X_SW_TX_DP7_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_TX_DP7_HCTRL_BANK0, ACP7X_SW_TX_DP7_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_TX_DP7_LANE_CTRL_BANK0, ACP7X_SW_TX_DP7_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_TX_DP7_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP0_FRAME_FORMAT, ACP7X_SW_RX_DP0_0_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP0_0_HCTRL_BANK0, ACP7X_SW_RX_DP0_0_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP0_0_LANE_CTRL_BANK0, ACP7X_SW_RX_DP0_0_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP0_0_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP0_FRAME_FORMAT, ACP7X_SW_RX_DP0_1_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP0_1_HCTRL_BANK0, ACP7X_SW_RX_DP0_1_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP0_1_LANE_CTRL_BANK0, ACP7X_SW_RX_DP0_1_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP0_1_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP0_FRAME_FORMAT, ACP7X_SW_RX_DP0_2_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP0_2_HCTRL_BANK0, ACP7X_SW_RX_DP0_2_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP0_2_LANE_CTRL_BANK0, ACP7X_SW_RX_DP0_2_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP0_2_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP0_FRAME_FORMAT, ACP7X_SW_RX_DP0_3_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP0_3_HCTRL_BANK0, ACP7X_SW_RX_DP0_3_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP0_3_LANE_CTRL_BANK0, ACP7X_SW_RX_DP0_3_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP0_3_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP1_FRAME_FORMAT, ACP7X_SW_RX_DP1_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP1_HCTRL_BANK0, ACP7X_SW_RX_DP1_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP1_LANE_CTRL_BANK0, ACP7X_SW_RX_DP1_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP1_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP2_FRAME_FORMAT, ACP7X_SW_RX_DP2_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP2_HCTRL_BANK0, ACP7X_SW_RX_DP2_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP2_LANE_CTRL_BANK0, ACP7X_SW_RX_DP2_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP2_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP3_FRAME_FORMAT, ACP7X_SW_RX_DP3_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP3_HCTRL_BANK0, ACP7X_SW_RX_DP3_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP3_LANE_CTRL_BANK0, ACP7X_SW_RX_DP3_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP3_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP4_FRAME_FORMAT, ACP7X_SW_RX_DP4_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP4_HCTRL_BANK0, ACP7X_SW_RX_DP4_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP4_LANE_CTRL_BANK0, ACP7X_SW_RX_DP4_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP4_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP5_FRAME_FORMAT, ACP7X_SW_RX_DP5_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP5_HCTRL_BANK0, ACP7X_SW_RX_DP5_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP5_LANE_CTRL_BANK0, ACP7X_SW_RX_DP5_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP5_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP6_FRAME_FORMAT, ACP7X_SW_RX_DP6_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP6_HCTRL_BANK0, ACP7X_SW_RX_DP6_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP6_LANE_CTRL_BANK0, ACP7X_SW_RX_DP6_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP6_BLOCK_PKGMODE_GRPCTRL_BANK0},
+	{ACP7X_SW_RX_DP7_FRAME_FORMAT, ACP7X_SW_RX_DP7_SAMPLEINTERVAL_BANK0,
+	 ACP7X_SW_RX_DP7_HCTRL_BANK0, ACP7X_SW_RX_DP7_HCTRL_OFFSET_BANK0,
+	 ACP7X_SW_RX_DP7_LANE_CTRL_BANK0, ACP7X_SW_RX_DP7_CHANNEL_ENABLE_BANK0,
+	 ACP7X_SW_RX_DP7_BLOCK_PKGMODE_GRPCTRL_BANK0},
+};
+
+static_assert(ARRAY_SIZE(acp7x_sdw_dp_reg) == ACP7X_SDW_MAX_DAI);
+
+/* =========================================================
+ * ACP7.x (ACP7B/7E/7F) hardware-specific implementation
+ * =========================================================
+ */
+
+static int amd_acp7x_sdw_set_clk_sel(struct amd_sdw_manager *amd_manager, u32 freq)
+{
+	u32 clk_sel;
+
+	if (!freq) {
+		dev_err(amd_manager->dev, "Invalid bus clock frequency: %d\n", freq);
+		return -EINVAL;
+	}
+	switch (freq) {
+	case 3072000:
+	case 6144000:
+	case 12288000:
+	case 24576000:
+		mutex_lock(amd_manager->acp_sdw_lock);
+		clk_sel = readl(amd_manager->acp_mmio + ACP_SW_48MHZ_CLK_SEL);
+		clk_sel |= BIT(amd_manager->instance);
+		writel(clk_sel, amd_manager->acp_mmio + ACP_SW_48MHZ_CLK_SEL);
+		mutex_unlock(amd_manager->acp_sdw_lock);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static u32 amd_sdw_set_initial_frame_shape(u32 rows, u32 cols)
+{
+	u32 val = 0;
+	int c;
+	int r;
+
+	r = sdw_find_row_index(rows);
+	c = sdw_find_col_index(cols);
+	val = FIELD_PREP(AMD_SDW_MCP_FRAME_SHAPE_ROW_MASK, r);
+	val |= FIELD_PREP(AMD_SDW_MCP_FRAME_SHAPE_COL_MASK, c);
+	return val;
+}
+
+static int amd_acp7x_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	u32 val;
+	int divider;
+	int ret;
+
+	dev_dbg(amd_manager->dev, "mclk %d max %d row %d col %d frame_rate:%d\n",
+		prop->mclk_freq, prop->max_clk_freq, prop->default_row,
+		prop->default_col, prop->default_frame_rate);
+
+	if (!prop->default_frame_rate || !prop->default_row) {
+		dev_err(amd_manager->dev, "Default frame_rate %d or row %d is invalid\n",
+			prop->default_frame_rate, prop->default_row);
+		return -EINVAL;
+	}
+	ret = amd_acp7x_sdw_set_clk_sel(amd_manager, prop->max_clk_freq);
+	if (ret)
+		return ret;
+	if (!bus->params.curr_dr_freq) {
+		dev_err(amd_manager->dev, "Invalid current bus frequency\n");
+		return -EINVAL;
+	}
+	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
+	if (divider == 4)
+		divider = 3;
+	writel(divider, amd_manager->mmio + ACP7X_SW_CLK_FREQUENCY_CTRL_BANK0);
+	writel(divider, amd_manager->mmio + ACP7X_SW_CLK_FREQUENCY_CTRL_BANK1);
+
+	/*
+	 * Sync rows_index/cols_index and bus params from the already-selected
+	 * default_row/col. For dynamic_frame, these were set by compute_params()
+	 * in the frequency switch-case; for static frame, they come from firmware.
+	 * Both set_frameshape() and pre_bank_switch() rely on these fields.
+	 */
+	amd_manager->cols_index = sdw_find_col_index(prop->default_col);
+	amd_manager->rows_index = sdw_find_row_index(prop->default_row);
+	bus->params.col = prop->default_col;
+	bus->params.row = prop->default_row;
+	val = amd_sdw_set_initial_frame_shape(prop->default_row, prop->default_col);
+	writel(val, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK0);
+	writel(val, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK1);
+	return 0;
+}
+
+static int amd_acp7x_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager,
+					   u32 lower_data, u32 upper_data,
+					   u64 *response)
+{
+	u32 lower_resp, upper_resp;
+	u32 sts;
+	int ret;
+
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_IMM_CMD_STS, sts,
+				 !(sts & AMD_SDW_IMM_CMD_BUSY), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret) {
+		dev_err(amd_manager->dev, "SDW%x previous cmd status clear failed -CMD BUSY\n",
+			amd_manager->instance);
+		return ret;
+	}
+	if (sts & AMD_SDW_IMM_RES_VALID) {
+		dev_err(amd_manager->dev, "SDW%x manager is in bad state sts:0x%x\n",
+			amd_manager->instance, sts);
+		writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP7X_SW_IMM_CMD_STS);
+	}
+	if (!readl(amd_manager->mmio + ACP7X_SW_SSP_COUNTER))
+		writel(AMD_SDW_SSP_COUNTER_VAL, amd_manager->mmio + ACP7X_SW_SSP_COUNTER);
+	writel(upper_data, amd_manager->mmio + ACP7X_SW_IMM_CMD_UPPER_WORD);
+	writel(lower_data, amd_manager->mmio + ACP7X_SW_IMM_CMD_LOWER_QWORD);
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_IMM_CMD_STS, sts,
+				 (sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret) {
+		dev_err(amd_manager->dev, "SDW%x cmd response timeout occurred\n",
+			amd_manager->instance);
+		return ret;
+	}
+	upper_resp = readl(amd_manager->mmio + ACP7X_SW_IMM_RESP_UPPER_WORD);
+	lower_resp = readl(amd_manager->mmio + ACP7X_SW_IMM_RESP_LOWER_QWORD);
+	writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP7X_SW_IMM_CMD_STS);
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_IMM_CMD_STS, sts,
+				 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret) {
+		/* Response already latched above; timeout here is non-fatal.
+		 * The residual IMM_RES_VALID bit will be cleared by the bad-state
+		 * guard on the next invocation, provided IMM_CMD_BUSY is not also stuck.
+		 */
+		dev_warn(amd_manager->dev, "SDW%x cmd status retry failed\n",
+			 amd_manager->instance);
+	}
+	*response = ((u64)upper_resp << 32) | lower_resp;
+	return 0;
+}
+
+static void amd_acp7x_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
+{
+	u64 response;
+	u32 resp_low, resp_high;
+
+	mutex_lock(&amd_manager->bus.msg_lock);
+	resp_low = readl(amd_manager->mmio + ACP7X_SW_PING_STATUS_REGISTER_LOW);
+	resp_high = readl(amd_manager->mmio + ACP7X_SW_PING_STATUS_REGISTER_HIGH);
+	response = (u64)resp_high << 32 | resp_low;
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
+	mutex_unlock(&amd_manager->bus.msg_lock);
+	amd_sdw_process_ping_status(response, amd_manager);
+}
+
+static u32 amd_acp7x_sdw_read_ping_status(struct sdw_bus *bus)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	u64 response;
+	u32 slave_stat;
+	u32 resp_low, resp_high;
+
+	/* Called by sdw_show_ping_status() which holds msg_lock. */
+	lockdep_assert_held(&bus->msg_lock);
+
+	resp_low = readl(amd_manager->mmio + ACP7X_SW_PING_STATUS_REGISTER_LOW);
+	resp_high = readl(amd_manager->mmio + ACP7X_SW_PING_STATUS_REGISTER_HIGH);
+	response = (u64)resp_high << 32 | resp_low;
+	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
+	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
+	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
+	return slave_stat;
+}
+
+static int amd_acp7x_init_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	u32 val;
+	int ret;
+
+	writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP7X_SW_EN);
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_EN_STATUS, val, val, ACP_DELAY_US,
+				 AMD_SDW_TIMEOUT);
+	if (ret)
+		return ret;
+	writel(AMD_SDW_BUS_RESET_REQ, amd_manager->mmio + ACP7X_SW_BUS_RESET_CTRL);
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_BUS_RESET_CTRL, val,
+				 (val & AMD_SDW_BUS_RESET_DONE), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret)
+		return ret;
+	writel(AMD_SDW_BUS_RESET_CLEAR_REQ, amd_manager->mmio + ACP7X_SW_BUS_RESET_CTRL);
+	ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_BUS_RESET_CTRL, val, !val,
+				 ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret) {
+		dev_err(amd_manager->dev, "Failed to reset SoundWire manager instance%d\n",
+			amd_manager->instance);
+		return ret;
+	}
+	writel(AMD_SDW_DISABLE, amd_manager->mmio + ACP7X_SW_EN);
+	return readl_poll_timeout(amd_manager->mmio + ACP7X_SW_EN_STATUS, val, !val,
+				  ACP_DELAY_US, AMD_SDW_TIMEOUT);
+}
+
+static int amd_acp7x_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	u32 val;
+
+	writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP7X_SW_EN);
+	return readl_poll_timeout(amd_manager->mmio + ACP7X_SW_EN_STATUS, val, val, ACP_DELAY_US,
+				  AMD_SDW_TIMEOUT);
+}
+
+static int amd_acp7x_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	u32 val;
+
+	writel(AMD_SDW_DISABLE, amd_manager->mmio + ACP7X_SW_EN);
+	return readl_poll_timeout(amd_manager->mmio + ACP7X_SW_EN_STATUS, val, !val, ACP_DELAY_US,
+				  AMD_SDW_TIMEOUT);
+}
+
+static void amd_acp7x_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+{
+	u32 val, acp_ext_intr_cntl, sdw_intr_cntl;
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	val = acp7x_sdw_manager_reg_mask_array[amd_manager->instance];
+	acp_ext_intr_cntl = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
+	acp_ext_intr_cntl |= val;
+	writel(acp_ext_intr_cntl, amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+
+	/* This interrupt control register is private to this manager instance. */
+	sdw_intr_cntl = readl(amd_manager->acp_mmio +
+			      ACP7X_EXTERNAL_SW_INTR_CNTL + (amd_manager->instance * 4));
+	sdw_intr_cntl |= BIT(16);
+	writel(sdw_intr_cntl, amd_manager->acp_mmio +
+	       ACP7X_EXTERNAL_SW_INTR_CNTL + (amd_manager->instance * 4));
+	writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP7X_SW_ERROR_INTR_MASK);
+}
+
+static void amd_acp7x_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+{
+	u32 val, acp_ext_intr_cntl, sdw_intr_cntl;
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	val = acp7x_sdw_manager_reg_mask_array[amd_manager->instance];
+	acp_ext_intr_cntl = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
+	acp_ext_intr_cntl &= ~val;
+	writel(acp_ext_intr_cntl, amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+
+	/* This interrupt control register is private to this manager instance. */
+	sdw_intr_cntl = readl(amd_manager->acp_mmio +
+			      ACP7X_EXTERNAL_SW_INTR_CNTL + (amd_manager->instance * 4));
+	sdw_intr_cntl &= ~BIT(16);
+	writel(sdw_intr_cntl, amd_manager->acp_mmio +
+	       ACP7X_EXTERNAL_SW_INTR_CNTL + (amd_manager->instance * 4));
+	writel(0x00, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+	writel(0x00, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	writel(0x00, amd_manager->mmio + ACP7X_SW_ERROR_INTR_MASK);
+}
+
+static void amd_acp7x_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
+{
+	u32 frame_size;
+
+	frame_size = (amd_manager->rows_index << 3) | amd_manager->cols_index;
+	writel(frame_size, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK0);
+	writel(frame_size, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK1);
+}
+
+static void amd_acp7x_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 wake_ctrl;
+
+	wake_ctrl = readl(amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	if (enable)
+		wake_ctrl |= AMD_SDW_WAKE_INTR_MASK;
+	else
+		wake_ctrl &= ~AMD_SDW_WAKE_INTR_MASK;
+	writel(wake_ctrl, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+}
+
+static int amd_acp7x_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 intr_cntl1;
+	u32 sdw_host_wake_irq_mask;
+
+	if (!amd_manager->wake_en_mask)
+		return 0;
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		sdw_host_wake_irq_mask = ACP7X_SDW0_HOST_WAKE_INTR_MASK;
+		break;
+	case ACP_SDW1:
+		sdw_host_wake_irq_mask = ACP7X_SDW1_HOST_WAKE_INTR_MASK;
+		break;
+	case ACP_SDW2:
+		sdw_host_wake_irq_mask = ACP7X_SDW2_HOST_WAKE_INTR_MASK;
+		break;
+	case ACP_SDW3:
+		sdw_host_wake_irq_mask = ACP7X_SDW3_HOST_WAKE_INTR_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mutex_lock(amd_manager->acp_sdw_lock);
+	intr_cntl1 = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL1);
+	if (enable)
+		intr_cntl1 |= sdw_host_wake_irq_mask;
+	else
+		intr_cntl1 &= ~sdw_host_wake_irq_mask;
+	writel(intr_cntl1, amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL1);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+	return 0;
+}
+
+static int amd_acp7x_sdw_set_device_state(struct amd_sdw_manager *amd_manager,
+					  u32 target_device_state)
+{
+	u32 sdw_dev_state;
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  ACP7X_SDW0_DEVICE_STATE_MASK);
+		break;
+	case ACP_SDW1:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  ACP7X_SDW1_DEVICE_STATE_MASK);
+		break;
+	case ACP_SDW2:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  ACP7X_SDW2_DEVICE_STATE_MASK);
+		break;
+	case ACP_SDW3:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  ACP7X_SDW3_DEVICE_STATE_MASK);
+		break;
+	default:
+		mutex_unlock(amd_manager->acp_sdw_lock);
+		return -EINVAL;
+	}
+	writel(sdw_dev_state, amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+	return 0;
+}
+
+void amd_acp7x_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
+{
+	int retry_count = 0;
+
+	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
+		writel(0, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+		writel(0, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	}
+
+update_status:
+	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
+	/*
+	 * During the peripheral enumeration sequence, the SoundWire manager interrupts
+	 * are masked. Once the device number programming is done for all peripherals,
+	 * interrupts will be unmasked. Read the peripheral device status from ping command
+	 * and process the response. This sequence will ensure all peripheral devices enumerated
+	 * and initialized properly.
+	 */
+	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
+		if (retry_count++ < SDW_MAX_DEVICES) {
+			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
+			       ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
+			       ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+			acp_sdw_read_and_process_ping_status(amd_manager);
+			goto update_status;
+		} else {
+			dev_err_ratelimited(amd_manager->dev,
+					    "Device0 detected after %d iterations\n",
+					    retry_count);
+		}
+	}
+}
+
+static void amd_acp7x_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
+{
+	u32 wake_en, wake_en_mask;
+
+	pm_request_resume(amd_manager->dev);
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		wake_en_mask = BIT(ACP_SDW0);
+		break;
+	case ACP_SDW1:
+		wake_en_mask = BIT(ACP_SDW1);
+		break;
+	case ACP_SDW2:
+		wake_en_mask = BIT(ACP_SDW2);
+		break;
+	case ACP_SDW3:
+		wake_en_mask = BIT(ACP_SDW3);
+		break;
+	default:
+		return;
+	}
+	mutex_lock(amd_manager->acp_sdw_lock);
+	wake_en = readl(amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+	wake_en &= ~wake_en_mask;
+	writel(wake_en, amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
+void amd_acp7x_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
+{
+	u32 status_change_8to11;
+	u32 status_change_0to7;
+
+	status_change_8to11 = readl(amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_8TO11);
+	status_change_0to7 = readl(amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_0TO7);
+	if (!status_change_0to7 && !status_change_8to11)
+		return;
+
+	/*
+	 * Clear both hardware status registers immediately after reading,
+	 * before any processing.  New events that arrive during processing
+	 * are captured in the next IRQ cycle rather than being missed in
+	 * the read-to-clear window.  All subsequent logic works entirely
+	 * from the local copies.
+	 * All bits in both STATUS_8TO11 and STATUS_0TO7 are write-zero-to-clear
+	 * (W0C) per the hardware register specification.
+	 */
+	writel(0x00, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_8TO11);
+	writel(0x00, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_0TO7);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_acp7x_sdw_process_wake_event(amd_manager);
+		/*
+		 * Strip the wake bit from the local copy and continue to
+		 * process any device-state-change in STATUS_0TO7 that arrived
+		 * simultaneously (e.g. slave attaching during POWER_OFF_MODE
+		 * resume while the slave's SDCA interrupt keeps wake asserted).
+		 */
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+		if (!status_change_8to11 && !status_change_0to7)
+			return;
+	}
+	/*
+	 * PREQ requires the SoundWire bus clock to be running and cannot
+	 * be asserted while the manager is in POWER_OFF_MODE D3.  When WAKE
+	 * and PREQ arrive simultaneously the manager is in clock-stop mode
+	 * (D0 with bus clock stopped), where hardware registers are
+	 * accessible and reading PING status is valid.
+	 */
+	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT)
+		amd_acp7x_sdw_read_and_process_ping_status(amd_manager);
+	else if (status_change_0to7 || (status_change_8to11 & AMD_SDW_8TO11_DEV_STATUS))
+		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
+	if ((status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) ||
+	    (status_change_8to11 & AMD_SDW_8TO11_DEV_STATUS) || status_change_0to7)
+		schedule_work(&amd_manager->amd_sdw_work);
+}
+
+static int amd_acp7x_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
+{
+	u32 val;
+	int ret;
+
+	if (amd_manager->clk_stopped) {
+		val = readl(amd_manager->mmio + ACP7X_SW_CLK_RESUME_CTRL);
+		val |= AMD_SDW_CLK_RESUME_REQ;
+		writel(val, amd_manager->mmio + ACP7X_SW_CLK_RESUME_CTRL);
+		ret = readl_poll_timeout(amd_manager->mmio + ACP7X_SW_CLK_RESUME_CTRL, val,
+					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
+					 AMD_SDW_TIMEOUT);
+		if (ret) {
+			dev_err(amd_manager->dev, "SDW%d clock stop exit failed: %d\n",
+				amd_manager->instance, ret);
+			return ret;
+		}
+
+		writel(0, amd_manager->mmio + ACP7X_SW_CLK_RESUME_CTRL);
+		ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
+		if (ret < 0) {
+			dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n", ret);
+			return ret;
+		}
+		amd_manager->clk_stopped = false;
+	}
+	return 0;
+}
+
+static int amd_acp7x_sdw_suspend(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n", bus->link_id);
+		return 0;
+	}
+	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		acp_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
+		acp_sdw_wake_enable(amd_manager, false);
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		acp_enable_sdw_interrupts(amd_manager);
+	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		acp_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
+		acp_sdw_wake_enable(amd_manager, false);
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		ret = acp_disable_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+	}
+	return acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+}
+
+static int amd_acp7x_sdw_suspend_runtime(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n", bus->link_id);
+		return 0;
+	}
+	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		acp_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
+		acp_sdw_wake_enable(amd_manager, true);
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		acp_enable_sdw_interrupts(amd_manager);
+	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		acp_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
+		acp_sdw_wake_enable(amd_manager, true);
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		ret = acp_disable_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+	}
+	ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+	if (ret)
+		return ret;
+	if (amd_manager->wake_en_mask) {
+		u32 val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+
+		if (!val) {
+			writel(1, amd_manager->acp_mmio + ACP_PME_EN);
+			dev_dbg(amd_manager->dev, "ACP_PME_EN enabled\n");
+		}
+	}
+	return 0;
+}
+
+static int amd_acp7x_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	u32 wake_en;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n", bus->link_id);
+		return 0;
+	}
+	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
+		ret = acp_sdw_clock_stop_exit(amd_manager);
+		if (ret)
+			return ret;
+	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		mutex_lock(amd_manager->acp_sdw_lock);
+		wake_en = readl(amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+		wake_en &= ~BIT(amd_manager->instance);
+		writel(wake_en, amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+		mutex_unlock(amd_manager->acp_sdw_lock);
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
+		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+		ret = acp_sdw_clk_init_ctrl(amd_manager);
+		if (ret)
+			return ret;
+		ret = acp_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+		acp_enable_sdw_interrupts(amd_manager);
+		ret = acp_enable_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+		acp_sdw_set_frameshape(amd_manager);
+	}
+	return acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+}
+
+static int amd_acp7x_sdw_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
+{
+	struct sdw_master_prop *prop = &bus->prop;
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	int clkctrl_reg;
+	int divider;
+
+	if (!params->curr_dr_freq) {
+		dev_err(amd_manager->dev, "NULL curr_dr_freq\n");
+		return -EINVAL;
+	}
+	divider = (prop->mclk_freq / params->curr_dr_freq);
+	if (divider == 4)
+		divider = 3;
+	if (params->next_bank)
+		clkctrl_reg = ACP7X_SW_CLK_FREQUENCY_CTRL_BANK1;
+	else
+		clkctrl_reg = ACP7X_SW_CLK_FREQUENCY_CTRL_BANK0;
+	writel(divider, amd_manager->mmio + clkctrl_reg);
+	return 0;
+}
+
+static int amd_acp7x_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_params,
+				     unsigned int bank)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	u32 frame_fmt_reg, dpn_frame_fmt;
+
+	if (p_params->num >= ACP7X_SDW_MAX_DAI) {
+		dev_err(amd_manager->dev, "port_num %d out of range\n", p_params->num);
+		return -EINVAL;
+	}
+	frame_fmt_reg = acp7x_sdw_dp_reg[p_params->num].frame_fmt_reg;
+	dpn_frame_fmt = readl(amd_manager->mmio + frame_fmt_reg);
+	u32p_replace_bits(&dpn_frame_fmt, p_params->flow_mode, AMD_DPN_FRAME_FMT_PFM);
+	u32p_replace_bits(&dpn_frame_fmt, p_params->data_mode, AMD_DPN_FRAME_FMT_PDM);
+	u32p_replace_bits(&dpn_frame_fmt, p_params->bps - 1, AMD_DPN_FRAME_FMT_WORD_LEN);
+	writel(dpn_frame_fmt, amd_manager->mmio + frame_fmt_reg);
+	return 0;
+}
+
+static int amd_acp7x_sdw_transport_params(struct sdw_bus *bus,
+					  struct sdw_transport_params *params,
+					  enum sdw_reg_bank bank)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	u32 dpn_frame_fmt;
+	u32 dpn_config;
+	u32 dpn_sampleinterval;
+	u32 dpn_hctrl;
+	u32 dpn_offsetctrl;
+	u32 dpn_lanectrl;
+	u32 frame_fmt_reg, sample_int_reg, hctrl_dp_reg;
+	u32 offset_reg, lane_ctrl_reg, block_config_reg;
+	u32 val;
+	u32 reg_offset;
+
+	if (params->port_num >= ACP7X_SDW_MAX_DAI) {
+		dev_err(amd_manager->dev, "port_num %d out of range\n", params->port_num);
+		return -EINVAL;
+	}
+	frame_fmt_reg = acp7x_sdw_dp_reg[params->port_num].frame_fmt_reg;
+	reg_offset = bank ? ACP7X_SDW_BANK_REG_OFFSET : 0;
+	sample_int_reg = acp7x_sdw_dp_reg[params->port_num].sample_int_reg + reg_offset;
+	hctrl_dp_reg = acp7x_sdw_dp_reg[params->port_num].hctrl_dp_reg + reg_offset;
+	offset_reg = acp7x_sdw_dp_reg[params->port_num].offset_reg + reg_offset;
+	lane_ctrl_reg = acp7x_sdw_dp_reg[params->port_num].lane_ctrl_reg + reg_offset;
+	block_config_reg = acp7x_sdw_dp_reg[params->port_num].config_reg + reg_offset;
+
+	val = readl(amd_manager->mmio + ACP7X_SW_SSP_COUNTER);
+	if (!val) {
+		writel(AMD_SDW_SSP_COUNTER_VAL, amd_manager->mmio + ACP7X_SW_SSP_COUNTER);
+		val = readl(amd_manager->mmio + ACP7X_SW_SSP_COUNTER);
+	}
+	dpn_frame_fmt = readl(amd_manager->mmio + frame_fmt_reg);
+	u32p_replace_bits(&dpn_frame_fmt, 0, ACP7X_DPN_FRAME_FMT_INVERTED);
+	u32p_replace_bits(&dpn_frame_fmt, SDW_STREAM_PCM, AMD_DPN_FRAME_FMT_PCM_OR_PDM);
+	writel(dpn_frame_fmt, amd_manager->mmio + frame_fmt_reg);
+
+	dpn_config = readl(amd_manager->mmio + block_config_reg);
+	u32p_replace_bits(&dpn_config, params->blk_pkg_mode, ACP7X_DPN_FRAME_FMT_BLK_PKG_MODE);
+	u32p_replace_bits(&dpn_config, params->blk_grp_ctrl, ACP7X_DPN_FRAME_FMT_BLK_GRP_CTRL);
+	writel(dpn_config, amd_manager->mmio + block_config_reg);
+
+	dpn_sampleinterval = params->sample_interval - 1;
+	writel(dpn_sampleinterval, amd_manager->mmio + sample_int_reg);
+
+	dpn_hctrl = FIELD_PREP(AMD_DPN_HCTRL_HSTOP, params->hstop);
+	dpn_hctrl |= FIELD_PREP(AMD_DPN_HCTRL_HSTART, params->hstart);
+	writel(dpn_hctrl, amd_manager->mmio + hctrl_dp_reg);
+
+	dpn_offsetctrl = FIELD_PREP(AMD_DPN_OFFSET_CTRL_1, params->offset1);
+	dpn_offsetctrl |= FIELD_PREP(AMD_DPN_OFFSET_CTRL_2, params->offset2);
+	writel(dpn_offsetctrl, amd_manager->mmio + offset_reg);
+
+	dpn_lanectrl = readl(amd_manager->mmio + lane_ctrl_reg);
+	u32p_replace_bits(&dpn_lanectrl, params->lane_ctrl, ACP7X_DPN_LCTRL);
+	writel(dpn_lanectrl, amd_manager->mmio + lane_ctrl_reg);
+	return 0;
+}
+
+static int amd_acp7x_sdw_port_enable(struct sdw_bus *bus,
+				     struct sdw_enable_ch *enable_ch,
+				     unsigned int bank)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	u32 dpn_ch_enable;
+	u32 ch_en_reg;
+	u32 reg_offset;
+
+	if (enable_ch->port_num >= ACP7X_SDW_MAX_DAI) {
+		dev_err(amd_manager->dev, "port_num %d out of range\n", enable_ch->port_num);
+		return -EINVAL;
+	}
+	reg_offset = bank ? ACP7X_SDW_BANK_REG_OFFSET : 0;
+	ch_en_reg = acp7x_sdw_dp_reg[enable_ch->port_num].ch_en_reg + reg_offset;
+	dpn_ch_enable = readl(amd_manager->mmio + ch_en_reg);
+	u32p_replace_bits(&dpn_ch_enable, enable_ch->ch_mask, ACP7X_DPN_CH_EN_CHMASK);
+	if (enable_ch->enable)
+		writel(dpn_ch_enable, amd_manager->mmio + ch_en_reg);
+	else
+		writel(0, amd_manager->mmio + ch_en_reg);
+	return 0;
+}
+
+static int amd_acp7x_sdw_pre_bank_switch(struct sdw_bus *bus)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	u32 frame_size;
+	u32 rows_index, cols_index;
+
+	rows_index = sdw_find_row_index(bus->params.row);
+	cols_index = sdw_find_col_index(bus->params.col);
+	frame_size = (rows_index << 3) | cols_index;
+	if (amd_manager->bus.params.next_bank)
+		writel(frame_size, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK1);
+	else
+		writel(frame_size, amd_manager->mmio + ACP7X_SW_FRAMESIZE_BANK0);
+	return 0;
+}
+
+static int amd_acp7x_sdw_post_bank_switch(struct sdw_bus *bus)
+{
+	u32 frame_size, frame_rate;
+	u32 us_delay;
+
+	frame_size = bus->params.row * bus->params.col;
+	if (!frame_size || !bus->params.curr_dr_freq)
+		return 0;
+
+	frame_rate = bus->params.curr_dr_freq / frame_size;
+	if (!frame_rate)
+		return 0;
+
+	/* Wait for one frame period after switching banks. */
+	us_delay = 1000000 / frame_rate;
+	udelay(us_delay);
+	return 0;
+}
+
+const struct sdw_master_port_ops amd_acp7x_sdw_port_ops = {
+	.dpn_set_port_params = amd_acp7x_sdw_port_params,
+	.dpn_set_port_transport_params = amd_acp7x_sdw_transport_params,
+	.dpn_port_enable_ch = amd_acp7x_sdw_port_enable,
+};
+
+const struct sdw_master_ops amd_acp7x_sdw_ops = {
+	.read_prop = amd_prop_read,
+	.set_bus_conf = amd_acp7x_sdw_bus_conf,
+	.xfer_msg = amd_sdw_xfer_msg,
+	.read_ping_status = amd_acp7x_sdw_read_ping_status,
+	.pre_bank_switch = amd_acp7x_sdw_pre_bank_switch,
+	.post_bank_switch = amd_acp7x_sdw_post_bank_switch,
+};
+
+static const struct amd_sdw_hw_ops amd_acp7x_hw_ops = {
+	.init_sdw_manager = amd_acp7x_init_sdw_manager,
+	.enable_sdw_manager = amd_acp7x_enable_sdw_manager,
+	.disable_sdw_manager = amd_acp7x_disable_sdw_manager,
+	.enable_sdw_interrupts = amd_acp7x_enable_sdw_interrupts,
+	.disable_sdw_interrupts = amd_acp7x_disable_sdw_interrupts,
+	.set_frameshape = amd_acp7x_sdw_set_frameshape,
+	.send_cmd_get_resp = amd_acp7x_sdw_send_cmd_get_resp,
+	.wake_enable = amd_acp7x_sdw_wake_enable,
+	.host_wake_enable = amd_acp7x_sdw_host_wake_enable,
+	.set_device_state = amd_acp7x_sdw_set_device_state,
+	.read_and_process_ping_status = amd_acp7x_sdw_read_and_process_ping_status,
+	.process_wake_event = amd_acp7x_sdw_process_wake_event,
+	.clk_init_ctrl = amd_acp7x_sdw_clk_init_ctrl,
+	.clock_stop_exit = amd_acp7x_sdw_clock_stop_exit,
+	.suspend = amd_acp7x_sdw_suspend,
+	.suspend_runtime = amd_acp7x_sdw_suspend_runtime,
+	.resume_runtime = amd_acp7x_sdw_resume_runtime,
+};
+
+int amd_sdw_hw_init_ops_acp7x(struct amd_sdw_manager *amd_manager)
+{
+	amd_manager->hw_ops = &amd_acp7x_hw_ops;
+	return 0;
+}
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index f58c99ff24d4..f0d3c5684744 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -504,6 +504,13 @@ extern const struct sdw_master_ops amd_acp63_sdw_ops;
 void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager);
 void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager);
 
+/* Cross-file prototypes: amd_acp7x_manager.c symbols used by amd_manager_common.c */
+void amd_acp7x_sdw_irq_thread(struct amd_sdw_manager *amd_manager);
+void amd_acp7x_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager);
+int amd_sdw_hw_init_ops_acp7x(struct amd_sdw_manager *amd_manager);
+extern const struct sdw_master_ops amd_acp7x_sdw_ops;
+extern const struct sdw_master_port_ops amd_acp7x_sdw_port_ops;
+
 #define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
 
 /**
diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 7e3c9176e793..6f75b6395e91 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -437,6 +437,11 @@ static void amd_sdw_update_slave_status_work(struct work_struct *work)
 	case ACP72_PCI_REV_ID:
 		amd_acp63_sdw_update_slave_status_work(amd_manager);
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		amd_acp7x_sdw_update_slave_status_work(amd_manager);
+		break;
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return;
@@ -479,6 +484,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	case ACP72_PCI_REV_ID:
 		amd_acp63_sdw_irq_thread(amd_manager);
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		amd_acp7x_sdw_irq_thread(amd_manager);
+		break;
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return;
@@ -669,6 +679,10 @@ static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager)
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
 		return amd_acp63_sdw_hw_init_ops(amd_manager);
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		return amd_sdw_hw_init_ops_acp7x(amd_manager);
 	default:
 		return -EINVAL;
 	}
@@ -738,6 +752,34 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
 		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID: {
+		u32 sdw_gcap;
+
+		if (amd_manager->instance >= AMD_ACP7X_SDW_MAX_MANAGER_COUNT) {
+			dev_err(dev, "invalid ACP7x manager instance %d\n",
+				amd_manager->instance);
+			return -EINVAL;
+		}
+
+		/*
+		 * mmio must be set before reading capabilities; compute the
+		 * per-manager base using the ACP7B/7E/7F stride and set it early.
+		 */
+		amd_manager->mmio = amd_manager->acp_mmio +
+				    (amd_manager->instance * ACP7X_SDW_MANAGER_REG_OFFSET);
+		sdw_gcap = readl(amd_manager->mmio + ACP7X_SW_GLOBAL_CAPABILITIES);
+		amd_manager->num_dout_ports = sdw_gcap & ACP7X_SDW_NO_OF_TX_DATA_PORTS;
+		amd_manager->num_din_ports = (sdw_gcap & ACP7X_SDW_NO_OF_RX_DATA_PORTS) >> 4;
+		if (amd_manager->num_dout_ports != ACP7X_SDW_MAX_DAI / 2 ||
+		    amd_manager->num_din_ports != ACP7X_SDW_MAX_DAI / 2) {
+			dev_err(dev, "invalid ACP7x port count: tx %d, rx %d\n",
+				amd_manager->num_dout_ports, amd_manager->num_din_ports);
+			return -EINVAL;
+		}
+		break;
+	}
 	default:
 		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -759,6 +801,13 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		if (!amd_manager->port_offset_map)
 			return -ENOMEM;
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		/* mmio already set in the port-count switch above */
+		amd_manager->bus.ops = &amd_acp7x_sdw_ops;
+		amd_manager->bus.port_ops = &amd_acp7x_sdw_port_ops;
+		break;
 	default:
 		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
-- 
2.53.0


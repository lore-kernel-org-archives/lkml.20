Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068153;
	b=WKcVmNJmG+JoWkvFOpmtL/6wNX499YtYTQq/xzBSKT/5v3W9VI5SXcucuWiSf17z1Ymp
	 RRW4nVk7sLWNgncthS8nRr9mCIZXJN6VM0n1hv3uNIexSKsPfQye/BEjX4lt0100iKWac
	 lt7txKUnDR1ysSaA1x06TmJRJVF7Zq/GPMVNGJ8BP+pC2FErncUV54kSf+sfC3phjMzgT
	 auu+hK7scvCyv7js+filgsAWcZ+efarOr/Fy10vYl7m0cnGpZRJK+E+pNpXl6RzLyclnK
	 Th5bSPeBIGq3TPXykUWGwgwWY9PungvZNtK4LjBKm0Sd0zhs2LEnSUz9WmKEFfztBkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068153;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=JDLJINhXq4hUzAArYN/vfQHUgc+58XJY9zrFJfgMa0Y=;
	b=YoHFK/fF57eHrUqyzQIVAhyq2sV4XfLQB4Myugzpu6AugAJRJxWaBw2X79XgwIo3ZfYc
	 0HRciLPXnE5L2OOod6ov+hJkAIq3NqvGxw+iGdZah0tDKPKFObRn4lwnOWOorQI5nEExJ
	 25g8Vn42dgT7OK6nj1Id8bzQKA5lIpfnc1qR1icn9scbIFqbOyp35uUhuoEBsRw+lLqs4
	 IlsGEB1Y4eHI5t4LPPUEgJMFxvcisc2tXURGz3ZMbKSJlmHqSiNlOz+MDIBwNsY2b/agg
	 6D4Ymz7tTdhYPjIKVRePA/Hx9vgjDYGIuykZfzDgEfiJUEmY5pwI559AtK6BwqGKPSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QvPvwzrx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.1
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D5606D835;
	Sat,  7 Nov 2026 16:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948D5606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QvPvwzrx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvtveL41QEhcW0lUQQyGAidORAcyo7nkYMGZdN4sO25edvGSSQzhlJMOsyI9XWc0raZUBjIUhlkuQXKn7mW1UvTAE2wqk3rB7s7blCajYgwZiT6xs09eDHfweY+kyIvyjevM7w2vszH/m7m706Bz3cDV+t47j+VdrPr0mFdSJCgB9t/A7R2M3vrcUYpzsHdQB0qpm2BEhg6aXY4/RgLdD7EosMZHUm+n6zEL9A+6cQlmMC5ijvbAnwVPfOnBeA34S7+IYiT7MfkhJ0VYfdbMz7LgI2rcwJj1El//nATPQFpPuf59ohXWY/D4pWia0ARAvn9RcKgH+ddaTKKaRwpR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDLJINhXq4hUzAArYN/vfQHUgc+58XJY9zrFJfgMa0Y=;
 b=hVzx3HF4mm/nbzo2wix+4o8euXexNYLUKqjOUkbrXlKvuilud52Tti03xqeHWsFpU3L3FJEqjz85OkHtXTghXmclsuC7XsaU0xGVvs2Dry36KNOUoX3XiVrlAovPSF8KfVX9DawkgmZs+xtBB2i/s/To3mpFwlZWa3IeIXI0LnEXYl/Y2Grrzpu4vmZbvFJ5EcssNDTQt8P00Qv7+mkh+X9sVY1Yay3jAoRtTMWtllFD1jnaUjvFbEPCD5UEceV3Oho5mqljwNKkcxAtpFBInhJCnUZSJ/INgto1doe0oBiQ+aZvaPGKsgVzaPuY59Nb4J0FpfIYhMhYjx6BL/w98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDLJINhXq4hUzAArYN/vfQHUgc+58XJY9zrFJfgMa0Y=;
 b=QvPvwzrxDcpmd3vpPY+zBWUHPJGGHbDoo/XmyK6OS35HcYmUk9ZKauiWRx4skJMi3jTU2n3jw66ir++yOAhXTqaz4Z4pp2pbgtXyJEsIhqNxp8oEhdSCdwAKY+p+0zfVK83Fk8UJnIRn+1Dlrq6IDfIOdQbpNPISH0TBcusIMow=
Received: from SJ0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:a03:39c::22)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:41 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::93) by SJ0PR03CA0347.outlook.office365.com
 (2603:10b6:a03:39c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:25 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 09/11] soundwire: amd: extract shared functions into amd_manager_common.c
Date: Sat, 7 Nov 2026 21:42:26 +0530
Message-ID: <20261107161345.3411491-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 762b40e9-a4ff-4a75-fc6d-08df3cea5e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|11063799006|261021133027099003|261021123027099003|261022115727099003|261009221727099003|261021121427099003|261022075727099003|261021130227099003|261022105027099003|56012099006|261022113327099003|261021135927099003|261009220027099003|261009223327099003|261009221227099003|261026140227099003|261009223027099003|261102123227099003|261026130827099003|261026135527099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bZV4t+mEYqAVdyXO9b6NOE5LCP2EgTsnPEN5ox8oDbmqNtpWtxGiCR88i46ga36KRxOVR5sbBvW/8+u6PLPsvMKxZVY8M2YctgrFtzCrZeHDeGMfehXjLSQvM2lnNqDRAOJe8uKnJnnfW3DWhNtGO1RDRSZM9dNoiaIUdC1h2dgg5ks6hH7vJlj+CWJI7rFftYcwjiLwT/byjA/HM9sLtA4peTtfXnbseR5pSeQu4+ckCWu0JGC0HWMgu7oEKX93EQje77wtUuieGf5YXMgWzctyXe5cU88czr4F31MOOCWrmGrYa5GgqHsyoaw0T12O8m1NvgBuu3l+rSlphfUAjH5ZV1WHNHsIUuS9NTR2qKDbgPDn/abghU/gjyo2YNlyyqoNsitVx/634af6FOgjHuwUxOP3THl0kDXqW83zYQLa4JS6skZB03YGAA4SLuGM2rf6TIOaf74naETzS1lpWy0x3a0Fki0akwKouDrzFA5SX9nvKbZDL7Fa/YMwDRM3Lt/yM7NLj1eu+ax+2e+oSnYu7plfMt8/IJxYZgCiWNb+PsFXrh+osUit6vWoIGiTZM0EPdvzQb5RAEod1grF+feOLuh4d0R8EEoCg60xTLhrKSgDNy/6NKQbRXlKYqRrCnhuvLNl6UvW0FjtddQF89LJK24zNGTteTf8pbvzL9YQ+nZAPv9EdCxmT60M5ixw0VqWtbT2WjaBgaLsla74ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(261021133027099003)(261021123027099003)(261022115727099003)(261009221727099003)(261021121427099003)(261022075727099003)(261021130227099003)(261022105027099003)(56012099006)(261022113327099003)(261021135927099003)(261009220027099003)(261009223327099003)(261009221227099003)(261026140227099003)(261009223027099003)(261102123227099003)(261026130827099003)(261026135527099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MpTZJlsINyiOJJZGWaVSxPJBQqiGqJqg2NH0eCV0rdGEPU/ZI0qc8UtUfymuqBvRhHupb64OcgEtQssT5aLzP0SoMwhtyYjG3k17RNxUIN0mFVnqoyINRYsrgfRLk3FURJxTs7jOaoUveaP3Wjk2QDN64MONZ52sU5tWyMfhh9BAWCkia3MnA8XvLmaqRfrGx/bQKdU2dHIqmuywZNr1b+HFm0QLs8U+ZiSE71U04HgehJaaCjnW/x21JKVkans6DSaiuPcbpUP9a/ijsoNJRm/5mUvbvwGB1u/BjRiRUH1Nqlr9PJiKFSIKXNArRk73UAIyZ1lSs74NyRSbzx1NnbpiYNvv4bT7Hiy/KsO26CSE6lyRpC46tlnQJ93yNjeyB1MCdNRK2EQS2IL8pu6o1xelEKqncZ1sjWyhH2OCGBL7C72RcCVM+OU/yxc51WFa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:41.2170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 762b40e9-a4ff-4a75-fc6d-08df3cea5e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535

Split amd_manager.c along revision boundaries:

- Move all revision-independent amd_sdw_*() functions  -  message transfer
  helpers, ping and slave-status processing, DAI ops and registration,
  clock-stop sequence, PM prepare/suspend/resume wrappers, the
  amd_sdw_hw_init_ops() dispatch wrapper, and the platform_driver
  infrastructure  -  into a new amd_manager_common.c.

- Rename amd_manager.c to amd_acp63_manager.c since it now contains
  only the amd_acp63_*() register-level functions and the
  amd_acp63_hw_ops table.

- Update the Makefile to build amd_manager_common.o and
  amd_acp63_manager.o in place of amd_manager.o.

- Add cross-file prototypes to amd_manager.h for symbols shared between
  the two compilation units.

- Drop static from amd_acp63_sdw_ops, amd_acp63_sdw_port_ops,
  amd_acp63_sdw_compute_params, amd_acp63_sdw_irq_thread,
  amd_acp63_sdw_update_slave_status_work, and amd_acp63_sdw_hw_init_ops,
  which amd_manager_common.c now calls.

- Move the revision-specific register-map tables
  (struct sdw_manager_dp_reg,
  the acp63/acp70 dp_reg arrays, and sdw_manager_reg_mask_array) from
  amd_manager.h into amd_acp63_manager.c to avoid -Wunused-variable when
  amd_manager_common.c includes the shared header.

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/Makefile                    |   2 +-
 .../{amd_manager.c => amd_acp63_manager.c}    | 839 ++----------------
 drivers/soundwire/amd_manager.h               |  84 +-
 drivers/soundwire/amd_manager_common.c        | 786 ++++++++++++++++
 4 files changed, 882 insertions(+), 829 deletions(-)
 rename drivers/soundwire/{amd_manager.c => amd_acp63_manager.c} (59%)
 create mode 100644 drivers/soundwire/amd_manager_common.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index e80a2c2cf3e7..1011599c20e7 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,7 @@ soundwire-bus-y += irq.o
 endif
 
 #AMD driver
-soundwire-amd-y := amd_init.o amd_manager.o
+soundwire-amd-y := amd_init.o amd_manager_common.o amd_acp63_manager.o
 obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_acp63_manager.c
similarity index 59%
rename from drivers/soundwire/amd_manager.c
rename to drivers/soundwire/amd_acp63_manager.c
index 820fbc6422e7..320cd26545f9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_acp63_manager.c
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 /*
- * SoundWire AMD Manager driver
+ * SoundWire AMD ACP6.3 (and compatible) Manager hardware ops
  *
- * Copyright 2023-24 Advanced Micro Devices, Inc.
+ * Copyright 2023-24, 2026 Advanced Micro Devices, Inc.
  */
 
 #include <linux/completion.h>
-#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
@@ -23,10 +22,76 @@
 #include "amd_init.h"
 #include "amd_manager.h"
 
-#define DRV_NAME "amd_sdw_manager"
-
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
+struct sdw_manager_dp_reg {
+	u32 frame_fmt_reg;
+	u32 sample_int_reg;
+	u32 hctrl_dp0_reg;
+	u32 offset_reg;
+	u32 lane_ctrl_ch_en_reg;
+};
+
+/*
+ * SDW0 Manager instance registers  6 CPU DAI (3 TX & 3 RX Ports)
+ * whereas SDW1  Manager Instance registers 2 CPU DAI (one TX & one RX port)
+ * Below is the CPU DAI <->Manager port number mapping
+ * i.e SDW0 Pin0 -> port number 0 -> AUDIO0 TX
+ *     SDW0 Pin1 -> Port number 1 -> AUDIO1 TX
+ *     SDW0 Pin2 -> Port number 2 -> AUDIO2 TX
+ *     SDW0 Pin3 -> port number 3 -> AUDIO0 RX
+ *     SDW0 Pin4 -> Port number 4 -> AUDIO1 RX
+ *     SDW0 Pin5 -> Port number 5 -> AUDIO2 RX
+ *  Whereas for SDW1 instance
+ *  SDW1 Pin0 -> port number 0 -> AUDIO1 TX
+ *  SDW1 Pin1 -> Port number 1 -> AUDIO1 RX
+ *  Same mapping should be used for programming DMA controller registers in SoundWire DMA driver.
+ * i.e if AUDIO0 TX channel is selected then we need to use AUDIO0 TX registers for DMA programming
+ * in SoundWire DMA driver.
+ */
+
+static struct sdw_manager_dp_reg acp63_sdw0_dp_reg[AMD_ACP63_SDW0_MAX_DAI] =  {
+	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
+	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
+	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
+	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
+	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
+};
+
+static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
+	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
+	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
+	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
+};
+
+static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
+	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
+	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
+	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
+	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
+	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
+};
+
+static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
+		AMD_SDW0_EXT_INTR_MASK,
+		AMD_SDW1_EXT_INTR_MASK
+};
+
 static int amd_acp63_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
 {
 	struct sdw_bus *bus = &amd_manager->bus;
@@ -139,7 +204,7 @@ static void amd_acp63_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager
 	/*
 	 * Clear the flag before updating hardware masks so that any IRQ
 	 * that fires during the mask-register writes sees the flag as false
-	 * and does not queue new work. Once the mask registers are written,
+	 * and does not queue new work.  Once the mask registers are written,
 	 * the ACP hardware will not assert any new SDW interrupt, so no
 	 * synchronize_irq() is required after this function returns.
 	 */
@@ -332,32 +397,6 @@ static int amd_acp63_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, b
 	return 0;
 }
 
-static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
-				  int cmd_offset)
-{
-	u32 upper_data;
-	u32 lower_data = 0;
-	u16 addr;
-	u8 upper_addr, lower_addr;
-	u8 data = 0;
-
-	addr = msg->addr + cmd_offset;
-	upper_addr = (addr & 0xFF00) >> 8;
-	lower_addr = addr & 0xFF;
-
-	if (msg->flags == SDW_MSG_FLAG_WRITE)
-		data = msg->buf[cmd_offset];
-
-	upper_data = FIELD_PREP(AMD_SDW_MCP_CMD_DEV_ADDR, msg->dev_num);
-	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_COMMAND, msg->flags + 2);
-	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_HIGH, upper_addr);
-	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_LOW, lower_addr);
-	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_DATA, data);
-
-	*upper_word = upper_data;
-	*lower_word = lower_data;
-}
-
 static int amd_acp63_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
 					   u32 upper_data, u64 *response)
 {
@@ -409,158 +448,6 @@ static int amd_acp63_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager,
 	return 0;
 }
 
-static enum sdw_command_response
-amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
-{
-	struct sdw_msg scp_msg = {0};
-	u64 response_buf[2] = {0};
-	u32 upper_data = 0, lower_data = 0;
-	int index;
-
-	scp_msg.dev_num = msg->dev_num;
-	scp_msg.addr = SDW_SCP_ADDRPAGE1;
-	scp_msg.buf = &msg->addr_page1;
-	scp_msg.flags = SDW_MSG_FLAG_WRITE;
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
-		dev_err_ratelimited(amd_manager->dev,
-				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
-		return SDW_CMD_TIMEOUT;
-	}
-	scp_msg.addr = SDW_SCP_ADDRPAGE2;
-	scp_msg.buf = &msg->addr_page2;
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
-		dev_err_ratelimited(amd_manager->dev,
-				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
-		return SDW_CMD_TIMEOUT;
-	}
-
-	for (index = 0; index < 2; index++) {
-		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
-			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
-				dev_err_ratelimited(amd_manager->dev,
-						    "SCP_addrpage NACKed for Slave %d\n",
-						    msg->dev_num);
-				return SDW_CMD_FAIL;
-			}
-			dev_dbg_ratelimited(amd_manager->dev, "SCP_addrpage ignored for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_IGNORED;
-		}
-	}
-	return SDW_CMD_OK;
-}
-
-static int amd_prep_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
-{
-	int ret;
-
-	if (msg->page) {
-		ret = amd_program_scp_addr(amd_manager, msg);
-		if (ret) {
-			msg->len = 0;
-			return ret;
-		}
-	}
-	switch (msg->flags) {
-	case SDW_MSG_FLAG_READ:
-	case SDW_MSG_FLAG_WRITE:
-		break;
-	default:
-		dev_err(amd_manager->dev, "Invalid msg cmd: %d\n", msg->flags);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *amd_manager,
-						       struct sdw_msg *msg, u64 response,
-						       int offset)
-{
-	if (response & AMD_SDW_MCP_RESP_ACK) {
-		if (msg->flags == SDW_MSG_FLAG_READ)
-			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
-	} else {
-		if (response & AMD_SDW_MCP_RESP_NACK) {
-			dev_err_ratelimited(amd_manager->dev,
-					    "command response NACK received for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_FAIL;
-		}
-		dev_dbg_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
-				    msg->dev_num);
-		return SDW_CMD_IGNORED;
-	}
-	return SDW_CMD_OK;
-}
-
-/* AMD SoundWire bus helper shared across all ACP revisions. */
-static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
-				      int cmd_offset)
-{
-	u64 response;
-	u32 upper_data = 0, lower_data = 0;
-
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
-		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
-				    msg->dev_num);
-		return SDW_CMD_TIMEOUT;
-	}
-	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
-}
-
-/* AMD SoundWire bus helper shared across all ACP revisions. */
-static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
-{
-	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
-	int ret, i;
-
-	ret = amd_prep_msg(amd_manager, msg);
-	if (ret)
-		return SDW_CMD_FAIL_OTHER;
-	for (i = 0; i < msg->len; i++) {
-		ret = _amd_sdw_xfer_msg(amd_manager, msg, i);
-		if (ret)
-			return ret;
-	}
-	return SDW_CMD_OK;
-}
-
-/* AMD SoundWire bus helper shared across all ACP revisions. */
-static void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 index, u32 status)
-{
-	switch (status) {
-	case SDW_SLAVE_ATTACHED:
-	case SDW_SLAVE_UNATTACHED:
-	case SDW_SLAVE_ALERT:
-		amd_manager->status[index] = status;
-		break;
-	default:
-		amd_manager->status[index] = SDW_SLAVE_RESERVED;
-		break;
-	}
-}
-
-/* AMD SoundWire bus helper shared across all ACP revisions. */
-static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager)
-{
-	u64 slave_stat;
-	u32 val;
-	u16 dev_index;
-
-	/* slave status response */
-	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
-	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
-	dev_dbg(amd_manager->dev, "slave_stat:0x%llx\n", slave_stat);
-	for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
-		val = (slave_stat >> (dev_index * 2)) & AMD_SDW_MCP_SLAVE_STATUS_MASK;
-		dev_dbg(amd_manager->dev, "val:0x%x\n", val);
-		amd_sdw_fill_slave_status(amd_manager, dev_index, val);
-	}
-}
-
 static void amd_acp63_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
 {
 	u64 response;
@@ -599,7 +486,7 @@ static u32 amd_acp63_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_acp63_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+int amd_acp63_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	struct sdw_transport_data t_data = {0};
@@ -844,228 +731,19 @@ static int amd_acp63_sdw_port_enable(struct sdw_bus *bus,
 	return 0;
 }
 
-static int sdw_master_read_amd_prop(struct sdw_bus *bus)
-{
-	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
-	struct fwnode_handle *link;
-	struct sdw_master_prop *prop;
-	u32 quirk_mask = 0;
-	u32 wake_en_mask = 0;
-	u32 power_mode_mask = 0;
-	char name[32];
-
-	prop = &bus->prop;
-	/* Find manager handle */
-	snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", bus->link_id);
-	link = device_get_named_child_node(bus->dev, name);
-	if (!link) {
-		dev_err(bus->dev, "Manager node %s not found\n", name);
-		return -EIO;
-	}
-	fwnode_property_read_u32(link, "amd-sdw-enable", &quirk_mask);
-	if (!(quirk_mask & AMD_SDW_QUIRK_MASK_BUS_ENABLE))
-		prop->hw_disabled = true;
-	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH |
-		       SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY;
-
-	fwnode_property_read_u32(link, "amd-sdw-wakeup-enable", &wake_en_mask);
-	amd_manager->wake_en_mask = wake_en_mask;
-	fwnode_property_read_u32(link, "amd-sdw-power-mode", &power_mode_mask);
-	amd_manager->power_mode_mask = power_mode_mask;
-
-	fwnode_handle_put(link);
-
-	return 0;
-}
-
-/* AMD SoundWire bus helper shared across all ACP revisions. */
-static int amd_prop_read(struct sdw_bus *bus)
-{
-	sdw_master_read_prop(bus);
-	sdw_master_read_amd_prop(bus);
-	return 0;
-}
-
-static const struct sdw_master_port_ops amd_acp63_sdw_port_ops = {
+const struct sdw_master_port_ops amd_acp63_sdw_port_ops = {
 	.dpn_set_port_params = amd_acp63_sdw_port_params,
 	.dpn_set_port_transport_params = amd_acp63_sdw_transport_params,
 	.dpn_port_enable_ch = amd_acp63_sdw_port_enable,
 };
 
-static const struct sdw_master_ops amd_acp63_sdw_ops = {
+const struct sdw_master_ops amd_acp63_sdw_ops = {
 	.read_prop = amd_prop_read,
 	.xfer_msg = amd_sdw_xfer_msg,
 	.read_ping_status = amd_acp63_sdw_read_ping_status,
 };
 
-static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
-{
-	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
-	struct sdw_amd_dai_runtime *dai_runtime;
-	struct sdw_stream_config sconfig;
-	int ch, dir;
-	int ret;
-
-	dai_runtime = amd_manager->dai_runtime_array[dai->id];
-	if (!dai_runtime)
-		return -EIO;
-
-	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-		dir = SDW_DATA_DIR_RX;
-	else
-		dir = SDW_DATA_DIR_TX;
-	dev_dbg(amd_manager->dev, "dir:%d dai->id:0x%x\n", dir, dai->id);
-
-	sconfig.direction = dir;
-	sconfig.ch_count = ch;
-	sconfig.frame_rate = params_rate(params);
-	sconfig.type = dai_runtime->stream_type;
-
-	sconfig.bps = snd_pcm_format_width(params_format(params));
-
-	/* Port configuration */
-	struct sdw_port_config *pconfig __free(kfree) = kzalloc_obj(*pconfig);
-	if (!pconfig)
-		return -ENOMEM;
-
-	pconfig->num = dai->id;
-	pconfig->ch_mask = (1 << ch) - 1;
-	ret = sdw_stream_add_master(&amd_manager->bus, &sconfig,
-				    pconfig, 1, dai_runtime->stream);
-	if (ret)
-		dev_err(amd_manager->dev, "add manager to stream failed:%d\n", ret);
-
-	return ret;
-}
-
-static int amd_sdw_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
-	struct sdw_amd_dai_runtime *dai_runtime;
-	int ret;
-
-	dai_runtime = amd_manager->dai_runtime_array[dai->id];
-	if (!dai_runtime)
-		return -EIO;
-
-	ret = sdw_stream_remove_master(&amd_manager->bus, dai_runtime->stream);
-	if (ret < 0)
-		dev_err(dai->dev, "remove manager from stream %s failed: %d\n",
-			dai_runtime->stream->name, ret);
-	return ret;
-}
-
-static int amd_set_sdw_stream(struct snd_soc_dai *dai, void *stream, int direction)
-{
-	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
-	struct sdw_amd_dai_runtime *dai_runtime;
-
-	dai_runtime = amd_manager->dai_runtime_array[dai->id];
-	if (stream) {
-		/* first paranoia check */
-		if (dai_runtime) {
-			dev_err(dai->dev, "dai_runtime already allocated for dai %s\n",	dai->name);
-			return -EINVAL;
-		}
-
-		/* allocate and set dai_runtime info */
-		dai_runtime = kzalloc_obj(*dai_runtime);
-		if (!dai_runtime)
-			return -ENOMEM;
-
-		dai_runtime->stream_type = SDW_STREAM_PCM;
-		dai_runtime->bus = &amd_manager->bus;
-		dai_runtime->stream = stream;
-		amd_manager->dai_runtime_array[dai->id] = dai_runtime;
-	} else {
-		/* second paranoia check */
-		if (!dai_runtime) {
-			dev_err(dai->dev, "dai_runtime not allocated for dai %s\n", dai->name);
-			return -EINVAL;
-		}
-
-		/* for NULL stream we release allocated dai_runtime */
-		kfree(dai_runtime);
-		amd_manager->dai_runtime_array[dai->id] = NULL;
-	}
-	return 0;
-}
-
-static int amd_pcm_set_sdw_stream(struct snd_soc_dai *dai, void *stream, int direction)
-{
-	return amd_set_sdw_stream(dai, stream, direction);
-}
-
-static void *amd_get_sdw_stream(struct snd_soc_dai *dai, int direction)
-{
-	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
-	struct sdw_amd_dai_runtime *dai_runtime;
-
-	dai_runtime = amd_manager->dai_runtime_array[dai->id];
-	if (!dai_runtime)
-		return ERR_PTR(-EINVAL);
-
-	return dai_runtime->stream;
-}
-
-static const struct snd_soc_dai_ops amd_sdw_dai_ops = {
-	.hw_params = amd_sdw_hw_params,
-	.hw_free = amd_sdw_hw_free,
-	.set_stream = amd_pcm_set_sdw_stream,
-	.get_stream = amd_get_sdw_stream,
-};
-
-static const struct snd_soc_component_driver amd_sdw_dai_component = {
-	.name = "soundwire",
-};
-
-static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
-{
-	struct sdw_amd_dai_runtime **dai_runtime_array;
-	struct snd_soc_dai_driver *dais;
-	struct snd_soc_pcm_stream *stream;
-	struct device *dev;
-	int i, num_dais;
-
-	dev = amd_manager->dev;
-	num_dais = amd_manager->num_dout_ports + amd_manager->num_din_ports;
-	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
-	if (!dais)
-		return -ENOMEM;
-
-	dai_runtime_array = devm_kcalloc(dev, num_dais,
-					 sizeof(struct sdw_amd_dai_runtime *),
-					 GFP_KERNEL);
-	if (!dai_runtime_array)
-		return -ENOMEM;
-	amd_manager->dai_runtime_array = dai_runtime_array;
-	for (i = 0; i < num_dais; i++) {
-		dais[i].name = devm_kasprintf(dev, GFP_KERNEL, "SDW%d Pin%d", amd_manager->instance,
-					      i);
-		if (!dais[i].name)
-			return -ENOMEM;
-		if (i < amd_manager->num_dout_ports)
-			stream = &dais[i].playback;
-		else
-			stream = &dais[i].capture;
-
-		stream->channels_min = 2;
-		stream->channels_max = 2;
-		stream->rates = SNDRV_PCM_RATE_48000;
-		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
-
-		dais[i].ops = &amd_sdw_dai_ops;
-		dais[i].id = i;
-	}
-
-	return devm_snd_soc_register_component(dev, &amd_sdw_dai_component,
-					       dais, num_dais);
-}
-
-static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
+void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
 {
 	int retry_count = 0;
 
@@ -1099,48 +777,6 @@ static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_m
 	}
 }
 
-static void amd_sdw_update_slave_status_work(struct work_struct *work)
-{
-	struct amd_sdw_manager *amd_manager =
-		container_of(work, struct amd_sdw_manager, amd_sdw_work);
-
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		amd_acp63_sdw_update_slave_status_work(amd_manager);
-		break;
-	default:
-		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
-		return;
-	}
-}
-
-static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
-					struct amd_sdw_manager *amd_manager)
-{
-	u64 slave_stat;
-	u32 val;
-	int dev_index;
-
-	if (status_change_0to7 == AMD_SDW_SLAVE_0_ATTACHED)
-		memset(amd_manager->status, 0, sizeof(amd_manager->status));
-	slave_stat = status_change_0to7;
-	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
-	dev_dbg(amd_manager->dev, "status_change_0to7:0x%x status_change_8to11:0x%x\n",
-		status_change_0to7, status_change_8to11);
-	if (slave_stat) {
-		for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
-			if (slave_stat & AMD_SDW_MCP_SLAVE_STATUS_VALID_MASK(dev_index)) {
-				val = (slave_stat >> AMD_SDW_MCP_SLAVE_STAT_SHIFT_MASK(dev_index)) &
-				      AMD_SDW_MCP_SLAVE_STATUS_MASK;
-				amd_sdw_fill_slave_status(amd_manager, dev_index, val);
-			}
-		}
-	}
-}
-
 static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
@@ -1148,7 +784,7 @@ static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 }
 
-static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
+void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 {
 	u32 status_change_8to11;
 	u32 status_change_0to7;
@@ -1178,89 +814,6 @@ static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 }
 
-static void amd_sdw_irq_thread(struct work_struct *work)
-{
-	struct amd_sdw_manager *amd_manager =
-			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
-
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		amd_acp63_sdw_irq_thread(amd_manager);
-		break;
-	default:
-		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
-		return;
-	}
-}
-
-int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
-{
-	struct sdw_master_prop *prop;
-	int ret;
-
-	prop = &amd_manager->bus.prop;
-	if (!prop->hw_disabled) {
-		ret = acp_sdw_clk_init_ctrl(amd_manager);
-		if (ret)
-			return ret;
-		ret = acp_init_sdw_manager(amd_manager);
-		if (ret)
-			return ret;
-		acp_enable_sdw_interrupts(amd_manager);
-		ret = acp_enable_sdw_manager(amd_manager);
-		if (ret)
-			return ret;
-		acp_sdw_set_frameshape(amd_manager);
-	}
-	/* Enable runtime PM */
-	pm_runtime_set_autosuspend_delay(amd_manager->dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
-	pm_runtime_use_autosuspend(amd_manager->dev);
-	pm_runtime_mark_last_busy(amd_manager->dev);
-	pm_runtime_set_active(amd_manager->dev);
-	pm_runtime_enable(amd_manager->dev);
-	return 0;
-}
-
-/*
- * AMD SoundWire clock-stop sequence shared across all ACP revisions.
- * Differences between revisions in this path are minimal; a switch/case
- * on acp_rev is sufficient to accommodate any variant-specific additions
- * needed for future platforms.
- */
-static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
-{
-	u32 val;
-	int ret;
-
-	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
-	if (ret < 0 && ret != -ENODATA) {
-		dev_err(amd_manager->dev, "prepare clock stop failed %d", ret);
-		return 0;
-	}
-	ret = sdw_bus_clk_stop(&amd_manager->bus);
-	if (ret < 0 && ret != -ENODATA) {
-		dev_err(amd_manager->dev, "bus clock stop failed %d", ret);
-		return 0;
-	}
-
-	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
-				 (val & AMD_SDW_CLK_STOP_DONE), ACP_DELAY_US, AMD_SDW_TIMEOUT);
-	if (ret) {
-		dev_err(amd_manager->dev, "SDW%x clock stop failed\n", amd_manager->instance);
-		return 0;
-	}
-
-	amd_manager->clk_stopped = true;
-	if (amd_manager->wake_en_mask)
-		writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-
-	dev_dbg(amd_manager->dev, "SDW%x clock stop successful\n", amd_manager->instance);
-	return 0;
-}
-
 static int amd_acp63_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 {
 	int ret;
@@ -1290,78 +843,6 @@ static int amd_acp63_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int amd_resume_child_device(struct device *dev, void *data)
-{
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	int ret;
-
-	if (!slave->probed) {
-		dev_dbg(dev, "skipping device, no probed driver\n");
-		return 0;
-	}
-	if (!slave->dev_num_sticky) {
-		dev_dbg(dev, "skipping device, never detected on bus\n");
-		return 0;
-	}
-	ret = pm_request_resume(dev);
-	if (ret < 0) {
-		dev_err(dev, "pm_request_resume failed: %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static int __maybe_unused amd_pm_prepare(struct device *dev)
-{
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
-	struct sdw_bus *bus = &amd_manager->bus;
-	int ret;
-
-	if (bus->prop.hw_disabled) {
-		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
-			bus->link_id);
-		return 0;
-	}
-	/*
-	 * When multiple peripheral devices connected over the same link, if SoundWire manager
-	 * device is not in runtime suspend state, observed that device alerts are missing
-	 * without pm_prepare on AMD platforms in clockstop mode0.
-	 */
-	if (amd_manager->power_mode_mask) {
-		ret = pm_runtime_resume(dev);
-		if (ret < 0) {
-			dev_err(bus->dev, "pm_runtime_resume failed: %d\n", ret);
-			return 0;
-		}
-	}
-	/* To force peripheral devices to system level suspend state, resume the devices
-	 * from runtime suspend state first. Without that unable to dispatch the alert
-	 * status to peripheral driver during system level resume as they are in runtime
-	 * suspend state.
-	 */
-	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
-	if (ret < 0)
-		dev_err(dev, "amd_resume_child_device failed: %d\n", ret);
-	return 0;
-}
-
-static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager,
-							  bool enable)
-{
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-		break;
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		return acp_sdw_host_wake_enable(amd_manager, enable);
-	default:
-		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static int amd_acp63_sdw_suspend(struct amd_sdw_manager *amd_manager)
 {
 	struct sdw_bus *bus = &amd_manager->bus;
@@ -1586,140 +1067,6 @@ static int amd_acp63_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int __maybe_unused amd_suspend(struct device *dev)
-{
-	return acp_sdw_suspend(dev);
-}
-
-static int __maybe_unused amd_suspend_runtime(struct device *dev)
-{
-	return acp_sdw_suspend_runtime(dev);
-}
-
-static int __maybe_unused amd_resume_runtime(struct device *dev)
-{
-	return acp_sdw_resume_runtime(dev);
-}
-
-static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager);
-
-static int amd_sdw_manager_probe(struct platform_device *pdev)
-{
-	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
-	struct resource *res;
-	struct device *dev = &pdev->dev;
-	struct sdw_master_prop *prop;
-	struct amd_sdw_manager *amd_manager;
-	int ret;
-
-	amd_manager = devm_kzalloc(dev, sizeof(struct amd_sdw_manager), GFP_KERNEL);
-	if (!amd_manager)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOMEM;
-
-	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
-	if (!amd_manager->acp_mmio) {
-		dev_err(dev, "mmio not found\n");
-		return -ENOMEM;
-	}
-	amd_manager->ping_slave_stat = U32_MAX;
-	amd_manager->instance = pdata->instance;
-	amd_manager->mmio = amd_manager->acp_mmio +
-			    (amd_manager->instance * ACP63_SDW_MANAGER_REG_OFFSET);
-	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
-	amd_manager->acp_rev = pdata->acp_rev;
-	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
-	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
-	amd_manager->dev = dev;
-	amd_manager->bus.ops = &amd_acp63_sdw_ops;
-	amd_manager->bus.port_ops = &amd_acp63_sdw_port_ops;
-	amd_manager->bus.compute_params = &amd_acp63_sdw_compute_params;
-	amd_manager->bus.clk_stop_timeout = 200;
-	amd_manager->bus.link_id = amd_manager->instance;
-	ret = amd_sdw_hw_init_ops(amd_manager);
-	if (ret) {
-		dev_err(dev, "Failed to initialize hw ops (%d)\n", ret);
-		return ret;
-	}
-
-	/*
-	 * Due to BIOS compatibility, the two links are exposed within
-	 * the scope of a single controller. If this changes, the
-	 * controller_id will have to be updated with drv_data
-	 * information.
-	 */
-	amd_manager->bus.controller_id = 0;
-	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-		switch (amd_manager->instance) {
-		case ACP_SDW0:
-			amd_manager->num_dout_ports = AMD_ACP63_SDW0_MAX_TX_PORTS;
-			amd_manager->num_din_ports = AMD_ACP63_SDW0_MAX_RX_PORTS;
-			break;
-		case ACP_SDW1:
-			amd_manager->num_dout_ports = AMD_ACP63_SDW1_MAX_TX_PORTS;
-			amd_manager->num_din_ports = AMD_ACP63_SDW1_MAX_RX_PORTS;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
-		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
-		break;
-	default:
-		/* unreachable: amd_sdw_hw_init_ops() rejects unknown revisions earlier in probe */
-		return -EINVAL;
-	}
-	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
-	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
-						    sizeof(int), GFP_KERNEL);
-	if (!amd_manager->port_offset_map)
-		return -ENOMEM;
-
-	prop = &amd_manager->bus.prop;
-	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
-
-	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
-	if (ret) {
-		dev_err(dev, "Failed to register SoundWire manager(%d)\n", ret);
-		return ret;
-	}
-	ret = amd_sdw_register_dais(amd_manager);
-	if (ret) {
-		dev_err(dev, "CPU DAI registration failed\n");
-		sdw_bus_master_delete(&amd_manager->bus);
-		return ret;
-	}
-	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
-	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
-	dev_set_drvdata(dev, amd_manager);
-	return 0;
-}
-
-static void amd_sdw_manager_remove(struct platform_device *pdev)
-{
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
-	int ret;
-
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-	acp_disable_sdw_interrupts(amd_manager);
-	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
-	sdw_bus_master_delete(&amd_manager->bus);
-	ret = acp_disable_sdw_manager(amd_manager);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
-}
-
 static const struct amd_sdw_hw_ops amd_acp63_hw_ops = {
 	.init_sdw_manager		= amd_acp63_init_sdw_manager,
 	.enable_sdw_manager		= amd_acp63_enable_sdw_manager,
@@ -1740,38 +1087,8 @@ static const struct amd_sdw_hw_ops amd_acp63_hw_ops = {
 	.resume_runtime			= amd_acp63_sdw_resume_runtime,
 };
 
-static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager)
+int amd_acp63_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager)
 {
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		amd_manager->hw_ops = &amd_acp63_hw_ops;
-		break;
-	default:
-		return -EINVAL;
-	}
+	amd_manager->hw_ops = &amd_acp63_hw_ops;
 	return 0;
 }
-
-static const struct dev_pm_ops amd_pm = {
-	.prepare = amd_pm_prepare,
-	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
-	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
-};
-
-static struct platform_driver amd_sdw_driver = {
-	.probe	= &amd_sdw_manager_probe,
-	.remove = &amd_sdw_manager_remove,
-	.driver = {
-		.name	= "amd_sdw_manager",
-		.pm = &amd_pm,
-	}
-};
-module_platform_driver(amd_sdw_driver);
-
-MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
-MODULE_DESCRIPTION("AMD SoundWire driver");
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8780759b9c1c..2e87c79580f4 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -197,73 +197,23 @@
 #define AMD_SDW_DEVICE_STATE_D3				3
 #define ACP_PME_EN					0x0001400
 
-struct sdw_manager_dp_reg {
-	u32 frame_fmt_reg;
-	u32 sample_int_reg;
-	u32 hctrl_dp0_reg;
-	u32 offset_reg;
-	u32 lane_ctrl_ch_en_reg;
-};
-
-/*
- * SDW0 Manager instance registers  6 CPU DAI (3 TX & 3 RX Ports)
- * whereas SDW1  Manager Instance registers 2 CPU DAI (one TX & one RX port)
- * Below is the CPU DAI <->Manager port number mapping
- * i.e SDW0 Pin0 -> port number 0 -> AUDIO0 TX
- *     SDW0 Pin1 -> Port number 1 -> AUDIO1 TX
- *     SDW0 Pin2 -> Port number 2 -> AUDIO2 TX
- *     SDW0 Pin3 -> port number 3 -> AUDIO0 RX
- *     SDW0 Pin4 -> Port number 4 -> AUDIO1 RX
- *     SDW0 Pin5 -> Port number 5 -> AUDIO2 RX
- *  Whereas for SDW1 instance
- *  SDW1 Pin0 -> port number 0 -> AUDIO1 TX
- *  SDW1 Pin1 -> Port number 1 -> AUDIO1 RX
- *  Same mapping should be used for programming DMA controller registers in SoundWire DMA driver.
- * i.e if AUDIO0 TX channel is selected then we need to use AUDIO0 TX registers for DMA programming
- * in SoundWire DMA driver.
- */
-
-static struct sdw_manager_dp_reg acp63_sdw0_dp_reg[AMD_ACP63_SDW0_MAX_DAI] =  {
-	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
-	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
-	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
-	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
-	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
-	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
-	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
-};
-
-static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
-	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
-	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
-	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
-};
-
-static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
-	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
-	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
-	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
-	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
-	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
-	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
-	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
-	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
-};
-
-static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
-		AMD_SDW0_EXT_INTR_MASK,
-		AMD_SDW1_EXT_INTR_MASK
-};
+/* Cross-file prototypes: amd_manager_common.c functions used by amd_acp63_manager.c */
+enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
+void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 index, u32 status);
+void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager);
+void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
+				 struct amd_sdw_manager *amd_manager);
+int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager);
+int amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager, bool enable);
+int amd_prop_read(struct sdw_bus *bus);
+
+/* Cross-file prototypes: amd_acp63_manager.c symbols used by amd_manager_common.c */
+int amd_acp63_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager);
+int amd_acp63_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
+extern const struct sdw_master_port_ops amd_acp63_sdw_port_ops;
+extern const struct sdw_master_ops amd_acp63_sdw_ops;
+void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager);
+void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager);
 
 #define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
 
diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
new file mode 100644
index 000000000000..06aef9c03f18
--- /dev/null
+++ b/drivers/soundwire/amd_manager_common.c
@@ -0,0 +1,786 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * SoundWire AMD Manager driver
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/completion.h>
+#include <linux/cleanup.h>
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
+#define DRV_NAME "amd_sdw_manager"
+
+#define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
+
+static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
+				  int cmd_offset)
+{
+	u32 upper_data;
+	u32 lower_data = 0;
+	u16 addr;
+	u8 upper_addr, lower_addr;
+	u8 data = 0;
+
+	addr = msg->addr + cmd_offset;
+	upper_addr = (addr & 0xFF00) >> 8;
+	lower_addr = addr & 0xFF;
+
+	if (msg->flags == SDW_MSG_FLAG_WRITE)
+		data = msg->buf[cmd_offset];
+
+	upper_data = FIELD_PREP(AMD_SDW_MCP_CMD_DEV_ADDR, msg->dev_num);
+	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_COMMAND, msg->flags + 2);
+	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_HIGH, upper_addr);
+	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_LOW, lower_addr);
+	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_DATA, data);
+
+	*upper_word = upper_data;
+	*lower_word = lower_data;
+}
+
+static enum sdw_command_response
+amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
+{
+	struct sdw_msg scp_msg = {0};
+	u64 response_buf[2] = {0};
+	u32 upper_data = 0, lower_data = 0;
+	int index;
+
+	scp_msg.dev_num = msg->dev_num;
+	scp_msg.addr = SDW_SCP_ADDRPAGE1;
+	scp_msg.buf = &msg->addr_page1;
+	scp_msg.flags = SDW_MSG_FLAG_WRITE;
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
+	scp_msg.addr = SDW_SCP_ADDRPAGE2;
+	scp_msg.buf = &msg->addr_page2;
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
+
+	for (index = 0; index < 2; index++) {
+		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
+			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
+				dev_err_ratelimited(amd_manager->dev,
+						    "SCP_addrpage NACKed for Slave %d\n",
+						    msg->dev_num);
+				return SDW_CMD_FAIL;
+			}
+			dev_dbg_ratelimited(amd_manager->dev, "SCP_addrpage ignored for Slave %d\n",
+					    msg->dev_num);
+			return SDW_CMD_IGNORED;
+		}
+	}
+	return SDW_CMD_OK;
+}
+
+static int amd_prep_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
+{
+	int ret;
+
+	if (msg->page) {
+		ret = amd_program_scp_addr(amd_manager, msg);
+		if (ret) {
+			msg->len = 0;
+			return ret;
+		}
+	}
+	switch (msg->flags) {
+	case SDW_MSG_FLAG_READ:
+	case SDW_MSG_FLAG_WRITE:
+		break;
+	default:
+		dev_err(amd_manager->dev, "Invalid msg cmd: %d\n", msg->flags);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *amd_manager,
+						       struct sdw_msg *msg, u64 response,
+						       int offset)
+{
+	if (response & AMD_SDW_MCP_RESP_ACK) {
+		if (msg->flags == SDW_MSG_FLAG_READ)
+			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
+	} else {
+		if (response & AMD_SDW_MCP_RESP_NACK) {
+			dev_err_ratelimited(amd_manager->dev,
+					    "command response NACK received for Slave %d\n",
+					    msg->dev_num);
+			return SDW_CMD_FAIL;
+		}
+		dev_dbg_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
+				    msg->dev_num);
+		return SDW_CMD_IGNORED;
+	}
+	return SDW_CMD_OK;
+}
+
+/* AMD SoundWire bus helper shared across all ACP revisions. */
+static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
+				      int cmd_offset)
+{
+	u64 response;
+	u32 upper_data = 0, lower_data = 0;
+
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
+				    msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
+	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
+}
+
+/* AMD SoundWire bus helper shared across all ACP revisions. */
+enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	int ret, i;
+
+	ret = amd_prep_msg(amd_manager, msg);
+	if (ret)
+		return SDW_CMD_FAIL_OTHER;
+	for (i = 0; i < msg->len; i++) {
+		ret = _amd_sdw_xfer_msg(amd_manager, msg, i);
+		if (ret)
+			return ret;
+	}
+	return SDW_CMD_OK;
+}
+
+/* AMD SoundWire bus helper shared across all ACP revisions. */
+void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 index, u32 status)
+{
+	switch (status) {
+	case SDW_SLAVE_ATTACHED:
+	case SDW_SLAVE_UNATTACHED:
+	case SDW_SLAVE_ALERT:
+		amd_manager->status[index] = status;
+		break;
+	default:
+		amd_manager->status[index] = SDW_SLAVE_RESERVED;
+		break;
+	}
+}
+
+/* AMD SoundWire bus helper shared across all ACP revisions. */
+void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager)
+{
+	u64 slave_stat;
+	u32 val;
+	u16 dev_index;
+
+	/* slave status response */
+	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
+	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
+	dev_dbg(amd_manager->dev, "slave_stat:0x%llx\n", slave_stat);
+	for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
+		val = (slave_stat >> (dev_index * 2)) & AMD_SDW_MCP_SLAVE_STATUS_MASK;
+		dev_dbg(amd_manager->dev, "val:0x%x\n", val);
+		amd_sdw_fill_slave_status(amd_manager, dev_index, val);
+	}
+}
+
+static int sdw_master_read_amd_prop(struct sdw_bus *bus)
+{
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
+	struct fwnode_handle *link;
+	struct sdw_master_prop *prop;
+	u32 quirk_mask = 0;
+	u32 wake_en_mask = 0;
+	u32 power_mode_mask = 0;
+	char name[32];
+
+	prop = &bus->prop;
+	/* Find manager handle */
+	snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", bus->link_id);
+	link = device_get_named_child_node(bus->dev, name);
+	if (!link) {
+		dev_err(bus->dev, "Manager node %s not found\n", name);
+		return -EIO;
+	}
+	fwnode_property_read_u32(link, "amd-sdw-enable", &quirk_mask);
+	if (!(quirk_mask & AMD_SDW_QUIRK_MASK_BUS_ENABLE))
+		prop->hw_disabled = true;
+	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH |
+		       SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY;
+
+	fwnode_property_read_u32(link, "amd-sdw-wakeup-enable", &wake_en_mask);
+	amd_manager->wake_en_mask = wake_en_mask;
+	fwnode_property_read_u32(link, "amd-sdw-power-mode", &power_mode_mask);
+	amd_manager->power_mode_mask = power_mode_mask;
+
+	fwnode_handle_put(link);
+
+	return 0;
+}
+
+/* AMD SoundWire bus helper shared across all ACP revisions. */
+int amd_prop_read(struct sdw_bus *bus)
+{
+	sdw_master_read_prop(bus);
+	sdw_master_read_amd_prop(bus);
+	return 0;
+}
+
+static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
+	struct sdw_amd_dai_runtime *dai_runtime;
+	struct sdw_stream_config sconfig;
+	int ch, dir;
+	int ret;
+
+	dai_runtime = amd_manager->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return -EIO;
+
+	ch = params_channels(params);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		dir = SDW_DATA_DIR_RX;
+	else
+		dir = SDW_DATA_DIR_TX;
+	dev_dbg(amd_manager->dev, "dir:%d dai->id:0x%x\n", dir, dai->id);
+
+	sconfig.direction = dir;
+	sconfig.ch_count = ch;
+	sconfig.frame_rate = params_rate(params);
+	sconfig.type = dai_runtime->stream_type;
+
+	sconfig.bps = snd_pcm_format_width(params_format(params));
+
+	/* Port configuration */
+	struct sdw_port_config *pconfig __free(kfree) = kzalloc_obj(*pconfig);
+	if (!pconfig)
+		return -ENOMEM;
+
+	pconfig->num = dai->id;
+	pconfig->ch_mask = (1 << ch) - 1;
+	ret = sdw_stream_add_master(&amd_manager->bus, &sconfig,
+				    pconfig, 1, dai_runtime->stream);
+	if (ret)
+		dev_err(amd_manager->dev, "add manager to stream failed:%d\n", ret);
+
+	return ret;
+}
+
+static int amd_sdw_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
+	struct sdw_amd_dai_runtime *dai_runtime;
+	int ret;
+
+	dai_runtime = amd_manager->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return -EIO;
+
+	ret = sdw_stream_remove_master(&amd_manager->bus, dai_runtime->stream);
+	if (ret < 0)
+		dev_err(dai->dev, "remove manager from stream %s failed: %d\n",
+			dai_runtime->stream->name, ret);
+	return ret;
+}
+
+static int amd_set_sdw_stream(struct snd_soc_dai *dai, void *stream, int direction)
+{
+	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
+	struct sdw_amd_dai_runtime *dai_runtime;
+
+	dai_runtime = amd_manager->dai_runtime_array[dai->id];
+	if (stream) {
+		/* first paranoia check */
+		if (dai_runtime) {
+			dev_err(dai->dev, "dai_runtime already allocated for dai %s\n",	dai->name);
+			return -EINVAL;
+		}
+
+		/* allocate and set dai_runtime info */
+		dai_runtime = kzalloc_obj(*dai_runtime);
+		if (!dai_runtime)
+			return -ENOMEM;
+
+		dai_runtime->stream_type = SDW_STREAM_PCM;
+		dai_runtime->bus = &amd_manager->bus;
+		dai_runtime->stream = stream;
+		amd_manager->dai_runtime_array[dai->id] = dai_runtime;
+	} else {
+		/* second paranoia check */
+		if (!dai_runtime) {
+			dev_err(dai->dev, "dai_runtime not allocated for dai %s\n", dai->name);
+			return -EINVAL;
+		}
+
+		/* for NULL stream we release allocated dai_runtime */
+		kfree(dai_runtime);
+		amd_manager->dai_runtime_array[dai->id] = NULL;
+	}
+	return 0;
+}
+
+static int amd_pcm_set_sdw_stream(struct snd_soc_dai *dai, void *stream, int direction)
+{
+	return amd_set_sdw_stream(dai, stream, direction);
+}
+
+static void *amd_get_sdw_stream(struct snd_soc_dai *dai, int direction)
+{
+	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
+	struct sdw_amd_dai_runtime *dai_runtime;
+
+	dai_runtime = amd_manager->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return ERR_PTR(-EINVAL);
+
+	return dai_runtime->stream;
+}
+
+static const struct snd_soc_dai_ops amd_sdw_dai_ops = {
+	.hw_params = amd_sdw_hw_params,
+	.hw_free = amd_sdw_hw_free,
+	.set_stream = amd_pcm_set_sdw_stream,
+	.get_stream = amd_get_sdw_stream,
+};
+
+static const struct snd_soc_component_driver amd_sdw_dai_component = {
+	.name = "soundwire",
+};
+
+static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_amd_dai_runtime **dai_runtime_array;
+	struct snd_soc_dai_driver *dais;
+	struct snd_soc_pcm_stream *stream;
+	struct device *dev;
+	int i, num_dais;
+
+	dev = amd_manager->dev;
+	num_dais = amd_manager->num_dout_ports + amd_manager->num_din_ports;
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	dai_runtime_array = devm_kcalloc(dev, num_dais,
+					 sizeof(struct sdw_amd_dai_runtime *),
+					 GFP_KERNEL);
+	if (!dai_runtime_array)
+		return -ENOMEM;
+	amd_manager->dai_runtime_array = dai_runtime_array;
+	for (i = 0; i < num_dais; i++) {
+		dais[i].name = devm_kasprintf(dev, GFP_KERNEL, "SDW%d Pin%d", amd_manager->instance,
+					      i);
+		if (!dais[i].name)
+			return -ENOMEM;
+		if (i < amd_manager->num_dout_ports)
+			stream = &dais[i].playback;
+		else
+			stream = &dais[i].capture;
+
+		stream->channels_min = 2;
+		stream->channels_max = 2;
+		stream->rates = SNDRV_PCM_RATE_48000;
+		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+
+		dais[i].ops = &amd_sdw_dai_ops;
+		dais[i].id = i;
+	}
+
+	return devm_snd_soc_register_component(dev, &amd_sdw_dai_component,
+					       dais, num_dais);
+}
+
+static void amd_sdw_update_slave_status_work(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+		container_of(work, struct amd_sdw_manager, amd_sdw_work);
+
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_acp63_sdw_update_slave_status_work(amd_manager);
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return;
+	}
+}
+
+void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
+				 struct amd_sdw_manager *amd_manager)
+{
+	u64 slave_stat;
+	u32 val;
+	int dev_index;
+
+	if (status_change_0to7 == AMD_SDW_SLAVE_0_ATTACHED)
+		memset(amd_manager->status, 0, sizeof(amd_manager->status));
+	slave_stat = status_change_0to7;
+	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
+	dev_dbg(amd_manager->dev, "status_change_0to7:0x%x status_change_8to11:0x%x\n",
+		status_change_0to7, status_change_8to11);
+	if (slave_stat) {
+		for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
+			if (slave_stat & AMD_SDW_MCP_SLAVE_STATUS_VALID_MASK(dev_index)) {
+				val = (slave_stat >> AMD_SDW_MCP_SLAVE_STAT_SHIFT_MASK(dev_index)) &
+				      AMD_SDW_MCP_SLAVE_STATUS_MASK;
+				amd_sdw_fill_slave_status(amd_manager, dev_index, val);
+			}
+		}
+	}
+}
+
+static void amd_sdw_irq_thread(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
+
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_acp63_sdw_irq_thread(amd_manager);
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return;
+	}
+}
+
+int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_master_prop *prop;
+	int ret;
+
+	prop = &amd_manager->bus.prop;
+	if (!prop->hw_disabled) {
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
+	/* Enable runtime PM */
+	pm_runtime_set_autosuspend_delay(amd_manager->dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(amd_manager->dev);
+	pm_runtime_mark_last_busy(amd_manager->dev);
+	pm_runtime_set_active(amd_manager->dev);
+	pm_runtime_enable(amd_manager->dev);
+	return 0;
+}
+
+/*
+ * AMD SoundWire clock-stop sequence shared across all ACP revisions.
+ * Differences between revisions in this path are minimal; a switch/case
+ * on acp_rev is sufficient to accommodate any variant-specific additions
+ * needed for future platforms.
+ */
+int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
+{
+	u32 val;
+	int ret;
+
+	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
+	if (ret < 0 && ret != -ENODATA) {
+		dev_err(amd_manager->dev, "prepare clock stop failed %d", ret);
+		return 0;
+	}
+	ret = sdw_bus_clk_stop(&amd_manager->bus);
+	if (ret < 0 && ret != -ENODATA) {
+		dev_err(amd_manager->dev, "bus clock stop failed %d", ret);
+		return 0;
+	}
+
+	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
+				 (val & AMD_SDW_CLK_STOP_DONE), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	if (ret) {
+		dev_err(amd_manager->dev, "SDW%x clock stop failed\n", amd_manager->instance);
+		return 0;
+	}
+
+	amd_manager->clk_stopped = true;
+	if (amd_manager->wake_en_mask)
+		writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+
+	dev_dbg(amd_manager->dev, "SDW%x clock stop successful\n", amd_manager->instance);
+	return 0;
+}
+
+static int amd_resume_child_device(struct device *dev, void *data)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	if (!slave->probed) {
+		dev_dbg(dev, "skipping device, no probed driver\n");
+		return 0;
+	}
+	if (!slave->dev_num_sticky) {
+		dev_dbg(dev, "skipping device, never detected on bus\n");
+		return 0;
+	}
+	ret = pm_request_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_request_resume failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int __maybe_unused amd_pm_prepare(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+	struct sdw_bus *bus = &amd_manager->bus;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
+			bus->link_id);
+		return 0;
+	}
+	/*
+	 * When multiple peripheral devices connected over the same link, if SoundWire manager
+	 * device is not in runtime suspend state, observed that device alerts are missing
+	 * without pm_prepare on AMD platforms in clockstop mode0.
+	 */
+	if (amd_manager->power_mode_mask) {
+		ret = pm_runtime_resume(dev);
+		if (ret < 0) {
+			dev_err(bus->dev, "pm_runtime_resume failed: %d\n", ret);
+			return 0;
+		}
+	}
+	/* To force peripheral devices to system level suspend state, resume the devices
+	 * from runtime suspend state first. Without that unable to dispatch the alert
+	 * status to peripheral driver during system level resume as they are in runtime
+	 * suspend state.
+	 */
+	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
+	if (ret < 0)
+		dev_err(dev, "amd_resume_child_device failed: %d\n", ret);
+	return 0;
+}
+
+int amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return acp_sdw_host_wake_enable(amd_manager, enable);
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int __maybe_unused amd_suspend(struct device *dev)
+{
+	return acp_sdw_suspend(dev);
+}
+
+static int __maybe_unused amd_suspend_runtime(struct device *dev)
+{
+	return acp_sdw_suspend_runtime(dev);
+}
+
+static int __maybe_unused amd_resume_runtime(struct device *dev)
+{
+	return acp_sdw_resume_runtime(dev);
+}
+
+static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return amd_acp63_sdw_hw_init_ops(amd_manager);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int amd_sdw_manager_probe(struct platform_device *pdev)
+{
+	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	struct sdw_master_prop *prop;
+	struct amd_sdw_manager *amd_manager;
+	int ret;
+
+	amd_manager = devm_kzalloc(dev, sizeof(struct amd_sdw_manager), GFP_KERNEL);
+	if (!amd_manager)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOMEM;
+
+	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
+	if (!amd_manager->acp_mmio) {
+		dev_err(dev, "mmio not found\n");
+		return -ENOMEM;
+	}
+	amd_manager->ping_slave_stat = U32_MAX;
+	amd_manager->instance = pdata->instance;
+	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
+	amd_manager->acp_rev = pdata->acp_rev;
+	amd_manager->dev = dev;
+	amd_manager->bus.clk_stop_timeout = 200;
+	amd_manager->bus.link_id = amd_manager->instance;
+	ret = amd_sdw_hw_init_ops(amd_manager);
+	if (ret) {
+		dev_err(dev, "Failed to initialize hw ops (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Due to BIOS compatibility, the two links are exposed within
+	 * the scope of a single controller. If this changes, the
+	 * controller_id will have to be updated with drv_data
+	 * information.
+	 */
+	amd_manager->bus.controller_id = 0;
+	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW0_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW0_MAX_RX_PORTS;
+			break;
+		case ACP_SDW1:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW1_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW1_MAX_RX_PORTS;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
+		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
+		break;
+	default:
+		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
+
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_manager->mmio = amd_manager->acp_mmio +
+				    (amd_manager->instance * ACP63_SDW_MANAGER_REG_OFFSET);
+		amd_manager->bus.ops = &amd_acp63_sdw_ops;
+		amd_manager->bus.port_ops = &amd_acp63_sdw_port_ops;
+		amd_manager->bus.compute_params = &amd_acp63_sdw_compute_params;
+		amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
+							    sizeof(int), GFP_KERNEL);
+		if (!amd_manager->port_offset_map)
+			return -ENOMEM;
+		break;
+	default:
+		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+
+	prop = &amd_manager->bus.prop;
+	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
+
+	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
+	if (ret) {
+		dev_err(dev, "Failed to register SoundWire manager(%d)\n", ret);
+		return ret;
+	}
+	ret = amd_sdw_register_dais(amd_manager);
+	if (ret) {
+		dev_err(dev, "CPU DAI registration failed\n");
+		sdw_bus_master_delete(&amd_manager->bus);
+		return ret;
+	}
+	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
+	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
+	return 0;
+}
+
+static void amd_sdw_manager_remove(struct platform_device *pdev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
+	int ret;
+
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+	acp_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
+	sdw_bus_master_delete(&amd_manager->bus);
+	ret = acp_disable_sdw_manager(amd_manager);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
+}
+
+static const struct dev_pm_ops amd_pm = {
+	.prepare = amd_pm_prepare,
+	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
+	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
+};
+
+static struct platform_driver amd_sdw_driver = {
+	.probe	= &amd_sdw_manager_probe,
+	.remove = &amd_sdw_manager_remove,
+	.driver = {
+		.name	= "amd_sdw_manager",
+		.pm = &amd_pm,
+	}
+};
+module_platform_driver(amd_sdw_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD SoundWire driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899433;
	b=zVVzo4R4hXp9ByFJlsdFnPy/5G4STFDhO3xhte3SsFBGlyMAOw5tLwtQmPaToB+reMtD
	 qpKLK67VEL8Ppk7pE08m/Fq0uBboft+2fEORIEbIQDYe05BSjWhTmMH1K22zcug9VcSn+
	 69kOPRBj60XtyETz6IEk43TzSHpMIkmaEJ+NGRfXWtZlp6CC+06/wX2LVHXtA0ZnVuPxF
	 7Fv/PvHFkkWwenXLzpyXsEQ7ySwGC5cee5J3iJxH2EbgYY8Luvc9d48WK2Gp8hw19+6QP
	 bMxVLoitWUNPSzylCJb5KvW3Xew5KW4vrugiZIyuzd0XXS2EQYTF5ydpv3ASKJQ0pCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899433;
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
	bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
	b=trAstR+Uhs5qopUhOOoZ8MURRlA2LWVBVM0zB07/oLNtH569slyQRh9+1dbY055qsWUO
	 o3oxOZlaLdJ+6RqJqz5+yoEkmSvqz/baJ3qiKWg2l2iFhybXyO8GddZmkg+qIVT4su+sW
	 NiWaiMUZhZOSK4eJBeMtLDWjX2NRBVA1ufdsR83MpcwC6saVPLCGLseNpaK2nZH4dSbnn
	 K+QLi1eHyX6y7bGrXUbWddu/Td89vUbv7acYihcn1qEWDvyeYCMbbxx0c5ZtX2KY2ONEQ
	 Pg4VEjSJiq4LwigVIf95Mj7Wo7lGpRhoZe6CnfRLBIObMP60+pevtrTZT6GXFncT7yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h1i+V5Zb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.2
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1A606A336;
	Tue, 17 Nov 2026 07:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F1A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h1i+V5Zb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OinjgQFKppUU8aKw7AnrwkGGurwtSkZ3S09uIk7dH6k4nXHeklNvlvyAOV7na0tz2q5L6kLmoBPf5CdrqAIF9dNobsV5/P1CyPVvusgKXUDEFQMoxuD79qKdItWDJd1q+ADu87Ceysw0KcpziG51XZOgBt+FpAnTRRO18p5o4oi/Krg9UpHrw60qkENuHXGIXSUWIuCa86tb/l0uCz+4UafvhWkSYnT6rh5K08td65w3OGrB0jYAKAH5L7itDNvLp9su5Tem6yyAMOyTb9ZRn0WboxLrX6ZLWPP7U3l//43RlfoBW+HKN9xaZ9TUO35kzOi8jCjg5Zg7axFkYjrt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=GsNgU9JqJGaQs/Rsz5VL6Ls4b5+tibKoA7QuZVUVcPRaNIxeL8nkRtSWDwVVdKx7+41VM0+Usr0yYQQDsWUEd3GstBJFJXuAEq6G5KDKdz87Erbmm+zD9+ovnTCcULj95dxhV8bAtc0rOtioAZ48C/yB85hSIdGJnUlcC+moen1jbZ0kqD64RZv+PZNhw0LJgX7/UVDBcJkLwLmSbUYVpXLiXrCfMLYSgHFscDjUEiK4KztPpWqBvia6CpIrEip2RaojlB3gelGYjGPr9YsugGuuLi7teY0eiXetIpY9V5xlFEAduyxquEjuMMeIDxe5UeyNNQz5A+FNm2DeQccF2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=h1i+V5ZbLRruedk/ZNyXPUKE7eb7r3uv4YcEx+OuBvyWMtwAdhFYMosStIzfuvtA5OVmPRbf2jJauKcEFF/Y1kQrQ54uElX921zs+qlSiC8kLjszViDDyGdjyhP7RxhTSJ8JEnZpbnIF3afqSLmOJ5puJtlI4JRh306asyIV1fA=
Received: from CH0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:610:cc::15)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Tue, 17 Nov
 2026 07:10:27 +0000
Received: from CH3PEPF0002457F.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::2e) by CH0PR03CA0070.outlook.office365.com
 (2603:10b6:610:cc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:10:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457F.mail.protection.outlook.com (10.167.252.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:26 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 01/23] soundwire: amd: consolidate pad register macros into amd_init.h
Date: Tue, 17 Nov 2026 12:35:36 +0530
Message-ID: <20261117070906.803139-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457F:EE_|PH8PR12MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ae03d4-9583-4558-661e-08df4479db9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|10067099003|261021123027099003|11063799006|261021121427099003|261009223027099003|261021135927099003|261026121527099003|261102123227099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2cPt2MPeBO14RKoEOr+7yF83ZoIwmJ521GN1XWN1WCujuuXt0YFpq8vee3tSqHK7ZvxcM9W++itdX7BdYqfANCxFemaXrfPnvouyFjYUmbdOpnlrIq3Yjv4rzjaQ1uIEyCDS4muQmyBh99scaoLMbtJkFbq6hbeh1XKoM+pRzxn1bgi/37+RQUCZBZWoONZnfrVcv9pL1YprnBg29PDQ2VetqRL0XhnfGqlX/oFYznUa9dWEBgj33+nBvuQQfYJ2/ZL6MCWjk29MwmL38zPpEeZAvh25fr86r4WXppBrlckr8kdTmvnJh+uU7s5lh+XtVRRKmNne+dl+XOAt9ZsKs4XolGffDsLLr0kb/dnu0hoELif9TJi8xFYIASRB40zhZcu1oR2OiVTUhSzO5fPL5DZtVmtrZwuNA6scZ2sCq4R5TO30H+QViQ5e3D89dS9nQAL55eB9NGKYkOajwyzQnOvcvEjPKw9gUYUbAu+XHWdDOPAOB+1ULthFXMz1rAPfHGD6q02LpsTeF134N1NPB0qW6gMP/wZAQCwtgRHzGX0s5Bpml5SResppPQ8U0uxXbbZlSkWmNnXi2k13oFDlMs4Uz5KqnxNXTvXQpsoRBRZTwl8XmhSvlr2VSdJjtpWaVeEVsmbwqHiOM7eoWp4255f4CCftkGgcXyyzBPYCu1H0sjssLkPEUWOQeqEvmHOL3QNLsrkw+QnECiETZ4iJFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261021123027099003)(11063799006)(261021121427099003)(261009223027099003)(261021135927099003)(261026121527099003)(261102123227099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u6LDapzP22+yHUCg3N7g+PDM7Mwz+mHwnpRcE1Rka4rncFEXttV8+b/JhJox+a6EsONTo226YuYPlrw3stexq4yIZEmmWFGasEsqRweaK2Lz1r0CEwCc/M0vQiv0qbfeffUaeYRrBnax7ZgIWbl6ub1ddwj9FwGqBTdP9z+S5MojppyTHhfxZWFZmm7n/YzLsSX4c8yVMl0uViF4YXsh7EFq35xFRm3AMrPo+fdjh99mWrA26qQQO2ANZAUIUHv3dUmxBTvhCC3vsDhQDur3LseIMSw7dc50YOkZIR93GxP5OJUhfExNPnNWl9qj0moJO5eTVLFdjyA0aXRwmmLG4+GaUnN0Vw5M3sSQhj+mCcsNCKryNInBQWiNKH4E2DSTcpXIaXGeEb2qxbRQ3GO/4Ru6ktvJJn4M6NELoYTpL+qHNtD2WJkPo2wZJEy0u8nI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:27.5668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ae03d4-9583-4558-661e-08df4479db9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868

Move ACP_PAD_PULLDOWN_CTRL and ACP_SW_PAD_KEEPER_EN from their duplicate
definitions in amd_init.c and amd_manager.h into amd_init.h, so a single
canonical definition is shared by both translation units.

Drop the eight stale AMD_SDW{0,1}_PAD_*_{ENABLE,DISABLE}_MASK definitions
from amd_manager.h; they are no longer referenced anywhere.

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    |  2 --
 drivers/soundwire/amd_init.h    |  3 +++
 drivers/soundwire/amd_manager.h | 10 ----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8e419ddfa516..b4f45bdf3c17 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,8 +16,6 @@
 
 #include "amd_init.h"
 
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define AMD_SDW0_PAD_CTRL_MASK				0x60
 #define AMD_SDW1_PAD_CTRL_MASK				5
 #define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 5e7b43836a37..106852464dc7 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -8,6 +8,9 @@
 
 #include <linux/soundwire/sdw_amd.h>
 
+#define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_SW_PAD_KEEPER_EN				0x0001454
+
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
 static inline void amd_updatel(void __iomem *mmio, int offset, u32 mask, u32 val)
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 88cf8a426a0c..98c814d5d7cd 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -11,8 +11,6 @@
 #define SDW_MANAGER_REG_OFFSET				0xc00
 #define AMD_SDW_DEFAULT_ROWS				50
 #define AMD_SDW_DEFAULT_COLUMNS				10
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define ACP_SW0_WAKE_EN					0x0001458
 #define ACP_EXTERNAL_INTR_CNTL0				0x0001a04
 #define ACP_EXTERNAL_INTR_STAT0				0x0001a0c
@@ -180,14 +178,6 @@
 #define AMD_DPN_CH_EN_LCTRL				GENMASK(2, 0)
 #define AMD_DPN_CH_EN_CHMASK				GENMASK(10, 3)
 #define AMD_SDW_STAT_MAX_RETRY_COUNT			100
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_DISABLE_MASK		0x60
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_DISABLE_MASK		5
-#define AMD_SDW0_PAD_KEEPER_EN_MASK			1
-#define AMD_SDW1_PAD_KEEPER_EN_MASK			0x10
-#define AMD_SDW0_PAD_KEEPER_DISABLE_MASK		0x1e
-#define AMD_SDW1_PAD_KEEPER_DISABLE_MASK		0xf
 #define AMD_SDW_PREQ_INTR_STAT				BIT(19)
 #define AMD_SDW_CLK_STOP_DONE				1
 #define AMD_SDW_CLK_RESUME_REQ				2
-- 
2.53.0


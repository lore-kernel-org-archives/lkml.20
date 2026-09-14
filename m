Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64262424641
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381367; cv=fail; b=uFyoiLPO8JwSP/7A3RcCoeD9t460FQsNjTAiHs0DGy4QZ3YeXT/xhU4no4USFAiioNQDM79deGO+jZk33LXRF+GoS80RSE3lasUmvSD/912GXf49ypHnl4ETU3PepmB0+QI1qqADe0y/p85DTrvJ1me4Aly4aAOHsnaWYCqKAXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381367; c=relaxed/simple;
	bh=9Totc1u11nygKg3WOusNkzlnzry1tnUOkS6oRvvXU9A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OokmeRaxRxikbKiiwi2rA8CrADIXN5ytPah79QEr6uL9XbAiaLT4Rb6HW2b7rt9d7txqAHskewd3h8wwjIdoXgvr+mHYA0KvbBxikVUsTCUqDqcoj5bv/lXC+LqHODv+Ysxs5aM08IR2/4j1tnczfAaawmNHgrtIJTQk4mVz1C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fCB3SMfr; arc=fail smtp.client-ip=52.101.62.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fCB3SMfr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4sZIIXzwDfuWrRA00jrQifGCoDrXDIQzutcUtepNlbzNlRXH8h19C9EBO1goIChJW/rQfFGYzBow8drgFfmmwcgC9Johi1Ae1/Mvdxa7rE1mAXdpJ39vqHfJCAncYXzWDJVKqzOog7BYC4b0Kzh7QDMzm1hP/84impEGPZUTVe7iKOiv0as+eLk6CEhrc6/PXOLc2ZP2QesxiE6BbMtBTgdtCKJeEKwek+v5XQJ6pLJOnH/ic4PIJjfU7HX0WrLjcD9lqvzn5Ovv8ADpbnZqMd/3TUNwIQyhwNCAAdZENzcRG+aJsjMRVuBWZSHPyuGpOUf/ZEsKnTKOm3Qs6Pqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY4zU4BwjWt9MXU7dImmRTeInsHmYf9dgC52QpDM1Ns=;
 b=YYeDC6g8blVuQVfFhOm5AZEfulj55ZACeK6Id6KRkquBJlRWzVRm5T60gEaDc9+yiESQ27AYf4czC/2lmqp1on9WRU+ce6QEsvlNQiorXhOCd6xKh384Nl1TNFO73Hq02EpK3qVRaIEIFHNv+duU4dGoZWA9/47O5ancwQsfv5aBSD4of6B30qDAGXO0i+qp4HrN/rE1MrOPSJKWtjKed4BNUl9alHSeY5d8Q2NaRNNr5v+T3SJ0NL4F9hQyBEq6VMrN1Y+QNEAvWKAoCrUmJqaXJr/dPy9zgiGXdczKGyzmiPJWlE0XXZjqkOJmZfRhUskEEPzAj04+kLxCeqATPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY4zU4BwjWt9MXU7dImmRTeInsHmYf9dgC52QpDM1Ns=;
 b=fCB3SMfrqdyl4mdUlaMM0k21mPEnxWbEDi97W4XJMTVlgAZlp2kNeZKGHnkRPnUAj41ufIW6fPL3kFmGEJXcWXzZi4Mh4CD/nMUdPfZkPSZ+CHA7zefOC6xfgr+z6RHrHVXL3QwhTluQZxXubKMBE09p3j7xjcFU9WlfTSIPnTc=
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:22:41 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::8c) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 10:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 10:22:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 05:22:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 05:22:40 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 05:22:39 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
Subject: [PATCH] microblaze: Enable xilinx dmas and axi emac drivers
Date: Mon, 14 Sep 2026 12:22:35 +0200
Message-ID: <6d41613ed4ccfdc38ec47070b79a5893e3abc2a6.1789381354.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=michal.simek@amd.com; h=from:subject:message-id; bh=9Totc1u11nygKg3WOusNkzlnzry1tnUOkS6oRvvXU9A=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQtP/V2S+DGKR5P+gs/WRyuCXRx9J6XuG1h6/T+Dfq/Y rQsFred7ChlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJrDnGyLAyweUam0p9xe5P /fercpsETY7fn2h/c/YN8a3Lf5SfaRBjZGi7L6eplZapdad22Yd7dx7telZ1X/GUZOFcKVUeh9D 3lqwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|CH3PR12MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 508837fb-9a43-4d63-62eb-08df124a1bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sro/HfIV/LX64BogOeUdqm0L5m+sy686O6/sxK1picwQ6JOn+G3jMgUf9xjEoVgyiY0OMBuHVJ8YUuQdH0YIyQm5ry3FDjg886TfCJX/UAnpruTHE4551dxcktpIGYB1nY4JC7t4gjO87acmE4Azldr3pip/zCeYVx4D5489mmUlgVGS301Vjgy22ekgHicC3I/Cxb7e1PkD40mFfQpvkys0VZ3PqIVJv1Kb7/OgRKbSwIPjsSl63yDFMMRs7TqDX8jYifGOu0Ss/8W1WuaDMz0AfKmR5dlex6jbOARFbnkPkDY2pnvxwxtA5my0m7iNvTbWJBBkQuzIDX3opRapZIQICqD1GRMxsG8H8MnUI3FfivVlLnmdaGtHxlPqV8wAO4SMfhNT/Rlyv2UUxGnIL2draoRyqQhiFvjPyvYwXZRuck3uAxcPGBQ3WPYGSPG0sHHJzZGMzQjeJ2GImE+pIP92WkinHM472RmbaMpaYOL7yca0M69xk7459yiaNcYWkZXZW/9NdXyKBV2onw4NujZDu9SZyK96vpi8EgrIB1ewXVdU5SSFhEPL9c0cXbif/KerO2CEn2xgWXtu+2EYxOoaZONxaYklQ5b+Xu7NHUT9Gd3hewzrWPGTMnPvzP8Zsfwq8Bh73zVcylbAyzh+RkXhDWc6ADyNTk0hTm62I+DK9Nxc6SrHzNXCqCjTxRyT5Sk+rB7AKCyqOKpWSkY4mg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VAz/D4kKEhwJ69Vn8Ab1P9h+Nm2AUsy7nsJX8rpTBgpqko995lrRpDIfgOMu5MggP3JKZErgnsZtiVq28amei87yYgO8TeBkDTZEhDyy9FGyWJHEj6obnZixbc6Ghpv4AITQSVw25mJSpwnTSizL03WTtiLB28J9XUe5DuZnJ0ufMC2cMXwCSqkqS7BdgNgx6kzysEfW7CHupP6pweYRWt13xO9LgkGj6BSbparRHNJmH3ymadgk7xeM4CJZCOixLEMRHHfC0X+bMxoDK38lIsG3KgrFplmJmANv69rDyoF192jjTvgjJaQYXaS4Zhcqf7HzYQGxrXIPKYfzAapoqqHTQ+b2HGcXTSGYAMNjBb7p4Wl6WmrOX13iOH0AJ7elnERR2UFU1+FbLqBw7RFC37onsrztXFKFoUOOUba67zSfuDJd9uHCVNyEe720cY3f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:22:41.2470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508837fb-9a43-4d63-62eb-08df124a1bc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737

Both drivers are used on Microblaze systems for quite a long time that's
why enable them.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/microblaze/configs/mmu_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index fbbdcb394ca2..7f9b19d0d9db 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -70,6 +70,8 @@ CONFIG_XILINX_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FB_XILINX=y
 # CONFIG_USB_SUPPORT is not set
+CONFIG_DMADEVICES=y
+CONFIG_XILINX_DMA=y
 CONFIG_UIO=y
 CONFIG_UIO_PDRV_GENIRQ=y
 CONFIG_UIO_DMEM_GENIRQ=y
---
base-commit: 98f468b04d5cc3be5382a923f19ab289e0c40fc4
branch: next

-- 
2.43.0


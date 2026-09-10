Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C6595729;
	Thu, 10 Sep 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067075; cv=fail; b=oz2OPgjEJN0DN8IAavKqFFGl9c/GN+2gyGqJlkO9rFb8a8W8ZpEqAPeBGMkML/yG7IGwmE2szKwYo7QgG0rucNbPI8ItpWVEoJxY9MA1anQ0Y0Y0EWrtc4SV4ZbsKtmY7oOiiczK+9OAnoAM8SAg+XmrDyXdXjqMGlFlJlp6J3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067075; c=relaxed/simple;
	bh=DqashJMrQX49tCkDDmSpfSNfdAdwDr3UHYDIG6k0Dbw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQaxJaX8LBFjGL0/vJk3I/mcJKIX2gBS3UIqmrZPhXIzbu4q0WmDdSJu1BxshHTXmDQWkqnAgz72xoXsVirsUI2JTVibPHSR66vSWcn9hXYNdcJrSD3pWECGpNIJmtl7K6XuCh+zaIagUAvaJdoDKDK2BFj24LQIC9i+s2+29ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WqDvw3Ba; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WqDvw3Ba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKVgUXDLLdwzOIb6aNaGPx4R2z4vr8DcZJ4734oiOzyRo0XWPy7pcoj1z3NnTAF6Pyqrbc7XR9OqlTIiANmQEDB/PUQ4/Ud8PR7Bqx/ttm+tVfLETs6KwkWHtnpfBsL9Fbu1SUHiXrp0lrYjN/BPHK5K9QfsYsQ8nmqXq873mthODwrU0LHUB0/14xOfsFv1VLtJHo06VsYdT8BIB7p3uV0lCMeujSxx9gj/9N3m/d9pS9341WlhcBrKPjhZgjee/xhtNOh9HNPVe27eizIy2mOxIZAu3/pEP6k+/qkZIFoTsmL732sUyyr5puWP4AjFkZXW1o839sA8O8geZ/Nwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKeHN3IJ2uXIWj3bKKfuPjV7ploK0JTlIbpwvQf9FME=;
 b=UCavsuU2Q13wb4iiCCCAeXJv9IuSi3XiiutAjg2Ex5x1u05NtQ+C4H3+xwGJKAUHggpUCnXpb2R1dg8Rtd59LhB35Se1/5+Ul7vwnv90CsFBduKs44LutP4+KInOJVyr1JFxd1Dx7wYK1W6qCVsMT09hqNYe+vA6/5eDh//XHh5yQ3gCudrRSQmHjakB20hzBUAtXcjtETlBufXB/PBUJssAyVRkm0g4cQDJy0Sm8VoYo/fqqKrKA8sGW1VZC8NxJaBATjDSHFyU80DIJ5CmwQuFGKSB56isHiifUNRhXhiCtRIwbdLY0oqGfyhqLCTHfCtxqWG5XDo7Ax0on2xb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKeHN3IJ2uXIWj3bKKfuPjV7ploK0JTlIbpwvQf9FME=;
 b=WqDvw3BaMlepCJrYL2SfIl161C6nhRtIv6L5doZTxYFe2yiGf2tN2+/1esoa9YE9Zk7yP1flvaRxgFLZyujeK+ApYuzPzd2VpgzscMj9mUzjsr2pj/Kw+4J3EGBBPCIq6cEtKpR+MuQzcVo1MXi5uQ3oPu5fnZJ7/7Iz3Dq24+E=
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:04:23 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::1a) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 19:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:04:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:16 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:04:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 8/8] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Fri, 11 Sep 2026 00:30:56 +0530
Message-ID: <20260910190240.1604447-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e5f49b-4440-445c-fc32-08df0f6e5387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NZ3+g6BoJqnAwj3aXrBlnVgw9E0UARGB2SkBbwANzv/9VJ0DdDLEMQLKV0SqkkxKaR3zXml4wJBzeVHyyFr2/7pOI3tFQheIPp4z4GddGAKz2dGNysSwuBfdcC1zy6Joz/ect42/CARZIrVBk0zmvAGMgN5tKCFwbDOonQ6v2PenziRm8HQQSigU0aoeNzvJcyLc66uAnrx/4AIXbFweTVD3ksdSopS1b/RU5Y7JFLtyGQdBXIpu3wyiZOVuuZmOlzQWzAWcPEq1/V2YN6GmePd1HuifhaG447lv6uRPAcAw/esxR1Zy7Hl/t8ygbHWpvXues9V13dJr12Zht+ydV8902rWEBIRoESKIhO1PUrKrRa1AWnleY2HMALTxF5hRKz3NLmWRZW6heQ+w3NF4hr4AOfrwUfQZ/qi3JIBRwsMjvdprjYLWdeeBgy9qL/nM76+b2+sd+7Kek+PnYSMNMtduECHtN0veRoZwEOVNFK8bfQ5WZ/CMh28xhdQaSFzTyZuVyNLt1lvbxwlKoR0rUa4e12aZu9Zk7+UgbWXgctzU824fA3ksKzx5ouvxU7krqzyI93g2bhcvSsXgxRiwdsYIXeDoTaYk0nxIMOEGVn+Wez818G1grBaThI4mvcOkhuIuKw4D0aouH4qk0SJ73pqx6GNHK5WwJYcecLC27/5GWpyTgrj/YXaOIpq61sF3Z6t+dg+3c75Whq9jBkTI0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cFP5M0OksH9Jrn+y/0Xn854kQQ29y2b0Rqq/sV+TUiQk6PZCODUzt3NkJWmcOhiUQyQ3gcOwl94cjqRZjR0g0Y//VvmjWwFv7C+Ngqfql1+aD7leUr/n+lVP1TcLz0fi+62KgBTttH/IRkAFckjhJZ/E3DR+EhScBwBsR3XveA+kjOoYoN0Dxy1CmQhS/9svkC6wz3pHnlww1AUz5OCC4qIAFkCEjlLqr9Hw37ID928Uk/sDfvK/KGBm3onGnCdfe+8eYxU1aCkGPcYZ2X19gTsGGXKwBgSItZWA9ssJg6T6f+GjKdny1zm6hCy4VJCjRxRdBVWymQKq1sos8ospctS9C9hWg8AnIq0rn59MRDr13vYmxxfEC+YPT3FT0fc4hTORpk8DrtgLbhWHNBpwtBntbuQUvlGQUqSQbVMc9qeZJQB7BdiH/ScHZD4eKMxU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:04:23.0838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e5f49b-4440-445c-fc32-08df0f6e5387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594

The CLK_STOP_MODE branches in amd_suspend_runtime() and amd_suspend()
did not close the ACP_EXTERNAL_INTR_CNTL delivery gate before draining
amd_sdw_irq_thread and amd_sdw_work. The ACP PCI parent driver interrupt
handler dispatches SoundWire interrupts to the AMD SoundWire stack by
scheduling amd_sdw_irq_thread. Because the gate was open, an ISR already
running when the drains completed could re-queue work after
cancel_work_sync() returned, racing amd_sdw_clock_stop().

Fix both suspend paths by calling amd_disable_sdw_interrupts() first to
close the ACP-level gate before work drains.

In amd_suspend() CLK_STOP_MODE:
 - Add amd_disable_sdw_interrupts() and cancel_work_sync(irq_thread)
   before the existing cancel_work_sync(work).
 - Call amd_enable_sdw_interrupts() after clock stop to reopen the gate.
   ACP remains powered in CLK_STOP_MODE (only the SoundWire bus clock is
   gated), so the interrupt path must be live to allow wake events to
   reach the CPU during system sleep.

In amd_suspend() POWER_OFF_MODE:
 - Add amd_disable_sdw_interrupts() and cancel_work_sync(irq_thread)
   before the existing cancel_work_sync(work).
 - Remove the redundant post-clock-stop amd_disable_sdw_interrupts() call;
   the gate is already closed at the top of the branch.

In amd_suspend_runtime() CLK_STOP_MODE:
 - Add amd_disable_sdw_interrupts() and cancel_work_sync(irq_thread)
   before the existing cancel_work_sync(work).
 - Call amd_enable_sdw_interrupts() to reopen the gate. ACP remains
   powered in CLK_STOP_MODE (only the SoundWire bus clock is gated), so
   the interrupt path must be live to allow wake events to reach the CPU.

In amd_suspend_runtime() POWER_OFF_MODE:
 - Add amd_disable_sdw_interrupts() and cancel_work_sync(irq_thread)
   before the existing cancel_work_sync(work).
 - Remove the redundant post-clock-stop amd_disable_sdw_interrupts() call;
   the gate is already closed at the top of the branch.

Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 0cb5f4694e9a..1a252a81269a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1321,6 +1321,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1329,7 +1331,10 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1342,7 +1347,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -1377,6 +1381,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
@@ -1384,7 +1391,11 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
@@ -1392,7 +1403,6 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-- 
2.48.1


Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115058F094;
	Thu, 10 Sep 2026 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067046; cv=fail; b=ZNbUOMADHx3Qt1wTImErdkU4DI9p3bkgV/B7G+2gpkyIoJe+0Sgbi7L2vPcMQyCEvi/r4fhHOc5aJLca1T4XLEbAUZ0Dt7pz7WFv9w9huge1ErIfwxJc93ysh7n14Kk82h2hX1howQjmhZRIp2eVrjJLbXSypX7MJpmFOFO2oTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067046; c=relaxed/simple;
	bh=dzNn+QCEdo0Ugp5pBE81Kq+9ejbGy2U+QXb8LgGezYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cg22hI1Bw2pxCCOpa8ZTcP2aK8PghUdxHD24cjtPHT+cpT/oz4WzxPWBrW2e+JeilTlQrKSg8jN+3+iByla89t8WQZD3m3+WvMdLs8TQ8sfbj4U901D9Nc2f3F0BxLxHXPtAKFb5xkxYrSwNTMIfQw2ZQJEyVyNOYUQnHtDmdnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F7m87wHz; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F7m87wHz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvQQiLkPQ/mvFqwC6qQlYjlrzYgRJ1odr3mPKFB93prOxyf7gW0pn21U7LODOmsoqI4VxvFqDLkXJpRbjsaBKGvGPsHU8lKmCQCySuXLDgAXffNmlhJbP7m8P6drkEzE5UU4WNzddOHxlT4Zof3EsVVMQtBDhCiy0TLn+0eGfbz5nvN4+sqrdHVbWPeasvJgZpu2N0q8zg5D+BEkGGFTYnDWpBBcwAx/0O6m3gOdVRi6QM3p0HP9makIddSQ+xJXQMoR41p6lN4T9Ug3Ap1iAzvYuvYpMl4fNer3nuw7MJ/g6gOUUxxNPuuLLoLhOInabNhzqqO8RVsq3hiJeaBfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymt29p6r4iv3b2WdpB/Ci1eF+DndcNpnIOOUSemMp78=;
 b=UAiFg1+Rvz519OfACuE/2R3oN17GpZWFWvuGq5mjQ4smN52t3ZzWib7z5FCLHt287hjfF5rng5c9KjZqpwYQF95+VJJs1P3tHPqdNWxL2OKlFo9F1KNDw0YNthjM7UdSWZzD602y9dOgrsZBu0YmC6nIhWC9qvyeMEZmp5zolUFDbHR1AELQIIzQ93kZqclIUUToyL9S+2rzuAX34ecbtysKZgt7Ato8P2ZwiZG2aB6xiZEWJsVWcVGg4vBs3Z5ep2iUuDu8+3S6kCMY9OnCmMu+Sa2oRBuwLUxWG504Ks0uTmJC/UnyA7QtTdjELituVJyAgxSbe7IXKG/ca4qmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymt29p6r4iv3b2WdpB/Ci1eF+DndcNpnIOOUSemMp78=;
 b=F7m87wHzEp01lFP0HW6eR4fBeY8Kziynr/iAXjY5Lv8b8djjbM5449c2hjqAwgWHQOIwryDh/frujP7tAubRrLdrloH9Mlk5dGatz+TzVZvaVmOMzB/oTB8g+RFnZjlzoO4CpimkRCDqYO2iZ9gd3FMm6HOqa+UuLtTkLxS88TI=
Received: from BY3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:a03:254::31)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:03:58 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::a5) by BY3PR05CA0026.outlook.office365.com
 (2603:10b6:a03:254::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Thu, 10
 Sep 2026 19:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:03:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:57 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:03:54 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/8] soundwire: amd: fix work drain ordering and pm_runtime guard in remove path
Date: Fri, 11 Sep 2026 00:30:51 +0530
Message-ID: <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 8677c798-04d6-4174-3359-08df0f6e445f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|6133799003|10067099003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ogQvNJCA3blcqb+eg1MY8ze/7ifXxDOndsjZAb7QKtAyd8uKB0XpjcJYqmQ3KLMBDcE8psN6qiRTIAv2tHuNZr8fSWb5odXZz0Yyma7fDorjDkwIYypeVyXCKHoN8PNxRJGAD+Ue8e67jY6+n+jOoCa51WYl6DnbZOrGmml5oo0z9exkJTp0JOYMK1M0Kms3CUezqnCNmZGzXG5fQRPbS4NCljMb/48ZK4z/NqlfRZ3gYHlsN7MUUNPBTUT5an55QsRLrNtTfs+3Uedtx5V4xSdFLMhq9wsyC9LKE7/OexV+fSIBp5+/2MsV7Ym1zdFIc2J6XOzL7/d33yjLlibgnEAN0Kd+Y2B+nnNz9Z6v0sz5FO79+0p6ctltqQJKGbE3VJSTCn9L6YKZA1NlLkX+YHiwUkgTOtGeQ7H3J07yaT3PP0LZzb5/LnJIoIfAkXKGk7lul+IVlqe5tnSA6wUceu2LF+OdqUgr7xuQY85S8dhqpxAv7P5gywtju1X/o+OrfXHWqFYucUXTqTdiugm8Wrxm2FVgU9NuNwZIc4lx0URK0ncN9tbCR4fj605Glnl/ax66eYMleNoDrhpWwMTbQx1HJ69vzez/Rx5K0WpYFJhL1YqtLAjrC4Wu4fSvqGES2DQ7CsPphas/Du7ED7kpsXQNegRGWBzPuCpPJgejVAG568Ntmfkgkj8HAcnRsVOqj2uV30ZOUlOOJHEulf5P2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7bW6DrKlWk2cfK8JBNYfvixnxe+tRH57mri4qn61uP2u9OBzvWROzceWLhLi0y8xdXrEc/P9yEjZ175ES2KBBW0qx7UVN6DLCEquXI05hksg/Q6WLAAoHA+zMuBU7tG/tuCjZvtv3SB71ArkXhis5wEJCZL+OzDNckqI48NpE8A1L+EuzNPRNwK/QlioFauqCALzLMy8vwgK9aFikSPg/PxdjgadtC6IhblH12/pqF3XGhAQlwN8FTOyJfPx/fsfACEDssihnf+9xVrVuC/9OR9fRkaVbfWqVghb4/eTEa3HUDZCcTsQmWB6vMIBc/q0TUMvk/xeW0U4qp+0g77RxL5DmZngNiOCz3sBCgOUUz6bXpfZLPvQH1E2aLk2QS8iYisvO8OxrZcTVLt7vZtejZ6CzqmEVzIgzv3I62sDTUly7I2tOeyReawDk4W+Jfaj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:03:57.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677c798-04d6-4174-3359-08df0f6e445f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590

amd_sdw_manager_remove() cancelled amd_sdw_work but not
amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
schedule_work(&amd_sdw_work), an in-flight irq_thread item can
re-queue amd_sdw_work after its cancel returns, defeating the
cancellation.

Fix by calling amd_disable_sdw_interrupts() first to quiesce the
hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
then cancel_work_sync() for amd_sdw_work. The existing
cancel_work_sync(amd_sdw_work) is also moved to after
amd_disable_sdw_interrupts() so that any work item queued between the
old cancel position and the interrupt disable cannot escape draining.

synchronize_irq() is deliberately not used before the
cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
IRQ deliveries can occur. An IRQ handler already in flight may still
queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
This fully quiesces the driver workqueues, making synchronize_irq()
unnecessary.

Also guard pm_runtime_disable() so it is only called when runtime PM
was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
only at the very end, after several fallible hardware init steps. If
sdw_amd_startup() fails mid-loop (one manager started, the next fails
before pm_runtime_enable()), sdw_amd_exit() triggers
platform_device_unregister() for all managers. Calling
pm_runtime_disable() on the partially-started manager finds
disable_depth already at its initial value of 1, silently increments it
to 2 and returns without a warning, so a later pm_runtime_enable() would
only bring it back to 1 and leave runtime PM disabled. Use
pm_runtime_enabled() to skip the call when it was never paired with an
enable.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a57b59609bfe..bbe1e73ed255 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1172,9 +1172,11 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.48.1


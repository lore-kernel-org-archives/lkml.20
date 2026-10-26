Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989995;
	b=kfPV+qRQsFc0dF4t7sGguG+0d4dNQOapKsaQSfgh+shF7FzG4cp1YMYmUx9RJgpthAvh
	 +Uede0Lzhqv0C8E8421Bbeg6K+eQfnViUUIZkpFT3texdiUGO0UpVTFWHIMtVMi6c15bn
	 DjEDexCPdk4pIbrvqbYyvfGGQM+BhFpdxnji3ah5LqdRx7sO5bRwoErnv/OeEjn2HEW86
	 9/CHCKWG7G+rA+8JAsSq31dY209n+vSgejqZJPer8dEeDSroTRbBV9fx32WjYOCauSzlv
	 b8fhsSRFQbsW3KoGib3j+8C8d3Xzkjo4ho1REDYYULoWOZ+PeGvAmuRzbtwIJ35KQiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989995;
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
	bh=nRMq0Y/III9WvmNdpdHBC44Y9SYyc6Ko1E7ZgNps3io=;
	b=YVAn7uoXaRYJjgoCbsdZmxyoLOmSk+w+gnNMpqu7gRgzaWSn+H0kgHUCPgyNW4Ed+OAd
	 xZEfpZC8sGec/UOqWxsfHT5FHZPGbG1t65PFsfXKfFERc+upcUyb4rvxuAnvXE6ljfAJI
	 oDcpcV6IZAB+xHfVWbnD/mJMJCl/Psisx0jGnOSx1HqRTU6fPhE7hXlTBDRD8SqjX+maR
	 Usp+3Pl7IAA4KN8gyYTWhaEh14kNXXJDwBcBcO1N2f10F7AwkALF0pBV3tsXOhoHz/NaD
	 0+fiWAQzRVp7h7wBzwihXeDXW9HE6Dh42R00MvOZ+8uEvrRI1DPZxPF9M6rRQOX0OZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TvG1QDLn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.2
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536AE606A325;
	Mon, 26 Oct 2026 04:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TvG1QDLn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoHzc6plkXR+GYPjkKVKfo9VClF58WW/pGpxs58SLP8E8L65cnMCNu2SEg2EX97XdxUEkrYKFq+UbnOoN6HPvslFSxSqDSNn2e60A/Bzwb8k38Aa98uVpYO2bJOtx+KYI5AVUyymIPGiDHg1WBs9AjAeLbLtT/vPAnCu69TFNE39WCZbXhr6mtoAjAs2WIiU6Y1xkLk0AfZOPmNmVKhpADWcrk+/mPtFaEPNboreSCpmr5wIz32Dgl9/+EELnXhCwrF+8Ku3puOHpn/Jt9fFAmxXpmwsEzNThTFcOH+hIpuzW5vSMc/B0lt+/fd7P8eJ7C/WnnT7GRdvLRm41vFNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRMq0Y/III9WvmNdpdHBC44Y9SYyc6Ko1E7ZgNps3io=;
 b=SqA9JZvIkr8d8htuwjx5VcMxh0bPjCpIBHpHzG7O1sVngVAOOTkEJwN0mYXccQTQTt5l+GhzSBhnnYWIh52CGQ6mAQg4afv4Pf18BWFvSxW4wCW3Zd1T2qOtxBxke/nC3TUosYsVgFYPMKIUY3kyWWTPsxMz61USXLdhB6qEjTltjkdXJgyBdSyj2zW0EuuzARqLpBoTWstseDgkwxtsVegFjzWiUMeJ5RnqRVnf/UizWjvhOJN4dZFa4LbAAekk4J5CDebTK4JSXZWNnZ62y9Mzt5sEnSssT1AzwXvWQF7Lx+8YsM8S9+MiE2QCopVW3BQvxNphmXUOiD2FDE+p3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRMq0Y/III9WvmNdpdHBC44Y9SYyc6Ko1E7ZgNps3io=;
 b=TvG1QDLnDZ5ZgqJ4yZmRtVJhzVmk1prBOMmrMcWpehPuL7YRDywp56hhxMwh0occA39IkfueQGmdpKBfDjV2AStOXRn7wwKTQLXdZ3XS0aco6NJACNnOrlr2QmmXqyLjS5MqWXvk23PlneiCBpLsObi46ykPcwstppU85rzVYpI=
Received: from BN9PR03CA0092.namprd03.prod.outlook.com (2603:10b6:408:fd::7)
 by LY0PR12MB955947.namprd12.prod.outlook.com (2603:10b6:404:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:30 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::1d) by BN9PR03CA0092.outlook.office365.com
 (2603:10b6:408:fd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 04:46:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:29 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:26 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 06/13] soundwire: amd: pm_runtime guard in remove path
Date: Mon, 26 Oct 2026 10:13:37 +0530
Message-ID: <20261026044507.2310694-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|LY0PR12MB955947:EE_
X-MS-Office365-Filtering-Correlation-Id: 2537f85f-2f8a-446e-aa32-08df331c1a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|261022075727099003|261021121427099003|10067099003|261009223027099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	+Kzam+ptJyJl4Ed1QoIThkNAYFh2DtnkPWBlcS5HqwZYqKw2KvnnTfWP8NX/CppimlbNflm/pkjYgh1B2QuCWOPHBV+bDFbZWGyrt8zqpuoDWViKigXtYpgeBdzkh7QHQrdnpVcsEfCka9l6u+j1+DcHerOeccEqNycapDap4J0IuquAS25R5Xr1TQyE1slEEn320lnHDONGIpbLFwHEim+pWNQAF6nmR0nJERzCF9OsC10aeRUuQ8wmIKGkOwzghMcpKsGY9YtSxcUhLhA74wLecmCx6u/Czd93SBTb7StWX6IIL0Sl3Kz8lmYfCGJ42ey87o+MF5An33/wwwjb/N45+VdxoYIWgT4ciPndVNJfJ5rQYY3Avqbbjf0lwxABScQU6x7fMg015/SYWAr78yIW0nrK6gTOl8idffwnYXzZOIk471fEMNysz0Z+YP+JrIXNQGAiO1rh5RDZbMhQZdYiPv3W2LJyIIG/FNNMemvhCx3GpBt/HeIv9N74grRaTA4AOcExKY8LYSE9cxDJK3TOyogLiAh5BLx4kfdX66G0SJeQRF8K4anmtf4f4Jw1t4RF3vhMRsdh974CmargON6X6tff9xsxzOVG8QgsJgT6eZUQ1QVM0EfiAQ6v9rkdGTsQQBW2HriG2Wxz8Vr0xyhtJHvvV4bcxzDAyAWuUuYH7ylGo1KbeGdWobylVDDYjMCivEW4+chNIhajDfN8jA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bCzt5rqh7ps6siJZmhon5rsQVqJ1CUkpu/1GBd1r1/NoGdpyx/8MsLJ+qxz74EN1Qtc/JCqVMKOqYMS3Vlz61f+oPPv8D4uPRVuoDVlqY/AnapwDRntrHNriXpBwvwqN0xlAS7OnR7++S9Rhlm6GssrQZlnJkIROHC3aT/n1vCeVX5IO5DIJo6O4HubcIyFi8/yvj8jTCw54BUiS9V5mfZhjBQZ1otem0m3yWbq/PxspPuh2D+VopNiri3+x2Xytc3o4BjYNcDhaXs2Vk9F03Vo+zgCjsX5aDOZPkCQmw2E7dC7YfssWiJ1OGGPr591a/ADNKApa0nFqIkbQnmOzzr35IbUubob9O9pOPawhRbvnbR9+HLUDp++yhjEaUmxdI9Of0q10bih4cwZamEdv3EvRiLx1nPk+ZSVzMl7fFxTK87Zapb1HVN7jBqIScn1z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:29.9726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2537f85f-2f8a-446e-aa32-08df331c1a1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB955947

Guard pm_runtime_disable() so it is only called when runtime PM
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
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a82714cc2f6c..ccd97bc6b757 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1168,7 +1168,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.53.0


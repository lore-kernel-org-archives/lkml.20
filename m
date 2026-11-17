Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899479;
	b=BERd1jb+JhCflLcSrq2beTbnbnU/GbPf+K1i0bnAJJ4RZgq1SudG90ss3me1ZvycRNus
	 upr9NLrgolW0uREe1l0n1xkrsX2hAiKCyASvIkcgbp4bYvHf59DWJ8ZyWLTJTcOSf+1Eg
	 GHiib1nCPjx/2KYi70BLyk4dw9FPPhDXoIS+J4KVo5qe/Q2o0Yra1g3rFEX+IxnbzLn9A
	 hNPQTqygIh1bVHOWnHwXQUMNs+L3jGywfme7H/mgOwQNs70K8FnbTsKG4y2Q+1Hp7zE64
	 RjdZIuay1ktvp4Gd3Hyz16cmjd3wQeclu32ZYo35yG0lAlU1wc/TE+w3Fam/5Y/h0cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899479;
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
	bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
	b=0Sqg07TC3Ftm07HqqocBdifMgX+5vMBWIMV7J4cRKvZSTnDZ1T2EeO6Kjc7mkvj/hGTs
	 HCm279EONaAeF2BAjh85zxUcn3bfOitA/IOeCWc4qKDzi3hpZ+B0cfWbkNVcb8S2dUbpQ
	 fONMCd0lKy45lwuwAzU+JEXM1t6biEXr0T/MduJLap4pfqHv8t7VJYYl31YRq31BHdY7r
	 yuVeqVRAuJOIrKCfymGna5Dgs22lGwokROfilwIbzfsWexom1TiZ/mQ40cYcgIfgF9hay
	 6HfYCiqlwokLD/YO2Z5Jo0QXeyVY2H25Nl6obZf7nEZ6BI0Y+0uD0PFdnvPxLU+lT7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kJhQ+Sa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.29
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA1606A329;
	Tue, 17 Nov 2026 07:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kJhQ+Sa0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3aklUYW4oZZMJ7A1sibsixLVUOx40/dgSLuuYPTiaOAWnVKc/2SeYd621jGOSWaZtSrklisTqNXPTpEq7zV/upQCKPf79F0KvWWVbwFFA/6E/Y10x8F5iqtPPbv54bWC5sgRFDCOJNXR41c/ZEkDxyb/o1/TI9AnHZR/vdy4saZhiGuz+2lZr8zEJP+pDJFnzIoQeGp00FRKa+CkGRUUaTOq2Ta8mpS2+B8pe2SlI5kClFkCmbxk8IHn4OjgrVBHdmmamvAMLYJHj3jXsoT2an+Aez4fwtxOPPb9eWpLEopxuPK64RP9UKUDQzVizfq1A0fsHiubm3/HIY1w/oaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=SLuv/wvAvPYCocPGEMCBBTytC6QQd+WFtsek6eZEzewrSpiyTIwf+yCjdtnUNeezgHGjb+lTjci/HisKoXM698YNKPQWh8iYT69ao4x8ozM8R1+vJK2LBRossRfi9YbNkdwAisTJFtnjN7AeCnRKbEI3vbcjUe/RQzwQMyHeTQ621YvIFHH/yRNyOWJOX2qMSvsY8RVNsX5i0BGRKHw3tIa6KdrWb9VVGq/qcGXWM1d2csWpizpXwOcOn6zUHB1w86Q3hoICATkzDgPthWJct8468IIm3QPx4lHFHMLsNsLPCw/QcdyJ44vqYzNNm0aOn2DNXYiWVjOQGGXpxTNKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=kJhQ+Sa0K0Vx8KnQZgK+Wwzn6uSmGsiPnKtj+A08yfarqehBT1qVZMbKaK3G1ZSR2GslVP0bz2lCxxl8BATnZlp20LifQczIrUelgcdck3N2U0ZkNCaw1Qs8aq/vM2ULUIzEUQ/okHOv6fgAhluoqJjcwaG0agZklLzwNc27ZvQ=
Received: from CH0PR03CA0227.namprd03.prod.outlook.com (2603:10b6:610:e7::22)
 by DS7PR12MB6143.namprd12.prod.outlook.com (2603:10b6:8:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:14 +0000
Received: from CH3PEPF0002457E.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::1c) by CH0PR03CA0227.outlook.office365.com
 (2603:10b6:610:e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:11:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457E.mail.protection.outlook.com (10.167.252.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 12/23] soundwire: amd: fix work drain ordering in remove path
Date: Tue, 17 Nov 2026 12:35:47 +0530
Message-ID: <20261117070906.803139-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457E:EE_|DS7PR12MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 6172bcb9-a513-4e96-b8ac-08df4479f7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	/tBbQbFwuU16sj5TZ8PqSf/NDz6W1qq+TWLocALhhmRh5ofaSgiiG0Z8pEhUqPX2c91o5CADlbOBi/DVK/xyU/mJUND5q8fUAXUyG3J+ruUP/dmkv+qmWGAlo4MXOOYZg45CmstkAoozcF453qU42KgAqrq71SLQnY57TpaGioqs+/3zL9hGX8s0inNL4dPZXCPQ/XEt0OBAEzYmUK0zsEK8xf/OWFU7vnDMWa+9ev/Bb2NkSyGuM1+1xenpIhnyr7s0mlzmj0DHpqEIqw02iNdX0nW9GcL7xLRdIUtLH5M3ZeOQ3LHnBjjzpyEkc8AI8bjQgqwlHsdjAtQmFIX1czQ2SNo87atkHGUzvEdHSGaLJJOuC9DK6ncDKOZ9SDstxpuK3qJ6U57Hxv6xLDrOUjzCXAycJv5RqIZ4hwQfoYfGpFFaAy+r1iMkLlPooiTwcAXE3Gli4gauwDblTLGun7b9szU8FFZJcYN/zRcogvNvSJ02nhwfS01+odvDE8b+qxzCJqG6DU0DuCATDAsjDd+scRsIxwHTYBvF43yr5oxzJZvq0FudAls2gngc8GKe8ywb2g9Et55T7mJZob1N1KesJktHLiebXtwpH67n4O2INM9WjTvG+6NN7cH2UxDIgn5tUBYl4Wi12UHGEp3nbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mOibqnoKmx0zZollG51aXKTil7hxwGKo0M94oFIB44ZEbsDUS6BZ2/sovrhrDFCgTcDDgExJgTzGQy+BPO+5GMGkgFVh+W5Nu5/ji6JPwZNotLVOl2M1TdnMPvqFdwch+n7+HO54QdSvjkNumfB/KvrfMF+TvICgLIWDdU45WkCgZu4yijOEinnDOxg+BtDJ+kYb9FOCxn/YhWU0jMPuqg1X5FuovN9UmNOfxBajFwR0epfxVj5lb/CMSElaP7lR/YWgpClmp44dNEqGl6VTyIqxwlo95SxTtnU+9Olbbgqgb742uUud6mhM0sOmdM3EIAffgdVcOyU/1caSSMM6wYSk8WyjBvB2SUxdwugFzwN2ACJSiAfY3wWqKgPgZn3RTSRQqcCizry7qZq6TvLhPzstyE9rIsCEJe8QZdkvO2tb9yhUrYlvFbb4g5qZ9phR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:14.6708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6172bcb9-a513-4e96-b8ac-08df4479f7b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6143

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

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3a97c12b45e8..b1a0e12819de 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1266,8 +1266,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.53.0


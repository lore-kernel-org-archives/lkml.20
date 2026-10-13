Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E033BD224;
	Tue, 13 Oct 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881574; cv=fail; b=N9NGt41YVYx5wxro9eCV6xl2qIKASzkLHWaMHo9Z3pp/wsEgRq8kiaOArFM536y8jD0QFbWnxjcEcn9HPmEWxI0foHIKURO9ZnKEDzBEoPZfTvSQNegDQl5Xm5cggjX9EakTpXeBVPtzIUb7BampSwYaQ85ZDqBEWZlb66vX31k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881574; c=relaxed/simple;
	bh=zlt1R3ASW9e0ivn/YuXVcXRozhRv8dj4deGzgxyhkR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jk3cbrKlNXN3sKN+2prbK1/DThHSyQl1Z75J1ra7dR1uFmv8yUqCtqMVrLzj8yO6vZN7EqnKUBmoatb61xaNDVHvD7RigM8WJ7N3possstxmkbFrjGdXkvI1Sxs7oyUQ3efKRxQU/KhZrUYeO9V2gxWKEHePeG4htNUuAsILCEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nmi89Rdz; arc=fail smtp.client-ip=40.93.196.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nmi89Rdz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCyPLRwzH+0qty1gjJk7rbNnPl6Ua9rLcoR67bMLhjk6GJvDrtS05dmR3eBcfMtSvqmTN6/oF+Mt9M6eV9VZvKOjnn/x9+3XZV891Xi/ILghcgZPmO1N6u+4Qy7E+bJeCi7UKoq9+qXdhLBffgM1h2BLpC8BTKrQtE4q2GRJROd0WVFq5XvFOF9R+vT9eaaPVurXfJ13o3DZoGAFsM0iRCqnGz0KQZZNSuLJ8PazgmwdlC1XE6nTYhm4C2vfnHUgLBfV5kvtHq+V6FQ2SeGn52au6QHPP00rsjHCYiOzGa0s57EQEonTeFnaXn0RwvPZySxATKYD6iw5YydEg799+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yywtXYZUpjx+/8rXF+idXCaMrjJEfWIyLLo/h84So2U=;
 b=Jb/9QDdfEMdfdzFnjgfsvMp2Itdrx6L77+B14e44kc/2VZmGIlB9DPNKOTfTweIPvAYfUe7uvr11jG01dNHL9MdTy1Thwr36OhT2bW1DRPmnohjvI/w6IIf1wK36aarz7RehDh1DBhx3ZsYxE1NLbSPaPy+RO9iwvyenE4HDwvFN9+IOhC2JWSGbLwkILeNhX31hk9JNFSQyknx8SiZ545dgVmdZrFP+ixoFXHttiZw5eP7a4TjKiE3UhaOeLZz6KhoOCr449zQc7pR1CbIiX5niXcfly3hGhEbwFA8Jt2D1r9nrElEin8OfW0Sb6bHGCW8m8GFMd8AXqeMQztUgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yywtXYZUpjx+/8rXF+idXCaMrjJEfWIyLLo/h84So2U=;
 b=Nmi89Rdzwb9NxAsIwfrDD8Lz7W+y0NePLzmSp4Sr11wgY4HqT4ySzGrWAY2ZY9lvp5KcWe7B9NFWwuP3CU1Csl5HhVji8W7Yl0Xtwqb7s/pSXF0AtPyW4tZoOZDM0j78Cq/AfPPUU/MqlRyG6sijhmq+iVh36ticUY+5z4e5sFg=
Received: from BN9PR03CA0351.namprd03.prod.outlook.com (2603:10b6:408:f6::26)
 by SA6PR12MB999201.namprd12.prod.outlook.com (2603:10b6:806:450::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:52:50 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::8f) by BN9PR03CA0351.outlook.office365.com
 (2603:10b6:408:f6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 08:52:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:43 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 10/10] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Tue, 13 Oct 2026 14:19:31 +0530
Message-ID: <20261013085111.2009061-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|SA6PR12MB999201:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f94af6-2a2d-49f5-16bb-08df29075c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|11063799006|18002099003|56012099006|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6297dGkFCGfdIPuDmfGbg6vDVJ9PFXqlbIWQ0qAyt4ofT9CziGQ0VuZlbTLVuXVKgcjUfWVqA/w5BkOz1MMxQBu+Ecth+LoHaOtxXlw3cZiA5qA4avLGqFDeeqMj84hHrE1p9YRvRl9+V/mHBg0IWkD/MRr1XVDeDS+MMVwdJsgISJvLLHkugfHaimo8o3gbEkrOajBg0tdnqUSezBOCdhpfBeGbGm2h+ImfpCMzegrm1LOOUXz4J3IsmlBOox2+kk3PH09K6nOvRJPpePTCIJL3tLYJyPVRbsVNq1OOxUbG09QX5gQXod52qimupVt0/Py311dV9tVokLdb+ru0Epp8uZnWRBv+voCMC5DXo5h2cB87UtaOZBDQkDajNM1F1TJ48djDivX9b60hZQdB0yPpmBP0b37Bp4Q/Qfoq+1TERFheqdYuv78vIV4MVYmB+ko/SIr0MzDA+9zbHa4FSUCxuOP4a9cfvjZXHEmTXcerDFnZn8qXUiMlxlfuGzRZiLQ1EluXNvwGsZvFA8S8RQo0em5HPVZFpXyrnjlTUkYQqhjXO2vr0jqMSvNXeurIiE8frbRInhVDUPvSFA7JQz9ahPsf6qiODqJUniTccxgxyRQR/hVw9GKqohjc95rZC5IK6mlOYLj0g+BIVkooTuAw3fEICL6TG8heDU4v729l3XbTBKvUsqAkhIBQc2ATUzeHoeSluVReu4mVgac/wA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j5Y5Q7ibodMIjE0MB6vjjeSHDw7fVmDSrDKypucyDlCgurcUyr+OgAfhrsylCXmD1U4rS76B5FJF1bq7BapmopqAyFpcJ6QU4MZADrVmK0QwG/luXtVyMz7t/7g9T3N8k8vviZUuFMosbfDQOB9rv+BfoiLulkxgNuY0ry2YyPYGYCj5czJdhU/Wf1xGko7i++si0AEGEVLGrOS9vf8L6z1FNl8ikz6BJwc9VpymoeHcbJyXzkO5ln9mkczkMRBwznL/dvy9S/9csQcq+CV4ByOG+oKjGKRzx00QXi+pa0Tq69BExsRn6JVBNCZ4A87ucVO4QQavVj80lKdajqLDH/96yDKqSCUwxZfYgsd+EGTCN2UuOiqccFWL86q4aI7QXyaElRk4UuG1VXgFiz5rn5Tsp/81qjcNyEMrqR7oIBTixYiJRZFQ1QUQrY2JoUrz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:50.0258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f94af6-2a2d-49f5-16bb-08df29075c58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999201

When the wake bit and a device-state change arrive at the same time,
the IRQ thread returned early after handling wake, silently discarding
STATUS_0TO7. If the manager is already at D0, pm_request_resume() is
a no-op so the dropped ATTACHED event is never recovered and jack
detection stops working.

Remove the early return on wake: call amd_sdw_process_wake_event(),
strip the wake bit from the local STATUS_8TO11 copy, and continue to
the normal slave-status processing path. Remove the STATUS_8TO11 clear
from amd_sdw_process_wake_event() so the single tail clear in
amd_sdw_irq_thread() is the only write to the register per invocation,
eliminating the double-clear race where a new event arriving between
two successive clears would be wiped before being read.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 1a252a81269a..beb982b17fa9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1006,7 +1006,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
 
 static void amd_sdw_irq_thread(struct work_struct *work)
@@ -1023,8 +1022,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
-	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-		return amd_sdw_process_wake_event(amd_manager);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_sdw_process_wake_event(amd_manager);
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
 		amd_sdw_read_and_process_ping_status(amd_manager);
-- 
2.48.1


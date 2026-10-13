Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EC21ABBB;
	Tue, 13 Oct 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881552; cv=fail; b=AUYBVmgRC3YxyZIdGe2hKyiZT838VYJSQ4Ggmu+xos//P2YXeI1jfR/wyZEm5VzgwtRqxUYN+5GatlXbOuOfmyP8PL7e0+4wlNISS81ySdONGiGS9dKdKdBdJPT+lU0d0ZQN5w4UPFVnh2CljE7a9cVLgkr3A2/SfDXgHRhqR64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881552; c=relaxed/simple;
	bh=QbeBVgrWaqvBBmDDztDGnqGdas1WWcpHvTmCiMUdw4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKqczUIoM5YkFyo4CklwwEOIq5ZBZT1NXqRBPE0OapkHDOlASWlAP0oU3FyTDZjEEKo5d21gRJ2y0eGvQ+Tky5mSwYvKlBIoYeMk4ZjCe1UWdewTs9VhB/DNXOcdwM+pnOVEG3I3nlqidyTvw2lSlCaIBZ/1E5DVgFuGBqcPM5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qRu4l7H+; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qRu4l7H+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1qQUD46oFgvsnOyhbK3RVrtAYc93CgHU1ahE2Ex+i1a2ABOCTimiFbVYiYwD/Sklx0eAuEsDSmOKfYUS9Tq8zl11odXPH7pQYsfJvUzWQ+Jz2X2SZuzBJv78vy8eXSmFSHYxg0zw9q5LQJBRA7PaGPtN0J9Uqh8A1EeKGuFpDQMrn7DFppoGd4T/bXLRndLQxQ4P1pVU9gtqp/h/Jqt3jE9eZmYqS/R4ZOmbvjrHXL9x7+HrWEtjr2xVzKaC1BGcvIjEsifwvQQVhaU1cJ6jAlO8Ye25BEBSmEQxQsb2kZh+D2n0MVlp92V6cDqq/hZjJZb71oaR1Td3my+1D+7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SokXp4As+pEwZQZSxe6/tvtqBxAhLJ1E+tsat3U6m1E=;
 b=RSPKi2j6uGrBnUQ08+76f3aX/u5B3f5v8Fcwe59aNimA2nAx7eCiT1lYR4Qs4r6O7njxps2yULZFvn0a1gPmpEs/9txd7pUnplQZ+muI7r1nu0UaPnKjHmx2JAW/PIxfEnacCIoKBecCPVGCYM03UOxD2y9lJ7ZgGYifYTSnzFThNRLxYv+BDHYn/VwUTl9nR7/8CwkwSagmztwJ8ifXdUDegCpyAo+k4OMz8iXJvZsrusmKIPEYZoU/Px4+Qvs3eeg5DuT3Jns9iZAng2flaipaoCEwi3q1OEmYPj0BOSVnkfs6AHh2//608JSo0pyeWcR2HLgRmVIcfoI02L2ozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SokXp4As+pEwZQZSxe6/tvtqBxAhLJ1E+tsat3U6m1E=;
 b=qRu4l7H+ga9E1HtibcMPjgm4m8xnZ8q64iwMw5SwmkrDxyhiicXzbZeXSVM96qm+g4AEBGgiVDQfbzw/b+Rh+F6+T4vEnJz2o1M6FcALY0tdjTukDC5cpOqdVu+imrMPxhFDX0OC2rQB93haPZZCVmPcEFd5cULwE692nIMsreE=
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by CH3PR12MB9396.namprd12.prod.outlook.com (2603:10b6:610:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:52:26 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::98) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 08:52:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:19 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 04/10] soundwire: amd: pm_runtime guard in remove path
Date: Tue, 13 Oct 2026 14:19:25 +0530
Message-ID: <20261013085111.2009061-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR12MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: bf919766-6be2-45af-69bd-08df29074e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	w9g5cT7aLqzBkBxvhZ46abY/Hpu4zt8bQIUbfwWlK7Eqc8Q3O1DEfIQN8h/UXILZd5PPH8D90AqYgi+oaC8TcYqpcVmp+que6TycQrihSAS2weYT7qJ665c6hoQkPq5pLOGlgSr6Etk31R0riyMZJs2sH4guoETDjjv1f9RPsXXxRFQ6VlaNm6gAh70sjFIWNIiN2aJoAzk533Ifhsw2xP2yvDDKVKFj91zD4mEai4xBJlyNBjOnX+Aiy3KP5KvbKV9x3NMrQMQdSH05SfakZ7fDdGxWjlxZG/fF8K2KJOt1dxjEUxzigvzm0He6zl7ElvUUZ2n0k+JV/WpnC2eAkvUkcN3VyfyVKAE/AxKFbKdoHpy5+sXZ07O1rt+qujUdL/HibZznq2y1XnrTx9fQuAN4NkrPyRnAbQEYFFcaXLvz67CC/R6s4Hm2HnQWl7p9Zz5qiUrFaxYKRENLVw3+35tRyZMfthzLJ/T3++lOqvGsroGCQFLask6i9sBCsKO8+NWTVBcn6pHYXIGqnPX99is7Vhr/f5TRxOE783xgjAwq1bw+QCweCYXJ8pFHF9RyZc2ZK0m0gAJ0FAQuwiBUfVJVhGCuEpUEj108zIxK0KfS3IOzGpLyghpPEW+eU0RMusIic5bORUh2Dd/bxeRF94MbEnRxGrbAekksvdkvsVeKVWBT/C6lNvV1XeErigozv+I1t5FnWKtHV0JawxunxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	moaQ+aSP1QLY35dHSr2z2SWzhVdt5sdidZHhAjkCYTrcW9S9lzuvztyi1dsKZrxuZGUsEII8uTdo1AaBYJtwj+75vqq8CKLhdbYvoCwfQf2rylrE2DiEWXjn4hIobcaPpk7JHUZDWofadbKzlFoyWfyq6yXp3riENEiDrmZRwDurCG2nZW3ufeVy2Kf4PrQ4lTPHz+w/cswHNV0nYb34Cw6eaBGgUBxVx9yS1UkgMyuu1mwCKn5TiyV0DElfpMR1sFpfyMxd5wd5lBAbqtQ3AZCX++xzIlFTMQvb++mly7ChriBArvm8HgdUx7/QUkiKgcC0zBHlhyR+0DTKjnrydky9RHKz1TwS+Jy9zeI3jzR/VPHOMYrZ8RZycjz51Lk3AFUaMY0zQosMMA317KfxxbFnmKundJ+mcaX3y/GmeKCg9t5YV6wqMkh+iA1pgMGK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:26.2674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf919766-6be2-45af-69bd-08df29074e3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9396

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
index dfbe9a181983..bbe1e73ed255 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1172,7 +1172,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.48.1


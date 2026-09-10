Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F158F09F;
	Thu, 10 Sep 2026 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067060; cv=fail; b=n2PjZduLY8uv5sKiwLwDKlldC+YiCvY5mLpBWoq8xxatQJMUFsPjpL3GV3sqPdAJrT9tXsv5pjJ0NUrIQdlbtP6YfvTnnhITm9pCFeylFBYNDivAJaYMSNruDbXEX65GJa7eLp1nd3gOnpsX41ldokUUGolhnmnjM5kzhkPnv8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067060; c=relaxed/simple;
	bh=NWmfg8PkXWApSrD/HNGOAmbgIvhW5yLjpA1/mMVGrMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3WVTCuUgCzidQ23PaR0wW9hJ4XpikZO09rarG5V3bWb8+bdc1I4ZjPVQzhBeB8DkUap8AXDTwwAnZcZWPQmFbjR9SSRrBwSPcJKL/0hLGcjMAVl/j3dc7gOVqq8MVdK3KTAmm6uAR/Z0xxU+gd/FmBzaAAIojERdK+oSq4hyNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MsdhQ3mz; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MsdhQ3mz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjTTdzbJzQPzqmDStP0u+AYcRUcuKpJtEwvOQmdnVDU9kaHHYY1aYTqzMbu0T2PouVsNM/eS45jagP2zX3YiXUdAodM1f8owJLpHu4GMHJL0xZ9Eq8Z3kGk9kMvhTsC2J7Mb2TE/Vx87Tgxm03X6V0TWDYmmnt6XMImF5zcA6nluEsYWUzClwMsgYfBUquEQ9eK16WDOjZzCgkT+7cEWkEZjbQP52fYDZLnobn9TraGybp9D3SCm8tsi7I7TS1T0T2jEB13386BLRCi2MXl9JQqI/GQP6Bw1nnLFpXawR33L1mHW7gEkrbpymXZ+eiVUGWP39LGIQePrrYzNZpQAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/BB4mj2h1naswNQfVcvWfadcd+r4Z63Ld2vw1mUC84=;
 b=mnN2nU2KdXTDEW2LD6w2/phgp5/QCO2nKjfnAE8kjn2t8yduN8ZWo02nn82oLW4izKx9qwWfGtpA2nZsB5BfoBmZEwZN3ZRoM7+nhQToeskhzduk62EUXMZwdQCYMT83qy2aj6TbDcQ7L24mND91SX61IicAnJnvFSGaEW8EYHPkefGfs6QlXMaL3QhYCDSuaMFBB21yHydM84pcIgnIb2AE+lqWr8xn9wN+RBEGjJk6d0lcmz5fjLoR1hNHSRTrL3kV1uCvGUnOE42FcgbKn+V/G6JFvE29JtYY7MGBxsoC9sqRkPTao3Q+ARSUSAEzFqu24LgfI9kNFQVBDh+U7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/BB4mj2h1naswNQfVcvWfadcd+r4Z63Ld2vw1mUC84=;
 b=MsdhQ3mz5lLnMIw3T1gBvKWHM5l9Q7ukPfRMzANxTIc6KAGC+EI1oFelG1M9DShYRfTkYuqFb/aG3tM3WHYJs0j9onAEjcrlNSBl0CTBcTq4O3u/QU/0jsO+lgxT2ZuxA079h2YnS0LzCgiuCJuck7lIhkn4EB/syAg3tYwnKq8=
Received: from PH8PR22CA0010.namprd22.prod.outlook.com (2603:10b6:510:2d1::14)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:04:14 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:510:2d1:cafe::1) by PH8PR22CA0010.outlook.office365.com
 (2603:10b6:510:2d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 19:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:04:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:08 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:04:05 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 6/8] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Fri, 11 Sep 2026 00:30:54 +0530
Message-ID: <20260910190240.1604447-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c89353-561e-4f5b-9df8-08df0f6e4e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|6133799003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JGWw1SE3OVx6Jx+5mK/Zua+/7rb6uot6xCCdsm3MNmPtSEdbRagLbYN/EjjrJiNQ3RM5RokxH/mCX37Rb6pE3GZIhhI+YlHAKh6kzkAq44zqDUUjKKwMUKsSzCFDcgjULcjCgQYBSgAaNjcv/oWM8otTkcg2j/aKgqk+5lK6lcID3JI18VUXADTZJgj688ZiOH2X2chgnEIqFJpiFDcO3bQtpVNzgnLPYCREIEg5iqLTzcfjTlreknzDhdyW74PnakzLvOvA2sDl5LBXZiTgq17sJbYu7TjjqhmHN+wSdogQzEPdfTKvCTVWI8vFIDijrEeIAf9AIIJFQf1b1N3tgVw0d55Xdf/7ru7zc5dnX7NEeI/K8LVL9NQeXYCRxjYo1pn/jrHdWPvCpYF3y54GyDjyPXInW9aMlJw8BbLVEbNnIcIczc13dhTgTFEZm6DbKVZsmlYVNbPhP4Fdj+RBco9lm3W3KfeWDCJF7wzlWtaMO3rMLnTe0BrP8d4zmZZHL41EwIMD1N/DGX5zMpSU3YXnZ7dFvrx4egv42ZrB1+lquHPH2Q5Zt1Ge2DzLsmwRBfnaHl7pIrVS3nHo9TPNEcLSoc27OmvgpOu7351DvJW7reAR4GXqAadMP7mI5mKKL+71ijfPZtmUvIZyMPlDDYp6gcrq64s3u+ha6iE53Ff2B8rhiAsVm0se/ua5XJRXZ9nZvNuUpZ2iUuREsCbudQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ssQNNgJNwLFw1Etzb0edAfDl9/L4ccITVEe3ZB6qI+PnkvJ0Nmvv3q6EWVojB3UylcxerEGtzoyh7+lBB4oqaf+panB5bxzUFOzeW3INUr7QDM5nsH2uaKReWHHbaa8okdlF1oL+9kR8fULeNiM8haRMLuS3JLPH0TS2SSvK8AdIRwmZoDS72GXTMz2k8XWHfb8hqwPRWh8FELKT0yT11v1bOZzqcZ1mcPn8H/NyckhJTFpnLTmYdtNqAs8Hcn06+UHmYhWQEeel5RRbnAudleiH4G/6ROH5XwIi/kei82cymromTEpybUxSLyDLtf/XioslXToIw50WjCECQhvEtYkbPXsDiIYqJHLLElIppqqbVKS062Q9hBUWyJJRDuGViBcvsJ992xFEWsSAV9ir9GSRwu13Rwi8llfq1bHjecrtoFzxGG5bKTIVOkIf/PXZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:04:14.3170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c89353-561e-4f5b-9df8-08df0f6e4e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 2d2f628230ee..6af224ca54a3 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -146,12 +146,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 {
 	u32 frame_size;
@@ -1336,7 +1330,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
@@ -1380,7 +1375,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
-- 
2.48.1


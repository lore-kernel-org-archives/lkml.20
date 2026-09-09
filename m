Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A6542809;
	Wed,  9 Sep 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958586; cv=fail; b=Fos7xqx3VjqvK5UFLzHIu4naYogpj0IOqf1s80qMwg0QcAaU7Pn58u06Cmca0T/ZRk2bUFj1qxLMIWEuOJ/S3x9hl7UH4gAYr6a0cGt3EzuU/c/IALBqM39YDAOVrM5vEWzK9X3HcuxlvLV86gr7WKGNj/Iir0OFYQ8/wpGt9FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958586; c=relaxed/simple;
	bh=67vL8gRykQW44vM1B+Yyg0fjEi42nqxvFsmPpMh0Gr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaNUTGq4iluq0uTXutLklF7uN1Jv9H7XnoBGJaQgev8ABHnjkJONo5cP7+NSSWdyEUGkFTmgE0fCKnpok1F4cNVo2qu/1RJVaMQ7KBM4K2qKFLPxDpuOaz3pOr/LZ8K+U7VGFLaIjaffQzNs5EH2vm6EWBvejxZujXbXKNFlS5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GJHgXiwE; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GJHgXiwE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ27SS2xR/rMpwXD7R3FMlGr5JKJlztAPFFWwzrjw9fJT8gMzi8NySyPQb1y1Je3rcz3Umu4Ip10rYZaVm/7wE7NGcVWvfNmI2rwc8my6kdz/45+BSGU6zb/vUctMwkTS76G3LZbBNSBwPwBjtL/wQwhCN7IOggmcCGDLVTTOUeHKd8H8bFJtSLfBOFciZ2CfjxyBYtqUfO5KKoEMGtUDwdVxXqx6/9MQsjIXsigFkvSVCTYMGX7VnUyS63+llHg4/rJs43y0Ogq2J/JohtjzvtProqzEBxPbthneZjulD4SpuGsXSZfPR+6mOHaQJAuKe9rxoBCyxGpaXM60vJJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=EANVbQycA5ub0VQGTdPia6hFmPmM0JZd6xpOR0dgskDd47uXzePRqj36nqZ84oRW80VarjWeUtjR3gkNF1d1XQz0IQKacY1R/rk60sU7tYrNKBiB2RVV6DceSm4gBB4Hyd5XM/pDkH1BcnnoL7LEKnYLoQHqt0qUsjNV+1zQZ4jikHPywUTSp3Jd7MA/DTHfW7K1yfdn5o2Q3EHDtEBFJM3rr2bdCKvcqdEZDbUS8JfxNyRwyaNDlAKOLL1K2/+hmfs9OEq1kBxwreBjICSJueEK0750JAV4jG+LXYpdx3ZryOKVCYTycc7z8U2neOqWSaindfxtV8YyeW2rZjv5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=GJHgXiwE5mFRCZn9TZ5jh7rrP78g40lXO6WUK5lL+QRcMvqyc/gSfEMgKfjzLyCyCIhlA7yyKjGfZmGm3hdBfNp5sFeOXJpow1k3ySzG9D7CbaFfARoqCc2rrweN6KuO/GmedL2KfRaSxuzz9C39X6TanErqtoGwZ8pepj00ESQ=
Received: from PH8P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::12)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 12:56:19 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::76) by PH8P220CA0020.outlook.office365.com
 (2603:10b6:510:345::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 12:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 12:56:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 07:56:17 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 07:56:14 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>, "Syed
 Saba Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@intel.com>, "open list:SOUNDWIRE SUBSYSTEM"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] soundwire: intel_ace2x: free master runtime on BPT open error path
Date: Wed, 9 Sep 2026 18:25:53 +0530
Message-ID: <20260909125605.280973-2-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909125605.280973-1-syed.sabakareem@amd.com>
References: <20260909125605.280973-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc80daf-cd3a-44dd-13e7-08df0e71bded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Dfi70ak1RViRkIcscfKjP2UY0ulpgjqoV1aNw+6EDL+YLW7U1CRH9BNyBqyIxCh1vuSVSTr95srobVvg3QIFJp9cDTFHIMaWTNqQs/gpi1tffnj4l0TeGvNJqBYGYEx9eVRROa3sEMHZp+/cnMqSes6jeZQ+NR9lUw7TGkV5Gj+KU7N4ksxRvN/sELH4RHPdhgdP5fZHGyOIAHID2uXZvh0vMs9DH2OXHSdpw8uCKRHdN00HWRNIg5PLHCQmUW22W6BqjH7HOfxgMIN7OnVggH7aPivFsoEL57lBKg1j1HKAysPK/jrbLBCszhuQkNrVa+rmcYr4/1myzad2DnVpUwuRka97GDxHNmlQPLYLBNzmF0qX8C66GqyuajXrVfEguaRwZCaQR088J1mh0zCbF9k210frJTa+ZmLI2QUOyduVdg7zlxNL0GTRHLlAis0kjtzHuLgKilLWuj7qE0HtX5FbHQmVu25IVdpZZbmbu3V/C6O1lalEdEkLIzbt1/kWrQ9Xg8Zc0ev6oIliQC/CQHd+E3FVzMlwZcdIbWUBFsubzIpXpLRwPrAzxynN1Vb3pVMbNlb/opyYf7v3wU5ShpxncnwFxZOLmZJgXVN7nuclcei+5WtHXROt6rRiFoQ5zqHFMq1SektX7l7//P7utrF16fNjv5dLDnn7f5UAAI7I9H9Hj3EqUA53Vzob/rDrgey6KLvaUf0qLZPW9TAGMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t5+mIo0YOdyreTAnb9hLpbUFKtK2cZGFg416ZG9ntek/4+Uswk6EW+bbXYKaHCrtIxde7YVkwdR2FPZIroIKemLPvA7coZaFNkUw4yfTYQAoFoJGQAQscLx2sP32Jd6Sv6VXKzmuBNVl3BGCDqwLQ9z7gGCPf0yT3oJ165a7W7pdmdS1gG1DEcHQbsrd375BukRVfsPyKMZ4nGRWtOcfuzut2Ssk667DdV0k/4BzFnZeyQLokRfQUeGSQkZWn1lRYpghQKDITe/NrzCK5sGGbKlSlpJi+q0dq2XtYB+CqpRFHz0d/Vhimg73vVrwifiXcYBPPZdyj4cyMAeQl1i8TiR/LVWtS9nBXpfJ80eqqDT6D2yWcCGb5xgzl7ZVd4iAXryeUYcww9P6sYrfQH7LLAwcpefb6MsEEs/DZzz50wiNsXapHkWiV2ZxIiNQMLGl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:56:18.8279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc80daf-cd3a-44dd-13e7-08df0e71bded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

intel_ace2x_bpt_open_stream() calls sdw_slave_bpt_stream_add(), which
via sdw_stream_add_slave() -> sdw_master_rt_alloc() allocates the master
runtime, links it into bus->m_rt_list and raises bus->bpt_stream_refcount.
Several later failure paths (PDI allocation, port-config allocation and
sdw_stream_add_master()) jump to the remove_slave label, which only calls
sdw_stream_remove_slave() followed by sdw_release_stream().

sdw_stream_remove_slave() frees only the slave runtime and ports; it does
not reach sdw_master_rt_free(). The master runtime is therefore left on
bus->m_rt_list pointing at the just-freed stream, and bpt_stream_refcount
stays non-zero. Because sdw_master_rt_alloc() rejects a new BPT allocation
while bpt_stream_refcount > 0, every subsequent BPT transfer on that bus
is rejected with -EBUSY until the driver is reloaded.

Route these error paths through the remove_master label so that
sdw_stream_remove_master() frees the master runtime and drops the refcount
before the stream is released, mirroring the error-path unwind in
amd_sdw_bpt_open_stream().

Drop the now-unused remove_slave label; its sdw_stream_remove_slave() call
still runs by falling through from remove_master, and is a no-op once the
master runtime (and with it the slave runtimes) has been freed.

Fixes: 4c1ce9f37d8a ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 drivers/soundwire/intel_ace2x.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 642b33ab5526..96940779fdec 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -105,7 +105,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi0) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi0);
@@ -117,7 +117,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi1) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi1);
@@ -136,7 +136,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	pconfig = kzalloc_objs(*pconfig, 2);
 	if (!pconfig) {
 		ret =  -ENOMEM;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	for (i = 0; i < 2 /* num_pdi */; i++) {
@@ -149,7 +149,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 
 	if (ret < 0) {
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
@@ -293,7 +293,6 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		dev_err(cdns->dev, "%s: remove master failed: %d\n",
 			__func__, ret1);
 
-remove_slave:
 	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
 	if (ret1 < 0)
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
-- 
2.43.0


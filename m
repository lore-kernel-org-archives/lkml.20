Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5680514746;
	Tue, 29 Sep 2026 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682676; cv=fail; b=RqgSdOHjiDAb8ZM8hirW3b2UZyjeoNRL/58zCha/JkgunTo91il0Dc7pbL+SBBBuAEIiSVQODx/W+HjsdO2Xypo6iEj86Q/RLg6Yb+QehIMpDter7m9Zt+JGq4oc6/pXodas3Iv59tgY1YcXBUmEEDzADPiC8jtfu+bpZOtr5kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682676; c=relaxed/simple;
	bh=67vL8gRykQW44vM1B+Yyg0fjEi42nqxvFsmPpMh0Gr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjvHz7vjpiMMwjcOX6FsAzk5/aXX8bHkYE/VNMYmVfewX5RGu8mFd7HBdJIRBSXG4m7Oz9x2CXQ29SjDtNrfXZQqbZHQVKjUnTxd8iPXjp2MXchl+TgLA3CULtHxCeHeDPA+TNlBu5Ahhu/GkL60QIB0G+VzMuKvCwDTbSfCyvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YbirFRqm; arc=fail smtp.client-ip=40.93.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YbirFRqm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX7pwuq7Eo2bmsLc/TJh7f2w6PnLT8mIN2QpJ7VQ4hRgsfAJs1sI/14gh3oPNl44djQJumZMPh6awjbnSLIzZ8QIcNFdo1+uK37y+Cj53Ik6F5G61QQYtwk0pbMiikmkmg083ERDTMMjcjBu8HiMr82nses4rWanqoQqmZCQ4X1ljvSiBOA7om4EXVqzAaRE6qep/1m4zPXORTReOqmYZfjnYLUw+q3af0+hXgQ8b1LeQJOpj5taWWmVNb1f+sNyIEqHvS9uDX8AXx+gFbHDZ/pCiD0u0suDlbSarRTER+KgVkjREP8dv0aK+uLAlq6/CtFvg91YCv13SKKiORTW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=JUv+FXB9keaHjI/Mejp0Yw2Id8DhqKDWJOiAXCiilh6CM3zc2nW2vxE0/AMMR05UfCQJU8WX92cwM2+CIZi8DD9XM/lVTqRcyuCsNac8+WDu0M/DrOpSLZP4BoS6qCmuO4UNAIEYxdXWxgF3L5Mzm6N/YVMHJ/FVHW5mU2C+bRarQ0cmVbQx5tQS+E9nWZVzLJjEvVfQUM0O2W/+gHE9jGUnMJ5i2XdEMWKz0gWmtsI5KUKtNMBa2sOSj1PueDrb9CsNZg6qFKvSgunrnB5AOQpj/TAdS7Tq0YSmmaGor9y6tK6FsnIKiqKsJ7wLeJQaCEuW4lDokIiossRRwc7U3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=YbirFRqm9auUYpjfji6jJEWKYtoNIMKNr4d3fdtHrt1BdbFuP3SmOa4AJV1LpwvAQkMr2RacgDIP5+wCKu7xunP9NufURNErSlziWrTiyBD4qswEUYdw0WJt6+hnsoWsXCpveEOnT+wyDKLRVAjQZ61bc3HFFTW/mDit/N1xB7E=
Received: from SA1P222CA0175.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::21)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 11:51:07 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::5) by SA1P222CA0175.outlook.office365.com
 (2603:10b6:806:3c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 11:51:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 11:51:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 06:51:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 06:51:05 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 06:50:56 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@intel.com>, =?UTF-8?q?P=C3=A9ter=20Ujfalusi?=
	<peter.ujfalusi@linux.intel.com>, "open list:SOUNDWIRE SUBSYSTEM"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] soundwire: intel_ace2x: free master runtime on BPT open error path
Date: Tue, 29 Sep 2026 17:20:34 +0530
Message-ID: <20260929115052.247086-2-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929115052.247086-1-syed.sabakareem@amd.com>
References: <20260929115052.247086-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ae892e-c2fa-4918-cc44-08df1e1ff237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SSlFBNVYBy7wNPE51sY8DXQFGLqFvGICPSpzPBWcUpuWs0ojCzLUmQIGQOLESQ6XJqg4dqQKF7DL+yk7UywflgFKfKLR094d7i8YefKIVhvldfbnmnA3z0ustagD9Q/16ctGiRlQZzNHY/Xw/7TKLqFwL4u3t1vhstpJM2wP9MJjS7/vHyyO0XWItYJLJaywWguo3YQGKWOV4EOE5soF/xgcP12BaOIHKYw0HaKdgrmyDD6ZfhAql41mGnlTMiGXb5fA1Y+U9J/AECz7u1c16z2bU6z1ez6R0pO9/AzqGb0MO4OH+gtBy1VROIRomxgJBFS86/06exKbo+mk2izNfL8Wqp4Degxy7xpTFfrznL8ePQI5TvSHhSUSAa0K7xOAK4Q+6TNG6yE4cMHpCmTImPqaQEvIum4AaYenc0sqOuzRNHSM/lM57o3kOtSaaF9MR7AhwH9K5NOrGFi0KwbeYRF5NuABFgsb89Wl8TxBK7QdOUHLetGfhQ53XCb1BQvc3pjPkXmFoI57SVDcTrloHZPJY1Rjb2jJTO54/sFMkSidd68eKBUbiSoM+miSxEUp63GaOredARvzsADLjZELuGqzkfoGApwrJYQRKvpukNV6GntsHV+8ZkfgOrNsvNvTH3aF4gHEEijOfNFjaJxUM4SI/ePNMYjj6KhsGgbjmyygOyrj35HfSPzVM2yXvK6wj23luIPdRLwDIFjlUPguOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KULMsHChtYep5S4hvYoWlSImWeZASwI1oB8K+nMPec1ZPPMEp9PPRNKdYSe50bJWuWiVwMY+tYWPBtzUAZSTmYCX0HVvTrZ14+6LjdGA20yC5F3inTPqYc2Vwd5L2iyzSenoUcBrHvtcIQ/bmPy3sB2asI4YzFojsPXKdsp7Wkr1cL4DcEdLccJ4wlwPshaM2F4vpFelBLmgUTU36vjkIE2Cx2kRmJsftykg+LFpEHRCNm1/JBJw6Tw3+tsAzRKo+lvtU2izH2+xR4+Sr88aUf0Qvx9Y9swjXKqrUxUa7AERxhYL3zuDl8HB6flq25i0jLvhZ058CJESvY+SfYZz/1TmZmPn7OF1CEofn+1TTBDj6aNN5MnkpaLAbaVJv7p/d60tL9no3zCDUchlbdX3AIs71gL7UEM0InDLN/Sofru3rE2GKupGDgX4hNgQ76eQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:51:06.5647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ae892e-c2fa-4918-cc44-08df1e1ff237
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747

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


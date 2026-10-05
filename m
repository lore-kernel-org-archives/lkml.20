Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91942E41D;
	Mon,  5 Oct 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191800; cv=fail; b=BPElf6sYMhZ9gw2zfPln/UM4g8s9+3s6guseLv+bJHF1ZMoOx/i8/haQuovQ5jpay8Pxtlbrgxn+QYY1DJshHfkSCNMXHcYInrVurt3Gux0GBaCE43AUY0IiWcUplPLDGul4jPS5sFrk0Ht07mV1YeOXJoJ2+YWojdXpQuIxZCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191800; c=relaxed/simple;
	bh=67vL8gRykQW44vM1B+Yyg0fjEi42nqxvFsmPpMh0Gr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiA2Lcl0aPOAIYvRLPbN0U4r0A8MmZnZUclmf8dmWWhlHPKnyN4IUoRh0ZP3OcDI2/TqR+OYkXGZ/TLGdmNf+HAzjN08MevFq+M/sMxZPWKrBjpEtREKEzlRvCMDcYYDCmiiPlDXzkB6TPzYmeeXFTlIHE4t1+gJlS6yTU6yJAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cp9T1uA0; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cp9T1uA0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wyqkezb+Bf+1FuK7RzsZlUiBU9Vu7Z7G9hx50Zza5s5rItPOvY4TzHsm/OTMkKJ3LO+YRaXtm6qBoeJZTLRR1Z/Z2WXBD59D1mVmuRKVsQTA97byIwjjaMX+XIF5AbSheOBzGxBHtYxdwPWqWuzqVC0otV1oNU9bsWyR8H5r6X2/RTC+RtDehsxKVCb18nQmDvrc4WZP2Hay7uZhnBkl4RHs8WYO97kgTRtXJRJ94+JHcrio62/PBQHRPoymFEXypc7+xCz4aSodDXyFIZIClpuvxeFC6wcrw2Nz6viA9AQn8HChSCvwHtY7c6v3uqY8DERPziUG8dd6YiXQb+MvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=Z9NW3U9gP2v8uTwUqsrU6BsZYxwhR8UWprUgwR/WWEnkxXCroMaHiWl4QOIwOVL7rkekTlmT5ofzWuw4FWitnXzWOHojEVQ1lCAbONCZDHKvnmUTxjNs3hfd16GW18AS8InwGM8S1+pznYfiHACCg4LzJpYeXplmxawsMWXWPl+J5QuDbhtIhwnjx/qYNGmBBwwsbVWhjumNIo44ApJFa8r+kfk17bbSWTfj9RhkPWbaygT3R8P9DU+Xe6JaZd0qp3Xj7jJDgAgii326L/ylAD8zJRkWLbo/03rGfhBvjf1kbymvWyD4KJouWn29Pc7c2kG1uObhcnmuaKgdbCYNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SmAFYJlMs7tRKCbxx0T5b0XKOA8FoySk1P9zOVXk/Y=;
 b=Cp9T1uA0NS2RWt7pT09im51BsbuS1UUrOAOzRaYU54Rb+/QSFYMPQyD6rEWKzEoxclVgqONpCAwszipXz2oBQK4XamE0M40IkVg5A9W4siwmyxLeHgmYd2iBnowVBTfVSaPaAhF1JvxIDb8FkOIqfP+kOQWzUGVycmVVz/KiB6c=
Received: from SJ0PR03CA0153.namprd03.prod.outlook.com (2603:10b6:a03:338::8)
 by SA3PR12MB297303.namprd12.prod.outlook.com (2603:10b6:806:590::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:16:35 +0000
Received: from MW1PEPF0001888D.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::38) by SJ0PR03CA0153.outlook.office365.com
 (2603:10b6:a03:338::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Mon, 5
 Oct 2026 09:16:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001888D.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 09:16:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 04:16:32 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 04:16:24 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<vijendar.mukunda@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <anson.tsao@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, "open list:SOUNDWIRE
 SUBSYSTEM" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] soundwire: intel_ace2x: free master runtime on BPT open error path
Date: Mon, 5 Oct 2026 14:45:44 +0530
Message-ID: <20261005091620.1390916-2-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005091620.1390916-1-syed.sabakareem@amd.com>
References: <20261005091620.1390916-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888D:EE_|SA3PR12MB297303:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4c50b9-fe3b-405b-c8a8-08df22c15a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	r2iAoWxfKPWAy0B07nTzg5ayw2Sh3Kj3MzbAUB31fyQLIlnD4WSGQbB59na/qRozwLYCfOeXbxDh7AhRcNu/pmqAVeM8fxPDB41K8wOnvJgzMH/yH++EBaeJQDgDPeX998pTeeM9gMg1/Bf1QtnZAofWL+D+buObha8ICiFsohdHLgGxCO1Djz8SsDG9Upx3xiyenS4niWZA+7HcBwDGS/IctbfoHxRNs/hNGnKsdaYMNLsrkHffHCXBXcDK/yUtgkf7NDFebry/2a7KA8RVe8G1nPHxwPrxKLVtqFY7L3UgIwdMJJuEuz6jiZ7GBy2D8Chl0QgK9GwoQfOebtmQRrLg/atYbsyNfisANHJwJiLcu9L//1JUe8K5XyhX4nCQh3xshS5QjRhVPQQ8oeTqJpSQ2wDL8PSwANSdEQpnT0cn+jAMdTZQ8Wst3HO4/8eKt0JbcD8dGwH0kB2U3MPzbZBLp10FEW+HSMK/55hqA37yVEeED3F8cySYS1Yoh63ZkdJjG/b4zrqmkm6JY7+TxMqA5kxjIsD6NCHh1hwlUyMpdrVHNBUn690vZs9HQ7zpxDuv4nbyojK7E0Teu4LE3HQPQueODinp3NEIrAXqv/smlWQu+sFoZtX7vxsjNfUsRwREF6EdGCDZFK0hw/Hqg/b43WFPa7ZnTyX56ZsiCPInpFNvTQvOl/klnViFg5Ud2G/KNsQAimIl83/+p3xGlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Msz+00tTlwnMyDB3y167Z0FXuybX8JIAl0eNP4Xm+jkBrI934P4ZHDGixP8XmFd6Gq/6y3oBZITkiMerXFaZshqqBtu1qSMfDGBHYvVgr7CVYyHZ6UkZOz/GxBAvoSahZiMTdBvUUMf6ysknrM9b4Kavf+0XIep9cCxVoycgeC6MaqqOEzSqw1wJUXwFxn+HJ8SZVvpWa3SEYNgPuBfB2lYl/qj5uzZ8wnmFoWzu3NjevSm6xN0Wgfysp5yxhav17c3LZECI0EQDllHUvWPh/mF36L+uQXfhpLPV96jj/SqLS8hcNKWL2PeWfoCASHzatbHsYkUG9UVYSoBvWnc0dX0zDkRZRVrZs2xOfot05ti/OXOB8X9+5mxeginidQIA3nsALmLKGPX3LunfhiqsuyBw/Nhj9QuWnHuCO5gVEHy6yInfSBA49zpEj9UO2UC9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:16:34.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4c50b9-fe3b-405b-c8a8-08df22c15a42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001888D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB297303

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


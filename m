Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7713BFE50;
	Tue, 13 Oct 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881574; cv=fail; b=pIaUus350wr3OTUaQSxCGFGX8yy22V6ufXcA7C7r4S9YxdcPPVH6Z44z14AZVllOI/UikQY6cj47qHfKFHKin+8ImglPFdMpyKIX5JH7JtSLxi+Lipf+L5EkMkZyFS7LPBI9s3PLz8QFSM63JJP3kXXrHB6Dpi5K8zjkW6dkaIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881574; c=relaxed/simple;
	bh=8L7gT1lEdGSoOfEDSJdo/baG9xD5jLVvo74uyvVUDxo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xcb8Oj+HGRjU5UDxULFNnyYrKVx/gOX5xai3yztKLkJYt77fYHp7875oYse0q6lRmxnd58EuPInHfkM49HCh4aQydRgKhvQ+7OSEXyiKHoPBmXAV1OCGGktBhV0gdHpNoyJiYA6qkQ83VWvnbfnDAW2bOh+col6EjqAwzJWZilo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aEqOM9ww; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aEqOM9ww"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmAxIsXwvHt/q6TQod6zic3Y/E3cR68km2ypAOocDUfRPwPn+YpZzT3ifGALDu8l+xCOJPMxThwJclDM+Tly0kreyo1rQ9ZqF0ngufKmniOGiybL7qPndQyttBCbSoPr7znmr2VlLf04hxTXsPlgMiZ0fW42nbvC7RdTzCJ8Va95/VT+7okeeP57TXOUgftFbxENrAnGqXHSPCqD0ox1yGGGuAIh+LzCF7jv8soGYmPYVDonRBC8fq+7hQCY6f6cKsY7rhUOz290XSYa9ujTfEECS690xGQRnBed9Yh04uz0uWq8GCzJS2cxczxYv30TVIPTEI1TvLo0oPKOuZk+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSmyffqLCbyReJQ+rBc5VPUykzYlhk+8fz+hvqCOZ40=;
 b=N/bzKeZkKVsmHc6sxKbqq0Wb3bYMBfZJenfafVfbZSApUd9OxHYJZgmNwZgCJ5ooNlXJMl5esmv8/ueEY1rrhpmXBEzh/QQ3WWLERu/UhMOX6WEZ5vcw7kqSx6jYa4x/3lG+YiHyeP0BwwgVFxpOVpenmGYDtlNeMrTLjuEPmiAw6h0EvULjCZ8no7lbPk2uw4PZNpPj6zb/EiIep58HdPoVnTREqox43ktnNP0Kxz5bZqiLkXQeKyzoOLcJTx7IosAJy7++IObaZzXcyqxiogCRVAU+qoB6bbFUBh/9A0KfbXOHME3MpxQ9SzGPABJZUt9E8TgMw2cBSzWtZD8lKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSmyffqLCbyReJQ+rBc5VPUykzYlhk+8fz+hvqCOZ40=;
 b=aEqOM9wwbnknZWerLEWb9Hd/dyq8b4cdmW3DTbg75NRGz+LYcJlbBKJSp/LnJ9An4Uz+Y2GVaf2vbsCNywCitWkSmaNlqrPSMIKUtPVn/PwToaOfGZfDwmU4L9CvBhu2ZbEsPVht5FdS+lPNljpjzxUD6Y+Hg4QadDL1UsJS6cI=
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by PH0PR12MB7886.namprd12.prod.outlook.com (2603:10b6:510:26e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 13 Oct
 2026 08:52:48 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::9c) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 08:52:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:35 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:32 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 08/10] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Tue, 13 Oct 2026 14:19:29 +0530
Message-ID: <20261013085111.2009061-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|PH0PR12MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8d5911-2489-41c1-dd36-08df29075b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	J2jVz4oFWa6R45PPOC7qiAJv+FPqCXLwOda17hZ40pmbiolkIIDyqOV1MONTxLOZUjhxNWp2jjjg2vl9DNyFxZnKy+h625jBi1vuBT4dgVSlZT0XM+VFshl3hZmqBFcmygNNAVNl/iecZ1QHKu0w7hdin9cZp/FZylkCXWtOBmF8FH9NS3yn1ooAd1O+4Pfne260wVIwQoN/wj5JDlA7lBkk2h/SXB3pjG6mh2qNUU/fK294Di2lJw2Sp5pFCsIf+aSfWnesQekWkp07ypli/vn4beEYZVj3KfH4nYVwMqJmszu/PLaDLsIwRjsgvyhFA3VVYu8hD4Gq94HOu5A9GlNC7U+hS5pg4aWdHEbrqFtZuWCkYQjNAiAwbV757K1Wbhb9pqH/Mbs5FUS8nBXNYUj5o60s3/mu+fxKxDBGb4V1T2UHE6EcJy4thM9MLU8ZjbH27XzlRD2aNYxYR++KcN3GqAAPX7UzGG6/NSYawXvYBjGYxPW0jGaQTXp9zCQziFaWsn2LPrZXyPEldyZd2uHUfxVhEfweigxSAUJlTpKhjlZ+tLnRp641OSUB9fhoIOHgC2SalcqQuGsGI/j92kiHkv3k4/K/NTYYu/HAKDAiIDcCv8JSRvCQIkbCKd84IwCnJxgQsWAAJJcTFFhDvcIN9kyjO2idVeG+D5nFFvCOwmR9kHLpp4eRfvRzTvKpxwPrITnhPZMFPKUk6v4gSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PS8HulXKEzEL+qlzROQ0xWKjcxogTFxDhn3FAC65l8kj/4jhc/cNXpuPJOhBtCXGang0Kr/xJE53uZHldFyacTAVTFFXovXYEeKhHxCd8hFX8T7QXxPxjQdsVRMv86aaWcdvMOGQMvhNgOYV6uay8297ZyQHZD6MAJvB8RgHkJ+FYuGapoRG9TU+opldu3ShtanoTiG5qr/wy5A7X6BMQPN3DL432m4b6yG/PIZnRlSznTH104z582tSO2NzZgcq3MTHEalj4sU5MVUwxZ2QL3GBkdW8AKhDq1DAio56+ihGwfSPR6UmSNp3CtNqJnGR06+5o/7ivfJc7KeHd+xF3L8OpQFWc1edQjmzPEkGXquqOVlpKjq5q4t0sSb3FXgX3/V8NfIsJ+ubYsOkhPQTqYiMCNNE/7KvavnBc2DAJCooBYplqWMr3SPVhOpoQ1/G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:48.4446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8d5911-2489-41c1-dd36-08df29075b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7886

Replace open-ended acp_rev >= ACP70_PCI_REV_ID comparisons in
amd_suspend(), amd_suspend_runtime(), and amd_resume_runtime() with
explicit per-revision handling enumerating ACP63, ACP70, ACP71, and
ACP72, so that every supported revision is handled explicitly.

The host wake enable step is guarded by acp_rev at six PM call sites.
Factor that repeated block into amd_sdw_host_wake_enable_by_rev() to
avoid duplicating the switch/case at every site. The remaining device
state transitions keep an inline switch/case as one of them carries
additional PME handling.

An unrecognised revision cannot reach these PM callbacks because
amd_sdw_manager_probe() already validates acp_rev with the same switch
and fails registration for anything unknown. The switch default therefore
emits dev_err() and returns -EINVAL to make the unexpected case visible
while keeping the error path consistent across all PM operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 97 ++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 6af224ca54a3..0cb5f4694e9a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1292,6 +1292,22 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
 	return 0;
 }
 
+static int amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return amd_sdw_host_wake_enable(amd_manager, enable);
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1307,22 +1323,18 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1335,10 +1347,19 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1357,21 +1378,17 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1380,7 +1397,12 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
@@ -1392,6 +1414,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
 			}
 		}
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1413,11 +1439,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		/*
@@ -1431,11 +1455,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		mutex_lock(&amd_manager->bus.msg_lock);
 		amd_manager->ping_slave_stat = U32_MAX;
 		mutex_unlock(&amd_manager->bus.msg_lock);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
@@ -1461,10 +1483,19 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
-- 
2.48.1


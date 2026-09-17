Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E53033D8;
	Thu, 17 Sep 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635936; cv=fail; b=MhuWEWFzJ5bflSKEwkQLoDqyie0dy1QpNx5cso7sCa4Gx8fbfSkYVWX/fl0pOnX8Uu9RARkROb2pZL19IWz0xiH2nIyO1LlL+yXaUTg2dE/nUAmn7JaaxW/ZysBpJIwUtQi8lNaNVvsV3rj1Qg/QqPKuYcJAA1kXNvCQM7m8n1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635936; c=relaxed/simple;
	bh=jVGEJq3DlDXb89LcuCRpcVk7H7IdPFZkUOMjumnx5ug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pviJEp+5a+P7gDHhnymePxo5Wo4rgdwCIoy/X/oJy8XWWA078Bq/ESAuV1/exoH1st946lBu7MjmbVrKtk8f/hNFUvg+TjpAEGYot9e/p6AuMzTlZa4nuclHu3dwNG1pit+e73xcaUMjPVmoAvWsiRiEhtN/jKIuWPp7S+qUAjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uz1xgc8y; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uz1xgc8y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcDX0QZZLbJnzqgt6X0l8kZ/25Njx4SGuIuR4k4tGhJcWPC/V4fD+cOk2iUxmbfaKKVx/xFW8ot5la2DXctHm9rUmZ9LP+aoOLUApe9glTGJvz721rEa782RYaFQCZKw+4CFUkCRCguak2IOurftK3DrWy13MNQ5Wdainqa3A2DykBovfwKiINirx/iaY3BZ+XYKFdsTiIA1T1rBOKRu05klM+hRBZ2iznsV0x0e9GcQhfxuwk1MLqYX4KeZsfDTQiPHbl/sRWkaywYRl/yII8h7LZrs0H2FD2Fkfknzmgq4ff94x+uhQ6wM8rmwK9dtjk1fzDp/yOazgeisz3jPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwCXNYXZEY2qKnkrMO+fVMTp1IyCtYaTLliuV5Ft//c=;
 b=pRtU7NlxL6HyU6U3NguQQdPhNq51lk/w3IP0HhflkBhnY2Pu3CVI+S5dtv8GyMM1AgWi9dgge8MYqonTtcCxoX9NoVPhDZNWxzue2niAvCgJg2drO2DDjoJlv0f8FjFIrHwKssTIeAb1X5yFxxKXG3W1Sq6a0d0QAj6Z8MJlRqKKurfswwJmk4pghOU9tfufleGJ6P5LLO3QVe6mAaebG/GY+Bb3ali7tU63E0LhLLPDfYp1rA1K8jKaQAvg0GlRHaBC3T8nWNd9sf0b0K52AJ0UCaHkPTQz64WnsKsTADJTja92rxSWoPwz4H23IRp8+oXGUm1teriuiaMmnpSM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCXNYXZEY2qKnkrMO+fVMTp1IyCtYaTLliuV5Ft//c=;
 b=uz1xgc8yXKmA5JJrbj66nyGXPoRawVrI2/0Kp1a/4J5gZhK1jXSXJV5FWp4HZ7q9sctwi+bhQzP6zsadRdmRl9koseUN+5NhEJFE5O2ZK3Mhmeu9ZiWmZpBK9atHbSzAiGhLIqIinEumND9llQToysghw428XmCfCf26YWrvIsM=
Received: from BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::14)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 09:05:30 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::6c) by BY1P220CA0045.outlook.office365.com
 (2603:10b6:a03:59e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Thu,
 17 Sep 2026 09:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:05:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:05:26 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Thu, 17 Sep 2026 04:05:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/9] soundwire: amd: allocate pdevinfo and sdw_pdata by ACP revision in probe
Date: Thu, 17 Sep 2026 14:32:50 +0530
Message-ID: <20260917090407.3828816-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
References: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e39db9-ea11-4955-10df-08df149ad2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zncivqMhJ4PQwcMUv9AxqPl23oMrTniaOhOtsy5pg7Ysd9zZ4FA1h0T4V5J5wt0d35uj4PaSBNs+wG66PJuFJYoUzAa8KvfHQGjWMjyXOlnPo3W4L4n8M4/XJEvJzd+90rhdHsabe3yCA/7A0t3hgYowM30lNzQEoy/p7guEC+iZWEHmeUsS7gDD2ZiTJkFu8hqwNaIq76BjxgkwXKUOdQbm+CuV9rXsS2uZUff0jKL0jObWorBSTHTekLpfI2o5LRCc9woIK3hhnIITgUcQ3wfO061+2+NtNCZQGau/ZeESQ3ye/S6VGd4TGFmnP5h8ahB5f6GQgfilXwFTUsrN014LdA9XscJuNUWDxkh0Z1/ZbABB6lMjUQ0KuzJFCDMkbdlo1PNKhNi4zkRrhs3vtuStH3+EOpA6dz3uH5Bavf/kEGROcy66QeQR0U5G1Bon6cRx6ykxxZ/TG41D7JNgJB9929h6lk2I5Ey5udK6iPw1zvBoTVdKhOhhNkraOJMj1cALwwvhRUQuSLMA3afJnMj7TYEPHJJG1tR+ReMrhIFbHuJtg5xtF7ViBNexouJ94phb8DHDMsthboRVNAYbFWEa8IimpreYQ1SzSFIGtFbyS4bool7byCwASojhUtVXdhvl/Iypb2t1QlzdxsfJhw9FyKzAqDCwRcIWETiYjMb2NU/GrHCuooKC0h97MWuUxHBmpIJHv9fJ5iBOpSDf2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ULlZgPizrS6/vghbrc7ApbEcupqcyaIEy2pe7NyftQrLbP4jk0XsYHmoIdoRW+52dRoLoS9pPendKNYkzcBejVuI3T18pvPFUXv/esS8uyi+SYaStQNZ64UVmTT1nqZOf9Kh1PlMt0m+BiRtcMcYMiY/UwN+p5WUWQx0Ds2nL/4KT2/4XyfHUPwpExlL1IE89ESRiOMQtBdoUNZOJ7d7Ba2/Q1/E8v9H7d8t5EGD+bHfw5kzmrQnD+0YFGjTlsGk9FIxMfurr1KyArRQ71PpKeuGQF1TVydmObwUy2htH0uEXBIRoubFYwbyfbBGHjGw4McV5emuAfJYXrZZJvnwcMYZt8Q4evPJxsHsV1Zy/5a1xSzvtTZexRge/CmWi65WoLqbcq9NAvJi+oareSILMnDfuAy8g5UQfGJYsC6zW11ycoWpg+q4BBJGRTXRDvkl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:05:30.6205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e39db9-ea11-4955-10df-08df149ad2fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

Determine the SoundWire manager count from the ACP revision and allocate
the pdevinfo and sdw_pdata arrays dynamically instead of using fixed-size
stack arrays.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 37 ++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 88004d59322e..15d117172bdb 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -68,12 +68,12 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 
 static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 {
+	struct platform_device_info *pdevinfo;
+	struct acp_sdw_pdata *sdw_pdata;
 	struct sdw_amd_ctx *ctx;
 	struct acpi_device *adev;
-	struct acp_sdw_pdata sdw_pdata[2];
-	struct platform_device_info pdevinfo[2];
 	u32 link_mask;
-	int count, index;
+	int count, index, max_manager_count;
 	int ret;
 
 	if (!res)
@@ -88,6 +88,18 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
+	switch (res->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		max_manager_count = AMD_ACP63_SDW_MAX_MANAGER_COUNT;
+		break;
+	default:
+		dev_err(&adev->dev, "unsupported ACP revision: 0x%x\n", res->acp_rev);
+		return NULL;
+	}
+
 	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->parent);
 	if (ret)
 		return NULL;
@@ -112,7 +124,20 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	sdw_res->flags = IORESOURCE_MEM;
 	sdw_res->start = res->addr;
 	sdw_res->end = res->addr + res->reg_range;
-	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
+	if (!sdw_pdata) {
+		kfree(ctx);
+		return NULL;
+	}
+
+	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
+	if (!pdevinfo) {
+		kfree(sdw_pdata);
+		kfree(ctx);
+		return NULL;
+	}
+
 	link_mask = ctx->link_mask;
 	for (index = 0; index < count; index++) {
 		if (!(link_mask & BIT(index)))
@@ -133,6 +158,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		if (IS_ERR(ctx->pdev[index]))
 			goto err;
 	}
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	return ctx;
 err:
 	while (index--) {
@@ -142,6 +169,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		platform_device_unregister(ctx->pdev[index]);
 	}
 
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	kfree(ctx);
 	return NULL;
 }
-- 
2.48.1


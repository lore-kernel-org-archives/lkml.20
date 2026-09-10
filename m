Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012051.outbound.protection.outlook.com [40.107.200.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF633911C9;
	Thu, 10 Sep 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046710; cv=fail; b=j8hQj0L+dzVygWODUyyCTtlqkCXN9mfIBRim24C3vWRtq3+de4Dm/dEVVZ2NUlUeIoasyl8NhESb/wbbrzjfgbSZDRp/X1gqhU2UwW3rA4zuxVFDMDwYvLNpeapPW0kZjRmvLDrxnObeYmFS9uvixi9BP6UpRapdo/B/oJblkA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046710; c=relaxed/simple;
	bh=HHLv01q1l7VfuH575E5wv/htSR7+4eFlDZEeChopIBg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Za6ds0DjLLM56kkV62Ghm+06o3vDpHcWdmWyp6hVGxyqhEPDoSE9llDNpcEHpFdLngVgZo+cPf1JZz9l68ghcMiw27WHcw2vviRZyfY0EHEhC0dYT4SiiwRu4tgf33P5v/W3oAwHkLXBXw2bLdpReuzuQX9jJjOCsvbJ2ajuOLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WohEccg5; arc=fail smtp.client-ip=40.107.200.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WohEccg5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQsDcvPtjMpuZhv4eH1Yux2mbH+qCFqkoebKBibJkjXvcr0qiJ8BzP0hBDRY7ESqFNbzdjA5f5NlqaUeXdTtFS3ZI0s16E3tysGcUPTLKKOPYpV4yXpjN2tE2BlgDKXSL/OC9JWjInYzAjnBjm9MJsfnyM4yYyDSTc23bd7gKzxI/zXOy26XHX2Ixh4cUP6AiEDeISxrvBMMWf8AWQV1YbT+hT+Du1FVD6ZGqN8nK4pDT/LrHsir5d1hGkNGWIYQKgFh8l4TUlKph1L4wBqIFk0GsOlIKTwkqOYgpqV0X0V5CEqMoy9b0rzwBbBa7Jo7OaPvD/Y3sfSuW0RYwQxH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBODxhGo3UEVtL00YmmLgC1v33e6Or+mzKtJs2MKxHY=;
 b=ghmDnXEQNp3tq1MqlcvT1XvkI6aISHAcZiSzPrqSUhfr5obMF8P9pxDSylTYLaaEv8CRLcPhbxulpbzHXRq9FlMp5SPxUzrqOeSsqxlfbMaG9Db6ydpXSxlRuFVuOAcnV2R/slmAndWG5+ZYmaduE1lRDemZDlyI1off1NpczG9UQUjge5gWSVUxcX6lwC8rB/1eVNXEwHpqG9SCEYWcv0tbqwVpOAuAEuyxZqIOSEBs18pBLU25QFqWb6mtZgbwVz6CBgg7CGsjGFAm1ZFuF6rz87xtqaE/vAU8u1h1J9xC75X4U5cDY0WbD2BhqnFFiW1bUGqJCBa/aqJmYJbtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBODxhGo3UEVtL00YmmLgC1v33e6Or+mzKtJs2MKxHY=;
 b=WohEccg5DCvEqBnrYRLcz9IHeWuohWiJOMFlb3ULdY9sGSfwBbUlOi6gyN43h4sPNA4llvzR5U9GzqUyPdi1IGSYrRnT/W5fsqXBu1Rl1QQzsbQOVLAiLotqrJJ+A7gePamh6r/dG+rZTs6r4wwoK3QhdOGbTBjlexuWpoIB2bw=
Received: from PH8PR05CA0023.namprd05.prod.outlook.com (2603:10b6:510:2cc::8)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:24:56 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:510:2cc:cafe::9) by PH8PR05CA0023.outlook.office365.com
 (2603:10b6:510:2cc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Thu, 10
 Sep 2026 13:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 13:24:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:24:53 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:24:52 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 08:24:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 11/11] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
Date: Thu, 10 Sep 2026 18:50:11 +0530
Message-ID: <20260910132251.1171943-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910132251.1171943-1-Vijendar.Mukunda@amd.com>
References: <20260910132251.1171943-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: eb806849-bc8c-4070-7381-08df0f3ee7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	klm5D3uAQHt9uBM21l9ySR7epH65L6rRvTfRk5rrSd5iXrLADbcEefHz907bGTy/rmehmHx3aEAaPuAtit9LsUybErOqFXurSJUJxCLC2UiMVA0IIUMsDyAVMAkS72NnMp3qFEJv43ieRw3mn2txprqyIzdMSUP5F26KVP+JMxYrU1GfJcM5dKmgQfCOhasbHbFYFCFFsHoPTZQ6G2Kp11CUD39DliQmoRIP1njOJANHyG8kIW8Kp8F3vMjW3/EJE6GECFc07kDkkafFIa0W9TJk1ZJieBizljiaGR+zVlyb3GdkmXtrHfQpoWXtKbZhY1jAhOuaqOVSdmcQmv+opRA4vme5hszLvkidLxdg/NZuQ905YCeqsyB++3PJMzXIPt5VvRAHG2B8O0HObClCMMcOhQY8KM/xHZHQXqRE/69f626kmamN5dmlycQoWNXnfO+2ASyrrjZgMZKlv31zoC21EYp08Tk1LBBjCaeeRvJJ/n6Im2nlmkd7NKfcQ9mtBXBViFUf9tT4h9MQj1Q2N3jiZPIV6Fhqh3wh/euvbftsxsJqtw70BVlQ7g6TZWn5IGPoz+7f7XLqtb1knzGJRf+A4BAa+emwemczGsgB6JZxoMPwzq+zbVweW1r+xhbi2VDymyCFhDHp7lpP8Z5RlLVgJzw94xvIOpmf29lx7MtPKQFCE4B22TKAID9leyBBRPTx5B3lWsHXcny5PhH7Xw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8z8xLtwIlxp/xwbtHqYx23OJuDJ4oLKZmJ07c7tr2O0QIxFq2kPBj/BqzImgCIm+63wYBSOKNJftgNpmy8y1XYtf03TiA6S5pHwj0h14Z9BaBD/7or52MkN/TazBbfYxCY86iQN93zOcGrqps1KtqEFc8vfbdN8ZrnaCbOhj/6/rooH10TeFXFMnA3crcz6gPyz0XyU+2D5V07rLfgsMsMjg3Mi0xxTqq/DukEyrcUYZftd0/M8RbEXrBHnk2rFLHKLRFsZ9+QuazG4l3KJN0g0FxOw5NN+NiyNJbtoH9oNMokD5RmIHo02fHp1f5ljeR38ofggZPDd80MrLuVwjRs0QDU4wSv+/0zR64CdeaT3W5pyWH9gyKRqe4QOU487gPR/vfxtW3daz7DtXwNhQhXtRPlVfx/PsyKG9az+yfb1wESyMyrHii6iiz03cA5Ke
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:24:56.1412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb806849-bc8c-4070-7381-08df0f3ee7e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

Add handle_amd_sof_acp7x_sdw_pme_event() to iterate over all four
SoundWire managers on runtime PM resume, clear PME status and
wake-enable bits (under acp_lock to prevent races with the IRQ path),
and request runtime resume for each active manager.

Extend amd_sof_acp7x_suspend() with a clock-stop fast path: when
SoundWire managers are in clock-stop mode, write ZSC_DSP_CTRL=1 and
call acp_dsp_reset() instead of the full acp_reset() to preserve
SoundWire bus state. Extend amd_sof_acp7x_resume() with a matching
clock-stop resume path that restores ZSC_DSP_CTRL and re-arms PME_EN.

Introduce amd_sof_acp7x_suspend_runtime() and
amd_sof_acp7x_resume_runtime() as separate runtime PM callbacks.
The runtime resume path calls handle_amd_sof_acp7x_sdw_pme_event()
after re-initialising hardware to clear any PME state that arrived
during the suspend window.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 104 +++++++++++++++++++++++++++++++++-------
 sound/soc/sof/amd/acp.h |   1 +
 2 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index da987a51491c..b059039c9e0d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1365,6 +1365,9 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "error: SoundWire probe error\n");
 		goto free_ipc_irq;
 	}
+	if (adata->info.link_mask)
+		adata->is_sdw_dev = true;
+
 skip_soundwire:
 	if (adev) {
 		/* DMIC ACPI child address is 2 on ACP7x platforms */
@@ -1434,6 +1437,44 @@ void amd_sof_acp7x_remove(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp7x_remove, "SND_SOC_SOF_AMD_COMMON");
 
+static void handle_amd_sof_acp7x_sdw_pme_event(struct snd_sof_dev *sdev)
+{
+	struct acp_dev_data *adata;
+	struct amd_sdw_manager *amd_manager;
+	u32 sdw_pme_stat;
+	u32 sdw_wake_en;
+	u32 pme_reg;
+	u32 wake_mask;
+	unsigned int instance;
+
+	adata = sdev->pdata->hw_pdata;
+	if (!adata->sdw)
+		return;
+
+	for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
+		pme_reg = ACP7X_SW_PME_STS + (instance * 4);
+		wake_mask = ACP7X_SW_WAKE_EN_MASK << instance;
+
+		sdw_pme_stat = snd_sof_dsp_read(sdev, ACP_DSP_BAR, pme_reg);
+		if (!sdw_pme_stat)
+			continue;
+
+		mutex_lock(&adata->acp_lock);
+		sdw_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN);
+		sdw_wake_en &= ~wake_mask;
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN, sdw_wake_en);
+		mutex_unlock(&adata->acp_lock);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, pme_reg, sdw_pme_stat);
+
+		if (!adata->sdw->pdev[instance])
+			continue;
+
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+	}
+}
+
 int amd_sof_acp7x_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	struct acp_dev_data *acp_data;
@@ -1442,6 +1483,11 @@ int amd_sof_acp7x_suspend(struct snd_sof_dev *sdev, u32 target_state)
 
 	acp_data = sdev->pdata->hw_pdata;
 
+	if (acp_data->is_sdw_dev && check_acp_sdw_enable_status(sdev)) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_ZSC_DSP_CTRL, 1);
+		return acp_dsp_reset(sdev);
+	}
+
 	ret = acp_reset(sdev);
 	if (ret) {
 		dev_err(sdev->dev, "ACP Reset failed\n");
@@ -1463,13 +1509,25 @@ int amd_sof_acp7x_suspend(struct snd_sof_dev *sdev, u32 target_state)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp7x_suspend, "SND_SOC_SOF_AMD_COMMON");
 
-int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
+int amd_sof_acp7x_suspend_runtime(struct snd_sof_dev *sdev)
+{
+	return amd_sof_acp7x_suspend(sdev, 0);
+}
+EXPORT_SYMBOL_NS(amd_sof_acp7x_suspend_runtime, "SND_SOC_SOF_AMD_COMMON");
+
+int amd_sof_acp7x_resume_runtime(struct snd_sof_dev *sdev)
 {
 	struct acp_dev_data *acp_data;
 	int ret;
 
 	acp_data = sdev->pdata->hw_pdata;
 
+	if (acp_data->sdw_en_stat) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_ZSC_DSP_CTRL, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_PME_EN, 1);
+		return acp_dsp_reset(sdev);
+	}
+
 	ret = acp_init(sdev);
 	if (ret) {
 		dev_err(sdev->dev, "ACP Init failed\n");
@@ -1481,30 +1539,40 @@ int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	switch (acp_data->pci_rev) {
-	case ACP7B_PCI_ID:
-	case ACP7F_PCI_ID:
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_PME_EN, 1);
-		break;
-	default:
-		break;
-	}
+	if (acp_data->is_sdw_dev)
+		handle_amd_sof_acp7x_sdw_pme_event(sdev);
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(amd_sof_acp7x_resume, "SND_SOC_SOF_AMD_COMMON");
+EXPORT_SYMBOL_NS(amd_sof_acp7x_resume_runtime, "SND_SOC_SOF_AMD_COMMON");
 
-int amd_sof_acp7x_suspend_runtime(struct snd_sof_dev *sdev)
+int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
 {
-	return amd_sof_acp7x_suspend(sdev, 0);
-}
-EXPORT_SYMBOL_NS(amd_sof_acp7x_suspend_runtime, "SND_SOC_SOF_AMD_COMMON");
+	struct acp_dev_data *acp_data;
+	int ret;
 
-int amd_sof_acp7x_resume_runtime(struct snd_sof_dev *sdev)
-{
-	return amd_sof_acp7x_resume(sdev);
+	acp_data = sdev->pdata->hw_pdata;
+
+	if (acp_data->sdw_en_stat) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_ZSC_DSP_CTRL, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_PME_EN, 1);
+		return acp_dsp_reset(sdev);
+	}
+
+	ret = acp_init(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "ACP Init failed\n");
+		return ret;
+	}
+	ret = acp_memory_init(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "ACP Memory init failed\n");
+		return ret;
+	}
+
+	return 0;
 }
-EXPORT_SYMBOL_NS(amd_sof_acp7x_resume_runtime, "SND_SOC_SOF_AMD_COMMON");
+EXPORT_SYMBOL_NS(amd_sof_acp7x_resume, "SND_SOC_SOF_AMD_COMMON");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("AMD ACP sof driver");
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index e3c85b5cb20c..1bc6b572448d 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -294,6 +294,7 @@ struct acp_dev_data {
 	bool acp7x_sdw_wake_event[ACP7X_SDW_MAX_MANAGER_COUNT];
 	/* PDM controller index selected from ACPI acp-audio-ep-port; passed to machine driver */
 	unsigned int pdm_sel;
+	bool is_sdw_dev;
 	unsigned int pci_rev;
 	int acp_sof_signed_firmware_image;
 };
-- 
2.48.1


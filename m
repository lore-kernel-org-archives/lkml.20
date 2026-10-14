Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEFD4E73BE;
	Wed, 14 Oct 2026 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972639; cv=fail; b=fHS2PvCiPTYxvMowq7bA4KlU/0kdBZjQjVsBKPThuFtHPLw3XR07uLXl37ylPc84y+3IAeMjcnmKlDD/r9jtZ88x51/KqmD65fyPDC+bqAgkh53VZLDsBYirlL42ceL830AsRWh0/cTbFlSzrcs4p1/cwr03dspixD0s043a74c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972639; c=relaxed/simple;
	bh=6/MZkYvLJPngPFGb4TVkMWAkxigbEWMVGvCPDtBDXqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFsalTGTdHn9HqZAXe6AeUY51M8sCS9BHsVnymp36uUB2jG5ssubqNfYNQUro0cqZf/fuI4PRLuZeco4teB4T6e9hnWRXlqq2P0FetBJOog7tdeU1zSxz+6kQlQWdGxvrmN65vvXzMQ1V+BqvRspUfGMht875OZjFYgnlCd1ZtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ChPrlvWO; arc=fail smtp.client-ip=52.101.57.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ChPrlvWO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhsBtqffl0/Z16GLhPelWaEzY6uLeF9zZ3f/6MWIOjsUc5nWCtXWHz8+UeAKsscZ7fLlES4QAvWmPPWbnCcnqc/K9ni08ZOTrpsEDMK57ngj+YN8e33xAwP2D3hrBAsvf9LU3zUMstJZU/E3hlqUVuVNi7WB6Mt+JWyKESgDLFM9swwTFO+IYf2TRiVYStNl61FxYdOZyaGbUn0O9bIIpKVhdJTaOP7ESAvZX/pe/LzMKuAHtcmWE1sdYniR68bH2oDqPPuMnlKF0kr4t/YpiLno+6ez+9gbqrLTndhqUd0cv4M3kMMO935bsbnlDmdY3Efk2o2AHGxC50BsISObzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om9tuvhRHcnLtVZQqdBvfwddX5+Ep98xURSjkDQaU1A=;
 b=LU7gdI1AH8FtcbRp1zb8AEgL4k9yVO0onAWQLsJqFv8vO7G4CjTkz6JHuFcRRp1kDhBcFGGo9AKOtr83KH/N7tgjvcP59AmatKVGEkx0jzuAgVKBC/AN6AGbVd3wuMEjkoulybU4/Y8zLheIKm+JtiArhfqWdSn2/NxaeZ21NlbOf8plL67E/Wp1OS0x1voLeh7cQyRZm4m2ZenYiwYZ12WRX93ttKmQDth8AZT4bvSHi+ybv7QT2RigcAE/+4QpSdPdmhve8Q+F9py/OPvBNC4M2Gh6tH6vmMz1ypFcFU102tYDpUnmIw4p5AKKKoMoXxJRqgXchV+ZhWKqwC6PqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om9tuvhRHcnLtVZQqdBvfwddX5+Ep98xURSjkDQaU1A=;
 b=ChPrlvWOzYCgWEpD2s1X++kOoPKZppbKeBX8GQeHyzb5BJwquvZIpwKS093SIneC6yGZZdQXXJoNBuUyeG2RcYHsgUK+C5clzR1BEW//FFX+xUvLo25N+70E+Ksnr/7c3CX+cnQpGEVU5C48a9h0Q/19OzaR4emduL8y5RkZknM=
Received: from BN0PR04CA0132.namprd04.prod.outlook.com (2603:10b6:408:ed::17)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 10:10:31 +0000
Received: from BN3PEPF00022BBB.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::19) by BN0PR04CA0132.outlook.office365.com
 (2603:10b6:408:ed::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 10:10:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBB.mail.protection.outlook.com (10.167.248.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:10:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:23 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:10:19 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v2 06/10] ASoC: SOF: amd: consolidate local variable declarations
Date: Wed, 14 Oct 2026 15:29:14 +0530
Message-ID: <20261014100902.1215212-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
References: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBB:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9580a06b-75d5-4175-bbc9-08df29db610f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|11063799006|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mIqKlIk1rC5k8StdViveUCbCkbCiVNTRTuNcKZdNWEhUQV5QULCfC0+ZM2PP8NZVB5CYj/R4NIIDlJ+thXFIUYb7ZdEVHC59pZMC4VXD/ft/5gSfsVY770s7ioujZJG2EuTyVYAABshZIon21y+XTPxfHDB0irqU+aPMze7KdqqMrkb5fV7OL15/IrgujyCRkaZg5uFmQm4REZsOPNT+GDsyly/ye6TX3A0co17heMGi1+gbYfSxGEJEhxd0qxTwpyXn8Teox8y2s85q4yeQ5QdZptcs0hHqefblbqp2Szfk6WPXgkGls2Yi0//9cA3TTjTJT/HX7ZogRzXHJAf1HVYu7dCPHV2PV0YNectVY9FK6ByDLMT1HBflhdvCoQm6WL10xCODRnjzWfxJEJ+717t6lVZP6R/0ZPz3aWN/P4gHqaFevO8awa8ZYCSDqsHmvPMOvn38jojM7WZ7Mg8XEDKXe7n+VHZLcvS8W3o9gxmYlLT3uyzJNYQyIT/4FyqyiBnC+myBk2GGSso0btkubkmCbqNEcbYNXIDEdH069Q+0PTz0PkTSgTl4S1ks1PubkFSXDb6kb4luWw3b4uWrpFfsqN6il38RQhD9Yix3T4XCqvo+/XKXpvXsBB0cBUjMcgVo5Lx/san4HyMJAzTub9IeeLwwI711xTL/SazMMOcdFmLVUBCa3mw8MRRElTIE8ewn6WGXwTODfbEZrAXqvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYDAMoqk0kqvujRrJ50GNLK03iXYAxgGZWguJW8AM4jgKpc4LTq3s9boCejxiwIsoW0MAn6LSZhEd+ZsYDpSmflSjxJwFZUc8lj5PtJ59Ru8s5xAAg6IxxKNF3Pm+T6FeE9nQRlSFhlvWEdCsM7CRQPw627n0BnJl9TzESKouCna8ZRMBcIpsNKfyheM9WZm+fn1WpKewNJaxjTwWLd/1xm2QomkRTm6WlZdOK4SpRd8RqcU9LHAPrMVG+ZVBgTgdNLa7lRjj4tP8SzTEIY0ByAQswWulhge1Au8VQUA+jZLFhSeBQGieW5CHrU3p43RuUliTZelAQn0zP2BnbvZFMuzohNvGq8p55W7sEn0VAMUR1Id4fBvFSm0A0LauASbwn6LVR+wBJ84XxqMKHgsuR8DZ28zvIDxxCNDK+uJhw/GD9lGD2ubbqtcnJSy6ELj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:10:31.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9580a06b-75d5-4175-bbc9-08df29db610f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538

Use u32 instead of unsigned int for hardware register variables and
combine related declarations onto single lines in
sof_amd_check_and_handle_acp7x_sdw_wake_irq() and
handle_amd_sof_acp7x_sdw_pme_event().

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 71c39eb36194e..790af65be34a2 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -674,9 +674,8 @@ static int sof_amd_check_and_handle_acp7x_sdw_wake_irq(struct snd_sof_dev *sdev)
 {
 	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
-	unsigned int ext_intr_stat1;
-	unsigned int sdw_pme_stat, sdw_wake_en;
-	unsigned int i;
+	u32 ext_intr_stat1, sdw_pme_stat, sdw_wake_en;
+	u32 i;
 	bool sdw_wake_irq = false;
 
 	ext_intr_stat1 = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
@@ -1445,10 +1444,7 @@ static void handle_amd_sof_acp7x_sdw_pme_event(struct snd_sof_dev *sdev)
 {
 	struct acp_dev_data *adata;
 	struct amd_sdw_manager *amd_manager;
-	u32 sdw_pme_stat;
-	u32 sdw_wake_en;
-	u32 pme_reg;
-	u32 wake_mask;
+	u32 sdw_pme_stat, sdw_wake_en, pme_reg, wake_mask;
 	unsigned int instance;
 
 	adata = sdev->pdata->hw_pdata;
-- 
2.48.1


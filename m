Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29F30BB8A;
	Wed, 14 Oct 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973204; cv=fail; b=GpEhjaKca/d/O+r8kO9cxiVrXVdVJvPsIteS9M4p/gH0mRtZ+GfAFzvjBMbcXDYxiOs3/ap3Quggf4G7l2NfmymLFLXRYSYJNyf/plvDHVxpObdCdglQAU8oJS0eb4nymmASt/MnABTB+7RNWz/b/WtjMLEYmce8qT2AD4qloiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973204; c=relaxed/simple;
	bh=096TsKlyQSQ+HI4trC7kSQTFMJt0Ou5HTWkTBw+EA6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZO0v7lwYqYQgVhLVLnnUHgw2FGBQj94EAnZnp+449+Gi+IO/MHdz417V+a//0tei+q0JJTPGxMHxWVpUx2SMZhGc74r065btoPeYmsYk8xwoPmY1wv2SQN3J+V2xPPveF/j4zgU2PzCp7KNsFi5RtvKnCOTXyf3gb+BPB0Du4QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BtFQ8KOt; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BtFQ8KOt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeeJuzLQ9x5gcn53jXPWYxat/SpCIgeoM3iJnIE++HDpfMHrL7+SByfft14MJRL+27hXPBkRLYzto46ZchVETIGn1hryCi8WHHspk3AidlUm+hI0Q7BpbLft8AoXLC65SxEMb3hE1YRHP3i8kfyHZCg5riJLQozXEJnK9UItQ8S9GmnYiT7T8uspwPa8ZYHNQS98ubCA+rEjcSQ9JZTqJUgFxn7K+5NcKIPdmkeIkx0Ziid0WGoneAK7PnxFeIecz3CWktukmDnV9ugVVVMjJALvnZtDYFxkbZzAoUAEyPIAv1xQUCdsq6YwWUb+RnqJnLdw+La88a6ycy5SszAR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPovzC8TilF4IXPn0MPhrrxgGgCVyONPgSmqDSJYhyU=;
 b=SrAI4GIF66/hgepYYhwp2m1yImDb1HVZ+xb+teC1IGH2fOyhl9RePBC1IgoJyXuQlzZ84onp0EjEZGQvEMQKPjsV65p861htqanrjUP74vpnKR6kMb8iR1deJfyftLm2f9zjA7LEVAqEKj8HW6rwT4lLdvLHRbO4peSCMWXzosnTp5ARFqr+qD2uuzDFJl5+Xey0g3DPN8802/jjVXNbJrJH8CokRX5XGcfbqeP5LiJ4K9ZNSTSwBoRmKf8nP4onQW4WnCkGBdOKKurTGqt4orcDMNeQ525XlK5EC1LvzALWJ1DYxgWZDsCUR1pSiI3UQcnUNfX5/1eCkcCrFl+xkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPovzC8TilF4IXPn0MPhrrxgGgCVyONPgSmqDSJYhyU=;
 b=BtFQ8KOtvSMciscHQwhfTJjyFjq0yRs3kBebBTEqLxD0Q8BkjkytghbMSWnCAKSE/KKF7qZI/ZD9R1+EKwFWDluwWCCjWD421F02xEzNXqF8L73h6/Z+YAt/hFokCKTzfuxsAZzPQ0oCZ71oqhiPL3XLFeYWgdEswu3VGU902w8=
Received: from BLAP220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::18)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:19:51 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::48) by BLAP220CA0013.outlook.office365.com
 (2603:10b6:208:32c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 14 Oct 2026 10:19:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:19:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:19:44 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:19:40 -0500
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
Subject: [PATCH 07/13] ASoC: amd: acp: add DMIC components string for SOF SoundWire machine driver
Date: Wed, 14 Oct 2026 15:46:26 +0530
Message-ID: <20261014101817.1240200-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
References: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de27608-7a45-4108-371a-08df29dcaee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gR/WNbG9QqxwtjaWE/LJtVFWoTIhtcfPsOCn8CrPsIJeMCJ/ZoVaO6E9Te85jHHXw/DUh1pikbR3wVXCnOKGx9Z5qk8Td8NlYbMfW9vZeK3OSIgtK6HPJRBQA+ISE+NAeHqy5zEbL8DeUG1J5fzGoOXhnvVTCbZeO1QghLiE6wmXKiVat2W0f4JZMesnLhwoAp46HMA8Uyz2t0+UL5Al+BJFlpPsZTZAFTE5ti8xxA2wuR0SX/JFylCPwfuTl0R2a1BAYHRJR5LyShYTIUU6SetSYsds+0ynrVkE9nFAShxfv/sq6LCXDYmxRJSNrHOgDfj4feXVVGAhRH3ItI9hAzRVkUFmlKogA0xywXm0oQSgKX9R8oHi/6Z73jPG/5x6NxuWEapHdNKxFiBBWBnGHmrLESkKMIwdmJcvPefVx/1OctXGucrKlzb+TlFrOac90Qzg7e4Zvk21mpKjepiSbS9aAd5Dc5/v8yc6THVoB858Msk4ld9czZK+Oxjh0cHnb48xEWArMBhB4KgbYgPM/osY5rkzx8c3VhdPiACZsWx/ZrtCVJbpEVqxyErsn1+TwEXf2wWAPHWquY5V5wk0eQgaxrirEJS1axvM+Hs6+zvGeOjob6r+iu5T9gmwk8vAO/VZoehtd5sDyPnUKKjHG7ZezUfhr7VxFPgYkvFUm707YXAGRn/n60K4zHelvIrz9XYK3gHbsgDha6N91oU6rw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l6ZJcLuSCT6LDPy4EsRPFmlYzn+RgdxnH3mYOyKB4pq/JN9euU5ZP5qxg7sVjGG7OtfmGSrnBajYcWaYZoxfgB4L4brqJ5wUgktsaXgGbbys2xx3UMXxU5b6iDsyJLvTD9wGq186055bG0jR/7kP0Q8OqjD1pQXSC2XynNlMzlEqAz8ueRzzt2O+l0YEt7OKuxvh8m5P9DSb6Q4hRsNSkoGNZ+dmR8IsJQF+V+moD5LtHJPbKcEcYIqfpuczkPUrYGkSHa84XJocaHyRExfs+77POCF3ITTuj8VGxAOx3pE8Xlbk4v6221DJy9GdrjUQaQwJEWcZ+wIYimSJH83de9wBj+kNA7RedE2vQOVnetHgG9J2BWZBaAyaQxSKr8d7tUS+9GxzIKkJ4XuhXhmS5GMoIc2GKQkIBksFUjtK3lmnyAFg9S9PZLl69aytBtRw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:19:51.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de27608-7a45-4108-371a-08df29dcaee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943

Append "mic:acp-dmic cfg-mics:N" to card->components in mc_probe()
when a DMIC DAI link will be registered, keeping the components string
consistent with what sof_card_dai_links_create() actually creates.

Gate on the same three-way condition used in sof_card_dai_links_create()
(ASOC_SDW_ACP_DMIC quirk, mach_params->dmic_num, or amd_ctx->pdm_sel)
and suppress when ctx->ignore_internal_dmic is set. Use
mach_params->dmic_num for the mic count when platform-reported; fall
back to 1 for quirk and pdm_sel paths.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 1207e35ffb581..416cf58a58a2a 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -406,7 +406,7 @@ static int mc_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct amd_mc_ctx *amd_ctx;
 	struct asoc_sdw_mc_private *ctx;
-	int amp_num = 0, i;
+	int amp_num = 0, i, dmic_num;
 	int ret;
 
 	amd_ctx = devm_kzalloc(&pdev->dev, sizeof(*amd_ctx), GFP_KERNEL);
@@ -489,6 +489,17 @@ static int mc_probe(struct platform_device *pdev)
 	if (!card->components)
 		return -ENOMEM;
 
+	if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach->mach_params.dmic_num ||
+	     amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic) {
+		dmic_num = mach->mach_params.dmic_num ? mach->mach_params.dmic_num : 1;
+		card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s mic:acp-dmic cfg-mics:%d",
+						  card->components,
+						  dmic_num);
+		if (!card->components)
+			return -ENOMEM;
+	}
+
 	/* Register the card */
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.48.1


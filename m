Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353757;
	b=EwSgbvzWvloCyWXT5QdWGRS7fyQduloDHb6TGVk9u1EbhVVDcD3ryCxK2S+pKCDunvc5
	 o76FBdgmEOEYrHozH5uqH1poWuUAf94iwr61fdYqB9v6+2MKUT9uDOncScTERJiSvA71o
	 8C1dVcKfnAL5stQdfuGcfaBAnV/sgcDFH/hBlwoTiug7TogY4FP1KaeAc3SISecGKlNlR
	 Ar5G37KDvCQe7QO809GZzArGbmqbmLv5iUeIgEhzVCe0KGxZbkdZf56ZJbCvSFpj8Ek46
	 vqcs17yfV+JSSmyZXaEZeuaTvaYwDRgmaQ2duNLkCCga04OF1HGbNkEiY/yNjcao6/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353757;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gpFg2b8l7318tWGkl3pG6POjUzYSfstedA2LN6Ajf3Q=;
	b=xHOGlUCFS4trFRsyeYdGygGCGAKLNpoVBPgd/p5AQDhr4eEnqX5lmECK+PuxZxUI+Q1I
	 1qQqKnzGpaOftK0+8V/nmhYVq5wf126A4dce9povfWJtaMbkgrs3yKum1kXowD/CxU/Y6
	 nHDzZpFEMiHxxUQrSpUNZV+1KpLthxWtlRTYnEkbSEzBZmqI80Q50+NF83oximfQnwVyW
	 9C1XpWLWIuheXXS9iTJv70qUuNGRBbigpQuxLvcZmULn5/2azF+rMPv2Mc5wZNCIa+Ykz
	 flP3nTH2AKTTr4m/n6ibXbAoP8NxFJBr2PAb2rAlX37Hqba+H9PmJoKxgJUoOELZtGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AT2604uF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.65
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE22606A330;
	Fri, 30 Oct 2026 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE22606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AT2604uF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDT/Jvf5y3pCTXmH5IU9wSeCygMVh5Tk7ij1yDKq3v9BcJh+FUTl1ZT8XMoe0lLZGC0DiMs4EbygWhhU519BzKnoYlQgM/8ZV4lW/A8Qr1qofx6S0A4xfY5mPzoXK+yTvWoYbOZpj31UrOkKsMhtCbQhIbRk/1Y2LVAQjHcHqSfXSKs6i1BR2rtLGzoDClEXnv9BbCkT0cX1sRpEN5CrlH/TEjpH7XFzqyREgdFtMi1+JXzgwyv2gpJEfw1NBT0X4kJHToT/s7UM1UtSsTPbfWmAIKaPY1OIf8Z1IZc6OehI0eHJpZ+AEugXKs71aa31TTptURx2BWitMV0ITdat0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpFg2b8l7318tWGkl3pG6POjUzYSfstedA2LN6Ajf3Q=;
 b=VvFO5nlHIN7ACfAZh5gTTptyzVlPhZziw40x6tdG2bW/VYL0VKUZKUGfFttmDLawLTTOhEwQKF4poPfXffJ4GH4RgU9Ncfh3izRoaxEtNinZFQBomTu5gZlEp34/LHLhXvcB3BISX+FBoOt2Q6Nnnsa+1LWmH10HQyYgQ62I0OHIHPyoVz2Ee69qt1KAjjtwlgejNEAfzWb9m9ZgKbvoNpC7aW3cYa/X8d9SnPZCE1Ez4N+UvxcckJ+6J9CGhWGe0q12SuZcMEwDKq8RQBW/EWyzQlhlNAAG8Hl+02/OQX6BOdUdY2iHit4G33BoOr1e/uGqLs7qFaa/a+egrL5xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpFg2b8l7318tWGkl3pG6POjUzYSfstedA2LN6Ajf3Q=;
 b=AT2604uFbzR84xLtknXKlogeMUZGucafj5ujQCKuQVzh68+VIDdhmtm0BidQcYCQX3w4GpvmxF41LNEX4cufMwN0QkXtRLwUOnjpUnF+xDMSp2S1vGguHBK7Sfg7sYkVUBNNd4z3Uy1hZkapdgrngcvg5iAml0DbhUtCQXwmNaw=
Received: from CH0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:610:77::17)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:49:11 +0000
Received: from BN7PEPF000000A7.namprd05.prod.outlook.com
 (2603:10b6:610:77:cafe::50) by CH0PR04CA0042.outlook.office365.com
 (2603:10b6:610:77::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:49:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A7.mail.protection.outlook.com (10.167.245.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:10 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:05 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v4 10/16] ASoC: amd: acp: add DMIC components string for SOF SoundWire machine driver
Date: Fri, 30 Oct 2026 15:15:25 +0530
Message-ID: <20261030094714.1123396-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A7:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb9f1cb-a8b4-4f9f-514f-08df366b0cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261022105027099003|261022075727099003|10067099003|261021123027099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	FbRtK2BXXnfjouGv9lC+qt1wu7RoeQRVRYa1sXNKhHqzyS1vg32hx4JEaBiy6eeCbC849lNRSgml1IQZFfVI4BGxVQ0fZ+fjHK4It7iY0/tlV7WF2oaGXmLwX0/3a650NWtcwmbWvl/V5j+leihOiaH894r+wTbn0AGvJCgf2lLSjGC9Fpw//GIc6gJG8nkbA9efepytDidnjSHUV4DGr8kJUpKE9s3q6kEoeLA9V0kcu/MYvhhFZkGY6iMfVXmaHj5bO+TB1/I/Hq8jE65WWmkgc/xo1XFK4DvAsy/LQLwXgmBnkMEK4NSEV1UaJdhFQR7Zwd5qYxuXgbGa5JGhuBIsFgSoc/LzZ2rUmSqLOrIGdK/v600yDi1j01JQXZoejg5cuAQpGO27YDy18KqwU296NgcvbnKbXM/4Z0bZx43/FMqX93YIhT6ED/RNr2OoOcFe8C1cZ0U+5LRRYB3ulDPuV68L5uJ9qEjGMBoAXUP6KN14gM68+ZsTLO6kfjxHqMxYfVgIAUK6f+aey3goCt8U5k8PfC0RZ7hhuCuy8kF075oyDzdnAGFDZ8JzZszwGTb7F7gzv6ph6Jz6Na88I/wxKGvbwbWG4ioFNZqmgHfLLQUlIqnj46Hh0t9xXKawTC71LdfY3ts5Tn6dCIUao2kAUsriC4RxHYXpP0uoKQ5WNWrkCYcYcfh2kipPZMD9ra4ts5DLq5In9v1QCctdLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(261022075727099003)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S6yiXb0pZMMeu1bnk0zzTOjAFdRf0u6JpiNoV9AB+Jw/Y6iE9bPdFth71YTGvUnHOSlJXQG8vnvELOtOgU2XlwHyqcKLOXdE3p1vuZ/6MLvjDnlkYf5LVqzzhUbBIyZjdHCcVz/pPqo2GQDReyjHeU3oSX7NNey2CeAbEzYcOzGD42nDceJHTVMGb0cjtYjqR4YvbUGGV2YmpjrT43KJ7iuQ7GiaLfmlbmieAra1/1SzmxEUz0icZ0ea3g/zkCCgmsyvyHvtSZ2RURYE40N0hCSb3XsRjG74AbXna+1hD5Tb5KfWVcDljk+XVJyPPjd8vjnkfzpxWKfxe5+4QSaWmuGWYgaLQ5F4ob2kCVL5ce5z+tkDuYKz0A9cPLakjTnMBcQF/hh6Qm26ZKcgMUU6ZB2TIFjzj0iEFPqtS934yGQXKs9fMxXXi3HFvsRz1piz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:11.5588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb9f1cb-a8b4-4f9f-514f-08df366b0cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567

Append "mic:acp-dmic cfg-mics:N" to card->components in mc_probe()
when a DMIC DAI link will be registered, keeping the components string
consistent with what sof_card_dai_links_create() actually creates.

Gate on the same three-way condition used in sof_card_dai_links_create()
(ASOC_SDW_ACP_DMIC quirk, mach_params->dmic_num, or amd_ctx->pdm_sel)
and suppress when ctx->ignore_internal_dmic is set. Use
mach_params->dmic_num for the mic count when platform-reported; fall
back to 1 for quirk and pdm_sel paths.

Call asoc_sdw_mc_dailink_exit_loop() before returning -ENOMEM on
devm_kasprintf() failure to release device references acquired
during sof_card_dai_links_create().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 3366f668d819..664b9e960cf7 100644
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
@@ -491,6 +491,19 @@ static int mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach->mach_params.dmic_num ||
+	     amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic) {
+		dmic_num = mach->mach_params.dmic_num ? mach->mach_params.dmic_num : 1;
+		card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s mic:acp-dmic cfg-mics:%d",
+						  card->components,
+						  dmic_num);
+		if (!card->components) {
+			asoc_sdw_mc_dailink_exit_loop(card);
+			return -ENOMEM;
+		}
+	}
+
 	/* Register the card */
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.53.0


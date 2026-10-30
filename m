Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353750;
	b=Jp2X5/M0HFBZUgFdJjt7zeb/DurNwI0f1VuLxIchG0gUf5aC4gllxk/uSa/aE5J0NOSu
	 m18bULcmT9yPQSml+cEzpYA9wz/3PNUC3Z9GDEjPluVBbZG+1ezizF5xI1P76IYJagKy9
	 IkwS6b7o2Cf1el3dbM2xsgaeyafBRYvpT7Rtnrb3g3YdrX7ZR4FJmy3VKQ/yxxZGxWNSo
	 +hvKNIRPczf+k5mtD4pV/O58953zw235RsVtPhBZf8Wt7wj5ioYDhgQ7ZZlZDzEZ6EFEo
	 VmkMHYg6b2tPEkQPdWGXY9v27lF3FiIUuHl4GrSKxjxmNpUFfcFAH6WC82KFp8E3gzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353750;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=NrZ7NrI956hIW+TFj0RUHkUzI7lV4lB5vd6808pwHec=;
	b=Ho7fwEqh7ZgPXcneHNXBs6yEYk7GszyFkti8aaih1Zf8kh2eoa3eS+G4WsBSs+GY8JpK
	 JxiWbnTk4wyDMj5ch4Hr+Q25BogdRDDLaMGbLUq7qT52R3nPS04AR/1IhAHFZJeX01erc
	 /Wxv86tmLe5J4YM6tMHGY42BBxknEIydJGXMCEYLVqiuE1Ja0DYnPOTdOVZw5MFR+OLKz
	 KKINFE7FE7DqaCDqI26X0QWHfrorD1RBwgkbwzA+jDOJMQQCAGlcHvowlLb8EBYuVKySb
	 2weRM6u9KKVTgpwGWzrDDFjmd7PX7TKW+13hf44zoD+0fjLclRFrddkufmFNe1bd1WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EhlH00pM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.2
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B5606A33E;
	Fri, 30 Oct 2026 09:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0B5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EhlH00pM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWrljzAQ5X9AvUKdD4ZmhV2si38j+HVous7VJy2+n1M9AwI6M+ffbOsWE8TnXVaGujnbGrnjMXj8gAswFAclK4iENEeYzKSnSmT20hQOWTOKkAOLQv94UgJwAPD+COXuT5N+CGOFfMLlhGxFAGaszQBvbsk0xXKXa+w7nvUTow7h2owwfcyn5KtDhxcycWt87YBlE02JQ8Urtbc67pl67j3D2x0g7dKZlnBpelyEh833DC0kMJBGrqsAOmUM5vUH05AOuEPMtVCm4zA5rrd/lVoROHPAfsY1TSEN9RzPvPRq97XVhec3At1MnNSFPPOl5JnFevZ52NxmeTzigJTvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrZ7NrI956hIW+TFj0RUHkUzI7lV4lB5vd6808pwHec=;
 b=yinNx9E8T6QTrEXovqvCl00T5mw4/LUpqPE+lcdwBflaOASh15bZSPJiL5hGdxvywJWrDdJuwVSroqd253jAn3ruX2iCi1ZiA9L4ur6IbyLTDI0VqGBRFgMw+unmiQShPplzgs8fZdMq7p8kl6rtC/6h1RCLOTdgKjTRWo7mUtNGRaxSNkOKCGz8WwTr6VPpTvvuIBrMLzRJPD6nLSoys/Fr306rOQCw75uwBltFWxupJ6MGQ6Z/Lo8vGDhDHSJlayvdAp+jWMppZM/284yDdKvWJ/twIgAmX4rlBHOOyO+ksWeBPrOaY5r3V3LHiP/bl6hx7phnMei7sCLAD+kJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrZ7NrI956hIW+TFj0RUHkUzI7lV4lB5vd6808pwHec=;
 b=EhlH00pMblzlh2ND44bQsULYvvXdirQ0BoK+Cag/GK+v+JbeT7dUEIw8+ILTjuluqOjh5/jGJoHE7fizGGKy70CECBcENLtZzAUhj/yeljH5J7pEHZzyI/2hpCxcOPZKLhkRgN6h/aTN5gxWyI9p1IbZVDdg5jYTjKrT918+hBM=
Received: from CH2PR18CA0042.namprd18.prod.outlook.com (2603:10b6:610:55::22)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:49:05 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:610:55:cafe::5a) by CH2PR18CA0042.outlook.office365.com
 (2603:10b6:610:55::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Fri,
 30 Oct 2026 09:49:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:00 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:56 -0500
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
Subject: [PATCH v4 08/16] ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
Date: Fri, 30 Oct 2026 15:15:23 +0530
Message-ID: <20261030094714.1123396-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: ee26d415-fa7f-484e-5053-08df366b08d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v+9B3Esh0KtlvrPFgHohOqQzMImYC2z9RFMm+1njtrk5gDE0n4yze3ZC7Sv8tqAqMDxSnHE/HXSyd4jLx6HXUdEB4lfvqJ4ucKlFh7vjVaw+jnmIgHTyEbZnRJs3m9svF+fhbtS8Z4LRaOMmYiiaFj6/lIpsTZw+gYPQ5FI78fXXpSty+P2NdaO75R6TJXh54Kg/6/Jf1dQjHBmBvdgZLR+mj7s/yNqOlABZlDBKs+9szXXk1QlypTlU70QUT+gPSE7Uxx1jf25HzykXgiHz+RB7+vJanejh4bAVSc4LADVghzVHs/DRfUBZkI3NU50lAI13J+iz20E9JqxXxN7bKJEFojVxsTCaLJ9zMm9JElJru31aqdmQI6BU2GROyH5J/mWPGXMGv+dcz1VHqZPvkKW3QIR1lmSmT+y/ixRO5ZEUUrC7VKp7dYwh841i0OWkpiQaWQCn9yaKrw0aW+8qJkrMeCvy01hIGbSwgmpXFEkTcANozfaXdoR96we1QPmbSkYeCXt/P9RuyKWQeMyv+wXHDejks9VhBRBf8N5VLZKfM6rpjgUciYfVMbGnaY3dAfpNNQRfCyyqEoMQom8tBkA3fmRG6lJMl/yYjNZVfSYDtCyW7xDO97lPF7h4aGD1oPO5CO3gUSkFqg1M3/MhXrxTVweaa+nTm7B7yW2++wbgpedkfhWfEU7keZ9hhVC0PsxQxnIUw7rKQ7GOJNU5jA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gPM2xXnEGSfDrUPLx44J1CxwKDqiDAeFFSPT8HPdQJE/INdXVHMwFemzgctT312sdsdgHT2pUJuq1Sv0tXRffFwodslHZqeaXR5DApp3AVVKlBTVIj0Pfe+IAgLXofVVWcZ9ZptBqHD7IdGtW3cKIlYbSzXQYV1XmVelXFD2XTZOXSYdfo7M9gdCxXLacVtQWZPNdMLaAK4qLXXXQBun57MIbKM07lE9BwUPOAJD3D872mqlu0smEldNMbsvPBgozKFR1eN915I0VzddG1RPmtSiL+CcFns6u2WAqjtkBnV3EV4J+TU5uYupy7JvG83MHq0LYTQeMtN6GXf/7EmzI69ZVFTJakloejxSFsFabhfLSS2uxCwa9Pi1Tw225lcm8gEdc6VH0SL+7SFOpNxu8DB6H6f6sAAq82JQSRFixeS5zJFSgTnUs9TMMCN6X72a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:04.7116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee26d415-fa7f-484e-5053-08df366b08d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488

Extend the DMIC DAI link enable condition in sof_card_dai_links_create()
to also check amd_ctx->pdm_sel. On ACP7.B/7.F platforms the PDM
controller is selected via ACPI rather than a DMI quirk, so
ASOC_SDW_ACP_DMIC may not be set. Enabling the DMIC link when
amd_ctx->pdm_sel is non-zero ensures the link is created whenever
a valid PDM controller has been identified from ACPI _DSD.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 18603e552dee..9024e789d746 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -308,6 +308,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int sdw_be_num = 0, dmic_num = 0;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_aux_dev *sof_aux;
 	struct snd_soc_codec_conf *codec_conf;
@@ -350,7 +351,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	sdw_be_num = ret;
 
 	/* enable dmic */
-	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
+	    amd_ctx->pdm_sel)
 		dmic_num = 1;
 
 	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
-- 
2.53.0


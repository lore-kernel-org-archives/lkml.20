Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649344;
	b=4pi1hxkygvbFGOpsOD8yilPyheFXYOAeVhB9bCff4uc2q5DU222aCgezEs9gLMGLRp7e
	 UDLIG00T1qwrsqCKwxzNrEPhbnI6O1E2dpjJwHJQCK+0XRfa5fBhSzCVAf4RiIGvHXjOd
	 mmt/BbFEp82z27qA2k7fCDPZLf/9379q8qUI2cVcUCtMp1TPjwZg3CfaHCNOblUeEqrHg
	 aSLUqEzzbS6cMLytu8WqjsH4ror83U1wLim/6HR0xAuog/nErFbcfy94/EvNPUaPltWaA
	 aCg8VB5fcbooY+pT4Km6XigP6o+Wid/kXE0Ou+RVUQ0Wqvt9FRbdC+SuVDUdPv622uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649344;
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
	bh=TRSqRQM3yZpMQSa/Rf1zw777k/CosxTuwbwSOO8Vjbw=;
	b=Y0vv1P8jRgIPcFSPOZgNIMd2VmgVvKzz8AnDg3M0F/jSOWr/QBqK+NTQ8Mlp93HMSnjA
	 fv943b9C0F01m+qBdo4LcHJiXgoXCspdLlt1JiIw+Wx8bz7kL9+mLDGC6xX26JGbkymex
	 EVARpAF5wIgyhVKpchGJcOgorquNGtwQtQPTmFjCAGXQpbX1RY5KdCSwXgwyPEgD8U448
	 REsLEAf3vEVCbOfiWnjdq635uCsySSSqZZLWQMh9y9ugCynzk2qKROfJQvKejQC+wC0bH
	 WQlwxdBo/AFaQMteXcltO9XapV8TQcYn4TRATZ0zNnyVaP7m/THkfMiY+OsCec+Zbgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BKSM3cPn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.1
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AD3606A319;
	Thu, 22 Oct 2026 06:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15AD3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BKSM3cPn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YapkwCc76B+Qw+LbsFwo/WYDVXFBZrhCzZqVsVtr35XGELYjoNd1z1M0ySHmx+da2uMbIn2DPCiV6gy9OIAKhlZhRi4fiYfKohd5pgUXWjiv/D+l8GWV1zZKjwIjxbGRHrwy1lN0W/L3WzfE//snnvicyviEhagYxwhdhm9mBGIH3h1Og+K0EeBE/bGcgAts8I6wSbFUgcTPqpQXEMN2tgHEnDeHczi2VGo5kDCvb2mkr2jTvuSE3yibM6O0jlmwMYUq3PIgbukiFWpawodhL3JlLsfBZWV+FIN3ht5VFPrPTvd3FL8zDrT0MPSsYDE6Z+YYevYCO1kZ7b3DrUBroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRSqRQM3yZpMQSa/Rf1zw777k/CosxTuwbwSOO8Vjbw=;
 b=dBHYt+DXujVZWrh2mWzHY7Mmg9PE9Juop+oqA9hC9N8nQ1Iz5vIRcwaBDSOVpNWXuOYhdfcfAdAYov6C0brV+cR0/VFpXw8K1SVG9G88jFcz99ruMJ48ClKWjHb0Y2USR7UMVI/hLq/+2FRVNIzNX0t3I3n3KO+2YNhlc6jhsJSNh97Oa6jCKAZRl1wjN0Or73S3zkClOXrKd6Mfhxrj+cIm5yUjn/gsfOZEbhzBDScEclnarHi3z3aO4Ro7FLC/jcYqsTdDxvKNPfbuyn0MIZ5l/FL/eMfBG1exdVLlJLGGZYhWws9Y36OJVkbv/0LYA4DnIJSIuv9G5Qrh7xglwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRSqRQM3yZpMQSa/Rf1zw777k/CosxTuwbwSOO8Vjbw=;
 b=BKSM3cPn1aHTY4Kw/3cUSzUWZJGCmFU+VhiEH1LzQdPJ8dEPJ8wHUbku8rEWoCW6Lb1m6TiHU7YoBTkltxaiGpdlx9DtxPLYTiSGuzbJBFgeV1SCSUZXFoUgnODM9iGkpAgqCIm+9ZEzE3XxUfGXjlo3/RC/9M/7wo1Z7MUrREc=
Received: from CH0PR08CA0006.namprd08.prod.outlook.com (2603:10b6:610:33::11)
 by SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 06:09:00 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::1b) by CH0PR08CA0006.outlook.office365.com
 (2603:10b6:610:33::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 06:09:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:00 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:08:55 -0500
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
Subject: [PATCH V2 05/13] ASoC: amd: acp7x: enable DMIC DAI link based on PDM controller selection
Date: Thu, 22 Oct 2026 11:32:15 +0530
Message-ID: <20261022060724.1814741-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SJ2PR12MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 68017994-7e6d-4a46-8ccf-08df3002f753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|18002099003|22082099003|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cX+OxbC+K++uuJIoVccqyh/ggCCg77OfMyQyDiwJX5IzZWoJbae2M9hufOfsqux5qmvyQg9KpG+cbLPXlISpti1vUKegfvroHqTaH+1HPfLMivfrmqpZTlShJ+yXxEw3B0VR0CAbNT7zWAo/AYK1sIDNbVSBQ/+OLU4mkIHwI9s2ce7NGRdoSc26T3HFLYBZNFMY92w6rMzgw2uWJxZyH8T83QA6lD7ccrJC7pqTEuJgs/l+P+9HpFunqNDNsHFCQQCt2wIcInHpy+ng9VWJ6LPF89egm/BmnSS4XAKsNs/39DVqGMyu/AtP07ptZge2dqPZvvS7kMWFuIigE6bCxZiCIklqbPt2qI9O3gws/4fv53OcoKeVZAlcyuxWNEC1G33bXLCoWH9s4V8qohp2UCGhIitdk2va427fI+MTbDn/D8bJmlOWo2nl/E7bvHX0q1vrOwsz/VsquRL22nJikLrQrBvLuDXows4AcnTJZZn/AbxQNnIklSZjB7bOZhTiVh1qkDwEsBwm9AA9650tGAm9MQqZz16dYeK25BsyQTzAF0jwL4VV4s825HAMuc9OgKorpe38j8ivVOR14NJVjcHvrrGM7cxr04yLlUOjQMByC13G7camUq5CUGZc2j+SPvZHQ7iYtmpkDy0aQ5oolEKO6YeMXzGpgSHixvUdddE8NyptA8yCSztOZ4md2pgj6wAcd3jO/GHGPfKpKtQgRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a8l14e7DM73MXyBE9lxBvvoHh+TioLpDHPFJejDOYBNdhAIsosZzmsb9Uy8xWp9porLt4ovIJVPy6HA5T6iSwMLp/0usPChjyJPgUVO7CddKhkY05nOANY9jotWwe04GW8tKku2VIFdIxSia3i+TDX9dDhpnp22h6nXonCnBabr/8R7MCEwVoybHtCO8kAY5VR1SCHEE/3EMvNLup1NTq5q5lPxvUVEeRgyALc6lydrMOeLi4HCLniE56QRZAJNQHlESW36dzUmPPLTFedb8Z+nJbvwzsgYQUcPe582cLjyJi+lfZ/cUxxEQ5gnqAqXLks2KcXspKLSjtO+YyWGwv09gvVaWKZMHfacPgW5ktFQtFHriu+Tz/a3A+gFPFfpG6G4TAXNKilR0AJQCqMy6xqj8wSXrO/wMFLmJ7z+TRE3D3JbH3y9PfQ7aUkZc22dE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:00.7107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68017994-7e6d-4a46-8ccf-08df3002f753
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8690

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
index 41160f47b1201..ac4c9e852f671 100644
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
2.48.1


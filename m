Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353735;
	b=BpUa2iJiN4BeCXp9TnF1mRCQMZXkLiCzCcYx7kVKWNFYlGoeAsOx9g2oZ/64PGg46EiG
	 A7M7LRZLqE+BRLgEQ+MgcHZWZlYNOY8Yo5yVKkrh7YYeOae8sB3oFuxsICee5l+l8nFJO
	 5MZhY55fMdfX9c1UJTQACHNSxmP9Mq1jt2pXRkuoWFApdgkOReCNOMBn0kRKbTsuor80z
	 12bo8j/21KY5AzgjNukxSr5wimBiOdgOvEhlISUJ2TEeuJZGZBdZqE59/f9knO3wNDZpy
	 6Q0CXpCLLpDhqKOGgSEwKlQLlGjCiShoOxW6iO5DEcJyRR/M+ID0jxiOsOGDdh+cncA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353735;
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
	bh=hnNIkUyk3KffEd7E88p3JhyA8LB7dPCurIedDp4vB2A=;
	b=iFLr20U7K5UB46o+DLkbj1AaL3y67IWx+h7ZyuFLxI7s7ZeYtcd+Tv9haov2rOU4ochb
	 Gv4JpcSUSkgasqTUjzD5NPHis2WApcc1ysghpwjEx5IWBFea/pcKGXphRK7yVkEqz4ksB
	 OHBhfYKxuS3hb3JQ0itPqZq9iqof9vylEgK5ry8INV7TvT9dV6p4Zl009llO4R4fUE2TY
	 zjGlFQpUM2Ocaj32DoD+ztqW1ipaf2Rw45WeHD7qpGj+IuU/geQp5q/i+zBm8V/suQrnD
	 N6hlissaFXqv1h0UUihMwHsWBV0VZOk/ftCTMHjJ1RWY5xXBqea3p3GL57WfZzpcXzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pVCTrjb0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.39
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BB606A332;
	Fri, 30 Oct 2026 09:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1BB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pVCTrjb0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxOqRSEFWkxYKB9kVAaZJFbhhP8Smq8f9yCVY+4XqEyowJPeswzxO3U5gdnG+oA9zL7XLKvN/tsyN5fzcuFMNfK4xFi5GkuO11jp5wsc+fnF4yoYU0NKTsyDk1ogvfFovx+kMKviJGHSr5/+lRwb3Km9XcC/DGljOEzzDe+pfum855J4s2md1t8cqfyNFX0DATwn5M7n8aMg0LHanwotT/imitnygjoPi8mvAhVP1fieRX9wIc+cJ74feUsRP6yn4Xw4r8xztmueK9Gc8mXFiBmp/MoYxdlIHe7Fy7FBIAaIlfNF7H7A9SqVMzE3QQliCW+oBFzBWt3JqzAgRwPKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnNIkUyk3KffEd7E88p3JhyA8LB7dPCurIedDp4vB2A=;
 b=Y01OTm7qeCEa1QxBhzLw03zTotaGpQZ8vH9d9b/Q6w8GfzIZVVFbbRDW48dDi/ZclTPIJBnv1dz5uk7DCJuD/yGzmwuPOk7rAM0ZRf/cQ3m1JqS8ZDUdLT6f85HA1wawoigP9Paunpfr5bP+GvphW99aDSeb6kZjLSGYFwZDdVUkf/fKn6JBTkOvKFiIkzUmlhYRUyCQ0wTFGHTBvdZBQCDmgX9chotVIsDETdhx+iuLjHdoP6XRC8qDELB9joOSjwHGJHZIeR2GP+qrHrvzcn6wkiaUO8l/HEIzmp9CCFMO2i1Hix6vw1iKgLeG0k8PZrOtyy6AnJzSztSTK2nWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnNIkUyk3KffEd7E88p3JhyA8LB7dPCurIedDp4vB2A=;
 b=pVCTrjb0OVqVo+jg/gVVtJAIfOi7NHw/S3V76L5UlFkS1tR4VYd/r8xxKS7VnquL50/R83s7XoW7NR7f88IwjQb80Am+sm8yfYsJzH8bzty6iB2RiaCOSHKWQ3AmYoiFOhwVhVswbK8owCcp0Mx+hzfhQI55qzJJv9Bjb7pSERY=
Received: from CH0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:610:75::7)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:48:52 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:75:cafe::9c) by CH0PR04CA0092.outlook.office365.com
 (2603:10b6:610:75::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Fri, 30
 Oct 2026 09:48:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:50 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:46 -0500
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
Subject: [PATCH v4 06/16] ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire machine driver
Date: Fri, 30 Oct 2026 15:15:21 +0530
Message-ID: <20261030094714.1123396-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d83ea0-465f-4b5e-d51f-08df366b0139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	m5D+Z7qu8v5lwEEqJvelOj3j9g6MYZFnK4YHBQwaj09drPak290Nm/9dvdPMcKI6/ExozwcdXcK8mQGDTrsIn8MW3jcp3hkAJoeSoH3Sb4qxtDnQQV5mHTJkgCHsXzKX4erCSRjYex+hVo0KXPAIYfxJsu+h/Nj6Mx0XWkTsCJuO+AoYGd9QgpyxxamWV2U+fBswt7AyfeRYXETbnaiMX9+7oWJ7iEmC4AsdkAtJtnkuuyPb7PWE5MfAnJPy7lm9+8cxTARXqcnhWMmRMvKc44UsMm7zKEtUVX4AVq1VgPBpSi5hWNtaXBgG0TE7ErV+yE/vMaMvVvnd6WQfsBBdTKpHCbyKqz11V8pBdMPBWDAX2KvnGaZtxaOc8rliiQLiA+4T9n4FGxpWIQiFqe7CjZ91IbkXkmSentXi1pmMQusrBVBw4ieMu/MplnAfWMgwvorOES7Kckm2K44eNkUSCb1WCujmkMJVf+gLcxhJdtK671bOcWmxxk2zPUcO/fD19feLj3rvKYHenOK/H8qFgUx/GCKqJLbu05XLbsz9gJjeNAeHM1FeVN3p3aEhXCPQjWNYLYB0+9maZx43Yk9RmnZ7ChjfXHKF4XtzSKqxXbdJS9wSz+gJOopFZytxIXvYP5rKszcINcBZD9c07vErSDy7a5fNHPDFRFuw8dTEtmx5y1/HfWvuFpo1TlkCoI8XrARX9wcwTSe9UBCRQKqDAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2eK8brcB/8KLJLKSlk0+AqDkNDsIMx84mPAR1wfNj7P/M7z8PBWZIjm+Z/NkVz6KS1xixNRPqQkZPBDTrUBHTNlB+rLIYSasqzsWtl/CHURRhBkfjPQj3e73qubwaHPNngP/3ycuj9rSpfp/s+ls+z2b74R+4TcQtkdnKc9pbhKK1rCf7Ak0Xpcy1jbey2QkKy3Rw+/rgpn+FqK6cHcYkNer/KWVJW1McFriUW+xVUJns5wsNCl/mrWHasssqmmeHjBVtn4+AdzKaslcOdRz5mgUAmKewybFs7Be50lz4ptiS6WvhG8JxTFfcpwT2I04rAr/uxLX4VnEnfls85gfufX5k3Sm4Se+hG7pIFb9lA9h5TCKm3FQxTQVkEBnKtRjX817OvmQZogJ8m5q4aIcx4oxvYtud6sySTsjwjnU6jQrcV0GiVipQJlIWvbKErH5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:51.9447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d83ea0-465f-4b5e-d51f-08df366b0139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

Add ASOC_SDW_ACP_DMIC1 quirk bit (BIT(6)) and pdm_sel field to
amd_mc_ctx to support per-controller DMIC DAI selection on ACP7.B/7.F
platforms.

In mc_probe(), read the active PDM controller from mach->pdata
(populated via ACPI acp-audio-ep-port _DSD). When ACPI does not set
pdm_sel, derive it from the quirk bits after dmi_check_system() and
quirk_override are applied: ASOC_SDW_ACP_DMIC1 selects DMIC1;
ASOC_SDW_ACP_DMIC selects DMIC0. Since only one PDM controller is
active at a time, DMIC1 is checked first.

In create_dmic_dailinks(), select the SOF CPU DAI name based on
pdm_sel: "acp-sof-dmic1" for ACP7X_PDM_DMIC1, "acp-sof-dmic0"
otherwise on ACP7.B/7.F; all other platforms use "acp-sof-dmic".

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c   | 44 +++++++++++++++++++++++++-
 sound/soc/amd/acp/soc_amd_sdw_common.h |  3 ++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 97b2e224492f..34a71f7a8c54 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -265,11 +265,31 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 				struct snd_soc_dai_link **dai_links, int *be_id, int no_pcm)
 {
 	struct device *dev = card->dev;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
+	const char *cpu_dai_name;
 	int ret;
 
+	/*
+	 * For ACP7.B/7.F platforms the PDM controller is selected from ACPI
+	 * acp-audio-ep-port and stored in amd_ctx->pdm_sel. Use the
+	 * matching SOF DAI name ("acp-sof-dmic0" or "acp-sof-dmic1").
+	 * All other platforms use the generic "acp-sof-dmic" DAI.
+	 */
+	switch (amd_ctx->acp_rev) {
+	case ACP7B_PCI_REV:
+	case ACP7F_PCI_REV:
+		cpu_dai_name = (amd_ctx->pdm_sel == ACP7X_PDM_DMIC1) ?
+				"acp-sof-dmic1" : "acp-sof-dmic0";
+		break;
+	default:
+		cpu_dai_name = "acp-sof-dmic";
+		break;
+	}
+
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
 					    0, 1, // DMIC only supports capture
-					    "acp-sof-dmic", platform_component->name,
+					    cpu_dai_name, platform_component->name,
 					    "dmic-codec", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
@@ -378,6 +398,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 static int mc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
+	struct amd_pdm_pdata *pdm_pdata;
 	struct snd_soc_card *card;
 	struct amd_mc_ctx *amd_ctx;
 	struct asoc_sdw_mc_private *ctx;
@@ -398,6 +419,10 @@ static int mc_probe(struct platform_device *pdev)
 		amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
 		break;
 	}
+	if (mach->pdata) {
+		pdm_pdata = mach->pdata;
+		amd_ctx->pdm_sel = pdm_pdata->pdm_sel;
+	}
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
@@ -419,6 +444,23 @@ static int mc_probe(struct platform_device *pdev)
 		sof_sdw_quirk = quirk_override;
 	}
 
+	/*
+	 * If ACPI did not set pdm_sel (no acp-audio-ep-port in _DSD), derive
+	 * it from the quirk bits. ACPI takes priority: quirks are only
+	 * consulted when pdm_sel is still zero. PDM controller selection is
+	 * only meaningful on ACP7B/7F platforms.
+	 * ASOC_SDW_ACP_DMIC selects DMIC0 (default); ASOC_SDW_ACP_DMIC1
+	 * overrides to DMIC1.
+	 */
+	if (!amd_ctx->pdm_sel &&
+	    (amd_ctx->acp_rev == ACP7B_PCI_REV ||
+	     amd_ctx->acp_rev == ACP7F_PCI_REV)) {
+		if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC1)
+			amd_ctx->pdm_sel = ACP7X_PDM_DMIC1;
+		else if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC)
+			amd_ctx->pdm_sel = ACP7X_PDM_DMIC0;
+	}
+
 	log_quirks(&pdev->dev);
 
 	ctx->mc_quirk = sof_sdw_quirk;
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index c979adf4e978..07837a2cfa54 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -29,6 +29,7 @@
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
+#define ASOC_SDW_ACP_DMIC1		BIT(6)	/* select DMIC1 controller for ACP7.B/7.F */
 #define ASOC_SDW_CODEC_SPKR		BIT(15)
 
 #define AMD_SDW0	0
@@ -94,6 +95,8 @@
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
+	/* PDM controller selection, copied from amd_pdm_pdata at probe time */
+	unsigned int pdm_sel;
 };
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
-- 
2.53.0


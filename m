Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738428;
	b=u6HTuKIlqm6sH5hoHD1Px+S5FtKPvPorfjBdQe++S5QQE3Yvn27XOJimIhKxS4EFzvei
	 aTQa1htIoaQUbih1TZ6Cqx/8SqmDuROxt4FTipLNSUM27ospsoa7P92UkUUlvGuJ4Pz1B
	 9kyhTQCb49cfiYWUVwF8IatYmPjDVmT6U7vaxvSlDMNmklCbQ4r+MfWQvIV7DzV07Vhub
	 W/ucUvo6rQ65tel8KW1BKv5QMO3yWl+cK1jwWZkIZPG7SpDTaTMTs1Dls7BfwqATOyZe7
	 hCIfnEuEqP4cTawwUNFLCk9cfL3+x4/eqbYqFAg5tgnwPASIrgF5J27YFuLGo0vmRvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738428;
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
	bh=PSKT15OEDl33rqDUZaLPBhQesYDgdNUpgvLA+eNh9rw=;
	b=VK9mhgskMabXTsEU74vtryPhM2/EOMLn60lc6V/Rse47kJDzesxjlBN6GUDJKLAL/j7G
	 tR1GF7GzAv7Rwc/cmxuVVWXWoOpXG1HMabz1to/VVlyT8RfrGwvlby+6HzlTohPESHEvJ
	 qaur7ySKiu8a3fT/uXuwcZPJeed9vycWD515gHcJ8S8f1y/P124eXi9DUeR1m01LpK69Y
	 ZtYnfEdTZHu1aAS1w7O3PV3ou/8Ke6H/lNyliiE5CVS9zurRHwm/DPiQxQ9gf7PT50WuN
	 50l9zePqRcWMTMnPt4Dwd/zGlXPp4sBqrE23t/M4AwFhsd3jpLrcgZw+CL6UN5W+Y8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fkVpZO5C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.9
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9815B606A31B;
	Fri, 23 Oct 2026 06:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9815B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fkVpZO5C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIp3oWWuxEWc/vmtGJa9/o5g0JfoKy9oGXn1DYlHBdxp8vb+8M8pRzNNIkdyLDJPD5QhGfVUmgNO1l4sPOZ+naD+rq1HGTpdLqCqzCYNeoxoJ89pgDP80QzD/E4FbqL/E8r+HrsYycOuIUkVJifZT7qy5tDsqHXSF56jQAJbbeVmLXpJiV+QEqysLEbuAHtcoD3d3Fmtcygcna0xN8IeLQygKDx1yt25lhEKpPbQMQnZ2qfpGFZOVTU6uLxiKZYJJ/3SXX3sDhvt+hp5DBqgKnmLHfivtKygGC764fU15HSbIGYnpmbvKc83wDvWpV6n3OtqFoJIDNt9Ht/9ZUsbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSKT15OEDl33rqDUZaLPBhQesYDgdNUpgvLA+eNh9rw=;
 b=tubDN8C/Ml9uui3y0jfah/QPdge9Lq6Y3nurjQmzkb6+7ZXmvE36/DaKSrwJlHHoRO/xbp5iStjZEcS0gf2WBkmoOtveYW3SxRyQAnya5aj7MHRKiWjE4nG2LRElvomXexB6/z28wfAO8vib585VntUESzT6Cp5HX7Foa8JKRYd6+gW3Dn+EFcb5mlwHjO33IgzSbzkNdND68tfw1XW7p1t5zD2pEhkGVVvAv1svncakIo1FdpK6o3BUAXa5dXjt2R+Y1d0VLbAYo1Tu+Rv88A/qQJXqqNcl9AZPEhE5dVUMI3nrHo+GEio+NkCA0ohQW3MmPCd2aSgDS/q0iL7MTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSKT15OEDl33rqDUZaLPBhQesYDgdNUpgvLA+eNh9rw=;
 b=fkVpZO5C/RGeGEMF79Gv9wSq6A7AWlRGRTaenDMa/Ir4mq17ccwT7OWkj4KfXBVMho5i3yeZMZeGFmKssIDTNPVzc8+Kz3anX3OYUqd6LbA3o8q1yNLC7ARZCxw7A5/APK864OODGHSJH2E0lPJKfe+6jBy//C8D16d17evXP18=
Received: from MW4PR03CA0306.namprd03.prod.outlook.com (2603:10b6:303:dd::11)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 06:53:39 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::1) by MW4PR03CA0306.outlook.office365.com
 (2603:10b6:303:dd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Fri,
 23 Oct 2026 06:53:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:38 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:33 -0500
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
Subject: [PATCH v3 03/13] ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire machine driver
Date: Fri, 23 Oct 2026 12:20:39 +0530
Message-ID: <20261023065216.3473883-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc2d61b-804b-4ee0-b687-08df30d25e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|36860700016|82310400026|261021123027099003|261022105027099003|56012099006|260925021311599003|260925021911599003|260925022911599003|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jSy/ZY6VkeBI7Yxe34LmuAPz9bfI4FeN3ByY04kXfIAcNb62kOUiiaAb3VWB031OSJeX2bUBAsW804yGorMZoi0PCVW+DgMjMn8rHKh1+OtCpOnnFdMqS9x8dNBQ+zA32xofTp3BB2YSia02ZZ/p2mEchFNC98MBbjlvKhhiiEjDpZMT0CIlrNS2xI7V7FUmOOzDanahW4GnQPcTDmrYjPxasW/w0ehEkyP6dRNqzV8WxONfY/chtQUdVqiFiiPU9vJ0h1XDGZRFWukwgWJANtzr/1ixi44GMUIgPf7T1qduZU0Mosj54QtnyPI0RUTAPLo0/USkyvPk3zjYmadktbnw77EUTqPdR7K8WOvqgOMT4xMv57zsVTAznEaEaY7GHiQEWu/4e/kkKIbNX2qj2XeqvUpb+4ll+LfdWLaMMx62E5w3bqEZQ70eCWb/qiZqUcPEH0dNBCjC3ZROXRR1aBYcUWLB3nYmLCNyJiEIr5QLYS7BAFGRpHcTu+TirKReYKu578iJAAGXeZMPVemVX0B0kefRunMXvVoJTVwkAM8c8R37QYICcpnLJCBd2w/2UwzIcbRWp82JqOMOdtqrTF0RdLs7JG0WJd2EpmVlpTNLBGEqrdl75oGg/upTC8zkL+CQenk1IiX5RjlmHXTo35EZT30MIVLhfkJj35CyEkXM5YECpUfkFRk4WxXVlMV4c/eoSoLeDV1MSeIxjChObA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(36860700016)(82310400026)(261021123027099003)(261022105027099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACQIAlWV8xJ+p8WqXQfzCaFdxB3kfx8VyYYLsckA6SUdUFJ4yfTxsvM9WVP22juYQtMvvybaH7NxhnJ9jhpDGMh3G3jyOeLesJ9M2pL0PUtKQRYHRoZujc4pUCOejetG8/h2nRXZsgdW1ZLuqPaMNxe1x4sNMPoWGLPVyI3ZPoWJxlF/AiaB73fUcXHbeHmQzuMSKqbivokievomV11Ql7CixdZ3Fb7v1MLgRnY4nHE5bkUgUle4nNkSe5e83FlsyL/TS4CwL8OQdvfIxy6U0Qd/uvM9qv5rwQqSsSp5sk8dI86a+zWU8E1gVicXt2VeH10h0F+tvl6U87LF8hIwOEUPj1zzbNazdXk8D/uvGTWYVF/cNIWTnYHJqI5qZqwJ9eAXo5zrFrYYndfP5BYcfBgJXMXHhJKMS5cNy71PrYqVfxtJUQV9epaPWonRbtPv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:39.1230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc2d61b-804b-4ee0-b687-08df30d25e42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655

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
index 6855141293e34..afc5ac679ce37 100644
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
index 9e4c86bed3003..86c8e38a19bb1 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -30,6 +30,7 @@
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
+#define ASOC_SDW_ACP_DMIC1		BIT(6)	/* select DMIC1 controller for ACP7.B/7.F */
 #define ASOC_SDW_CODEC_SPKR		BIT(15)
 
 #define AMD_SDW0	0
@@ -83,6 +84,8 @@
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
+	/* PDM controller selection, copied from amd_pdm_pdata at probe time */
+	unsigned int pdm_sel;
 };
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
-- 
2.48.1


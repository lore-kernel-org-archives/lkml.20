Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738414;
	b=yHCJNbVScwluaeGit4PEco9xfs9H2TDcLVvZScDI1KewejdalC8XrJm5K+lAcyurNOEM
	 MiFgg61WhquqmIeXIAt0QGc3CVawnrgLE92yFrNJ4zr7gOnbukbJahDRgr/naZEG7d3Ph
	 ikQLldFNvsB2ZcwERHxxBL56cXOfm6J7m16uFTWnW8IirCJFW9VWQ80oVvRUf40pR08bM
	 8fu41vLsE4CvfhpL0UvU9uqKoMtOojNK1aQzg+5t3iL4VfyJ4YS4sOMm84BTtjpFjJZxW
	 wugz/tx5EC+MvFtiMwQSti21fg47H0SRpZB8lqSHDBb+MA6SgrFuBG8i+zZixX7Nlcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738414;
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
	bh=0LRNJpbQ+fV3P8N+iK+VOukEtIWc5Awe0abppaetwas=;
	b=m2dZNdnZkTG29dLclzgyixDfSPb5EZrdP/HwhUd5V9Sl/N0imVHRbZ/iuaG9lnB0wHmA
	 U9jZlzi6Xg1jfG3CDZY9Bwi9800weXRBQZ3uuZkhsdRFTYyUO3t5wmXvM6RtTwoHAO3NS
	 Dxbg805Qtph4oNwuJ//io+PMKMNHo0ASxwVmyYFvmYqJ8Mj1CO3y1CD+vzUOQWxfWyJ1N
	 lwLXCqeQFg/MUCZ+wuTEWEjToUx8faVDkZ8dy+z2Eege54URkiJ3FxlwIAoJJNsApZ+s4
	 WioyVHgNqsVDfwlajfh29cfbb/cHDhmMypfUBgCFB9Kd09JZjOwNihFiJFnMV4X1w/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TbrNQALH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.25
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C1606A31E;
	Fri, 23 Oct 2026 06:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TbrNQALH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW63vq6lKxXn3fbZtQ6BLig/RRqlCiHfIkiENztPcV8TwD1ESmZSBENV9hoXpbFaFaX3p25Yl1ST3lN2EohZdhmQ4xU418ciO5IfJYUF97QJTmsXYSd7XBhdDdGV63t/pxJb2i8jykfSVZxmfVnEUajo8wDstmLVFCx/KZhBkdEv9AHBU11Dr0lwE+t5ZeERvyNUXyLBsm7S7iLjSd5kHLrEbI4IOJ84HxcZ2rbqbzmvXDA5sh3pMBf4jLdG8XqWPCZsF42bTkc9xfCMiv9tlfKdg3LREFP0NM980QudpJUZRTuQoPDM2b8nETGI9mw1B880bOOY/DZpkG/t50BgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LRNJpbQ+fV3P8N+iK+VOukEtIWc5Awe0abppaetwas=;
 b=VdLE8PZumT9gL9fKJWzx6oVSXK+IDz/C2mUsQ+Oz9czATVzceLhC+njrsmQdAOqjq7K+LxBHtjUXMxsVIiPCmvnkXR4Bm2LDgJaPbPFLkQ2SDqVY7HtQ3eR1gTWTY3U8UwXScbZxCu26BftX0y5pBf7n919wtVrP9ijSPUHf4YuvGA8p85c5N2z1qn3cpWrtX0csOsGcVzWYeFqB2jKnM5YovnyZxE5ks2tbjtSbBencijX08XTeK58neGxh6fu9NWgrHAB3HdMlvUIKamt3zELwd/vuPYStqTWVblzZCU7iqH30xT4VPIKeSU+dqUlWIFV5liB36HbVJcc+cmogfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LRNJpbQ+fV3P8N+iK+VOukEtIWc5Awe0abppaetwas=;
 b=TbrNQALHqun5tf0ZcRBkxWR/0qxuN5eABl7lYM+WbAWB5KlzRBpEZuZpUPnODY28VClLP6Ejq0B1NlWjnl7dHAZ/E4uO56FfLXZuzMav8F+GbaYCESx0du5Ip6KEVI6ml4HRmngkZfr6XwhujTCjQtShYQsK8+rnLI5DWY+8Rnk=
Received: from MW4PR03CA0034.namprd03.prod.outlook.com (2603:10b6:303:8e::9)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 06:53:29 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::5b) by MW4PR03CA0034.outlook.office365.com
 (2603:10b6:303:8e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Fri,
 23 Oct 2026 06:53:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:28 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:24 -0500
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
Subject: [PATCH v3 01/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
Date: Fri, 23 Oct 2026 12:20:37 +0530
Message-ID: <20261023065216.3473883-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: d21bf89d-b044-4f40-f652-08df30d25891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|7416014|6133799003|18002099003|10067099003|261021123027099003|261022105027099003|22082099003|11063799006|261009223027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3SfXMHBuo3N/FImQ4KnuVXmt8Vkxn0TuR7KORK+4DuWBJLB//JsGMAlF1oy1hSk5xG96XgKq0oYwRhH1o9uIgECpOMjyDWYyY0oHo3VzppD9X819OLYXFonEVEZMeciE3NN9/ukIbBYvdDSn5ymqeSAUKVNLD8ledLk2X19f9UIov+s4PZb7LjEpQXbPSlua/s+Ga77g4F7m80W/urll+aE/CPPqmRDijWW7GdEtH4yWzC4em/frvcP2UiUswHlrWmORVOpWtQ88C6l8MyIIVg05XmgIBJMTCNgJUIWvere37oW01WKdEvLkTRigvOEHa9B5/DIqZt3JgD2HhrAt4WM0+D5wADCDz6hpDxfGPcwi/6/sHhKbtTvflmMZEVWylncfn7FeN/UZGsvXnw3+YbIQ39tEdV9t0uCKXFraQ74bFyvbdm8EUMv7rqy3bZ2giljCstpPnTevqgbIkLpXRtszE1Fl2Lgv2zC7JM2iQnY2Gsqpasqq1Ut6brH+GrDn0N5aXIsOrDdGI6vufYW7qarDVdhkY0fqeYbmDqFnlIWXAVRBTH+jT8VGShS+mA5kqc0gBgAwHy56NmjLlbwYTWMmlEUZnxF5eusbEVzuZEpZYI7sgL2A4ymxb/spGZCY+qi+Ye4NhGmmnv9/ogSR1Jv8rNMmuefEbpYMbwzXERiO8/+qjrVbICpVMkcTvbJs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(6133799003)(18002099003)(10067099003)(261021123027099003)(261022105027099003)(22082099003)(11063799006)(261009223027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tsTO3m3NpYi1iWgWp3Wv0vQvu6E3RghnF5XNp1N+KM8a422MMmwZ5X4MSmHvvvnAiJSAtQM1OOCe/kB2/cg7Nw+xPdyxzvrA8Ia7yTHL3QVj76icNtWZf0BSd+UmW3AZlolU90y1v/NoREsHBHns6Ah8bY15A6EMnoHzxCNXBPCPfYF2gvM3eor0Q6rxDLGQTt3egoUDyNRJTwe+fIm3wKUNTPfeFTBffHlnMD4VYtB7EoKhDowj2eIUuCJ/nY8uXH9tX3oFY9+sXlpkg2fVn8nKUvGLbaKSorpAGP7v94nJWUcX/+XlKCm4LXseBl4SC3k27eZTF+npTUyRLWEhwLLJ+C8b9RoIRLsGQXI5mhCJ8inMfLDD3/xQgl/xXE3o/EWBP+M8buS7AUePk15nMfuT8QS/lARaLbKBfOoiID1rJxbYw9T+7MAGe30NkS7i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:29.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bf89d-b044-4f40-f652-08df30d25891
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

ACP7.B/7.F platforms expose four SoundWire managers, whereas earlier
platforms use two. Add PCI revision constants and ACP7X_SDW_MAX_LINKS
to soc_amd_sdw_common.h, and set max_sdw_links in mc_probe() based on
PCI revision so the machine driver validates DAI links against the
correct manager count.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c   | 10 +++++++++-
 sound/soc/amd/acp/soc_amd_sdw_common.h |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ec3e1f5f1052c..ad8a024321dfa 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -382,7 +382,15 @@ static int mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	amd_ctx->acp_rev = mach->mach_params.subsystem_rev;
-	amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
+	switch (amd_ctx->acp_rev) {
+	case ACP7B_PCI_REV:
+	case ACP7F_PCI_REV:
+		amd_ctx->max_sdw_links = ACP7X_SDW_MAX_LINKS;
+		break;
+	default:
+		amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
+		break;
+	}
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 034c9ab6e4ea6..5b9410eff56eb 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -17,12 +17,15 @@
 
 #define ACP63_SDW_MAX_CPU_DAIS		8
 #define ACP63_SDW_MAX_LINKS		2
+#define ACP7X_SDW_MAX_LINKS		4
 
 #define AMD_SDW_MAX_GROUPS		9
 #define ACP63_PCI_REV			0x63
 #define ACP70_PCI_REV			0x70
 #define ACP71_PCI_REV			0x71
 #define ACP72_PCI_REV			0x72
+#define ACP7B_PCI_REV			0x7b
+#define ACP7F_PCI_REV			0x7f
 
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
-- 
2.48.1


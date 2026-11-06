Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970581;
	b=R+9m9kXnBAZVSNLwKIeoxoPvJZDiRRW0z0NdriynmgEirrek7fp6ehwEm0/FS6FvIBjg
	 RHMsL0gWBsyx0bN0jRvqsaZfGuVQ438qZKqmu5zCiFSLfJ9eAnU+WZX9pgv874/bv4W/e
	 UaJyymmlDox+EiwvtS4OURnQwWcjY9mmSpWq8nvLmgIyy2STcmouoh2pk5o6q3D1BwPBs
	 wbmHzv1UtjvgSt4XJh8ikpinNfcZhf0L6sxoBESV9FHVXivB4NHiSL/arFnbaKmWCKT0T
	 KfxrmY+wBuVLuQ+5jaAxIVjTiV4H4BLam3lThr52YLAWnQHIy8kE82uR7m6ndu9Piqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970581;
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
	bh=lzBpCKFbDYsh8blKc2pumbkoQfmuj4eqLhrPJrAx864=;
	b=zyYGyqRhTJ30AfXev2CE+GR9GeMs4ff8WE8ATtJm9vzGW1TUdPWCzkO0FrkYNufsw7Fl
	 UfQTFt10PP5FIST/LAwM3VvxO8gggDZGz0AdndSlQ4sgnKkEH1ykcypLyxTTRvlh7vZl2
	 q6bHP/tfm0DbMTVTlh2xGhaUs6ihylFHysarWD7noNc23FLXd15rhR36Wyoza526lh/2Z
	 fJpuH10j28F3NfuEN694NfYlnVcEjmE+SYh6kOGSKvYsgLMOb52tqS0E4Dv63jUZfCqIZ
	 IjRt+TMuvC/GpPyYtYA91QDTwsqVXev9JOJKJO5eJvwosroCFLgaoHmyFdwBaLvbyUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L0JBG4yv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.16
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC0606A326;
	Fri,  6 Nov 2026 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L0JBG4yv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ/9sAfFrYO5A0INMRFQzZoZ4lZtFEE7bapxXL87pEGL8w5zMWM5512a+HuKWUMFVO/+L60TodsShJzpiV3YCIklzvMOIUEcWhX+HUIgNr3j8zjLEVkgdrbmZ0CfTjKJwJIE1k3696c/NEVApvyBR7ZIvpcu1ROKN1+MEY+sG/Khgv/itqbYPmhEtCmWQZifVYWORfKPS3nFP17dCdMRnQfNm1UbaHkGBpJX0DU0qwKO0mA2xHcRYvFbHiE0m+yQm8fX97SW8uhfpa19qGKSVPidoJ1BiHCGp5ty40GC9qLK3JjAFlW1ly1x9s6nsNRKKVozMlg2bXIlH7K+moirFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzBpCKFbDYsh8blKc2pumbkoQfmuj4eqLhrPJrAx864=;
 b=aNMh/I/7ewEuiummPh0fsVqDkJhPjRSXMQs6UhNDqnUajDePVQWMDrWsnRZ8bvCkP8aMuMF84mx7LlAinEPpxFL1jfy4xxqu+o3Kjq127KnwGLGaQvwkZBAXU13k20XtF84XEuVR2TMaBJ9GyFZwqEqvZr9dHIbe3ihXWW0FcznVKMgwnYi0rBQNxrYbyiPA0cvoTxhUzr8ZYyiON7n7Dvn/UWkrVTZifporRNN129wdmzWFQWMtWSpzV+F0rEX3lvv3XNPgDfT/UqHTg78PBE9lTjyTzGTmujn395OoYae+OYapXlLDDqxq32ntpwyZllNaDNXpGAtx3YcNwjXAlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzBpCKFbDYsh8blKc2pumbkoQfmuj4eqLhrPJrAx864=;
 b=L0JBG4yvmUeKcV6r4vGlxa86S7uHkFu3NuD3+2FTlF2VkkZXbX9ymNP01Bv4Ik8sz7EIUxLLJZze3yKxMAZxwgUeL/KjVBeu4rvcBQbjiGGwJIr/QCCXbLQr6yuo0G3g8PwjpiYFLH1Nn4USeRgf9SK/9mWZQUt2klu8a7j/418=
Received: from CH2PR14CA0047.namprd14.prod.outlook.com (2603:10b6:610:56::27)
 by PH0PR12MB7789.namprd12.prod.outlook.com (2603:10b6:510:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:09:25 +0000
Received: from DM3PEPF000265B2.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4e) by CH2PR14CA0047.outlook.office365.com
 (2603:10b6:610:56::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 13:09:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B2.mail.protection.outlook.com (10.167.23.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:09:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:09:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 07:09:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: amd: acp: document PDM controller topology for ACP7.B/7.F
Date: Fri, 6 Nov 2026 18:37:29 +0530
Message-ID: <20261106130801.506026-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
References: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B2:EE_|PH0PR12MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 447c5988-cc4a-4554-d7b8-08df3c072bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|11063799006|261102123227099003|261021123027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	90hZVLj5QPU+prihBvzTd6Dsa0byHXFW8BVgXdHdAH2FpFaD4ay9sbOOI5raS9rgb96gmNC4MdpSzATOjTqaAbKy+1W6QWBW4L96CkQhxDdx3DGMuU8I0p4rYe1hUUAEv65EW2AutRz6W5mFr6RZ4eSht+NzxVmXk1eqcPKiRBhphzqcyfNEfxA/XgQKQegQtEA9J81gugHbO681bP+z1hPvm8rB5Og7Hw845t0daDsS92zImK4bRGKZgNyPJjL50Rq/ilMJNa8GLO0u2ThXsRv0hs11a2doVkXT+1IoDmrM7mL+vmvvLduXFpxG7nGFGQOgV3GwXj4JpYboZBN7Pzk1NdiqTdE4d1zn4Q6e6Cel5GWF77Nf2ag53d9+wvbtxmMYRD1jyB6oURh3LqZiekvsSETs1N1wytjPJ4qP9+6DqcHRz/pnao0Ru4HmNUgApm+H4nIP5pIGpf85F2exiJHLFg1BAXjdIHwR1YYuF+FqP97XCYVNbdFHbiy3JCVZHjltIutEhDZJgIzGlUw+UfrDNch3QJ2Edo4zOXYHM/kniogA4IRkmDp0O0+TNPY3V15UpCVLtP5yIhflbXyR6n1Rl+So0PhfL4JP4YIbNc9X6xykz6IZssUCsd3azxyETMKtBJC74TWhEjW+nIVuWxZL1XyRa7lRs1z+BMHkbPG9nfFUoA+HGpf5DVWQVv22OssacW04ujUsrDhzbqDy8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KsUYw4867GS34Gt4VbTMJ2zHDUH2PBIIDeOznJn/sWWhaGonYjYeC/oXLa9P2aoJKaFwGj9ZaUos731GmIMOtD8Mir/VSE/Wtx3LqYNu9PMNSyjlMxn1AQ9SQFs5qXZV7xOJIa79jy2M0SP+F6W448aNA8NQjBWwtCk5yXPK47rYtQIFM0p7OWauETQUuwvlrYORldc3BdfaqkX1Z48K72K/sEYhq/DKA2u1NxDbkGEroqTYCoTkpUbe1lnsBOgm7AXSFwgS3OE+hTTAh5tDQaG2Jjwsw+9JenOm5vy/86HPWToT5xlz8wxssrnD/zEG4DCkm0WqUGf7eTwmtw3c/4+pE2Th+wRhpkY4UdxszPj9f2tsyNm6RxL3vpjk4aWuk2NoXSioDpwQc1snTf7Ven4UnI40MuN/nQaTDcfUdoVtOj96YmtF1MBCnUCIDh2I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:09:20.6707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447c5988-cc4a-4554-d7b8-08df3c072bd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7789

Add a block comment above the ASOC_SDW_ACP_DMIC / ASOC_SDW_ACP_DMIC1
quirk bits and annotate each bit with its role.

ASOC_SDW_ACP_DMIC (BIT(5)) is a generic DMIC-enable flag used across
all ACP platforms; on ACP7.B/7.F it additionally identifies the PDM0
controller.  ASOC_SDW_ACP_DMIC1 (BIT(6)) selects the PDM1 controller
and is ACP7.B/7.F-specific. Both ACP7.B/7.F controllers support a
2-channel stereo capture path, and BIOS wires exactly one per platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/soc_amd_sdw_common.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 07837a2cfa54..21b059b74626 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -28,8 +28,15 @@
 
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
-#define ASOC_SDW_ACP_DMIC		BIT(5)
-#define ASOC_SDW_ACP_DMIC1		BIT(6)	/* select DMIC1 controller for ACP7.B/7.F */
+/*
+ * ASOC_SDW_ACP_DMIC is a generic DMIC-enable flag used across all ACP
+ * platforms. On ACP7.B/7.F it additionally identifies the PDM0 controller;
+ * ASOC_SDW_ACP_DMIC1 selects PDM1 on ACP7.B/7.F instead. Both ACP7.B/7.F
+ * controllers support a 2-channel stereo capture path, and BIOS wires exactly
+ * one per platform.
+ */
+#define ASOC_SDW_ACP_DMIC		BIT(5)	/* enable DMIC; PDM0 on ACP7.B/7.F */
+#define ASOC_SDW_ACP_DMIC1		BIT(6)	/* PDM1 / DMIC1, ACP7.B/7.F only */
 #define ASOC_SDW_CODEC_SPKR		BIT(15)
 
 #define AMD_SDW0	0
-- 
2.53.0


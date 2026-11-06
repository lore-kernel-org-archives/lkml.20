Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793992618;
	b=fkTRMCnFn5UbHCT3aGAQt5AIulTSanJBDZXra87E4CrKt49CJnz3ShWMzv0XqtcNdbo0
	 NwQx/bn/wxFME65iDa/Afx0N4RESe+Fhr2HS7+lM1iF2qMZA5DQpmYIRT206nmwwTouwR
	 DKq4It6KUGa2yCtvq9s3z90huzFAJIBnu/ZKJ9M5R41fsQ1RKUOyDkx4/qzjCDgIlr0UK
	 NrEx/YKMTeFOqgavHt1EPE1oMmeiW8Gpj1k307uBhku0W4FxsT9C8RYCt1Z73unyPje5Y
	 4opJAXQ7vzwXi1vPG6kfWdCIDRMhy4fU/K7uGP6E77lNyoAbFjcysfco+sfMTsw2WMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992618;
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
	bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
	b=5nJ2bqmcoL21hnhDX8Er/T/6pyqixWV5saUL5Opj56zMwytt+Y3VzVNfHuAOxpXir+uG
	 Fo9SFY8yV3S4ZOLdbaTQ6XdGvDrRK3dAxqXz9jRdnVMiGaFmDJKaTsCHU97YU7evUsyWw
	 my+FLZSvMOr6KgMpvoWEjtGzzfAYKgmGMrQzwn2683aDq0DK5DA6Cj4iTWtUgGOrjE3ok
	 CB9SiGLeWICHxh0hJqKAafbY3mCNCdY9seyhY0Jp+pgd79k+DItcHnznY7bPghXnqozWf
	 Ii8CElYj8niCiWg4MxZl9O2N1A2wm5hw3W3Gytv98bTl5W5DrtGrxtRggfwmYFGiJnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1I5t6Ch+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.67
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B974606A32C;
	Fri,  6 Nov 2026 19:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B974606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1I5t6Ch+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCCz0X3y+g/xifEimOMCORzM9Ae7QyjQRL6qO5u3oiL7Tm9rBgm87FmFeuS27YinKCTRWqz+44N41jEXHoL0DJdIL8xNEPqG7zPdTzZMBljDj0FYInJ30pTyuNZ7wd8R8fd7NcWQaL0rMlOV708VhzkWRiph8B3mDfR10Kd+EqozwNiC4+GMW2u9h9m4CBhSw5RRJXSEwE+iang6tbpfyPFEiZ9LEujYOHMg+yNe3FmgRDTqiYW+uvKXz7Gwox2ivgfq239tKaWaI0Wt80KELKeKCeWLEAWzn7UZO95nLdub+5fFOFO3S4aQdrFCmweAysTRgEuiaF+WsGDr889dfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=Q8Wl0qA6kZdNjmBC9AqCZewwsdqJ6VCKDPZztlyl8T1IYa/eZed57r1BPa/grNssEKwKYf4O/Y5Tkd/ozai3iClL0qpHh+RdJEHFt+S06GwHLSx/+Pf3BneTMiROL4Us3bpNWURc/DHPvDl3xS6hi93XJj09kQFkUSd5h0DQb7SaYzLxfeky7udRt43DPSQ5n63S+EOo7WpGXzMSnEHPkpg17tjk1/o2VTLQaQUlj3nNvDAXoawDx4fnpirfH6a9u+g2eRYpc4dhi8UGQ82J0Z16ARAH8gqrlW0Yj9chySBczPizwTqKC3vZmTpyP4qsq/eX1vVKYIVfDls5GSBqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=1I5t6Ch+GDDeZamug2j8T/DXjzRtp40jMON64Wb38YQ31SzpiDeZJTYLvcvTBD/FCn9VXC4bRATNWCBAOro6PJfH6Z0S3wPCZFYGr1XZcwVrcJQe+fHQLOkTVDAE8z845Qo86goNPRGZvrXzMSzptCUIlsyvyYC1p8Zo7MMCDPs=
Received: from MN0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:52f::8)
 by IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:16:53 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::6b) by MN0PR03CA0003.outlook.office365.com
 (2603:10b6:208:52f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 19:16:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 19:16:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 13:16:53 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 13:16:53 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 13:16:43 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Aaron Ma <aaron.ma@canonical.com>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms
Date: Sat, 7 Nov 2026 00:46:11 +0530
Message-ID: <20261106191627.1590542-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106191627.1590542-1-syed.sabakareem@amd.com>
References: <20261106191627.1590542-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ccae24-ea99-418d-e1f8-08df3c3a846d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|261022075727099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FsjFt8meWl0JoQYSPJauTxGRaEG+TeKWuCJTbSGfhUxnz65T75Hg4Gz7YBh68c375f4sAMe+unHIMGVxa4nFF4eo9suO+XCsyIQdpfEcpkS1GYMjdXZa5rlYTm2upyWwo25wqKACQEUDjBX+7v3I6ewoXioeEwx2T80beOWMzK6uKYQxCxTNFflbvZQI8VQwk0aL8os+0jYNCZTgq2BCFT6Li/cXhzTxg+FqG7GvEDiCnSsKGDRVIfwiCigz0al899VXFF1/6le4QzNg/Lf8cyD2BCIJ9DC3QnIP77ey4taD5s2ogesF5ykB6KbT6ueboA/1ViOUMCovydP/AVephD3r93MVd6+wtIM+kY1iUM47c0x6mQcU1mMg21WEc2DbNJ4I9AKXbda+qkG9Q7mltcEJu9jl5o8FZRU1mTFtHMGiWhCmHW7cYKbnR0+Q3p6YSu/Ub6DA2HSyDUEwCgs1ek6kO1h81GMBzqD16c41/RKqvZVCb4TeOdFKlOcs+UnZT1d5cJbFLiXfNyNgiG3KBff00dbBmAN06cmylhKi7LDg6avKcc3mPWTQyNYfmExP/IMxRpl2ZwBsB1Ol3OO71JdwbDXDLbzz59QtIJluRJSqnTWn/QUozMfkdOaZQ+WMZ1teDhSSbpUBAzv1WxkfcPOD8dGw7XE/U0ie4J1bW8D9KX1WGZ2DbKVv3SlrIfXc2wq+MP3R5397z17PIUB1MA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	abFJqwUPLgXa8lVxIqnlEonghomKgaddjrqpzF3pTc9GVEa/Nd5P+Jkkt8KCYGI4Cn+NGTT2svMk64+b2Ifv4/dYqcC98OjTAGWLfToHIELqp3Y6pre5XDpTroc3gVoX1dZqJcdjNkMMNsQ7wpX0PPR23Y/ZDte2cec7G1AS7LpNBN9W340cvZSRVC5cjfepCBfXJI+s1brJHlmvJpf0KcHdL6zyIkz7BuUphjDehI4mFwGR3fW/Rvbyxbm52iJP7NW6AitkrRKvHtgAFrkmNfSOpEuMaFEJgFelb85F+NpS1jZ9f0KUv0XG5onOyPMo8IH68rxCbq4TwV0CBHF9GG+AKeaQWpW4p2ffXDcshebFZeYG+V0kEQDgZEhELGsMdQCal2N4oYwEEVRGyp7A6WzI7dXg0gBhaShzG6XkwOyz8XG3BdhZmpw1mF3BfGAQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:16:53.7072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ccae24-ea99-418d-e1f8-08df3c3a846d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

Add sof_sdw_quirk_table DMI entries for the Dell 0EF1, 0EF2, 0EF3, 0EF4,
0F12 and 0F13 platforms, setting the ASOC_SDW_CODEC_SPKR quirk so that
the SoundWire speaker amplifiers are enabled on these systems.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 1d7487c87265..4e21d85d4724 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -47,6 +47,54 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)RT711_JD2,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EF1"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0EF2"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0EF3"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0EF4"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0F12"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0F13"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794079702;
	b=Hms56ALdvNAHVrBwPjkMF7vWR9P09altHoWbRz2mR2iUENSmuRnFxrE8edw3gJuHpxF8
	 svfp1iunWBqk6NI2+FXo+GoXRjFvZUy2k8ZmWmcjjOFvYjuxhCASqb7lkj8vXMnAI7kD7
	 GlFLw36BUaFn6TFxqQRRjVWnL5AcdzWHRAiVxgtG2zR//yYEw23vqgLO3MsHhnpliIEtO
	 SCGQV4w6U036SyuTI7s7UYJw6C074Ngs6IDfFBnSzPx0gLVPIrMI55IZd49gC/dU7C3bq
	 yJ/UQdpDSFRcJjumTbbAhpbfe9BIZh51VwdyEqexVIP99GyO/eSiBcgi1gtb6Pa96xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079702;
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
	bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
	b=M251Hyhef5tg+Mms/0otThH7THLCWg5utdpxhf2jlyvcYiDKwJPKikB4mzkgJv4bzd5p
	 ASYh/3x2oiRRLlhJwA+EclehMIM0g63TbiNNO0p/qT6XOdiPkkLC4Wk6C0PV8dtHi08D5
	 BFkG/WTlFkvZ6GjB+0KM5JSWfv+MZpIxuLN+I+bDZe0utVxofXb3WDm1gsS2/CY7os9xk
	 nNQzbk74hXOFUhvYkoJaLhSfjHH//DmIdhpESQGYHki2elcg4cAlp3+4hf1hteVjssCl4
	 Mszb4LlnFUkGsXnfqQfyBlFMPjxQOEyRYbfgKpmtCQd23Am1XkzfZd2QmQM1uFaQ3eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ep2VPW8P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.8
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF4606A32C;
	Sat,  7 Nov 2026 19:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CF4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ep2VPW8P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0h9BNOmQsYJJR67EtnLRYyqUROQZjPsLEwv1gUmLhqKNf0O6hXwzZTFTBCPpBhTxqF0RqS5c1vY0ouxyyobugWx2qSLA1ueR5M2+30fo6PrWIRRAaIzMO8sROMPyIKA6hAxAUG5/zvWMVoEcCihQ9yftFJXPpssPDhYtQRrbOhkYlJwalmMt01Bs/JZ1h2f1j24X2wfzURY4BQvJWd5HMTlFbOzkASgByR/qBtS8EeVAy/34BVY4vM2ov376+mL15jFVTWXO5d/8ZOKsYtN+LVdb6SgA/3WIzNzVhcBOIskIr4VY7ibJdtpm/NNDcw8X9dJnSfrThzxXlvyXPYYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=GAOAsm98xjfmdJbXN5VGkpgbzeXKrfCVX+fRh0Q2fI/pWkoYf5YeYdOQ3T9eioWtC7IgGXXKacUQeHeO77zIusIOl7P+x3hv4YpZheeUb/YXnbvmdl5juJZ4wH/SaKXXUOcqxSuGhqvPNTeZxc3xgD6dW84M3+DrkUHV85BmzNh+Z90uK8c9SFXQL2fOqkouGeoTwV+PpArcO+n3F4m20XDAAbc7b26sXpjw8IuiFpDsaKMdm4Ir4szHdjnaE3Mh/gRxsERaJnkyLQW6er59CZ1cuaGxdw+OmS6VmlWvoYM+sZb1GP0/NU93B/GNbadjh8QU0piZ2nYaLhfxp1APDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=Ep2VPW8P9mt9cNVaLZrJOag0J9TAecs0yzbMmu5INJZpR7pwiC3k7AQX9X7ErvitDGxTZ6rBt38gnEp5jW3pQaFk40D9HXr5nb2mlA5gdcOHHeU7BLZSHAkacJiKWObzcTTPakP3fi6OnByDo4Giyi7+ok2IB/PQ56PzanEUrLc=
Received: from CYZPR14CA0011.namprd14.prod.outlook.com (2603:10b6:930:8f::23)
 by LV2PR12MB903269.namprd12.prod.outlook.com (2603:10b6:408:40f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:28:19 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:930:8f:cafe::38) by CYZPR14CA0011.outlook.office365.com
 (2603:10b6:930:8f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 19:28:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 19:28:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:16 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 7 Nov 2026 13:28:07 -0600
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
Subject: [PATCH v2 2/6] ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms
Date: Sun, 8 Nov 2026 00:56:58 +0530
Message-ID: <20261107192744.2027264-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107192744.2027264-1-syed.sabakareem@amd.com>
References: <20261107192744.2027264-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|LV2PR12MB903269:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2efe94-834b-4f86-badb-08df3d0546a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|261102123227099003|261009223027099003|261021121427099003|261022075727099003|261021123027099003|261026121527099003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cJxt5pSZ0dEBBlJl9rnFbNOWJeL+/MEHVFSvgt+lulqd72SjArXO0Un0Cn3dREPJvlSBmQ+EUlHWIhJDPgBT48uucrMTAIz+1oG4vvJGJbUJNVwWxeBTGr7rQjlXNdt0DpBUEYQsEoVG7vJFDfmcpB6C2CTC/lycfD04V9h/drIRcd2ZYi9eOwUCAB1HWs5d0BJHkqBcfOGRG8U8umEOO9v8MgZv/29Jqnh4ahyjf605eeJcZ+29g2aFjOpAEOQmY6HJeJT36SzwJs21893T+FbjEFjw9mmn++NHGUc9XEu/cw/2kzdZF26oy0Dnr/HQq6N/0AEVNoqrnPYSU76frdEaX9+oi9GKqLh9SMDWHpr5+qDnPk9Bd5HKhuyqSPLH6d3uGLXD3SNtb5ziGG/zH3xpKmPesyLox2hWXzq4EASoqTLEopQYRG0bHLrEYF+9ynPAFa1iCb4dUOe2XX4tXptd7zd8BRuLIeodus3NgD0KMaQYWqSapgFMw95JT4icqbIVDzPjKPMbcsj8SVpJ1jpW+7C0kW+fujDi86XfEyGKE65taElo39ytGnYKu4u36xQle3xy5sAcz0+yzjXtbRoPCV60930gSWVhOCkIkiyIzss27aJjSB0f4D0P43X2T+XGjOWTdGLNZthDUCYy5smN6bQ6QU8r3wg3xxBxImUAJTGfuLQI8Cmcn8ghBuVKthkfYU4SpOW4j5coImRYzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(261102123227099003)(261009223027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FS64f4zKyk5Hb1Gmsu4lcNi5xEa53aQDMmAi3/EN0B+vsfFNlzGgDM67zhOnpeZJHodfBzsgBCSZHAK55CM3dYoM3b4qmmJ6tk2mk9wUe0POXp1KskePISYHJhXUG/m19Ep0OcRED0PBELEC7zSonHRdbPceo3736EFfL1Z9TttC/fu46I/eX1+qMpo6UZdygnJleiqnEnAojbMiBdu7SmC4YOmAVJR9k3o5ey0Bjfp1h6aB8wHYwk7EPwokBtZPFluapz7OAxcB1mZE9FUV+LD5fufuzZG8IyFfLSRpONNupjcncLljH3rWnBITofxmt3gBXzKS04AEs2gb+rwQMp6PIxxs6HCrM2v1X4sEtt33bLJ+SN+PQFwwMWPVwPrpdVFmsUNzHL04ZAI3wMLnW3c8WMHi0J325N8PnqRVY7ZiBxJfD9TtpacRjTm1yyeM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:28:17.8147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2efe94-834b-4f86-badb-08df3d0546a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB903269

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


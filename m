Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166325;
	b=gDO/MRtPsPmWVFimvPfO91NuyOAzS2Jeut0XacBTuhdXeDmu0hGVrv0CIKk+jC+mTitG
	 jdJj0qbxeUQcsodPZeWEEm5ry0ZDfWoopKVj54rpR52X+9MzewWEbtTzjH9odYClypFdT
	 k+mTYZsqbMo+B+mgtMYZn5ar5r+qI+Be3wE1zIkvv0GYbk03qFTEAtgvEiXFSJeZ62WAw
	 JhqdxH28nGFTBl1rz+0PQiVmipvJ51S7Elq3MeXQMC82spb33K1C8WcapSSkTfo3MPWhm
	 bXfiKbaEkjSqxJ64yTKoEDNTW6DYAxzkQlCiRRxx9aq5OJTaJqcszPX5yUpEgfNWmng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166325;
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
	b=SSFWhObM6fgIJ80kWALdX8S+7r36zB1julmRKed2vxsla7N96/ReF7EUjzLBuBR3BlLv
	 sjulJe9RcGrPuJbS4o3xJRSQwpo45Wrw8dAotZ2XUzoH1hkwQPrOJaLo/FryzHjuwArZr
	 zWVpuIUI4FEwEeG44hknTzkY8PN8LYThj+/liSWw+CgrvFIl2ZGUQaNwPvSrhApeErefc
	 ZJeLv0pW8jSd1xT5fV6P7fm0tT4m2C57gtSA+yInBxOazHEBn/HGf8K/d5j7Pcb+zdbNJ
	 yuKSNrZoZtHZaL4S1RC8KW6secDVcG8zevlUU+mzQDCNGRmI5iqOb5NU58qgt+k4qbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0wyLa9OQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B49606A31C;
	Sun,  8 Nov 2026 19:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0wyLa9OQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/qsSup6GFM4L5onMQlC42fxzIXDYzC1RO4wIOhc7D6nBCwBylm46xbYz4UGkH5jvgDlj+pzuVfhpp0BTQkJ8+amA3TxokpUKP1+zU+6JYrTTcmNaNdAeJLyQrxKLwQaVOhP/gKVacpKaTvwJZYnwGZVAHuyDRi7BeUR29/v86S1dDhNoZGOvj00UAz+1UUl+H7wYBEOtjHb5Kd95GuV69cKu0wyf+A2377J+fpQmOjW1IzULddBy138GWfdE0TuFEIwOp8FFihn9AuWJkx2aK6+YwxvNY34UEsxP3fZXOIPrFPjAO3RxTM01tMzkusGsxLk3uRjDGNFNy/G3d212Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=jNJVYGxASzTI9o4o2feFydZnFpeKv2T8CgiF0KMxy45cyFY/2r2EudxuxZzQkyG9WLGKntQQvyRIuneEEUULyfHFNS+/vH+WPJWiV9MXk8tdeXWpm3UEM59dGN4v9p0h0/xFghmG2k89vBEJfzYeL7p8pZEg76i6D55JMck8lgtYgfBtrL571CoLr0uVMyz86m53lUJV09S6QUFmSiqPpVBN5I5tRHSOkTLICqqew6MCEBrXnr7TAhSIlJnXt5IpKuFmNXO88KdqiKaML7jKr4w4tkwHCVRnCUNbPOcJdZIfIwDOyyypfR+QJglA/ZTF5wff1BjSPHL5209IzlyoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HUtdZJ9XLLFCha34yuudb7CicOBsCnYTd+vd0PBeFg=;
 b=0wyLa9OQMK90HginfGb4EQD9LgtzfA8IYCAjMDIwYMvhoGqki2nRn7Af9PR7cho83rX9BDg/koCD3/A8WdP1IBHwjgLmzuIswZimIQKqpyI4UB4Wbjusc+x90FjQNq7BwPSWBJMeurzNnO4wxzGib8N+vd0evV7/Unr1LDDaLyE=
Received: from CYXPR02CA0091.namprd02.prod.outlook.com (2603:10b6:930:ce::6)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sun, 8 Nov
 2026 19:31:58 +0000
Received: from PH3PEPF0005961B.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::a0) by CYXPR02CA0091.outlook.office365.com
 (2603:10b6:930:ce::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 19:31:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961B.mail.protection.outlook.com (10.167.243.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:31:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:46 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:45 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:31:36 -0600
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
Subject: [PATCH v3 2/6] ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms
Date: Mon, 9 Nov 2026 01:00:30 +0530
Message-ID: <20261108193119.2308421-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108193119.2308421-1-syed.sabakareem@amd.com>
References: <20261108193119.2308421-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961B:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d99a22-6157-423f-f342-08df3dcef407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261026121527099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aKZ7ewr1LN0zUfLv7gDMp9quE1gWmRT7ser4ijT7qjaNa4+6zpIze/n2K5lrh3kgFsVaXL5Pdyg5CvcLlcwcbdkRuQRWL8L5B9vcwgXTwdRTks3JQpjkzUFW2BJJHVgUHF/U/Qgj5IBstF38+hIfxb8E0seTmPzLkbEGGrV3w2PWqTkZFT7vA5dvRoDzDte3535vUGn64PQZy7lLHe0STW4cQH64Wu9VkUdimmsnwXOu/C8gP6N9uZnNYg6bX7MH86H6WBLq4/1nZqSmnT6lobe7OI6Fee+SJ34TY1COlst8zQfzAgg55jVKlQ3Q7H0OH92kbD1yPvc/Ant4MHTS7CZEhyj8ebFn3+CrH+GQ/fGsoNbYmH/7HBA57C9ZOgUfbKlaZijUNxS9srxg4tsLPiuTWwOViIRyofBi7uutT+rOzzxNr+pMKzMcckeVG31UZQ0pED/v7pLBj8VdVfWKw6i0lepKfWlf0TkiYl/WsUrUyqiVHTeZvdG7CyfciUApdOGiW2PmGPi+Aj6ick3h0azDC52CaL5Yj3Of6MkLvU/sTN9a0AFwWDOHNWzodK+o1tfAw0lHJ3/dSDu/n9eop6uH/J5PAL0LMoaWW05oy+gK5k3qXpQIJsif2IK2CTOsqDtthLrsR7GlklD4luQYDp2P2DD7J8lmqtVi/DNThdXfmvMMYpkyxc4hkkayGmrd2bLtoGZyM0A4tvHvb7Zakw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	26Wq8a9lgBJP+rrupvC+7kB5JLOs9t4XOnORMXDXyXx/A7wHuEMLsRXcPo+oV2W+OHAMqke84f5+zMyhqPQoq5c5sEwvY16v8EUnPVpQzShL/Z4POXeWbwhGvQboTaCn/UkWbdynWDamBvg6ltNGKsn3JUUiygqnpz/0g7/i6Y3+btY2SDUuo2tGd+WMuKLA5daKwi0zp6yoy2WpyXqYGxwvXt1kDqP5fchkHe8wEXWvMdY1q02Wm5xF53bGGUUVPM575sa+klWk7AvIAUlG6NN8thkOpxbLi7P/ph22xvGtUgLLDzIEpHsRNFk7Fhis/4R2NKcuWqYO48jHwNq2g4ZwnQrBxjVrIdeaWJ76VNedRuLoYgAS7DrcqLEo1UG5oz65KcyGXT5O+Su5YNdLYLeIlGLWjgDXt4WSmLumAj65mdk3cjnQmPNpIJ/qRdRL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:31:57.5911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d99a22-6157-423f-f342-08df3dcef407
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549

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


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166360;
	b=a9fjvLLkmOcNEMMA6qgzyAnhPS3LCeGHp9KPmvBoLbpNNs3LbEWIOuAFpzLBiwrl1cUQ
	 7QnC0M8E+LjLQyPkgmqlMsLrw//JpE+e0FN1rPdKcV42dUh66voaDtaqDcas9zf1/B+hZ
	 m1c9iS8pJKnDv9N3bPSq9J2uxNyRw6OaFoIoSNBMPOY9v2wOgtdM6fX7zT0Ut2uk+kaW2
	 /JiQVErTi1RyZDoxLgVIgBaeNAXyV7e50FuavstRGPxTC4DPb1dgXTWk1ZAlIarGoWLED
	 2WMZCZwOAa7d3BCNdFORSvbjtZepfo35ep0bifzzwRbA15m5BK8QevcO+2KEvjBA6Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166360;
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
	bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
	b=ctQUxaz9Zo8b15NXh5HPtv4IkDfyD3cM84PAlyXGiGDiv+j4Dg3THRIPL1cYRzX3oXmy
	 Ec1w7NTxpsTd58mgIkIAIQKlb26/TBwTk31TXRqM/0AiEqhtkHbCg4uAcupWan8zjogQ6
	 4YSfQzGnfjLUyYTxeKg1r4jJ7Y8/U4m0oHdmYaetCvWx/hRwDI0bxjUgfRGe+WPrRM3et
	 mEPEbS+2bYAb4lX+Zm8BOfU1oF04iZFLwovpdPh+Il7f7tydMsJY5J7mz4whWdZ/LvsPU
	 RhY6nIRr6ZqsOyfesXzvnQbdI9kWaqw0VR1iIECMmo+8pHwKLufXfcyAP6W8Tpr1/sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wOee1uUU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.36
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B64606A320;
	Sun,  8 Nov 2026 19:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B64606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wOee1uUU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0LWAgGgsPlT3/3TG3vHjKJSLbtSh1prMnbUB4LBgge8w9XG8T0D8CO4I56N4Pd21BF5RsYPeHAhoDXLE5htLWO0r1XSDt4rZZuawdkF0eiTRuwoQJ05RnDjvV9+hRWotvD0HifPnBVXUqUSmCukr1CoWxx0PdmlrgT6OLAFepDGaK6UOxNJP05/inbdvaq1dxUNnGJTDZh82DaYVkIXHFk782pRWqVHiDFg/RlE7OEMAdadHUMUasboVGfLSi4azZllZETCEQlrNxKZNJoPAgvc6YWAw1XjLX6WgEpm3/CQFLU0v0WNvcDi7KDP1+xY7CXFbNamJJnEOTPZecz2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
 b=T+ohC4qsx0tHvK74LwvUmYzbPwHn7Hs6vJs5xKdktofD/aY485Mmtcwf//aq6APs6UhvRCum4BGlmRlTT06ppVPq5gL+GiJeg2NzPG6WTYIj8N9pTP+s+3dM8wqWfdKhdyhkfYCqcU2k2gj+fYtDclrGWOIn3AM08Pk6F9DVGNlH7I1q4LilB7ndgC6cylmuE8dCQbKUpYJGbUcJ93ukmBR3ndukukFRgRTE2SL5sRdhR8bmwUfY4HF7zR7TlnxKdJ3mxSylohxnR5dtvI+7T4CoV3BQDclyUV6IFDvFBd5tVy3vUd+fUm5nkx2LAZqRIkiC2WkMNio+MuwbpCAaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
 b=wOee1uUU+Xa1t4YcYhV64HDasANh4VjzIHL/jdpPazlOD5ZnNEobd63K0jVva/YGxSSv0CDJ3/i4CufOTOMyXxXctWgbltn6YMovqzftWUIK4OR+z4J/YjHLyAeei8yH9lCowJkbMPYYfg4Yb++HNQyQLdXv+9ohE0puRPcUz9Y=
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Sun, 8 Nov
 2026 19:32:35 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::38) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Sun, 8
 Nov 2026 19:32:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:32:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:32 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:32:23 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "open list:AMD ASoC DRIVERS"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] ASoC: amd: acp: enable function topologies for ACP7.F SoundWire
Date: Mon, 9 Nov 2026 01:00:34 +0530
Message-ID: <20261108193119.2308421-7-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: a61b4727-076e-4418-60a1-08df3dcf0a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|11063799006|261021121427099003|56012099006|10067099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aTb49xK/WtuFM/wjP33AM3TchQzCnp/zNZqioZU1XZ5CB7dv5ADhjYomnKuW7e9l33T3H+pEva1oZPP1kEDro1rtlpf5RX/28H+w/Y8HqrHXyHHiOe8PEL7DbWzNj8V6UDRfMucspRVj9LV7dzNB11fuoPJDOjHfRDiZNEJFqLMR3Avb5BSJFXZEBpv5KdrLM/DQ/PBD1MgX/LKWT1P5YcLLgo/J2vGxUIrINfTcuuUlRwR3cld3SrQL4ofHImhEqrxViSzTqvgpTmAZ6EoJoIhFDcNM55aVQXjizpFt/uO5CzshJ+dpRVzpa00MX/BqBJfcmj9vypQiRWVZlBbIwEeNSApMqEcmVAyJkOMqSWjCIfAL5nDUtQD8F+BNtNmdCQTAdlOLyK4RfOaRkIR1PI5rw80ioxZ2uLTbWWEsFDN6ZVolh3fOJbYOYaLYpOOmD4YNA5lX3C3pA/Q+VbpskhqUWHzgxAN58t5O/lDy9WAwEP8h8o519Fe+6i3MeRncQb9OAHQmmmZGKM0mp2a9sTweQzbemKizX/7sb0p28YacuhwAqydfZrHlwsUWZMfpanPL1jWEou2OgYenJxYbE3DI02MAaZDQ9dUJZ7xpR0Xp1bjnAF+7wUUhZAogdIrDpc/RDIzQBGVjqUvzYv83zG+epYK4tEwi5AF7e/jBq+0HoDsYie7iPEHt86RwyODBhuzHifNEtgPJeya6df1a4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bohPQjT3wEkaYmbrr7lgMDpEfQ+HiXi535J/ZtTABdhP/b3/OAVC+VD1Hgle4Q3iGkslszGpMg584Yv/ftHykQ9D5+viMOiXw9FL703iHzGsiyldb+O6C3aC04YFd3emJJeuVdVjNevof8cvrKaO2byBH3CKR/k2hRuHFzOhcaDGmIyye+KgYw7fIb0NtizQ3ZkT3ELXVpVisC/8HR+A+vjIFCI63fFcNGXF3ypKF1JVaDQYSCB5lAcPpz3DN4wP6mNj5u+e0RxYuyOjt6sseA4PCt9/+DbZ72sUl4CEhqk8vAQV9MKS6BWnenwabWKJBheKj6bLzrr1JlgDJ4mRa9c8C+/EoJ6hK64YZqHV+rdS0B0BR8+s4z16gZqZ2V4ytKMGI0WLrcXY3DsPRbV475ZoXW/6g+5/s0LFr9wcRZUvnQh1d7UE1tFcSEG1xaKa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:32:35.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61b4727-076e-4418-60a1-08df3dcf0a70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

Set get_function_tplg_files for all the ACP7.B and ACP7.F SoundWire
machine entries. The SOF core tries the function topologies first and
falls back to the monolithic topology if any of them is missing, so
existing setups keep working. The monolithic topology is still required
as its presence is checked when the SOF firmware file profile is set up.

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index 217b11f9dfc3..068b11400a41 100644
--- a/sound/soc/amd/acp/amd-acp7x-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include "../mach-config.h"
+#include "amd-sof-function-topology-lib.h"
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
@@ -513,6 +514,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7b-rt721-l0-rt1320-l3.tplg",
 		.fw_filename = "sof-acp7b.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{},
 };
@@ -525,6 +527,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-rt721-l0-rt1320-l3.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -532,6 +535,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-rt721-l0-rt1320-l1.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -539,6 +543,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-rt721-l0.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -546,12 +551,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-rt722-l0.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	}, {
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp7x_cs42l43_l0u0_cs35l56x4_l1u3210,
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l43-l0u0-cs35l56x4-l1u3210.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -559,6 +566,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0-cs35l63x4-l0u0246.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -566,6 +574,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u01.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -573,6 +582,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -580,6 +590,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0-cs35l63x2-l0u01.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1),
@@ -587,6 +598,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l43-l1u0-cs35l56x4-l1u0123.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1),
@@ -594,6 +606,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs35l56x4-l1u3210.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -601,6 +614,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l43-l0u1.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -608,6 +622,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l43b-l0u1.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -615,6 +630,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1),
@@ -622,6 +638,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0.tplg",
 		.fw_filename = "sof-acp7f.ri",
+		.get_function_tplg_files = amd_sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794079749;
	b=RMWeSWuwG9w13JLZhd0W4wIs/q9LNXM44Pf92IJ+a6hl4F96pvru41HdS9eUR0EWmVWQ
	 6hVUOFEwexNl9HZqxM6cHJxMWxpYGN1GRJ5dJygcGlllQtVuT9xRxC8MUE3hLCWJt97bj
	 o/7UjhAa3molsnL9aLX+HEfJwmINWgWd4XcM+bHK3op65HZFrEDTHU9SJPd87ar8Za9P2
	 AzUMd+OHWXCGFhu7wmjjrUY5SXBTOOMJU013IhsJrNrXbhfnV1pBErbJwwhsP086sW4/2
	 QPfSQH1p3HdOxI8uZM6NnsTJedZ3EaRfP/ptuPxGhYyVLYqw9NoP1Qncac6ckF1i2yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079749;
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
	bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
	b=HMyAf5Hj32u5Vake/nhGfj0VMp7n71G/EupLqZ/2a3J189a9q/J75VGcvgSfrakRQrIb
	 l+6ICiIm1WRnuIbgOg9+znSJwOANKeCb3J6yNTv+TQ/Kw1iCB6YF7mpLH6Dkc0NSzUbBa
	 T5LsrzvJhg5+7WtBG7yzIlElUCiq1qS8ufvBBm6h8tJJwq/NDQDlphOgaPhlMAaNIDV5w
	 jd+/y1j1+9sUssqLUgea3bXjgjGdziuJM+qb19lvNdI3TE5m9M9+gqIXfD+/YF07UqrFb
	 mvoUL7AnOYJUkSvYH3C7lvl+FqkMx6aZXCF6oGuXot2yPBozXo44vcHpCfz0SE2t78w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vmg7ISXS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.69
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E669606A330;
	Sat,  7 Nov 2026 19:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E669606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vmg7ISXS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgFso5MsVBUuuFdQJg/HhhobmbSVP7wteZp1wkceCXwWUvPwxOC9hooAmZtrrQ9C3VhFJGRiH31bAN8YRYx2/eU5T7DYKJfM2vRcvR2Wamu5HLm7pnpcHwF9RKwa8TU99/0NIcCCTg4NAbqe7WKSPh8BFTg3yPhsRt6LPn8a5UHF0SjxC47CPuNT3GU7ARJy9Y5EzUtzvaoZM69uatLvJhuxnv3D/FYYt5h+LMRdDM35+uxI+uUNML7uvtLlExlE8S7RTMedG/JLqHWm87ZkZOS1rhEjqu5QCfY4ZnJbzyWGYJpcMV8jnF1Rt99gOS/+o5MNyeVUBOK3F8WsHT0tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
 b=T1d0eQJfTSaU8kF1wV/MHCNd3TcE35UD24o0Ry7yFnUkvvpqmaRnEUUSmj/fNWkM2gPVkqqrCEUXEI+X+1o5hzNzZoU/J8/AmyjWkWHm6SMd600RFRcIItuUrEjqK91FpZ0b1ste+4L043QsHy5Phb81I9toA2KJTidIB7JzCRF7SA9HUgtY+d1C8IE+2htpBUFpNBvYjvPu6FtgvZ+rL6OEbLZwfZ8C2WHvfF5C/gZnyIypPxNXCsa9mJvkVFi3lrDNcHmZ2FzjWanY7qSVMSd62nhcZbGO6kxR2+fScWV3N8JMpoL0CRBc/oPV3d/JevJWrhUVN5UUWWDrMTepQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afAeJjADpbPocD7zmdky0dQtM9sRI5L0drEjWGSiRaI=;
 b=Vmg7ISXS2oXIglKHN4N7Lk2SnPb4WDUemGHDTv7AWTpHRvF/jF3S7y8SstoofO66pcPl4mg5VQz0N5FYyU8RmPTX4LsldqUi1tqqyVYd9QnwY0duCUikVfWX5LaBqqtKl/UowOkk8BpzSsTh3V1Dz8P2AvYpPN5InY4dCDPI0iU=
Received: from PH7P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::24)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sat, 7 Nov
 2026 19:29:04 +0000
Received: from PH7PEPF00000008.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::6d) by PH7P221CA0027.outlook.office365.com
 (2603:10b6:510:32a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 19:29:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF00000008.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 19:29:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:29:03 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 7 Nov 2026 13:28:55 -0600
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
Subject: [PATCH v2 6/6] ASoC: amd: acp: enable function topologies for ACP7.F SoundWire
Date: Sun, 8 Nov 2026 00:57:02 +0530
Message-ID: <20261107192744.2027264-7-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000008:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ced5d4-153f-481b-60a6-08df3d056292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vwnjMTLZnb9atLqQJEgLLtUWsGgfRE+QHQAXXMLuOBZuk6IsLKQAwl3qGXMNR20cAtC2XkWN/aKCwGbanw1vLzchEe15YWVqx7hq0cWRCFA+1Bqy4oxt+U1GuBIBynBY0QrSZCtnRpoo79rcgVcuoKqyJyldQFBxLYRPIzMpOwOKrBOVVEAbwLbUY8m1eHAV9W/ADIw0wFyVHZ5MGDJtYEcDZDw/8V6ojEF3nG7wKcQFyWe/ev6bVX/IjbAPoLWA83wix4t6Icv7Gl1T1uVBivP43kV/050b9qiS+coB1hHYvYJFuCyM+9cWwEGYONrsiGR2MTZ17PKkw7sJRiHHHuzomZwJ3vbi8UqP7tgfdR9hLl64B5POGQnX2bLaeWfozVXl41w4IdfXbd8kbTRHkeQAOuEWFtwslWS23g4GPBH05m0jon+n8gNCf6KFywheVgnMa//TIHk6KBUa+WxUDN5g1a8VGGcR8W3CpOhJ/HmcBfL3bSSn+4OaPApJDDn5W3ZjmMaggajYCBTbNmAVgX8Hd3C+ofIr7yPlHatZoMY2JeJEd9MuKMyBstibVc47O4ZvGndADZvfm9uHNLrPCyxikewq+xo6Ttxw1CGMvfs7byoFLjw2PVMBRObYAcIyvAhfg7pylnmBIZ//ls2y5LTJX4/X5PkGvOdDpL07tjB+YVx18yHP0lt/52Q9oJHxfxl50PntcsJQ5QEfqIN+HA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyZpkY+WhULq90/838PENNGOtlECPnLtYWsfMhGMhSg8aqJKjMYr3SqXP6zpI0v1OEXX95FTWQqa/zPv53HUn3vrDEO4HGGXH0KNiIo/AWxP4hMCB8Z+wcX5Do2uRwds7tv6KjoU6I6iXFd2aGAFWiCaF+R078+H5ZZmTFxWuam8B2LfNZhlHHuWep9SKIEaCtBEKuHxoIq5HdODlkMl43eMQ4Xhrb/BOgaDdflmGFH+GJVNQnJHI/c6Lq2Y2e2dqQ7XpcW84/ZDKU6Xw7JyQI6wcOwfokkf/wvJ7o+aPFbEp2bP3tzbPLdwUQhW34x5fqARxRRNBFRWMXaLhhv4X9Y5FUvUb9KJbZGHX4cYJBJgMPb2Oy5hDfQAJGE0DezRi95fuLn6nr8jylnYiKBRy8ELVcxdnU+F857PizWtdWr1BAXjOZmEf/q5YfouvTpc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:29:04.6667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ced5d4-153f-481b-60a6-08df3d056292
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000008.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B

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


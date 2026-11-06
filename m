Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793992608;
	b=iMrNemIMXMWVVH8GCmrnBo1PdUILTRnnMZno34XVmsNwNP9ws4B7rRwOV/rMOMqQPPzr
	 2xYWBM6LbteLeXEgEuEAlbPRsvhR634LZhWdn2DrYvcpE1gHN3vkzCLMaUbKcKF6FDDEc
	 +g6Fr8gPkSypJgq5PSafLXnLgA4kNIVS0XCUKH59vnpLV1o84Eskt8+GnBPrOQDQQAmIR
	 mEukXMv/XgNzGuaJIQQFZPvM9D+BD2k2dBfi9DadWaSC9QyIc3DH2KDrsLLShVL/QvqWI
	 GhsMMp6ofYm4LsR7b92YG1cndPw69mj7LWMfrAyd1iEfv8fmuJNdcYXFL11YzDPglCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992608;
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
	bh=iObE/UafHQ91pZ3dm7/24jyQ2CGHHFkSs3nOcQgTPSA=;
	b=BLIgzyrwIQxU3Mj0wqhwZBbU17DMauKgK8UeTOtmhCWyNA+1Gotmc2FKoIMDbI8PoDJq
	 vld6H0FeNIQk105ZqlwUvQwwVlzyHv5hu6Cv0VUfIxNx1GparfnaCgW8uptAMpcheozj2
	 IQuqSUVOWVRAvBioFUBivpD8aH9UO7vE146vtCXaS4clPTohd2ZSfdxUliuOVCi17nEn6
	 HGhH/Xr8qb/AgDgYLtyxH+T7FxemKgSw2inzku27HRaiFvQo7UZDHpvbZYCLL6badyerV
	 Y9KiMcKJOMWhopU6f0SI//WhBNsuedf4uyF8ZKjkOc20Y9aB4ZN+d9oxGLgvaaWkm/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U4HH+xpw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.41
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF4606A326;
	Fri,  6 Nov 2026 19:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U4HH+xpw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9cTdrToO/caYwZt8XbWHwRyDdu6FHk1CH3cvWGfTyBffUKavV7q/Uci4lSlKOFTVHte5Ynw1jCDY3Euv/oSWbCXuSXFPTEBDqNB6L7dmQ3SabvwvkIaOCRIbNZHrgrfyMLkLsfLuGEohAIqhS6yVPBBhLBuiWFOOcMsAQj1UsTFIGyIsI+3PYB7OQWe7SONBOAQMkehWMD7/9RFxcfFZBiADMnNlEuKv91/L0a48LBCGq0RwKNWl4WRnafbbq5aHMcv5FW6FqBo+ANtWVXNcHf5/VKsZK65J7UZwKhRqcjvjR8RCkqh7018PNqyEgIW2D+A4dC/V7qRMDVdaVWiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iObE/UafHQ91pZ3dm7/24jyQ2CGHHFkSs3nOcQgTPSA=;
 b=oPxHYz5ULOcP8PmqO6gfK+3obaZUXLFwyoVMjOHThUbFbljK9O6CGFAWY/QQVzsfyWo9VM4AB+UXvUwu5TDWK8dHLs9zpUwupA57UoOcdImlBT4nUSMugMtE0w0+mPVNOnx5Q7h+1F0Vclr5JEDamuuI6KCyY7gVFXv6JHqw9vS/eNGw8Gu5+JLoobiBGM2jv1v8FRzSjuDBznJ8hrQfd9R4lTMwhte70xD3P9EzeJdIQ2KM4pAznZ+VYhVD5bjg4Fc/Xf/vB6WVgPKvp2CBA51lfvYMAh7SF8PvcN4ZYUdkTUSTmN8pRtbvJ2ngY+fpyLsAFGZ26j/aGJkScituAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iObE/UafHQ91pZ3dm7/24jyQ2CGHHFkSs3nOcQgTPSA=;
 b=U4HH+xpwIKA/qxjeREjout4AeqsfH8fGvufjuNsrzmPEYODWpUAJY8oXb0+OndMDHE3FrqqYPBYiBtbS+hihMBArEu72YHVxpNS62MYvyv7yrFOlc+IrqynPz2Uv+rCt805sd92v8zCGTROkHuAOJjzODeqXyXcU0h0fn2bPamk=
Received: from BN9P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::25)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:16:42 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::2b) by BN9P220CA0020.outlook.office365.com
 (2603:10b6:408:13e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 19:16:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 19:16:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 13:16:41 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 13:16:33 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "open list:AMD ASoC DRIVERS"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
Date: Sat, 7 Nov 2026 00:46:10 +0530
Message-ID: <20261106191627.1590542-2-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: e448052b-da3e-4b0c-2f35-08df3c3a7d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261022075727099003|261021121427099003|261022113327099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wyNlYWGwX6cDmYEpDK/APl7XOXUyCoNw1vaaOzkCtfcbUvnBvMfNPeksN/YqaHLnfJDijynE1fwuhyefYGbC1+/rdSPUYL5kt2OUE9jGDuG+loVpecq/gy9+Bx+v8b1zniZWlt5XI8cN5rTj8Mouqo1tsx+9BDaSJ8Ea8z2C/5sfrMHj0+Y2dHZNkFtoAdB0NwzVEvSzeLFoG+mxAOFZ5GSaFpmCevf+xMK4IdKdazv8ztwR3yAD5iS0snEDr15HAz2AF4bC2PbULQVdKNbZVpNX5bR2x8vgRgiJw5+9c5Zgqy7I2+h/7Wx5ivnWhMKLxz4kxgiZAQvY2bS4UPwxxhoo/6P2v1As6is1qLe2tpcr5ceh9WVHZCZzwxjjye1/VIpEBmOlNsQqL5U0AZO7XmkgDn7R0o2Pr0eGfYw0ruiWp1xVicThPmhK3mVJNp7E86TTfEUQnnA5ZkgCqJtwY1fVaXsMiGTGe86j60jqHjZI8ztt6wWX0odHYL2AZ/UViboXxFFwMUrAAc2D0hvyyDJziaJqIX+Eh2gjBshapDW38qV4HqKuEujeGDjmpj/ydPo3UA/LmpHN0wRCN7JfrnkzHOBYdNpw9IodWSbf59PXmHpN/H8qE4ySegwHl+uiia+LSwjvD6wz+KpEgFyzQxRR7w6gnBB7xclbhoRT/UDAWtNiALMFiWSeXXLV6xGlLFK2H0vUt7QqePkA3HOVhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261022113327099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wjNgrN28h9cajgEQM84UDKujqQHxfLqugmw/1T3lmzBx/vp0rEaG1DdFeQql0igADM0KP+QMziqZV+HCFH3jyd55PIvurtKPShJFVcD5n4sDjYa588haNcHvEbVUK+/GoRVnXA6fwDl3zjhKVhTR24tYBb6g9FgAUeRVwQqvNV0N6KKx5TnudrgWSoB7afLeKm+MYFLTFBR9uP8gYhf0I91PmVAJByXKYhot8bdyhGp1EG3tKJea5DGSaY6g0BsRByMxc4nipWQ0i1/5LeCsZ2g9Cw5tOsxEaeUZVx1I+fK6KJgINvthdBmrO0aKBj5V0EVp6EOt/W2n6CyzAEJhYMFX5En1EslBHUbMePN34YylzL6TbMvpknZLJ1qRYWu6dl5ketP73k7X7sLJquUBhJ9CxL/e6+FUnBzM21nv/xFKjzKdOZeE//FmsN7a3zw/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:16:42.1433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e448052b-da3e-4b0c-2f35-08df3c3a7d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

Extend the ACP7.F SoundWire machine table with additional Cirrus Logic
codec configurations:
- CS42L43 jack + CS35L56 quad amp (L0+L1, L1)
- CS42L45 jack + CS35L63 stereo/quad amp (L0+L1 combinations)
- CS35L56 quad amp standalone (L1)
- Standalone CS42L43 / CS42L43B / CS42L45 jack (L0)

Add the corresponding endpoint, adr_device and link_adr descriptors for
the CS42L43/CS42L45 jack codecs and the CS35L56/CS35L63 amplifiers, with
speaker endpoints grouped for aggregated multi-amp playback. The CS42L45
entries reuse the CS42L43 endpoint array minus the speaker endpoint since
CS42L45 has no internal speaker path.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 443 +++++++++++++++++++++++
 1 file changed, 443 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index bf11ceb7478b..94bb5f59e9c2 100644
--- a/sound/soc/amd/acp/amd-acp7x-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
@@ -16,6 +16,20 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1
+};
+
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -148,6 +162,359 @@ static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
+	{
+		.adr = 0x00013301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00013101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00013001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l0u01_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u01_adr[] = {
+	{
+		.adr = 0x00013001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u13_adr[] = {
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013301FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x4_l0u0246_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003401FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003601FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA2A3B01ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
+	{
+		.adr = 0x00013001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	},
+	{
+		.adr = 0x00013001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00013201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00013301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l45_l0u0_adr[] = {
+	{
+		.adr = 0x00003001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l45_l1u0_adr[] = {
+	{
+		.adr = 0x00013001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs35l56x4_l1u3210[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l43_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_l0u1_adr),
+		.adr_d = cs42l43_l0u1_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l43b_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43b_l0u1_adr),
+		.adr_d = cs42l43b_l0u1_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l43_l0u0_cs35l56x4_l1u3210[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_l0u0_adr),
+		.adr_d = cs42l43_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
+		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l0u0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l0u0_cs35l63x2_l1u01[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u01_adr),
+		.adr_d = cs35l63x2_l1u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l0u0_cs35l63x2_l1u13[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u13_adr),
+		.adr_d = cs35l63x2_l1u13_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l1u0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l1u0_cs35l63x2_l0u01[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l0u01_adr),
+		.adr_d = cs35l63x2_l0u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_cs42l45_l1u0_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(3),
@@ -188,6 +555,82 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 		.drv_name = "amd_sof_sdw",
 		.sof_tplg_filename = "sof-acp7f-rt722-l0.tplg",
 		.fw_filename = "sof-acp7f.ri",
+	}, {
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_cs42l43_l0u0_cs35l56x4_l1u3210,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l43-l0u0-cs35l56x4-l1u3210.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_cs42l45_l1u0_cs35l63x4_l0u0246,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0-cs35l63x4-l0u0246.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_cs42l45_l0u0_cs35l63x2_l1u01,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u01.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_cs42l45_l0u0_cs35l63x2_l1u13,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_cs42l45_l1u0_cs35l63x2_l0u01,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0-cs35l63x2-l0u01.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp7x_cs42l43_l1u0_cs35l56x4_l1u0123,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l43-l1u0-cs35l56x4-l1u0123.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp7x_cs35l56x4_l1u3210,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs35l56x4-l1u3210.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp7x_cs42l43_l0u1,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l43-l0u1.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp7x_cs42l43b_l0u1,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l43b-l0u1.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp7x_cs42l45_l0u0,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l0u0.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp7x_cs42l45_l1u0,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-cs42l45-l1u0.tplg",
+		.fw_filename = "sof-acp7f.ri",
 	},
 	{},
 };
-- 
2.43.0


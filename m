Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166303;
	b=0R9himjRehz9tstHRgadkKND4jpdEuNCbtzzimMaSxlW+Z/+fp2yOtww0H+bRLcxkIyX
	 qIy/d9GRW88yTW9109r6nvO0p+PiOTBo41xKLvlw+cRJmyKT23DxVh0JP3RCvb3+yj4bR
	 /lTp27qAFgqsadSwIIo7JLSNeE4XjqVFoBwsiVLGFy4c/extE01+yIFgt8O+7R9Nma6pc
	 j4PKxPq6bzssbpExyBdNNvio2PlaydN+DxZ+UNTfIlDZX2FfKgd/H5rWSHW+no/VGsO76
	 1H/oR8Og6Z1O5QHLYt/EYdBQel6z9FC6B06AtBuIuUKfo8umfgZlddaBc5a0evTcaWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166303;
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
	bh=Gc80ADKz6FI2OGrd8qqoMs903XFlog2cVBawog2gio8=;
	b=TlGGYVDfMLUX9RPXbxQtqkr1u8OB4wlnV3jspFTwQH94gKtgM9Nm/ZnA3n9nE0Nxg6z5
	 uFJBZaQtuhtx2Nqsbhf28EttrxUdKXc6yIMsPY3skEBucmk9YgKxg+CjLtqpL4T+yaHY4
	 8vxN1jfjvE7otrhixiC6Vcw+d4sZ+57ElcI0JCemYixRoghuBbzAPpxgWHVnOUD4mEzMz
	 BSK0wgdTV5Yk3CfRjVAW12hCwsNn3ag3DyMV9ywfIFRn+94495WD2llLNfpg72WGCpGIp
	 U7Hy0PvQFV+rxheyr6HdnhuK0yh96c7/jXMUEDP4BhrSTDUkBNu0jsDeJNdm00Bm9Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dT2CYnXS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.68
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19846606A31C;
	Sun,  8 Nov 2026 19:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19846606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dT2CYnXS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRq86WTMgYN4+umxLTiV6rpvQxQ/WgWr36LmBZshK1KT/p+QH1h49Zqrgvr3mh/oVnmdl3c+rKbOSzPTWFJCicvP/2JkyYJpFaXD0Ogq9yw8LbyESOcJo2OsZXAC/HfpH87pFEY4GaoWL9H9Wpjp7Y+Hm8AFKCVG2xwDtZyf2QqCtjxXppScOLqUxi8lg3jq95Z4v6c4f8E94DszcokeKyOpa//NgA7mrv0UU3osmK7fZUR8gWxL8UWf4hhTPFM40EvMOnisqo71Pr9LhYFsmZdr65OI6LUNZe+mSg9sWUFQuYQoMV4FAIM/21xvWlgA9rFuXWgYBvE+2/Snhd/L8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc80ADKz6FI2OGrd8qqoMs903XFlog2cVBawog2gio8=;
 b=wFpDUmRPVzzOl9U3lvx6y7BT6DMA7PCRjMDg8BfbxuRoK8zjfjvIuygNjGJd+aj0kV1exxjwX2sK6WTZSfZgg1FFjfZKlqAWi9YImZ0yLIbekePVsxbRXJPYJdwKxuWITcinOhIPbPpIFKEdIgnr0Vn0WpcPBkzw58d491NTLYf5W2V2RaKpKy0cZp7N7RefmvQ5P19MroENEs7HUCNI7R0HqXAyOBP44YUm5ebsZL3Clokkex8j/d/mfwItnklf4eH1D7TNgs4F7BUckSTnmhWP/nMvLkOLlvXjAtehiDzSa4gzQRw5BsYca5HUrmysGOe7wvCoysBBrIan8OEFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc80ADKz6FI2OGrd8qqoMs903XFlog2cVBawog2gio8=;
 b=dT2CYnXSUZuW8WoRxkslJNOGbwepSTEkBK7Wpv220bdOWUmto7b83OYG/zd6x5JevhFsYZeZbqMcLMWFuNKFN6C8fVhhh3F97G6a7IaQhHpvtfMLa9iWHL7pBuL250bw9m2GpJ9er5FdvH708HI6VKcLU45jWEFZLNT6sei1iF4=
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sun, 8 Nov
 2026 19:31:36 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::74) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 19:31:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:31:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:34 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:31:25 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, "open list:AMD ASoC DRIVERS"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
Date: Mon, 9 Nov 2026 01:00:29 +0530
Message-ID: <20261108193119.2308421-2-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 775abdbd-b6ec-4bc7-5a93-08df3dcee696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|6133799003|10067099003|11063799006|261102123227099003|261021121427099003|261022075727099003|261022113327099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	mhTEKyYXp20/U8F4f6YlOw8NBajYEV3i44LveEMQMDDyyt4qCEmzMGHRJF4Dg83rn2QyTbl4uYOxu/+RP5y/aJ29+0qjx4pu2nEGd4qwA1qmZqdX23SdSXYGo294NwTTiqnxng4Cq3vfjRyU0sOZdU12CkQO+iQK4/pfy/4fXuI90oCnvBFwEtfRsp55l6ooSmAAqgD5CcNISwiX8KT+j13pQvH2dUfqJd98x4XqobIsbf3gE/jW0Uksyh20UXgIEMBzifelqdbPw7ybFtQucfOGg1kxopDxDFzUfIUdZhyxg831YMB4sAcuEd9DKdJ6rnYfSiCdSrYon3M4x3Rah15PBObvtvKajlCtH+MTQzLIfefwhoiizNZAYCdYVUJmkLAGZqSH0gjmFGnGwujzZzm+ZO8PIwjUCOrNDex0omgIvvUJzr70qKAG5j6iOzwEf7EuyOaPLaQ6AsQw1TMCBUso1PQthq/i2LwHX1uqFuy7e7WYJib1pV6a/e/2Y846ZCzTqbXMreS/zpg4LjqXy/ve5h8YWQ1EdacsjGNWflZC0WgqID7VFVlxX3sHScZrLYH5C7HCJOx0UjwHveIO/Cuk0n5Is4cUTybWz+6ANrgtsC95qKhKaI8j0NlUdG3CfyvJvrESEaUdwWG4qHPUUslwoZA23Ht+DcY49jbJdsTAm3Zwy5sNlMPK2KjiUqJfURT9bNolZrxStSb6zzCzHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(261022113327099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IcjOgAZmmo7FNh68hEe+Vz72ip9rbIc6T1geLhjhkv4g6xQQiupb8McGzQgtsMlndRVlu28HNeIXAONxxAXEXIlwzaSW0GTCclJClT3DdYI/bIIkcrw2TlsF4B7uor3HK0UVq/Jt3HkFkBa8K8+Dtu0xxv6n17hhNV/fQIX5Uxd+jeYVn+Ta2YH6XkBqCrA2nkXIjlqM3FF4JtAzqOdDt2eYpg8L2rHoQ5FZYf6v2Bb7GdgPQzrgWcuKG0kSH0hElO6tcp+/Ha0jVRNuoTKSd4QmHW0n9Jbr+W4KBi4Y3ZIQ+C+jMU8TCROPhnKqVlG2vwk1qfYk9w561h6XTLV8UnQO0+ruRDCALj6MW5P2oVP/wOB7XkxLaJL2p948vMGj3JHD2Q5FUad/KKqy6pyZnOUzXg0fKl/eNbvMZVAQBazrsrTEn8wMPn4r02oAuYfE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:31:35.0073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775abdbd-b6ec-4bc7-5a93-08df3dcee696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

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
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 434 +++++++++++++++++++++++
 1 file changed, 434 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index bf11ceb7478b..217b11f9dfc3 100644
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
@@ -148,6 +162,350 @@ static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l3[] = {
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
@@ -188,6 +546,82 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
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


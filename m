Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970696;
	b=bq5rgC2E1TOqVQiJ35Hz2V3wg9EJS/LgGlYYZ5T11jF/Qs0/eQU3jdSn38rk2hfogm1c
	 fby2I0ayf0UqcQ0Fmm25q+viqB4NBqji+RC8Cpds//19+3czmTBu7Tz1nkQj0gD7bBpC9
	 Znu8IqG2A6TfxdwfAxp/4ZbG67u4iasZXGhi9S2Xx7VBbQZsFQD1n3NlrYDun8BOtA7Gw
	 pkJm34ENMd35wh1Y6hMIqWwCN9GvapBzYoSRu4yQe0AXyQsfWS7sHUMBN1dTpuzmDadU3
	 myImRlmiHIZsfEgPDDDosNiQ6XCOoep2y3kjEqkCR+JJ59H8vSSJ/nJYZp2VU7wnZfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970696;
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
	bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
	b=DVLC29yW7977mcZRSQEG2J7e3o+FxxNUA4mThTQSZzGKB8C1fJcGF2ukPemsK4fIcs+L
	 7cYFkhfimX9l+8RS5tAjJgorGtWa4s9UlZkDOtuRTUqrsZzDe1UjLGrrAO9XLc/8c78jK
	 TjMuUxHOOvlqxsm+k4xfkZ82BAG8GzktAsKC2cJ5CebeKW7PfsYhv1m4LtKijwzzMkz85
	 hJR41BpTh9Z/Gh34SMuT8USNz3JTHwX0b+qS7Ddz4wrPHeu1XiL7FxnPkYNUHBFZWdgE/
	 VNStv3iU/vnz2nXIgkDNOWG+vr5FVCAe5qhOg8GLdvdpg8ffpKrQ/GmRgnmKUkVV0ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gKKylQSX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.61
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C5606A326;
	Fri,  6 Nov 2026 13:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gKKylQSX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkBVkOhDR1TQNZAOvSiKLTpIt0Byz7nsYaXSPshmOEAUeGVn41HBlVPKSP4k1hUzupDJqKnZsgG6N7KVFq/c0XB4+MTV+sDZBIsDHdmw8xUUgVebd3WICwo5c6qjmoD0Mu0noUJb0E0bAiKtv89msv//XAx47mM3HeITPJgaVLt41qVSa+jDR7GoGFl1WIUqR8WrlPshMQaZ1qyzf08Uv8hgzOOkP051QKxgMM2iAqJetg6qmfdWME0ZvmVX8/Wk7ijXtMe6lPw1TQPxqSo+w3ICQqyTYRPcDhGn0/P/62l5grRVnr7iHxRkaIWbCI4P0sGWIpXsNlpJB2whGJIl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
 b=b0MWbI9FccpvZ2myeunr+WoYDtFmxMXGzHTfK0L9cLvh60xD1pn7cGMXZ8PwNgtlpJrb4gK7sEL8feNeggP0jGVe/iwNIV36+YR5DnjLnRQ5QHpyCnovv2Y2v+bHZE5nuCLDCdocZUCSBctAclbobZZdMibHaxhqbbKx2WeTM6LKOoKEsoR8nnOJOlbGw1pr29wPf92ebkoeicZsfX6dd41GAHzn2j5zTwYAZzY0wkhSMENhnc4ofEyBPXOfh0LxuTxQZK9NZ0WVihgq/UMhQfmtnj5KHcRvR9+qLSwi11aWZkTT4D17+xNZc6eZb4x+NY7tXaJg1niXKp5SDEl5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
 b=gKKylQSXAxlsma4yaPWIlESdOK8WD/vxkbjZEYLbwqMzMrqPlGbseiGg5vxkQVp1dMLf40hqQD2MBjunnfUcND+1kQQzpYF5uEFDgRhBb8d1O2h0E4LpnjQeGEvS8ExX3wjQ2oY6x/d5UXL0CYipaQCnayZkyAdGBNlgDYXnSZA=
Received: from CH2PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:59::29)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:09:18 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:610:59:cafe::77) by CH2PR03CA0019.outlook.office365.com
 (2603:10b6:610:59::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:09:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:09:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:09:14 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 07:09:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: amd: acp: fix adr_device naming in ACP7.x ACPI match table
Date: Fri, 6 Nov 2026 18:37:28 +0530
Message-ID: <20261106130801.506026-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abf3d55-a0a2-4f71-1522-08df3c07290f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|261022113327099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261009223027099003|261022075727099003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EhTZ6UqZz+9bEN4Q48g5ZFyzGFDxCwZR8P/iiVwj9w7VUteEMzvHK83KVH4pnWxkg6X/VvcH1qUAHl6mPbpu0QWFVZ51ng5JvyC+JvNAMHDwdqC8Q6wGddwby9K9utiIbCAtGckpo8KJE9qaA5PQCkwtvNtk2tU5MLYjmx0xFBMZuA5dXvmH1kPlD8niR8eHAALt40xJuSytM/OQusXEMBeIou9OqR8XnwUDheClmC82nUde41QEbd81ejCG43H7+WVBgqfiPM7876kyf53KfbjQ2Wzc/yG1JEPPX5cdk6Y65NGNbODEnZYVCw7vly5e+xNEQwPjmvDDIjBJ2gbBX7X2Dctue6GCjzIY17Srbc51AqIP0e5sImxTORzZlUFg36dggLlmVGoJJ+M31+z9Vo6PGWex4iBjWpSne8CWVX7OcUct7hlZZt7opfxLFSe7se0+NsWvtluniIMSIyr7Jpseiq/DKl/EXRKsnr7A0Fk5AG29RZC3Wt6zxtB54Tjm6/BqguoRaWOppb3TiLyUhnHbHO68zkKsU8fI0wOB5ePCps/EUfafKLHy7uDzM04MrSuNzo6MnBH3OdvW/7B5HvktDow1z060ZTzW8UiSKp/QjI4xRJEqjRFOQZO3TVpMpevxUvIiHHeW0emB8Sy6JB6K2Own7Tpf7XGAM3XBfClyiB0e+x/9JWNM2V2uZX4hNt1p5zy5mmwxfDTr3Rgv5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(261022113327099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w7+qtZem7UsnJ+Tc1HXzsiS9OmuhD22XBU1f3hqELlx0CmISjZ91yN4rnLgWmF9zpIXWVe5ixbYsErQiJRBrdZO7ScBL9JihM678pf6WYbOaQToUe2BoO2QAuQ816uwQmlMYamWl4VeCaadNqf1X+tda79mxrebor4wZ2xsx2C0qxusrliWwft1uBiq5fQa2bsU+q42GK28YzN8UyDqzYikWiGO4qnKW2Pn9V6LEADUlQnnkmGJt6oQnN+VmvrO3979j86tWhqRl/CuOFOE/B4tN9lE/RRBGCVQ39xUsC+BmhsI9IOYL7UFTgBCq+XLXM39s9qRUrdp6aqi3rcyYnwMgWCiAZJvqSeTOEAIy+cLhTnxrE0A8nOTYEyBSx4+Cdals2FPzDnRQtS/MJpaA/0oSYuDXOOdCZCwPo9dHJZDkxajncuapaR/Fc0OwIobN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:09:16.0682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abf3d55-a0a2-4f71-1522-08df3c07290f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507

Rename the three rt721/rt722 adr_device arrays to encode their
endpoint set rather than their structural role:

  rt721_l0_single_adr  -> rt721_l0_jack_dmic_adr
  rt721_l0_only        -> rt721_l0_jack_amp_dmic_adr
  rt722_l0_single_adr  -> rt722_l0_jack_amp_dmic_adr

The old names (_single_adr vs _only) did not indicate which endpoint
set each entry uses.  The new names make it immediately clear that
rt721_l0_jack_dmic_adr carries jack+dmic endpoints (used in combo
configs where RT1320 provides amplification) while both
*_jack_amp_dmic_adr variants carry the full jack+amp+dmic set for
standalone configurations.  Update all four call sites accordingly.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index 830c59966a35..bf11ceb7478b 100644
--- a/sound/soc/amd/acp/amd-acp7x-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
@@ -57,7 +57,7 @@ static const struct snd_soc_acpi_endpoint jack_amp_dmic_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device rt721_l0_single_adr[] = {
+static const struct snd_soc_acpi_adr_device rt721_l0_jack_dmic_adr[] = {
 	{
 		.adr = 0x000030025d072101ull,
 		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
@@ -66,7 +66,7 @@ static const struct snd_soc_acpi_adr_device rt721_l0_single_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt721_l0_only[] = {
+static const struct snd_soc_acpi_adr_device rt721_l0_jack_amp_dmic_adr[] = {
 	{
 		.adr = 0x000030025d072101ull,
 		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
@@ -78,13 +78,13 @@ static const struct snd_soc_acpi_adr_device rt721_l0_only[] = {
 static const struct snd_soc_acpi_link_adr acp7x_rt721_only[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt721_l0_only),
-		.adr_d = rt721_l0_only,
+		.num_adr = ARRAY_SIZE(rt721_l0_jack_amp_dmic_adr),
+		.adr_d = rt721_l0_jack_amp_dmic_adr,
 	},
 	{}
 };
 
-static const struct snd_soc_acpi_adr_device rt722_l0_single_adr[] = {
+static const struct snd_soc_acpi_adr_device rt722_l0_jack_amp_dmic_adr[] = {
 	{
 		.adr = 0x000030025d072201ull,
 		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
@@ -96,8 +96,8 @@ static const struct snd_soc_acpi_adr_device rt722_l0_single_adr[] = {
 static const struct snd_soc_acpi_link_adr acp7x_rt722_only[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt722_l0_single_adr),
-		.adr_d = rt722_l0_single_adr,
+		.num_adr = ARRAY_SIZE(rt722_l0_jack_amp_dmic_adr),
+		.adr_d = rt722_l0_jack_amp_dmic_adr,
 	},
 	{}
 };
@@ -123,8 +123,8 @@ static const struct snd_soc_acpi_adr_device rt1320_l3_single_adr[] = {
 static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l1[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt721_l0_single_adr),
-		.adr_d = rt721_l0_single_adr,
+		.num_adr = ARRAY_SIZE(rt721_l0_jack_dmic_adr),
+		.adr_d = rt721_l0_jack_dmic_adr,
 	},
 	{
 		.mask = BIT(1),
@@ -137,8 +137,8 @@ static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l1[] = {
 static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l3[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt721_l0_single_adr),
-		.adr_d = rt721_l0_single_adr,
+		.num_adr = ARRAY_SIZE(rt721_l0_jack_dmic_adr),
+		.adr_d = rt721_l0_jack_dmic_adr,
 	},
 	{
 		.mask = BIT(3),
-- 
2.53.0


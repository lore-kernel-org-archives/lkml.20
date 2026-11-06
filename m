Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793965668;
	b=GVRNGGvRa2C/D1Yl+8ce+fqxnQS0sI7CjBlPUbVdHHGvBEm/sthgYlHnzLDe9tGeMGHb
	 kF1r+TxoRleLJFDS5g0aNlhgMKNHjKihZjN8rHoxQklxqbXqOCrXAZEq9xJusv/eHOWGQ
	 MucFLpFmTyM9K/9X5Rj9TFmMqkAbGHHrZEzK9vIiufTWncsz8Qi5po6nb/WhdchfhmekJ
	 xATXYr3jAuo5hcFuZCfrewwJH7W5DQhDKYZqHU+uUZM3vK5d9Z70JR2rlbpvAoByHT3om
	 +04gketQEQDe7k3l6BYZVkhh6GIjFGk8tArEnMXqabiNfvVcbaau1fnkGdmbtC5nS6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965668;
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
	bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
	b=EANFxgVSk6OIj8JcjJM0C0U0cYexOWRONNJq7UxPjQz56rnJKvhdjRsdUZAogBRhshOW
	 Omk8lULGXvBJwzwIi+AuvFquhnDtVmfjKWwxSLPCMPPyOmnzo2zIi6Q91drUlXQB7PrXn
	 q1GQYK51XXswRY85AQz6bedRkHh7hlUaAcquWLLe5AKhDgxzTz4Zi2lveDWKl6dod1/Ab
	 hx8spZarWbilZemIhx5Kg5WslABvkxBT4baPuniky72/umAusW/sAjvHPunQs+pzbN3r8
	 c7u3YYh7UxF4TCl3yjL6SVgsr1sIpG7z9tplFok9rbz0/OzIv/GhEMXeULJQjU6NSzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gqWhSd1r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.34
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708AD606A900;
	Fri,  6 Nov 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708AD606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gqWhSd1r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6oW1vJTNLow+Zr3hC55SDKgfMpjLG0o2DUjzLxJytz49hOT7Ove1E0j9I04lxeFi/Lw8PA8dtIw7LfA9BMcojhfsFf6Uh82sym3CFMSx//sMc9LKhBrtYIlihBGyrcXw0TVR4LHe/pdfINZX7pd1wfvJ4Y3ID6zzLlI/4MVUkwy9qIJX1lGP2rcVkB0KvdG5g8tVSrMxwL+2RG4XBHsoa5lh94pFs37g4gNTHt7uoORZtSsjSBYdP0WMjsclPIXo9n0fl6syQK4a6H5hZVQMWaub9sWB2tYyhU8f4Oi0xBewtm0niEoGWkRbG5YMHUio8Er1piD7SFsggbPygs8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
 b=wtrSlgI73Z2oOHpTVtPvdGo2ZoFZUrty6Nom/gEcK6wZN8Mfsh74G+Ql+6drEWnHCcO3tob1GUHSJwULBbJOsCJ8Zw+EQDQZpI2r2+f73avTHJjyIrXFhpC2Q4vebmm1bYelKlsbLgwZOdu2fn3b/o7YPFRFBZt1AAef1gSAUgFh2dazCt5GKWAc4gJbrfP0padTzLxliPM07EKb7ctvQcZG/KDoH/yjywV8KC2I2swkk8BzQv8R3ik4Sy8KRVAchuaYEUe928Q/kvCzZ4FQJ83HMlHUzD6szZzeoNggxXFynEm0X2dvj2LQUOGzv9qJVvcZdBnn/uJdpfuxc/p4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm5aIvKRgASM8Q1UR9u3Z7Y8yBJ7jzWS6HnDYxaRZcU=;
 b=gqWhSd1rKjhGvj6FIMMZBaFAaEHuuyoTr27cKhmu7yDANzkT6IkO6+Ubnni9wvlce9x0TptUfAlZwl4MxCOhlo+F5BaIUhE7HQAD6wOi9GvamzlbzoGmQWNdSbdJ9DCNqZNJU788pk+UeRq0Vn6qJtkGbXIS91NoavZj/HUZj5o=
Received: from CH2PR14CA0046.namprd14.prod.outlook.com (2603:10b6:610:56::26)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:47:41 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::58) by CH2PR14CA0046.outlook.office365.com
 (2603:10b6:610:56::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 11:47:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 11:47:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 05:47:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 05:47:40 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 05:47:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <pierre-louis.bossart@linux.dev>, <vijendar.mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Syed.SabaKareem@amd.com>, <alsa-devel@alsa-project.org>,
	<lgirdwood@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: acp: fix adr_device naming in ACP7.x ACPI match table
Date: Fri, 6 Nov 2026 17:16:21 +0530
Message-ID: <20261106114622.219126-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 4762832d-49ef-4188-7b73-08df3bfbc341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261022113327099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	KD1mnIF1y8ua4McsGmPn1jmVKHTCmZ3EXQb9kKYjp7LfoZOvPfSGT3HNTTyvfP2f7V46mcH404NDlhQVk+xRfvnjUJ53u5da0pj6tlo0SBRKVwRTH59inIDnvYn3ac+7ySHcdTfODXCKz2S4ztFXGeqmRyQRhhqO4Q/vuvhbPw0W2DURELM0WqrBacmk2gb7HH+VnV/8/RQ/W0ARlU7KN3eDG3ZMbSwqD+gcPO+5w9uG2RUqGI5ScWEsG6oAvEHdp8v+038C/sj1h2CTii0OKIVlXrQmWqMniy+3/Ru+QMP0IPS74+WV4O19MIaLKGP17ANEi7/JZ4e31yqAiLP4UCgMoE6yInvU5XEKuUnUOv/MGayEeMt9xn+BiJOophqNDP5pujrc7odl2UsoNHAOoEjJqFbmt7/KdXzJbo6LuaxnCVgrmiJOYLwcPxE8nJAUKV3N+GZlt+3EHdvCM5ZcD/rW/nFdyfwEv14EE7VPioYFv0xNqG20b6z3Fkcy9XYHXnzfJpe1ytXhWL246I/6cFTJwbY6uxvu2U+MTusuG2ttrll3GZ3sDdaKAk4pppyaD9tzZdkbD1B3LPWKHVC4nAZlN4c6kScXO5JxfIOd+WOWcKUA0y+xMCe70VJCFElLqcYz2xFq9AI/rYiggPVUHIxEMIcprzB6iLdHlP022PK2vKgky1cc/CxYjfDKGLtvKwSeVsqZVWr66lCY98rX/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022113327099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0nOyo6FvWTbMp0s1Sxsbb54bTYDzv8a+Ye5/YzdMfUPl/oCm1qqb8PF24C+OmSBrIlGp//H+26jzxhqt8dh5rYUCqH7WnCBNGiWl7SlGyScsjsFB2f2RLCD9nh9vrBYhws/8HnUwlrU/BPu61It05JdnHlLeGZ8xipUVuOcWrVyleqTp82kPTHyNV3XOB4VPCU0NeK2LuRf/xnJSJS9CGOh+cPbExJIHg5R9Z8Q3m7JnJpcJagpr+hO9tIuJUZYzpAz7zlW7POEsk6cMqxSv67OFdEnl0UwjW4kIm7BHjSBsNbq7ZFUxC0vJpD3gkHOJWBPw2nz0eFYfa8c5a+9FhAzJfMawGx7AmzADr/7hTJOFmpfH4+DwJ/DZxeLbXikLGk9qlEQqohY3CCJUjCSz4vIHrAPVexQdhfxVvCQt2+5+dWTLRmb7rCBnk+RdNPN+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:47:40.8011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4762832d-49ef-4188-7b73-08df3bfbc341
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

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


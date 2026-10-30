Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353764;
	b=KG9+fhIi9mp9SFMRndfE1jCISYYH5n+sc39kSEjg5GZ7NA3Y1YrH33wV2nG4RwRpnFvT
	 AHJZ33e2tMZKFy1bHsYdTB6pUojm9XjN3yHVBHyZ9od8e5zU7WwBZBCtg31BjZ462aveG
	 BiVboTdSSgmkIwwqUSAA2WyU3OaLMBniT0dCHn/kxWtm66bKXRerr67FqkWnnow+/DuYS
	 NvkxzcFwFkfMbLPkHX1l9pJNwjrVg54AH6NnrgYbwwyFQLpby4uPcq9MlqcHs5tMGyaxV
	 e8kaP/MJp1QRDgl5Te2G6j79zXisUtJUoeS/BfQ2CpSCY5R4xWvzIhVxFHTTxjHHXlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353764;
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
	bh=ACynAX1i2K7rg8RjL2WrnBlbfKwZ5WtGy7p8SYutbEE=;
	b=jVJehwZOBLR/Euq05tQewItLfQhPKEsLuk8uYN0MXGqd43HIREUcaQqfk38xPfeuXwcp
	 Z0/Wcb+cUAScuIKEUmuUN+XpsigdBKiIR8VIfPZ4IcTyY+n5sjj2slQ+b+N/SEz1eg5vd
	 BGYyiMlo68L7sR0xJLez0rFmZWnM+9/CVyI2OJHIhTnW4GaWFizbG1uQaxVn/q3p7wYhq
	 kEONeuNLZL67+GgcjznSAS2gvEeon/VSAJkjE6YTPF474pbVaTfAPBSeIZRNhmKUl5JZp
	 ajU8qvdcWFy6bKU1TZLp41vwQJb/l09k0JoGkSrcn/HIdxc852PmJ0lZdVqk4SmS6Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GhS+N50f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9D606A33B;
	Fri, 30 Oct 2026 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA9D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GhS+N50f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9tP7wYkFVnn7r8AlYiFid7FEy4PHlY6qKLr+oS+ShGod/eGDs+mXgvS8USuxYAV58qBlNQ2wv3Hs0rclJTyOGz1ZrSe4RtERYvQmIodj9gRNkx8RLsZbg9clqtJvdnWDmCKqOWSENMsqH3ljBsp/sXHqyMvyn8kD13PjJ72Ca4iIPsRcIbEn1fMtI9WIMVQhJihQPIiMrqSlWQ7OVlGrjGGZ/fRtbSaeCzpr18G4q8SWbEHABfnVmILCE/PgxQFBq9RYDuSYE3S1yfPZYiysF28uZqx2OuH97LCXUNibi1Xy5ZSVIWNu6GadFn5ddzSiORRkVMt7TykbQsiGyL0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACynAX1i2K7rg8RjL2WrnBlbfKwZ5WtGy7p8SYutbEE=;
 b=umUGFXaRGGMv92v0DbtIg6OPsx70+mKmfQfIVSUmwCCOrEbzqQk0larwDsfO8w08x2Yczqb+Ixj8gyDvORcAKx4GkdNHWOMrXTPZeviBiPHzxIiCg6TpD4Covw7KboTSOR8Ui6lZ27JzXi8GTlrxRlozuGuOwsC60BK36sg6sEoM7akvEtoDtU6D/osliTkdWRq6Ep2tojLyP/ue/x4D0jomcPdgIV81Xw1xLVmvofh+sRbE8+GAFegAzH9NpXuo4i4inEbbgucBwKdNH5NuXSgK9B6vdntFJcGOzF3IIswLtbIhB7qU7af3Zr4T6gr9RykGI3KJ9oBqtO9rQr8hvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACynAX1i2K7rg8RjL2WrnBlbfKwZ5WtGy7p8SYutbEE=;
 b=GhS+N50fDFr/n1atXTFfHeqUYzvedw8B7ZSf1MR9RPR6h/tclgMWE6/rSKhMHHitsGcthh401lI9qnmmQJzl42Q6Cpa60o9DySTVTGW1F2ggStZ2Bf5byHsZdvw2IZ9X6HEQxa+1vbJarEjIJIb50eDGdzlFX+F4jqGCq3JRdmM=
Received: from CH0PR04CA0100.namprd04.prod.outlook.com (2603:10b6:610:75::15)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:49:20 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:75:cafe::47) by CH0PR04CA0100.outlook.office365.com
 (2603:10b6:610:75::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 09:49:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:19 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v4 12/16] ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
Date: Fri, 30 Oct 2026 15:15:27 +0530
Message-ID: <20261030094714.1123396-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7603eac1-35c2-464b-182d-08df366b1217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	hC6LaO3Xb/tAtf8NagvMkRXgHpHDoZfp3OQf1TouyFhbxKQM2ewPsqeeTnekgbrQb+4jbM5NA27AwMOHFVHHW6hxX1ZT6NEe1T8iFvqrLdjM9YxrbRqBUKIVn1UQuMAky4lFvv9WibyTlkqzE1TZ8mSObuwAc5S6aWKmC+/WNWPJSlrwHqxbSFzj0S+BKCWKm4qTIkreTxBnM82EAAWfoKgvdCOkc5Y3KzS/pjslZG/dKNktE1XkvtpqPlVy73270vKgk58/zK7ejXnxVNGdOgNBuNwaqlBLscPy290JSsLrwSjDMRjq2ZqWTSIhsFFbc3Wa7jLAVkNL/Yy78zEJNyTgQNrcPg5bC3yhliCu5fhVwXARkc536LfSgB9OsoYYpKMUe5P65M+iJDPbqOwjyBYANeDa8R0erIxIjRst/bHncI+kyP0S/3Xe32TxapQwYbom6ewwZ3hwpYfRFrRva6pE6Zatq6kOWmfFUWsRcE8LgpMt/zXHfmUv4Cb2biTplNV5t7zx4rDG6jP4OShjLHs1+6KkF3YlZIHO9g/CQqOaUZ6QCM9pkHGu8ygvO8LGGZ1nGqnfK32NrNYLchG6U+FzY0wOjD0CSAiuFz/aMiFkIvyYX99QA031fLzFl3HY91xU9tJRUzwSm4MkrO8DTrSo/VRNrVnhWL3jT6Ckk+Qpd5tKBjoQAXuGMc+0DbkZt6K4h2jBnvY01W5zyzW88Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uGDZjoS9BX0b+2f4mL0SCLx8nPMDdGdb1JkUwsqDEoEyTpchqL30pyLfNkj1CjbYZkLsid2rd1Y1nw4Xi6vGFbRTyPrIXWBJVNRtaesXG46dO+g2mUeBOxfHNO7W28wxWTqTqALjut2JlR+kLvByTf/TwZAZ3/fhFZW2p8x+/nk6JG5sQKoqyizha4wu9C2Qf+FXIXphQi2khZeeMbmKk6yzCQwfMAoBy9jhggkyhnWK+nQKD563x3GDQ5h8+lAFmi4TGAcBq17gKsTpNaW1EdHwEMxWFPM8Y6jm3juMofQYQ3ZXkaSBtEDzltJCWYPxC6s8OtXOwBQ32tgMyzmdDc4PB6N9xu6UX1rdu6EgVg1pcMpFkfcDUd0wwZyheS1+HNispN/S0w/j8DHDeEFPwq/lMkmPx7VPTsc7h48VvEo/udsmeqLFl9WhhNywKyQj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:20.2376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7603eac1-35c2-464b-182d-08df366b1217
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714

The MODULE_AUTHOR macro call was missing the closing '>' for the
email address angle bracket notation.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 11cd0feaa16c..1d7487c87265 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -548,7 +548,7 @@ static struct platform_driver sof_sdw_driver = {
 module_platform_driver(sof_sdw_driver);
 
 MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
-MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
 MODULE_IMPORT_NS("SND_SOC_AMD_SDW_MACH");
-- 
2.53.0


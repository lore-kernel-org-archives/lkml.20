Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353717;
	b=BkNx2s9id6tEtZ4H9TzLtRwyk8UQm3ypH8i/ZJrBI5MIFpyJyCM+hvbZ6iXQysgYKSIx
	 zibWCgi8jmOIh+KTDqpqJGhGkdvXn0qpYAthkAjZjC6r7GHKHhz/PVrBPGSxQ72uFIBq5
	 GH2Qz7/F3RTPPm3BaTGx6SpqlMsuA75XFjxmIVrzoTwH3LDhjAclt2XWYwFJbKHIHRYIY
	 9gQ7d32h67+3Ev1rUdMQnxlHSHzYFync+s7SYbM2iV+ZCA0sFEM57NWyTRAu34HlSspFo
	 VmxbmIt9sKuqif4bW40lyRDp1CinCF6IMbE7njFy9Xu+kyt+7Y794ZPmMPloBNqycpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353717;
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
	bh=hXkJ0fO4teVhR+Hjpv4SBhrFLp30n7uVNaMV85RyOl8=;
	b=qTISsc2ZeaBeIPUa+qdZ38exxTMbvKmrcAksc/Zd00MSs64NOYT4j21mD2PSz0dg5dUY
	 pJf3rjHJXw4A4h1fZkSeU4vG91o5E9DQ2uNMas6nIgx9L2/JLQLZArOho8AxvO9d4ZJZO
	 nz25pcF/X5YlG95GR7PlNJWgSehszuP2AzjZlVd+Fbk2J7CcandC0+SNOkCgUALQDYycA
	 GezbcXnTaBR5k7YrMNgap2UxvkMsfna8wuQSH2Z547Vznt2rYxbSuwqRyirWsxgeCVbP8
	 GqnIb1e2UPX/6RvSsBsUoK0x+ZazExcBocwXUuGQH15v5DRBceFp112gqbIilOEHF6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="FfQ2/qU4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.7
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481FB60A2603;
	Fri, 30 Oct 2026 09:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481FB60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FfQ2/qU4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR7DYXZHgbUKh/vqAGs+UOSxMhHf0w0C8SAtNfvhUyvSbhM8dQtIEhkcjC2njtCevg4o60Gj70V+8MI5ABmhQ93XzIvaJ/oqHNMtcu0JeJV+a83poT8mRsArJpSRby86hx1KAcjGYTt352PT7hKfbzKkidsNAdTdr75xxEUSmVFXYliw3Qa0mskDbc9dlEYetbIm8gb/pTyMcbFF6U98v0evBBrhDXmL6YMKW90HescUecajic/wEdcv+4RWbxMFOTtjAT/O/aD6daGi0f/Obsh1Mjdyyg1sQbX9S7X3kYph13lkJCBqUoNXh0IAGI8AF82/ul5g30AbrPxUNdizbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXkJ0fO4teVhR+Hjpv4SBhrFLp30n7uVNaMV85RyOl8=;
 b=j60eY4sAIxJGS0F/GR7MZU2MlOI8PPAhyLTog2mcsJ6YikU00at9+JvZMX5Dvi62jOMoOgCCG6KpwRlrrif5QXKJaVpHR6p8Jq9Hw25dDJlNMZkikWRWsncFTcyvWemnTJiy2cDgJmhJSzzEVONyBnc+vITVwcQ+LjB3GJ7bZsUFEpxQk5oTTLo0ZuwyXru9Gb8nKSalvZRHVfIqC9MiIshxUVIN/9Om78TTJ+Yl0L84NWuMSbOux9h2Q+CRWUh2ehLoGF0VhKzYFuw3NSQrRwuLN1Xy0DAjKZvDGfU93FkJ01XDIuJQwxI3hvkouE1nsakef+Tgh7zfE9qwc7G2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXkJ0fO4teVhR+Hjpv4SBhrFLp30n7uVNaMV85RyOl8=;
 b=FfQ2/qU4ZZhD7gmnbCNyiHYQpc833ZZrKsNWEraAnCq1fI/e9oiCd/QvgyF8khU/tWeqX8uCNbsZpqbF3w1y06lNyOa59gwo/ywzKCk6y2ebOICQwsJD+WteyKHs5u5Z89VgO4FD+dBt2MHPoMU5+xXfhjPy4DgPb4TI2eriunw=
Received: from MW4PR03CA0060.namprd03.prod.outlook.com (2603:10b6:303:8e::35)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:48:33 +0000
Received: from SJ1PEPF000037B8.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::50) by MW4PR03CA0060.outlook.office365.com
 (2603:10b6:303:8e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:48:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B8.mail.protection.outlook.com (10.167.244.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:31 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:27 -0500
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
Subject: [PATCH v4 02/16] ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in legacy SDW machine driver
Date: Fri, 30 Oct 2026 15:15:17 +0530
Message-ID: <20261030094714.1123396-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B8:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a673549-e336-4ed0-1eb4-08df366af57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZxzJb9D1ErtNz+l4ZlYY0XlbnWPlr1wNLSC7qxW2+qeqRNmWxj/DHFoGFF5ULT2Ee6BIExAUvNHHhyZbulQqxqPARTV+76BItm9gjWzvDO1wjO0IYWKif8LhVsTKFY/l9rYOH2do3cf4yw7ymtFAA3eSSHn6AU04haY79wbjNbG4tJpaKS8jQm5cKw6bhOAgIGYsXKMek6GSygQFuXLvs9spv4LqMIKSKWDFM05/vRUHGEfWvUwcYz9RIFu6PtN/L8yDlbchijmLK99s8govce/06vbUW0O8XuAxJ3C1XA2BXGX4i4mu1uqLxnguH1IOXS9l35TD9B6jk9hTBasCm73Nb9RcAJKMofFim+/aZz4b6+pRizAovGzfVPuwwpECKlkWKmA5E1uEBFxoqRxUzu4tZ/PsnoJBDLBI2tzE8lWOr+EoZdhAPVLCQ6ZhjyfcQOeW+qMegV1Mz317kclvSF+SzmM+PEckpjjbFeBLGl6+QVKl4dwUx0CNgakhQDp6EC88+SSj0kUUv42Y78PTp9QTKtH+AXhrH59U0PFoZXB4U9WhuqizB3BpwkE5ubX5qVOwhKoVaz9XPutQaIkfE1gPWQqE5tRHZQUHVaK3R+2yF6U1d/xClo/u4d0AqrOTyNPFVz8mTYSuxftuCvmyamzOzPn4CFuAd03OnV9DkvYZRb+1qizjUCYqK6qraT2rVUhxvrnzST/YXhn2z/9rag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sz2FpRjGlCFBfhk0cdgzp3fWmEWak/f6mZDcJ8VI7KNhE5Q2Ms04325wPYXT8JY4fEfjdQ+PGtF3wpD0XmeFcfYpisfK4CyoLwLNa3yJzWYTTXoZl7K5XfGHG3Qg2uqtrgIM194Y7Zryu+DNrff22UtSE+Ffg3og+bEsm4VYP1R0Eyz9bdy67bXr5QeDoE6jPEiuWdGahSXnnT/TDsbX7lAG9pSsuXijKOTZYtJLVR3HnR1W/cycve5b4SF0ep5O0HFbQ2ZJPF7iVrnaWixcTL7mDjTBqj/d7Xyvn6OeNF2agsLCYCoGO2CVW8/9ouAPMQemIDAk6F+Cz/kdLeqoVoW93kxEtM6+9GnYuchFsius1gyZkk2GbJjYdm5BSkLQ7WOfICIax7EgPCyXoff/X57Bv//D1g68Gro6MjqKMrIReY9GLjT1mJ17ICW+Y25+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:32.1603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a673549-e336-4ed0-1eb4-08df366af57c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694

On devm_kasprintf() failure for the cfg-amp and DMIC components
strings in mc_probe(), the legacy SoundWire machine driver returned
-ENOMEM directly without calling asoc_sdw_mc_dailink_exit_loop(),
leaving device references acquired during soc_card_dai_links_create()
unreleased.

Call asoc_sdw_mc_dailink_exit_loop() before returning -ENOMEM on
both failure paths, consistent with the cleanup already done in
the devm_snd_soc_register_card() failure path.

Fixes: 2981d9b0789c ("ASoC: amd: acp: add soundwire machine driver for legacy stack")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index a8b62817b234..bd03789c7849 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -590,15 +590,19 @@ static int mc_probe(struct platform_device *pdev)
 
 	card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					  " cfg-amp:%d", amp_num);
-	if (!card->components)
+	if (!card->components) {
+		asoc_sdw_mc_dailink_exit_loop(card);
 		return -ENOMEM;
+	}
 	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC) {
 		card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						  "%s mic:acp-dmic cfg-mics:%d",
 						  card->components,
 						  1);
-		if (!card->components)
+		if (!card->components) {
+			asoc_sdw_mc_dailink_exit_loop(card);
 			return -ENOMEM;
+		}
 	}
 
 	/* Register the card */
-- 
2.53.0


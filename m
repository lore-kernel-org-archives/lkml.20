Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649368;
	b=r+/UC4RvBHT9o7eJD5l4bAxDoh5elXeM+jCiAFP8Sww0N/yECRk6KTySRUJ+hh/Pi0Ny
	 5NysYVxzcbvTMq2zFQLvZnx0AUiGHNzwOuYcjx03wBbGwkJn+2YYyJa6V0YqkVhOpD2rU
	 q1q1AuH5BohCUY++yCrwgkC+IoEajVSszI3wEK/G5DugNCosurEZoYDGVu6X+V/4sta0b
	 +7pgJ8L/jYjNim8zWIscCNIAK0KlexZ7JCW/Ll1I2ysnUVZHv+1kBZPJW6vFHQOCJg/am
	 3+SywnI804rLlQYDAOzxWxQz86DnxWD5M2JqVU62o/PlWeSyGlK4zHfE4Mqhu4dx0SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649368;
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
	bh=9QgPPUO1TNOiuyFDMdS8l9IYZhj4b3u+D9uoVQlPx5s=;
	b=OShA8azNshcHAOHgAiQnv5Wed9Tupz+0Z+r24FTIJBN+KB5RmZSdxuHQpvFkp9K13xSV
	 vr5QpUkY2N3qY7DZ58ObiSyFqglOOM0Wd/oSw3G3oijZOJZmTB4eS7KWmSqSHuJY2t+VT
	 NmHNSN49ZVM3xEvVv932zMdf/pA4vShYCqXWXLPq19Rt7d9PHYefAoZD4krVHgEdFOtnJ
	 hvBD1dFL8tOwK89eOWptB3Utu22nDfwsXTFc1KdZtQmYk57xgu5lHkf9PdpYsHdIVMyAb
	 W+H7lTBvK0+EgTk+po5sk9IeTrYJHkdDCXY8Czl7s6TNjfCCPDaUp4DfJYgz68z+xKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NaL5FFj0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.40
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2A606A31A;
	Thu, 22 Oct 2026 06:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NaL5FFj0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVkqxOY2sB4rdoA9CEqjIyxsDBguCev8VnQsb2Q7AE6pvio4e0OhdnCVWoCAjyE+t7V7GO0WS7Dzsj/AJXR5wnbKCX+zIWTTVtNTze8EOLJZ3/CTaozarMXYa4p+yvQp6LU3B08NAv7CWNpk/grCPK0AQi7MoQNcdBPCILl+D6hHqiT785xI2nuV4Yh6Pg7Dt3rwXSmulg5mOGillTLMtO2B/0hbl+jX5DnxQkYkyrP9uzO7WUyJTXt9PxSpofN8HUBRphrU1RAifCY9tgyBCDoO6AeerYxdvq+yaDIoPeWtST3N7/JNLmzU+lIO0x0DszESKCgmSF/uIPAygIBJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QgPPUO1TNOiuyFDMdS8l9IYZhj4b3u+D9uoVQlPx5s=;
 b=cy/OGp2VQtYfpSiZx8SGHzcgNhrOxEHmPnZUtAZ5CdMKl9XxKIwsKOsRsS/v4m325ewrBTMeu2suDnl+KrWuEAuQO3jAsmsfNvL1Sh10QhD8PNGILqHSGFMxVMwjSRDHG3RaEAQMShdxKaQa7usMqkbolUeIX1oV1ozMFXs1k6JX2BVrZ4x2X3jgBl/E4quSAu2F7ZnxgcQYGVPBtK4XBXSpRGH9R8Sfsu9ImHC0XyfmJAddr4wyuOMSp+Yr1xj8GNltKNM6KDcBHDn+rAJEL4g3BKB2XuJTG1l289brHPzKDqLrAIJKiKidfGVn5smCqhGE4TrrXA+dTFj+znJ4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QgPPUO1TNOiuyFDMdS8l9IYZhj4b3u+D9uoVQlPx5s=;
 b=NaL5FFj09QQcoYq5o001naozkIjHz/PXFHIMwkMFSIdVlbfUNWvV3eDX8J8k179UStkQ+8p7nYVPdw0m7nWlZtXjZysbHbtBos+VTUNdXm3pTkZdEjDAsSlALByb/7phkmW2KCRmNCneW9qPFCH/O4hGgv1eXK9C9p3+8L7MMLg=
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 06:09:25 +0000
Received: from MN7PEPF0000014D.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::3d) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Thu,
 22 Oct 2026 06:09:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN7PEPF0000014D.mail.protection.outlook.com (10.167.254.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:04 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:09:00 -0500
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
Subject: [PATCH V2 06/13] ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable condition
Date: Thu, 22 Oct 2026 11:32:16 +0530
Message-ID: <20261022060724.1814741-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014D:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbaad36-3bd6-4acd-6a48-08df300305a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|261021123027099003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	5RKwfkl9PmSExE2iEIDnqelhaVzB8cvmucvvFiCdumawPi01rt93OlJ6quHc8JMnMr9Tq49gw03PZk9SDUGEfKx7d5j7AKW58zKRaSgk0F/Hj4PVfg5JCWMjZc6sojErN6lXsdzKWMqrksNP9+ePGkdObS+/ohLw5LHFHtyy5zQFmWKkbHo0KgvjZPM7jfTsskjlPyDIwRjyxZWHCbY7VNIRvm6z2MpdRKDEhoQRzgnDyNEK5JU005M1yZFMiWdAz1o1vcVFSAgmqwJnM9GBAN56kV0NW1IdmRsM2DboT3Z3jDXO3cLZqBcY1fx0fijb0IHp6MeZLLsceA/ntTPoHSHjDc+KGPzjsBicqLigTxUZgZTrkFBqQceqVft6kzNfE/2pNxVQ+CLuCoUPXNTY/fP34ZjlllvGZBYSBe9kthKc77zqifMcsf8RhjcJAThQeHQCmvJLhXG3DeUJaw3qHmP0NiIPtVFzFVRceFEcOpogzpqGirXQV2Ng/yBJ+pZ74uDnQFlxib4y+YOaW5P5b4fRBbo7ZoamE3hX5/IIaLWjbjcuDF6+q1ixINsr4D43y6FeTDvzeCyRJgtLZmppnPO9/mu4JxnlJnTrFySPwnZyvKbsA4k9PCvUr6AIcyLv1+XVi9uN5FSnkSiD+dfbd7m+0RcxT65kmLMRvl/FQaf6gMmVsQxasJC2d2w1Q1ZMJtvCdha9F13nd/rLTXft0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(261021123027099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8eyklqvLLeqiw6oGrEwFZN1dT632GC5r1/RGH5h1pfNd/BVrs/z6Wri8MnSzbneBTUkBCyxh7MEIbf3+yy0ipDcWRvhG8KGHZWWTje4zGOvdFTNmcKoCh6GutZ1nVs7YqF9UMTDI0coQh2kya4V0e1y4Vk4NobSkyWk5F8ljb1sEk193uI1Yc4n+/PVGinzsVYluT3EZsS3mUIRc60/suwSztcD8lTXwsxNMQL6s0rLYQy978f4D5WhoFYWGJZ/+0uaZ+yNAnFGtE6Np4zgh4YFJQsGnGsNIPNO8+rk96z+8oQaeYDKjsOG0+Y35ZmYun3sTI9gTd6nnxVMc3LvrobCRrNb8MDzJ+SBkq9uuAUYIDUxemSOQ/SLo6heMHzTNlipE7Y5jMGJGsGI+Bn7F93NkTZor/V03bW5F3UZfgDsB65QqoUj1q+KmlLOVdiIC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:24.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbaad36-3bd6-4acd-6a48-08df300305a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441

Move the ignore_internal_dmic check from inside the dmic_num > 0 block
to the DMIC enable condition itself. This eliminates the dead if/else
inside the dmic_num > 0 block - when dmic_num is set,
create_dmic_dailinks() is always called. Demote the suppression message
from dev_warn to dev_dbg since ignoring the ACP DMIC in favour of a
SoundWire DMIC codec is expected behaviour, not a warning condition.

No functional change for platforms without a SoundWire DMIC codec.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ac4c9e852f671..b6ccf618773a0 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -352,8 +352,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	/* enable dmic */
 	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
-	    amd_ctx->pdm_sel)
-		dmic_num = 1;
+	    amd_ctx->pdm_sel) {
+		if (ctx->ignore_internal_dmic)
+			dev_dbg(dev, "ACP DMIC suppressed by SoundWire DMIC\n");
+		else
+			dmic_num = 1;
+	}
 
 	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
 
@@ -384,13 +388,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	/* dmic */
 	if (dmic_num > 0) {
-		if (ctx->ignore_internal_dmic) {
-			dev_warn(dev, "Ignoring ACP DMIC\n");
-		} else {
-			ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
-			if (ret)
-				return ret;
-		}
+		ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
+		if (ret)
+			return ret;
 	}
 
 	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
-- 
2.48.1


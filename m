Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353757;
	b=X09HQWlZ5v3In4olzCZNKloGybqTG9XoPy5JEu9WrUre9byXWKhLC9c4XAmVvekKdXA/
	 QrG8xv36bcl8lrUnmfdmAnfj+IjcRNJPVQB6x/4RO7t/1V0WLVgvui5LiZc6NjbPJPvy8
	 Ksd7+mD3OTW2hUw5IYDlF2JS7nqAR6FtefQXlfZ9/ruhrbECklF40E6UkJ09lu1hmq3kS
	 gRKkLtMBob+gamvYHYBUJorJIA1IGBkrRSEw1CRp1sbKYCUrFhGDpUrtWSH/chxqqhmtZ
	 Bx0t569t7jWKXrsBkF7breeCiEsgEvz0lMQDXxr3jUcQDowSJGltLzlQyqMcTiWxLxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353757;
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
	bh=8OO4QrqEpfyWkOYx4xqONvaOrChDz8rgbO822v54a2w=;
	b=XAZNCv8rY0R9MHXMKQxDesCqOogLa5FLZWg19gqncTCMJLFG1DLaitkQHlJRDGpcqoDY
	 9kk1e/+ztpk4/Uzbm1Uweo1+iuVC6Vy1FDSbHxDFv259Gvh9UAQUSFe9N7dm0OqUkXzmO
	 o3wnO0ygsebWPjVXGb0OUe3S+8gHdAG+0xhXLiGbVeWYAe/5UdIzFrBk5spqfdGjm3ZD7
	 kK/0P5aPOsZ8AUgSl/rOy5swQ/6J7vd5za3jWzeji5MQ49WidJ1jP4QsQcPsys0MIXRbO
	 Y3XJ1Tz3ssEjHSynDvYBWlYQ/SVcNKC5JPhwYspVUx6NzLF5maOh11VGHyovLZmoHjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fCmfToG0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.58
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E37606A32F;
	Fri, 30 Oct 2026 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E37606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fCmfToG0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4n9ZiSHlJ/2qPtrXL9TsfXPNKFQwoxi1juFj1pfKQhwCMZDfRPxmhbRB04MOqmZtkt5BHfbamcQUCltcejtDNLQBnU6SAeK30/ekfjUDlda9vwZGw3mbnXwkCl3+ZuKLoP8sVt8+U/5fLMfYn35bWmU4UTU88jtSzaLaXR7Pmc59Mts3OHfDzeXqnf6ACnhSqGacOozfWlMTAJR6gXAKrfOJrZugOe/eTbmBHFp7hDsikImzmf+CzowXdkHnEyr+1O2xdBDJ44AIGsgb4enz/rxDqO9p0NjVAvs0g705foCodWTrToKJkd7NqqIjxV3qAec+ULM3mT9A+3Y8Nafog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OO4QrqEpfyWkOYx4xqONvaOrChDz8rgbO822v54a2w=;
 b=bkTl0KN38ISluRez7OZLewMC2+5n3QEFQgKuCbhmpK/sxm7lkWRhCz4GIuwKGKKo7rBWqsCuQcIPnPciT42nzFUg7Nq1YRXKoOZhcdjIeDB5OsD+557n+kBkawwMmz9WmCFphDte3OyLE0gnxqc29VsUSXo/WAOOxY06sKt5keM4zWoXCM3AikOZ0KvkGQww576ECbN1LUsP4tA2092kkf7PwOI3R9jxvjO7IBEay5/yoOVblLWvQuvJRFpHG1G2JayXi3sjQsp0/jxyHDWj9G+FjvI04lUKYy3QEZzuhTQGvpE2GyrfUwQVMlA5/JaAi0HzlhOxPyklHVBW2Va39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OO4QrqEpfyWkOYx4xqONvaOrChDz8rgbO822v54a2w=;
 b=fCmfToG0YRXP341cRiFOd7wSzU9HWgvi/fCMGBFGvzoZSJvdBHIGU+2IUSrNPI6UJzrSKwKIZUHhclDqlz/2eGImaGoYQToGv50QD726ZGZGI5b8NJly8IxLO5dAlib3VznoQT5TAjPKE4gbyeaGsYhEGOmaEMfmUrv/HoRTtCg=
Received: from MW4PR03CA0037.namprd03.prod.outlook.com (2603:10b6:303:8e::12)
 by DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:49:11 +0000
Received: from SJ1PEPF000037B8.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::93) by MW4PR03CA0037.outlook.office365.com
 (2603:10b6:303:8e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 09:49:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B8.mail.protection.outlook.com (10.167.244.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:05 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:00 -0500
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
Subject: [PATCH v4 09/16] ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable condition
Date: Fri, 30 Oct 2026 15:15:24 +0530
Message-ID: <20261030094714.1123396-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B8:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 38159f2a-70ca-42f5-8f79-08df366b0c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261026140227099003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	caYTZNVxL1Dka8n66vd+npKXw3Q65KE68L40ojG5vw3nuM4Wn7AphqhTCr+RbVEzkqlnLGx5CWgszpDz8KyR/MBRYkDR9EOXPdGWtuMSiZu91kWuorzURQMxxSdOWzlgv4sVTqHfkfXPeGHNYB1R4iV1WJZdSvPGmU0VJjx1boCNmW5sZwiv0cM37EXprvh3TaT0vvqyrNQ4uXCsT6ScrJfUEUDDnURZC7Wh/ppd74BlSeYYnrzXey9qV9SaI1U9n8fle3UxI0FUG704oOg3ru5Pk/nP8iCvdNuy8hw1Nl7jR9vSueqm0fQlBk1jvVBe9sK5NgKA9JSwEI/dgPVpz0kjPpzDOpEvzFP8gcjfw0f9NX0lRxcesWf2yntAvKXSQOMZAWVNjjL8i9Rz4adASaLBLGrgd6CGp7rgHp0EbWwVS33FmmF2M5/x4LyORfq9kOFm0eQAAsIti8d7U4RjgpP8MPl5fTrYYJoZLlPv9TbjEWAtYRnbt2h9bvvKZYhlTlZi7dogRCwIn7ZRoGGMT+9zQPAS8I62YbGVQo4f7ZWtBucp81vlDPp8NuCz5/ckdWmoxSravuVyZPhmIoAKbdi/z/OSe55f39/hA0GMRi1I7NdRngLYOoNKuCNJOhQL1upVhOa62P/4ysHWIGf/jZA5rhrbgxX1lcLkEKhfrTF8lu+HUu6ErCSlqevGFIk6wEiDUOq7Q0mC6UnQjGIxoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wqn6+IhnpX2NJgqEkVdHhIcfvEEqOg7m41+a4LVYaTZuwd4nCHKqK7kkaxyW0UhAE2bmFvagBPRk8d5lANJRnhp/AV0qYSqS69J+ac3WXsY7IvqoMTqBdvgE3m1t7QmNawjZoVOG818r4t3lMrXR6SHfVwATpbGs4v1jHdlPhyA6fDvtqpZ7P9XgwkYGrqX7WbKqXZ9gWGiHNlV+nF494J33H8dfAeag3F+6xsv17BgB+tm2VkrSv3y/VA3IB+MsBB4IlEEbMsAeMR3v5Mw2BfMa/IDsRe+3kV1oMQQhKaWROJzrNxq5gpskZqkOWMg8NFd6tSG/ZoC0UjRQx0oWA8laGIq/L9NUzm5VVuooLBFDjgcQwQgQEs9/t9pdh7OzA62iJJhs4zlml/9MEfCmMza0b+r4Rpre7hVFPXCXi81m4pPka0YDadWLGgwVJAXv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:10.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38159f2a-70ca-42f5-8f79-08df366b0c61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794

Move the ignore_internal_dmic check from inside the dmic_num > 0 block
to the DMIC enable condition itself. This eliminates the dead if/else
inside the dmic_num > 0 block - when dmic_num is set,
create_dmic_dailinks() is always called. Demote the suppression message
from dev_warn to dev_dbg since ignoring the ACP DMIC in favour of a
SoundWire DMIC codec is expected behaviour, not a warning condition.

For platforms where ignore_internal_dmic is true, the behaviour
changes from emitting a dev_warn inside the dmic_num > 0 block to
silent suppression at the gate where dmic_num stays zero. This is
intentional: ignoring the ACP DMIC in favour of a SoundWire DMIC
codec is expected behaviour, not a warning condition.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 9024e789d746..3366f668d819 100644
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
2.53.0


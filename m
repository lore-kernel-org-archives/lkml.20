Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353761;
	b=meNtEtskXGmbidgsRUKJrc5lw+kUibLvHw7e0TtkUNrHWJ2lOU4LsGzO4N8iPle5aUOa
	 r3eTjUIeDojmMplP9DSrAx9qThkOcniGVcjnl4ihU6R4z7nIEPmul25wj4uOM2I8i094m
	 C/DZkCHyzbw4hlq1h1AhHrTBskBciTUqQnyx1k9Oguqob9OmcrXLplWB6PQL2hZOWa5qt
	 SP/CWOQgRKgXGA379Z8HcernovdJySldvpnDN7ow2d3jeTjsYnZM1MTgNGMqdkMN39DK8
	 8fnbmrfbb4vDxlaLq3Fgnl76n6u719jn5unHhw7AqOHCc3jnZUV75TU/+nxlfl8zi/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353761;
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
	bh=/wulmlUrhtu1yWFYc0A6dbmHcSsbDzUg/5IeGRKx9yM=;
	b=xVctEh2R9O8gf6BdAC5qOA18jpsKhLJEf6YUK4QBTx4DmWmVXDGMI37b6qOM6xN2QPFs
	 DJXiA6GBhxzqXF/RmyiKEDx94qc4JB3B+9mfAtAFlyOzTkEO7cdNR4BKokkRqXaF5wfc1
	 CddVVzLy55EBOHuh72x9IstELYJ81y+vCL6MliUe8mVpJ0HfwHU5Ao5JNqcOKgmi06qL/
	 fJ9LXiWHCz2ChF8+Rq1Gnr2z+cVRx0JHFKYtKS+p2SvZHCbmiOWJhzrA0Z/VbMdEq5KZQ
	 vTwcmgRqvgf1AMABU13wWmBbSorRV1hMKu8NbnxGVVdDXaCkTv9PgTyN2/5N2Tzjmyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kBdaVxxv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.32
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658F606A31D;
	Fri, 30 Oct 2026 09:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0658F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kBdaVxxv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knkmogfW7LRxaKPyhStHI9QMrPikgxAWQDtI+Ph/tpmWWwSeH7c58ms6lyGb8VPusRTa5suhK0OlpDeZgqVkqFfQO0UdQ7q11WF8sPOJJyf0BO6jFOEWzrXm7Am4JGTBWKWLkEWXgTwSZT/ejkxxfyMmlzQVpZMfgDetKP5PtxOs7aD8d5L4r8MYqRp0K4nKHOcs3B0fZyKY3pHSJ+2+A2XW2PPHY2nBmgAX8mJAhmuhvJC4xY/y1VgSdrIIhqf06VZkHTkxOqufcpJrPpy28S4mUZ+nDsalW8N8+m3UivniIdVGcs95asy9cNPkqSazmOFEpKrKgaDn+Xx2ftEDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wulmlUrhtu1yWFYc0A6dbmHcSsbDzUg/5IeGRKx9yM=;
 b=fILsq0ZIz4tsCw9AnSi878VT4ttXo6UGlsplR94ZrJMYesOneqjvSY7joVRjxiDxAXpeKWxw63ZkOcqLWEei9HMy5C04ih5xMXQT8H10fgP1b5rs2xtsDHo0Ky0fLYT3OvKWhxM4JukO1Uxa5v7gSRiRcpkaN8ew2HRRGBOvS3m1k+G2H2S/Tndyo7Gh08Iv1z9uCkIoiBVRhq5r+IAgNXXeTnuyDSLLy5SgvlOZTVXWk9pDt0T97AIfl9K0Orp/uRDqKuULyGg+NxhEm1N9yhYv5cwVTtQ9mLgzsR5xsM294RmtNW2yhR8C9gxz2cmU4dEzlexBWhCTm4rrFUmnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wulmlUrhtu1yWFYc0A6dbmHcSsbDzUg/5IeGRKx9yM=;
 b=kBdaVxxv6VOeI7CPHA/rDJ0qpP70s/PE0+8LqVAoV7ZgKM9EcUaXpF8u7iNUUW7q6Kr/4m7ZIrgwUrTDcsHbABkz6kvTSgNJQtvqDLfpRKemmYG0xcW5djHDBc3wRmeKlTh/blElpWbkbzG0WF2Z8Aw151278blHfX0bVxrNK6I=
Received: from CH0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:610:75::35)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 09:49:16 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:75:cafe::e) by CH0PR04CA0120.outlook.office365.com
 (2603:10b6:610:75::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 09:49:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:14 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:10 -0500
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
Subject: [PATCH v4 11/16] ASoC: amd: acp: set PCI subsystem ID for SOF SoundWire machine driver
Date: Fri, 30 Oct 2026 15:15:26 +0530
Message-ID: <20261030094714.1123396-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a72ddc1-8425-421e-cd60-08df366b0f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|56012099006|261026121527099003|261021121427099003|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Mst7yN0Viy7LQns/vV0lHuXCzSNx13aViOv1dJPC0udiaooRAi/dx7dvYhL9tXpSbZCdp+1OD8TollA8KV+FbtMgUcpHOdLJ/web4pUttdP/GaAk0ES2YjHPTdYdWN8Wre4wMeNx+MKaShi4Yb99vWjQjOkvhmMZ9AkHNgU3pcJLOCTpqTaKGg0ADd+ZkRusDt3IBvp3YOcvflTS2FrKDA4yNDnL0vLJ2218s21/2tIBCz9Kz8J6mfJ2D0+lrUj9k4E37sBcqGstQpIHj+chpMsLeFvDi/piC1Xi3zA1rA/HQQ8pUVWHL87MZKwOAOqbb1/CU+18kGCm7Cb4f5T/JI1F8llKP7nz6vVdgp0cgvDcJrWnLHWGxwnDJgEbu0M/ykLBk1o3xvmAy8alPrhsPbbrNUfWZYgNKK/LMBBUhORGCf+3yNpc5hhskQQr9ncLsu7GN+MQPp5xoV7KsQivkPZu8zjklSctSLVrTb78jeriw0+Ba/fc9elrDyv9Q6OEDCiEObwUW2oj2uOIRMcK+e50GtwWch5kB7DBWdYE1qIOqWUCcRS7z7RCwR6uNr4dmB/uPM/sPR4qx39l9KQJZLLJ55Dde49I+UfLo/9pnaM8irhAIAlICQAlH9EVKBZc4fKm6zBnbR2nuGekNo0AaVUue5/1DvrVLGQVGpZvH/l1QHeVICHgN0jY1zN+ExB52QryPxz1Rzy4y+ENB3JHjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(56012099006)(261026121527099003)(261021121427099003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4brf+GRGw8CkahJuCMKmoEpg04sGjCgqHOOSC2NTC+w6a30oqW7uEeWUt/iFgkPglrosc2zYlX2dLqItYGEWcw+j0LoAs3Jmxe1JDDYDEO33zwEKo5VecMe0dSfS5e3m0d+LZ9xjb9NUkqvJ5MOKVqD2K8z+D6Kl/R9Vh+KUX7ZqDvSqXEL5MzcSAWZm129HxR1knLcuV78+0wD1FYkufMTQT9nhJksVUiYwYt0lJqsMI3QFw0FTcWNb4p8cFwxT053FA+57AKw6JaBaYuWxniEsD6HEegVaaSK6dP7159cegSTwDL3yvApYHT9AUzp5PhYsKvpW761f/fkzZKJQJYxQHPsAgD9XCRPpoq2pp+eNJCKb6U9K9sElFIH5WPiiIz6a0t6uTSlP/ze7QiNIQAXpr4O6aU9JH2BHSvYAd2YARiQwznRffNS4+gFFKJep
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:15.9359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a72ddc1-8425-421e-cd60-08df366b0f86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593

Call snd_soc_card_set_pci_ssid() when subsystem_id_set is indicated
in the machine params, propagating the PCI subsystem vendor and device
IDs to the ALSA card for correct device identification on ACP
SoundWire platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 664b9e960cf7..11cd0feaa16c 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -440,6 +440,11 @@ static int mc_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, ctx);
 
+	if (mach->mach_params.subsystem_id_set)
+		snd_soc_card_set_pci_ssid(card,
+					  mach->mach_params.subsystem_vendor,
+					  mach->mach_params.subsystem_device);
+
 	dmi_check_system(sof_sdw_quirk_table);
 
 	if (quirk_override != -1) {
-- 
2.53.0


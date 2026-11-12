Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486998;
	b=ZFylxVDqbXmM5leRaSYIPY5kpoNXZORaiKRjzhv13vzsiIXWCkSj+G0lzvroAEcUQ9bf
	 gSKta81uKf+lGmlLOiyh19pU0cvlmbbNxBIW3/FlHVaPaNokVaQ/IkEk8wcNddWFSj5Eu
	 n3MTDBKblBlmjiukOB3bQ662x3OTDWxBx2kxyZUR5kDAYgslQqno9Vfa64xNDjtyYrEb0
	 kSIhcQlu4faEK6NpnSaG3Z8EgyI9UeGQFDMsoUiU4+RWXeFgy6V9w6NJB9169WoQhNFAQ
	 mORET1vmt8qB+zK5lxaRaRkKuWptBj7xYa0sDhF3Zajc8TTTPOGtLxKjv6DfXCxQRSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486998;
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
	bh=hfFEH6ym9REOM2aIjp+o+IJLIrmmqXmKkW0hEcrBxT0=;
	b=yInIo8AiIp8FepxxMwltqmvVX9aO7Iovu2xhUe8yyG2SuHegjoAUixXRNR3pYtaxqXmX
	 KruaOt8pJBn83EyuxqUpf86AfvrRs0rhxoVLaLhUJlktAJ1vA60Dn0OfAShEdGuB9QXmJ
	 0Nd14s2eM8JXPpIXHKBX7Jj8/W6Or5zIc+DFgxVbz5mpGRPpqmLCICx9EocFHHh0uPz4R
	 rLXOP2g11IkdW9jaKUVosi6ppOrtc3dd0loKsKl3gs14WMW0+iLHiPt5Nh/HAHYsm2O+g
	 rHOAzLWHIxnMr+A8wD1nKBxvsa3j4736rTA0y/jxWoMidQH54OscssvG54grndjKuqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wkXR1kRv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.65
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4283606A323;
	Thu, 12 Nov 2026 12:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4283606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wkXR1kRv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoqrBY6sllX/efpvtxp4HAf431jb88Tds60jHHGgTTZV+VVNC/QLWb2RquQWfCv6FO+OCAuw44/TWV2RpXG4LwHYHaRzQ97G56RnxRsH82FJwXPY6QvZY4V0CSicJUeRz8hfh7gBUPBu+pE8qhYAIiV7M4b62SnDd18a4Rh8W5rl16OgaNHX0VgZPWyI1wBFvjEmxMLThWZyYKc4Yaua1mPgoQhNNL1BeZ76cEv53mEsi2kfXnFdxv8R9J1LdBcetirqAZo8RoHRawrThTbCcVhF9reu/UjjXpDAtM4OEJRQ/GSi18dk631HUfb58IDwav/v2LE9GFd4QUcApv9FWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfFEH6ym9REOM2aIjp+o+IJLIrmmqXmKkW0hEcrBxT0=;
 b=v1/pbpP4PoNstoOelNb6vyLFLnj9D7ih2se8fAGjOFBzM3P+Ejtvm6TeXoeZUv/RsoUv98suJuMddlKnxlG5+hrFhdIRGwzUP/l55hkymagGgOreebu6BNd3YLPvjiPlezYYQfZDcT02i6dLvGzi6qsPgu0xWmIsZxkDjDe2cgqX3pmLJ5AUV7DenPoYdMrM8cFwL3YzJTaVk1K216vcs7mhuiDTRhszL0jtEpMQ3WHW9aKI4vlmlMQHadxmeU/slUB7yYK4znWxE0RZr69XzxKQX+DMHU+nHUUJqsJvVuA69dOxvHRPt15ZrefGBjrV76v+AN5uENg4MBlGlXE3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfFEH6ym9REOM2aIjp+o+IJLIrmmqXmKkW0hEcrBxT0=;
 b=wkXR1kRv8RNk/cCq0cFg3/+ea5+U8BjJxpx8jbcr3xeaLeMXi/MBx24UBhxjLQ8Vi8qZ3U/uuy8sLItqPE+qCbSF7JnybNkBmVyg/3tOxvCbIsMVWOPoAQNrslurqNihY1CuknWAQDdPf3LDY0ESziWBSKeIMNC4artQmrrSFHE=
Received: from CYZPR12CA0024.namprd12.prod.outlook.com (2603:10b6:930:8b::23)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:36:31 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2603:10b6:930:8b:cafe::69) by CYZPR12CA0024.outlook.office365.com
 (2603:10b6:930:8b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 12:36:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 12:36:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 06:36:26 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 06:36:21 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <anson.tsao@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Aaron Ma <aaron.ma@canonical.com>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/6] ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms
Date: Thu, 12 Nov 2026 18:05:37 +0530
Message-ID: <20261112123603.2891858-3-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112123603.2891858-1-syed.sabakareem@amd.com>
References: <20261112123603.2891858-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: fd68ee0b-b206-40a4-1143-08df40b99468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	46TR78brZOU7a/6mCihsLEN9I/DNTZMvFCcU9Y24sA819Ck8HD0wUIEZ234fbY4x6nL+sJ/mExmwYboeAA9W8XVqVZvWtUJgr0RzxT+L4lOwgSxCL0z8IzHTSOUT9hxz0I6dUyq2IzS42WDcuhbFN0zowTXe4FPDxBmJXoHQ/wXYkL7dsfypjZLA0730Z8Qr6wBO8t+4Mu70KgxC1zn23SqC3rckccw+Y2t8J7t4jaXVseCzNtPb+duK2bjG4csFP/IKOoJ9mv1hn+HyV5/saX6Q7fpKKGgw5jKwrmnXfQHQM7ODxatmi+gkslj8nxbmoXIgID/K+NOZx4C0/pQOZqsiopx4uIcSv6trYN8dzpoBoTXWsy5Z+yOEd0IgofsAGGBznmR8vMJUBkptbeF28YrPy7tJ0w1IZfwHbNF8RZ5jZqQCduTwcnUJx6eX/3eYVdhjty3JEdc053MuKnNWT/v+6W4UcNDXOYBmpeDFaq5NdLS79Wahv/VPee9oaMVcuNrXxdBX6GgW244xym2PI5U9PSTxpT3YZ9U0rYsd3ANz9Ot+7iDUpJqFfG4v1HV2xdpAqzQJQ1IX8wMhqqx6EJFKQC6pbL/m4u9C9WGxdK3/9GUDLYNL5y/9ucv+UiF2HvQFtFNLe8Ofz4a4i/2dHoffrCLPPoPjH9//0KrDQq937W4JnhROTvUSiRJVDf6/W8jFpM85P8Z9ZuoJXcT8Ug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/o4HdZQA1Z3RnI2RUGGe9XN1sV55ZGvYvkmKH7mCXu8mcL37WofZnMxzOR+x6LDdlP8qnZEM8KU5ye9BopZum/5D4e40E/qODNvEO5OeBHRW/gM7lFi6sj+BQidf8llVoHgO8ioxSNf0YBsiCF88lROaLWGy8GVA5lnGjDT8JqQWEMRZZkoNa+nSs/EuLfz8ptsZrtxrJEhxuFQQ0IY6q399roMPyZHaTZDQZSjU3htEnxLxH2U8aZ7MdON85XlOxbfWoeBoytrz6xXQiKx5UNVUDMJ9oPZ4kcDzbnZjoHcPcWDDadUyXWAcAZ70ya1Yo1lvJrrVUnbt+TysLD7/bA7lHO2HdnRq9uB3Q1nJOoExIKwagi5ASLZKNQzv5TnE22n8eMz/oICUSkopuPiftXkLmtH3cIb2cuKXElwpHG+8E6QPyKxhya1WzK4cIpMz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:36:31.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd68ee0b-b206-40a4-1143-08df40b99468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

Add sof_sdw_quirk_table DMI entries for the Dell 0EF1, 0EF2, 0EF3, 0EF4,
0F12 and 0F13 platforms, setting the ASOC_SDW_CODEC_SPKR quirk so that
the SoundWire speaker amplifiers are enabled on these systems.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 1d7487c87265..bb35c696a66d 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -47,6 +47,54 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)RT711_JD2,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EF1"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EF2"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EF3"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EF4"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0F12"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0F13"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0


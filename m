Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794079737;
	b=YFjUEZUnUOIZvPu90HanwNfTaRcXoWFQET4jCK15F3L5H2nN0tS5fZPXO7w7PIX9P9qN
	 sd9O0JnLDonhypj2L0ZO4Ax1NeBC2cVDyPZ5c26LdOx8E6434iYjw/+U6SCBD62n1ZrPq
	 E5iw5hvlf6kP1VX6yu9S+nijvgt/eJKIToYrMWCxPk8HkK7jH8bPEY6VYTWaws1XVFAii
	 tS7jbMVomKe1zTWiPm4VPu0DCqNBXIy7/S/1FupNFITVM/ftytvVkqC1JHYeltHMwKgNo
	 TFckqyTlSM6P0FhP+lAduO0Jygkxjdmqdz6j+ZVpy7i0KLK5Y8tMus0/BjdVTNvVwqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079737;
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
	bh=Gbzm/b2NQbQK1KNpH/KYjnF+Ceao9y0Kg9eKr5fLNPI=;
	b=YxNHRdZfFuv/LxzPtADbcYse/ktksUBTVgU8nW8G7+uTtAr27p/5gC37vrqu1iMHXbgk
	 u+WrgIR12fLq42PxG+85yCRY6YWPk+lHih5RLdG1TZAwaWhw7DnoFhk6zx6TXy/pXRAND
	 pD67cF/yWejbhEuK4g6+sOtIqlElDxEkgB4sCBe9XieKmaWtdK+ANSfJ9O3t49rF75g8f
	 Obt/gbzxKJxX0+ud814IQ8qaJW5RyfP6bkK+FhQKket8mhrKB0lw1Q5vWdROE832sAWcA
	 Ss6xe9cyQWVxrfbYBF5fTIm8ZDfeXltzz6GUdm7pMfmvaaDskCC5kwh59ZQhMmBQ1Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QbeEoU5q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA8606A326;
	Sat,  7 Nov 2026 19:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QbeEoU5q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csl4BmdBRhmuE7tsuxv1cTWiItAzmUbMdDpHnd4GpjZR0KmJDfbV7qQNIcVcjWRpqiTzJc48f8NwB+9CGWXfi7uKwXgLNMfbOnEB2+aCFchXDB1RFg+39fmlI9U911WvHeqSOpn6BhcXcw2Ru7hm9OzknRiuevxvAlM/8zd469cgF76UeiAdn91O1q4XIbsicFhRv+W7NfuXgh/VXLt8lHrslPfVgLIHqnHpFgRg0fu+V3mai3YxIdEBHtZQrVDXeTHVsO61MEhSEqsCFmvtHIvlF8iBRvfaZuLuEJ6ATzuXciboWfO0fo+3NHes2z0Mx52/LWU3LDC0QyHmcNVm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbzm/b2NQbQK1KNpH/KYjnF+Ceao9y0Kg9eKr5fLNPI=;
 b=x274k0WrTvNHNYdpA+GjmPZiPQMo9+LPQCw4rpeeQXZUeKSbY1W4DY5zCEroHwT+6QIJkdhG5ToFtEq2g7bIP8HQUlTNSF78o6atsqjNwSIm9cuua96yWry8w1c4LxTtLFwHpdIIFi55lnvhqLDHkgrXvpArqC8LQjDs8Ao4nTRRNNPmv+SBnQPYcVux9tmiKPSKjDl4KgDs2um8eELbq7TMXfrwCwYxLzql3sDBXveQU4vvV4jpx7W44FYgDaD849icXB8igL5iwwKylrh/ByBVj6bm0iOWrYdoJn0dsAfaL/Y/Wktfx6MGHe6Y6fvmhD5Q8Y++5/ggfz0xpqv47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbzm/b2NQbQK1KNpH/KYjnF+Ceao9y0Kg9eKr5fLNPI=;
 b=QbeEoU5qypWUMa1EXD0LKTCKA5FSajyAA3dft1cW/JAf4Ovq7hNY/RHpvjzagPmuBY3CjrBzKttwulxWSoJtHCEZF+WRYmrHIm0IgFBL+8SU9qomJmQZ4yduwynsXPcfVtu+tDe7QAWhYw6jHmZ/hZ48MRaCYNI933DEGatCJz8=
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sat, 7 Nov
 2026 19:28:53 +0000
Received: from PH7PEPF00000007.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::90) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 19:28:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF00000007.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 19:28:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:51 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:51 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 7 Nov 2026 13:28:41 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Aaron Ma <aaron.ma@canonical.com>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/6] ASoC: amd: acp: always append the DAI type to SoundWire DAI link names
Date: Sun, 8 Nov 2026 00:57:01 +0530
Message-ID: <20261107192744.2027264-6-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107192744.2027264-1-syed.sabakareem@amd.com>
References: <20261107192744.2027264-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000007:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c229ae2-6b58-4a00-a4e8-08df3d055b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|10067099003|56012099006|261026140227099003|261009223027099003|261028144727099003|261021121427099003|261022105027099003|11063799006|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IGFCZ1JCRR9R7E2c2ZX0Nftdp046IBZEzXWXMm1x++4vgmTO4YjBAZO4QRaA+O8wVdxF5J7pMkxixUa75sRCbubgi03zHT7m5gvi2TzyMqSAzz7jSgy5KGAeZgqQHkO89XsUNOb4Y0ySFOFeIOezkCfou2SJXmqVAyV201tny6pTq7YvuwVZwEDHbZg7Pq8TbVMhI1k/sV/rHbgyu2EDvWdSVme87viG8nt4yB8PpGO+/q3JIog/O8bz7IBAUrBlO+csQXdnC661VYS3eD+nLnP18K7U41wqmHlEZ37SRlJkIOGZDyJ7eX2ImeBxXSA/uefnq8eEWRr2USviFt5j4dLqMpXcYt9YsA3ft7Uykg6hDCM/QjyegwrZqnEIrph3ivwf0EcSSKKHH+8sczbI7AehWEqaH0dTmI1ytx3GAmymrCbrBqIZwpDMCpno///bhRUzikaloEi0C2f6KzutQOB8AjNINHfJDEIve0XWyJPV2wc5UF59xPingk6CEWgoxbCFic24DKvwiBLnawNIX7JaTaTIfv5GrOwgk7mXeKYwNuDmNmJC8+nlzuo8tC9izLlAYz0w3923NNxs+aZprY+xTbF/KDEQ2tsY8zspjhdGutw4FpuUt50RECk/E6N2p+oY0F+Dok1jIgwe6nc3P6eCXrF9JpNOU7zVE1toofOwn6DOey7H0uT6t/L5eWiiKrCRtDWvvMi+9i442VTBiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003)(261022105027099003)(11063799006)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YGLo5JUu14L0cN7wkbTfCxijedliW/t77BoHMlmwxjS35gj0Scpo5geglS1/g6CtsNE1WXbRSOzxJWzsUpEWzJvFBdryA1hLyQHHfpr8IpBrkx568mCe7lwbLAp5gx83BIgU5LuYwLxzghAPmw9hQu+r0qCF/MTWhkngYM89Y+zA5mIMQr5x+Cz87QKY7e1RkQShnDykRwq3HxD+gfqj91jsb6OtyUnDi7PjI+YvrOIP14Fh3HsrpM+vEtqo+bflxchxMj7stbHJDhn8wTjVKoXdMk1assXQzwrmFkao7IpfjD9nyviwoxV/kx/skoKH+WkajuD+iu5x09ea7qNYnu3g3l+AhfhLsqsw0szpDqLRN68K1wersHrv8KhtPcI//dAGYkcEQjzR8OXqh4ZI+DCA+zM4o9g3oZyxKlI+n2RH6u5trOYhwHeL/OIaHytF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:28:52.5445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c229ae2-6b58-4a00-a4e8-08df3d055b58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

Function topologies are selected from the DAI type (SimpleJack,
SmartAmp, SmartMic) in the DAI link name, but the SoundWire SOF machine
driver only appends it when a link has more than one DAI link. Always
append it. Existing topologies are not affected as the topology stream
names and DAI link names are matched partially.

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 4e21d85d4724..842278d850c9 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -398,6 +398,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	sdw_be_num = ret;
 
+	/* the dai_type in the DAI link name selects the function topologies */
+	ctx->append_dai_type = true;
+
 	/* enable dmic */
 	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
 	    amd_ctx->pdm_sel) {
-- 
2.43.0


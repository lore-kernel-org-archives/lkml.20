Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166366;
	b=CDijtakzIToOXgonwFcQi73h4NP/qXhackp5HMebvfgqwFCcSJTExNKelAg0D7vzXjmd
	 L1QkhJK5I7smdsNBXtlQv86Br2yhxPMw1/A30vnuWitnFrxlwxTuz4Wf5F+jjjoyzDXrB
	 8tc10mhtHxfA1n9bxX78Wn2f18ucpyRMQYS8wppo6WMSfMRc38tK14inzrZj96ZD2fiwl
	 H8vrUEH6At4UMV+l1tC+TEYboqHN3Hz5Il81LckUq3egQqsybhTDZvBKy+Wxm423Wty9k
	 t+nXufFVWvRmADva+BzJEy/6/Wq3PNge8xvTxItIhda07tuxh/L94jXStqB8bCRcxsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166366;
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
	b=cxiEKpJxJ6/sKPHIMt5bPwqeHKdskbBCK48lMNFBBziqqQR8y0efIf4TxVB31d8HZWRP
	 9wUzf0AKcdKst/532mpxJLmdiijvboW1HLxMo1rk3cCI6lphvw9G/sdAMRdrKUwXGng0z
	 /0V+yeESSMDCqswF4rjphx0JjMJb5XV1blmL5HTpnbKbBxdf1mPa4e4me5OslfQc1PkK1
	 USpt3op/srR1KnvUlJ7HlGTvnii5iy4FXvsxQ01aVHbKUQdJZdCYx1RMYv9zvxuDObd7O
	 vbu3WnjbcVFO5JzaZIdqHYKxBj4QlVdusP2SM+wFaQROlN+DjJj5hM7CfeH2+EV20tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4yLVLSXw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.16
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBA3606A326;
	Sun,  8 Nov 2026 19:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4yLVLSXw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiUJy+upgD+NgY3Rke/lQzv6DEKIxqCYKTzXkc6bW1Lwk6KjD2m4AoNlYv6OVYPDaHNImYg8qavYFC1v1UBHzZa9YjM9LW0hopt/89ak1L60slYKUrdURI7Z3Njwe4SsuRm/AVZCNh1AcTgU+Px9ZDY1kz/6cvja8UbARJ7RPMRazXm7E4Zv9HJm7w8n1SDRMFkU9pXp6sU0GYbS470Tdm28X1k3dcBzPzUkPOYtavUPRjacr94I537JYXRHyuohyO/Bn8PLPWWJrGaYDPuUdrOmcXEeH2siMTBQM5kZ9IIowlnrYdvMhmzw1kovweJSdiGZuk8y7od78GLxRfR+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbzm/b2NQbQK1KNpH/KYjnF+Ceao9y0Kg9eKr5fLNPI=;
 b=oQ+MGEqwnFJ97IkOYiSMjoNMcp8W0heEA8SkX4H3t+c2Hxyz0aq2BKyha9OmUF0CqGYp35Lns0Tu/3yRTSKJxtZj4egpsYpGsqP8ClEzf9CT7HyLKx1tlzZ9UK8yPIvxFwsNOo137Kb0+oYEteYUI1A3sZbJDgeOtM++RhfrY9L3k9Lh9PUgc9AvKmP/0ue9u+zr5YP89Cd+q+1Kzd/npJxTbp0GjRxp3UxQMCy9PZ21Pf8Kr9WY4Okc+nki7ZKqd5CqGPCQ97Og+LtlCKrj+4Djl9I7Yu1mhRWo0XHYB8Q+iQOvSx4/LSgsbSvCZjF1gvF1OpIM03lp8p+Zu9AUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbzm/b2NQbQK1KNpH/KYjnF+Ceao9y0Kg9eKr5fLNPI=;
 b=4yLVLSXwsk2ARp64zefNjhsovdAMihhsJTSc24kGs+710sB93gliw78FPZJHif8GNCOCSz+c6UkCFlBpii1LiBLN2/P9RVG4R0uQUbjD5IS8JXPT1eGWh4f1Gt8fFQ7iQAuV0tvP9iTypdDGdIJzUvP97N5PhXPWXBiyi0IjYeI=
Received: from MW4PR04CA0157.namprd04.prod.outlook.com (2603:10b6:303:85::12)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sun, 8 Nov
 2026 19:32:23 +0000
Received: from SJ1PEPF000037AC.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::9a) by MW4PR04CA0157.outlook.office365.com
 (2603:10b6:303:85::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 19:32:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AC.mail.protection.outlook.com (10.167.244.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:32:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:20 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:32:10 -0600
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
Subject: [PATCH v3 5/6] ASoC: amd: acp: always append the DAI type to SoundWire DAI link names
Date: Mon, 9 Nov 2026 01:00:33 +0530
Message-ID: <20261108193119.2308421-6-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AC:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: e91a2b0f-f413-472d-4152-08df3dcf0309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|261022105027099003|261102123227099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ssrShob/FY7iii7Pglua8lTFvuSYgVyR4kS+r7aYpYlm5sYpqkYuOLijBHy2BzfYEz1jEJIYwfFmXdxKwEX5rbpJ4/zya4ORQPNwBeoit6mA9cR6RJke9PSTSy7N16s968Q94NFIHl0C4mp/fCOaqTnlUHN/tHnKteW0ylPLChdk2dtJd+a//nZzNUNS7fdzGcCT5uqE7uaS+xw86F2dAj7XiR/6T8cvWO9kdI1/wkwZ9LRedApRF7U9vjEydiF4NMAK1aUBtZNg1KxiweEUD3g0cbnWmYwFMeChmZel16tm3vydadlwB/7zU/IcJsIEzotv/b7ddx2wMtWwx+pvsHAywie0HWDWE25KjOlu9Ytlh8Zeys+u9iFWHNNvTOPivvgtCBxK4JgG3YGGelsXLF0lXyPe6r+sej3zXD8NOpOg1SqXwsMp8355ju0EIRbZiWpepwDkksRnqAx13t8y63LNmAuXFN0/DXsvg5RvYhAdE5fRPu6tfci8PKFvsgwKVBrdgRmAzMv7JgdZcDL93ud1BSEeUVBp+LzCZj25oOWo0v30qKhkVe/cROTAwVRLCcFoh4oh4dr7VN0bizAlK5QHFMI3PkAIP1NAFLAb9Ojd59UJRjSEqwsRfl5mVz07KOC8CdrHF/ylgtmYXqQ/Sumh4Wj2GLgwdz4AQchJudtKg+lKKn0lg+grzTmC8GpErtWT5VL3P6r4qZazy3fxmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(261022105027099003)(261102123227099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gNRn5dqAB8nttE36WZYffMBMggPZ4xWVLoxx6/K3UHnHKLc2Oi34k9pBkIzILp8OCZcYQHCgEUucoFk4WmIxl71NaR0xZ63/MC8TduO67MiwyHSO6WUZCAB7Gj29x7P61nhFcC8A+vX08Cxg3vxBIKk7nyVLJ7T9+rJlnx90GB/ExY1ept9nF3AA/+EEjCoUklgVhupouVhj2AkMRscQjpfRsZGN8iU2XoKEAAwPVf1mNtshe2v0F8K3XxSdQvFbmNnIhhO8tOU0Z0TrEjUWvplkBlqpfCYXSKJtLfI6ZQyFx/5lPMOBZk7FT47sISMIU/uda3m6eiHzxAG11mPz+gJJlNC3BThF0oEfR9PTxMOpWDf3utFfUPxFd2bv7FbYisaHdANLQI9+rGk/3Jl9YDNZaisr7bsLB1dMJ0fIbZamwWN6e0yi9kuYrdz0aENf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:32:22.7332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91a2b0f-f413-472d-4152-08df3dcf0309
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746

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


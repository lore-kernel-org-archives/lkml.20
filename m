Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794074238;
	b=ZgbN//WaQG/NFXMnKpjOfM7BorVuONOH2hcXGsIcKYePOHZBvCJYF1+rPSu2pEDQexLI
	 ChwlrQlcYJr5YlX0IWkpoona1Yt0YottgW5vSJgSlr1TQhNouNES1w6oQkr/BQ0snuJ/L
	 urZiC74sk9+iFDs5enbdBY5h7Bpmhsj2CnuhSJxD9vkyScOT4/v6ZYVcGZa1eqqr2Y6Qp
	 SsW23XpIVJD3Kh9MVFQsbfEIOuD6tb25VwdQea0SblLIv6BqxeJ2tPmWuYt3GLLqYXDzC
	 Bc1aZo4s4W7FoL91MAV3h680LtWM/ydWWJM2xBUmw3kor372P13EOLkcJ7zGXXUvHpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074238;
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
	bh=kfGWQ10e9YooNzt55L3vZxPkoz5GS3+4+0zT7uXGQd4=;
	b=dOP+WSKUkBLYlhoNGkZ5eiMFV3/J0Pb3dWFAiVT5YuO4/rkEGZenyOnVodarzDcToc9T
	 F+SP69+FDX5GkJjiPTQvVz4rs8bq3yS9WnvNd3AeaYXRVS3wVCimKeBWL+mDYD10Ij2UJ
	 p1U0O4Cv48Xi2yxB8avMFnTtEUMpcaNEcMvIMJM7XCYR4kUE/aAZHPlRutb37YYoh1okO
	 pXct798x9KNO0mOFw/JBp3JwNMHYZJ7sbg2LyyNBISJjR66jPJRltYA3IJT3GxSynquMo
	 oz+K8ozYCESklVDaWimpdSVev/pqCcr7b6ORWZVHsg0rBe3uy2/lYKN6gi9sJPSsRHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="v01oOQ/f";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.47
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013047.outbound.protection.outlook.com [40.93.196.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEA606A32D;
	Sat,  7 Nov 2026 17:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FEA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v01oOQ/f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trgb4gh1SDP4p1A8dx0MtsxYVYKGjmeZGhuAunCs9cwEQWAfG9nOnfEztGilLFP9E55A9BcyVVDBIIkZ8oLeBMmy9hq8pC5GNdKLlozXngqSpOpgiljQiaZCIRk2xU0cQkIjd8mXxO21gb0XnOOQn0Xq/RXoMZhGM8+mdpK84ck235YKo1Uf2a+wOu/3WwzjgrFZygSKtTn8PiYLuxGB3mfgWTmxpLz3uKRdPliM7AsNWmzFXSRqKoLX39vDXTdNWxkxxFG4K4dIhuy5dV1R/u/rgnTzRQfIMoZVLnei07wMXeM9A20Id+V5odjdIdAAifEmOG7Cec0NFkIe9F2tCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfGWQ10e9YooNzt55L3vZxPkoz5GS3+4+0zT7uXGQd4=;
 b=xiAIHr0973hU05ZOJ7TpliZbfSiUb9mkP+VmIhOBXwzWxiHpm3ULNwvQIExoyHJ+84HHh/yowZTKSTHtXGZwtbUy3+6tnoFjvtpTIaMSuacKOPM/qBOHhpSYqqfNuCWDSCb0XDr74JszJfvzkKANtZeUyIUtvSGcotYevI9aNzMImbA41HPFLUeRCocIp5TPNoVqLtkUIyYExaLiCRm03i1T+V/TmKCOiesMJsf9h2+zjJTSzpnqNlfuMbn22lytMhYOR2GO9PgkUFBIj2qLZuBzDBJwy+iud1BnM6VhGwG6TG40t+s/D0T3ODXGcUlxUNrglqp73EkoFHrrILDYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfGWQ10e9YooNzt55L3vZxPkoz5GS3+4+0zT7uXGQd4=;
 b=v01oOQ/fu29ApnfoR+Ftw7N6bLjtAXAELP2qrIW7tEV6QgJeeIpXFiFX410sp7jFWS3dFCkge312hCk5wqX3L6vCtSVE1CRDlsgOVd/FR0R1CP+EO5LtcBcMP2gypQsleAGjRi+CgsLI8dl9ihoSCWo3zvI07mn7Vb7e/SBaZug=
Received: from BN9PR03CA0092.namprd03.prod.outlook.com (2603:10b6:408:fd::7)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 17:55:12 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::73) by BN9PR03CA0092.outlook.office365.com
 (2603:10b6:408:fd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 17:55:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 17:55:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 11:55:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 11:55:06 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vkoul@kernel.org>, <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>
Subject: [PATCH 4/4] ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled flag
Date: Sat, 7 Nov 2026 23:22:29 +0530
Message-ID: <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: efde6d61-d90c-454d-3050-08df3cf84553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|22082099003|18002099003|13003099007|10067099003|56012099006|11063799006|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	zi3Qiea7dLRcB32kLkpvjdsT7i9XWqsv1KteDtZxJRnmDH8QfskcdiEV3hvF1KpaguhV/WvSIKWl18PiPooYReTL9dWTkhpT7b9bbAbcnvPfiL+9tyPNsLntwCCUWCeurxt+jZDiRZNU7U4DXlfrmW8JiqseP3LCm2gKBidOMs3Du4uj/4b5l53//ag7P0EI8P0AuoNnVqwQiJmr9plPd4mBVVLIAX1mFoP64eNvfd43XD5JUZIgnr0MpBS6/SQpxmtmsenpTRXWMR7KVGrgjxfjxZU3oWVnwa7a7ITURThxsiIVTDA9/SQqpfEKYjR4uvPwM4q1AKWVGdeJ2rPYUZPgcW7NTlCihFXOd0z980i9CXLiXDoe7U9VPYC0rhINFtwqdJLVK0K+OPjorG8Moy2XwbVTa2Y7ON8HvKBKqZyZY6nCiwbsVXvt/bVQgpBW2pDJ/V9o+1el98SreC/RgvTM57hfVWOhfspMBatHoidlb+lyGUc2bNKMuCHn/Ig6OFI3O69qKseGXYewq0gvYL2fCW331R0C7sjJz8PpE4eO6CD0It6sOX2m8WOQskJfiGDxxDpAht60zZz13gHyt3Ks1nm+m4//8GLKaiQNTeoQChtT4FdQouSsqVKpMv2dkopO/cQ/oAN2eI3MI6EroQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6OnW0gzkftGt8zbs4a4RykEJ4BW2OD6Cz40M6p9IoZQSHGN+pxemyVmBqOtYOvpVnry10Z+XcjKBUnD5fmQCcRA1Gd112nqH4To/6dxpwIoyrRkd/9px+D2p3YsCb7BNnx4etdZuw1HSxxPaSyi9Y3ZKlvzQ1p6KDIa0uYgMSSBftt1Wx5JXV876+icWUz3cNZwJvlAQlhR0fzdl80m1GgHgOHPBlr49cNbknlwZ+GlfHs8JsheAEk8Mmj1vGQU3nM2sdrd5loMcgOXQ+WlL3ou3aoEkAPlbkSe3az5GgM2au9ZxKxCm2G4M0uhRiu/sMVQaUIYq0YOdRhWJQZmHMf/MVoZwa06XDu3p9OqXrysq/E6Xx9dmzlUrguaLicrcPhgaMxXej14hzxr0tcylXyZ53sTibNFT8eDW2LsLjB+gvpZ+YxICG9iwEnkyPR2W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 17:55:12.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efde6d61-d90c-454d-3050-08df3cf84553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

acp63_irq_handler() called schedule_work() for the SoundWire manager
workqueue guarded only by a NULL pointer check on amd_manager. Add a
check for amd_manager->interrupt_enabled so that an in-flight interrupt
that fires while the SoundWire manager is being torn down does not queue
new work after amd_disable_sdw_interrupts() has cleared the flag.

Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
Fixes: e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp pci driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index d0b66df10157..0442010e969c 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -215,7 +215,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
 		if (adata->sdw) {
 			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
-			if (amd_manager)
+			if (amd_manager && amd_manager->interrupt_enabled)
 				schedule_work(&amd_manager->amd_sdw_irq_thread);
 		}
 		irq_flag = 1;
@@ -226,7 +226,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
 		if (adata->sdw) {
 			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
-			if (amd_manager)
+			if (amd_manager && amd_manager->interrupt_enabled)
 				schedule_work(&amd_manager->amd_sdw_irq_thread);
 		}
 		irq_flag = 1;
-- 
2.53.0


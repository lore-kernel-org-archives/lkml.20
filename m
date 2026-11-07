Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066517;
	b=PBeQuNphieZM8foeYCvX07sNvYAKmb5xkBPHuNoaULkCpnn3gmdeUgFDIZVkQ6d+G2Qf
	 dhw7+1OWvPMDNfIWQVg9dxarBV/a35pXf+Ou5OFhf/ThJzAUtJcl9oXGOKwASj+6luCPF
	 yAzJlhISWLtDkd6nph9O6SbUr6sf7rWsj5B16QHjY/IlFgBi9+XBSApBniqqPKVCAUqb+
	 NoCJ0eTaGkcrDeGmka7h70i6wjOSnHKHmjefKvZzSSFhJybVTkOQVeYZ7ngekfl6yW04s
	 mbrV2VhIVQzGtQzlIM2ndPnp9F4mmariu0bqm06DoEoXqdbgPCc7kldkLaKGkENgp7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066517;
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
	bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
	b=VRWsSuedDAtAqCo/QvTj2GwLTVMZKUdHisqQWlqztf54i+dL3q71H3gYJ2VVOAm+dOfM
	 FksL+YCLA+q0Ln8x0FRuuFrY16p6NR9iYJ8XAsSAUt9h4YtgnIAfNxhhlYPxs91dQQRjB
	 ix8Sgc21DF4wXH/IEAXxCqnHt8hJQAdNL78BC2yC0aeuXnJ5a4isv48TiKRiiWszH+scD
	 XdJO0G0xLVex/xmdx+gOlUS+kyNyvx7w2UbKcMmn1Tm5EqQf/QD4umVJRbpnu5w5+DSZG
	 thv+DDYxwMdIxjSYTt8AjsdBDT2hTVOSItJBD7nvZ2VZWudrbdjr/pLQTtXaMyQX0yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ym6Bgsea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.6
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020CB6082BE9;
	Sat,  7 Nov 2026 15:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020CB6082BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ym6Bgsea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZP2VWzA5mqraxCyRPC3smBKwcg/8FvhQsN+VdT9S18LbgAruZFluzstbZ5R+Mth9hFFQI2B91nF5+P3EmhpWHOklePQ5HDGq6gcoOEZtO2K6Tp/js1QGUKD1ExqRzQ+CyUYHUsxB9xnLyHgvJseo/zr9JBcxPj5vYEojMOseoBsy0DHmS6MFO/RBvm2AyJLE+CzY2rq06BxTYPLFO6J1ISycX0P8kxQTt4Mv3R4fUPV7I7ZLn8aTsDw2IVoujT8axqUlnSgB+eKheHC+I6WER4aUIVjT3am32q5D8wYUAQRdMMivoWGMvgFqKXGYTEgF1dt1tjvyskQRYvOs+gKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=yrVKd7hi6QXntCpgqHLuNDRF/giGYg8oeyzbODmyHEvm2KKnw3Jr1Hz3/3edRxT9TXSRsv7WgNQ62/Do4qbXe2jPiPn5TSBaDMO6gMJwiSDDakmtMafFT7psq1ET0QLaEE9OPp6x2OCVvg74ZoGm3Hi73FA39Wj/Gr0nYwtc5dRnDDWSk2T++EDtQw1FzGAApkPrLmcNZocn84LKMh7ZQMJkvVgEAkTCqWE0w9QYutRzvRsHHkcgRhucyv8zeS9ddalvIIpa5tcUwTCsnzLVxWZHUwKC0/0nfYzEQQ2QutUX4NAyLx2peMbakL4hRdyJAxHaoZgl/glGj3p6HzJ+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=Ym6Bgsea1WOPJ72L2eLhmVcb7Edw1UYbyVUac9TmkitKJnaGzsE8pAztHdHV7pplb9VP420geJK8Ts5PioGwOJ8ehAZN+MoaD8+y/jxqWOFFhb6DfR7Pxg33WIF/DGXL25gznPw6Rg1Zf4bBG5KSMI6vRnxiWjC+P6LAMWy4diU=
Received: from BN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:e6::18)
 by DS2PR12MB473522.namprd12.prod.outlook.com (2603:10b6:8:400::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:33 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::2e) by BN0PR03CA0013.outlook.office365.com
 (2603:10b6:408:e6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:30 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:29 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:25 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 06/25] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Sat, 7 Nov 2026 21:15:15 +0530
Message-ID: <20261107154659.3358223-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|DS2PR12MB473522:EE_
X-MS-Office365-Filtering-Correlation-Id: 17578ab4-dc8e-453c-5eb5-08df3ce693aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|10067099003|261022105027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lXkWMxLqr4QuV/YQl5Gk7YmjJcncSToGvLN2Hl0WhOmQCzkQutvjCQKmGJv0zMOAJKeOd6ln8n9smiV2LATyuGShEDXZKzYxG608ysY9e9RXiozJ4l8J+0evr6+O6uwJ4y7VHtH7TaE9m37Q/6qW1C4AnpYjcF+t5Z5PMzxPRrnx5Jv/xjUERgL3wb7nvz+5VrHjD21BYsbSY7SRZqEaC3daFxkwwdrW5z7GAX5ilEJvM5qwVxhv7bYYJ+WrfJ1YI/OD+bgWqIWxFy8rNQ2OFzPJwOZM8EAsohUnSfAb2CGkdpZP9aHDZyz9ACiUi5uKEA9gim2oXAsFUYVP9fiuHkwEzrADkZXFRz/w6VXHcJ33NvDhgimFd0QNtrHu6Cn8IOM5GqR+zdRFlPgduXAWAnDbwcCVkedvt0fFlPJrV/OZwieFftvH7B8lKfAkpN2l1A8nSexgJhxQ0UsKtmr/Cgwy78KXuuUTSVg4iZu8Gke/KfNx2+LIwtH6nTgGZAdMXM0siSJR/JjMpbQcmuGcMirUf7NMFVG0pAGWIWW9mVaD+svsn7EGYnSlktDJN4+g27xjnsenBLh8lq3lG2E9jiLcwxfTJq9blDYk8hYed+bU1MlmpIxzwVirC3Ps0p7a7cQXzeLJtPrzT3Ak2PFuWq5vFblc45mDXnu1vzYJIlnqgT0ZAyaLNx1WS8GmkJ7r6wJEz8lb9Ek2sIvHVrIbTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(261022105027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/GTtPrZhjZPiV1qTZ9S5upPZ4HLgrIQ3MFAbZkoAyUyNHzg4vWPvSjj4X2KL++ESUcKwzOmYAYLdv9hZNZMTDwzEn5gG0V/xD8pZGI2E07oOLusBHYfQ5uLvn3G89PuH3fT+8JEj3fWxX5mNUB32docOImixQq3jOMvpbI3ti9zwnelpfFXnflXyYpBaokrmkQJES6pOLOzOjMuS4gdxJJ6NsDZqeE7KNV0VrZF3LLbf6PlFwLgTtMkTyeiApWB8ePg2RQMlbgMSrb/hcCrv8F03AHkWeWYS/c290opBbEJAT8J54iiGfwn9t3VTOkm4VPayd4QTJSUr2+sdEDiOCGKU3Wb1V5JEJpJccYDGZHQjI2t1exDhuwgRkaguXZQ9XesDO76akSUxjdEax/4nh4XlLdVd4+sRORnGKUtdxEWUY4lZn8HBoDJx0fbhhYUw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:32.7040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17578ab4-dc8e-453c-5eb5-08df3ce693aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB473522

When a wake interrupt and a device-state change arrived simultaneously,
amd_sdw_irq_thread() returned early after the wake path, silently
discarding the STATUS_0TO7 bits.

Remove the early return and fall through to the normal slave-status
processing path. Clear the wake bit from the local status_change_8to11
copy before proceeding so the remaining status checks are not confused
by the wake bit.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3d60bea82792..65626ca590c9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1110,8 +1110,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
-	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-		return amd_sdw_process_wake_event(amd_manager);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_sdw_process_wake_event(amd_manager);
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
 		amd_sdw_read_and_process_ping_status(amd_manager);
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899512;
	b=HSjr+LFSmZl4xNa2EYS5IMuJmZn/y5ZhRWoDxVBdI+mNup0t1+y0C/+6O3UrtJpRJt6I
	 x/FyQO96CNTzXXI4/YACU9lCvJVfAREnljD05AArW3g5g2zA+n7xpmvW4RfPyQ1sbO9ry
	 lqY7KbNZdQ26FLWxP3Wea/E7p1ucBxfMd9A1hQ93SH8berc3Ppbc42mYre2R1SYa9CUHE
	 V/r2ugp55rTiNiDPXcqCGOvdbvnBkp6XOeqWiBRPS4SzU7uoqObz7OaGg8rzR6B0YnPik
	 ZLnMUksIj/g9SmoKMb813pI6QGbOdN0eY+ngLaKFIT6ydv41yuO5Y7lAWzW34iPRJwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899512;
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
	bh=SlDKNjf9qIfGxys7+nlXlvUOHrvwKraPuXTTvJwR02Y=;
	b=RVL5yLyf7Q/UP+9byU+onUSPWC09hXj6Z1NenY9jSc/FuImAC1xeL1KgDBcemV0MrW7t
	 mIM95OCdAUfr+HqVWvWYsoqMh1IixZKh2TmX7UruXkFVeP4NnN4kY4En24Mz9FLj49zCv
	 LMubt/FP5BKTb2KprQ9CVpi0UnABZXrQZaiSoclYzTuP5YEf1QMCqmt/LVbQEqvvLxMlg
	 +IVjf254zPQje5yFpA0Ye/dSu0wG9zdbCXIjsDVPBuStAt7zZkKXurBqUQU96uA32Vn/W
	 xjXn0JP6upr/t4Q8UWCPefzode8A92zCgKaFXfgg4JRKkxlUk1lXOk94sBwkmCHjXFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A6fe3KCU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.68
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2060A261C;
	Tue, 17 Nov 2026 07:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D2060A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A6fe3KCU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+PfRbm0lvISID4WoyeOpOATXZ/WC61O8exOUTN8Ct+rFozaIAnVADSX5MI8jzh+hi0spB4ZOceGl84HzK6KUnSONkXL4YBFJcqAg4wJcUiaGMm5HaZpHw1NZNKNXlpe0DqQCWmlKY/20glO709XeQf4bHu5kuz+4sMgilzPwzfHAWhMFc757G0GA91o8MkIHQYSFGw6VdHvDU3m56+AVeOxQSG0jXe1e+1zc9+NSlUPh4efesdaTgCg484bUyV3BKUGW2jUG2yw0E1zdXO+F1hsXYkN0L4ElEmO26YY/7c8OI50BiD+iW+vXCAkVMdPcldMeGS2bqthTZ4K/I7L+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlDKNjf9qIfGxys7+nlXlvUOHrvwKraPuXTTvJwR02Y=;
 b=JvwA5qA0yi0UOPlewqGoqMSDgDfJQDKnsdmWdDSt84BMQsbc9HLUHwEzs23HX2GTrAA417VdLGOGOZaevjRO0chL71L8xNXSF4myWEgMG/d0tJNug/ZSMEpLNjJFWAX1OjT69D+8LtlR3U2cohu/h1AMJfte95POpFx/HZt2QheYZX83B9SVgB8n28vLamlLQO7KMH7Lc4F6s/LGPvE+KVuRRhw1qJujDsI2r2fc/PZHop+acJzdgwNbjeXsIpiRYlcksY6nuzhNiZ8EUKAfiO/DRzX2m6ROoAI4iPYaWoJQvIEbsqK09ujMVIb+rBViouek4seWjCi9vTYQ/2hRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlDKNjf9qIfGxys7+nlXlvUOHrvwKraPuXTTvJwR02Y=;
 b=A6fe3KCU5rksBecXIBKjXJOmkxuD/TNjfIQV8CT2/szr67Nvgg9N6v7b4DcWGu58PhnhAbKjl0sepuI9TtTfHIvQ1vS0idWKyNdvvTHpRUuN77J5qjq8FWDgAvWJC5PNQT2e8b72r76/FfsvdJQ264jvXnI2x6CyBu/sHJ7JUmA=
Received: from CH2PR17CA0015.namprd17.prod.outlook.com (2603:10b6:610:53::25)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:11:49 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::80) by CH2PR17CA0015.outlook.office365.com
 (2603:10b6:610:53::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:11:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:49 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 21/23] soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
Date: Tue, 17 Nov 2026 12:35:56 +0530
Message-ID: <20261117070906.803139-22-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 99dae549-acac-4c62-5f88-08df447a0c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026140227099003|261028144727099003|261021135927099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	AQnaorg1zUHdZ24Z4qMi9gsXe/pcNagcZAAg2FWkVKsI0zmZqihxUG1AnjMv54+J3hvdI2Nqb8rzJhScKNcosNfW/Fgduyyc4ZGklfKVyDnAdfIDUxXyWK2iOK9iSXZw91IyjytEiIS0MtDJbz9zrRVTwFd44fBt6scobY8vsNVnJ4yQaEEDwENF3N/SaM3LVGxVTNetEZ/jQWVcV8tAAixpE0IrrTpLU1U4PwyHM2+fHH7BWKqOsVUx+DmDTGEKEk2bD+AiSRWjc8lIRUfBysfM+0YvhhQnXVeTMPZYuF6ZVFcaCVwiTh9ApJAt6K/2BgmVqkxEwfQpMi9zIiHnZ2Qnk9/btOAlnqzkhYWkISRDqUlFaYkeSjC8eo/IPQ0Ld3O6bmxahj9m02ocdWDxhd0tjFkQ1NpXA0VkDhIFXfONiT7+9FGxEYyZS/ihPOHs5EIYpP57LQjZe6cj5wMyeNeLWepTyQx+U/TuRkxzk2lrGLNdUoWBrN45ijIuAfsXGMo1d1UV7HdaSqLX+r+BXETuyVredB4pniXtPVup1ypnF1Cfabjl/8wYrB6Dkmuy9jDtippon6Us3zc74FIHcsnFmMHBOhtqV/eoDkOyR6UZqDepxK0jtmVy+IFuqkSndGKtZh+C7R0J2YfAVXYCoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026140227099003)(261028144727099003)(261021135927099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLeQh9JUhI4RWuRUIJ2qV7yjyXq2GZCeisoxwZrCZCnYEleSfDq27JXWlIEWxEmw7nHnusdWP7bkgvdNjundSySh7uqXqafqtiA5isjJbhKohp7OgSKG3RN8UwjCvpKzx8oEWxgLl67f7Fh69RyjZ8/h+JgtE3IEOCc45Dqxp9H1jAXJNXbrW2kullSTbc1swvPRuWmha5wYC3dqj7j28l/prtqkOZ7LNgypYmb+w6UJet5rbZJ6ptTFwi+75oHqnX5SZG8V4WDiLdNHzvMTDp66hqTBF8pEwRvkdjFQZa61l/sDcXE4KPH+0vNk6WXVWz01ia2rk6LmiOhHdLPwywyAI0CzbcVxA9Ef2HrwF7T9xhOftkXvqlXtg4FugFXhdomF0CB137IKzOGKjVbeOAJwQQUTyE5fWPLO7jgGqaVvAWHAG4eAkeCY5umU3nBb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:49.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dae549-acac-4c62-5f88-08df447a0c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

sdw_amd_startup() calls dev_get_drvdata() to retrieve the per-manager
context and passes the result unconditionally to amd_sdw_manager_start().
If the platform device for a manager instance was registered successfully
but its probe failed (e.g. due to ENOMEM or a deferred probe),
dev_get_drvdata() returns NULL and amd_sdw_manager_start() immediately
dereferences it, causing a kernel panic.

Add a NULL check after dev_get_drvdata() and return -ENODEV so that a
failed manager probe surfaces as an error from sdw_amd_probe() rather
than a kernel crash.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6834a8a0-632f-4c73-9174-0fe7e06b5303
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 74d6c0f37104..10b216871703 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -172,6 +172,10 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 		if (!(ctx->link_mask & BIT(i)))
 			continue;
 		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
+		if (!amd_manager) {
+			dev_err(&ctx->pdev[i]->dev, "SoundWire manager not probed\n");
+			return -ENODEV;
+		}
 		ret = amd_sdw_manager_start(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0


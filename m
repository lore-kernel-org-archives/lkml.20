Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066710;
	b=eHAsrjjT8BcAwJMGJZfWXbILUTRP623qYNORXL/9SwsUN4wlmfnmczXJO8qieGEHRIDE
	 UiwFPjuGtQqatATzhMJQLoqhwtQYeTPF9Llxv7iwSOHXXB02bXkZDPIMn87ikcX4OeAE5
	 /MAQVxlNeRP99qZQFkvqGQATU9RSXvkkJPHhiMKD8DVhzRgEAqY7/JBJn4326ap2Z9Ppk
	 NOBn+RZ1gQFz7JDFc3OfunKb9QpMuy9sMfl/OzITfdDEIv8P+MNL/QKsajY6gYukbVUdE
	 1KM7JXICtTtswvDCG3NQJI01CmxDpq7a0g88fWKN8PjCWP+1b3fIsUBCWN+mwCegziw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066710;
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
	bh=64X3U2Uw2AEIdfrTGwXGAihZAGKWMS2u75AhtiO2UfY=;
	b=tT9fFNHChFNBmQVE8f2BrEUN9k+N3cQgpfsMTeREq46l2vA3ZlIZqSPJ5k9uPPPsZitR
	 H6I5B5ZSujIlT5uWxy2lQdDiAtWU+XA1k6JNhNeZb69mOqVbvzsw7yBqDqQ0T73kra+zg
	 s7ZqPA/Iwz9wWelCbrzUhPXLsJYu4CBSqgRsxY8BZ7eYz6U0WyIq6nskrlVuwNDHDtGQP
	 v0gK0FP3uJ0G8p14Y0uHRBfytn/vF96/JxT+Ykl4j9o1JFmHYfYNlKXo65AGtFs6Oiu6L
	 E69HZULasWVK/TUV/VHMeSFs631jqzTF8qDlig7W8RKL5a38pfoBIVA11AGIZznqwbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xzzeKB6i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.41
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83D606A32D;
	Sat,  7 Nov 2026 15:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA83D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xzzeKB6i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOVuOGaJUHkqrVaIY1ahMUxvMFfGyKHF8QhWN015WGftFO37mFe0olbltK6dsCDs744dul3BG7WRHEPZgWeYc0qSsXT+VT/7CUGXzzDn0JhXQyMAjgmgx65xEWHZvyLaQueSTMojFFUxIMFp6+ZOIUKap7j17Cb/mP3cwbp5k1PRq9tl9LTL/i0nLJY1jiyDQT7r3Q/ecSdicKP6UA4Y/0QkScRO36TOzesUhaoKNGEy5MZdMYs+WpbfYUHRZrLUEPnpC1RPEfJKd6aYcz4o8opwEHg1Wp5bybrpZhu4Nb/URQa+wHOGqrbpLxo4P9mpGoLfiLOxnr5WEogg96iFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64X3U2Uw2AEIdfrTGwXGAihZAGKWMS2u75AhtiO2UfY=;
 b=WGtYe77RErVePPO1OVy078KVUlfQcjEmZWi1yvmb8N7wsa5FHSz1CoV2B09aBBORmEO3X8FvtCZYS6UwIV6UNC/0TXvD1kRM//WnBYxMHPbPgDxBk53FsZs6EXHCVJ9VtuZ2CBETs36eN2p+jdN/2mbYUv7BrXrG2vb2O9y38PbhSfIjNjKv9rklibtCDD2BvnppaDs3AucPRhFQXLIgAE16ca5Rjl0lwNxMAnnNusZvOoaExww4TE/X+rTgg0w/yuL0zUchiofAdI/zRBJPKbjnoQC5P/aLjWhUkO/i/TwQdn5TJQiPl0R80ZE2lKk1mpCMIhonMrcQsCY2X0W8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64X3U2Uw2AEIdfrTGwXGAihZAGKWMS2u75AhtiO2UfY=;
 b=xzzeKB6iMXYVvzAA7WBy4D9jNJU6kJtZvUl4QWaX2I+w2iYCu9KhvaWIOAXKZYC2mVy9Hp2RVuUWXTZZrO9bnxRQAP9S441IUhw8KNkjNd3vLcxAnP9wnzsMrNtfKoVRmmfwwUXbeLsgRL/N9jwafcmyOk5na0DVYDUcXBe+OT8=
Received: from PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::28)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:45 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::28) by PH7P222CA0015.outlook.office365.com
 (2603:10b6:510:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:44 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 23/25] soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
Date: Sat, 7 Nov 2026 21:15:32 +0530
Message-ID: <20261107154659.3358223-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|LV8PR12MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c270d5a-b2a2-41e1-9734-08df3ce6be95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|261022075727099003|56012099006|261022105027099003|261021121427099003|261021135927099003|261009223027099003|261028144727099003|261102123227099003|261026140227099003|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	gwjgnRXG0XsBCbtB5daVy/NaVm8mR2FLq9ht2E4NHoANYXYNVLLBMpc64LiHn0TqqitRJYr1ufz2fwzzIa7+dJcM7gTPmDy/gPDhwBbXHXBsZhQ5t/w0Y/u/mPzCKBvt9L4HdE/WW8VRZswl7rJ/r11XiS1f6OPGCfkAmsCMsZ68+cD+/UchDEZGrW9cTVq7x12YS09sma9XvhAgqkkW5r5wQ14WrjGMEHl/ySlBOYDTZqdRA5H2h9TBGXai4UXWAL1a85UoNkS9Ol1TYH25V4YSTIuGL5frpwy/05dNP+cO9tI4mC3EpHsssaCO72nkSuGtpvbUYKY8n60dnx0ywXaawe6JqoguO98LbucmIaznf4ALV5NrsqpGRl9W7XVPrBIU4OMsm16wIjhTsXI2QeuJmML7HrVwo5JLJSZ3/TEJ35+6QJcWYUD1dd+lTBUEV1kBNfVldL2i+8/vL7UOQqDVsATpb2jOWag/s+HINfT4oDekKHCPq/VHRVEhUJjR5knBY99oRJKc1Ncyk41FL/FGewdcf5lQcD3G/OcfYGHTdsf6+alhFUTwrGT0KmObE+E7ZKSvSYTsmcEsD/zjn0ciJFO0/8lYSXxSWvaeQ1Cv8FUXf24TfKKDzACIv0hqq5RhN/KfZDm45pc8OS/SwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(261022075727099003)(56012099006)(261022105027099003)(261021121427099003)(261021135927099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DOIVDqF82p4JdPOR1yoHOcVDdw0JnAKpZqOgSZ8FShD0KBPG8Jm61XjjE/ssZLFlMItdXdB+1KNC4vpoId7OOc9qk//THwlY5znPZfGpnR+l8CGL3sw+D9M47b7pR2HyMOygDqyIHZdpj4+hbYTZcpnIurbEPDnRSk1cGRqH8Hf6zaw/aw5ssxOOdXsAe/I06mJnhwA7F5D4J55IQmjxlHlRiwDKnYoYAHvuGL8JXCagn0RPR+EF3OI1+ep0EZxFn2evimzEetqYDcmvsOCdgrjxHMFho4SRho8wq/GQM2BP8xy5rwiIk8yFBKkHvvMvEpu618iLq8pKibuik9jBvFbTkvW/V4PW8+EfIfjf9oVWOuPRHOP6dPSyOg/naen7ZSUJ+HGJoaEh7jnPniBlb/t7Swcc8fZS2qb8O47NkeembVXIAUHdMoWk/4hSAmVx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:44.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c270d5a-b2a2-41e1-9734-08df3ce6be95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689

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
index ce40b1e5dbf3..e5e6c7415dc6 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -166,6 +166,10 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
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


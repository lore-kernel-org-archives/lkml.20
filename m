Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068108;
	b=0+nwfY5cikGeavl1Q5x4ezInEiUxJ9IaroR7h5i0clU3tVNnGzkJKYsk3rOvcapmRKTg
	 xupyY28XqZ5rERAr4M6iqYjdGhgB+50ew3POwQP1IErhyVKbJYNoEm3oozjO0VfspAXhL
	 wlZzUN/sfOeTyvyzQHJzFxfrM+h5xKDvJrXSBrO4A9hp481tMCllYRDrbF0lA+mH04B2r
	 oW4LYby33qac8K80joiqVPvkYx4gFSrOw6xZBK1lHEfWpR0I5SbN0xu2MHQVRLspo8q5I
	 r0ONpvoRz2kA2omaQaJzhnvWgax46FqFl9IqiZLeH1vYDDq6hoAfMNZDC9Fute1om6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068108;
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
	bh=BanOOqZSKvK9JmeUIGJNE5wX3BicRASqFfy6QYPhCgM=;
	b=FARQmqxtmVGjOk3WaH8MBBttan1G+vOOExZxFxkcrx65CG0fvIqdgYSjjBbLbKorvVHQ
	 T8MHxZCcRN+Cno0HswD+CBZRA5/OJvyI1V/uXwDQaXRzduYyNni9mfbZXgHND8jUNacXT
	 t+o+dPmZkXAUZhe+8hxIVIRCN0SGyAYlXUvVkjMY2rpPL/YYmuJnE/YlqLnZbAI5FvPrI
	 elZnlZIW1mDGm9+1LOdgLLfe/4FnkkMiVmA7Y6+VR6rZ3wtFS+/m+lh+fyYOc2ccTpSYv
	 fboVKy8Q+tnf9ukPPvt5cZ2IbHZ3SUExdqNlH4n7Pw32JAeYNsfqeOwfznRVuQMaa+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zo2yvumh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.13
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011013.outbound.protection.outlook.com [52.101.57.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D76606AC01;
	Sat,  7 Nov 2026 16:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D76606AC01
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zo2yvumh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtDw2vVqhHlATCwvZyTfVXt/tkryZ8DXFFwyqFDaLIdHjZt1Bv2meyFU3ILVhtT4pSWLMST3dpKXsnwyXUdjm8r0+Yfgf4O1F7z/WUy842F3PexruT5NUH3MWFB0pqT5MEyxSEw35oNocE9yMVzrgVi2Kze+xJtG4xAjDeNu8uTAA3NrGE4zTjHJpk3j7jAJqIXpQ3HMuDO5MC1yjX4P5pUDqXDVGLHlezv4hJvHRrPKCkzQ7mLx/5BWD1Pi7658CAQMeR6miSkaanjWT84u2VMoBB1196X1GCw41aMmtlCilUp4FE0J85LnfZa11ufsU4RYKMgA+yvJUgP9CS2J8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BanOOqZSKvK9JmeUIGJNE5wX3BicRASqFfy6QYPhCgM=;
 b=U+W6648i2/6uqUYKwmHmmZZq/1t/32YpDynAndzDPLJiIVN8u9rJExoEWusItDOdRW1nKsHfY/qiBz6LkUc2epB0ml4Cxw9NDj0zgpSX+NPMkwxEXf8gZ3cDVoSoMAeJr796HE4Gi3eBdFOarpmr7HURPmu4LukMLU0xdaqJ/R+Y9RRYIJFQxlHG9gzA/U7R1GhvFQUnhC7jWArLfE6o/yYtQ3Zf2k2WdGF2g+nB/lSwgUeXvKuPLnP8DDpWpTEM+VTMYT/6iNj8lirr52tjg2uEBNOyfgquXUJkhMnA2X4+ibIxQWUNuBN4/CutgSqwKjx5e6l/+4nB6C2+masUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BanOOqZSKvK9JmeUIGJNE5wX3BicRASqFfy6QYPhCgM=;
 b=Zo2yvumh2tzQ4xcnhypqcxiUltnFR8kut+cwjt6Q3j/7A8uSAtkmAnzuvMj6ql9UtCLQq4qMYzYnmsm+jhXcph2pBOc6jCiF6xjFouE8PnQlnLTRDM0hn0ay/JSOXaBE9k5zBLipkF+BcVZfYptWsiFopUoE7dqOj4qcKhvAAy0=
Received: from BN9P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::7)
 by DS2PR12MB313866.namprd12.prod.outlook.com (2603:10b6:8:3bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:04 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::4f) by BN9P220CA0002.outlook.office365.com
 (2603:10b6:408:13e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:01 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:14:58 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 03/11] soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
Date: Sat, 7 Nov 2026 21:42:20 +0530
Message-ID: <20261107161345.3411491-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DS2PR12MB313866:EE_
X-MS-Office365-Filtering-Correlation-Id: 64830c2e-1fbf-471c-16da-08df3cea4846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mSyTNN0DySEt4y4ghXGYCiRrs3haAv5gKJAngqxyhP2c+oR4VZzqVhwFjydx6WQce4VwWGX5MQ5AvUAhQFIeUUzqJNQPqFulcMMok/BNm6Y9jzWnnG0PFnWDhiyLUary/c1s3zN6nlFjA28cZakOVVWg1+aKsCjnaYWL5IkVOslMOZVM7xhQN02XBRXICxSuHnYZnx6Tec8LpBwrXgkABg0MhoXIV6YEyyy550aiKPU9zmAs88XEfGYY/rOi7lYMsvNM3p1h1F78jfmPax/Auj93kF7F2jnQSkOxeblx1GCuS92gHcSueHEnBZvrsnwikM4VoQJyhCur16mgSSQwngtT0h2qypqQBo0SG7P3Htu/ffohZq44NZJPRdlbV6nzNnlGmgCkLb3nXcs24IzZIpGjuGsZo071FPs0G6RZPnOG0wo+Ihcg27Zu+GOkTX3Ef1++2QQ22OMkIsYzQaKZOOwahZRx6VV5a7yv9ipuR7G/L0nTfMFj7DpRaD1FJNdp/xUe5KzZmOTI6xObzz6nOT2ewTVvKASK8bKvAvGkhusD+83R3ZuqaJoiruibC/WkMRkasIWc4tKaVqF/quehth7qxagIY1hi0aOnv+Fv0CGp9ZPpHpO1Cs5WsXFQXfWQE7ko9q9pvUct1dnGoIoFPvWiOwjTjZSIPf36nlTTjJhfbexnCa+X+el2mTx5j/dmhCO5n4jVe31K3XfElmvXIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+PuBLsTdzTqfVyGlDYq6T2OAXw7OIhSCXkmgB8+V/Xp1tgbL0LkPIGf8Nppu+VBn4k0YPvtpjIE3pXSlhF3GaGsL7X97HnUAAs6Sk66b+8RvM/9S3xevJQNcC2ZpIwoX066sZG0KdTT+af8PIkU3g+VI5bKCINpOR/PZBDCwAUpQSp8HS2POZOkImnqemh4/+iWVKKQGBdPGxcap/fYKwtoE+embs8IRmyTqu1ZYrgucWKpLKhqkWAESeXU1BJvRU4x5kHKmDE59eOxsPkXMxeU7lqmyZRb8rn/40kXDXJ0864etgwxwRsNW53iZ4tLD5N8WX5i39cwuqh9/EYLXkzoxxKhE0plTkOg+02nVMBn2tTwHmQsT7+b6p6vGYAt59kITpnT6Z80T9I0mQ2RVt8g5EbYAQ+kZJGGZF8cGcjhnP+/n0932bfbZeFu7CrVT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:04.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64830c2e-1fbf-471c-16da-08df3cea4846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB313866

Replace the fixed-size pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT] member of
struct sdw_amd_ctx with a dynamically allocated pointer array. The array
is sized by max_manager_count via kcalloc() in sdw_amd_probe_controller()
and freed on all error paths and in sdw_amd_cleanup().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c      | 12 ++++++++++++
 include/linux/soundwire/sdw_amd.h |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 92586185865a..2d3b88cdd484 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -72,6 +72,7 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 			continue;
 		platform_device_unregister(ctx->pdev[i]);
 	}
+	kfree(ctx->pdev);
 
 	return 0;
 }
@@ -126,8 +127,16 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	ctx->count = count;
 	ctx->link_mask = res->link_mask;
+
+	ctx->pdev = kcalloc(max_manager_count, sizeof(*ctx->pdev), GFP_KERNEL);
+	if (!ctx->pdev) {
+		kfree(ctx);
+		return NULL;
+	}
+
 	struct resource *sdw_res __free(kfree) = kzalloc_obj(*sdw_res);
 	if (!sdw_res) {
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -137,6 +146,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
 	if (!sdw_pdata) {
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -144,6 +154,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
 	if (!pdevinfo) {
 		kfree(sdw_pdata);
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -181,6 +192,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	kfree(pdevinfo);
 	kfree(sdw_pdata);
+	kfree(ctx->pdev);
 	kfree(ctx);
 	return NULL;
 }
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index b67ae581fa17..6174e888b433 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -144,13 +144,13 @@ struct sdw_amd_acpi_info {
  * @count: link count
  * @link_mask: bit-wise mask listing SoundWire links reported by the
  * Controller
- * @pdev: platform device structure
+ * @pdev: dynamically allocated array of platform device pointers, freed by sdw_amd_cleanup()
  * @peripherals: array representing Peripherals exposed across all enabled links
  */
 struct sdw_amd_ctx {
 	int count;
 	u32 link_mask;
-	struct platform_device *pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT];
+	struct platform_device **pdev;
 	struct sdw_peripherals *peripherals;
 };
 
-- 
2.53.0


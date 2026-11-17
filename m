Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900061;
	b=2srx8UqgKqqJ/hYAsA3dTTjoSkvjoIYDUaL9xxzj0PhA8wM2gQeJZsRyEWOg4u+wVbeh
	 DjCativRlqsqfx5VpxRmz6hpdkyIvAp4PZRmxa6VowULZ8i3qNvcKCT+dLA16+E0Qk2uT
	 Uuy7FgwsTQwu7s/G9haOIDUEA6VMGcpyMuUyIFgWzsmVUXMQE82yfGO9erCdjSeXU7pQC
	 hOtwIjHpCgY9w3d2WbPHe78uOvp0ZStWMxHbduffqmvn4BfUveNQZwOg8N/Xik3bT405x
	 XBL8LTCFT1xZjQC4Dyo8JYBClxbNdS80Ub37/96cBMcxg0o74CswkbrMnG5PkEmqCHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900061;
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
	bh=TlS8cw4+/sjBMYY/BdX75Niu/wKV96dsPOhdIX+WliE=;
	b=hCPICfQM0StWRU7vwqJzTtHXUMxCDgTTzOfWwlAf6vBOdeQWEZ8wJAotfCg9C+hG2eFN
	 TqbEjXOlIpS4EMx7HUaXMbdxNA0EH0IE42tWC/nmJGJdkvUvf+/7LjQIvHhgS3AD3qJxe
	 Z7faqZm7KPXTS72tUlA/XUMk+P9vQjeU+a2LMRBg968XOTT1CtCha06Di9bN7gRSIZgXp
	 Gr1xgfzGO+8UUFfDkha1d1v+OnLUyDVYFwa7G5tTAa+0b3iL8VrBJKIHuzW3/0s5RuV4O
	 w3EWGVnFxTQJKtRCPP4IMaBGvinjvZlxm8BDe3SGA3bR5GJlzALxkU2t9DO9aykTuvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EKwofxY2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.65
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A5606A330;
	Tue, 17 Nov 2026 07:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87A5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EKwofxY2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaHtlkcWVKKvIMtZ1fol25g6F71O1jw5wjr9fcCEE0WOaC2ZKxNe/vDLBIm9XYxYKlivilupUooJlwvgxfDn964y7nG1Mhku8rMxQjjyxkw7P33y0NXioeyXLOPgTkhqLvShEPFhSpYK1jGlf9WCzEehryiST7L+kY7aFov6fjU0PrKhDRDu8l8mlUrRaZhk6eCF0PLajcl31B7tZMHkFOeS2KRkZnlS7dfqagwbFKfMHrG6N0gX72cP8pvpbiiwhBbC2zRBlNig3L7Y9AVU73JOFv0mPPs1NZihVq5v3PI2FJz5O5yKn6NFWDYUwVK+zUKnJ96bNBEJGKP05iIWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlS8cw4+/sjBMYY/BdX75Niu/wKV96dsPOhdIX+WliE=;
 b=ho+yd2dfJQdr74O6CWvlsCwklXxFVnKTT8c1/I1SnDCrRg4hyhaVB6S2AUTom2VQRRW3B5vfbH6Ch09LNu2jeUgRAJrAf+YNtO5Nxm34bTnYlnXc4WyR41HJk1lI71n3M5pBA0nwNQRvIsegAZu4WBE0ttYMz5kMYjn5Nz/GkqqXo9tYKDRbpPiK4b4mGPS5k8M+XTxErLXPcCH28FNcxqSuOBnGjnJSToA5DU+q7jMMEm/u8wTvn1b7BW0+N1f1Oh5buI+KuGl1os7He+YCazQ54nbb2bg5HGZFddQc6SqVUrVeiQ/4m7Azkgg7eiOJI/UIR4Bkg4RnvLfvSivsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlS8cw4+/sjBMYY/BdX75Niu/wKV96dsPOhdIX+WliE=;
 b=EKwofxY22RiKGo4UBjOvfVv17bfY19FHF/qXtmsrmaN/PAO48JYJOtvieA1XUB+9LuHR915DCDUlG3AOO75OkVTZ3RmA+zuEJQ62FvaKD4qjLs7x8oLkJDgWSAakzkdiQtjZWg3dU4ngRyiokQdFYN+pkAma9FhP+/i1q3Sda0c=
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:20:56 +0000
Received: from IA0PEPF00000044.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a6) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 17
 Nov 2026 07:20:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000044.mail.protection.outlook.com (10.167.249.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:20:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:20:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:20:56 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:20:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 02/11] soundwire: amd: allocate pdevinfo and sdw_pdata by ACP revision in probe
Date: Tue, 17 Nov 2026 12:48:11 +0530
Message-ID: <20261117071927.830373-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: IA0PEPF00000044:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baf9cf2-e697-4a67-ce88-08df447b5295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8jh0PHIy7Gq424T+6x2Gdhl5g+K1T4Ak8oFVt1987x1XvIO2HNIVq7AawZIPJ6TKxbiE2jSL9mWwsvMq3l4ri39FAt2KTSOr8MO+rd6aD59EY603yAxhn3obL42bzKFVzyWZIGcCpfRerQKbAPrklRydV24jWFwXlBzDcsJppk0grcx96rghzNldjFWra+nFuFDNtcgvMB0jTHyTYOQsSr7YYXtPeyLgPpVFSnV1vGZRe+I2DrMxcywfjXE0r9P5SMxa+nryxHkyk6TV7jCNOE7Y/cnDIVIS5Nmr2ZdBD5uM5C3HadHRGcWVpOoRM5LP13BheEAgMoV4GOoWLkEM1E4Z5eGyLt5BMvlS7o6jg+UuDQArMgCK9lT3c0jq1q5Qw8xqo9bKLqyxdJBobhfMe9QIYO0YwKqQe8xv3Ar3+qnSJmidnb8Yjz4iocMLulwuc+zP/FHMjNMAUa0EyQXx3MrCnFEGMWmK+8Gi02DBistJf4Z7XbaJhwupCs+Bh83dyA38ugYkVaql9gU9dQZV+1C14X7xHOirHW2mLzS60wYTofY3fSrn+NIRMDWgf38uP284Ijd6sPeDCL5o0n8XDyel6wNfkZnqYlv7J4LJu6X2tx8Sd6cb7drrsLAbvywoJJ/poEUgIM6U73w10aEyaHeW965IXVcU7O2fwQXbTWg98NUHbgphUI8/RzavKMtsyqsIAXnUvu9lambxhANVeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IFAHx0Xlxu3wrESoPoYDPUCukRJCjoEyLpa3hXo/cFgcjmxPSFq9PcyBGbRe2BUVDnUOybteUo4EUMNrghUJw8bHKan9Kh0UAiORPhDJHI/S3csZ8HLTVHpTnCqaLvmSiEmZiGtdIFYQrn4FFRdo2XUKgDQ+EuX8KqBA9wPPXsiuTEz+xXOvcG2IznfaGnKFhnu1KzF+eHpLfyr8Rj/6By+t04STQXiFhD7FYLG829ldPN+4uJ2JB+X1c08/dkEDnvsBqPR5/rALYdFkNMGeFOkO2k7RyZSDZFh0XRxJXwiBEeRbFPuE34D1++lSMhMfbRUYjhfTh9Ny/6nKExs7Uz4dCCF92TiYsxRUQmj/mWMAIkmSAYglDzmW8SQxMCmK9XvEeyD6ndv3VwMHxeinHyzSdoYXN6bqZB/1t70s3bBoiUuohakxYqxT0SVzcG7e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:20:56.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baf9cf2-e697-4a67-ce88-08df447b5295
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000044.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

Determine the SoundWire manager count from the ACP revision and allocate
the pdevinfo and sdw_pdata arrays dynamically instead of using fixed-size
stack arrays.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 37 ++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 10b216871703..bf236b4925bb 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -84,12 +84,12 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 
 static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 {
+	struct platform_device_info *pdevinfo;
+	struct acp_sdw_pdata *sdw_pdata;
 	struct sdw_amd_ctx *ctx;
 	struct acpi_device *adev;
-	struct acp_sdw_pdata sdw_pdata[2];
-	struct platform_device_info pdevinfo[2];
 	u32 link_mask;
-	int count, index;
+	int count, index, max_manager_count;
 	int ret;
 
 	if (!res)
@@ -104,6 +104,18 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
+	switch (res->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		max_manager_count = AMD_ACP63_SDW_MAX_MANAGER_COUNT;
+		break;
+	default:
+		dev_err(&adev->dev, "unsupported ACP revision: 0x%x\n", res->acp_rev);
+		return NULL;
+	}
+
 	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
 	if (ret)
 		return NULL;
@@ -128,7 +140,20 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	sdw_res->flags = IORESOURCE_MEM;
 	sdw_res->start = res->addr;
 	sdw_res->end = res->addr + res->reg_range;
-	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
+	if (!sdw_pdata) {
+		kfree(ctx);
+		return NULL;
+	}
+
+	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
+	if (!pdevinfo) {
+		kfree(sdw_pdata);
+		kfree(ctx);
+		return NULL;
+	}
+
 	link_mask = ctx->link_mask;
 	for (index = 0; index < count; index++) {
 		if (!(link_mask & BIT(index)))
@@ -149,6 +174,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		if (IS_ERR(ctx->pdev[index]))
 			goto err;
 	}
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	return ctx;
 err:
 	while (index--) {
@@ -158,6 +185,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		platform_device_unregister(ctx->pdev[index]);
 	}
 
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	kfree(ctx);
 	return NULL;
 }
-- 
2.53.0


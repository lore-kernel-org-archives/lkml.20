Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068103;
	b=hXlh1oYSC0d/L84lcALZA4eo4wPteZ94Kf7Cco0AkEAGlH18ilLH6p+7RA6d5ZPBz1vD
	 H0mc0skeS9QYdFAYIsX8I6oPZlu5zy+OcbzE06nHsraPDaN09/dzqVwwU0nH7oZwuUqRw
	 XLSlANUYqRx46s3r/Ljlx4gAEQI3HHL6fPh6gxl9g9MxuVatSCRwYg40PTgYSYPQyIcMT
	 CgY3ggXwMEiqsTm552ai02+gISIvsBd50BAV7hbTxklgYqxgymo1/NxBGJ53UMRlEgv5F
	 9tvLP40LQe3ZjKgGX2rojWZvuqUf6riBb5PVTpsh/U1KevBVVTLzEjY92m0NVqO2agg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068103;
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
	bh=UyKXHPJssAZn7LJUXK9b+ujmtwD2aMnHRC80D70IveM=;
	b=wTMIMNottViEIkIvVhiriggH4S+t+8vzprdqZFZgzE56mKbMzPcY4GnxHH8w6f794af4
	 jooPODhdAMl0ytqBFTdvzcqaCnO1fecEbSb5LtzZhICkZGk6TV8210WEnVDPGbRMcX3cx
	 J3GRfil3X4LQ61g7FCsQ2JHQvZt78mrTZc0jWCBcMiB6BjrO6CDUZoihmPbsWco0mujlo
	 nl3+djb2hmp8ZOMvV0jwDTonxrA57SdanGui86YusUMhb5NhZZjnatOLk584U8qMZ9Z52
	 LOcJ9w7yNngeeadRlfJ5RW5EKGA3hY1+cO9tuw1HLyfVi1pvHICgZFGP8rIwAkFEAGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RvDo6Wv2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.29
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F1606A336;
	Sat,  7 Nov 2026 16:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655F1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RvDo6Wv2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDK6UEgzwSFNbGJVcoSd6EWYSQe742X3pRImRqDs3eZrYKWaYDMCv7BAh9wFJ/o6HyFYpz/jhj6p7bfOtuJzO1bZveIG0OjXf2UDJ7KDUgddNLaD//fJr//22Hgj0wCNDtdmp63E9oD0X5llh779uYYTMt7Q+yNonDCrrhzvsPWCHya8sTfVMEBcxAVUOJdWfgDhi/ERd9TirwweGTfg5Nmhvjc7MS4636WYNE+Gd8Nrk8Tt8NifmZno1QIsdhFw6axo7VEDk49ZrBYEayUvevKi2sIC4fAdmq3biDN9rQJLEay+qmom65CPuC0PGa8GFSaR+GnVx08u1DZiMGY31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyKXHPJssAZn7LJUXK9b+ujmtwD2aMnHRC80D70IveM=;
 b=eQoweEct/RD0MLYA9QkgfrfdvKDS265lGSuWvdyD36sQYwL5nSropowszR5YbDWOyzjO1kOqwp2O0h/J0V1tIsDS9IQ/7cYS/YqVIM3jevY6MyDdTRr7qRzHBo2iyVeujYA1lUcryted6pw+/sWSq0t4k+yj16LLrdj73L8iziI70GYwVuqQ8UZyQD9vEBX4ICPlJ1uEAPsS8+zqcghlGILgFq+7WfT7ER1KZuTNXpIgKhv2MkXIPl+cIRqoKsTeiB+ZwatL/y9igF/cNY/E6oaJiS1qXKICMLvzIKoIAOI4bhmg9m+bsXcQX88VhbgQJp09l/PnqSZlF2TzguEiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyKXHPJssAZn7LJUXK9b+ujmtwD2aMnHRC80D70IveM=;
 b=RvDo6Wv2SBS/eCB1gYJm76oGqg7fKdNDZEqOseLeTvUdPX4M1GifCS5xRRONWu29tKotKSn8s0offiXeSA/ffHmN01UbF9hmOeGIdRZNH06aGBp67toEgrcByRyMaKxPGbF50U7obyZE9VzgTZQ9kH1gR+QiFWlX2JSk0HuaTvc=
Received: from BN0PR04CA0072.namprd04.prod.outlook.com (2603:10b6:408:ea::17)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:14:59 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::90) by BN0PR04CA0072.outlook.office365.com
 (2603:10b6:408:ea::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:14:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:14:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:14:57 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:14:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 02/11] soundwire: amd: allocate pdevinfo and sdw_pdata by ACP revision in probe
Date: Sat, 7 Nov 2026 21:42:19 +0530
Message-ID: <20261107161345.3411491-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: bf94ccc4-ee44-4439-8204-08df3cea4531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lch8Y/1dPprUPEFikJyLJx+b86wy0yUPWQeWqFSLPhFbk5hguR3hT1yuv1/gHNYsEGdoRpTleP4Ea/g8tlDNoXYQh+rf6JeNq17HU9Lhq5rjhz+dmuHx9O2TFaaTDyMNJiLX5/7B+YMlLssfQMKptrleTGQLCOYTvVptO9n5V4jbgiz3vMNjyFEbY3NOEH/2LJiVeLNrVChhnigjijdhzOjTQTRoLMqwmT7onnjbkayA1ELpVE4REGuM7osTPy903Tt+HqoBvTMBG1502gkk8jWejWyAn3hYQdxH6W4t0yBcMSt76oMdRSdIPf7OzYCyzto1WYSiNyx97tXH2M1WX0mu1wUel/SAgqcXqfd3aGPKsvzkkQI2582MiIkEz13xprGy5kGOt5Dw1kfOkvsDUvGzySzJugiC+Y/aqUhbx9dDUhKeRMXCDIC+z2kxsT6kH7bOwm/gFVXPUKwIMVvhjqKEg/zBgHkz3Lmc9yKaPxldT29LSqzmws6k3t8iuFnFBPWtq3j0hRv+TbJX9Rffpl88ip9/OuDSJwgPXJ/grZEvsL72VrCJc0dGMwvDRgrRA6R4nmP+rVjQODVBgAgVEbvJssyVyUVAFJIi5MAuO2+rRIuN5YEGDoDTykbCMmwoikLskAE1xM4mLZzW0KMfGpHQvfCzET6ldy1BrzvCwAeM48WYfPRSgbRSXzwYDqFF72bcDWDgKzCRIhQO60Aadg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hKQ+XnsATwNJk5B8vVyN/TIB0v8K6ctLfXsCPevKvSgdCO8TZfVCrWBeC+K/eScU/bwygdvgzO+JyBbyuqp9ycsO3pfvYrEXKJec8E//vEVEeJIfrxM7BK9Z/WJtKuMK6RAS3GAk0Rhz1zEkS3XaKY1hC06nMGdubKOjrZ9KY129V71vgFKWUMbkZzfWwRZ5sFyvQX7uUzh8Uhs9wlNaHGc9zrR+pKnCqzWQe9EzRyh/g+3T8EkFvO6kuUza6Efvyi7kpkXD/LuEHCSXxX1TWwAd69pYuRin7OUcHAoc5cUUeF3C/U9kpTSyovce+pVWj7tbgBv9RgVgrFMMfGbrm9qYzHO1blTiUlZyHM+zYllG7T1cc/2ii2hOSrvSn+Y5l51v62gyjTHo2NjvGSrJPTPaFzXs8w71qEfQN7t6NQm9xlqIletQwX2JFIoGUviP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:14:59.0362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf94ccc4-ee44-4439-8204-08df3cea4531
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

Determine the SoundWire manager count from the ACP revision and allocate
the pdevinfo and sdw_pdata arrays dynamically instead of using fixed-size
stack arrays.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 37 ++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index e5e6c7415dc6..92586185865a 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -78,12 +78,12 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 
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
@@ -98,6 +98,18 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
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
@@ -122,7 +134,20 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
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
@@ -143,6 +168,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		if (IS_ERR(ctx->pdev[index]))
 			goto err;
 	}
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	return ctx;
 err:
 	while (index--) {
@@ -152,6 +179,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		platform_device_unregister(ctx->pdev[index]);
 	}
 
+	kfree(pdevinfo);
+	kfree(sdw_pdata);
 	kfree(ctx);
 	return NULL;
 }
-- 
2.53.0


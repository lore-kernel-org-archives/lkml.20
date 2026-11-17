Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900068;
	b=zcl3vhwXP8MHGDhOKTO99iPEDxKlSKfL/l130ILznV2j4LiemVZiJMYZrFENq/uTmzc3
	 BBoW7uL3lypBr6jL+P+woEFeKFcu38LiTqq1kbi/FbzgcLKn3rTuBpjV/zTxnG641aXHf
	 /KY2+6yRRpNCo6vm9sRlEXoDu9c43naKlF2D7YtlYv3kzvTNYjwgFKNuMUk/SXah6+YAo
	 CT7RB/C96rnlmLd330K2Xf1l1DsgHCXe5EgQRdKghR4Ihv1I/hyCIsgYw1UumeXakfb+T
	 dk6vF0YDeo1GnKicaek2r8iJy1VrHxRk6xR3/R4q9RxV3Ew6mJ4ScFSZTdusBZdOGRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900068;
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
	bh=YTuVFWLiYhMqQx//gdwDFOibQCeLkwJ4cwhFiYZK9ug=;
	b=fwKfhsbHUH5m59NGdYOrktBNfh+OsssemZheEOh0CcqytX5mlBaZiUSOivJA2T3mq0Ny
	 yV/orRlm6iijCqZDoU1oYNbe8+FDAalO75vrUpTfp4839g6Ou2Cq9WhIX7hqaqUgnQTNN
	 pm1XOcogklKyWIvNZZAqhZVqV3jXikbjRGHDT3tNrBrO7tZcPgXE4H8YremB4G5fQp3WA
	 JmAtm2n0ZZthIaH2UM1pFghnKxCW/V+jJuROv1aznHR7KxzyU7ZvQ1mfxB701wjD1PW+V
	 lt5jUsouodjCAzwRM7AyQ0zKB29K7pgw7+fo7VaBcYYTEfMabsBwdAyK7S+Qn+H0sew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CsYZOxk8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.3
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013003.outbound.protection.outlook.com [40.107.201.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07C606A32C;
	Tue, 17 Nov 2026 07:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D07C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CsYZOxk8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sykdgnnZTr1veLU9JoKW1MPR0+00NF2tKBokv1jvmzEJU1gBlMoLB+I60cLv5ndyRlcOt3kgftvMZ9jCW4ZGAb+YUT+IoaWpBVLL6ybnoG2Lhq6DTokLWd2FYRro1wmWu+t8469wk0CoP86qhvfINoQhhAxy3LiUnq3hpdbClk/aaTfVKU9BwuA6Kfbf5LewEqmBwsByk0zAHA6GwvN53G7RzLA6140jZjlTyGzcvjxRnkziBvzFEJxkLxezeXCFKdtpWynvPgtJzjc/3cfDHJh8vVm3qKmG3pHpkGM/JMo+lMN2i1AoCDYc93V1sVkj/unX81FSnpNF4PcMJBoyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTuVFWLiYhMqQx//gdwDFOibQCeLkwJ4cwhFiYZK9ug=;
 b=sLpdWYlpPzeZLH6GwJJxOUafdfcRmLb7alc2XruxSOWyktX11q0dVLLCT378+6cMhadEuxItwk6jcoNPMeK6oWWKPitInNuLdmethOxVClFeN3HfCGgxM/HEHYPnEVlr7rfvMF4DUjnEH+Xa3xUYVjq7xkyzzVj8a4vp2AdAgH7PWvWQCND0j81tguiBwxeXRPgVN1HQ7E97g1ELGHrk+fYtaf3TTtPXmWCJle3uOheuHHbkyN/Yqx4homO0r5GLVIHoCFDehmeT9lA5tOcckg9SBtzXeRtWNXENP/JMx4vQsD0CLaDKcoiKNVdfU7CbQM34AvBzP+f9M5suqq04iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTuVFWLiYhMqQx//gdwDFOibQCeLkwJ4cwhFiYZK9ug=;
 b=CsYZOxk87AkXHM/uUU/DHSFNTcP5tq0cggcKqM+1Nbk6NaY9hzxGyHRLLK0/PwNEeG337mtw0ohxkx/YdDzuW4a8NifRU/APO4ydi76xa+D0XmSSbnZ6zoysap5uMjyUtkelBlfr2RnGh8ENmMkFhvkjdfREw8/EvF9/xVASfGc=
Received: from CH0PR03CA0351.namprd03.prod.outlook.com (2603:10b6:610:11a::13)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:03 +0000
Received: from BN2PEPF0000A805.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::f) by CH0PR03CA0351.outlook.office365.com
 (2603:10b6:610:11a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 17 Nov 2026 07:21:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A805.mail.protection.outlook.com (10.167.245.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:03 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:20:59 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:20:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 03/11] soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
Date: Tue, 17 Nov 2026 12:48:12 +0530
Message-ID: <20261117071927.830373-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A805:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: d00b8a88-4098-4e96-ad04-08df447b56a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TIQtb/SeWdCruMcGVYsBdMZrcFdFEW7lbfVZBK7coA239eVGU/HfVhfaAeEof2U6Mttb++8eODbMDX9JO04lCiZIltTAS/Us7JdDltnsRkjKA/M9KIh/I9f/hoaKjhHLMbvQ9hiWHLyAoWbCJPLZ6Rlzj5/n37SjrUuJ2dWvTGYQYbxih2urtl+FGz0VSeLtGOqqS5zJTghYKWbIU2LtDA6zGPp+HEh1hLpmNEaatBiXObEHA/o8n95er4CGQtzLh8N3I6LDfgcoo/Hsbjp5s1uPE/jcvCVeyiqLvB2T4QW3oIavFNiSp5Iyz6VpfBNk0ICs4OLBpjiupp3jhERixnvSS2RXZNjv1gMdF+ZK8pUmtqZChN1z30iH/XFvle3nB3BQvBsXJoYiemSrinDCgv47PFTgRobRHnpSlDyj/OGeWHwc6SW0rPn1Y8xfDXe8T5M5Prky+9j3YP40mS3tFNUPZkg24NjItv6crScKpmVv1r6F6cqy8f4Y5BroBfHOn+tLQm7l30Qot2XIKGoFeeX0qAMRbOaeVl4/FTKoh0j9vxhLY0inqLomatVdaIQH7q2jGa+nXF9X/wh9R9ZIVJJ8V7Z7Ze5gbWBXj7ncCL7hs5xW8wMcqo+1vCLKEjBohAdIThbqpDk6XL1/3VGUylaVg5huaEJg3H/XN6XGb8GYqRKxLLM+OUoxKClSMEj7d9rDNBx9PDUGDUg7oxfBeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OqneGPZqFIPMkNU7HdXu5uV40I0baRgKvbT2gHraQMXttyqWbRxqlutnDUBV2kE7vKKvRFE/8Ut4EVjfLBGa/n/TAim+6GUlpYq7KP5DX3YHDvhbDbZY5vgO/WTEg3S/2qblzgTtTNZLERWi817rY5EQXBzsH/p+D9anuNL0kSa9ab/W1xwjSh+imYd2X4UAzeFFMvxVOaOcaiRLWG7iQRocad8s+1fnxr0Rb62Cy0Uuc3RGE7FAY20vMhqYq+gS+B2KwZLfMZkvBWyCjPKBh57T0T+Aw7OD46lW3SkQmn8uSnRBcfLAAtGrKOd/qARF2bm//pDEdPQqZtsrzW/0YWI3zSIvmHYWn2iak6xVA7GqUW2n6J/MAZS+dxN1lgmL7ni4rGuWQoCxpGnUNp9Q0C2UpLcz8d0DsElHKc25R7nAw9ZjomEgi/ZsEPXttu+6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:03.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d00b8a88-4098-4e96-ad04-08df447b56a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A805.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

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
index bf236b4925bb..b4fad6f0f1fc 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -78,6 +78,7 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 			continue;
 		platform_device_unregister(ctx->pdev[i]);
 	}
+	kfree(ctx->pdev);
 
 	return 0;
 }
@@ -132,8 +133,16 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
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
@@ -143,6 +152,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
 	if (!sdw_pdata) {
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -150,6 +160,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
 	if (!pdevinfo) {
 		kfree(sdw_pdata);
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -187,6 +198,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	kfree(pdevinfo);
 	kfree(sdw_pdata);
+	kfree(ctx->pdev);
 	kfree(ctx);
 	return NULL;
 }
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 14f446bed77c..26a5ae7f46e2 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -144,13 +144,13 @@ struct sdw_amd_acpi_info {
  * @count: link count
  * @link_mask: bit-wise mask listing SoundWire links reported by the
  * Controller
- * @pdev: platform device structure
+ * @pdev: dynamically allocated array of platform device pointers, freed by sdw_amd_exit()
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


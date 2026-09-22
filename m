Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB044BF922;
	Tue, 22 Sep 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108642; cv=fail; b=q50Y5n5BcdOGapjnO+PU0/TnMxY3J8t0cqoroQ4CYABFawhcwyVQyu5F1oIg3MXf8bGF8CbVIiA7aw1sBJRtD1yGF15Qz0577he2R8cItP+nPCucSNkQ4QUS22jrQyBI0+H7hYUgiiA7ssrm2OKVo00Y6z4XNdd/TDd+Tlbnjys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108642; c=relaxed/simple;
	bh=ghnvgX+egc6yDkl441zn+fZDgcKpMIT4TRJhR2f8+a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzarpzjzMZc8lnbTPIZjQiLaCIOvL5orjh5eoiuyVg9LjXoMWZ9UFniOOwVeqT3gs8aeL2R5AFAQa6jD6m6UqKWA4GH3fmMeXQyNjmzyJCDAIvEGD9diomIt2eV4q8ftYUawRimnSxmZD1AI1jBWBgxHh9QWadEebLB16OaoDJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AnnV7S/X; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AnnV7S/X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFJJWCLtuT2f6IR0irYOum9zde5RP4rKUDBB8y+SbyrSeGN910TTM4Oqjbw+JzUqe/pVAjUS6ZH+xmy5baYWLYCy5cXgPGdYtsB5fC9Do9tFm7nVirIEFJeJ4AIYORjWG3HIveKQISzaTvrKGlb2uTFGKtyAP22t2HglVlhNOeG3OoJiMPCk21NqNVDr9iAKNr7vuEM0Q6iSmK5nnsl6dKYd0Bic8CgznK/yozNra7B4JvYXzHPOK8ylDE2FGFgRsTcr6bdGUQ5zK/5gPDUg5xufUCxYRlj76RFpIqjVs12QDF755nNilT72tnhRFrQy+sszTLcwuUHC1qVmNHnsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtbjIiELL3+XFcIu9IZPd/vKTabNPZlk1otW4T+VfDE=;
 b=MYGp+vDir23pZqFGHgD+7Ua/KOKYTBez/TG3/UdawVjJ7v4QF0/9+hdQ5ZdCKxUIiHhYdr9FYIKUey9AwCrEwiWZVglV4Pwr53KVlk0iNDL/sD5fnbfxbvYu3Ag9n1I/f2C83RnMWJS7M132ee2Drj+XJUf0wAhsFTW3Av4QyMUEpjmDASjRzny/6UoaEQWKyyJDnggX7yePtN3bLgQnfYQz76vzEY9ZKziPHisW/N/Hs8yZHLMr1ofSsVJzfIozBzwS7gGmQgFQiqYFSgMivUicy8GsyeZmeq6prh1Zi63wrR0Fo4ogVCpJmL372ju/6Klx1oBTVCUyJzafBZgMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtbjIiELL3+XFcIu9IZPd/vKTabNPZlk1otW4T+VfDE=;
 b=AnnV7S/X22OGUN2WcKxlwTeUJvxz+tQRoj8xM5FNg2EKSAEaXTjrP+TrGfEj74bXiersswcw3VF3ljl+LClV6W8ISfhJ1dGdSI2/64fHUSnNZerWE5L3UsZ2Tk0hFiB8pfV/bI2MPdLmEzxBxm6Jj8P4fewQoEB3+EnOm3g5lwc=
Received: from SJ0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:2c0::17)
 by CY0PR12MB388677.namprd12.prod.outlook.com (2603:10b6:930:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 20:23:41 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::53) by SJ0PR13CA0012.outlook.office365.com
 (2603:10b6:a03:2c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 20:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:40 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:29 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 4/7] RAS/AMD, EDAC/amd64: Use unified interface for SPA translation
Date: Tue, 22 Sep 2026 15:23:14 -0500
Message-ID: <20260922202318.4079080-5-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922202318.4079080-1-yazen.ghannam@amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|CY0PR12MB388677:EE_
X-MS-Office365-Filtering-Correlation-Id: 77757c45-5bb8-4852-ac8d-08df18e76452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eDhS034UZaeuGC9523V3hqF6TmIrtKv9XwToHVR3v9IunHw2oe8cB2hWMkQToCAMbP8Lhqc0Y83vEVlXN9NmMAwu6JMgTSF0eiejIcyg+eRiUPFCzKyofAGdMOHq8ZlmLp/CgKi2L0HiBJcWkWUvf6MdCeEu/XrkMB7gyObx/wE3TmNtWbUNqu/zew0aNB8UVX+rEZkoXGRjzIfd9L/e0aAb06QrGlJ0i2aU0k5q/CAgDfwLpIo15qiGVPU7g9CjkgCqhH1tAN5GMHe8+NwR92CWmYfDoIuIFDXL3bHwu/gUQshUp+6BLn/RbnMT3+6YHyTQ4DZml8GoGgcLmU/QjymUOlOLecb4sWBv31iFVWN8GQc6QHQUst71FFpCtQRBFaEJb1lg8B85ixmO2WCjzIjhuk9H+MldpR6wAULPgENumlIdzqHe7uzXDtnAkDBt0QEWXqppf7HDfWtaiYOClgfJlgwWa03DpOEuraO72el2FbPKm9imG/j57TRvVH/pEpQrOPQR0s9JJ1HXx3pgIy6zw773/FZAcE9YwRVv0eZs082imJg2n/4NeKIZiusPAx90TBfFGqoGv9OeX0iOUEFbldqRZj+RT5zxEpQYVnKXqHoEpgvAy/yUd/MalkWCa8zBSgO8jI+5Y2HvbbkwZzO1+93rnSIk+q7muAnjbwRfHg2vlarHOXF8OiSWWA4zDOP7DN4X4mpKJ9+nEnVy+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZCoMd4Naix2ZCUuUtvf4gmnQ0zkolRvzkrf9IAn2fpqEl1U3ZjzScgeqbwhq68MGuqHP1Bruav3oy7dHnJgcROmH6tfobBkgFPSQQ1kM+ghIxPhYvs2tYyZCu9kftcOGOqxe+cj+T9CSqTZHXDYH9Tc/Aqb2TuX8s8kFkxV2sjMnrypNMw7tjAI/qrL4l8pkgdXUbn9DavAMRsEx4p3g2XPzbodylBwahp2GjQ3Ca4bmVx53zFMC/qahSAVzoFO8oYSlwFBYCW4flrs8Nk/YDzlTYmxPhMnu8XCgra/01SIIaTuYGMO5aAYL3e+trnVkdG/HSaVCYvJexuGQUHbvlqpE4HGzKPWkqDuz48ZvRC1c2lVEFedek01Z91w9F7+D7C8q4oQsLUZewX4/74bcteYTK+haIAhNnippcBehVIMk+da99QDAEz8uD4+nnhir
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:40.8310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77757c45-5bb8-4852-ac8d-08df18e76452
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB388677

Switch all users of the ATL SPA translation function to the new unified
interface.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 15 +++++++--------
 drivers/edac/amd64_edac.h |  2 ++
 drivers/ras/amd/atl/umc.c |  8 +++++---
 drivers/ras/amd/fmpm.c    | 10 +++++-----
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..f428d815bff1 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2809,9 +2809,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 {
 	u8 ecc_type = (m->status >> 45) & 0x3;
 	struct mem_ctl_info *mci;
-	unsigned long sys_addr;
 	struct amd64_pvt *pvt;
-	struct atl_err a_err;
 	struct err_info err;
 
 	node_id = fixup_node_id(node_id, m);
@@ -2843,17 +2841,18 @@ static void decode_umc_error(int node_id, struct mce *m)
 
 	pvt->ops->get_err_info(m, &err);
 
-	a_err.addr = m->addr;
-	a_err.ipid = m->ipid;
-	a_err.cpu  = m->extcpu;
+	err.a_err.addr      = m->addr;
+	err.a_err.ipid      = m->ipid;
+	err.a_err.cpu       = m->extcpu;
+	err.a_err.requested = ATL_OP_SPA;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(sys_addr)) {
+	amd_translate_umc_mca_addr(&err.a_err);
+	if (!(err.a_err.valid & ATL_OP_SPA)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
 	}
 
-	error_address_to_page_and_offset(sys_addr, &err);
+	error_address_to_page_and_offset(err.a_err.spa, &err);
 
 log_error:
 	__log_ecc_error(mci, &err, ecc_type);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..b11da6fdf0fc 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -17,6 +17,7 @@
 #include <linux/mmzone.h>
 #include <linux/edac.h>
 #include <linux/bitfield.h>
+#include <linux/ras.h>
 #include <asm/cpu_device_id.h>
 #include <asm/msr.h>
 #include "edac_module.h"
@@ -400,6 +401,7 @@ struct err_info {
 	u16 syndrome;
 	u32 page;
 	u32 offset;
+	struct atl_err a_err;
 };
 
 static inline u32 get_umc_base(u8 channel)
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index 91c02ef5dc11..522378c1d9f2 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -314,15 +314,17 @@ static void _retire_row_mi300(struct atl_err *a_err)
 	struct page *p;
 	u8 col;
 
+	a_err->requested = ATL_OP_SPA;
+
 	for (col = 0; col < MI300_NUM_COL; col++) {
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
-		if (IS_ERR_VALUE(addr))
+		amd_atl_umc_translate_addr(a_err);
+		if (!(a_err->valid & ATL_OP_SPA))
 			continue;
 
-		addr = PHYS_PFN(addr);
+		addr = PHYS_PFN(a_err->spa);
 
 		/*
 		 * Skip invalid or already poisoned pages to avoid unnecessary
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..21f645197410 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -302,7 +302,6 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 {
 	unsigned int i, fru_idx, spa_entry;
 	struct atl_err a_err;
-	unsigned long spa;
 
 	if (entry >= max_nr_entries) {
 		pr_warn_once("FRU descriptor entry %d out-of-bounds (max: %d)\n",
@@ -328,19 +327,20 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 		return;
 	}
 
-	memset(&a_err, 0, sizeof(struct atl_err));
+	memset(&a_err, 0, sizeof(a_err));
 
 	a_err.addr = addr;
 	a_err.ipid = id;
 	a_err.cpu  = cpu;
+	a_err.requested = ATL_OP_SPA;
 
-	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
-	if (IS_ERR_VALUE(spa)) {
+	amd_translate_umc_mca_addr(&a_err);
+	if (!(a_err.valid & ATL_OP_SPA)) {
 		pr_debug("Failed to get system address\n");
 		return;
 	}
 
-	spa_entries[spa_entry] = spa;
+	spa_entries[spa_entry] = a_err.spa;
 	pr_debug("fru_idx: %u, entry: %u, spa_entry: %u, spa: 0x%016llx\n",
 		 fru_idx, entry, spa_entry, spa_entries[spa_entry]);
 }
-- 
2.43.0


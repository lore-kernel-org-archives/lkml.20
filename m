Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013000.outbound.protection.outlook.com [40.93.196.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8014A5C33;
	Tue, 22 Sep 2026 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108649; cv=fail; b=WdsJsYbpN78bZ25OlORYtcj62MZNnk0hWEL8SP627VjhGFtW93nbk++yp/zIoKaGjqdqF3t+VVjsss8u6f/BmeXuCU2pbt0YCk9YULJXODZnal6PKpKR46F6ew/VlBlWJu6xdGVs9e5sjifxNp3lgQavfkRM3s8Gr5vR5fNaQM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108649; c=relaxed/simple;
	bh=oyA7YTxtyw1S4ZZMaJPja31m0/ZkGmfAM0IMOi9tNds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHg3LkZcxVyMP1BswTB59Pml5wxc989NO/9/YqzZlHzdepOvf64OlJI5Vw5BaXKpNsXszjMZHbxuunhg7nXbgZ4qejJxEDYaRfxd2hfMk79TpCajo2AicH0Mf4sgNeOqR+8FmoxH4C4z78Y3Kloh9sdFhFHVeCKITSrun4pk41k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zj2YjVI9; arc=fail smtp.client-ip=40.93.196.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zj2YjVI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8ElxCf/uifCND+gsJMA+orI9jmTU6M+KU/MVL/RlILQ64HHlvZP0qU++V0M6SGkhE5jS7X9IKZiFSh3SlymWIp2Oav76bDoF+3sO58qImv4Bs9d7XcpcqQjqOucsj30yz0yFCEaN4Mz6HhAYPslBJ5EaMdiFfbvHEBxuaOdTuqji6WMbG/uW+P8oR8Lxvy1ESUg7OP4Ux+sj2qJ5o1ZbgYlo4FF084yyI0MksTBdiwefH+FIJ0zVTOsIJke+yZoQABh1UrdNCXUWA1Eg6YIpukcRBD7OzU/MfjdbRSDixFlfQah1vyV2qY7XJeD2AKF1/7LjMq71FUJjvuH/cKV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBpEyrlxs4bJU3lh8NuCqwKpZJEi7V4hCvne2PNfZAw=;
 b=l3iQAOEte705yATW8nxEhyb7apDs9N/MKwqIclGxu9u5jtixGyo3rD2Rp3d00w9BN8xeQro2CUGo/wAPbuKHJ6UQJiJYAjzi03QJzywX6bLa9769sNxeyhUTj7VLIpud8eGfoYlLTtsJ9qJCl5kM4oaGqEsoA9asn3cQA32IOGS/brSA/nqoklrK5HYZzBC9FvjYGc5llhM9XIXn5aMAvFRElD6D4h2dDxVHMjc0VeGZocHvDstoQRGTUvMdwe1XZcRVMVlr3OdfJG2C1PPftmiQhNRCHM8op6puuNdlQ0Fc4jS1CtC6Rd3QjNE57Tu8wHpT8/LnICovhExRQgrHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBpEyrlxs4bJU3lh8NuCqwKpZJEi7V4hCvne2PNfZAw=;
 b=Zj2YjVI9cGGjoakhgMqRVSSH0eKAo74Fj8tl/SGLOB45JzKOn8+e13iBK0XT2UH+Q9jfIxmq+couJPAwq7j56ewl8BWS/emHe/EtWg2hyz51o1OURDVUF55PvMBvXmZ5G1n0V5O2ueYBbT/iMsNj1HGIeU2jmXcXUvtFbEqtUVc=
Received: from SJ0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:2c0::15)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 20:23:41 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::90) by SJ0PR13CA0010.outlook.office365.com
 (2603:10b6:a03:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 20:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:41 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:30 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 5/7] RAS/AMD/ATL: Remove the standalone SPA translation interface
Date: Tue, 22 Sep 2026 15:23:15 -0500
Message-ID: <20260922202318.4079080-6-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 5536bfa1-86b8-43df-3950-08df18e764a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PYoV1k2yohPWXsPw7EnIOm/xkP/sZcMPUWVlZGvkIc4YEUUSYT55L0kJYF26j8p6PIMlpiIolIiR/btqvByTPWi5xgOeTW8WZsbdmjJi8hmVVbD98kW4U7RxSGLyBK+RMzFXhLhXTXfkkddpn1ao3bRMUGOJe/iCtcRtQZgEVp1OMFXQEogi95pvR3cFWLeYelSTIf2GJ+RN+cjCSFGAPOBgJsSdVFWAt0MOGLI/SrIGZvw/Dsd/6/vA/1+Y7L8gmRPLtk1iZqT+zocRMhTgxyogXw/yf8uvFvDgmVytfk8wPl9kYUBgqRN2T0zoJrRirUH0SShqJKT5qTLBqxf/B0IhYQUApvs5AWK2J4BtKh7FH05XzJ9uNkGtgdT2gprW5mIth3RnsZZ2ckClADn1dGKu5a2a5tHTMLN7fyhrO3FjfoYoKQVkADDSkuxjr+navYW6l2up8rknACSaMwBxKo3Fzzrayp4OZbR7OqU4KJzhHLhJW4LtOr42pkYQNc7VhWLb0tNCbQgKhmwSWi/fmQ2Eqk5Kwrj/4FAZA1pCQVaxgqbCfSRkbsUG+q7lTl7To/veFNFj0ZSTArlF6c64eoZ0IbEJTzB9DTZfw/vsFNBEFOezC5R8+ACxAawSQP5rvpAMSNmUnLMk8/T2Rw4KwWUzprwhGFBX6XsUEzdWD6PwzyotzQ5i9CZpBjqerg/ZkBmzTYYPWq2VPaaIs9xeyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BJzfMbzEkdzPIR4bO44PmY2FhEQZYE8j+pYloTK2cYL4vt9wd08fjkTswCGuY/KByZT3Ua62J37XDXeAo9eRmhjLL5uw8BKdiOjwTUK66D6O04Esd6t11NBIszin4GUrCvpZ5ZNflJtKEuXrLkB+yJDfU5XwlLXIB0Ox/joY6YZWXes1CmMZzX/na0AAb2CDqSyxjC3Sc4AQstl3683tm1FdAVu067ytltMtjdFwkvtwf9RE04O/MN5VkfxBZKUIDmR8n2hEvpvEVPuUpfhhMfAvz0n43+vDr4OM0/pMvP4PNj0yvWAHxsXMOCv8D96OepowCXexNg/zC+K89I64KD77G5NJznkxZtCDrsZmXT59WRWIAKAwJURaKlDp7cJXJY72NX3/XdViQUTUim5DpJUiCw6q3vaw9ayTo3ULXFdMUzkrUvLT28VSHQlXZqNQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:41.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5536bfa1-86b8-43df-3950-08df18e764a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860

All consumers now use the unified amd_translate_umc_mca_addr() interface,
which is routed through the RAS core in the same way. The older
amd_convert_umc_mca_addr_to_sys_addr() interface and its separate
register/unregister pair are no longer used.

Remove amd_convert_umc_mca_addr_to_sys_addr() together with
amd_atl_register_decoder()/amd_atl_unregister_decoder() and the associated
function pointer.

The unified interface performs the PRM translation itself, so
convert_umc_mca_addr_to_sys_addr() is now only the native Data Fabric
fallback. Make it static and drop its PRM attempt. Have it use the socket
ID that amd_atl_umc_translate_addr() already stores in struct atl_err.

The prm_umc_norm_to_sys_addr() wrapper has no remaining users. Remove it.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  2 --
 drivers/ras/amd/atl/internal.h |  2 --
 drivers/ras/amd/atl/prm.c      | 20 --------------------
 drivers/ras/amd/atl/umc.c      |  9 ++-------
 drivers/ras/ras.c              | 29 -----------------------------
 include/linux/ras.h            |  5 -----
 6 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index b754eaef8585..cb944d3473ba 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -209,7 +209,6 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 	amd_atl_register_umc_translator(amd_atl_umc_translate_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
@@ -222,7 +221,6 @@ static int __init amd_atl_init(void)
  */
 static void __exit amd_atl_exit(void)
 {
-	amd_atl_unregister_decoder();
 	amd_atl_unregister_umc_translator();
 }
 
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 0c86f40a094b..ed8d176a05e3 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -279,7 +279,6 @@ int denormalize_address(struct addr_ctx *ctx);
 int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 void amd_atl_umc_translate_addr(struct atl_err *err);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
@@ -295,7 +294,6 @@ struct param_buf {
 } __packed;
 
 int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf);
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
  * Make a gap in @data that is @num_bits long starting at @bit_num.
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0635215f220a..ed357ae1607a 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -33,23 +33,3 @@ int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf)
 
 	return ret;
 }
-
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
-{
-	unsigned long sys_addr;
-	struct param_buf p_buf = {
-		.addr = {
-			.addr		= addr,
-			.socket_id	= socket_id,
-			.ipid		= bank_id,
-		},
-		.out_buf	= &sys_addr,
-	};
-	int ret;
-
-	ret = prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf);
-	if (ret)
-		return ret;
-
-	return sys_addr;
-}
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index 522378c1d9f2..32748d47ae8d 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -401,21 +401,16 @@ static u8 get_coh_st_inst_id(struct atl_err *err)
 	return FIELD_GET(UMC_CHANNEL_NUM, err->ipid);
 }
 
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+static unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 {
-	u8 socket_id = topology_physical_package_id(err->cpu);
 	u8 coh_st_inst_id = get_coh_st_inst_id(err);
 	unsigned long addr = get_addr(err->addr);
+	u8 socket_id = err->socket_id;
 	u8 die_id = get_die_id(err);
-	unsigned long ret_addr;
 
 	pr_debug("socket_id=0x%x die_id=0x%x coh_st_inst_id=0x%x addr=0x%016lx",
 		 socket_id, die_id, coh_st_inst_id, addr);
 
-	ret_addr = prm_umc_norm_to_sys_addr(socket_id, err->ipid, addr);
-	if (!IS_ERR_VALUE(ret_addr) || df_cfg.flags.prm_only)
-		return ret_addr;
-
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
 
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 20e23560dee5..c92b6d599792 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -11,35 +11,6 @@
 #include <linux/uuid.h>
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-/*
- * Once set, this function pointer should never be unset.
- *
- * The library module will set this pointer if it successfully loads. The module
- * should not be unloaded except for testing and debug purposes.
- */
-static unsigned long (*amd_atl_umc_na_to_spa)(struct atl_err *err);
-
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *))
-{
-	amd_atl_umc_na_to_spa = f;
-}
-EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
-
-void amd_atl_unregister_decoder(void)
-{
-	amd_atl_umc_na_to_spa = NULL;
-}
-EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
-
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
-{
-	if (!amd_atl_umc_na_to_spa)
-		return -EINVAL;
-
-	return amd_atl_umc_na_to_spa(err);
-}
-EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
-
 /*
  * Set by the library module when it loads. Left registered while the module is
  * resident; consumers keep no direct dependency on the library, so translation
diff --git a/include/linux/ras.h b/include/linux/ras.h
index eac8cf39ddd5..f0afacdcebcf 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -60,18 +60,13 @@ struct atl_err {
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
-void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 
 void amd_atl_register_umc_translator(void (*f)(struct atl_err *));
 void amd_atl_unregister_umc_translator(void);
 void amd_translate_umc_mca_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
-static inline unsigned long
-amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 static inline void
 amd_translate_umc_mca_addr(struct atl_err *err) { err->valid = 0; }
 #endif /* CONFIG_AMD_ATL */
-- 
2.43.0


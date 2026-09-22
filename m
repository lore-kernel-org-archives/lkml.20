Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB05417BD2;
	Tue, 22 Sep 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108643; cv=fail; b=d36fHhggZPscNP/P0PRhQrEaIPsX98XAxeDOm+OOKdfw/FQgXd4ofJFBbGfz+8lRsT6UiSy0aCKkn6naVj1kZi3pujk4yTofD7ZW5VLSsX/3TTAmWdXViBm61IIMPlzUWTnMSjQrMKFTSZGM9zlDwGWgbvWuBTk4l3kHHYvJvhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108643; c=relaxed/simple;
	bh=JsOEpML6N2kXaZNBhiEaE3rSMU6Fq5k7SDAt26s81vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tew3VMMElNjAUXljf5TIWEJinenlVDMdKDhl6UGKMI1ZThqGyJNdYOFZfev045oaHTdIabfO1WJFQzv3rhh0xrkJZwZ+0S14aLOo6Pne7bluOCVmgKJvry5WeH0+s9c/44xayul4GlD1ZFqkphbtcj5bIUbz8qSL6Eo4J4UxG8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BUTkEOpc; arc=fail smtp.client-ip=40.93.198.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BUTkEOpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX2IVdx2ymsodjm+tS9CiHPORg2zT/UAZUFJYVFcitFQGh0c7T97Dn8fSQ3jyOVVKpBV3ujUG+uIZ8vGwd0PHRO39I1wF2BgetRiIy/E/IF8uDYXpR0qUfbZF/sNnu+vhhGIrHilTNR7ilS0SbyUHk0wpGra27v1IfacpJ7Tq9cGf84j7KHHRFMta64e3YJQNanWErlD/N4l9xvUYkaiUwhCpp9aD8oGx6SeRTuofh7+7VaxE/Sim52xp1wWl2Nlj3HmRNqF6XWf7cH6hLdmhBKm7b89FWGkxgelmGT+W8/FooDvs9026B7Pkw2FTLOj9Jws8uaZm0q16/8SdlHnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgYFuHP5VFshXoqU1eDHMxWF8sLZjFcSD3f7eJcZRlE=;
 b=V9uPSiXbkH4cW5Bc3n3yNBoI0KLniWLXJbBwK324AqXaHfRr5I0XDj4vxgc0vz4YJZcWbICVU74GD+fKBwEjoZtHpGIkBzB0f9H1zhGZTs3ulZ3hWOhRbgwDURsIRtBeLlXJrdSY9YtnLJpQKC1igZUr2f+OY1/7ggouZ8+34pVxz7avkAoMj8dZzROlm7IzZJhcYHrKg5fXMoEAVi5Wo6vhHD0L+wDp8zYWvN2UBMx40RneCe+lJoJHoH1D+nBTpSnlX3KdHKOJA6mQ5Kg5ns+srEzQTjL9m2p2zzTvfonDxt49jZ0btzfLxYiITwTAiP/UguB4IzR826TVuEVgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgYFuHP5VFshXoqU1eDHMxWF8sLZjFcSD3f7eJcZRlE=;
 b=BUTkEOpcxc3y007r/nRZR8mTfm0csq05rL6PmmcXi2KlR5JMTyYBTcW3/YhwklrHyHv9VR2jSUlyOY/qVM8dSXdqVziGWbIrYxr9yXx/8zyBhGd4LqqTvv7fz8Q2BBGrQrnm6VCEevhBQC5rP6CNKkGeKE7Gffea776XcdCfztA=
Received: from SJ0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:2c0::12)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 20:23:42 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::c) by SJ0PR13CA0007.outlook.office365.com
 (2603:10b6:a03:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
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
Subject: [PATCH v10 6/7] RAS/AMD/ATL: Add DRAM address translation via PRM
Date: Tue, 22 Sep 2026 15:23:16 -0500
Message-ID: <20260922202318.4079080-7-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f02ab8-e0b2-4457-8727-08df18e764f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|13003099007|3023799007|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d99EuKXZnvWVEeiRc0jk/yyJB0wZZthVlxgmybG+G8hb8LUSMH3eAt2Cs2AzQojDHd6UyN8QeotLqvzLdM38JFdHsuwP36abhTIEoPdZGsHT1wDkXuaDNYcIDNoimfshlpTKY8kXdFPU2fDPRSdo6XDOC/bUeBeE/AqEHU7LfPGUH2z1c6XtJG0t8Pw6cijQAJ2h0gcWvEHwQ4jiiG0NVaAr2SHSCIMXSUwuedppJG2/SUXF1TbVKgTljPBH1sZMgUBtleR4F7clkjbYnqrvrm0nuZrYrbJtWhEGEEcKgjVFFv22ARMJIZ4ayRkOUBckE49ZbbqK6HtSfFM6kwjxUu3xagYaNluY79fsmFX5jh/wFka7Ad4anUnwfpEtExw59RgvHNpdz462l8K53bCCON5M+KdRe47pvKfawMKAg/TDSTyEf39Ubs+GfpWPCnwzTl1FJ/WJt0qIZEHczXAe0T/9281QZ/PkwzFISabU2gQ1PzmQTVmaFI4HDJrpjnCmPfjOoqIu2/Ft/IZ2v2Mt3OVpHdzHOqyJwW77vOTzuEAbBg2xRwLY+EfyBOViNSCvhk00/f69Hy9OeDpSXNmx40jODdC6bYM1a/h+zyd6aXyLB2y1Tbum8kRxaGjshFIcQf+BBcTB4693H2Y6teY6+sAS75Dqt1iuj10xTValXf193KCeuosiQw4na71REoG9qoF+a7RECvAhblxRjarsHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(13003099007)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UL8kyK0M22njnKj1KWCCITpPxAwk+By7Ur+o+/eXhQK20EXd6/7DdXMi0vwkL9TYwdpm8ZbbpSFIshA9hiLLjNgV/4N1U5Eqple+O7JdRb1T1zzQS6jZoRKb2XpbZ4Pbe6F2B1uq1PmnSNWLlkYtEY/9uGbWkHn68XfwKgo+wyi1O6AMGSVn41GknlnIgNSM3h3qKGAKV/0WqK6BD9DRckD1yTNFgOc9t/kGBvNhdxKIkXkv2vrGaqKVUS9WweUqI+hDFoMDUK8znM2W7mmDJAAaC5SafhrbLjxvtGuoDrSHaVUeUYDkQN+Q5WhdUp+0Z5842vaUqNhoduQfWUMgf73G48DIQtnkkN+1ElH0idybIAbWEszbFn5UmuAWc56+Fii6ejdg9waW46YeQTMEEqqRSJvPfu0Qcb41PKaPEGsIZmjrysb5ZgLrdmdxAbPI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:41.8637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f02ab8-e0b2-4457-8727-08df18e764f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625

On AMD's Zen-based SoCs, a Unified Memory Controller (UMC) relative
"normalized" address is reported through the MCA_ADDR of UMC SMCA banks on
occurrence of a DRAM ECC error. This address can be converted into a DRAM
address to decode additional information about the error.

Add support to convert a normalized address into a DRAM address using the
appropriate PRM handler. Expose it as a new operation, ATL_OP_DA, on the
unified interface.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220577
Assisted-by: LLM
Originally-by: Avadhut Naik <avadhut.naik@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/internal.h |  1 +
 drivers/ras/amd/atl/system.c   |  4 ++++
 drivers/ras/amd/atl/umc.c      | 10 ++++++++++
 include/linux/ras.h            | 13 +++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index ed8d176a05e3..bbca0cfca716 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -286,6 +286,7 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
+extern const guid_t norm_to_dram_guid;
 
 /* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
 struct param_buf {
diff --git a/drivers/ras/amd/atl/system.c b/drivers/ras/amd/atl/system.c
index 812a30e21d3a..1315bcc63e30 100644
--- a/drivers/ras/amd/atl/system.c
+++ b/drivers/ras/amd/atl/system.c
@@ -18,6 +18,10 @@ const guid_t norm_to_sys_guid = GUID_INIT(0xE7180659, 0xA65D, 0x451D,
 					  0x92, 0xCD, 0x2B, 0x56, 0xF1,
 					  0x2B, 0xEB, 0xA6);
 
+const guid_t norm_to_dram_guid = GUID_INIT(0x7626C6AE, 0xF973, 0x429C,
+					   0xA9, 0x1C, 0x10, 0x7D, 0x7B,
+					   0xE2, 0x98, 0xB0);
+
 int determine_node_id(struct addr_ctx *ctx, u8 socket_id, u8 die_id)
 {
 	u16 socket_id_bits, die_id_bits;
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index 32748d47ae8d..4495dce3f21e 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -454,4 +454,14 @@ void amd_atl_umc_translate_addr(struct atl_err *err)
 			}
 		}
 	}
+
+	if (err->requested & ATL_OP_DA) {
+		struct param_buf p_buf = {
+			.addr		= err->umc_addr,
+			.out_buf	= &err->da,
+		};
+
+		if (!prm_umc_norm_to_addr(norm_to_dram_guid, &p_buf))
+			err->valid |= ATL_OP_DA;
+	}
 }
diff --git a/include/linux/ras.h b/include/linux/ras.h
index f0afacdcebcf..6589b4e3ff0c 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -37,8 +37,20 @@ static inline void
 log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
 #endif
 
+/* See "NA to DA Output Buffer" in the AMD ACPI Porting Guide. */
+struct atl_dram_addr {
+	u8 chip_select;
+	u8 bank_group;
+	u8 bank_addr;
+	u32 row_addr;
+	u16 col_addr;
+	u8 rank_mul;
+	u8 sub_ch;
+} __packed;
+
 /* Operations requested and completed through amd_translate_umc_mca_addr(). */
 #define ATL_OP_SPA		BIT(0)	/* System Physical Address */
+#define ATL_OP_DA		BIT(1)	/* DRAM address components */
 
 struct atl_err {
 	/* Identifiers; layout mirrors the PRM parameter buffer inputs */
@@ -57,6 +69,7 @@ struct atl_err {
 
 	/* Outputs */
 	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
+	struct atl_dram_addr da;	/* Valid if (@valid & ATL_OP_DA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-- 
2.43.0


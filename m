Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C539E6F0;
	Tue, 22 Sep 2026 20:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108636; cv=fail; b=fbjx0D8KF/G0s5ak2CsqUAlFW37El7lpIRgU2VIz1hjJmk4weZzugr11vZHLEq7jc00WC9qcrr2JMHi7anY7ZeOdLVS5anQRQnERNWT4c05SbZoGnsQ4teeUyWIuSytcPpkCWgRf8DUMjgqJKoSixTrSf5tnyb+1XXdu+bYF8Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108636; c=relaxed/simple;
	bh=QCWiTwksrEuuOQKoRz693PfFXEMztpLDpmgdvI2a/bY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSdgq4JqO44vNc5/IrPiSKFEoXTo5Egjy8Z80GJ3b1ywZF5f3H6WMKmfrmTcY9tf03OHndgeyzdj9aggPGCZU9jeGjedg5Ub4U2sQJDAQkj3YKNIvzovMKTjwc0sfYPJ2hn4kYtv9hFmcJhP92KkZ9Y5mDtWHGv5mH0qGPoie10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wGSsqwwN; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wGSsqwwN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5K4KO1yMrG3VKHOga3xvb2wlRtsVaIDqtLvLk+8FF5wcD4bVf9/FtwbAcI8h+YEC+vWgh3pxHNFGVu0XHGduQd/hDWAw/1Uc8XoLAASD1JaG7wxRUgSomTdwAJLD8c+OuT0LaC3W9uEQiLoQcZmmTPcDIweheH2+AIu4Dtwjs5hWk6PkXWh/GxcaXTba+VYAuDBow1cjrFlmLo7m9R4tmLdDnVcq7mopVZ9SfhQkZImi4CrmXdmoaNoAgSlBhzSjflJB84h9blHZKAES6Fdrnu7NfASzCS2G95s3bAT7UsLX3319aG1qccGzq255WBNMmuE8+eRS/ad8YX/fhRxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwE1ZCdvoL2moPHWc3C5Yv5k8ntuQFn30yVWfR64J1o=;
 b=ZPXg4Hcffx7hviPdOoYNvGG/A9dw+VnRsJWiRTwI+xSfSrUrbEHrTexFe15/OmIttZuZQXJBjcmVCXGztgf01dL8D0WCzprQRBNIECUdsP0uyYc7AWee+JdXrjGpRLJxG4PqUSAqOoCVWDNWwW7y/mocrcKVf8bYvTUzrA0yTX53wClMqgpLIc/7hkcrl+EvsnpkrfjKVCJirUW/ptS+KkFRp5Hvsa6P0TD2EGdmtjwmG3wd7FOpW+voYzDN6vA6aSVWea5Hu3be2uU055DiakabnLdpYjXx/9lAvxKSfl9r7I5hY/y8SC/erBNaMRg/V4scfIdojs1vSqaWRmU17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwE1ZCdvoL2moPHWc3C5Yv5k8ntuQFn30yVWfR64J1o=;
 b=wGSsqwwNcJaBAIPCJWr1cHWhqHn66jaTupGiTI1owlQxii4QV7rEJInm0p8ruswUTqOY+xV+d5rh7F3am0rWS7iZIA1139zEWs3HJY2OAM/s8H9U3w+2Mzw4BdF8oCMWs2TWwFlS2+g30M7qfn/R8N1aAc13rIHWvb+q9c8g1GU=
Received: from SJ0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:2c0::7)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 20:23:40 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::89) by SJ0PR13CA0002.outlook.office365.com
 (2603:10b6:a03:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Tue,
 22 Sep 2026 20:23:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:39 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:29 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 3/7] RAS/AMD/ATL: Add unified UMC address translation interface
Date: Tue, 22 Sep 2026 15:23:13 -0500
Message-ID: <20260922202318.4079080-4-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5bff40-0e84-4e8e-3f94-08df18e7635e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|3023799007|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vQoum4ruuu7CPM7d0xGW4+oZIEqdKqvlwT/JWKggNkHb0xTJO6PLaFK+l4CHqGRtPa/B5iFDuDpOlODTJnv/BtR1DtDd+zZ4TBgeGezpHhOqgUBngjh5O7IZDHU5Rrux68CIM7OMz9zLnhy+TXxC/hJAso07OaSldsE2B8B18mHKK6nl5irTbGxs8hnvXf+HBqmZH6PNALIhr/GvywJMFfPoWAyzovBy/Vtfe3mIHsfXsCQsB85lV3vxCl2+71vvy0fORfbgaMINd54WNgVo8bZrBPdIj3LEtjYou31HriVfL8RmLsWfwiUSnW/N96UR3ifZCINor9tDCbkA++xC5SK+6lUc8prvqqbVbIRPGg5/gGCGjUJx7sP2HuUmEj1ZtbMSk6sJvbvAuNz+NiGdHRa9QCkjAlfzFGbDrCqQxis/zI7puutzpyY0ha51Is1cktI3kSYZDXENccYQCvsp8e6+6JOc3M8V1Nody3Z4CRJeQ4uq3b2y109eDpmz8KPl1XNQS2mJSusINEt+wOa3NGRywmQDNuLvmbb+hPMFY37rJ/pNgS2QzseIMIiYTV37BwgTkD8lNGiQBvKIO2oRuu3wP3HVHmPAfj2/4Cs0TPMFRymdsY1e1RjPfySxRiTLjSDIXmLL3Smca0ekW2bOoylGPsvrVKldh/kDDv19OlQxfEFdyYbx/IrfjWprAQK/HWv2yhx3t5Jo8e3e5A6Qgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J/VHFysdwX9FKuQ1uWQHzx/7L6vDWEKsbGu9+u6jNS8KvuPQdfv0ww3oThg/lA6Ujr1tw9hAcpclyy9/xHPmCEflU1tnSJBR5S0zc4CCWFj4y3UENQdBbHLcd7waZj750Xegdvn8FKX1CRLtC/1r69qDUJndCea8x6OaimlIiTJrtltvacuTGDayqpVPLvgvIsRIR6F5HEbTYjckseYIJO9b/t6Sx8wk2wVzKw4WJNgkWrjsSUyEWqn84vodhClY5VTbuqOuuJ72g8O/cezGs3bcuaYYSZbv9MEPUBhQM49t36hhLmzmCWzugq5UaDJ7CiOM8OK56nygs2rBFWZVjb1zYJi5lm8dCt0ghjyvPD88zjektSmNuM3OR5Ts9uG+eem+LEndGFJQxGH0EWjyNN/wByD21Dr+GMUfoZTJik/Gw8sJk7uNkWEQLT8QCVVo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:39.2273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5bff40-0e84-4e8e-3f94-08df18e7635e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

The library exposes a single function for UMC address translation. Adding a
new translation would mean adding and plumbing another export. Callers also
have no way to request more than one representation of an address in a
single call.

Add a single entry point, amd_translate_umc_mca_addr(), that operates
entirely through struct atl_err. Expand the struct with a pair of
operation bitmaps and the per-operation output fields.

The caller provides the error inputs and requests one or more operations.
Each operation is attempted independently. The library sets a validation
bit and fills the matching output for each operation that succeeds. The
caller must check the validation bit before consuming an output value.

Group the error identifiers (normalized address, socket, and UMC bank ID)
into struct atl_umc_addr. Lay it out to match the PRM parameter buffer
inputs that every handler shares, and embed it in the buffer. A caller can
then build the buffer straight from its own struct atl_err. Move the buffer
definition to internal.h so callers outside prm.c can do so.

Route the interface through the always-built RAS core so the library
remains optional. The core provides the entry point and a
register/unregister pair. The library registers its implementation on load.
The entry point does nothing (no validation bits set) when the library is
absent.

Start with a single operation, ATL_OP_SPA, that produces the System
Physical Address. Try the PRM handler first. Fall back to the native Data
Fabric translation if PRM is unavailable and the Data Fabric revision
supports it.

Leave the existing amd_convert_umc_mca_addr_to_sys_addr() interface in
place for now.

Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/core.c     |  2 ++
 drivers/ras/amd/atl/internal.h |  8 +++++++
 drivers/ras/amd/atl/prm.c      | 18 +++++----------
 drivers/ras/amd/atl/umc.c      | 42 ++++++++++++++++++++++++++++++++++
 drivers/ras/ras.c              | 28 +++++++++++++++++++++++
 include/linux/ras.h            | 28 +++++++++++++++++++++--
 6 files changed, 112 insertions(+), 14 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..b754eaef8585 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -210,6 +210,7 @@ static int __init amd_atl_init(void)
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
 	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+	amd_atl_register_umc_translator(amd_atl_umc_translate_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
@@ -222,6 +223,7 @@ static int __init amd_atl_init(void)
 static void __exit amd_atl_exit(void)
 {
 	amd_atl_unregister_decoder();
+	amd_atl_unregister_umc_translator();
 }
 
 module_init(amd_atl_init);
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 4fc4bc3c3500..0c86f40a094b 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -280,6 +280,7 @@ int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
 unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+void amd_atl_umc_translate_addr(struct atl_err *err);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
@@ -287,6 +288,13 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
+/* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
+struct param_buf {
+	struct atl_umc_addr addr;
+	void *out_buf;
+} __packed;
+
+int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf);
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
 
 /*
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index b3ff33a668c2..0635215f220a 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -18,15 +18,7 @@
 
 #include <linux/prmt.h>
 
-/* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
-struct param_buf {
-	u64 norm_addr;
-	u8 socket;
-	u64 bank_id;
-	void *out_buf;
-} __packed;
-
-static int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf)
+int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf)
 {
 	int ret;
 
@@ -46,9 +38,11 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long
 {
 	unsigned long sys_addr;
 	struct param_buf p_buf = {
-		.norm_addr	= addr,
-		.socket		= socket_id,
-		.bank_id	= bank_id,
+		.addr = {
+			.addr		= addr,
+			.socket_id	= socket_id,
+			.ipid		= bank_id,
+		},
 		.out_buf	= &sys_addr,
 	};
 	int ret;
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index befc616d5e8a..91c02ef5dc11 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -416,3 +416,45 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 
 	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
 }
+
+/*
+ * Translate a UMC MCA error address into one or more representations as
+ * requested by the caller.
+ *
+ * The caller sets the input values and requests one or more operations
+ * through @err->requested. @err->valid is cleared on entry. Each operation
+ * is attempted independently. The corresponding bit in @err->valid is set
+ * and the related output field is filled for each operation that succeeds.
+ * The caller must check @err->valid before consuming an output value.
+ *
+ * The PRM handlers consume @err->umc_addr directly. Only MI300 needs its
+ * MCA_ADDR value converted to a normalized address first; see get_addr().
+ * MI300 platforms provide no PRM handlers, so the conversion is left to the
+ * native fallback path.
+ *
+ * Registered with the RAS core as the UMC address translator; see
+ * amd_translate_umc_mca_addr().
+ */
+void amd_atl_umc_translate_addr(struct atl_err *err)
+{
+	err->socket_id = topology_physical_package_id(err->cpu);
+	err->valid     = 0;
+
+	if (err->requested & ATL_OP_SPA) {
+		struct param_buf p_buf = {
+			.addr		= err->umc_addr,
+			.out_buf	= &err->spa,
+		};
+
+		if (!prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf)) {
+			err->valid |= ATL_OP_SPA;
+		} else if (!df_cfg.flags.prm_only) {
+			unsigned long spa = convert_umc_mca_addr_to_sys_addr(err);
+
+			if (!IS_ERR_VALUE(spa)) {
+				err->spa = spa;
+				err->valid |= ATL_OP_SPA;
+			}
+		}
+	}
+}
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..20e23560dee5 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -39,6 +39,34 @@ unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
 	return amd_atl_umc_na_to_spa(err);
 }
 EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
+
+/*
+ * Set by the library module when it loads. Left registered while the module is
+ * resident; consumers keep no direct dependency on the library, so translation
+ * is simply skipped when it is not loaded.
+ */
+static void (*amd_atl_umc_translate)(struct atl_err *err);
+
+void amd_atl_register_umc_translator(void (*f)(struct atl_err *))
+{
+	amd_atl_umc_translate = f;
+}
+EXPORT_SYMBOL_GPL(amd_atl_register_umc_translator);
+
+void amd_atl_unregister_umc_translator(void)
+{
+	amd_atl_umc_translate = NULL;
+}
+EXPORT_SYMBOL_GPL(amd_atl_unregister_umc_translator);
+
+void amd_translate_umc_mca_addr(struct atl_err *err)
+{
+	err->valid = 0;
+
+	if (amd_atl_umc_translate)
+		amd_atl_umc_translate(err);
+}
+EXPORT_SYMBOL_GPL(amd_translate_umc_mca_addr);
 #endif /* CONFIG_AMD_ATL */
 
 #define CREATE_TRACE_POINTS
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 468941bfe855..eac8cf39ddd5 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -3,6 +3,8 @@
 #define __RAS_H__
 
 #include <asm/errno.h>
+#include <linux/bits.h>
+#include <linux/stddef.h>
 #include <linux/uuid.h>
 #include <linux/cper.h>
 
@@ -35,10 +37,26 @@ static inline void
 log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
 #endif
 
+/* Operations requested and completed through amd_translate_umc_mca_addr(). */
+#define ATL_OP_SPA		BIT(0)	/* System Physical Address */
+
 struct atl_err {
-	u64 addr;
-	u64 ipid;
+	/* Identifiers; layout mirrors the PRM parameter buffer inputs */
+	__struct_group(atl_umc_addr, umc_addr, __packed,
+		u64 addr;
+		u8 socket_id;		/* Filled by the library from @cpu */
+		u64 ipid;
+	);
 	u32 cpu;
+
+	/* Requested operations (input) */
+	u8 requested;
+
+	/* Completed operations (output) */
+	u8 valid;
+
+	/* Outputs */
+	u64 spa;			/* Valid if (@valid & ATL_OP_SPA) */
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
@@ -46,10 +64,16 @@ void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
 void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
 unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+
+void amd_atl_register_umc_translator(void (*f)(struct atl_err *));
+void amd_atl_unregister_umc_translator(void);
+void amd_translate_umc_mca_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
 amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+static inline void
+amd_translate_umc_mca_addr(struct atl_err *err) { err->valid = 0; }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-- 
2.43.0


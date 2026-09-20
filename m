Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBC23E334
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928285; cv=fail; b=HdNpB6XkJw5KpafU+Uc3Dm9XDDvPmVk12O2GZS5NdXgdFXGFPVFIK7w76fCgo/j3XTQ1GuZ+e/14F/SzERqNmf4v/uXBwWfNLwtr607dmsZCfbjKEHSMOHLqAnkNIza/aVB1tA0SEaWoONNkmgN6uThIrXpPDIVZeYkxgHydkCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928285; c=relaxed/simple;
	bh=ZKJKM1GnPJYuonmX/ZloPqAO4ckum6u2L8uUPUsMCVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3cX9vilDhVk795Fh9ha6fCUoDs1zLa6U6lRBeDbCplwhpyE2runzCivptloNEnVkyZCPumffqpB+P7uTgqVxmmmnp/7zJyviuco6qu8XLRX6AQ/6mg6dV5u+ZbQKf1uQtnGHy0641tre0NMkPkEpKZgGDceZuJzW1fPyZAxZTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aGAV3MTj; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aGAV3MTj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfp2AKGIZHRCCq0dclSdMiHYqJb38Wm2RibdUvEjJP4RNGClTUPs1AvTMqobYwVPTMPlbmtJ8vfO53B7sy00jrd4CRTsKP3aY33no/nNP94QB4bn2crEhmUVoLgUmry8mPJlic05TDLgab5v3f9WH9XW9TK9SAFBPDiM+bHu6WfYa3WOrIPjbISimrw9ueqTU9+2D+ColbA9l/U60FD5mwF8xBCe8RXZaBXlIjr/qqLx/dmRHNisQozTSr4zQlBj89/Kx4C656N8zVUkPovt0WJGUURXQumQCfipR1dnu0pgBULEa6BmBrAQxLfY6EbXyMgqrXYh7YcPrXEx4676Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe9UZ+O2CyUw4JuZDq8CKzcjqMNGc997tn/tDSbys3k=;
 b=ODMkHeXL2gDUmgOqXKqOQb572ascowasoUE6fk5TGve2PLls+Y+tmn63OWXtaZYMejc2XRBx4vnOheB/R7RH4butnB27cdCY5eEQpRC3OBZr4+5qNKkFP3Bo++ijbh5E236VaRWEpbeILekbOGAX9UItzZQ2dtHd/qDfDKmrEnHfLuS4ynm7Zw6+XHIDGP8oOzb5HXvSeYIVELzwXmq4VjLWr4PCEKFohHZwolAJPpoMX1rf7eMFQfPXwSuwgKMxyhcRy2evtPrDWrplsPo9brX3pw4/6W6PaIrgdXbmEoVyfze1FcU8GcvN76ibhMRFkLyBw78OBf1xkvmc/v2iNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe9UZ+O2CyUw4JuZDq8CKzcjqMNGc997tn/tDSbys3k=;
 b=aGAV3MTjaYBnfEsDRK+YB3Oy8i69sSVmKdbfhTi9GvvozBixL/2ZrznrRkd3Q38wz32Y8DprcUgg+x1oS4/04UyZtJnaWWY8459EdY/vqIcbSbb0eLqhtuydYyR6Lm+Az9AaQoyP5gCm30MHRj1Z/pTQQN7Pp1Jip92FxZ195TM=
Received: from BN0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:408:e6::13)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:17:59 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::9c) by BN0PR03CA0008.outlook.office365.com
 (2603:10b6:408:e6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:17:59 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:17:58 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 4/8] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Sun, 20 Sep 2026 18:16:56 +0000
Message-ID: <3fb71214cab745b8c71166aac347854dfb85a4d0.1789927246.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789927246.git.huibo.wang@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4682e0-ab9d-417b-c9c9-08df17438030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|56012099006|3023799007|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8p0mX3oeZtipVIN3dl2N/drmmi0NEWDxSqtq0EE3cfJLeOud7gWbTWwuUaMyraYGNByAitK9tc6CmPusukC/ziGIdx26+ROlCsOEw8Y65BaeUbQvWxNnsa4n+LPAXf5jngm3t1s7kOkZnGXvhAg6keQtAkgxNWh4I7H99U55H0cj1TFYebj2A9BpWzm+WhrZ0B2KijgE3EQtwtMWcLnXbczMqOI4//qxtmhie01rs74tKbf5sXLhjE3C7BQ+DUDu1CIX8D1NVi3Mc8FxZuPjbchSSpBp938BYWzePNI/7WbW7DfN6CJAq1Db7Ikw+ybSYGLlMkBWNRVAqVIvASbyIg9sd0yqtXrZrwcUXQkDyyd2hMKsaBQlMbLWbA763dekFi9FKQaLtebeyjlrLdCBCgENDIbTdrEXMNi8xB2zCeM3eV6Utv1O+aOkjDZi0PaLmMdSZqum8zCRhCMC3TDQc+WW9KNuWizqcco+1OU94QvlH4DkD+olls8hlyQrFy0g0Iam5eqmmIBMoO4bmTB1mE6oKXJEeJ+dDEDyUQxR52WjgICCROf0NNtD9g7ARr96MM0NZelf0HtwAHCYrCyr14Z8hAbigeF+/+BKMJUcQRO6yjSJcHhZKiHRssd5dMOH1wLs/VGQ34/KTBcxJqj537MyeMmugAi81zuw4gcDPlzB48UrZhgA35lRtCFoZOgdCvnkHw//AXX7Ss5rh++dtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	crZ9uwOkxjg+C9hBCBVNu2tqbF1RiCxG3auHDgJj/FCTJVamPkVYr3UOmT02c6UJejIBXjjR4H5ss3/IWz6bzdyexZu/+5/b/AKWC9y9eF8iZAqkG6gyqIUgN4FjYwKl2F7sOiVkd461PQ5+U0PGODp2SQBKcSGVec/1bXPp79euyHiJv90c73MhOKjy2GOiARW+0UNi0hWDllMSZnadrgjYl002iI5IYzgGxP8/ZxaPO4cL1t/bviRbJEZBrCcG4WeuXpi3zoiPCmqlthKM6WwcM6oU5K4FAREkBQaYkm3lP7/LM7m54iGrksJSXSdQZEVsRzjt0l+1gZYe4wCTzBB7Vd3h4217uQAXdsMlc0irknRB9ySRNBzAjXNsEmB3kuMN6g/S22TFQV3I4K+gX9AK6x8T7iSNY6m9jg1u7zEQQan2wjhk2BmAXkn+HT2k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:17:59.0403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4682e0-ab9d-417b-c9c9-08df17438030
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614

The SVSM APIC emulation supports only a subset of the X2APIC MSRs.
Right now only basic APIC functionality related to interrupt delivery is
supported. Therefore, route the unsupported ones to the hypervisor's
X2APIC emulation.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/coco/sev/core.c            | 46 +++++++++++------------------
 arch/x86/include/asm/sev-common.h   |  1 +
 arch/x86/include/asm/sev.h          |  8 ++---
 arch/x86/kernel/apic/x2apic_savic.c |  8 ++---
 arch/x86/kernel/apic/x2apic_svsm.c  | 11 +++++--
 5 files changed, 35 insertions(+), 39 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index c54269366278..22956fab1581 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -972,7 +972,7 @@ int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd)
 	return 0;
 }
 
-u64 savic_ghcb_msr_read(u32 reg)
+static u64 __sev_apic_ghcb_msr_rw(u32 reg, u64 value, bool write)
 {
 	u64 msr = APIC_BASE_MSR + (reg >> 4);
 	struct pt_regs regs = { .cx = msr };
@@ -981,49 +981,37 @@ u64 savic_ghcb_msr_read(u32 reg)
 	enum es_result res;
 	struct ghcb *ghcb;
 
+	if (write) {
+		regs.ax = lower_32_bits(value);
+		regs.dx = upper_32_bits(value);
+	}
+
 	guard(irqsave)();
 
 	ghcb = __sev_get_ghcb(&state);
 	vc_ghcb_invalidate(ghcb);
 
-	res = __vc_handle_msr(ghcb, &ctxt, false);
+	res = __vc_handle_msr(ghcb, &ctxt, write);
 	if (res != ES_OK) {
-		pr_err("Secure AVIC MSR (0x%llx) read returned error (%d)\n", msr, res);
-		/* MSR read failures are treated as fatal errors */
-		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
+		pr_err("APIC MSR via GHCB (0x%llx) %s returned error (%d)\n", msr, write ? "write" : "read", res);
+		/* MSR read/write failures are treated as fatal errors */
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
 	}
 
 	__sev_put_ghcb(&state);
 
+	/* The return value will be ignored by the caller for a write */
 	return regs.ax | regs.dx << 32;
 }
 
-void savic_ghcb_msr_write(u32 reg, u64 value)
+u64 sev_apic_ghcb_msr_read(u32 reg)
 {
-	u64 msr = APIC_BASE_MSR + (reg >> 4);
-	struct pt_regs regs = {
-		.cx = msr,
-		.ax = lower_32_bits(value),
-		.dx = upper_32_bits(value)
-	};
-	struct es_em_ctxt ctxt = { .regs = &regs };
-	struct ghcb_state state;
-	enum es_result res;
-	struct ghcb *ghcb;
-
-	guard(irqsave)();
-
-	ghcb = __sev_get_ghcb(&state);
-	vc_ghcb_invalidate(ghcb);
-
-	res = __vc_handle_msr(ghcb, &ctxt, true);
-	if (res != ES_OK) {
-		pr_err("Secure AVIC MSR (0x%llx) write returned error (%d)\n", msr, res);
-		/* MSR writes should never fail. Any failure is fatal error for SNP guest */
-		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
-	}
+	return __sev_apic_ghcb_msr_rw(reg, 0, false);
+}
 
-	__sev_put_ghcb(&state);
+void sev_apic_ghcb_msr_write(u32 reg, u64 value)
+{
+	__sev_apic_ghcb_msr_rw(reg, value, true);
 }
 
 enum es_result savic_register_gpa(u64 gpa)
diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 095fbafe8a2c..585ddc44b6b4 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -210,6 +210,7 @@ struct snp_psc_desc {
 #define GHCB_TERM_SVSM_CA_REMAP_FAIL	11	/* SVSM is present but CA could not be remapped */
 #define GHCB_TERM_SAVIC_FAIL		12	/* Secure AVIC-specific failure */
 #define GHCB_TERM_ALT_INJ_FAIL		13	/* Alternate Injection-specific failure */
+#define GHCB_TERM_APIC_MSR_FAIL		14	/* APIC MSR failure */
 
 #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 557c4d1ef4be..3cb6c5d6a6e0 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -541,8 +541,8 @@ void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
 enum es_result savic_register_gpa(u64 gpa);
 enum es_result savic_unregister_gpa(u64 *gpa);
-u64 savic_ghcb_msr_read(u32 reg);
-void savic_ghcb_msr_write(u32 reg, u64 value);
+u64 sev_apic_ghcb_msr_read(u32 reg);
+void sev_apic_ghcb_msr_write(u32 reg, u64 value);
 
 static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
 {
@@ -650,8 +650,8 @@ static inline void __init snp_secure_tsc_init(void) { }
 static inline void sev_evict_cache(void *va, int npages) {}
 static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED; }
 static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
-static inline void savic_ghcb_msr_write(u32 reg, u64 value) { }
-static inline u64 savic_ghcb_msr_read(u32 reg) { return 0; }
+static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
+static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
 
 #endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
diff --git a/arch/x86/kernel/apic/x2apic_savic.c b/arch/x86/kernel/apic/x2apic_savic.c
index 4bc6d7e018a5..990e4a379e07 100644
--- a/arch/x86/kernel/apic/x2apic_savic.c
+++ b/arch/x86/kernel/apic/x2apic_savic.c
@@ -72,7 +72,7 @@ static u32 savic_read(u32 reg)
 	case APIC_LVT0:
 	case APIC_LVT1:
 	case APIC_LVTERR:
-		return savic_ghcb_msr_read(reg);
+		return sev_apic_ghcb_msr_read(reg);
 	case APIC_ID:
 	case APIC_LVR:
 	case APIC_TASKPRI:
@@ -193,7 +193,7 @@ static void savic_icr_write(u32 icr_low, u32 icr_high)
 
 	icr_data = ((u64)icr_high) << 32 | icr_low;
 	if (dsh != APIC_DEST_SELF)
-		savic_ghcb_msr_write(APIC_ICR, icr_data);
+		sev_apic_ghcb_msr_write(APIC_ICR, icr_data);
 	apic_set_reg64(this_cpu_ptr(savic_page), APIC_ICR, icr_data);
 }
 
@@ -210,7 +210,7 @@ static void savic_write(u32 reg, u32 data)
 	case APIC_LVTTHMR:
 	case APIC_LVTPC:
 	case APIC_LVTERR:
-		savic_ghcb_msr_write(reg, data);
+		sev_apic_ghcb_msr_write(reg, data);
 		break;
 	case APIC_TASKPRI:
 	case APIC_EOI:
@@ -316,7 +316,7 @@ static void savic_eoi(void)
 		 * interrupts. Return to the guest from GHCB protocol event takes
 		 * care of re-evaluating interrupt state.
 		 */
-		savic_ghcb_msr_write(APIC_EOI, 0);
+		sev_apic_ghcb_msr_write(APIC_EOI, 0);
 	} else {
 		/*
 		 * Hardware clears APIC_ISR and re-evaluates the interrupt state
diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
index d72bc7962a66..9ab49d360219 100644
--- a/arch/x86/kernel/apic/x2apic_svsm.c
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -81,8 +81,15 @@ static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
 		}
 		break;
 	default:
-		pr_err("%s 0x%x not supported\n", call_reg_str, reg);
-		return 0;
+		if (write) {
+			/*
+			 * Even if this will end up returning call.rdx_out,
+			 * that is being ignored by the caller for a write.
+			 */
+			sev_apic_ghcb_msr_write(reg, v);
+		} else {
+			return sev_apic_ghcb_msr_read(reg);
+		}
 	}
 
 	return call.rdx_out;
-- 
2.43.0


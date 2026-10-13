Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D6470421
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913919; cv=fail; b=DDQlazX1P0v7Jx/zRh/zeMP2YqFOId/e7gOl7acsafhz8QyVykHorC3njeQ4uNe2OltgsP4MWTaAnEn8ZhDF2yCkSMtZ4saInLHM1aobB70E6nIJPK+6tSpGZXm37Vx0YeqD4R+2uFpHBnFsZevsNo/sNQxQYeYEVtCgVJJIXBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913919; c=relaxed/simple;
	bh=6/qNzchy1o8RHgcUPpQBANm7ay2MJ77EAZ8GzCoVUrw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1Gp4dLauzFaq4XkVducd8dY5eykubgQ7aAxp8j/UaFRE9k5TCe0UrCHEmhx8bbSS8UBgRRF3P8CTMuZY8v54UmaCGt5yMudPWvmNKaeXWAWg+cEiaxSCpbKJfPCbqp+mbSJF5Ft0NbWi8T+ciROIi/ApynRInteoxoWmiur2qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4laUUDn6; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4laUUDn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrrrAtirrZMrsIoGFrKxawJe9HnX/guEGdavnMknhih4OUNgOAhZN4QlSBcNWPtSC7Nhd5kW5G4hYCFoD5DrPhyodtVR4a+HJYmlh927/PezqePK+DLqUuK+sRSq8ai1ZzRww2QkZeYbtD03unBtEGyioiyTdcyMRu0RD1vvdjeceXlgrMDl0OW/gBZ1C+g41I+R7bNoPm2OyOVJKbo4dRk1y3VUSNUFRF0NkUwXva8M8m9yl/VuO5TVeLVpdXPN4wtyzZczXt3JC0plVI4lN6zffAz4TinYo5cjmK1fVJqC8AVnLRLbQHSvpGZiSFl6xC+ZwNxt4UR8uH/+2qBzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fCDF2RBHZGeIt5PL9YAdxU0RXBOFKIePMFGRGXlo+M=;
 b=YDHPmOHBAUq24dgE+P09JmHl8ym7g567z/fLmnHyaEUC16uegRinmB8C9KtFwboILNLx7lkBCGKfJBWumz8aKbTawWP9t2/wMXxSCPZQJPa+s8IIWVaJ3q3BjC+WmgWQ5o+TwFhutq0KztchnfjucOi3d11pMs1Z40wAJu4dA6qFb21utXccYKla2QUmfR/S9R5nJohW3ac00P1G45wORUGmwyJ8ad74bpSc3IeHB1fHa56Cj4luH1JAtItJlA8W8ZeiDxKoNNxmGX61IGQIVzvt9193c1Se0s8dOj/mmRLZeRBC3jOBHWWg+d6B/6l7G7UJ14pGkqmZUybJkqP+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fCDF2RBHZGeIt5PL9YAdxU0RXBOFKIePMFGRGXlo+M=;
 b=4laUUDn6tS3j1Ycgvde7ELtKhm4xUW7HrswZ+d6z+eK63WL4WSexaucQDnzj1/G2IMx0eo/pc2pdhnlNJa/Nogol/PG0N+Awsn0PlROzFRlTULDkPHdWTHA2Q5TE87fRN81uqXDDr+OceovZEDEFELW0ulyZNsxseyI10NpMiWo=
Received: from PH0PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:e::7) by
 DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Tue, 13 Oct 2026 17:51:47 +0000
Received: from CY6PEPF0000004D.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::22) by PH0PR07CA0032.outlook.office365.com
 (2603:10b6:510:e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 17:51:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004D.mail.protection.outlook.com (10.167.247.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:51:46 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:51:40 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 3/7] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Tue, 13 Oct 2026 17:50:50 +0000
Message-ID: <2646bd1474e25dcb837fef5a3c24269664432a8a.1791912902.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791912902.git.huibo.wang@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004D:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 86408cac-0605-4439-45f3-08df2952a685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|11063799006|56012099006|261009223027099003|22082099003|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	WcBTzhcdoB7qlbaf/1TwdJDutGJv1XwX2cODLyKuJS0nKbaDiRg6AfBpnDi9m6ZrHFhvVqPOgJZ1f9qwFy65qmRzcevfjHpYsed0Du7Renth6TyhILZkGevAv8YAGImnyq0V8TKzmZAhq6subTYx3eKsVdIEczyzT5mFfAQeh+A/CcgBYc/K0gorSBLVuvzr2J67HOFdGoSpeKb2JG1UFBHXmw546vM44heGI9U5xXvz8u3d5UhoMwqp1lPGqhEbsEJVM7fjjkmXuhec6FdOWDOE2K1uKCwaMNdGiJK/nRtwkP/EILiCpBcfKD6U0r6E9I84qQBWoQX6RyMMYROmkjmB+nt5czFelNI3Qu4zdKDgh4taa+JY+/p4QlSc00gIZ6lBxF54Ah591XARmU2f5/1czhlgYUM2hbQg767JI7DAYFypXu2Oe8QW1/ZycmXtLmIvyg7WrSJ5a4xGsgcwO+dQsjjwpXzNdTibafyNAoIkuBz/dW87aLD441KVhs+sLVgDPgMT1YuRYAzLUxzJ9A8raDDuVl97ug7y9JgvN7TuC1IUZdX/NB2l6ke5BR8sG8VNlUnI9nDoWyS3XiSgAdAxzOmWXnOzcXQx6VSPfg7jibCHP3pXnx6LarCoK8YsuA+d6Y86LL0oIfyIC1QWBhsy4U/A4Rp6UyzvPJ1WO6d8IvgD2rHGUUQwt3C2HbCJgHbCl5poZAk0ZQoiqKZrvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PjJ/YUVJYOl/nGyLmOqROGyzKbYlUDEo8A7tQzvTeiKbaNiU5v9U/f/Yn6DVkijS2GvMt5Sdl3864UQn3mn4vBJ/JRMw62J6FPbMaG8zgnCkRS9cA74ue2dJ6u3N40iJr/L6FV18cEP1kSYMHMpcvAnV0+BMi+cIsqMRoXOXuQZUkacXffgniQ8z8jYg6PkdNsrfYiY70FMbsFNw/Trw5rGOLqrSbOsFS4qbISLS1L6XewxlekcPO/fbSN/iIj2SwQNvzk4jm7M1pSNtAUd5zbANip99wGpMhjnnK+pq2upZ4FF3by+vuL4pRfZYzroJQq9lJRDTXSNQ/GGjpv2Zl+JzcJZPA7Q0Qa7V0dUZopT91S+LUMug0n1q/VVdbSEkI53V714DzrCstt/cWATVjtINUu22ozylaEvERTQvLsmQQhMCdoIWGlsLgltvCRef
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:46.6808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86408cac-0605-4439-45f3-08df2952a685
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

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
index 900a7ff8b639..99df8d7f3e98 100644
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
index ea248d9e1c49..93161b663d9b 100644
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
index 6edfbcca2958..0a89c5b357f0 100644
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


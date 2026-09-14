Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C62D46CE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347526; cv=fail; b=Iu02ZkkziDmCvPBd3lqZO/Tqo+p5kekxz84o9WZnbMraZqX9U1ocB3qWUfgl6IuOUGTG5EZ3/u5UTIIsowHkNZknj1ducahv722W3XbSCuTTFPWrfTggupwqCP01q1seBY24prdtwzzQb3EHnZfeNjbfMlLdgoffX5zRk7x67Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347526; c=relaxed/simple;
	bh=ZKJKM1GnPJYuonmX/ZloPqAO4ckum6u2L8uUPUsMCVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SbBM+WVoY1lC8pOqNwbQZm81moHF8JB4EBR2CCUhkqxVTsNWefLSiHkjM+YvuLyNmMBm8cw05rIjVrX/GKiJIcTTFx37Dhd9rruWPl11YqBewoyCp9K8Lqfoq6tAvKsNyCy7i7BeJB26Aj2dmJhbFiv/zi5eHdflEU5SQLixmyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cZk6bV/R; arc=fail smtp.client-ip=52.101.48.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cZk6bV/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0NcXLDpEp9sPSk/ceUr5O9S+0s8uz1IPnM5zLKS00CSmuN4Xpz1BsclMHHzOwf+H18H9ZiIsjal3mJeA9h31YH3Oq00ez4vu/YshbCq9rKkfi7wm/RCZviU9ZBEI7g82SZKUgLr8gYNaLB9q93HQsLBeZ7ehPYzaGu1LzE7inrOfPU+Cg/M2Dg8RrY7h4iZBlbdgGdJqr/UU5gILM4qaDNfTEsthfTWHLNlD2nG9Qsf1w7FNUDYUHymgZ3CElHffEx/IokCeHuWs54bLGPoribxdrmgkkJQ8GoJbHnpD9toqoU/MBUZJIwU0OWkyYf2a9UyYXf+S4F6n6aNiEaD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe9UZ+O2CyUw4JuZDq8CKzcjqMNGc997tn/tDSbys3k=;
 b=gXm56HzPSttmcf8ssqS/7a7nczjs+0vRek2cooNe+CYzdfYmlEgkIL+VNih9W1RRXErTHcTZKYLng7JIOnMQhTjJceL5+xADr8aU7RnlNpBNa58+fBBSRF6Fw8GVxdXekeIPsbBKOBJSJit8S8bwEgRtfUHFN+Y+spquFemEmoxxWHVWZSwCWS1eN+xLA/FWJqLtTfo8vkAGk8EaWVyzRKlHvBpP8mtSj1wisWmGVgobtW6D6oBFArQ2xOAyFzxlpueVy+GFGsLZeotaMCXS9+tGFYbjGaRcAjg8sGDeZF24mJi5/fRRhGSXCvC/HnnZAWCIz6mte7NLqb0GHutCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe9UZ+O2CyUw4JuZDq8CKzcjqMNGc997tn/tDSbys3k=;
 b=cZk6bV/RZEPsBG2u5olHwEF8lZVaJ8quhahThc/xyPYYp/FZKod4NcGnC8Mfso/0of5Pz0F4SN2nng87e8xQ70yk3YyzfKfyeIy15nIzf8MN9lvWEJwMG4uVvUCqGDcHG8io135Lk3xxt2KW/LDQhRCU9vvcbvTjlcjGMDBotvI=
Received: from PH7P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::18)
 by DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:58:39 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:510:33c:cafe::2a) by PH7P221CA0039.outlook.office365.com
 (2603:10b6:510:33c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Mon, 14
 Sep 2026 00:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:58:39 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:58:36 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 4/8] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Mon, 14 Sep 2026 00:57:20 +0000
Message-ID: <aca4911d9e3accae292e221d4244000130529d0e.1789345277.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789345277.git.huibo.wang@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: bc23cc8c-1d21-4471-01de-08df11fb506c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IUgakOipmEpsny6nbqMUpzo+5aDIOTXjMFP+uiReUGs+SY1I/Zgm+es4NLDM/5Ky1Tp8MyzNIcFTLocTHzdlc4b4X4zUGsP0DZk4HO5wCxUIW23oMmKaLG/8Yhcir3ByExdWTIXgefEELCh5qXhJJXkFD5gYhhwzHyh2NZoAjTPMska3Rnyi6T7U02GhCwFVDn/ApAPTTeFoAs4eyBwzyWMN6Z7dts5eP1xkktINNBbEKFXg4qWuARKeFoLbr9S/MsJdwNVZHN0Vt6VrKZUUkTpF/NISt3tPHFTEYP6pdFR7Uu+llr+oEoESvmzf88s6eA450eLtCfFJWa4R8uC8oAmgYrO5r05aee1X0bCnEfJSjpl3/UQIMvqMKALDY/damujlFNRAlrlMnjw/Z4MUuTRpOgRsWpZiFlvWblBPQio+iVs8zNUUWKwoz4pLl1JkyU6lbCbUPFDs/aDT683qT3QEkDcsNh/h6eNkcfkqKsRj1t1y0Oz2Y3kOFIwdCAX5v2Rqq1QtjNRdCUG8kVYyKi1vGWN3CpS5jNQ7oJOWdPxqvUTLYi2HE10FtxuVZWK9sQzANjH7FZJdEKnlwyIeS4udD29ayJ6W73JBYWGyO8hBNgQWL5zG7IlQnnZin2/rrZgSExbT2XN2fAlEgSBLPnY8tWdpqL7dhvTTagZlsSzybKNiDDI8mOwe4O8yKZEm9n8L3oEvEfoOuorKUkYEUA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v8sX1zdlFL6+SgBXM+ulLp/YRfBD7rGW9rK/jXTbqT1jxwg4Y4zOKWBZ6EdxIePSORolve28nxeZhm9M2LqryAZC6mapT0o1tTFirgwh9h6S6lhnCffVuYdPPRymootPSnN71fWkwZGeC3w85oc1tNtveQTEdj+NxmzU8Ip8rS6SxajrlmcgRRf0bCrcamJkH5YsAvuJz9OAcj1m/y62OjqmR63UBrMRrOAYg0P7aLkXJhSvjG26mHgsHqwViU/CtJVNRK41+KvnD3ugD3p0I6IuwuPJb7NOovSUeW/a41P2z5Qf6H4xV8G99a8wxiMSsDl9Tb700/zdyBW7TqPqc1c1m0V4Y+XiQ6bBQSwg0Lufmpcwlr1gif5o2EXvSD02Ha8+lFpMTF1jEMd8/kD/YOLxo4/j6qoXHB2iNU1dLDYm2FnathXJ+KN6qZtbupCo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:58:39.2592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc23cc8c-1d21-4471-01de-08df11fb506c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041

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


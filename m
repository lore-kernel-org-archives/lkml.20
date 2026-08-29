Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190632692C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974857; cv=fail; b=rVeZrGvU9lCIxHYP2XXCKYHjSCxnWyT8lRwvslj3KNxN9EtFgyBZ1YIBCdbL21HVv3PlVU+k/DlhwRKjoLbrN6IyvFo+utrFlJzzS+OcewslDkuylcLRzN/boZ3Qp1eaY9FqYzGZe2g8kkMjGRV90L5BDLcpQrU9JZCKofoYuto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974857; c=relaxed/simple;
	bh=xo9wAapvqG0jwmmN8DOlfilmj0fbD4+SZJkBbpYaSII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8meZZIQ/f1SuPUBt4dj9XQ7eiH+HknbeeYZyil6qKuIXvLJMWFuUp6iQyob8B0aAEUij8k70JVcKs2mk5TsIl2dK8Iq8fyBP3c2Ew6ahs+QvUsaqmPNrRA3wBbNSfUwZJSvZ/rQ3gf62MgnbOTt9wf/qpSTDLg9xIQ12Eb6Ud8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JotqFlR1; arc=fail smtp.client-ip=52.101.193.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JotqFlR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSPxzN2JISnBjZobxRFSZqkheQf6SgINKS2sjOwHAegkPGRNQ6FOrbOrfi4pI7l6jt3JRx1hY4TUejdtUEdm/Q1mCBOP0+oTslmvsDMubqvdPCu/9Lz1FO7jT4yzQ0Rbbi6i/UkcfIIUe7KN7K9HBMqgeEzi9Qa164JPf2kPb8tldovQ85kpxPARqMbCD3JiMYx5awbJ31e//trKwgssuiYMx8nAcQE90sBvTgE+g06Ai+xFsF2wy7TZ8ORRXKXY+pUFkZjNA7tofloGX8i1B+QOx623KC36wluykuGT9eetEE7QWo09Ge5+9+ZMCF3VWVuYLiH0NeV7HMSqRZRkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux7qpZmh8coidlETqwbSKRmY2aooj/mSP++SFtRkJ6c=;
 b=YGoJz6Gbhoo3fTO+PxOGsKWwOuHFCQJ46JkfeCBpqDrGUT7JVvsv5SI7xTx0hx+gE7Bup4t+r2n7tQFEAPjSYAvcMzdPrcCUii69EqZisbneP31pJL329QDurmycLAdFxC9mf9bOdEVWW9kPWeoEKIfYSEYlmW0VxyIlUKnyOMvqiWngt5M6ycc9SjKQwZKTsEmh1e4UhKuJVQINOQC5uFb9RCmeqgK4C1iUysBH0Cu4kM9B36PJkpRNBz4swWe+WNm4LAhWsQlIGMtKS08P49wcsrLqPiQz25tvgMUs8G6v5ElC4RpcG3dHzhJUWx6MoZzoDx9VIcb0a8iwHj2zDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux7qpZmh8coidlETqwbSKRmY2aooj/mSP++SFtRkJ6c=;
 b=JotqFlR1AN3BhkdfF6NHZW+bTfupbeepTf3P7mtUFvbtggUK0Dx48qm+0ItdK+x9rH/6tO68poLYlVYyjR7X/2YUvOmBAYJ9s1/zFomJkwPu2eycyHKsbfmISqN6RLduDG4xKbXY/HvWxKMAw+twZNbQyppBCU88pD4ew0R8ptE=
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:40:51 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::59) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:40:51 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:40:50 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 4/8] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Sat, 29 Aug 2026 03:39:42 +0000
Message-ID: <836a4e242279aacaa58ede597eeaf2ac6074f562.1787973545.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787973545.git.huibo.wang@amd.com>
References: <cover.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0fe551-6f8a-45dc-1132-08df057f5261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|22082099003|11063799006|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	kc9C+yiUey/6yiohHLkS0lBeWBG+BSYKXnAgx4jPcNerLQ7QEpSQ0Zi5/weGhz9zIberWNf+xlbXOievD8UGU+k12oU1DH51bl2fRB4nO2UkqZIcuIPFOC73N/VhmlEm9xfNso/hDuy9Tmq6uILHJtVRWqW0cUqXgQQItjBPQbvmO3tP+0TYaen5pCNXHS5Mx0YbERWUNzgadEklPZJHjjvCcRkGpQxqkxtzfyk1+iwraHnzGYdivvAnEckq0jhA8Y/ZI9xg/9mcoyHa1LsGZr5iWbjlq0JT18jeHmCit9WJShSq4pXJn6RLt7oS4klRMi1MZyw7TEnh5Gt52eua3cWzshxbUWlqZVp+sdS9/G9352b13aT/1BZi4VNwjETX4E+8NbLlUJvvRc9iGsiuppAE8+qo36ZJI7FpBFYcAF+shoHTKZSuaPhfCdnfekoF8qfefhUsYmc+MpEW0Cx0Kc0h3WwtAuKohOIeCRvaNE8zZBrY9wPtThyJXSk7JS8y51j0vNTGTjp0+H0UPvmGzhY/f2uxwHqYNUjX5Hzy4RqaUMcs7E6EytJxBxP/oHdWYPeFE+izUFT7BTZEDg6H2sdbiyTlknhziDZu/QMcZalYg78RgDduvmXpqA5ekGSZxUNkk8Tgyqwq5gA25qciNslvHTsDK98DcSaHo4B5kPB8H2wrvCNRm0zgzO7on2Jq7EI0c20jeTRqsP3SleB9bQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(11063799006)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jKMqJzr3RYJ/0EElkf1hKZ4BDrwWUtXw7dr2ie8gpv8nTd3nLNLWax7/UTqNwbMQiqU0lfr3/va2VQMmXpRCaKFZe4AS/Ei86yDcpXCdRc9kAb/ICNKqlNIDcgSToIt2gixMJOfp4lbqWCqEs4qX5w9fhdA9m338K1e5Brabnw/UXPk2Xfo2oEfLvjxC9dVl2VRqIIffP8MzlODFMU4OPUnbpVnenpNYgdnhuseKpIkRCun+csUwoyaUBomll38wbkKhmehSPadtX3Jkrti8muRQVZ9VRqKoUTpyebI/MNkBozK338AcVvUdrm8FNBp+KVDXRZ2ts9rrQZar/SsGMobVQIUADWyDq7CsZyoZhzDMmyEKtYPuYoof39bQ0rb4LxHuFnLsrvgZFHT5aLPkBHiARwLDCNRkELD/SEnS9L7dDaI6qTdgqG47PPClfpd0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:40:51.0561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0fe551-6f8a-45dc-1132-08df057f5261
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714

The SVSM APIC emulation supports only a subset of the X2APIC MSRs.
Right now only basic APIC functionality related to interrupt delivery is
supported. Therefore, route the unsupported ones to the hypervisor's
X2APIC emulation.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/coco/sev/core.c            | 12 ++++++------
 arch/x86/include/asm/sev-common.h   |  1 +
 arch/x86/include/asm/sev.h          |  8 ++++----
 arch/x86/kernel/apic/x2apic_savic.c |  8 ++++----
 arch/x86/kernel/apic/x2apic_svsm.c  |  9 ++++++---
 5 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index c54269366278..ec8fc02bd636 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -972,7 +972,7 @@ int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd)
 	return 0;
 }
 
-u64 savic_ghcb_msr_read(u32 reg)
+u64 sev_apic_ghcb_msr_read(u32 reg)
 {
 	u64 msr = APIC_BASE_MSR + (reg >> 4);
 	struct pt_regs regs = { .cx = msr };
@@ -988,9 +988,9 @@ u64 savic_ghcb_msr_read(u32 reg)
 
 	res = __vc_handle_msr(ghcb, &ctxt, false);
 	if (res != ES_OK) {
-		pr_err("Secure AVIC MSR (0x%llx) read returned error (%d)\n", msr, res);
+		pr_err("APIC MSR via GHCB (0x%llx) read returned error (%d)\n", msr, res);
 		/* MSR read failures are treated as fatal errors */
-		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
 	}
 
 	__sev_put_ghcb(&state);
@@ -998,7 +998,7 @@ u64 savic_ghcb_msr_read(u32 reg)
 	return regs.ax | regs.dx << 32;
 }
 
-void savic_ghcb_msr_write(u32 reg, u64 value)
+void sev_apic_ghcb_msr_write(u32 reg, u64 value)
 {
 	u64 msr = APIC_BASE_MSR + (reg >> 4);
 	struct pt_regs regs = {
@@ -1018,9 +1018,9 @@ void savic_ghcb_msr_write(u32 reg, u64 value)
 
 	res = __vc_handle_msr(ghcb, &ctxt, true);
 	if (res != ES_OK) {
-		pr_err("Secure AVIC MSR (0x%llx) write returned error (%d)\n", msr, res);
+		pr_err("APIC MSR via GHCB (0x%llx) write returned error (%d)\n", msr, res);
 		/* MSR writes should never fail. Any failure is fatal error for SNP guest */
-		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
 	}
 
 	__sev_put_ghcb(&state);
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
index b553bfde4b85..1a1aefc26726 100644
--- a/arch/x86/kernel/apic/x2apic_svsm.c
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -69,14 +69,17 @@ static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
 		call.rdx = v;
 
 		ret = svsm_perform_call_protocol(&call);
-		if (ret) {
+		if (ret) { 
 			pr_err("%s: 0x%x, error: %d\n", call_reg_str, reg, ret);
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
 		}
 		break;
 	default:
-		pr_err("%s 0x%x not supported\n", call_reg_str, reg);
-		return 0;
+		if (write) {
+			sev_apic_ghcb_msr_write(reg, v);
+		} else {
+			return sev_apic_ghcb_msr_read(reg);
+		}
 	}
 
 	return call.rdx_out;
-- 
2.43.0


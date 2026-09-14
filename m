Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5492BDC13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347515; cv=fail; b=diIrEG8+Mac9YB26Jd+Z8mgIgXKwGwQcgXVHMqR8C2HIIJrpTGLCtQ+0oeeLK03yHy4VryCemkuInVQmJBgoUa7K7vzQ9fXHjhyzkJL2PdFCS292gSoA2IuQ5s1GgE2tiLITdpJGNFpOjiAvx8Kgqbv5BbCl4LLh1+BESPzRQxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347515; c=relaxed/simple;
	bh=fn/kUNnmjN8qIz80EIBuve2hYiOxonhtEqm/bKtT5m0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pekpRrpk6g+7s5xhmpoNaI46uX5p1v1ObRRfwxcJiWN56Cp3j6ZbU7foToZrCTbEG46EfbaJSirR5RPU4pe+CrAx8j01lPUEwHuoJ2LOHbKLuLzb3NixD87w+k/Hggn0fAuInRGWFrJ4t3Ef6/iDF8rU8IgYOAylN3e/ZsGr6eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e3vDqsbD; arc=fail smtp.client-ip=52.101.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e3vDqsbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymvyO4+c5+oKLKCvoqaAt8i9IVsFoT4Ffe5FOEWHu8zOVz71ggPLsNNse6t3+GJB3Kc9ANegS3Tn3qE4bT1r+XvvSrXc1IQT84CL0k5OYs+B8D+6TUmwhc2VSojKVNILUtZl9/C3ItZ5LQIbnWY/xjlQU+7tP0SvUuT1RUzej/luvNrHILXU4dE8WJ4EQApSSunrtRfxwR6Y1jfOKGiH+Hk0lT29rTAdPUfeO73forGxXh6zTsr4MCASOI8eSheWIanoffob9S8shLq4QWEIzCjRHpsW/HjfdY8uYZ8Iug0iGTJZGHSMpDf5RBvK5JqoGce00/4QwswB8gNLiobVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP62/6xKTEUU+x9ckrsir0if25ODKxvtTU0wV+EnzSQ=;
 b=bFoC2JOWNFvfin4PT8hkeQEtVmHN7HX1zzyQQL8n1l3pXnvLRYcxP5xx65fgUOzKZKkwqQivtEL6E1YnKu3nYeEn8teYs5UMZxyD1ySweSY7r1Zzvm74pC571yFCj5BGvoMs8AqbZDvgdqq8DcrLyruJZ0PJpt3Tkezri9MavSyqTm03d05bRZ9YcQBDuOD+sZskGA+X4bPGrCZH+YaKQVotarj3+ZJk1Onw+f5Bvr4CJIfEKKOAZre+15eVB+kfffZOrLZ0FtpVbwasF3SMt+NVxQxJpdRmDo579brYr9HSbZYJJakcFxz8HYV6/cYrcsno0Y8z2hP6o8tEoP7Ilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP62/6xKTEUU+x9ckrsir0if25ODKxvtTU0wV+EnzSQ=;
 b=e3vDqsbDVgZ6DtUk2OQq+jt/K+5/+K1+p+EBaZ6ZBRcP4P0EbjeKapgi34nl3R1tdyQEgZdS6RqHYTqVev0JD2btvqK/4qltMiLrHle2hlZTEOW77nIYRGkTI61TmkD3PvfEdJNTA1xM3RAk030g/JLJismq8NRduYMKw52D890=
Received: from PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::13)
 by LY0PR12MB120611.namprd12.prod.outlook.com (2603:10b6:408:3b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:58:29 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:34a:cafe::54) by PH5P220CA0010.outlook.office365.com
 (2603:10b6:510:34a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 00:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:58:28 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:58:25 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 3/8] x86/apic: Add an SVSM APIC driver
Date: Mon, 14 Sep 2026 00:57:19 +0000
Message-ID: <7a2082b2fc63494b2e3e3869451960525ea2e2ae.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|LY0PR12MB120611:EE_
X-MS-Office365-Filtering-Correlation-Id: e519c646-e89f-4171-00da-08df11fb4a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	u97S8CQ2cYYjmKgz0b/Q5qMY8fak31GGEjymje1Pa0DNf6pWIMgUM50YYzKhXIWslLCTtGu1NLJ9V6tVPk/PCdEjX/n0AO6v6yJnx+mPkSAIzVpQfdeyK6u8ivB2+M8XPfCU+ZmeT4mZnCWMAjpSbknu0TFlvgoYUBP3AoZcLDkUub9QdIZD2ntlWASQKMM3ysir+m5Xt9hpxZJD8lBYyaK/7SZiuzO30/FfOmS1yMpMSXPeJcdqhqgvuF7S98ug8LYepBYvM7w9i7+zOR0bBb/yalQ+8IbQCxZGVOxOlA0ZuXcOsmPDDi4rXAOnvfpj7PbBWX4NdkKNz7lzNWiglhk6VA2JNvJCztwSwGS3JQsv//rjW19OanyhBA4laDF4F46cIu4MwfegOYNIAmkpg7rJAy4dfd1ZQ2TMqANLSwVX7MnWkH1FqR95F0sMkckU/SkMpjrvq/Wb4La5Mw003HqMOlVBzN/KclgWHorZIt3eyBpicYnv3LJv9ttPuCuNlmss2mgOqudGkKcN4IvUnKZsuTXCHne6qOiMjeYxl1X6Di5njarJx5GlLPRAg5oZMsqiss5+duwFaJ22GS9bH2MTesReW22UJfI5MHqnbnakQM82q8jEeDDYWi0iVPkDE8jYvcBUTF2y1D6U5f7AlEAdL7H97YrNtvmj2tHkksxcwAYs5YXPnMoL+Ci7eN8ZkIkj8anKUnmn+BByxU9dcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JUzIlXZPrZAPpknADt5IF3wrIMNsHgV5ui9DPaoSD4ATxOPSZ9k+wGmHC0BQdiEMSzi9FGE5RyfjdHY8z1ECaMteA3tyIXlRtwH8lNVFHgng+un/NXuY1xAiPZr0J1U/r8WfSdgPEk+jxE/Ivd+WKgFhGhrFFtzkiSX4cuONEGjj9uC06VdJP7uoK/Su8U6tFLoCtVB1BwJMKAdOD8azi+MDAukkngI3XZX9AR+rdz5i3a/tyAchqWIcXe9hFrrulXCn5ze4o5hD2ro848pPJtBXK0dqQFlixA3hWmVgg3527Mqa6FmskvkTL6UsnHS69lKjtodS3JSp+o8sPoe3W6XEONvPmRuaYgujcrh4u+Z8hH+Ic11Ag29D/dSKy82FY0Ml9AUakA3tmpdhGO9VqH9SPVBNAaxZl2rRnm0moypTcMKjHaYawG1UXYN1Hlpn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:58:28.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e519c646-e89f-4171-00da-08df11fb4a00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB120611

Alternate Injection replaces hypervisor-based interrupt queuing and
event injection, requiring guest-controlled queuing and injection. In
order to perform this guest-controlled queuing and injection, an SVSM
is used to update the guest VMSA to perform the required actions.

The guest uses the SVSM APIC protocol to communicate with the SVSM to
perform selected APIC related operations instead of using standard APIC
MSR access.

Add such a SVSM APIC driver (which implements a subset of an X2APIC),
for the APIC emulation supported by the SVSM.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/include/asm/sev-common.h  |   1 +
 arch/x86/include/asm/sev.h         |   9 ++
 arch/x86/kernel/apic/Makefile      |   1 +
 arch/x86/kernel/apic/x2apic_svsm.c | 236 +++++++++++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 01a6e4dbe423..095fbafe8a2c 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -209,6 +209,7 @@ struct snp_psc_desc {
 #define GHCB_TERM_SECURE_TSC		10	/* Secure TSC initialization failed */
 #define GHCB_TERM_SVSM_CA_REMAP_FAIL	11	/* SVSM is present but CA could not be remapped */
 #define GHCB_TERM_SAVIC_FAIL		12	/* Secure AVIC-specific failure */
+#define GHCB_TERM_ALT_INJ_FAIL		13	/* Alternate Injection-specific failure */
 
 #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 9e7a077c445d..557c4d1ef4be 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -435,6 +435,13 @@ struct svsm_call {
 #define SVSM_VTPM_QUERY			0
 #define SVSM_VTPM_CMD			1
 
+#define SVSM_APIC_CALL(x)		((3ULL << 32) | (x))
+#define SVSM_APIC_QUERY_FEATURES	0
+#define SVSM_APIC_CONFIG_EMULATION	1
+#define SVSM_APIC_READ_REGISTER		2
+#define SVSM_APIC_WRITE_REGISTER	3
+#define SVSM_APIC_CONFIG_VECTOR		4
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 
 extern u8 snp_vmpl;
@@ -528,6 +535,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
 int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req);
 
 int snp_svsm_vtpm_send_command(u8 *buffer);
+int svsm_perform_call_protocol(struct svsm_call *call);
 
 void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
@@ -636,6 +644,7 @@ static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
 static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
 					 struct snp_guest_req *req) { return -ENODEV; }
 static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
+static inline int svsm_perform_call_protocol(struct svsm_call *call) { return -ENODEV; }
 static inline void __init snp_secure_tsc_prepare(void) { }
 static inline void __init snp_secure_tsc_init(void) { }
 static inline void sev_evict_cache(void *va, int npages) {}
diff --git a/arch/x86/kernel/apic/Makefile b/arch/x86/kernel/apic/Makefile
index 581db89477f9..fef51024025b 100644
--- a/arch/x86/kernel/apic/Makefile
+++ b/arch/x86/kernel/apic/Makefile
@@ -19,6 +19,7 @@ ifeq ($(CONFIG_X86_64),y)
 obj-$(CONFIG_X86_NUMACHIP)	+= apic_numachip.o
 obj-$(CONFIG_X86_UV)		+= x2apic_uv_x.o
 obj-$(CONFIG_AMD_SECURE_AVIC)	+= x2apic_savic.o
+obj-$(CONFIG_AMD_ALTERNATE_INJ)	+= x2apic_svsm.o
 obj-$(CONFIG_X86_X2APIC)	+= x2apic_phys.o
 obj-$(CONFIG_X86_X2APIC)	+= x2apic_cluster.o
 obj-y				+= apic_flat_64.o
diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
new file mode 100644
index 000000000000..d72bc7962a66
--- /dev/null
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD Alternate Injection Support (SEV-SNP Guests)
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * Author: Melody Wang <huibo.wang@amd.com>
+ */
+
+#include <linux/cpumask.h>
+#include <linux/cc_platform.h>
+
+#include <asm/apic.h>
+#include <asm/sev.h>
+
+#include "local.h"
+
+static int svsm_apic_probe(void)
+{
+	if (!cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION)) {
+		return 0;
+	} else {
+		if (!snp_vmpl) {
+			pr_err("Alternate Injection in VMPL0 impossible. Terminating.\n");
+			goto terminate;
+		}
+	}
+
+	if (!x2apic_mode) {
+		pr_err("Alternate Injection in non x2APIC mode impossible. Terminating.\n");
+		goto terminate;
+	}
+
+	pr_info("Alternate Injection SVSM APIC enabled\n");
+
+	return 1;
+
+terminate:
+	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	return -EINVAL;
+
+}
+
+static int svsm_acpi_madt_oem_check(char *oem_id, char *oem_table_id)
+{
+	return x2apic_enabled() && cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION) && snp_vmpl;
+}
+
+static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
+{
+	u32 msr = APIC_BASE_MSR + (reg >> 4);
+	struct svsm_call call = {};
+	const char *call_reg_str;
+	unsigned int call_reg;
+	int ret;
+
+	call_reg = write ? SVSM_APIC_WRITE_REGISTER
+			 : SVSM_APIC_READ_REGISTER;
+
+	call_reg_str = write ? "SVSM_APIC_WRITE_REGISTER"
+			     : "SVSM_APIC_READ_REGISTER";
+
+	switch (reg) {
+	case APIC_ID:
+	case APIC_TASKPRI:
+	case APIC_PROCPRI:
+	case APIC_EOI:
+	case APIC_ISR ... APIC_ISR + 0x70:
+	case APIC_TMR ... APIC_TMR + 0x70:
+	case APIC_IRR ... APIC_IRR + 0x70:
+	case APIC_ICR:
+	case APIC_SELF_IPI:
+		call.rax = SVSM_APIC_CALL(call_reg);
+		call.rcx = msr;
+		call.rdx = v;
+
+		ret = svsm_perform_call_protocol(&call);
+		if (ret) {
+			pr_err("%s: 0x%x, error: %d\n", call_reg_str, reg, ret);
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+		}
+		break;
+	default:
+		pr_err("%s 0x%x not supported\n", call_reg_str, reg);
+		return 0;
+	}
+
+	return call.rdx_out;
+}
+
+static void svsm_apic_msr_write(u32 reg, u32 v)
+{
+	__svsm_apic_msr_rw(reg, v, true);
+}
+
+
+static u32 svsm_apic_msr_read(u32 reg)
+{
+	return __svsm_apic_msr_rw(reg, 0, false);
+}
+
+static inline void svsm_apic_msr_eoi(void)
+{
+	svsm_apic_msr_write(APIC_EOI, APIC_EOI_ACK);
+}
+
+static inline u64 svsm_apic_icr_read(void)
+{
+	struct svsm_call call = {};
+	u32 reg;
+	int ret;
+
+	reg = APIC_ICR;
+
+	call.rax = SVSM_APIC_CALL(SVSM_APIC_READ_REGISTER);
+	call.rcx = APIC_BASE_MSR + (reg >> 4);
+
+	ret = svsm_perform_call_protocol(&call);
+	if (ret) {
+		pr_err("%s: error: %d\n", __func__, ret);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+	return call.rdx_out;
+}
+
+static void svsm_apic_icr_write(u32 low, u32 id)
+{
+	struct svsm_call call = {};
+	u32 reg;
+	int ret;
+
+	reg = APIC_ICR;
+
+	call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
+	call.rcx = APIC_BASE_MSR + (reg >> 4);
+	call.rdx = ((u64)id) << 32 | low;
+
+	ret = svsm_perform_call_protocol(&call);
+	if (ret) {
+		pr_err("%s: error: %d\n", __func__, ret);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+}
+
+static void svsm_apic_send_IPI(int cpu, int vector)
+{
+	u32 dest = per_cpu(x86_cpu_to_apicid, cpu);
+
+	svsm_apic_icr_write(__prepare_ICR(0, vector, APIC_DEST_PHYSICAL), dest);
+}
+
+static void __svsm_apic_send_IPI_mask(const struct cpumask *mask, int vector, int apic_dest)
+{
+	unsigned long query_cpu, this_cpu;
+
+	guard(irqsave)();
+
+	this_cpu = smp_processor_id();
+	for_each_cpu(query_cpu, mask) {
+		if (apic_dest == APIC_DEST_ALLBUT && this_cpu == query_cpu)
+			continue;
+
+		svsm_apic_send_IPI(query_cpu, vector);
+	}
+}
+
+static void svsm_apic_send_IPI_mask(const struct cpumask *mask, int vector)
+{
+	__svsm_apic_send_IPI_mask(mask, vector, APIC_DEST_ALLINC);
+}
+
+static void svsm_apic_send_IPI_mask_allbutself(const struct cpumask *mask, int vector)
+{
+	__svsm_apic_send_IPI_mask(mask, vector, APIC_DEST_ALLBUT);
+}
+
+static void __svsm_apic_send_IPI_shorthand(int vector, u32 which)
+{
+	svsm_apic_icr_write(__prepare_ICR(which, vector, 0), 0);
+}
+
+static void svsm_apic_send_IPI_allbutself(int vector)
+{
+	__svsm_apic_send_IPI_shorthand(vector, APIC_DEST_ALLBUT);
+}
+
+static void svsm_apic_send_IPI_all(int vector)
+{
+	__svsm_apic_send_IPI_shorthand(vector, APIC_DEST_ALLINC);
+}
+
+static void svsm_apic_send_IPI_self(int vector)
+{
+	svsm_apic_msr_write(APIC_SELF_IPI, vector);
+}
+
+static u32 svsm_apic_get_apic_id(u32 id)
+{
+	return id;
+}
+
+static struct apic svsm_apic __ro_after_init = {
+
+	.name				= "svsm apic",
+	.probe				= svsm_apic_probe,
+	.acpi_madt_oem_check		= svsm_acpi_madt_oem_check,
+
+	.dest_mode_logical		= false,
+
+	.disable_esr			= 0,
+
+	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
+
+	.max_apic_id			= UINT_MAX,
+	.x2apic_set_max_apicid		= true,
+	.get_apic_id			= svsm_apic_get_apic_id,
+
+	.calc_dest_apicid		= apic_default_calc_apicid,
+
+	.send_IPI			= svsm_apic_send_IPI,
+	.send_IPI_mask			= svsm_apic_send_IPI_mask,
+	.send_IPI_mask_allbutself	= svsm_apic_send_IPI_mask_allbutself,
+	.send_IPI_allbutself		= svsm_apic_send_IPI_allbutself,
+	.send_IPI_all			= svsm_apic_send_IPI_all,
+	.send_IPI_self			= svsm_apic_send_IPI_self,
+	.nmi_to_offline_cpu		= true,
+
+	.read				= svsm_apic_msr_read,
+	.write				= svsm_apic_msr_write,
+	.eoi				= svsm_apic_msr_eoi,
+	.icr_read			= svsm_apic_icr_read,
+	.icr_write			= svsm_apic_icr_write,
+
+};
+apic_driver(svsm_apic);
-- 
2.43.0


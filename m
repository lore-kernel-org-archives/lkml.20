Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318592BE034
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928273; cv=fail; b=GS1xyjNZ60yKbf1EmDuh+mm/EIuIiID3VV5rVXCdKS3qXxsrLzborALp9HX+5ASLqYEKI1/2upGafBDtU0iUvUlgu8YOz2igoNU/CM/+G0mkcT82YQrH6Gv3ER4mmxncx2mjx533G8Cge1cR5rm22IUk9PYcPNHF5LuPcZzuceU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928273; c=relaxed/simple;
	bh=fn/kUNnmjN8qIz80EIBuve2hYiOxonhtEqm/bKtT5m0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJiWK9RoIPRXaKv5ZxNn4JANmDo7IhKlpp+Dvusw+wXorO06YPOY94AbQ20aKCs+pK7f6yEL6CZqGeD78363HMEUw9FbQyDsLJraTGpJErK53OD+XJEKPnf9y2nbNFUan1Q8f/G58rpe0bYvTlmiRwyBOUEP9qT0c1WwdK7aUjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fqkIS4LV; arc=fail smtp.client-ip=52.101.48.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fqkIS4LV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWZ+8FDUkMvZev6iGtault5+weA1tNofzefot/dgKaQhiXzgNClF1e4GyxdrK8gxXuXB5aQS5QLNOzDearHqQH13qdH1r9a32UukB2ICLsr2XUNriirOcjKfMeBVYAD/aWvxVD8Oj01qDmYG3jVJ6r4EeyQCQXdAL0j3ybLI2Z0+ElheS6FjwcKzIjtHSHD+k7idyJEqwyaZPYAf/XsXOeWojehb02vdYSQmObRD5vqoxQUK7p7CFN/+ggJDWNZnSfwND7u/Kk59QmyUX6M1w3wfM63OMu5KsHvRa8OsAfUckDbeETVmimC0VLtPrW6i3AkvBjGGSQT+MhYex2EOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP62/6xKTEUU+x9ckrsir0if25ODKxvtTU0wV+EnzSQ=;
 b=wPj/Z85iOP9VNxp/quSvZpMM2LTKlx08zQqeIzu14h5g9y7qA6ThLCGCXqRlbvUYYVr/CdCO26vDgvS64hqGAub4Bau/vGf6m/Oa+yDv/Qw1hdyNROj8aCxjr2tqnWNLG6vukh5UXhDJQyhLAvxKjuAvcTxFIHdgjxaREOsz/xyVeHJl+6dvOlwjqCLK0fTmRVFpJAlgqADgmrODRGbkJgQ5nTtOdGcbj/S4r6NXHoXJRHRiJ8OB+P/jJVNuFph/AVtdYujsKvEodtlI/TDm0+OCa4INj7V9GuQBRvUzq84Ayo93xNHdxniwFJ8sYzFYCMFASotPAD+Ipm138EHfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP62/6xKTEUU+x9ckrsir0if25ODKxvtTU0wV+EnzSQ=;
 b=fqkIS4LVVQoPwRvrqStoYTySFNLB3EpUKudmOuOfNx57HOgL6KF+dWnqJ7BRXjRloOdzan+S9uKazgPMuOz6ktlUFXi7zF5mZkkdC6CIYzTgmpLYhllxE0LLFMPGk9XpKGF3NU7SUFzOB7nx6OG3K8sTJxguZKlYobNIp1cexaU=
Received: from BN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:408:e6::6)
 by LV1PR12MB999281.namprd12.prod.outlook.com (2603:10b6:408:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:17:48 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::6f) by BN0PR03CA0001.outlook.office365.com
 (2603:10b6:408:e6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:17:48 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:17:47 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 3/8] x86/apic: Add an SVSM APIC driver
Date: Sun, 20 Sep 2026 18:16:55 +0000
Message-ID: <69bd40ce677aeac56cf53b10910c602d60604393.1789927246.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|LV1PR12MB999281:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4dd86e-4790-4369-be9a-08df174379f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|11063799006|56012099006|10067099003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NzL8C0FlxVYPvkJ1SIisZ2i08KbvQrIBP/Bj0wUi8DhhF61HhXEhzF+dOe4BGYxmG32CqCyeb9ziDev1E9PS5iryNMB+D4UjMOXCnuZhIVn7fpmxNDcNc85giWNDjBs8GDUHBHsi83Lw0/0bVF8NbFPW7exgu+b9DsYwowTaNAuOw7vF0JYq7pGd0STw4H92jwFDu2wP0ZTXXAQ8hLbJk+LIrqG9o5LCC6m4IuuA7mSXDJQ7q+voD7AI5wwsw16+5ApAhO8szP0cO80u/rlOKBgjhItb52JGa+kW3+mgMLL/PPvFQZhieuqlbyevJFc/DeoZhf9jlLp/1+wCe2Fs9bBl4d+HwdaOMrFn4EDPCbQP08gKa392w0H9CmStK405C5fv9gYm27pvXdVGopEipukBI6WRcdwiAIXrcvteK5CFZF2Sl2j9AeRaRx3219FHQqdUvYDReRbbgHZ7NnwvmBLXFhDFuoucs4lbjeV5CmTjG/nCzT/3bhXOpmBsDJFbcRUGJEIkvaL/jrpehJdZnVlwBkv1BVzFXWNE2Yn7wGrLQp4y6HqOctEx/Hy0nWML5d/4qLFQT8TyHZiQqf4Ced4ZmxqdxUJtcVGrRkm776cJ4tNfFfCrcJs4XFsNBnt5WHXt5eD8eIhZ0S2FoMOWNwHvinBK1vOBF8chTT4qe2MbfuXdDK1cU7Ez0gdhxvECKy1hfJbGTaqADckXrLBdxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2TtmChsevnn7ibSke26EDhOEn+MnAggygXAS3YOdFDyEbCnGsqS2yzI42I1FQR661v/mL8fwgTzCeP0jQ65xf3XDM5unXLJ2E75pbsS9utis+5PQT7t01ZkCClWhavwfuyf9a63vw2W70PYeJP+yP7X/WVweToWGt5rwG5ZvDhm0oaVM86d75K/l/XQFhpVDSRUbq4Swk4uWioFcPQ0f3DwoHO4RNwmYkyuwQ7p1nLDSGakyFw/aOgyzjnKYWE8JdY9HiFEAYnI6+GelGQFdBrQ8adoO1UBFRkjXUwc8VS6ZfIb+NuPE6ydcZ9mL3UBBT5mR6GXurJ+PnIlqTChhkU/5dRwjllkzR8z1BEno8P99Oz4QuE/dx6ae8g04E5h5V6alJChFC6dWdalYX9c3c/2524ksv/Cv12aJ/pxCSYt7b4H3W6SykF2a5XLIpEKX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:17:48.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4dd86e-4790-4369-be9a-08df174379f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999281

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


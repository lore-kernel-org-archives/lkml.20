Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302A51B193
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913898; cv=fail; b=gmWLtImY0v56rGXecTEgbkYeB8u/YRvgScLJ/9Z8s7yZmw9nzltbQTKGLwMDp2nXYzZKMtOJVNoe5i2XBtdPyYN/bu7nh/V7TuuynL9CUNjWKn0TJL+fHt9wPVhXICeeJdplb2CEPDc6t5+8+tMlwDv5RuaR1OP0uiO/ZpU7tRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913898; c=relaxed/simple;
	bh=OJ/rFvNT8zqjlrRkU6UNWemHPv/b2dPJvcySI8zU0Cc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pl1sYhUyt5CyuxWlp+8WXvy31vjQy6NdpjGoFPgFcKBSf8qNtl426KeGaqud7dU2XHA9oGm0712ahnvLa4Nw545l6fsU+Km8NT9/QGkFnLXqZWqFrPX6qC3ICTzh1JgElPDxPQS+D8Cph4DEvBO2ucZhInjJCdIFPi9vdmsrKfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mky1FDEr; arc=fail smtp.client-ip=52.101.52.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mky1FDEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR2kxohDwrvVo3Y65V+RkJVRqLLpPLlhUp9ZJ6sbKzPsJtTq1ZwfxebU9WxyWO/ImOdQsPIuvPH3VTzKM78GVctYGp3IeQMdNDjVmk83obZcbxdt2a0ky267j79z/zqOdsAIJ7He3/yAaIx6WHgQCEwPvZD9s/wwlr8XNZap3I58H8VVMFY+By18f9gzNqvWJ2D7jlpqfkZXZR3jmNoSYCvoPGFbOt+SCA5Ft+eHJ2ZHvBb2hmHBBhuPdy8v/IYVdcox/C0if6I3Apz2dkS0YN6ruQ4xykI6M7bXQPzxWWxx6ck3WsVuVgX3vSkMfynOgtdb6z1ig395a2xOy6f6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d05lTDtAMzi/dn4zrDr1TEheanUZbCKLzRDaR1DKFI=;
 b=zL8DFzIrSMQUSr9CQD81RKVDSKTFn/1GZP9lMI5SwE/+ufQqaEmkejOmVyfN/KT76lCUKVVsRztISbcj4FPA3YCa9ZqDtoNFf44TPo8LrVU2hOp6Nc8CtEABrchcMETcf2ItvTvmpPw82YbzSVbj/nbbtmJWBBxKqyreRv1/socXrZA7+p7p8/QakGC5UZOmduFZLY02TQ/lTCkqcxUnoOEUdzXDWeAv/XEuRKvqds+Ggj3oxmbY9DRs0UJeDGSb6Nc5CmEGNGTKAeHHXZaRtZpIFDKO2ChzJt6HAweU/Nm1Os8N9onTujv9+kg+SjiKLyPC2feb4PDDhNa+MfoDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d05lTDtAMzi/dn4zrDr1TEheanUZbCKLzRDaR1DKFI=;
 b=mky1FDEr5DGq0MtXxfTnxo5z80vYxTefX6n577XuJVSPR3Yqu5h5cv9vP4A/RADHJVbsqQYNX7ISxpDlBl8Jiw7mwIbuJOP9NEDt8z2Nr+SslI6LN8JufttPWTMGgsxP95X00bwiPqOH1BNKUEb/yuyO7Do0Auesfj+fLlqr3gc=
Received: from DS3P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::8) by
 MW9PR12MB999207.namprd12.prod.outlook.com (2603:10b6:303:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 17:51:31 +0000
Received: from CY6PEPF0000004A.namprd03.prod.outlook.com
 (2603:10b6:8:45e:cafe::45) by DS3P221CA0010.outlook.office365.com
 (2603:10b6:8:45e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 17:51:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004A.mail.protection.outlook.com (10.167.247.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:51:30 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:51:24 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 2/7] x86/apic: Add an SVSM APIC driver
Date: Tue, 13 Oct 2026 17:50:49 +0000
Message-ID: <a056c2d6d4926fcd6c2d9c8a7df88598843b3474.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004A:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: 065a2e86-d40c-4662-8a41-08df29529cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gIJG7yGGvj7T1EQ/t39+2/tFpY7nEDb8RUajWR2yEeLXHI6M4DsBUYMbhdZF6uq/XHIPJns2oMjSFL+oCRTAs8qz5LQpq44NdMRnDRRehBHZve7o4AwXyNYOKqhWjPFpMDpjiWZe5WfQ/ay7o2HF7FUARrXsctKfrVGBjxun+b+oIhiqnZQJS55hWx2b5BbNbXbetusB35yRJRd5I66vaEqHG5CaibUajpJSW/XRApYiblyzhs0GTgLziEvYOoSEJp3PAv/bLZIPaNLiMtgrihfREmNe4rrCKv2wORddBY2eTG7J4Drq1b15s3dTiWkMGRT7qre0USaP7I3jYx5kVJKElpIOzzgYTXyphDJvOvDdgjiJLMNmSW6W1axSH/Akx79ux21fSbqClF3jomAyQ3wpkv4w1IwQmpNTnNts93MqXwbkvfNBjAE4xHBQkXfqHvzgXDwnQmyl2Gg8HhxWs+s62t6Wh8sg1IVL2ynGQTxgj+YZQZ9xh9y4sgnqQwMIkXvl4DRq+g64zzqUxATlsWCYBpQTrx9o4vdnDg96sHaTpZo/sNPbozJfuy6wH6JCOq1Zdv/kVFzOuHc6FEZbIgU5HJWWWpzEPLfeOTo/q9iLCbDW4pUgYAQyMfcQ7hy1ZuHKXhQoeggSkLIhFQjWxroup9Q08J5xWxrGRaBNtZalt5xY6Kgci6YCvTWh1Fh/kmwQjhSrvnZbpVm57h6eaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cRxnMosjczngd20xjh9AM0jOGryy1pkCYyhW+KGSyt9dzU1bU217TN/zAof2/RzwqD1pnDTGjfpFTr3FPpatwt8CKYpr1P1A+VVezzCCxnTmteol79GNiQvJUoXE4XJN/s09WjlYjSxeeZsJiy2ATtxegzkdoqOJ6Ll4JU13yiuoaxEgP8kmAEwEZPxfH1yw5Ii9coGr/t/0wNmCRwWnld1WxJh8SB1W5lPhDPUT+kIUDlUDZ4b5kPzWKYPS60E9QjPmCjhBOVV5yRfw+apfcYeO09p66wlWf1QuL52rMHo4QhUJlKBCkRteaCqzD+iXLnGKK8gbosn7kD/s/Pu1zo1ZJhtmDQ4UBfwRVHt4Yt793lw6SvYzre1Lo2yZB3w8OGS68wJLHbKCU2ssa/N3yYnyNwltb6gTBmwwjlw/Mr5VGHnTrduH6l0YGZK7p7RY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:30.6237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065a2e86-d40c-4662-8a41-08df29529cf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207

Alternate Injection replaces hypervisor-based interrupt queuing and
event injection in favor of guest-controlled queuing and injection. In
order to complish that, an SVSM is used to update the guest VMSA to
perform the required actions.

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
 arch/x86/kernel/apic/x2apic_svsm.c | 238 +++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)
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
index fa81aa004e8b..ea248d9e1c49 100644
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
index 000000000000..6edfbcca2958
--- /dev/null
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -0,0 +1,238 @@
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
+static u64 __svsm_apic_icr_rw(u32 low, u32 id, bool write)
+{
+	struct svsm_call call = {};
+	const char *call_reg_str;
+	unsigned int call_reg;
+	u32 reg;
+	int ret;
+
+	reg = APIC_ICR;
+
+	call_reg = write ? SVSM_APIC_WRITE_REGISTER
+			 : SVSM_APIC_READ_REGISTER;
+
+	call_reg_str = write ? "SVSM_APIC_WRITE_REGISTER"
+			     : "SVSM_APIC_READ_REGISTER";
+
+	call.rax = SVSM_APIC_CALL(call_reg);
+	call.rcx = APIC_BASE_MSR + (reg >> 4);
+	call.rdx = ((u64)id) << 32 | low;
+
+	ret = svsm_perform_call_protocol(&call);
+	if (ret) {
+		pr_err("%s: 0x%x, error: %d\n", call_reg_str, reg, ret);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+	return call.rdx_out;
+}
+
+
+static inline u64 svsm_apic_icr_read(void)
+{
+	return __svsm_apic_icr_rw(0, 0, false);
+}
+
+static void svsm_apic_icr_write(u32 low, u32 id)
+{
+	__svsm_apic_icr_rw(low, id, true);
+
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


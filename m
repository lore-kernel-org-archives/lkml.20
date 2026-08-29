Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA59125A0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974843; cv=fail; b=hUoET7xXeVN/M01t0xOJ2cTnLHW4DdvFHwju+IA7nCsj93bWrUCKHixOIl/hxQ57ImyfMT7WSHYLNXxreoMrvAgT3iiRRiKe0J0VBXXX8kaQOKrUtitRZZfFhsYaNOIGgoPVWS0RFPoon2PnkQvrVaJ9WiEau85gr2tH5HtKTm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974843; c=relaxed/simple;
	bh=mdtykXHDd4a1WKGxQ2R7dcEF4z/JYI2vFKdwc42WJXc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6VUEECch2xuAKV7+NukFQWLk8IbcorAGmWKkFH7x6eCZ2HMA4t2E2HEs1u7XQb9DaOA8roXYHlgce3F49XWW+gShhrh3ZHBTMpGM5zglG+N2bybI24ii6LOp0w+7s9PUWxKwmvvQQTbQsPoWktVqHKLPrn9sBeJW0inmh4b0QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kssP4ZoC; arc=fail smtp.client-ip=40.107.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kssP4ZoC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cur2aDdB6N8N2b2vxdeP3F0nJtw+NMnfIBacm/gF3mzYbJDJXJK7+mL3wIwP+AAV9u1UDvHH7mKn67yI+hnNnf3Sl8KL3PdyU2QI0CYSQDgdxoKYrwgp8NEMGwZOdsfLt3gxp3OAMIJGEBnO3ELs+YZn2tvuxB/sB6TXbekAzpRaEjkHKbQmhFvOLqA4ycgVGhUQ/htPsYo6Up02OpA+CprUTsqoHGh+YUkNYd+A0jDzvqsknYEmOGlJjQyOs84V9pb9r6cp8YqGRZG0tG45diwFkt7Af9zeVvUQtoglDsJ5VLEEaxiLBtsBpaOdGfFyxoh2sx9Vtyy7THQ818SZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC75A2Dyy71TqClF98x2d14I4JvZh+3f/Dp9Z1ffq+A=;
 b=PxFwcYwaLxbGywrGE+xFqHeU/AkBcq70zu6fROeKN8hTdXClTp6povHOv7XI4Ph5qcyk49R8Qco+OPamn2sS/ildc+ymuuTGkgmh/1vaNDB9DkufLNYHD+n+uSNxrLdeomHcmKbptEJ0N4BpdDoaXPnH6+5lQg0638sLsJSyjyPwctXD/xcGDxI6vyioLpLqBmUhuxbMYV7nW1ctLZKYw/h/h2Uk4pOl/8hNeO1nyXmCQfQx8FTIuzFcQiWK8zgGDWrRqlqtHv9nsu8IXFByobUlUy+sgqCmdV+ecD4UDU5IkWx6Ut1tWvUVdQAHSpGWtTgUP8+QYDN/9slmfIvgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC75A2Dyy71TqClF98x2d14I4JvZh+3f/Dp9Z1ffq+A=;
 b=kssP4ZoCwrnyn0lVOGRyjG5a95OygFAlze252eLtWOm+A/i+lYpxA6uvwKSIQ+A8Sm32bgXlknnZkGvIelkxsIrKWWTdbYGFrXnKZSqtTwvhF3ae0u8mANaiOyVZkxQpKI+ZT2EowvC5c1zGclp6Wjk76nACvstxnG2yZPBUXMw=
Received: from IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::7)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Sat, 29 Aug
 2026 03:40:35 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:558:cafe::77) by IA4P220CA0006.outlook.office365.com
 (2603:10b6:208:558::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 03:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:40:35 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:40:34 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 3/8] x86/apic: Add an SVSM APIC driver
Date: Sat, 29 Aug 2026 03:39:41 +0000
Message-ID: <778462470199fb3c71c17989e6650037e6d97bbe.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 70025b74-4b1a-41ba-2166-08df057f48f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AXVvU8v05VpZmjMxWAyc4ZkU7CC05fIDwFQClshdRQEm6enuVwDinm+OvBMbpV+B9LhScT8fX7VpP/FrPzlOym2QyKAYqcWUieYAA2OpZtq18/NyQeXrqsK6yTq5HiySFFK0B8uNTebNbMJXgsU3Cp+AR3uObqfaAHWgSBb6yY1rhhYlN5+T2c018VLu/GqfbWKxiyy3qKOs2//Oe8TTzfjPbbmLdwdumOevP3nTr0iAvE7/e2hAXzyaiQzwV9gUk6MGtKKp97b7yl87DO874xuqSo1/3YZYYPMr+phsYyiL60umCjbNXc7kF8cbfZWqNrCOJlJytDySKmcuip4f/1izI1dXu5AWTu7yF47tLl5O47YsqKbxOmx7Dur2wm8V0sVU1PTIa6TQ74cTFQyWsC0xWV1KE4kHKquXNptlZKdztrohDUdVvvoWVMovdFUJBCY22cdMnE8Lt3Wsxuw78aqdcdO15xJnVBw4ZY3bqZc8KwW9/qW5NLg2um6UrzCL90lfVcK5p6WG+Q4gaB3OVx7L33nNvVxJ2bpylJpjzfFGRN7GWbXniSC7xGDHrLT0hNTzuZDaqzzO/ugbdVhAtupCBbiUcH7YzwhmAMnntl4lXShgfUnWdlGiQc2uZx7TvZqT4dpY42YYeLtDZRKxu68LruzyHHAJImE/t3aDJTARqNrLn/AVIP9BZsHJTQN2exE2Az8PakYAvn7fJRZ0/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QFcPLvgF/+VC8AhOWJ86Hkzd7/sQUuAvW5ZW7wCkYHLODIT9+4ReWKlwlrnmzJQzGLwN82trGOauNulyYCquNLFyHwMSn/sJFrP2uExdJWgQh4yhbaE63XH+qWEwovEDKnBwlg+leRlesYdAPvizycv1WxR4y+9H5ugkqD1c4t3YupPDsV1MBaKY9scIyRMjHJY019ykYLpGvJIGnLv4QHF+4mnWNEFlQ76SuWhr4DlJvIC3GaEWn2eVTCIixT0PzQyMUKzmls5qBc14u3X45s9t8hFLu8rLG3zN02ska55mB1QZpSy+iMiWCO+puWc/z5xCTdJiojzRxrqaaeg7UtY57DQrZ0RGhiC4JwPGkWg/dJDJoQNM6dk02XSlrOjI8QgNJY4d/zvG0TUU4Q7EA3uHEfOGWjH/AB08kGayA+K/OhEX8VP9NiJo8lOiNqU/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:40:35.2601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70025b74-4b1a-41ba-2166-08df057f48f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788

Alternate Injection replaces hypervisor-based interrupt queuing and
event injection, requiring guest-controlled queuing and injection. In
order to perform this guest-controlled queuing and injectiion, an SVSM
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
 arch/x86/kernel/apic/x2apic_svsm.c | 233 +++++++++++++++++++++++++++++
 4 files changed, 244 insertions(+)
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
index 581db89477f9..23d83f1293e3 100644
--- a/arch/x86/kernel/apic/Makefile
+++ b/arch/x86/kernel/apic/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_SMP)		+= ipi.o
 ifeq ($(CONFIG_X86_64),y)
 # APIC probe will depend on the listing order here
 obj-$(CONFIG_X86_NUMACHIP)	+= apic_numachip.o
+obj-$(CONFIG_AMD_ALTERNATE_INJ)	+= x2apic_svsm.o
 obj-$(CONFIG_X86_UV)		+= x2apic_uv_x.o
 obj-$(CONFIG_AMD_SECURE_AVIC)	+= x2apic_savic.o
 obj-$(CONFIG_X86_X2APIC)	+= x2apic_phys.o
diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
new file mode 100644
index 000000000000..b553bfde4b85
--- /dev/null
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -0,0 +1,233 @@
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
+	if (cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION) && !snp_vmpl) {
+		pr_err("Alternate Injection in VMPL0 impossible. Terminating.\n");
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+	if (!cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION))
+		return 0;
+
+	if (!x2apic_mode) {
+		pr_err("Alternate Injection in non x2APIC mode impossible. Terminating.\n");
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+	pr_info("Alternate Injection SVSM APIC enabled\n");
+
+	return 1;
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
+		pr_err("svsm_apic_icr_read error: %d\n", ret);
+		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+	return call.rdx_out;
+}
+
+static void svsm_apic_icr_write(u32 low, u32 id)
+{
+	struct svsm_call call = {};
+	u64 icr_data;
+	u32 reg;
+	int ret;
+
+	reg = APIC_ICR;
+	icr_data = ((u64)id) << 32 | low;
+
+	call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
+	call.rcx = APIC_BASE_MSR + (reg >> 4);
+	call.rdx = icr_data;
+
+	ret = svsm_perform_call_protocol(&call);
+	if (ret) {
+		pr_err("svsm_apic_icr_write error: %d\n", ret);
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
+	unsigned long query_cpu;
+	unsigned long this_cpu;
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
+	__svsm_apic_send_IPI_shorthand(vector, APIC_DEST_SELF);
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


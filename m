Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928378;
	b=jJzyf9tFG2VkBGGk2JHi8Zm8QZGVSS/b3IdHvK5CdXZnIPaBR3Ymb5NfLaAXd9B9d2el
	 IinnF7HFoL/mEvzs179tipFAwgcczwVb3e+ZKKxTz9lpCf22G419tRy49pM0lfiS2sYc4
	 Vt4fPVo8G0rsCAQJ1LCszPNeuzY/+xY3gLrZCm9co+hOsJYZodgRCCm86vh4TjtXm6xhP
	 HtkZVcXb3lh6YOZ7CsUNVKWNM22z3Mj0WImqYlZ7tyQR+OSMeR0hy0uS3CwX+BcYpCIQ8
	 ZDiZ4n0Vz5QW1GITy8EymYLtoDYr83i6ndCD+U+i96B7CuLi7SFJwNeQ5VPL2BjfpHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928378;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ClfMZodASHiaRsvS3n6vL+u+M17nruVlbXTLaPPnXjE=;
	b=S0LiYs5nfYXJlrZOiNf+zB3eFLBb8xFv3LNEV7hK8382uNAPNdP5abpyTXDXM31eh2wD
	 7i9UcsemAjOM3jSug66HV3SA2iTlzQZL+nMqrRJiSkWy99TCYtbd0Qw7AHIKDdc+YEtEi
	 9nAmYC1rDNYz18Vetb5m4i0xv8YRe5xpX0+KnNrRZNiyq/Rigi4GJvQLE4LYMYP1FL3bH
	 O0OwmZCXdv7VrkT3aSiLbtZTomoXcv+AKZ0E6RVa74yvpL6sGf4ZKn48POyaasIeuNeza
	 kkGCDwA+RDEYAlQnWoCwncpF0VgH8fcHwFMFtSZgz+PGq0i21M8QWB5QG8HKd4hNuzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2VNjrCJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05589606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05589606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2VNjrCJK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKVFsFb+moNePlAFN+v64Gu3UnZaf8DBA12dDiwoUTlt+eOsrv1bfa3QToe6Kalc17DdeFbkzqfEJ935CR47XumBRGiLa6Bb5XBNfK6oZTVVXUKj31zk//a0B9DNTNqCjWaVj9p2T3NGLh+GENe0YeLN+OKbIPNx/4Hqa58vvBCKXfjzkQnhz+kLhVS768DbJlkRWxBracbUL8bn5Jwzpfk43Eit6OxqIbXDCRpUbP9McOHH5qp2NCIvPLGnAbxsSnGeZLrT55StFazHvXjzbjbMMoyfEQTy4eNWeOqrh9QNCHn7TDhtrluhe7QwvqcUUN5D/3jN4/+v4I3DV8uQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClfMZodASHiaRsvS3n6vL+u+M17nruVlbXTLaPPnXjE=;
 b=TnwiPbTGizSOZdNdh1O4ThIi+mtDNMoCUB5hAvEHhORI5ysXGQWNaO/BTuwrD1lImrP592gZYil7bTnsL+4OcpGE2unMJEX1QddpIHVFl9/axGwfQE/Br0Mb7lnH3M48s2DAzZohpF2oFAkTIhJKeyXBJHXNazs/P7CW/+HavEWRjEEInOuSkzwYs8daimEa2nMqY83WBMHQ8/p28Ilra+EPb8t+avoo4RRpXPCEN1Vc7xpNWDrN9IiJkdn66EhebWgOUu3ZV+tTwsn6aiHmesJ13VVyweamRYciZWeNLVNVY94zeSmO7cftLMHBNPQJI+vMvdhkwTZsj3GkT0ezAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClfMZodASHiaRsvS3n6vL+u+M17nruVlbXTLaPPnXjE=;
 b=2VNjrCJK0aAPm0tdJmfepqT3Su9ROdAjY94h1WF5dIsYZ7ePJCJX3+8BbxVPwoBQso37zS2UCvPASmTFXf9wpl1QWJjL6dghAQru+ipae4yTl57hN0pQIP1bKecg2FkkNqRbiIcgGkO3Rt0w85NcY04bm/qJT76Q2d/gUrRTVKE=
Received: from DS1PR07CA0011.namprd07.prod.outlook.com (2603:10b6:8:456::7) by
 IA3PR12MB117221.namprd12.prod.outlook.com (2603:10b6:208:716::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:26:14 +0000
Received: from DS1PEPF00053451.namprd04.prod.outlook.com
 (2603:10b6:8:456:cafe::90) by DS1PR07CA0011.outlook.office365.com
 (2603:10b6:8:456::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 01:26:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00053451.mail.protection.outlook.com (10.167.23.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:26:13 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:26:12 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 2/7] x86/apic: Add an SVSM APIC driver
Date: Fri, 6 Nov 2026 01:25:28 +0000
Message-ID: <c8889d168ee6ed808cd96b461446a1e0f0114755.1793926736.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793926736.git.huibo.wang@amd.com>
References: <cover.1793926736.git.huibo.wang@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053451:EE_|IA3PR12MB117221:EE_
X-MS-Office365-Filtering-Correlation-Id: 74dc07dc-7b27-419a-caac-08df3ba4f249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261021135927099003|11063799006|56012099006|261026140227099003|261009223027099003|261021121427099003|261022105027099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qhi4xu7c8dtr96l4Xt537v+sRMtMrqFZ7uXBnZWgMsXVKvXUbpAvIwg98Cmcjc7fEr1Bq25xoKwIHRrhuA1q8Rz4ARy5kZYdVW/ghm2GnCqsc+9O0FUFMZ2pkQMp+o/qrveknZtRmiPfY60AUV8thp/JkkkyfHRX4PY5mVqTC1ZBWm/+wxhR69tjpNbbp5blU770/aSnx33Y0ocb/TNWfEc8F0ba6Clyyjf29k4GMHpEWiX1iHc7baUIhV4uf/H70uyU1Tu5FP8Z52xgPJLyHzX5NGz1KvSglkklmsixMqya3yONXcboqa2IwtdYjUaKZH0++YfXIQkKxAnnzlTM3rYoj4li9NIujuZqhVkC83Vg85v6h1l8dvpKq/lnK9t8/F0cjJfq8NrPAmWH/o17aBBTlzu24O5eNtJSgXu1Ylp6CASdxwnKt/ProAWdCzKEbO6PAUktkDn3VEUb2nbXgT6YlX6f91oV9RfBBB3Ew/5KRDtzYsGQUot5gkBgT1OSw9+JTZMoRvXEEe1KppcstiirQsBqn//tzgLvdQ027RMPbDRNk2DnYUJ6+wFgnxj8ZbMGYRWpQsu+Ej/cggU8WRWyX0FZfnSNfKBMOQspG3AFeFZrwKDbx9+QRzcnVOCOVGMcFAc2f0qxf15nigZITGF5B31u2In93mO8VtmwjI0NKIZhRs4SBW9MFEacHt3UsOirtizQwAdoU2DLV4Av/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261021135927099003)(11063799006)(56012099006)(261026140227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EJWkjpPuRneUgtO4LifvER231I0kAfnbkjaIBDCHw86plZ2oR5YC5xOCdrHfhvpDyz+Bmhj6XaMXTZUR9iHw7ngeadRE85Jkw8M5Nv+QNFWLxE2seWYiHnPy4zntxDhd090/u8jTAebtHFUU9KnrRpT6yK3awkP+TVhrGctqLPSdZKkoEokYcz/NhIfZ2GG1/j1Ib7F5F1nWRXqKwCYx5rWl1U5dcb4V6GJBseKm0c2GgpSM0+UuE7aTUFUyJQIKx7nJkUeUyA90/0g0CwesA3z4Ip1cU6IXHPWfMd3nxYRaLitdv/bKlZ3DT9/xwkHqjS9QJbovEQzdcibSyFkb4rNgUy/bNU6uHqQIR4zM2loEf/WlMbbU7HK9cUsd09bI9EpDd3wt+rTILc4g2AY6+fMCHa4VeroKfhoj9AEqK/bOnxRg46x1uhHCyR4OliUR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:26:13.4741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dc07dc-7b27-419a-caac-08df3ba4f249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053451.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB117221

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
 arch/x86/kernel/apic/x2apic_svsm.c | 252 +++++++++++++++++++++++++++++
 4 files changed, 263 insertions(+)
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
index c7ea9845351e..6496b376452f 100644
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
@@ -529,6 +536,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
 int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req);
 
 int snp_svsm_vtpm_send_command(u8 *buffer);
+int svsm_perform_call_protocol(struct svsm_call *call);
 
 void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
@@ -638,6 +646,7 @@ static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
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
index 000000000000..fea61b929122
--- /dev/null
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -0,0 +1,252 @@
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
+static void svsm_apic_msr_write(u32 reg, u32 v)
+{
+	u32 msr = APIC_BASE_MSR + (reg >> 4);
+	struct svsm_call call = {};
+	int ret;
+
+	switch (reg) {
+	case APIC_TASKPRI:
+	case APIC_EOI:
+	case APIC_ICR:
+	case APIC_SELF_IPI:
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
+		call.rcx = msr;
+		call.rdx = v;
+
+		ret = svsm_perform_call_protocol(&call);
+		if (ret) {
+			pr_err("SVSM_APIC_WRITE_REGISTER: 0x%x, error: %d\n", reg, ret);
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+		}
+		break;
+	default:
+		pr_err("SVSM_APIC_WRITE_REGISTER 0x%x not supported\n", reg);
+		break;
+	}
+}
+
+static u32 svsm_apic_msr_read(u32 reg)
+{
+	u32 msr = APIC_BASE_MSR + (reg >> 4);
+	struct svsm_call call = {};
+	int ret;
+
+	switch (reg) {
+	case APIC_ID:
+	case APIC_TASKPRI:
+	case APIC_PROCPRI:
+	case APIC_ISR ... APIC_ISR + 0x70:
+	case APIC_TMR ... APIC_TMR + 0x70:
+		if (WARN_ONCE(!IS_ALIGNED(reg, 16),
+			      "SVSM APIC register read offset 0x%x not aligned at 16 bytes", reg))
+			return 0;
+		fallthrough;
+	case APIC_IRR ... APIC_IRR + 0x70:
+		if (WARN_ONCE(!(IS_ALIGNED(reg, 16) ||
+				IS_ALIGNED(reg - 4, 16)),
+			      "Misaligned APIC_IRR/ALLOWED_IRR SVSM APIC register read offset 0x%x", reg))
+			return 0;
+		fallthrough;
+	case APIC_ICR:
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_READ_REGISTER);
+		call.rcx = msr;
+
+		ret = svsm_perform_call_protocol(&call);
+		if (ret) {
+			pr_err("SVSM_APIC_READ_REGISTER: 0x%x, error: %d\n", reg, ret);
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+		}
+		break;
+	default:
+		pr_err("SVSM_APIC_READ_REGISTER: 0x%x not supported\n", reg);
+		return 0;
+	}
+
+	return call.rdx_out;
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


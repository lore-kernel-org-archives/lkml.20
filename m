Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643191;
	b=FM6a9T7VqcCxMgFk1FA8d4Xjk/NFvynqsMcDf4VE4JtAd6VFJAdMQaho1n+671PDe6Om
	 lf35S0hRGsc08PJNv8sGzdA5q++nZdAkLxyMNJUJy+rRLwArUo1EM8EreERHBU5YmwrI/
	 7I9O3WodN6LW9bp6zWv0ccik1HnKR5OrAimDe+TIu95VlRJtybeNLmKRfgyQWQSpGt9DI
	 T/nq9fQvBql4uUKbDYUFUpnXWSPsd6Tjv6x75cLjG1j2byNFrLamm9Nt+r+7B4ODq8twF
	 oU8DCFLllTJed7RIUv8BaOaQSjyA5irvk3kd5SU/xJFhYfmGT8T3aNzCSE5kvnAdj6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643191;
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
	bh=7d05lTDtAMzi/dn4zrDr1TEheanUZbCKLzRDaR1DKFI=;
	b=j6layZWOj8Qy/pwupvfM13F4ys2dueYAWS4bztnacvKHpzs+UlCZhmrkzNIR2aUPy9lH
	 vjF4X7N4mtCoKEYuzCbW6L2wO7+fVOYxbzGXVwHhoyiGHmJbVGHafhlkmhPq+fXlyzao6
	 ONddHhp1IfyzDaMTiwCgOjGgUnVT+UiLgodhamtkmUR9UpUJUm5Fo/wqor9DNc9K99+WA
	 +dYnTQtA6u7jTAo8GPox6g+doHaPaD2pIv8bH9tBTNt67nNm02vMs3hwIlLqi27M5tf9z
	 Vvuk7jhl+PDTSFra3Yrij11fqRB0VW0NZH7exaoyr2FPTcreJsXTXGO7L4P6AEkfd0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZkjdHT0B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA69606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA69606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZkjdHT0B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReN9+QKqOXqkJaeyo8j/pap1slVtmFcp0EqsX9FZvMK6qlmRA8nfh52U6/ZA9v9AnobBwrz6kDSAIxtwr1btyWkfphOum56hwIPttiV4GZoNpC1TYd6knT+aE+Zwtpwmpx+vNUdIAEQ+0iMaGYxSOEC8nn4xIZ5RcP1ep5J/65cGwdKittj+FIZCLxqokG3DB3ESWTIRzAn7kPBBfj9sa+cXxPbHzr3lFo/HKNZT0twfyUCLM/+G7Z8GpBynrJRWSw1mJZ7TmSIuYD3XjROBS88zcuKiBkBk/SWcYiC6VHsP2Zb5BAor4K2ocK920bSLgihHeu1GecNhuvWssLC6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d05lTDtAMzi/dn4zrDr1TEheanUZbCKLzRDaR1DKFI=;
 b=JXXT2h8WPkPaE0cKUdmqYPiNhIshNaYM192XCb01TonIZ1i4Hl8wlKRybV3VhX6MZizidyaH1UgPnLKBYFnD7BCrZDXuGlpR50OXV/1MUf7hmq2Ua5GsP4JKXHNSTZBOifgUHRHKpuHH3QlrzVcdfm+aZufIGyX3jUBSVapx6iGL8WeKEgZ46CAxkEKDyZYmJsj0XBdxTgH7oY06xNvEM2THLQTa0nmmwO5Qs4AoXqjoGczBw2sfOZmz9OfBgXI2iAmqrdf4rgN9ZbTAyTILUKKFGNHF0SR8R6P4MXpusD2R5iVTxQA9iDQgG/UTfmmrMy412r54Q1bn2pFMjVYagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d05lTDtAMzi/dn4zrDr1TEheanUZbCKLzRDaR1DKFI=;
 b=ZkjdHT0BeR8zJXXbQz6OUbS5gZgg9BOA5dE930CcPlvHIOfPXT0KB5dm+oVtjl6Ish0BrIdQ7GmpZKMs2sndAfsIdV9UabCpiY7eg5H8HiYF/6hX+wIpRKhqg4jn4le++eTBA9anjtgwdCMC97/BxjTVe8y1UzsDnyARJYaCeLc=
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by BN7PPF9C6E5285F.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:26:25 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::1) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 04:26:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:26:25 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:26:24 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 2/7] x86/apic: Add an SVSM APIC driver
Date: Thu, 22 Oct 2026 04:25:38 +0000
Message-ID: <a056c2d6d4926fcd6c2d9c8a7df88598843b3474.1792206487.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792206487.git.huibo.wang@amd.com>
References: <cover.1792206487.git.huibo.wang@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|BN7PPF9C6E5285F:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2c5317-27f8-4b5f-a482-08df2ff4a291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|261021121427099003|56012099006|11063799006|261021135927099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	et/NYpSF/uoZICj46Oi3uHpY+KSmkOvvf8jcZuB/TqXrLJIViIhmX2Rz5tt5rh+Ebepjmx9n6xqPNqVyHEE9g7PKyjD8D0ACmM5SsaZ+0zUkLIGzmVeAZ3AHtsq/Bg91zv+Ry1oBgVMflDhbsNgmEFReVFLmznDyWsagwlP0oJh2anqqHyD4YvETEdxTN0mWgbRX7Jrszq842fXO5p6Bzvv6BSzuRNd4aRNeT/o8gfCeDBheG/JtYQFsaYqlgBnj+1G0BaZ0XdocfLbSOpxUfcuQQLpflaZE4s1CbB4oO7z5RVGFZtQXIw1HKxiEwQBJmuIu7eAv62UVSzKOK2u+39pKx0OfnRdtTARK11UxKUvy4hAA5IZLaptiJC/DtfBARwqSDL8uiEh5O+DHCCksWnMW+WFuBEEeSCcordsHBzEr/3p+6hBrF5qSPjk8BN3zagdxjAOsMHpkqBt5RpFE+ZzRTzLwSN1Un+jDIqZqUTYmGlaUs5fXMy+3N1VZQ36eUYt1IDikn0U2/k/Awd4rW6/j8+4+Wtp6Sx09SFt80NSyT4G/S9uFK5WpDNU9QoLRly0cvjcWhyx28MJTnsrbPVLRhMJW7X7IWHJUFwyeT7JnKAByleUaAyuHr/9BGiO961l547l3ZSwlOt6FdjvwoLRIKuvfgQxOy7mIH9aCAXTwjrgfAyF61F2h2zFrVWpjpuq3o6EPhrej6c1LGi7U4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(261021121427099003)(56012099006)(11063799006)(261021135927099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EuQ9TahqF3NvFS4X95aydch4N4kXv3WI0ekxG1cch/yS71HJ0+aNmOonxjkQUt62MXTlT9u+5QWsLpMh0AMoD8rev+OvdXzABrmXCGzLlwHMusQr1ROj7YnuiCctrI1Yq14s3mBp4VZkilAsBzoRC+TbMY5tdwLi4pFqc9E23sAObcI2T77sW1GFK+5VIkaVdRyqO4P1mX/WlDNV6a6IzBZ1ofYWSw9NDbYnRYUnBmC+j7bYjPMSPy3SF4mLRTigbJMYpvTEnj0ogJquxGsnxAwYOfFRUgJAfXpRU7WyC3pUEdjypolTEX2CDOL7HattNbwZv+Ot89olu9y2h0Q/vOAAMX0kXWyieFDceAxWSnevynp9JBhkQftjR1PRWsnEeZH82F3yDPOQjMGHsQvroRUrbo47p+iwM/h3+7ZlC1EiAjlowV2LfOK/qz8ppHba
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:26:25.4612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2c5317-27f8-4b5f-a482-08df2ff4a291
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9C6E5285F

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


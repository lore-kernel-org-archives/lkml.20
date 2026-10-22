Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643205;
	b=eEsAl3dU6ZOTSFFh7j1PngVOZp/8JH5ekpuJEgElR6Vi+apeqdeJpCaIgfkYcjKe32gw
	 7zZJWJBD7vHMRTX8C4unZVgnThO5bx4Xs/97vrGV/VdJMRt/Cu+0jQnO5cJ4zeiqmTsy/
	 WqHZOnF+tbX9pO0tbIckZxHiDDatrsb9rhWgVetK3YatnHtNzScYb0u6i6XcTnTlfyw5i
	 VLfsddIttZ/v+dCiIO4tXo8mXmZ+oZeuX/hYUeIOQZo8IbOKfTfqgEADtqvDw0m1DWY79
	 Tbkjek8CWxGjQKoFctr80OoE+LwkPzr4GA2PmvnwWUNy2aFM1SEu1CIH9TGVJfu+uRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643205;
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
	bh=9fCDF2RBHZGeIt5PL9YAdxU0RXBOFKIePMFGRGXlo+M=;
	b=ArRU9SETf6po3Rq8zfsiUn1fO/E4nl7CKREYGFc5ZaKSwfBO7ytLZ8wtxRkmxYm513wg
	 bkaQnYmQ1MOqltk/MibKzIHsi7hbz5mgvx/MqyAFb+70veYW2Xe3mVsEre5rccX19PtOm
	 ujxcDEqrVCHDLURD+lEV4GeF6bN97VIB+RoxBal+bbiNhfik/F6oQt9QC7R1WnzQFXFf5
	 8+jXCqtCZo1vxjez83vPSjYEIBu8c9udmkMWXeF+7gjGYa7cm4U0pBKZ0LaBdmmFm1kw1
	 rcFXkN0VHGUgjm4yLTz9nG6sAWkvShyEtvRWkwSPaPRsG4EjDxyB73t/Hqkst9/Q+Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QzrXeirK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.42
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F82606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F82606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QzrXeirK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOTIV/xT90rtmjdxsbIUW6NRS5EYpm4qMaZaHX68RxMqUua0hM1TIYSGCKcvGl1g+dbcMrEya8juiZ3wQiHxpPW4dq5UJLG2r3SrRYDSwOQBd1kg0lmo8j47u8WQmrcWQG+DB3Lv1/zV/UtvWozLVUL55+s6Zo1UiFBjtUnWhFKNA3oF+gX1t3ik6KxYlLZatS8ABLy/XXUrDXmy546c77Q1IcfQs7p3pBqFOHrOhAWo9u2O5zSNb0cwdWky+C4mnMiN6HiTxViVrR82nJVpPI4DtyOFYpP5XRMiSHbtX2b98h+wq13DMFT2Q1cZxpRJBD2GUSIkXpALg4pUwcT52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fCDF2RBHZGeIt5PL9YAdxU0RXBOFKIePMFGRGXlo+M=;
 b=vzrT9lBgYVz1SJFVtmPYYP7rAK88PmPEoL6TpRJDURASfRS45mspovIOQn2wqfhUebWSAe6EByI7P3mcBQ2MPayFfMoQzJ57h8sEXLjawZSEyWvFytnmwHJTudIz/lrOSpey7KBPn/v1ghB3Nne+uEztQFZFD8OkgoJ+faCRTzbyBm0rlBPpYbpKRmmXdu97lhmt/bX5xoGW8zBV8tm5klBHNJd3BJn82KbJXP+aT9ZJoZT89fDrh2dCyJxeDF+hu56CJ4hBQ2MAso5bi4gPCzBN0LsEX8h7HXrq9IkRTO2YGOOCRG6uRgB1G3HtLYVukUCw0UcJgtd2ODTNzukqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fCDF2RBHZGeIt5PL9YAdxU0RXBOFKIePMFGRGXlo+M=;
 b=QzrXeirK+Uk5gcKw4i2FzOsKi/XEaiJUxxlvp4D6YgzwNUIKyql6Uoze96+6WQi0NLELcwE+34gJsYRtC/QZJbNbK7pnMlpCtcRbZlGLVbKNpDplGFxAJ3dW8aM4m08FNTfTh0GSMweODogK4D30RL0rAwSIgSyUei0s6RgUmXU=
Received: from BYAPR21CA0026.namprd21.prod.outlook.com (2603:10b6:a03:114::36)
 by SJ2PR12MB8873.namprd12.prod.outlook.com (2603:10b6:a03:53d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:26:41 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::a7) by BYAPR21CA0026.outlook.office365.com
 (2603:10b6:a03:114::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.2 via Frontend Transport; Thu, 22
 Oct 2026 04:26:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:26:41 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:26:40 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 3/7] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Thu, 22 Oct 2026 04:25:39 +0000
Message-ID: <2646bd1474e25dcb837fef5a3c24269664432a8a.1792206487.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SJ2PR12MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f125959-cfad-48f1-2372-08df2ff4ac0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|261021121427099003|3023799007|22082099003|18002099003|10067099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MmDXeQgp9fcO9MBqtzHnZRlUZfl2ILHxvxq9TbFVQCxJQKCOooGc13f57MgpF+nj3RDr3QStLB2wKDFiZAgNbrglVRsNzUFmPD6ZKl3/acyfBCl+Y6RxTSrZ7Vt4Amb4g4kKRg46PozUeyUEh5tFk5B2rK4UQXnQre/dtivUlNVKjxZG3TGaIZolzmCKGaGXohcnWt2z95E/2h41DQyxjjBORATN0/0vf+vJzWu76RnJw9WEuXH7CXon0dFY1MIm21DYhnx/hsXReX5r1/1yj7TPpzGd9zkSA3a6vx0EwVb/MB93yz4SPYfe5QZCpkbHZSXJvU8hcjNWj6/p+rI43gi8v4ZCCLEmmBwe2lwdvcZTi3yh18UGkMyfEquCKOGq9K3c8RbHKM29mvQtPnT2H/74fKQdtx7xQXeHMNy0El+UKwK91J2AOFY8uRjIWaxCUTjbQ2fY4otIlUW5RasEpnUv8kYUzJCALwfO/y+/dfdq62CRx6ptw+55eu9hBHTaZHah4Fe+hmlPCUWVz6W8aNFyseJXKsda8i7R64KLOtw559xBL26StQK2A+qV92UHjded3dH6ra/PHyr9kE3ZnJ8SOqSGkMzT6r08u8SAv8Nijhgna3Kir8EfLL9EvIf0KPKxzanfGnv6EuZ3O7a19WclcbDQzWvIf+c4TaYQW62c1vnzRKnjqIvbqXOHmsDzymIQ7vYYy0riJDEsjTTCRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(261021121427099003)(3023799007)(22082099003)(18002099003)(10067099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WSYTOKNntndJo/EEkBby38/elP/Clbof0hUeKjpRqjwZYJl7++xjgyBm9thNgZ25zeuzreBOEmeeutnyQWfo0p3gK345kxWQuk2Q3yz1pZy+D9Vg8MAMs7/avVSfPjBswfzIIJhQEZyTmBPy0SSW19M/kaUgZLDXHvL/MgcTugHK6WFhC1BZvQdfNWt8v3BWH8uc4lrvYtON5hQjY6QF+eg9ZtES0QJkfXkS9ejFkQosFPQEqMGtzOsHSWcX/j5XBAfmUmc4eYA41cohSZV2ZuRMGG4FEukPP/rh1IKCbOhwumM4J1S5yRyZReCRMuRRqhQrwGJVuWCozLFFASsLNlFIWRJtnyeGll5197LpagBpm9ldHyDR0qS9dpYafvljIJgH1r4lMx1of7zufdBKYex6AJmFDrVvsqAwS4hfNRTA4c/7e/oAR/oE1mczDLL4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:26:41.3651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f125959-cfad-48f1-2372-08df2ff4ac0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8873

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


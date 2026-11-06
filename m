Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928388;
	b=KIqj/L3UXbW1rUdTsc6XBflImLBN7HVObfeH7vgo9TL5hHqVV/5ZbcI3Zpx2Iuqs6hUx
	 HWo2f7yD4SjNHCv8f/ur7+gUIvRD+ymDE1bJoLwZRRmc6UrCsl7YAyuUhfLXwDk8zvcyF
	 gWCBJwhilqDZeAxY/ye/v9damdvG+7vdxJlzm0f3wR1/KU/hJ4AEpAO4+0HQtDfvbnOJe
	 I7PLzyVWzb8YRIOMZPquQqtX9yJg/QzfNfRytuPWIaOYxdXnTwapk01h2sbGXDrPThBOt
	 26qiGBaAiEGloYC7FQBWpvGRxFoOIzXoPPxTrjs3cS8FctaSmNlRnZ+pVA7CVQiEDvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928388;
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
	bh=cEEC6/RUut/bOvXL3G724oPgu3w5N85LbzrvtCc+tn0=;
	b=2lFJfWNPWo04GNqApF+Fa/DvINt9NQmpvA+6/yrwXEao8l5+fu4/JMtsvjmf8X55EH7g
	 yGYuSofsN16KX8FenBRHrlbypC9WUkrSME4JYOhOdfTWyZPmYj8NVs7nXkzqZmoL54BKW
	 x/8/PSqWcx3TW42SnvtEYwMfzbkgwtQpi0200vQfjiL4E1BIWnR/1AfOtkarUM6SMEYm+
	 tNGTIC4kzwO7oEn0EpPcbOmdrDX/R5SRzRd7mFozS7S62y4eBakjKIXuJ3CVHoN41ns2A
	 8izQ9+PNmpmQARj35mZNk+nw4vTBKOJKcVMKvIV4b+FOPB29PG8LQGg25RP/3kCPOcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pGwv3i8r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.70
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90152606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90152606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pGwv3i8r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCVjEqyNJ89PtpsCxGUzqq4TGpKrKrToDQFq+TJDM6tSVjSV2EgN6ObGXO9zn6baFQ0HH3Lc0H9pmLIE6Ffd2sKFLG5c+/IKFdTRdQTeNVnjcUR9+4dHXrjsdI2mc1Z2ykHN8TqnhNmjHvzo70eCiaFGG5zlYyZ+eLOqCOKJLJHBk7IvkVCMFgGLkVd6BwGhjVJtsTzrt5ETzA/rh2Uu2B2DDDdnlMIBxugUrTmgmEs2FNm4D4/7pzJJNGuF5qoheXLKu6mcj1CvC370IAQhk2thZ7O3Wzn3Ff3GfW8pjTEEeuiTSr+MXBm2lXB7uQw78IbBgyn85emq7v303snCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEEC6/RUut/bOvXL3G724oPgu3w5N85LbzrvtCc+tn0=;
 b=GPq47wrB/TpfoSeS1EoBlhBGHHQbsjvLIQy+/xDZNE72xMs8uM7gpMeRXy8HnNe/qcC1+GHynmAXbcWHE3nz71BZcWLc2mHbjO3cgqcNah16eoExxiYOT3rOqca5Y8me6cAhkUDtXh8EL9oHjoGAdAMq9jxldhWNtKnq6nT6IPHCq4NOrb8u9DPV60IB+LsPOOKtMeVVeUSCXX4JSMO1zUT2M/ZA+h3ouPrlGst+cgYoa+hn1u1tbs56BuoVphXUUfuus7ox+BguV4mvunBSGGpqryHtRPWVOYxGgH4Hj1PQXI2GxpheK8x5h5zmMxBH3husg+q+9J7MdvblDguxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEEC6/RUut/bOvXL3G724oPgu3w5N85LbzrvtCc+tn0=;
 b=pGwv3i8rodkyGSYoNkOMIdWSfO0PHRc2ZsPTeHRpfLGjRzrCktSK+NJ+KE+srlrE1y9xceo/R+oQtZw1LDGeIwdQGe9Didv527RG0D1hEsqFufrXrpDyAMll1BztPECh9z52wtS8jIFJK8FhLy2rYmdBX5FINlZGSlQXbwfGGX8=
Received: from DS1PR07CA0008.namprd07.prod.outlook.com (2603:10b6:8:456::19)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:26:23 +0000
Received: from DS1PEPF00053451.namprd04.prod.outlook.com
 (2603:10b6:8:456:cafe::52) by DS1PR07CA0008.outlook.office365.com
 (2603:10b6:8:456::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 01:26:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00053451.mail.protection.outlook.com (10.167.23.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:26:23 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:26:22 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 3/7] x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
Date: Fri, 6 Nov 2026 01:25:29 +0000
Message-ID: <054e8a3991ed4f541afded6fb9622f08f7bd8526.1793926736.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00053451:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 713494eb-16bd-418c-0f02-08df3ba4f86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ra7bfjv31YAhEVYWmk/l3a88xA0bJ6MAYSdkEdD5TN/cr6oIZehMQ8/cJF5kwh6Q/dJQ7mjZdHO6OJFbOA/x5AkfDaIIsWGtIAs2QEm0kQwVUQvjeeWV4DMVlrfCoXVvWlDU4v1LAMeHWwXGfPQ/QF+C9c5Yo3xowqoEJhHA78KlQiTcMXOmwT0CXBIQIlnTISq669O/Lq5FT3s/hg50cODA9Qzy0o9Cl/Xz74eCsJ/rHbNI+EzAiDKtsuFWrHGXoKk3al9Z45U+x35LcF3g8M/amrrhLdtX2kWHdgVcZOEbMP5wsGHKthZ80TbpxUudgvRbPzGbMidfeGX5i6EjEe9gZLSqJmT0Wne9pV7N9E9jes7mvoCbhSCU6rKCaMnCNQaK1HqfBfVc6Ge6Ek55Q1DgJEM6Rufx4ic60MNSOoNQqDE5WgDnIfuE1PAqzN7hXcI0bjWzkdXViNdcSEF6Wphc5BpSrM26dvMsezobScJKtUT9tBvMLDvH+W7mRrbUvzzojSVFkEB+GUFew9lgLDPgCHTGK0nGFJ3lmdxQVnf0Liydwd45bAtQxrZEukHyLNQSBfOwH2IDmvK0ZUP0ChCSwUmFMPSI91p61WAOA7G2TNmcUkMBA4RYk4VTJUTisL3wTW3p2FmkOrLroFkSc3+JVKpHabjOk0GcsTCcaFBcnz7QhTWCbvIvB5MQU/SJksc0XeSwU09FE2xbs/S6Fw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J/hFQuXaHmHfhVNoOjgv8hTRVbbDTJgtSC/vQiCFcIhb1anwRDkYJsSRNV7GDhT9Qv/JcifUh3SxKFj9GCu2jKVrv+qseV2P76ewBuj7r6x2y2qnfs4NRHAggTtX33JAofW9jClO7+aNgAhVsPx0bxFTv4eS74Ww3FNtZU/PpyV9sdvzFREAiwcyYzQi/Eiru+Hpo8i8ZLIrEyTvXHaLlKlo2nblrxT5iOg3FwXWErMlo8FBJq8yB/Cjf4aZzorK5YL02z7WiZnk7Plpf5O6BzPmiZ2ox/SdevZ/iES3hBJH9U42EmDBGN+qGedB6YIjajThDXlcnLAeScByakjxLQkzcEkTiFXnJDGfUpJassslTDqL9r891ZIzBtmjFjfEO/5U+5SnXfQioCanCwUjHuDfXVbRbIzhL8qi2BJX5hRNMH7mTSixxAY+ecJ0Z3PV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:26:23.7473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 713494eb-16bd-418c-0f02-08df3ba4f86a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053451.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

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
 arch/x86/kernel/apic/x2apic_svsm.c  |  9 +++---
 5 files changed, 31 insertions(+), 41 deletions(-)

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
index 6496b376452f..d916a5dcd6af 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -542,8 +542,8 @@ void __init snp_secure_tsc_prepare(void);
 void __init snp_secure_tsc_init(void);
 enum es_result savic_register_gpa(u64 gpa);
 enum es_result savic_unregister_gpa(u64 *gpa);
-u64 savic_ghcb_msr_read(u32 reg);
-void savic_ghcb_msr_write(u32 reg, u64 value);
+u64 sev_apic_ghcb_msr_read(u32 reg);
+void sev_apic_ghcb_msr_write(u32 reg, u64 value);
 
 static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
 {
@@ -652,8 +652,8 @@ static inline void __init snp_secure_tsc_init(void) { }
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
index fea61b929122..c7f7a9175e17 100644
--- a/arch/x86/kernel/apic/x2apic_svsm.c
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -68,7 +68,7 @@ static void svsm_apic_msr_write(u32 reg, u32 v)
 		}
 		break;
 	default:
-		pr_err("SVSM_APIC_WRITE_REGISTER 0x%x not supported\n", reg);
+		sev_apic_ghcb_msr_write(reg, v);
 		break;
 	}
 }
@@ -77,6 +77,7 @@ static u32 svsm_apic_msr_read(u32 reg)
 {
 	u32 msr = APIC_BASE_MSR + (reg >> 4);
 	struct svsm_call call = {};
+	u64 val;
 	int ret;
 
 	switch (reg) {
@@ -100,17 +101,17 @@ static u32 svsm_apic_msr_read(u32 reg)
 		call.rcx = msr;
 
 		ret = svsm_perform_call_protocol(&call);
+		val = call.rdx_out;
 		if (ret) {
 			pr_err("SVSM_APIC_READ_REGISTER: 0x%x, error: %d\n", reg, ret);
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
 		}
 		break;
 	default:
-		pr_err("SVSM_APIC_READ_REGISTER: 0x%x not supported\n", reg);
-		return 0;
+		val = sev_apic_ghcb_msr_read(reg);
 	}
 
-	return call.rdx_out;
+	return val;
 }
 
 static inline void svsm_apic_msr_eoi(void)
-- 
2.43.0


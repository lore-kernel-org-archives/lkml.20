Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643366;
	b=qbAOISGtfBjU4+RkELWeGGG6ni4DDQ3V2A0ijM7Encd8a2/qLSZbyWXraL6iFDdR/poL
	 wvsikXcg2+vIh95dU6IYVXaVV01L0Hm9ULgrwgYUGzJvdW4QyO1/xv0tGOlQG78DmbQin
	 H5om0IHSeKLu3nBvI34ZW5euPIDrcbq7uYdV2PFaxsAi4JmwVRaX43l9tLFYC0bYNuKY7
	 HDn2qN7086B4/MLpJKjWrPO+WAWbfCcIUia3HDUdH+dKjAlQHn41mwclIWSqd8Kr5kCIQ
	 IaRDPBRFLWlqjbBGfTH4xiqI1jf8aO4tJ/SZx40HLwTo5wL6Gfss4B5EQXm5mbOyN0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643366;
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
	bh=iAIMCIX2ROFkDVs5HWYalbPEE+UnJhZt+i/o9xwB+I0=;
	b=GyzuS4eDBbsJ6KeV2L+8Utloo1rQr1eY5mevMuOKoirhPYYTNspzD4ScwBfAL9p6pQuc
	 MBjkstIR6S4fD8W/uQ8eshxt1a8XuagjUEgr/iGvt/q6gii2XhKfH6tiG/Ugvcfvy9okK
	 mZRxZ6oanbUO4VHCaLZSDH93FF1JThTurViCdClEaWGheMbz7jQfjhK4nh8HuwpjG/Q6T
	 2e3L2PtXmA7txVPwL30cXSPR6Z7SnUL3opltl3cbgtrtQrGSjBHKcqQRtkymAbL8YlGhJ
	 woUq0Ogn+SZuQDuphMNrZ+zh9TF96C/zNHA3KcSs1No7iOtNU9MpS979jQCYJ6P1W7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OIOWtbxG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.57
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OIOWtbxG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuqYul/H3f02jmDKv6G87UQ3WD6t2alVubjoBHkIyauD7pviufgGJ0xowcxdKL1oStSyB12N+p3V5YOvfx0H1BMlk7yRbDRw6bv4RdzEQHw0w3fvGMm2Mr02kmgJbHwrHEj1NdPw3NjfVeBa3gWLC9r91GCEIF9IWKpU7wR9XtZziUS6HjGHOrC8qj9rgJKe3wNMuOhdRvSP8kjQ54OBWyRrlokACTz9Bl472FFkjk1ll7s8Mgjk8DIOzMfuBpmjK1qc4yBiLyNCccS5IGBNbiRDSNM0vTfGRSkl+e21ebHSRQeFDSKLZYFdvQv7NcGllZjEtgCoFJKOD/PH5iki7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAIMCIX2ROFkDVs5HWYalbPEE+UnJhZt+i/o9xwB+I0=;
 b=cML/EQGRAO5IiWSW2Hxh09lPW/qMBcIqofOFadD4MVNWDufIheWlITlWePGce7D99iBoQbncmgkWtIGoO5ntgVXOYmQr6NZc7j2gC468m0RiIXOIN6Ub96fhQZgr6LSVaA5gVBz0UlU8CCtx8OJLJC7Wd8ULC1L2A+H3+MCGLYrhYEntT8ZeRjEdAfey4nKltdFlw2qONLpYKUolwGLR9oqacVvw/NlYGPBc4tNcjJL1RWk7Z+xivfznHH5ZFEEZGCmOvvnUjzXyhGJm+l6lsGmSN4j2p2wsyWmzDN9u7PLNwGg7Evt4Rr0U1bw66ZD2SoKNzPN9+x7hHy5NOWxfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAIMCIX2ROFkDVs5HWYalbPEE+UnJhZt+i/o9xwB+I0=;
 b=OIOWtbxGDZT9QrLIEAcpKMdKK5DKTjFeLSHVC0oXpr0DbPxVN/mFewHZnCJx+bC31bE4KBdSMr80nAk/l9QmZmT4GwS8evtyBi+Yic8W/wzTyqAfOv6mO2ZkkGKF9F2mgWxy/G7Q1ILICOFKxMcn/IL+mdsEkWIYe3c+aKSiJF8=
Received: from SJ0PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:33f::20)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 04:27:15 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::71) by SJ0PR05CA0045.outlook.office365.com
 (2603:10b6:a03:33f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 04:27:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:27:15 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:27:13 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 6/7] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Thu, 22 Oct 2026 04:25:42 +0000
Message-ID: <a75781fa8cc143eb3c469c53cca135a184f106f2.1792206487.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ae8995-e056-44b6-b68c-08df2ff4c049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|11063799006|261009223027099003|22082099003|10067099003|18002099003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	JoyjJidLyDnX6avbD7/vYlxkCRShpU6C9rXfdSXv5l/zOlJgtvzcDlMRkQrshNpkjBd4gj+RJk2gf8sUoVtp4rAP+3pMvSqulwibc4stk7B8/1mdM5/qG7+OW/XRNjgHtUKxzYX8uB507hu7hhgkIOv9/ls5au1xJTHPQQzJDM9b4znCWxOH5bdaRDYb0yuaYPlWXOIMj/7Gj03mLlnV6GFfKHO9OT2HEVYT7Cc2j5aWelmgcb8CQekP9px0/ubXbUVFBVKZUmwktgtyACjD6zgV4iFmVuSYWCwik9my+gq7ubY7SnTfUWqAXpsmMCx/PP0c66dYhRqQIQTC2Kt7bCh2ZKe9DiJ7DBcesivUCf19pvzH6RZ4u9i/6+QYQwnOc70Gy4rQz8v7/VG3Me51jMRveu7hkP82IArZbk5ofS02wxqva77Tfm8tXYWN15JuwUilJktnXDycOMiU27rxQG+6q4rjZEcrO8g9kfHdiLuwl98ndresHGK3MTBV8HNRj9zzOuX9pBr50sPfRmfiGkNCIsqQ3fKGDcfZP/oJV52r8IPr739/riIWKMKoEpFqjPgbbWR9IGZHXWFaksc41EPh4ioB0b4Z30GpZjfzH4mHuejOVw6dh6cWylvfJ590vCYoG1qBQrps9iR0dx1TDfu6DjAX6Dv1+IkWBqoVKgsd4QlH4VBqIpwpbzRGZfGB8zHc4oA4oVxo69LaZlUj2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ipwmbp6yz/R47RPk1mHNrwZuNKg/mBLHE9CW4/mzLSOroPZp1Vj0Fxi6SqihH0rkzlryQ1jf2KArIKpziBeTi7NVrBJFqTgiRIPAIHvfCoSes/fQMTr3ZgDkdu+azhbqKGBCXFvYDLzWHv41tcMNN0kk/ywItdSBpY1tMnC0bFB/XNxiLgi+tUdIzauhYzupwVfnNQNedXDcn9y39XWFaPsDaht7i3+dco3MSf0oWnxbtHtPLRRiCHpK5ePIBkpSPKIdfnivi7stdYmovOrA482gfxrKhNEo2s9ESSB3FHbh2Kgb8ODrzBPsUOGU0h8LKzumrDKIkm7QYvv5PwYfcE1aQEAy0FpakjO2v2bFd94eXE6dElMT91rhMbsW3CnP/0QPeXibNodtX4I725ejMcw422YD/zzK2zgvgwj4+qYVfY0YcBAmrnnU4Dk7Il1H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:27:15.3213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ae8995-e056-44b6-b68c-08df2ff4c049
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196

The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
(shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
the guest to configure an interrupt vector which the guest allows and
the hypervisor can use to signal interrupts for it.

Implement this call, and make the default interrupt setting permissive
when detecting an SVSM.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/startup/sev-startup.c | 20 ++++++++++++++++++++
 arch/x86/boot/startup/sme.c         |  3 +++
 arch/x86/include/asm/sev.h          |  9 +++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 789e99d38d17..bf11e5420dd2 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -191,6 +191,26 @@ static void __init svsm_setup(struct cc_blob_sev_info *cc_info)
 	boot_svsm_caa_pa = pa;
 }
 
+/*
+ * Configure all interrupts as permissive by default for Alternate Injection
+ * enabled SNP guest.
+ */
+void __init svsm_config_alt_inj_vectors(void)
+{
+	struct svsm_call call = {};
+	int ret;
+
+	if (sev_status & MSR_AMD64_SNP_ALTERNATE_INJ) {
+		call.caa = rip_rel_ptr(&boot_svsm_ca_page);
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
+		call.rcx = SVSM_IRQ_ENABLE_ALL << 8;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+}
+
 bool __init snp_init(struct boot_params *bp)
 {
 	struct cc_blob_sev_info *cc_info;
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index c07a2c381ed1..3f92db52c557 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -566,6 +566,9 @@ void __init sme_enable(struct boot_params *bp)
 	physical_mask	&= ~me_mask;
 	cc_vendor	= CC_VENDOR_AMD;
 	cc_set_mask(me_mask);
+
+	if (snp_vmpl)
+		svsm_config_alt_inj_vectors();
 }
 
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 13f2e8c009b4..8f14f99bd388 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -34,6 +34,13 @@ enum es_result {
 	ES_RETRY,		/* Retry instruction emulation */
 };
 
+enum svsm_vec_enable {
+	SVSM_IRQ_DISABLE_SINGLE,
+	SVSM_IRQ_ENABLE_SINGLE,
+	SVSM_IRQ_DISABLE_ALL,
+	SVSM_IRQ_ENABLE_ALL,
+};
+
 struct es_fault_info {
 	unsigned long vector;
 	unsigned long error_code;
@@ -520,6 +527,7 @@ void snp_set_memory_shared(unsigned long vaddr, unsigned long npages);
 void snp_set_memory_private(unsigned long vaddr, unsigned long npages);
 void snp_set_wakeup_secondary_cpu(void);
 bool snp_init(struct boot_params *bp);
+void svsm_config_alt_inj_vectors(void);
 void snp_dmi_setup(void);
 int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
@@ -627,6 +635,7 @@ static inline void snp_set_memory_shared(unsigned long vaddr, unsigned long npag
 static inline void snp_set_memory_private(unsigned long vaddr, unsigned long npages) { }
 static inline void snp_set_wakeup_secondary_cpu(void) { }
 static inline bool snp_init(struct boot_params *bp) { return false; }
+static inline void svsm_config_alt_inj_vectors(void) { }
 static inline void snp_dmi_setup(void) { }
 static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input)
 {
-- 
2.43.0


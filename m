Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928454;
	b=pVlLA9cy5PRR177BtCdpfXs0efamCN2P3a5x7+MVA2rWEAxWfo0VH+GuJhRQuScrebpH
	 86GyvcxAy7zNaaSa1AsPy1TXaFcZIKvEws0mF+cxEUsnF6U4ipqxA6+RZ9qJQgGuXzIhC
	 Z7oKCBVCP86PYEOqEaibNPy0iuh46EUIrn4mZ7dpZ8gOU7CsGtQqYV35wqAINdvFlJzQ1
	 JSjNFn9V5jJL2PIzClGdKlBAHBJgelIZt0SNkxileolmmncSQNZv7eveT6H7mpusjRqCv
	 ZWw+WsyNyDHL9CMaCrBbmN3jCgS7fqWWmYSA6/bIlikHFMMRLurj8RJogvujGY+7Ygw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928454;
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
	bh=4jzhlV5/NcVNXs+PnRGm74SNhzAvn6K444ZU3B2XySw=;
	b=AnWxPVJ73ZIdjFB1jx70PUkVRe/h5DsLs+hcH3SzfVGZLh6pTkNIUh8KylP7syukTxxQ
	 VqDxXhXAPn+Y0/eAcie7pt5H7dwnLxzfp8Yzl8s1OoGgn31g/mHu0s7M36GcQy4v4o3zX
	 kEVGsQFvK+LHiTeJubddudhZhLSBIVsCpa8K1qw1gR1dC5vTcRUcTf9d7mONQG45hUzWG
	 OdD+VGkogxtTu9Ss8UlAH+oief+QNuvWdPVTUI2/I3XZH/VX8SNFBlB/Dno0kQ/+qh+EC
	 Y/zmG7/WXEhjXqaWddaGzkMgqX1HC37bUilKvOW/1WfjpFoqs1D+LrAnLFwPDJOd5EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="G1vRX18/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.14
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158A606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1158A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=G1vRX18/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMqLhRREej3fFuD7bz60mtlGm42m/dcvYD2PcDnwqVttFSEvbsgPkHg4CM3XPzwdVPu/RNIAdFwKKGgpemqY1G+TZ0jHIvUDMVT/KVW9HLboS5EgirmLqHsJP8KeTx0iRxKPEKocFDnV0Z93C3NzbPJelZIqbavNr4flBup0LvcikdFV+k4ZhrxlHUrsMqXsADx4PY77b2Cz1uBxJsisn0DB3ehegqtOJXjM4yZ8iCjkl9PSyVgllQo693wdfzFI3/n2kFRHk2Zc7Ra/6YW9v5ez2lvdxyyXnHB0RNOLrhJgEQ0BCuzbPckXo8k5l5pJWGEpJElStYc9brran5MfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jzhlV5/NcVNXs+PnRGm74SNhzAvn6K444ZU3B2XySw=;
 b=Ii/Cl2aByTxNaTjuLD5NM/3idT+qY8H6Eso3I1PqayggyPLfuXMbUe0eYl/ouevAwygOCO1mUAd480O3hJ+lzIzLOTFeOzW1/IVxQ8zdYP/zR1r8RMdmFbfdB7A0l2+xF5KvCA3maPVrJBWKr6o6w/YlcrYz9j7Z/429UEdTaI2Ys/OGl3fd6G12K3vzJgwiShkK8YmjagBqtdDHaP+xiQBbKj8uYqNGA9m0Dd3zYo/jKxW0rxDn7MKXzVbEn7Z7GdzAXYKU1BZ9r51yDAZC51p0n+8fIsKBmRbeUzVA+CexwKD0oPlFvZfVKCL7FI4ZmAIL2HzlKxexjNmoSbnrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jzhlV5/NcVNXs+PnRGm74SNhzAvn6K444ZU3B2XySw=;
 b=G1vRX18/c0j5DH9DnYZKIUdtyoTJN/n5mDPjMie+vXRFf9DY5Ud4h2TcVR9Z9c++ays5VjLOHSTt+v6JrNKIwwy3IZa+S85Kgor/vutFihbFBmHlI0PrnJxRM/eCceHzD9p9UT5MG/KALRsLNqW2cfBCaiZ6/8pdvLzasqWo+4A=
Received: from CH3P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::28)
 by DS5PPFF8845FFFB.namprd12.prod.outlook.com (2603:10b6:f:fc00::66a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:27:03 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:610:1e7:cafe::9) by CH3P221CA0027.outlook.office365.com
 (2603:10b6:610:1e7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:27:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:27:02 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:27:00 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 6/7] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Fri, 6 Nov 2026 01:25:32 +0000
Message-ID: <3bb412990005d4ec37e0e5d89a3524ea5e9d5117.1793926736.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|DS5PPFF8845FFFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cbecac-443a-4cd1-e1df-08df3ba50f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	p/Y89bUca5FExmAKu0GW/q0iYQPPXFJ9JEuJJD4VfniNFhcaiWcgxLT3gS80CJyXQd3b7kVhJhiJtoMXTcNc6ZAcTf9lWnGlIIPtIXewHyoeECMVr+7RXRcb1Uh+c0/gMP4ifhgLEmzhzpmJ1PPm+v94jcdnIpmYTrMshYEIpGeQF5JnV7uEE8NOGGKzi1FMvZ2zwHoQjn7dkDbwKzmHThvOl1pUT822oAKVPiFo8LigbMkDZvlujOvCr7Oue/vfh7QFtxN/1BBdoR64KrDe5CcPacU5Gl8FiiouX6xKouoB2zuRiVHdklFArUXH1LLSplvCPTyUEO6nLPG/GutwLwW6hHBdyxXEx5ux32JhyTtkyR5J0BpzlmingXzEjf2pzR+oleXKL1XzUzbJyzOOGQ0VpVrlYUVdY5lTZLdtHVDAPOGRTWHwOYjAHzxv8hMVv2Bn5lQrzEovwNrOcH/Zj5rfiPyw0CH4w6jywxEG+I90Oz/7d/IKHvTOMHApVZ4RVJLmVT6AqPPXcfMdLNgu5cF7Amnhu0a3G6oy4jvnkel4lkFcqL3J0Ut/GMe8XM1CG/wqm5Fn8knIa9SfFZnBuamS/hudouU+/e8qlYCOYiQa0pENIhqSVNT8f0VSEXTe1rchZuv8v8iu76Ip8p0OHlaZHC8zTSsG9ZS16E2kwWDRIGn8idcXjiM5nf6YYQGZv+amG3mbHP/fGuzXGE/n+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZB45V6FO5Zm1F7X7AZvn++ZBTeM5wxRAc5ut2/i4nyOmWCCJWm5Oj7FmA8C15+3+9sAx2Q6i7QDgoN/pxocwRd6t90docnTSOMDHzuk/LaQSN+BWPz85RPkXodWI+hqEKzwcnl0SHkx7EYku7eLuQyMcRWmzC8B1RNCt6dSNul8bKsx5+MlX4Vhx4MZ8sKQ61dsnLDy8nRfT8AeyzqZaqjqein2SaPhWJ3y7uEbdp9Uq+NTvpPT8zU1unWeEnV5ivRGXdOgbPJhDjMikQcl7apW4NvF0X4lGfA1k1ux+XEOxS9eYs+FtYcpONUQvMpI4D8SpKwGVsS+NQsnq+XO19U9Q3tn+it3viL0fnW/ERhWRLDGlHWeJiWYovr3Be4+1NcflQZa4WpVIppktdjXcgtxtrFJka+oFuREvkhZRmU1srPKOqxRsy9BHkFi2caBG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:27:02.6978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cbecac-443a-4cd1-e1df-08df3ba50f9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF8845FFFB

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
index d916a5dcd6af..dec4c6b217f0 100644
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
@@ -518,6 +525,7 @@ void snp_set_memory_shared(unsigned long vaddr, unsigned long npages);
 void snp_set_memory_private(unsigned long vaddr, unsigned long npages);
 void snp_set_wakeup_secondary_cpu(void);
 bool snp_init(struct boot_params *bp);
+void svsm_config_alt_inj_vectors(void);
 void snp_dmi_setup(void);
 int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
@@ -626,6 +634,7 @@ static inline void snp_set_memory_shared(unsigned long vaddr, unsigned long npag
 static inline void snp_set_memory_private(unsigned long vaddr, unsigned long npages) { }
 static inline void snp_set_wakeup_secondary_cpu(void) { }
 static inline bool snp_init(struct boot_params *bp) { return false; }
+static inline void svsm_config_alt_inj_vectors(void) { }
 static inline void snp_dmi_setup(void) { }
 static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input)
 {
-- 
2.43.0


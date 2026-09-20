Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C83D646B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928323; cv=fail; b=gYjukAfXYi+kLyKZLg63Ln8kdx06HjFn/ZJwYiBySlMezTfAC3KdWt47e4pBnaEjOcsEpgCKdS0W/RWYGNqGJwtn+0TwsbZ1fh74l9zoUdRI5+HgMQrHucvGZGy8OX2NdjINcErOX3d+N06vE8j+pKHvJZg1Tmw53pMfiZFxXBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928323; c=relaxed/simple;
	bh=Fxn/z/6fPk27sreV7vP/xK5C7aacD34P9VVLXJ66SV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UpX1gVu35VsrWMl9zG1K5yxR5jOZiG/Bzk4JCvS3PXuJCLD1O4uOAr34ytCc1EI4RBXoRSL2u1k4c8knBqvHlQ/hjvejtXPPz5oy+cBz08NGMKR/5IDu4ckyh/8JcPg/4uRfPSXqTU79qzip/0lTA14P5KXd90uCyjm4uQ6hDf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XAxhkJ0X; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XAxhkJ0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6dizxjljhMZI7Rdl2FlRXjod+8hraInJhfS/IQtPq+g2BfLvNYm2rbc3ks6qp7yEpUylGU+Be8vSSsDTxNAWzi2YnZ8x+D7wVuFrqo2nGHrZ/RfhMV1Nk3kNPuBsv3rorfExwGMQfuTq20U0PgVlw4L5Mvag8kX1qTjF3Qfw+vtx1TlnEnOJ2h03jAI8P/m+J9g76xD0mezI5kBy3QnPXxQ8xRykiui8JY/ZjvUvECCjQMwS935k7i2ICbJgBwt348QmHjn7VdHqF3EF90Do8piqUJ1EOVhjvOC5wYiRWWBgHZ8kORms6cuIhHnIGqw6YqxGb3oLjAfgCT5VjQ5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q55FhPOz/tgMc2f+fF50B0EYwFFF9LBjAqRcD6Ccf1M=;
 b=Isdd3PiIQrQT97Uo3R/82XvKNBwuHis1vTCxNBbxvtxMQxI1yVO9Whe9VWEO3YVGP4O6ExWFLsMgQgSA24fwVdoPjvQxssB+P+7HctxcqAyM8AVt1cZESQ5AVaCw/0fiOlF5US4VvaRe/DRBWVnYv9i/peOwFO5Lztn/PftqvjV9s4L7SyiVySvbF9veMfL1W/PP3X6SSK1lAXgWNV0/fPccVPPOjR+PysXIICkPYU4FFpeGLdMXRvgV58hvSdDZS0Doj8sQpYRDXZG5fdc0kD0UfPZmpDASiKlpVANOf7JyQ6IvUcKxHy8wrdZRU1abkwwt0mrv+D0fZyR9xDsORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q55FhPOz/tgMc2f+fF50B0EYwFFF9LBjAqRcD6Ccf1M=;
 b=XAxhkJ0XlLkH2tSgWJ6JQD6PUB/m68qrbvvXu1irWgfcvMgcutrZnKSM6jlaY0HKdPCvyygLn0YkaYFOFj2jO0QgReb+3R5RR/sbtzSYzfjrWmqimLvN/GoKrM55CvzV4MKp75mkgz1CrtZjr70qkNIk5ZR8z1pqLLLkD4MuTiY=
Received: from LV3P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::11)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:18:37 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::a0) by LV3P220CA0019.outlook.office365.com
 (2603:10b6:408:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 20 Sep 2026 18:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:18:36 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:18:35 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 7/8] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Sun, 20 Sep 2026 18:16:59 +0000
Message-ID: <e13c5758945b82ecec381d2b210e80b00aaafb50.1789927246.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 89451f97-41c2-4d4a-240c-08df17439697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|11063799006|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gRXZoeRtuIt2Z+sILhoyVbkKHKtEo+w7SXd/Ja7I4BsBOMDHdeGpJYCfyrToZIOMtH8e9GyAU5ZHNtyUoa5mwOpbmfwCYCc35dsETZBHTh/XCDYLoRBbeHeZcYt7OsQa7J8C/1ka1goU5kPpsGq+MVYaikG8z44r7yK5TQHEixFQZ2vwXm91crthRAKQ1OD87Gu/9h1wAzuFc9sig8gQH2L++tqUPWYSspGNwtGgi2HronO2FZNqXp6PeYmCbNrtJHw11vCRIbAtA9XIQjisttUZdwFbUUrB7U5BCEtydj4ReMF0F0yqDTxRZoqBzzfwE63vcLN7C2MY3CgfVBPJh0u2x2fDdZYoGZo2t72pWREbNNZHsyiGhFzn8h3wq+hIKBsEq1AZqFqOn8PrjqfSLwny1yiB6cC0UWn1aDVW+wMivYPAtjoJsM+j9AZFllvtQW+7hHwtgLh4+dxLQ7aRi09FbPR0mnzH1cnyEKvmvPeUhrx3uD44PQr8qaQnW66csvjUtC9LdNbT9lB2g1sYN27bBvhcJXjSJgygf0WllNTgZxyY8sJBlxUdwZOM6vnSCoi3G57N6wis4TQqK5gkR/RDZHV0b3/ymntc0YZ9sNr1kNMMtmWFMzMmWyiXUxU2WBtwdLZkqizCwaLDP6mQaenhn/bBl2oA0O7frhiYMrN+6y2icFLTyy4Q9Dth/csWND2QjBeBGWtwQ+us3z8HhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n1VniaV8buKoHcOwd3lcLmx6dfPs0CXeXCrkr1qbFRRYySznNXwYfyJH1PW40K49t5RUt/CYhDt8K5uRdpBSf+FTmntmQLYnRZNwzlxVPnJhDjAXHgV7fY0SIy+RCSEBOFyeG3X1oPDv2Fr4yuh/UJ1i7AnjtHGvJetyENL08Jxa+VMyUP4GB3BfyG3aQ071khrcBXZa+kedolhwlecYt5O+/Qh05QgfibthEdjuv4jeZ5N11mKVS5qolTW97uyQwgPvtslcJZ40vhyWkp8koovgx0tfhI73HbDiboXS7pfaUgQ4jbpq7eA/ga9t1/Hx5FKQs0kpLqjq+3XJZJrtuBjTm4kQCXB/4LXQrQpeDg08dEMQk9gC4KnhvrKX1fWy7Dse1XXfe2icGs+bQGFh0gNF1O778pEpvRnIdPjLQii7xQ/FlcVU9rJ/4veYiP96
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:18:36.6202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89451f97-41c2-4d4a-240c-08df17439697
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526

The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
(shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
the guest to configure an interrupt vector which the guest allows and
the hypervisor can use to signal interrupts for it.

Implement this call, and make the default interrupt setting permissive
to allow all interrupts when detecting an SVSM and Alternate Injection
is enabled.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c          | 24 ++++++++++++++++++++++++
 arch/x86/boot/compressed/sev.h          |  7 +++++++
 arch/x86/include/asm/sev.h              |  2 ++
 drivers/firmware/efi/libstub/x86-stub.c |  2 ++
 4 files changed, 35 insertions(+)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 9f776ba7f123..6ab6276f731f 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -534,3 +534,27 @@ void svsm_register_alt_inj(void)
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
 	}
 }
+
+/*
+ * Configure all interrupts as permissive by default for Alternate Injection
+ * enabled SNP guest.
+ */
+void svsm_config_alt_inj_vectors(void)
+{
+	if (early_is_sevsnp_guest() && snp_vmpl) {
+		struct svsm_call call = {};
+		int ret;
+
+		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+			return;
+
+		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
+		call.rcx = SVSM_IRQ_ENABLE_ALL;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
+}
diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index dd058af2e7aa..035a7b46085b 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -18,6 +18,13 @@ enum svsm_ai_ctrl {
 	SVSM_AI_REGISTER,
 };
 
+enum svsm_vec_enable {
+	SVSM_IRQ_DISABLE_SINGLE = (0u << 8),
+	SVSM_IRQ_ENABLE_SINGLE = (1u << 8),
+	SVSM_IRQ_DISABLE_ALL = (2u << 8),
+	SVSM_IRQ_ENABLE_ALL = (3u << 8),
+};
+
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
 bool early_is_sevsnp_guest(void);
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index c1e31fc9c918..a6d4e5ea0913 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -544,6 +544,7 @@ enum es_result savic_unregister_gpa(u64 *gpa);
 u64 sev_apic_ghcb_msr_read(u32 reg);
 void sev_apic_ghcb_msr_write(u32 reg, u64 value);
 void svsm_register_alt_inj(void);
+void svsm_config_alt_inj_vectors(void);
 
 static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
 {
@@ -654,6 +655,7 @@ static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPOR
 static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
 static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
 static inline void svsm_register_alt_inj(void) { }
+static inline void svsm_config_alt_inj_vectors(void) { }
 
 #endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 35b8641119b9..7082fa10d5e6 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -796,6 +796,8 @@ static bool sev_prepare(void)
 
 	svsm_register_alt_inj();
 
+	svsm_config_alt_inj_vectors();
+
 	return false;
 }
 
-- 
2.43.0


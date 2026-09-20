Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05823E334
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928307; cv=fail; b=eLnvIqa1pvdWwjWnVpfaSdCenSi7qA+QK1aoOfACbbDsOqxR/CbvSZb8QVZkzX7PlHybAsZkvWvALIBow+GttoYPOjc28Hf+mzygKpjjEwS35SyIIDxwp8UB4BdjQYIAEI0DXcdObCnkyWrcyMw83kKeRATJX9VRTrcn79WnaDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928307; c=relaxed/simple;
	bh=2dUfN3XJKQjXyiXMGXLXxUZVRtrVHbnHa08Tm5dknfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLm8L3C8vH6d3v4XmANK4Q3+bVxHRpr/7yCQfv3ZKuqFd72VAaHYpxGHVpOMGRNJrEru+6N63HQSED3tQxDw6NTYSSym2wwqaKpfTz9S42tsEyY0qUckaIN/VqyI9Qm22r8DZcy4bfJJGKoK+EjJY70vWhvus2N4JGKxspKxxUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lq2DoZUu; arc=fail smtp.client-ip=40.93.196.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lq2DoZUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zyz7hbt6hwTKXivdFouUA47XWadrLQSZbkIgqGZiJHtNN7meix8b7NkMnXhh5tntwCtHDsllR606bU3NwVWEun9FeSa3HfoSdhfuNvL1xplrvriqDC3D+Z/ceYj9TVFCA05DJCPkrse1EQXtDBy+iFlSsZn8e9btJXnzSmdWbVbA7lyxe0qjpMqwbKqTORVMt3yHXG7gz8HeSiVo1xRxpGocJgaSngoVKV9tlBvnT81iLLDsCwh9r75aK5ZM1n+NVfq5YRSY9QWbPKQDVLX6C9HZLz+BmlmtosUxCiwuLVxIlXbqtHgSP+liDtP1naWHJ/ZKJ2dJKkYJ/Ctpn+23/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMqj8syPMkgPq2bSlIWExWed5I/gcyrrMslAwabJlGE=;
 b=RNCCIT8N8m4ZIfK6tf873phfuzJ5MkbmMs8l+/oUNfV6KKB47V1IsEmwrrgI/zw3N4MU0pTNVmWmSMHTZfeac8oTRTWolBLAG2qIS0Mq1pttwhDAgcGuYZbNHCXwkELO6nSkA4IghymIJiy+35iFUTu7T5Q/hONdpHXnA4sm5jmuzVt9Cf3X5trDeXnQwPyNTGRNBtDClTjct6v2l0z0E/ytEBekJQlOnvpMYwThKCH+WUAkPnT5njTFcKCXGi+dfttBniBgLJX17lU36BF9SZiGMzHSwgT+e0jYyZqvtlhs5CyxNMRZ3aQNq81bsdWdrZEw1Q87wqzM5G10XPhm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMqj8syPMkgPq2bSlIWExWed5I/gcyrrMslAwabJlGE=;
 b=lq2DoZUuu4bwJF0SRr7TuqAIT/IY2gIuHQ9ANrHFx2uNfN1V8zuGxWiWYFm/+DC/ChAi2aBD6MW00EDmtA0B+yNf5QFdBEf5rhI8A2Xw8Gme0vunaK99PaImsFx+XPkHAZEyPwZ7SMsA7vScvobslYptnBDHF5j2mBRZkHYtcIY=
Received: from BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:18:21 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::98) by BN9PR03CA0380.outlook.office365.com
 (2603:10b6:408:f7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:18:21 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:18:20 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Date: Sun, 20 Sep 2026 18:16:58 +0000
Message-ID: <656edc5467df7d8c33676f0a80c3042885d95f9b.1789927246.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|DM4PR12MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: cd24b47f-84bf-47cb-b6d2-08df17438d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|56012099006|3023799007|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	umEjH07tirT6td2dDgbwSYUkyphQ5sOPzgP29zpBjawRlZktfvMgCjvcNWTj/G7347c7YoGor0ZtqFSBqU8V9G1LkKPjVaIDG4thBr4IO/0Itb9dfr8iMFyo8jmaxNUSuBQ0EKSr3Nh9zY/AA8AUf27VkG/Ut5hIvvMEs3RwcVCgxG+lGdbf6nzNRCqeUT51YgStfQTsmev2auodpKySZ91J504FzGRG179F+2VRclPRHUGTJj7BCzZsR4stgL0JKYpV59vdhRBzU69kkdKG3EhPk62oAAXOmnP+yvsxvgCm1L1FhL41SLw16yxYZN7GGnR/MK+P9K5iLRpP9ldDczdkgGIjh+40WgBn06RN622O2HZwBzBSWNpe/fOC+siVQV2m5nljo2Wqc5T60J8ckg9C5htSLA0e/pSBlN89rBkhKGh6k/BIzsF/0ACveYYNgohCYYXxAKqlY/0k0puW80673Q634ySXkoWqzvKjxouIrgQpklAk3QAWTfLJRWm1t9wOndlA1mA8TH94oW1hwIaxkRh6DJHLN2SsVbyS0MOjX1MGn8xOUiR592jJS19WmLZLuO+cxZxmfsCBIihfIJQZqqgj9wLU5FalLaDv9XK3hUzjn7LFWd68ZS/EAAXaq0WWr1F25AqDYtrB998M7LiQ84+3ccospl0kfTE6tsiBjGw7jeaKRdLj7JSEbcLByLjzZrw2Ph3mERzWsSN8MA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fqmm0O8VjPIkBptNzQdJd291CXlw5lsqPVeAcFSQitgfGVR0adxvqE4d4GtOr8Li/4kX6O7u2AQXST8qXyG+HAYlnJvCirhlrlS/KJC51rYJEnwPd8lOPDupE4ES6G/oBm22Pb2o/ac51mJvjMm4hnPMUTgikB2jCNMyzb1jCBKigTKCerXayP/Wqc3lHbbN59IEtSu5YfvfQ+GaHZkzR1s34GF0j/oa8cItGeLeyURahAIQk5QiU8r/Y8auNEr2jIysyMZZojn4XQ7IAYr/lKJBBtRKJQQF21HfFhfCi0op4dmI7TI06amaL7U5R9JIICiqib3PznM4khzW3u+7vMxVY0FFptArbviRROQ5Mh1tNjIhxJeyyBZm7hbeMKnkYYxHVnB8Zmj/kgHIBOdyMt4/ZrzbP/dDjSIyLB//MqcgpvrUpG5u7jz8oNVwAWYW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:18:21.4344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd24b47f-84bf-47cb-b6d2-08df17438d8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350

The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
(shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
the controls whether the guest can make use of the SVSM APIC protocol.

Implement this call, and register Alternate Injection for the guest by
default.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c          | 23 +++++++++++++++++++++++
 arch/x86/boot/compressed/sev.h          |  6 ++++++
 arch/x86/include/asm/sev.h              |  2 ++
 drivers/firmware/efi/libstub/x86-stub.c |  3 +++
 4 files changed, 34 insertions(+)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index fc2029746c50..9f776ba7f123 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -511,3 +511,26 @@ bool early_is_sevsnp_guest(void)
 	}
 	return true;
 }
+
+/*
+ * When the guest is running at VMPL2 with Alternate Injection enabled,
+ * register Alternate Injection before ExitBootServices().
+ */
+void svsm_register_alt_inj(void)
+{
+	if (early_is_sevsnp_guest() && snp_vmpl) {
+		struct svsm_call call = {};
+		int ret;
+
+		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+			return;
+
+		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
+		call.rcx = SVSM_AI_REGISTER;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+}
diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index 22637b416b46..dd058af2e7aa 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -12,6 +12,12 @@
 
 #include <asm/shared/msr.h>
 
+enum svsm_ai_ctrl {
+	SVSM_AI_DISABLE,
+	SVSM_AI_DEREGISTER,
+	SVSM_AI_REGISTER,
+};
+
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
 bool early_is_sevsnp_guest(void);
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 3cb6c5d6a6e0..c1e31fc9c918 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -543,6 +543,7 @@ enum es_result savic_register_gpa(u64 gpa);
 enum es_result savic_unregister_gpa(u64 *gpa);
 u64 sev_apic_ghcb_msr_read(u32 reg);
 void sev_apic_ghcb_msr_write(u32 reg, u64 value);
+void svsm_register_alt_inj(void);
 
 static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
 {
@@ -652,6 +653,7 @@ static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED
 static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
 static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
 static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
+static inline void svsm_register_alt_inj(void) { }
 
 #endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 49388524a61f..35b8641119b9 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -793,6 +793,9 @@ static bool sev_prepare(void)
 			unsupported);
 		return true;
 	}
+
+	svsm_register_alt_inj();
+
 	return false;
 }
 
-- 
2.43.0


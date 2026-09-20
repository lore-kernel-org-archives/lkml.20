Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF903C7696
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927989; cv=fail; b=G+hUCwfPS4NokXx8fAempRfej0gql7+c1TnBG5uSBsYARYQXid9ukshOFk/0mtKedGwGxizftNVsoYPwcb+4a+uO/Fa610b7HI7X52AHiMeKdywGPVxJfbjz5KgMfZBaLkQ7VX0ZAKefwZyl51NnrrSY6Z8p8Az+GqBCpzy5sNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927989; c=relaxed/simple;
	bh=BG09JZIIbBetqTJBcI+aMtI2R1MROzajIXtuDopScuE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6k6NAIsQ5V921MOMhmL8sp7gFTmNNOsO0jYXrDnflbZfs1vz0fAhDcl8TGjTEziuqCdDDv3utNw2SiXHwKGvsdL2i8xwNW30X0zWHgJaOg2jk491aII2ynXv3MNOa6LGG0GOOWR4LFolE1hDheplguwNj7s77i44Yf4MsXEzso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=20UjcTHT; arc=fail smtp.client-ip=52.101.53.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="20UjcTHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNEfOruuW0iodqDgUGafCkCCxFz4UpQGaMb+rHKHWHUXyOrzHQLKaeAENSg2Xqz2Ec5odTGBoiPTR+iR9svaIH74TkUB/KeCtohdIjJHMoxHgWUNJcURw6p0WNLS5RvwESjfEXXGysxBI+y/N7u26jQwOSy6ufQfRzrvVJX5187LWeU6dHTxtM9SnlviJURnvZ46i8yDiVLFUOWDi8Zt6dkDx5JpqY3/FKzpKJjrmrdiYKcD+1bUSzO2a+19HfBpD0gf3mVe9xLuCyw0Nx+y5FqRkgG4gXdE5gDemo1J3fqUWSDvKnidJTxmipGENWlRJyIIbdV4WZa5YuHth1hA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbbXdWdkIWLt257qHN9QSYT+vatWU5Z6dSlGF2hC1A4=;
 b=DJUwMN1ddVV7nJt4M/zvjckCXH0puOZEtr14nIsj2bUtEiQPf6m2utT2l2yZkp3HUM+ghL6rxeoeZqcfKEsY/j96VFSaUpkkdR+ekvOF9+17g0W8rQ6pjIq+zs5er0Tv1oqqMjkkX8GcPHC5V8nKcCgxKzS0qAnQtyERB3rto4CLGnWHYHHB5on263LlQc70qVfL1HVW9TPOI2PaSRuadAEyDwGmy6ywveUx95Isg5JYiuJ709PsHgFVnnZkRLzoCZ9TrzEg+huFkuODLaBRi4MY6FiTKgUb3UOCRNu4Z7wPsNQ+SbsrvxO2nSDSNxtGXa4b5UmEhYbcOwO8eQJZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbbXdWdkIWLt257qHN9QSYT+vatWU5Z6dSlGF2hC1A4=;
 b=20UjcTHTzxoYAC75dO2H99gYI8ItE5vvwPRbRebiR7m2zXTlQ2d7B92xFAjGmIP6rFD5TZl6hq2fNvtPPAMOn3ffnvudweiUKHruQhkOEZT/WXvjURreuW5M1nsrw+7YW+3hrOADqI4FFGg76/COeAV1+jPgwT0ux8KtTi+nYA0=
Received: from BL1PR13CA0183.namprd13.prod.outlook.com (2603:10b6:208:2be::8)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Sun, 20 Sep
 2026 18:13:04 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::36) by BL1PR13CA0183.outlook.office365.com
 (2603:10b6:208:2be::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Sun, 20
 Sep 2026 18:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:13:04 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:13:03 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v3 2/8] x86/sev: Add support for Alternate Injection
Date: Sun, 20 Sep 2026 18:12:11 +0000
Message-ID: <665c16b5ec7fc020ec9605c89baa9371d9e01b5e.1789927246.git.huibo.wang@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: cd12956f-70da-499f-7eb3-08df1742d073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tp/Qbm+oXGNvl+ioMszY469pY8SHhDjBTbasu288MG0W56eD/Qgx7dZXr8ylw8aRJy3PJqnnaFWcVcVPVcbxzYqJO2zAGRd/FRrrtjS+nPvQRcqsWqxo2FlFtxTWr4hOzbEUdoYLNjweA/0pTZuH5RvfqKnU3+tranjp5oOWaV5yQgY9jNn7NKFVXTjKUb5hYbY5TPIUuxj2HVGtFTpScdDaFD+bi6hBqwQbwb+Jo35paHMqpgsnBGIiv0L/WNrv/wRGYNlE+m2HtjxFEHAo0ol/Y+s6sfKRSs3lJt1of+mOF1J2LidKexRYDpaKFRdGb03kahQ4H/Q4wop39YDQY+534autYNUB7AaG1LW0RzqQQsSrlwlytN33AQnJOu555l8Qbsb8Gct0zj1bFynFnk+5sOoguhC5ogVbfbQQJl3nMnF37heIKj2o1gySaClK3qQpcyZhQcTplWe2f9h+mkOBLlTX+Ett88eQTwtNA/EgvetuuGrxRDkt7YDUsW7YmAoJZM02RsKtMbL9Eq3VvO4/H/adbPfTA0/guo1fD6fgZ6jXZNYrAcBZVTMinAy+q4CPFmZIR3Gwepa6GUj63jmGvPFt3vcW3XmNfXVRf9WkXFjpymAHqYTYN2fOw7ZS5KSvQmLn1UGeDaqdTeaePf1tAbZ/oHDm7b0jtfXKdHoM0DhF7Os31oRiPWmpv7/TkuUCQMfffUfk7+GUu2di7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SNXzlnpSqr4ZR6pVq+2xYqFLZ1Ib9BQ6+y7LnPfET6jhNWGnP9KszrTHVzVKWZnfV8ejFPtYpyLZsji7WGZpfLRPFiGZmN31egewiQJrZ/JRa+hy9GvQ75vEgtBHoj8xupVTN2lTfE8XWjyOlR7fnCPExn54wfk2IqNOs+mWN5UtT5L03PUSrYlKa3hCIDCPWncPYZhLHa1g69acmigETsp4o4GGqBvxMN55q296c0T8/NG8uwB9b7oK+zYx9KX/ed6G7Vnz7ewummSbqI7OUq5imbmSsSv8SO040Z9ULf1aZwL10HMaG7wwW8tqXP4S7EGc7BWEsHjjtR8zW/SSTjCy4TkuS1AakwRew13s+Y0i6H7UYsybDKyF42TcG42cUYJN+jkYF13yd2k4k2v43IzV8SWhb+zpCf1MGqBOvT5x2CnTvKnalc1KP54p4pqH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:13:04.2069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd12956f-70da-499f-7eb3-08df1742d073
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097

The Alternate Injection feature is a method to protect a SNP guest from
malicious injection attacks. It allows the guest to control the
interrupt injection.

When this feature is enabled, interrupts are injected with the help of
an agent called a Secure VM Service Module (SVSM) which executes in the
security realm of the guest and uses Restricted Injection as the sole
method to receive interrupts from the hypervisor.

Add support for Alternate Injection.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/Kconfig                       | 14 ++++++++++++++
 arch/x86/boot/compressed/sev.c         |  2 +-
 arch/x86/coco/core.c                   |  3 +++
 arch/x86/coco/sev/core.c               |  2 +-
 arch/x86/include/asm/msr-index.h       |  4 ++--
 include/linux/cc_platform.h            |  8 ++++++++
 tools/arch/x86/include/asm/msr-index.h |  4 ++--
 7 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5a84998b6021..330cf9245342 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -496,6 +496,20 @@ config AMD_SECURE_AVIC
 
 	  If you don't know what to do here, say N.
 
+config AMD_ALTERNATE_INJ
+	bool "Support Alternate Injection"
+	depends on X86_X2APIC && AMD_MEM_ENCRYPT
+	help
+	  Enable AMD Alternate Injection support for SNP guests.
+
+	  The Alternate Injection feature of SEV-SNP enhances the security of
+	  a confidential VM by preventing the untrusted host from presenting
+	  unexpected interrupts or exceptions, while still preserving the
+	  standard interrupt dispatch semantics inherent to the x86
+	  architecture.
+
+	  If you don't know what to do here, say N.
+
 config X86_POSTED_MSI
 	bool "Enable MSI and MSI-x delivery by posted interrupts"
 	depends on X86_64 && IRQ_REMAP
diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index c6512f2ea31e..fc2029746c50 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -179,7 +179,7 @@ bool sev_es_check_ghcb_fault(unsigned long address)
 #define SNP_FEATURES_IMPL_REQ	(MSR_AMD64_SNP_VTOM |			\
 				 MSR_AMD64_SNP_REFLECT_VC |		\
 				 MSR_AMD64_SNP_RESTRICTED_INJ |		\
-				 MSR_AMD64_SNP_ALT_INJ |		\
+				 MSR_AMD64_SNP_ALTERNATE_INJ |		\
 				 MSR_AMD64_SNP_DEBUG_SWAP |		\
 				 MSR_AMD64_SNP_VMPL_SSS |		\
 				 MSR_AMD64_SNP_SECURE_TSC |		\
diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 989ca9f72ba3..aabda3ddc0e2 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -107,6 +107,9 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
 	case CC_ATTR_SNP_SECURE_AVIC:
 		return sev_status & MSR_AMD64_SNP_SECURE_AVIC;
 
+	case CC_ATTR_SNP_ALTERNATE_INJECTION:
+		return sev_status & MSR_AMD64_SNP_ALTERNATE_INJ;
+
 	default:
 		return false;
 	}
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index cc292d7c6fd1..c54269366278 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -78,7 +78,7 @@ static const char * const sev_status_feat_names[] = {
 	[MSR_AMD64_SNP_VTOM_BIT]		= "vTom",
 	[MSR_AMD64_SNP_REFLECT_VC_BIT]		= "ReflectVC",
 	[MSR_AMD64_SNP_RESTRICTED_INJ_BIT]	= "RI",
-	[MSR_AMD64_SNP_ALT_INJ_BIT]		= "AI",
+	[MSR_AMD64_SNP_ALTERNATE_INJ_BIT]	= "AI",
 	[MSR_AMD64_SNP_DEBUG_SWAP_BIT]		= "DebugSwap",
 	[MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT]	= "NoHostIBS",
 	[MSR_AMD64_SNP_BTB_ISOLATION_BIT]	= "BTBIsol",
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 428eb44106a9..bedc9a62d0b4 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -728,8 +728,8 @@
 #define MSR_AMD64_SNP_REFLECT_VC	BIT_ULL(MSR_AMD64_SNP_REFLECT_VC_BIT)
 #define MSR_AMD64_SNP_RESTRICTED_INJ_BIT 5
 #define MSR_AMD64_SNP_RESTRICTED_INJ	BIT_ULL(MSR_AMD64_SNP_RESTRICTED_INJ_BIT)
-#define MSR_AMD64_SNP_ALT_INJ_BIT	6
-#define MSR_AMD64_SNP_ALT_INJ		BIT_ULL(MSR_AMD64_SNP_ALT_INJ_BIT)
+#define MSR_AMD64_SNP_ALTERNATE_INJ_BIT	6
+#define MSR_AMD64_SNP_ALTERNATE_INJ	BIT_ULL(MSR_AMD64_SNP_ALTERNATE_INJ_BIT)
 #define MSR_AMD64_SNP_DEBUG_SWAP_BIT	7
 #define MSR_AMD64_SNP_DEBUG_SWAP	BIT_ULL(MSR_AMD64_SNP_DEBUG_SWAP_BIT)
 #define MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT 8
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index 559353ad64ac..80d9f1de2ae8 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -104,6 +104,14 @@ enum cc_attr {
 	 * to run SEV-SNP guests with full Secure AVIC capabilities.
 	 */
 	CC_ATTR_SNP_SECURE_AVIC,
+
+	/**
+	 * @CC_ATTR_SNP_ALTERNATE_INJECTION: AMD Alternate Injection enabled.
+	 *
+	 * A Secure VM Service Module (SVSM) has started the guest with
+	 * Alternate Injection enabled.
+	 */
+	CC_ATTR_SNP_ALTERNATE_INJECTION,
 };
 
 #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index 18c4be75e927..e4eab2210518 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -721,8 +721,8 @@
 #define MSR_AMD64_SNP_REFLECT_VC	BIT_ULL(MSR_AMD64_SNP_REFLECT_VC_BIT)
 #define MSR_AMD64_SNP_RESTRICTED_INJ_BIT 5
 #define MSR_AMD64_SNP_RESTRICTED_INJ	BIT_ULL(MSR_AMD64_SNP_RESTRICTED_INJ_BIT)
-#define MSR_AMD64_SNP_ALT_INJ_BIT	6
-#define MSR_AMD64_SNP_ALT_INJ		BIT_ULL(MSR_AMD64_SNP_ALT_INJ_BIT)
+#define MSR_AMD64_SNP_ALTERNATE_INJ_BIT	6
+#define MSR_AMD64_SNP_ALTERNATE_INJ	BIT_ULL(MSR_AMD64_SNP_ALTERNATE_INJ_BIT)
 #define MSR_AMD64_SNP_DEBUG_SWAP_BIT	7
 #define MSR_AMD64_SNP_DEBUG_SWAP	BIT_ULL(MSR_AMD64_SNP_DEBUG_SWAP_BIT)
 #define MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT 8
-- 
2.43.0


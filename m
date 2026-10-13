Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA97489FDD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913889; cv=fail; b=g4EcKcEvj310d9+9sJMkRwiG1ceGP7bY6qEhuSS50k21hQAkpKEVGexx1CuoFEDkaL4SqVmoGiEDXSDBNo8/M+Xr59V45md/5JoovgbpowMeFLXhgUcdXH+gxeFllWQQXlnQtyQbd6ukK1+LAC+GI7wSFz53FCpQ6B4banPz/lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913889; c=relaxed/simple;
	bh=+QIwEiOhOqHRNgoZp/W5kBXPA1J1Wushhz0KV8UxGUw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBGOqaNkanfFZd/k8GAJ7M0QYGaflrZvkkXk1eg95l6jn1nzd5qLOYegQUmlEiLr9FwTcEA5Pqqe0XaHTfD+9lGNQIfRrr/Vaa5lKk0XNaZUQtTXsPIKtN0EWFa8wor6bgOAdzjQgNIDjJc6AHQ/TFzfyCLz//QxR4HKceTHc2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XAVNVMNe; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XAVNVMNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS2iyawNBm4mj96lftuljiPTmmz+yYOU1PJ0V+PyATnfGelbv1EAPcoDK70PNnoYIyLfYGYoyBFp0PUbp3ECjbB9kmUifUkCnmCZ9/Z8j4n/kkUIQUKvC6OcwXuCoR6Dq7jjhl7+eWrt8o3rYAkTwLy0ZPU4LpoFu67VmwpQxulc/B1tRL1b7s+oAYqZknGdqgkGFq+kaCaj8fSOCIWDKLKM9gqhyIlqf8hvPLQfg+F4W1l+ixf4trPF6x7LOzuOeeQt2DArhHOE6Qi+rl+IsE1/KSCFM9iqoeiIeSh2o584DriTV4FwIB3jD+6WZBiIa4xxlL3m6DiNZ4R5h9qM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc+2yBSGwjL2He+cmSxMSDP+j0j9ionMb7nVpKMcjyY=;
 b=A307dNwLky+dISHXWqpZtGDGE6Zep6hM0qo1wVopiRULy6WCy69+IE71TrjDc3zq/hHxnRvMDcDnv8uPWnsxkrSw0LM7+SnB0Eq7odQgEuNIIiCSvPu46zBg1KLU3uQDQ26vQ0dopmxb9WHe4p5eJBiOCSP1u97ly8k6NArkJhhNOy8ov3MHSeAiI5jCSzfSZvYXxoUa4RWy/Z+Ogtt7znMxf/MT4948iSywdAKtT5qH7NQrJ2uIgDo1w+qQvugOfn+MYTjaS8OI048+ZrM3/XdxviQtlI3sjgkUQzcN6jtMOSxYm9PkRBFlywqs2qN2lfvTYjklDkqL/pQ1JlM0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc+2yBSGwjL2He+cmSxMSDP+j0j9ionMb7nVpKMcjyY=;
 b=XAVNVMNePvH9MnWZNxja58nWZOViuqiptON/3ckrqiMsHREoZjrdiZXmqLewcs4fsSTLelKaxsLjyJyB6p85t/DRJ7K+fpTQuf9QOUEeTPZwp/yf/FtS+YHuB17a74N9FUXsrET6CL3LJVMVqm0CNR+wSSgfRMk61qtECwTcSwA=
Received: from PH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::32)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Tue, 13 Oct
 2026 17:51:21 +0000
Received: from CY6PEPF0000004B.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::62) by PH0P220CA0019.outlook.office365.com
 (2603:10b6:510:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 17:51:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=temperror
 (sender IP is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004B.mail.protection.outlook.com (10.167.247.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:51:19 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:51:13 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 1/7] x86/sev: Add support for Alternate Injection
Date: Tue, 13 Oct 2026 17:50:48 +0000
Message-ID: <fbfe17098b8ba7dd4e55746ae98da5f793549d43.1791912902.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791912902.git.huibo.wang@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004B:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: cc56deb4-8ac5-4a69-f052-08df29529682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/BrGO5RL7sIXiWCS5eH5ALhAz/Z2ZSS4Plct4EhB46Xo11k5pbszMhyTWENb9rLEoRBGxrAqXGRfto+VnqmtePLRBWrf8dlvjq35oESJ9r3T3J/7MbbJT68MLpyZkv+1t29jRX+mAIQFpBE9dF3/tv3zj+G6hM/jgZst4QHahvbdBSf2Ip9/Qdx2RQ+63rW2VnoYceuoQ5xgihV2TlvrMe2qxSoBs2JVFXBA0rpVKt+jHHHDaorNhbNNTcJKOC4tm9y3CCXdCgEI+KeFUhuAaM73iu8nf4voYKD7eZEvyPAZkEoGcd0Bv4uLW/4ZLYSXwt3QgcduBJn1SnWCwEvKdWfBJNSpliFxqqWGUKGDNvSBdWbI9Zc6hZKksSlBYCbjtayaaXRQMQ4ndsjkrYT/M9EsbNgSMX6st2ufh4f1RIMjgaqMPI0QdPCYLmHakhWli83/eJxezQ6LppnKAurN9n6t5ZfcLg/XYFX+R23rEBvS1epXe4IpAsa1Ss6SU95PcD0+zyMoQwMEzLcSVVp/v2rHbo2sA4eF7z3mkbQ/ifXXGuTlB8YACcC3hGZGDe+eiowZq9fMw+z8SEOaf2M04QhHyMsOThe3RNGCVCndrRSvMzA8v2avWzurrACbhwX3oKiCfmpXBw8zEWtsYHiyzrCOoVu1QrUf78tCbL+34dMjpkrVDe3Up6Eo5nbXoDLzxt4VZkAx7W/EJ+oKSAowLw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RZrP3hCGwbIfXa03TRs9r5655C6bTGROrtypcSA5m3hd9QzsOzh9LAYydfpGKxMmBobiImfrNV6LWJhgSR8tS5yCbMKz/8tOgs18nqmL9dxs5DwI6X/vxiztZ/dyWp33CPUUbb+IwUJ+09hJ/xrwM9l3XT+FC936kwNayq/2KDBIm2WPQGAFltOuWrANFWiN7ZAYGLUcCea8+hGOGOj4lHX58fOL9nhIRfT0Tg69DD/NXKgBvbkkRay12DCUeKOzJPhDDzTSf2cxE8FxUW9AKmYyowqi3QSisfHGCjPOYFjcnGKvf+obQVj6WA08pIhvZ1L1oCEzr8jz9Hl9gw7fKwhRKeaPSnc3ywyHTUm8e1FOuj46u0kLZvl52zCk7dH6bLrC3XdAvOVsXwRPZks/DobJvXBDBXA4d/neEoaYCQH686dCh0v1SjycTSX409Wm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:19.8232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc56deb4-8ac5-4a69-f052-08df29529682
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

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
index a47a6beebfe3..52d627bb33f4 100644
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
index eb2e853e950a..900a7ff8b639 100644
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
index 82ca6356dc62..297c7dec795c 100644
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


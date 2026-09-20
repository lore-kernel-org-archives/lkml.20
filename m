Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C403D8901
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928262; cv=fail; b=s7zmriZERpigOYPNdarPa8zy9DYMops8F8o4B1QMYtNqAj4fzcasvkbvOqzjI7ZyBabpHYLEA5S7yYH2qbTLSUccRHm/+cjIjo3saJ/KA1i/QXP5lgKCQbAeCexuYhpcaZulmH0p6CZZDkFdeHCJiRYIIuLDg0oVdPWQKV6t2go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928262; c=relaxed/simple;
	bh=BG09JZIIbBetqTJBcI+aMtI2R1MROzajIXtuDopScuE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lidop+7JjPRIWGHgwWJh43AaF2JqU2D0HtetPft6GAIwvlE9DoQcolFeZrAi4g0unPMNSH7GoUWdtwvSmDnJHghxYVtwcTXNcrwNnFoG5Q79cDgM3/GIInWIjpHN9/yixeZUSNXKQnreyZfcYyHVDaiaEWtWAHpqezobDnP9aeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qaaKLnK5; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qaaKLnK5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtubdTx235KvgooW/qbgd3STambUSVSLxUU1uRp2tt4NNQnfiLcMqs+s9ZyGDXrxGPd25pGvUbSUrbIhvP8SExsXDDBZUBPiyJKBEy1s04/YV/3wUJkFy8d9B9SPFo2ZZ4anfb2XLQbqKWv//2ELx+BFJhrieWawWxQ028o5GifPzkwyAXR6iG4CP5sSrDmmLgFuWyaA/COxnMtsh2RIth6c4HZIBJ1SR7BUJhyuKjTMQq/jVfmox6WQ2/VHseHdG8yO90qbD37WtkyuqePdj5HkqREF2vEDeoeACs7e/rErvzsXoELoWk1rStkRoUkfb7BJipWoTYAsRw1PZFDFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbbXdWdkIWLt257qHN9QSYT+vatWU5Z6dSlGF2hC1A4=;
 b=GnYNAC6SimNrclePvZnsuAOCM0IKFnP38g3tdGKY4fsEcN4Pr2SShXzDASerZIDRf/Z795+xiTdYB9/+VHBpVOXL4M5LE27H7If2WGcwmSDcdqBS37nITYo1PO+UDoVu8zm2xuZJCCLptWxO9oiD9uK4YX/XrK+jocGvoMKGTpYqd9yjW/DV5XzNi80TkKrTLHvaDrOPUC5A9EbPe5MNIdl8PpgeAhVoJ8ENEOTriawa0ewdEHYIgUXKr5fK1WEqFLugEpnansJkBzs/FaYdljGtyefFg3Au3kFr+9N1zUWStHKJq64UOJhQ86dJXikqqbuvAvhDv6XLL1j4KHxCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbbXdWdkIWLt257qHN9QSYT+vatWU5Z6dSlGF2hC1A4=;
 b=qaaKLnK5+qzQNpYwr4q/6Yp9Uea8TxARqvF+Teb0c/3e4SRgbHej3GyqqQAQAZlLLV3uBat8kf7l/+Ny3xp63koS5LctWxrL1YzNPx/ON/GpniaoLHfI7uhvpyA4YCRbe7cthtRjV3iZ0bG6QgMxFbBaGeaEEEaSCnSgCdun0L8=
Received: from BN9PR03CA0447.namprd03.prod.outlook.com (2603:10b6:408:113::32)
 by SJ0PR12MB8092.namprd12.prod.outlook.com (2603:10b6:a03:4ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sun, 20 Sep
 2026 18:17:37 +0000
Received: from BN7PEPF000000A2.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::18) by BN9PR03CA0447.outlook.office365.com
 (2603:10b6:408:113::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A2.mail.protection.outlook.com (10.167.248.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:17:37 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:17:36 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 2/8] x86/sev: Add support for Alternate Injection
Date: Sun, 20 Sep 2026 18:16:54 +0000
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A2:EE_|SJ0PR12MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0b27a5-d525-42d9-9853-08df1743733a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	U1nrmBVZXCSa9/dYa3RwEW9qW9POMzJZrNZsfV7uukw504J4mf8MEgDXR4mTAOyIrLI2gSxcDXrRukpxURHG4XjRNZMYb+Sq31U/PunBGP9Z7KfF/cubJ+gcgSMwj7Euau8WuYJ1vfPrvL5AbIPcsnnMs8ZNKgT/Il3vUbirjClUmzrw6Tfz5RF9qpeUTm8e/hHHkOGf5ADiJfZzOnlpTuMtjivMujBxN1N2vUCJ5tFWDAFMVvQKbo3/9Wa98ZSXQTlNEjD29rGOzwex14MVuUBiC4+WFX0e1m1gJZMCvKO1XGadCLiwPntBkPYE42dnnvf8W7BKPMCA0XHrTO3kysrIes8l4GbvIpOZlLbC0PxdIldIWRC6desKN17+VpW7WCArbWndirySr4pUG5ZFl+CrsS0O/wvHh+pMkQplOcRwLtDjztTtSpY133QArc1SLF/2QhHfdcUEj+VrGNbtoko4kJ3H2Kyx8L6FSqotC3dAbHyuSlqqz9ncVh7IKb8Tw75XPFBlp2x563yOkDEjF2z7BoZp6WBafEMyIYE3czttGDyK/2la4W0qMY7XWweM/7zLJ3DynlPvwpHb4K+vC60cv+16bdgUJcB2Zq/wt77LIsBKVkuaC7aiDScSPPHWBYs27AH/KqMSXzteZAAa+7VmJHT8TqDFHNUsB0pZ3NOFVw9Kq0nUsU24TMoi1rLWB3xDXBR7BWjDPgF762pgqw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EvMV4CwNddxmi1OmOotDiDjCZ3jBy/dB04/t+GPoGh9fogDO/LRaEwbuFHsy44AeNDx41hhcrm88/YvrPeqMGfrcGsOaT8dMF2Qe2i35gX/MDd+H+wERul5sS1xRW9SiprFZBjv4Fh90sGzMhU6cRtzulD3qkM342P9LfzD+Ss2sorSoe7zSMybKniItPj9/ONAn7Io0EOG5RtChruLJ+ks5EcVdnqgKyey9+bJUPpHiK3iACMHgMFxCXuIQTSjYOMaXa4DRdFTXyRPAjSbQnG6lecbPCWgXalrSaSGNly0/u/XavS4hQg88Q2GP10zrf+1TAMLlnX1v6uq9FFDQPszlsl776e3Buj5ww0h3NJBHeEPnAfts7lRKHM2vrvpGH8Wnv3D7lbqcRuNU6DJBQ53DLgm3+JYdVwUSGCRRNZsqQc5Y4FcVyA9JY/e/ShK+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:17:37.2938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0b27a5-d525-42d9-9853-08df1743733a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8092
Message-ID: <20260920181654.YK40hd_4xZvPkYihhR0OJgwGf2C4V72GklN9ZiP2c-E@z>

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


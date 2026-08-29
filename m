Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92B33120E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974831; cv=fail; b=D3lYS+p/OH4CdFPmf8xbnBs8KTQbb2XIYaZlqCv9zBWLy/9C0yu0Ly64Xb3j4C4lGlDknAke03+vRMoEs6sMC9ZAFty+PW/HOsTmIZC5eaYnvrq2y3x13WprEArwx7TGVSZhKpeej5jtUCMwjvBvOwkJYrCHBuV7/YxLnmo9nwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974831; c=relaxed/simple;
	bh=Jqh9QLeNpPww5t5OEXWqC5N/nh+A4WEJGHsn6K/JXDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADmutqKHsK15kKgt/lGBNNv73MadTPf3r9gJSMs5m710IGmzok2x24eQaYbkElsw3nEwU+33HHo+ozBY6UzJ8O78c/MJtD+jYfzzU2FmDnJb/Yn5VCk8z4Xsvu58y/V6U4iK8jhhP4VpazyQYrzHBGeH/mFM4Mbfh/tyJGc5i98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DNsE6IAV; arc=fail smtp.client-ip=52.101.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DNsE6IAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQtNNiSJjoYyBG+937bDQLqkLXJWC6oNtzC/aYkgYqZb0iy/aD98n+S/65Cd43WYLoMy8l5oEpD6uV5XJY+83uJLWYOQeWi0TDDkgNK+9qe2glAt83eQ0gC7V9XZt+7g40So749D1+HbGj/kgwwepwIhkQJsYUzTntCcaKBfRZ2uEv+NTd01ds0NKY7uElep5E42tONAXG3Tc4eqV3i/Kp2mE8phUk4dyCmE3mg1IkiFE/hTwmbCd5XC5el3sm5SYRTeZxlOC+AMBpt2PRNwda3XMk+TgMj/B3lo+uL970xkgE5Xk62A7MDL10v6603p8LUyB4GdDkCMGP8rt2kZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0n167kaq8itIKF01XDXGk2BPTiPL7pfLZIHBeGBBXg=;
 b=b/P+IbgSygiOjXKffE0f6jEprqsdBE1Ezx9Mzxpr9dyC2LaiL6Amr2D/vA7YGLlbQ9Cxmgzml3CxxgrQHCtUBH0qjrXdXzvzcR+X+dDxkgG+pU3/8ZJ1ziDInCDN5IllhtG+XBVip3W4p9M4K7AeDVZrSFfYhusx9EZRSkHU8uf20COsR4k/Qey3cPQlRL9l+8w9+ZauKVeNp9G/rXzBHiUUZhsczlEg9T15KJY8o2I+F5qeOYvz3lTpzOSUbZHnbT7+WaGXFe/a/ffvJQrUdKWGs7ZBMX82u8YFfPA2vzI7xRm5N0rUABHt/23GniARIrrmPQJuN5T4jUkrQhebeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0n167kaq8itIKF01XDXGk2BPTiPL7pfLZIHBeGBBXg=;
 b=DNsE6IAVGjwDHRnwPtgpZcjW7ANcKh+g+lZxTQ+NKSN8/ZRaF9InU15n0IYQbBVdkfKt5IJyvWUtA25u9q1WX1Xo0SAUCouDp0p/cTT4nZZjQjsU7wwFt87Q5qeXwXZBe7U2nyRWO3yaJpkZFfgEk83hvdcsi+nkAbdg/MHdHp0=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Sat, 29 Aug
 2026 03:40:24 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:2c1:cafe::a8) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.7 via Frontend Transport; Sat, 29
 Aug 2026 03:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:40:24 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:40:23 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 2/8] x86/sev: Add support for Alternate Injection
Date: Sat, 29 Aug 2026 03:39:40 +0000
Message-ID: <64561ae475103cbe9743793fd54d083a039a36eb.1787973545.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787973545.git.huibo.wang@amd.com>
References: <cover.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 8940fa33-8a90-4015-e5c4-08df057f4278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oxGvnCYHXJZmEbHXP12ov+Jc0JzKE9Oo9YHp19wBQQ2cleRI8J2FXowpJdIQA3jgT7r0npLE5gtNOckL0L6cBTM0aA0EvRsgkPVHhctSGaGm/9dfFY8oSf1evAfBO3wlkUV0BRfl5KFrCXs4MD/axPKvFLo5svFQYGP2lphSsARpPg2Fb68Y7van8KAyv6Oq+WWBodP+H/zz08111sAvKf6ggQt3wJ7QN9I9p/xOxPMogwERaJVahWFyyjVsTbgRiRlCVDoEgcrjwOvuTTGNqIG7/lxYapNLZr3A/luzHCYDYH+ioxOGgdta7N6tAs7R99RbHu/ciZIJ0WSP+M1BOJdzD2p/tfTvJ6XqPfmvzkBW+aBNrp4EcFn9skDbXfLDFGmiWRcvV3+TcKE0Wss67n1yEJGffE2LhrKxIyQt7LXDew3hHDnb0CfJM6zc8z1DBp8LU9R/KuhMioRAbTuUq/lc9QFO/lNd6aGwTAFF2u1Q8lrSHW585izMjdMqBqx6dKBBwf7ohChKnmHGPdqOZMYn4T7TTw5jkyJGZ4Cqcen7v/hrGh+P3yFFOmObP+7EWWhdyAWpjChOoCfDxmjsSA8dM+xl3Xgs8dvkT0TKjEiqKlL7+FzJ4Ktg/Oi2OSPFRdtIb/yxgxx32opJph0E5LQvCECdU35E/QK2K3tT1C2iIUSXZVQaSgnPK/Cl3tUnlC76xRvLe2KdLBKGstBNIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	02JkhBhDvGkqU/BokdiRcEVfm3NeNn9YSb/0qmVZFwMndTbZ7UJjeMviCw7LX3Tp5SP0UNHMNriUuwj8yGEF3Z4CTIEZP3djaP9/mVYwZlFb/dJHwFdsuHX2kTBbblpymI7yWOmWUhLvl9vBYgWegwcUaZ53U1EPPTgAgkq7tzCFfZTCAHRyVOd3+Q4APecZSpajFxORVxc09bDWtmFi7KshIMPYnZBy0wg5z3lMrUR4gKOnZEiN38pTQpAsHUzmc9R0AFNzvbAU8Ktd0UBb2OUPgyY8fcsOFcm93T1wKPNEq9mApKtq82nYee2S2VoPfp5C1NezCeP7PYzZ97vd2KGP0gd/EwASO91x6XjjeP5Unlk9DZx8GkvYFnysqK7CLzayPxfvkI5vD6nnWLYlPxxGSBgeQ589XfvRP0IFdzTbKuFYxf0qxbqAPB9mswrZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:40:24.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8940fa33-8a90-4015-e5c4-08df057f4278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522

The Alternate Injection feature is a method to protect an AMD
confidential computing guest from malicious injection attacks. It allows
the guest to control the interrupt injection.

When this feature is enabled, interrupts are injected with the help of
an agent called a Secure VM Service Module (SVSM) which executes in the
security realm of the guest and uses Restricted Injection as the sole
method to receive interrupts from the hypervisor.

Add support for Alternate Injection enablement.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/Kconfig                   | 14 ++++++++++++++
 arch/x86/boot/compressed/sev.c     |  2 +-
 arch/x86/coco/core.c               |  3 +++
 arch/x86/coco/sev/core.c           |  2 +-
 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/include/asm/msr-index.h   |  4 ++--
 include/linux/cc_platform.h        |  8 ++++++++
 7 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..6709589aaa46 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -497,6 +497,20 @@ config AMD_SECURE_AVIC
 
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
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f70ee74b5f92..a53e40a3982c 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -466,6 +466,7 @@
 #define X86_FEATURE_SNP_SECURE_TSC	(19*32+ 8) /* SEV-SNP Secure TSC */
 #define X86_FEATURE_V_TSC_AUX		(19*32+ 9) /* Virtual TSC_AUX */
 #define X86_FEATURE_SME_COHERENT	(19*32+10) /* hardware-enforced cache coherency */
+#define X86_FEATURE_ALTERNATE_INJECTION	(19*32+13) /* SEV Alternate Injection */
 #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* "debug_swap" SEV-ES full debug state swap support */
 #define X86_FEATURE_RMPREAD		(19*32+21) /* RMPREAD instruction */
 #define X86_FEATURE_SEGMENTED_RMP	(19*32+23) /* Segmented RMP support */
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3a8e51a0c9e8..473a3ba86a2d 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
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
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index 559353ad64ac..90ef67e85cd3 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -104,6 +104,14 @@ enum cc_attr {
 	 * to run SEV-SNP guests with full Secure AVIC capabilities.
 	 */
 	CC_ATTR_SNP_SECURE_AVIC,
+
+	/**
+	 * @CC_ATTR_SNP_ALTERNATE_INJECTION: AMD Alternate Injection enabled on the host.
+	 *
+	 * The host kernel is running with the necessary features
+	 * needed to run Alternate Injection enabled guests.
+	 */
+	CC_ATTR_SNP_ALTERNATE_INJECTION,
 };
 
 #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
-- 
2.43.0


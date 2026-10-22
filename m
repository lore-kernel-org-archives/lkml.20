Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643179;
	b=z9zJYhxC9ZdUuO/aLHOiDcEzL2byJtTxAnkdo6iW5iG2r4q1rfqfxGOaWuhY51DU18n8
	 PveAUGqcwKN58A6ZmKq53hvsA9tewPCLNAFS2JPgbu8YBqVuCMLaAdzKFa/fHnNSrm06H
	 VWOJ80+MlmeAabQQcyp1y2QYByw35y3ScGhLhiA0SN/kcl5exwE1oRiGfLOILlXOYYAGG
	 fRofpzTBVf8NPSO8oSqWM8yJvNLeT17aHH5LB66lv5E7NOwvyXwSnAIP5LSPwcYSF0opt
	 RsK/8mrroWMrhl9EDXLJ/rzbn0YiMra9Um6Q2mNSJAlxk/tTWU+VZd5b9Kx5L5zmr1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643179;
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
	bh=Hc+2yBSGwjL2He+cmSxMSDP+j0j9ionMb7nVpKMcjyY=;
	b=mCKfUTbxi7MhQNB1HEzxTWez0mlOC2xic30E00n9LuJkjCYmcI4RJBAn6Ae5riX52+TE
	 R6+Y6H+/HTRla/PFajlFU+3TjxUh/HKVEHI2WfyrSTJ57MpE1vcZgs3z0bUrFARZdYhzC
	 U5RX+Pvha15n2zWq+i3LHRYxMX6ULuxZZJrw3rkfpMQPyMyKBPFcOFzZPZKpXcuHi3eqV
	 vnKM22hCmuCO4NCSdznja0Ss7N2DdMOrpxF9kPMzDwNNoF43XPFnsv1vpp9H08GonY7NE
	 jPt/Juxb0JbpXN6s5FhiIE1xpTel+FUEvdCE8G7V8euRPMOZVvHZJ9vqe82qK5axZRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="NBSUi8n/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.32
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D4606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221D4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NBSUi8n/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+3hQC3CD3CN2+RtoVYQXdQ1/wDVXCQAI04/EzhA66leOs/N2HBpCU/WRvHHPrnoK4mGC3MBHLRcU2RamJ4z6dSx3kyOQ+VFHrbvxnuPA14KP+BseJ0dTFni0sClrZGHo0BxBnU/I6QT8H+vPjoDyHUD17bQgRyXXw9q0n2FMh4eV7PLdSaZyTY3laFAYWqxjKHzBo/oLukGq+JzkRT/hsYKZN4h66ADRteShRUhb2fT0H3g/VWd7ObiRp65A0wex8yfWeyrALw5yvO3Qx8mkajwtG1Mjt6GMCEoSx1J27IQ2C3QITzhfrAtoTfLhbHGn/2EL2ctVSgPDpSAt341Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc+2yBSGwjL2He+cmSxMSDP+j0j9ionMb7nVpKMcjyY=;
 b=iHLfaBlbvOSkKe0/s77jq8oHdkwCh+T2A/CJRESevnUa5UQ3dCvFEF57dcOBydCDTdjc1r5j0dZNVSJ28FQaZAWfI0M+iL3ssF3T/XRG1+wTu/JAgMXU42jWzMCEjohUrf9Yfk93q0SU+mQjSyTMVGxd4W+MPSi+58eASFrQGs+aHGN6WyRUx5vURxpIUDOnoxYiNlxovEfq5OccU8cKUNNEnEv+Iwf/7VoWymj4BbVm6eU/uPumklnnp1E7Bd60tGAqp6NV7w4+jiT/43SKHBfKVe86FJbdp1uL/xIYG6xwpM8/aHPxhVRKwFuKz1+iAEs0Z9aGgaZ6p3UpkJMYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc+2yBSGwjL2He+cmSxMSDP+j0j9ionMb7nVpKMcjyY=;
 b=NBSUi8n/hFpjdjJfvNLTfd3jTk7i2dBHo1xfHOl+U5bjn4s1SLPOUspmxU/OvKdekeEmFrAGb57T5DRoo/p6H5XCL+lpYo18yiAHQxgcZH0orw+3HLlQqDIhHqsXlwjELhLDkp2TLA2oNYB86Olt3PA7+wwWocXAZ5Zf3zdN7ac=
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 04:26:15 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::93) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 04:26:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:26:14 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:26:13 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 1/7] x86/sev: Add support for Alternate Injection
Date: Thu, 22 Oct 2026 04:25:37 +0000
Message-ID: <fbfe17098b8ba7dd4e55746ae98da5f793549d43.1792206487.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbe9170-b7bf-40cd-ea74-08df2ff49bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|261021123027099003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	vWPX30pa/zsOK1ms3xpDHEB5jmjvalQubSw/0z3XNxMZf/x69JpsaXihbFucf01UiEnrliVUb/zirmOtGTCf9zlU3hOdz8whF+3y7vVqnGpglv9SkpioSiI/9p4qNLgNrJ6nEHy/kgdes+SgRSH9ApbxgGtrxR3J2ihU+pZLXDMOP6HZgVzFzMApQ0RRYoLCOoECSJHcIdnXgyv9+pa94fxTQC5Cf9+9JJKDNW+KdK35OXlcwfEi6H6pyN7l262HcZFTZASf3/0jrm+NBe1vD5JOk5V53aO//fLc01X+mw1eRPSoPlUWFPxKHF6sW0xS6Nle1OQMN1ZJTBJPGXk9yAxMpsUXGWBsQQeiTpRR56RZF+f5aGh/Sa7BVWOT62H93NhgUZwBddrwuNOm9Tq7mXgTBS+408JUDmGqhlkIw4CGHaMwQEyDfQ26ZApqjnu7aMxJsrwpr0FV3DZx2tMv6ouK/0myX3dYrvEnTtBPNXrd9zfKrLSWAHQm0M/z43CQ4x+b+T+2lkI4ihWHh1S3FOUAmUu+G6+NWpS+Huc/+5Fek3yNuM8XofMteK/Nm442nQLXJ8Bcg/fk+6J/ctWGXaPJhVw4h1iTGj8uJA4tY1NqglugZYFhe7sPSPwVDwUvFrPgXWHVWhe1A5dx5E/HlOGT+K6RNmqgKEVOHyxXswN+40XOd9VThu/L0+eVJmog5xfJRQ+dLxXQjiQoi7TGLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(261021123027099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7HBBNA3gsdREb6tr/DlK0auu+IENmOvumI+AJzsuaW0MqG6HgPE7J55B8+gODceYMrUdiTRZabW97R4mfZ3nT3cRkgglwjlV665BLIz58suQv1vslgUU2+mlOJoc4R9jUkDeCnNPx9kMbFsMYLaJOZUM7LVJBylXaYS1awMEJ+Psy5Ak53tnnruxtaebE7jgiqoT7VEymxpGPVCatOYmFhz9u1bPltSXPcOBxldLeGIYDgxgqUPEaE7+5ryCRZxVxoHsQzrFW1fKJd1ZDdGzrB/tDjH561aHumZ81/R2qMOWH3T+Hd5PCBXYftA8zlgT/zGNDfFSPOi41meyAgPpW0AoIfWFPRj8UeB0DnQz5rPWLDlLsTGFKNEa7zCtBk8WbyMkJ+vWZ9+DP20t0Oe7oK7n1vJg2aTrVB31516JxpIAReTgdGIP/XHuEWPzuTQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:26:14.0917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbe9170-b7bf-40cd-ea74-08df2ff49bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

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


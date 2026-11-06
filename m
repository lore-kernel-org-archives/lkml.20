Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928487;
	b=D21u3Brsl2LD/2B6DNbty/nGY5bSemhcMpb/Ckm+JAyV57Gjz5E2dgx1/h5xDKtI6mY4
	 tMaJP4rMv90I381o9S02VCy8MBRAzFpWr89dYTvne6OW0B5+pRwykq5U2vH0y0QFsC9zv
	 PBkzrR6uzYkiw52oN+bDHWRHLYbUlSY8mxnjWig6QUL+MBHHG3kdcG+RucN6PTlMUmb0d
	 BGvsTnYCEaMnjAGFLkXDxXRzkJUpFo+64xkbNTI8p7sp29GhOdjo7p4+mr1/qQE0oHgaZ
	 DA3DRmqpvFd/1yQ6PI170gCIFES8oIZQCYDSaUHmKJCNkLEHOnN+/jycFmvNKZdEm2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928487;
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
	bh=JCVaa95bngTO8K38vtb13gAuPCJOwUt44q1uCVCQbUA=;
	b=yg/fvP99j52Ks+EWAIzAydiN4gWH8WohjUfrzhShPMrXN9DFplYxS/nDnrmO2OfKoFsI
	 NdVKTmu3/bs+Ym2j76oxD0X31JFw1A40fw+q9fApYhXXYP30vFDLVTgDM8wubxRYT/69N
	 IAFfFOGZ9isOS3inmZ9Aiaobd8pUD+NIDZwtO5Vtxvw6MJ9DEdlWpE8q0JWYDVBbQIsBd
	 oAZmu8muSvnjfNFOeXPi24z28I66ccM6Xzk+e65azrrk5z7cWkUskl54xQKwxM5h8l54P
	 iWPx4H+hiyt/vuM2JoBbQGdTJyWCZ6SIqy38naaxLd1sO87al4UEz762BbTTSNcsNiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qqXjdgXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.61
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010061.outbound.protection.outlook.com [52.101.193.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55800606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55800606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qqXjdgXL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN7c9r+QnnDUJbZi85tqAO38dMXFMPt/LGaOftTukPAMzidP7VTAh6+kKYW7ZQ5Z2rBuoTSen6LfYreXnDU8dKZ3Pgf0sTpb+BlYZMR2k2/hAvukULNM/FsYkIho8tcDVe10oKp1ca5DLqNmBJRdZ4Btdnox8UatzOH7UaFFJiudMExxiqtITb9wsASGmyxmZL6EZxDSc2oFeLviSfvtu/IKCdJdj5vePS0AS8Tc5z5hkJrNrbfFDwYRbkIvFb5OgR/l85vWMU54ssulAJlCJCPdN7sivkNCvzolOv1Toyty2Qu5JxRCoE+LzM1sQPPgt1ms/hbRDlu5l5g2JaimDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCVaa95bngTO8K38vtb13gAuPCJOwUt44q1uCVCQbUA=;
 b=s28KzL4LHYY0HH6Khep0tbgEKWBdkB6I8kWTtzYay55uMo86EHQtRgZkv7J1xtu/m2jq5HbKw9+mjXCGp2kD5Hq15Pq+RCL/WVJfZbkm/jQn7XsO4IWJGWIrTv3DZRs809TELHcLMzXdrEmQR9ZN2a3wp6Tr5qt7AlrEoersApHlTIA7jpDZtnV/mqKYAozUZfFnen+XEcNDbWGqOQrSlXVwPQ1MgHduqMSTFc1/bwABRHbacYHMWs5V+8BXGdxB2LgeUEwUDDLaN2BkmPMwedPZqrrLw/I0DXAQHV+ymfa5IoxXWqgFeGKD/Z5pLNdqIYL1T21gcTMVr4G47WdCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCVaa95bngTO8K38vtb13gAuPCJOwUt44q1uCVCQbUA=;
 b=qqXjdgXLo+KJyaFY03J7B5fsqlwAcnbi/Hhysw/lGCkSyEMnIvewoJi2SSLZRIeIoH5vqUlemykQ3xB/lTWMQVrVtcTKd2jIKBiqNBXbUy7O7gh39v7bc/mjVn7tROfyz/SAHmwOL7ZbfQ2mCtKsaC7Lkv2kL5lQquHUXPLEhYc=
Received: from DM6PR05CA0043.namprd05.prod.outlook.com (2603:10b6:5:335::12)
 by DS5PPF266051432.namprd12.prod.outlook.com (2603:10b6:f:fc00::648) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:26:02 +0000
Received: from DS1PEPF00053453.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::8d) by DM6PR05CA0043.outlook.office365.com
 (2603:10b6:5:335::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 01:26:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00053453.mail.protection.outlook.com (10.167.23.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:26:01 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:26:01 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 1/7] x86/sev: Add support for Alternate Injection
Date: Fri, 6 Nov 2026 01:25:27 +0000
Message-ID: <53a087641c5755da7490f687652af3d07a0fafb8.1793926736.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00053453:EE_|DS5PPF266051432:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c5ba18-c7d3-4de4-1314-08df3ba4eb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261026140227099003|11063799006|56012099006|261022105027099003|261021121427099003|261009223027099003|261022075727099003|261021123027099003|261028144727099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	POzk2NObuXj6Go5HTPIFT4Wy5mc1QkGt2gVcHL8U4DGEMIfaRV7AbnHr75EfXM1pHTH5sh/oYKslY/5duAKWZOzk05Azh5ULXGTm7GBWuTFqm4c81rd9FNLC+hvBbqaxa98RIzGaxQTQeQ1zNnUMU1lfE5lhASliIL8NW/RDzBRQV9Adxo0Wxpy5y+JNKNruuWBdF8YZvyhEBZThJyNFKpr5hYik+BVXVSVyCoydLqqumUoewyplbE4TV3OwxWSkqyxyinB/n7BwCCM3P73NLgZhQhAZXXMdeQrvkK4MZTfqO8pgYy8BdsDuHaSLYvPZBnmjaP8BACbkyo9N5HKh3xFtxX9ik1s/oNeupR4H467KCcB1y3cJGiqVAnfT62bMihdXxMN3NWWWFN/yvJWcyyqsxMulrYAOuvbpONdBztAHGd1DmcdLRmv/FXDc5EJHGvwuexfLF4l8JSixfVIlfQWb9X0pd8agvbiaKy7tIkOFIjwfO18BVVEo7TdS+Pyl3LDRHLo1ISPO7meZjAq+kWIJLcDBSzSgf8oguAgNOYDgCpxhzwyQBzoJWhiItlimmJjpnQdqSOAjL2R3nuzUDzLISw4Q4NzwumEfN5Cqf8XRfYpC3K7R8M6YdDh5doEuRtdD+tW2AWSStJlsnGGHcHxd+M8/nNTqbborKh+5Ew4mfSJ56gFdU8r/uW3cVyQuR9/bKJ7IRb8F8uoEOYxnoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pyz2c6feM+DF+2+Nb320J3F8xcXG0syzkpifGyV6Slm9W+ZwhVax1cmUGxxEJVEkPy3nFJK74irdavIt68axknQXhywwTD3xcBWVi+RRDyMhzJkkv6znfIrZtM3540J0z2DB9q8VAYyc4+qafN+9ncHByFhM/t0UvcRlOGSQ2uftz0bu59CFUUlLwh6b5ZTSrxAe6vCAI3a12IFtYZN5koAtIXuPqs29tyMtrdJbHs4YKnCaS14ESkDBtvV6Fq3PaNp0WSh/3NLWnvvRUDtXaqvubZb2sghnPSBfI/8hf8egya/8z5w+unrC1gaG4u8khttIDI87X8ttuvOcFG1SuYnEEL0kNInzQ6tujyyCJzsdGirCeyvtltQl0IZcbfdRRoxCIPn4kteLqTFieDdyYooUSdntstzRY0wzu9ADvSFb/k/9yKCPIGc9MmjISg+D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:26:01.8901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c5ba18-c7d3-4de4-1314-08df3ba4eb63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053453.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF266051432

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
index 58dce0b66179..d1f02ff74adb 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -494,6 +494,20 @@ config AMD_SECURE_AVIC
 
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
index c0914829a925..d6aede40fcdd 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -730,8 +730,8 @@
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
index 9c26d4075c5f..0c26cdbfa8ff 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
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
-- 
2.43.0


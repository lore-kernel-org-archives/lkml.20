Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98E33BBC0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974899; cv=fail; b=ebpkTDYoZRFpLC+QS94Y389DB4j03gVZTcIc7Y6KsLXO3DRLofIiiLtuRPqg81Ef1sbxKIzQshDhZaIO8SNPXTVK23TQVKK38XtjHYooih7I4gFH4AtlAdsMIGu558WgB0IjoJpeWEP98rvqo2xAIjJXid6BMw1FBiYqadhv6Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974899; c=relaxed/simple;
	bh=x4YOyRL4H034r1d45g65SToLh+OfnOEFOUvCGYhKuVc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyH9P1px/NzkWg6JiqtCR4W2gqrocSxextRkphpxi6xK+zJjw1QBPBWMjhbEbv4kVbN1qLHuKfH5Dy09UgDRkDs3Fx2+vGQzwaEIY5uhaQwZcOly0Kq++5pPae+5cfKc4fYlqmVL7w4FC32+aoPy4NCrnFE3qKAa70ujVOqQwYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FhjY3JfO; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FhjY3JfO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wx097shVArQl5bOcYARLIAup1XrM5oZPYO/ka+9WZXu+oE+qPSLH4IRScqkYw3fDAyaqxp5ZF3ENz4uz+fyYGg57OkSuGjA46pleG6RZjr5Fr4Hj+ux0i5bZqIg8JtD1hTOK7pkaWVGWYzjhuDC3VABp7+Z4Dtpkw5unTKJns/n5htGW+YEkmucMTp8gxxPcJ6+SxkfITqiOLdzaOUIphiDy81bV5a8ZFj0ja46Ot9jbXRNvnnRIA5rpSz/4XS9QjaKklZJ/yNBLeH4xrju9ahKf6yZvhK+KJQ16uPbukkXB5kSpo5Un9dg7XOs6YB57YOARKxWhqvOm/a1eYTyFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb5zbk4XvCNgY7WCpgDGp53QiyZN/sYWryY6dD7f/nY=;
 b=DJ/OvyhrcJTQwtIZ4gWr3dOwQIalB97lbhzaz+s/skNyL7c9Chsx1aFZE7dkWulZkeuuQ0+3m7d8Pg874gkeJ0UzyYOE9jMgRB1dDk6gGZHkZNoRMOsiX/cxBIiX4LnXrXug7vFoo7JF6oQB9EqB92Z1zOBxk31f6bhVLbqsxoOwLvuZEEnN6xoTg+gqr3pJIzHIscWmTvfw7n3Khm83J4F2nZ5avWtvF0eS9fKpKWS4kWd2vS4N1Euk0OBrW2e8BKyo8VGZ+0zywsUOa6ptgKseUkvFQERU5tu+VK3dwVqQCE3vQx+jhkZrnWOErrFaDW6ow6WNiS/tU/TpddLa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb5zbk4XvCNgY7WCpgDGp53QiyZN/sYWryY6dD7f/nY=;
 b=FhjY3JfObH36VBNyCetIhUXopr7sSH590Twt0ZYY71waqSlkrlRAHOreL6a/HlIB1ldc3gE0JU+sit7bdSnWZEJQbrrfxFTz0zit90x7je7p5k+TgCMzo03XBtoZw9dQFoY7UqLvqA8TUl7V03V6bQkkF24dnita+XCXj12YYPI=
Received: from BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::29)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:41:33 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::6f) by BL1P223CA0024.outlook.office365.com
 (2603:10b6:208:2c4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:41:33 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:41:32 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 7/8] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Sat, 29 Aug 2026 03:39:45 +0000
Message-ID: <297d8f4d28d49ff84467ae2cd14cd298289593d6.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 163be502-5098-48db-d422-08df057f6bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HLIUUKgjvlE97Swu72rS87NfF6CqDmB5JbGrQ+R5xPHiaOrdSOqTysFOE8MLG4q3yFpGdGY3bTgOQOl9CfBc8loJMJDqPcC9AQEc17hOLWpyyVINtZocgdwwvmtRsJce0zBVt0CZ+Y3shcp58xLidQk30SYdPDhqODxNisH2qSGhHOuXG8vcxaQubbpJSe8c+t+pdJUZ6Pdd5rqC+kES5GW/EJcpSKEoUetDyFl3sC9Wch49I/pCg8+YJL5L7Vfi2iqkmBsikErJmao+wN/qXyqZYK/CoL5MQtRZLKWG/3Rld+EATdXHiGEEgTsPcyAqUl3gRRDQ8U+0/u3Zl1YUng0vWX3+ldIAt2cHzDw4ud8qY9hW3Zt+mw7fMAIo/5DtLXIJuu1vpfl/+hJhSB9LA2xcGNlO5A4cq1MXHeoU65NVRqbu20WCi5KuRN05Z1EumaFlJOTb4Ohaplz5gS3YY+Vb2KFgHWbtKngDddgMNSsOCPqaJS2rhEXP9N2+4J4WGLGkxkeSSUcGY1DYP80vYxraZn/aPL7lJ1vIR2biryQUz3EHaZRlqeXCDIzttrb1RYiGxbqogCIuhwiFlYcQ1ngTKlnpmsA+uQBHziyVbdd/e1Fb5iTqvh2OoOHRRpfcZov4jR8fWjTqXBQrQ50nwiVLre4cJUiMkIYX68sW2EWb+U9APJLnxdB2WczLksNVJFaLA5puB8tELCZrbzpA8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F5cycSUUZZiYe1KcFmRBEXSmlTY1xKOInElcomgfQoxJOSevl+HZUZcPng8GYpBRpdsoHFb0eOh5sLyxiMiCZYO8UE81JgcqS8DD5T7q4D5EwFYRZjTy5PaxaJFXEjNUiLJMjMrLCSN2cnJ/GhikZ6zIx5NMiuf8laLKeSZC202d+bf4fMHrRrJd8miWccJbjsbVjThLIfd5MACQigKxCEajthfIy0zGYAQWzxiM6NT8WFlUIljAB/pTuYBqFslm0r+2SWbMclOgpI6HGQ30jLezDnFNZ1Uk5j4J0wjYO3TpkNz9H2YahSbHGbyeftAmEMJl00vj8K6YRtS4uyDhd1Dnv33NM/D3nwfScOCYF8YzLrD8JUdwEaet8sLD1jbIBaEvnoKWfUiu10cQXjdWO2KFRo/066ir/hYxTO26/OHOMP/7rHBE4gq2X8/XH8EQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:41:33.4947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163be502-5098-48db-d422-08df057f6bac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400

The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
(shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
the guest to configure an interrupt vector which the guest allows and
the hypervisor can use to signal interrupts for it.

Implement this call, and make the default interrupt setting permissive
to allow all interrupts when detecting an SVSM and Alternate Injection
is enabled.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 12 +++++++++++-
 arch/x86/boot/compressed/sev.h |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index a8a175c90fa8..479b74c75b4b 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -520,7 +520,10 @@ bool sev_prepare(void)
 		return true;
 	}
 
-	/* Register Alternate Injection */
+	/* When the guest is running at VMPL2 with Alternate Injection enabled,
+	 * register Alternate Injection, and configure all of interrupts as
+	 * permissive by default.
+	 */
 	if (early_is_sevsnp_guest() && snp_vmpl) {
 		struct svsm_call call = {};
 		int ret;
@@ -535,6 +538,13 @@ bool sev_prepare(void)
 		ret = svsm_call_msr_protocol(&call);
 		if (ret)
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
+		call.rcx = SVSM_IRQ_ENABLE_ALL;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (svsm_call_msr_protocol(&call))
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
 	}
 
 	return false;
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
-- 
2.43.0


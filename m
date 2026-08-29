Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92932AABC
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974911; cv=fail; b=DZo7sJ2eIxrT/JuCGevhJzxOaQr7jKWEgeV//H9q5ooR7zDVcOTu8dSgIEiQtDycKh+JBvSu8XB1322Seft2S6C82wwXPewiOLJEjKDI3PjBy6KnhpSLuSc60hnXwVydJM0a0zaUcN5QG3D9y1qA4Q5g8OUOnilGqulhDxg6tbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974911; c=relaxed/simple;
	bh=sgVUCpIl4WV3Osl2lGW1owTgTJvbxvdaVGOL32c/PI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I1NafvADN2ogs1V/vJar3R8mTaiUu0FvvFUh2bQiEQXJ8nIVzwnQy6WwEtxYBoSzDb7A8AESVEWN8fa1aEb4LYWZ2C9WUrWVdUuGy4UCpgofHjxhZHfavp/dZ52jXVoVbT9dEia/0Z50FqpGRC9XgYWEgC/Lcc4b5mg24aRJ7iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y45mVi4+; arc=fail smtp.client-ip=52.101.57.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y45mVi4+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFHKglSjluU5jXdsL1eli+bmN3zFjfG66zLuJOipV1yPDboT4KHjEyC+IMUgbhDsRBbU1wLp3g4T3RspGEd+SJiA4f0RkJb/CKRY4zRlbVcINzTCYEZHqs9isGuYJuOoWPVpmQ7EbsEp2s8YjIOL41UHj7SiephZWHlX4FOq4UUwa/8DzEvWPCMESMPFaE8l8Sj2TTJA8wsd7E3slZaBm+i1RTYBZeHKfLdE4PSXdJB6EDM/0MFeQApHsz9DgrOxe2i9pEtjAGLe6q3eXJcKSDttHmH1U14SffPHd1GOgPGjXByFzYqEGuDFfTGZIbFica3+AKQ4hKyau+AmpQbQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4tH6rf+hCIV4hUlKk62Ac5b4SbgnUaH2J2rSydFPeI=;
 b=O/JTV5VpSCYEuh0tVQUB/s9i6X7yYNwWRmmNypaHoY+OKu1TGXmE8F10MrKugBdJybkKFGI3lJRxmDG8E0Ah9muZLt5ZEvPujoIMTpINzbOUIWYfCkKivhNgEnWVuwgkeraMvMkk5qciR5ZfFGydAyoKSeXBHjlY4PVMquG+Ncy/Jiub2pd2Ir6mJjfOeRJsXm/gR+AjsfQ3nScsjY6gOd7VaeRHSxNIqxfyx7umg7lrZ5DgIvgqA3FMVOOiwXboNuT32fV/zF6PYbdohbR08yVb206Wij6gf/TGk47/sEcxCP2SkLoNHO5HWFbohV1KNeciztJ4Krh0T2f7xXO3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4tH6rf+hCIV4hUlKk62Ac5b4SbgnUaH2J2rSydFPeI=;
 b=y45mVi4+3SB0z5RD1hlK4Asy6HXWsGOfHXRbYmtE6Mu7Mq1xrm+FBXSlihpT5iC0JrexLNTdk42JJgQgCT5Zn+xQXo2D0SGsOwqwE62oJTLkDokFDBPOG4wdN9sjOMs7m+Zj3uj+JPmfRqeXPoOqK06cg7qdf4gVzEIYvDGMyFU=
Received: from BN0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:ea::8)
 by SJ5PPF1C7838BF6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:41:44 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::5f) by BN0PR04CA0063.outlook.office365.com
 (2603:10b6:408:ea::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:41:44 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:41:43 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 8/8] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Sat, 29 Aug 2026 03:39:46 +0000
Message-ID: <b36f4a4b3df092227f8c6d0e1a5ac3a4f5cee3e9.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SJ5PPF1C7838BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 85877bcf-fccc-4b95-29fe-08df057f721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EDBJJbmWeL9jc/nSwxCzAu1s65u9ciGqesFjkmN5WOBAjMt0EKMbqbXbn7zyQl1OJTlQ55uGDcPdmtrq0tF8rmKoJVAXVjaq5eVISqPiaHD8zzHSiQYSI4r0plZ++uZUDbJpBBxyqxZ2nk//cfiQdP981ZPNX9Jq5pE0lU7o53KAoP6tvwPs7zRk3wMduX/ibCZnN1aKGNoLXPSU7RM6lHzohU1UscLB1A8v1tNxvkqdKGiDKu/eOz79FM6DgnAXjXPfCZgadaAaenJnkMP71Vd5lhxHwkx8TDiLvSsdNs1a1YhiRj1OInDcGh9jjr5He0UXnDV3D1ZXREBB42MyssHnS2xSm80Fwue4KR/bfdv/SDwVZ/RHVrowXjgwQTGNEnTDlvAX0bxKVRfLVJ7Yp3AwsBeB+Z9ip2eooXMA7pOqHEW+uHZELPjyPKkKHyzi8Wv3wweJFFpmDdR+DYFtu8rmQS7Y9wBDvGWlCY9qKlEtJ4pPiXrQ0zifVTZPCCYY5BKKxVT27Po8RbZs7tDC60asjC/YbdvK2bnrFzn9nBbKV9JSS/RQN43FNiuz5W8weGaELjIeRozX+kVdIOWai0TScjQQY0YKQs6+apECRrFnhNygcxzgP6Ujy+rV4ac9k/23fRPyvHKOwkazxLYFI9xXqg8LdIpYod1Zkt607PbYyGHjw8kUxJkKJw6zNeP3df3tXjdUNx/qGpMg186QJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZArGwsFxJV6Nm30t9al8xJFJX52dc1BfzSrdfhodKMiv1E67tJZshpawZphK1g7WHCYXsUGzU61g9VIXXSV85G9jqaEpn1pXhaGcg8Yu9GFiukJSchZsg9ak47V2sAGvOzVtZKczLxuQFhWpBjOCFQnsyEjFG8i607dHhksXq6MSABK2U4/vuq63RLhzk2KaQpARGu905xqhJUorHFNG+Nxtg/rwyA8+zem3djFPGcwNyCk+psFFJ5kCXonMkUEITfyzyrRy8bv1TyvQgNTQWb8PIPCy/4I3iLdfnLHCZ12pmWatZOUoA8EL8abkolq1CiSbqPnC9tSzxFvVx1XHA8iMwN1q3oGCpVQF+mJFPCOv5a3ZzYLqCfR/OGt6ASIFwE37yqZ4LqA+K5yh9nPVOH5Tz+mUf86T7NqXlnpjcFPMRz71IXUndxB3NuyWc+wt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:41:44.2909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85877bcf-fccc-4b95-29fe-08df057f721c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1C7838BF6

Now the Alternate Injection support is complete, add it to the present
SNP features.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 479b74c75b4b..cec1ef473691 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -197,6 +197,12 @@ bool sev_es_check_ghcb_fault(unsigned long address)
 #define SNP_FEATURE_SECURE_AVIC		0
 #endif
 
+#ifdef CONFIG_AMD_ALTERNATE_INJ
+#define SNP_FEATURE_ALTERNATE_INJ	MSR_AMD64_SNP_ALTERNATE_INJ
+#else
+#define SNP_FEATURE_ALTERNATE_INJ	0
+#endif
+
 /*
  * SNP_FEATURES_IMPL is the mask of SNP features that are implemented
  * by the guest kernel. As and when a new feature is implemented in the
@@ -204,7 +210,8 @@ bool sev_es_check_ghcb_fault(unsigned long address)
  */
 #define SNP_FEATURES_IMPL	(MSR_AMD64_SNP_DEBUG_SWAP |	\
 				 MSR_AMD64_SNP_SECURE_TSC |	\
-				 SNP_FEATURE_SECURE_AVIC)
+				 SNP_FEATURE_SECURE_AVIC |	\
+				 SNP_FEATURE_ALTERNATE_INJ)
 
 u64 snp_get_unsupported_features(u64 status)
 {
-- 
2.43.0


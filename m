Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2BC25B094
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347589; cv=fail; b=eiIp46Pdw+ntshw21Ny5/5hUvldPSEvwLDm0hyO3PCD8uGkGagr4LL25iSCJoTRvSHGmdFY6Vyi9JHM2f8tdenRqX3gKFLXz/MtqEy+NzYbvw3ma7rcAgWoDAPeu78oV7WqDdAAcNyTFOIIb1VmVTzNujiA0ntLsWD7IOp+Q1BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347589; c=relaxed/simple;
	bh=5dq8raNHo1eMNNfU2A3dpvdiEWJzCb3QfnTzsy+2Cc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QA7fZ+hqE49Pv4P+i4d+GchoTWOFo98jNRlqt4plvDMLqxbce/52pevmZebgtJ4ZUQ1V7JAIvJudFkdzMgTbkeXsRxjUHeURA9ETbsUiKn2snANwkRVzK3CoXIwJvXGnAB7uHNHeXn+jDfzQsQg5o8/+O6y+PWhRLqNpinBP5KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q4S003WZ; arc=fail smtp.client-ip=52.101.57.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q4S003WZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8+uevh29M6R9GMZnubbIggyeNZVIZATnMowSP3Vc8x/8CuSTEjHqgr+wySCk2TQPOMq3SJxo3BmKrd12wBnkRqbNN4nJUk9U34P7tCZZlzMbwFlbOm9nKurvwbWTPltsKNuW2GIk6ijThjwruGVBsidRuyf549qZmmgAY4pF2lxA177+0iWJ4kdLaXrZff7xEM8/k0pHcmdYHdWKuk2YJT6/xF2wkjusUqif8FMLL/VjJkctEoBgb05r7RHjyl/RX3qRC4Bb1QPmf/KG1tIDfzDnRg+O0k5WQNqJ3+8BYnsMxATLaq5PP2A4npSGO8uRgksdHE7hR/dnPJ6Xf4ySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtF0rusKYQTAD4hbYJCvfL+Ozah0dVle0PtTCroHa1U=;
 b=LVGv1gMDme1JWxzU88EjAqhyDNfB5jVHKXXQLJa3OIxAzOtCSWD1nG9oG0XL/1Iy3KKakeXXY2YoCGbLf1WkFK1BWdhtVbxDPZgPRetibAVZZb60wKsQ3VIIkDBN755J/xtqHnJOmzbjp8XXYIduv9s/54pF7obhzwdiMQIU7nYeZHxTLameyhRpfX0s+5IxEnupN+kE3xBwO+7IrfZt2c3Gg6ymlRV+kwttyO5ErrUdsL/Q7qvA4jO4gbQ7epP7/YrQbi+S/rhxuHBSrzIuiI/yDskMFprt27AyYyoFerNpBT7TWLg9RSPEXzN9kbphQz3S9vLSad3mdnY5PEsmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtF0rusKYQTAD4hbYJCvfL+Ozah0dVle0PtTCroHa1U=;
 b=Q4S003WZHjOPf/Nj5mPM2xnk7qImhl1iyhlRqDA8G/unDiJTHN7j3Lq4sSsQ1hqPPbSYVGh3CoBcYMJsfDOk3UzvnKyk+DB+u3P6lbj30QebenYNwBmoi6Br/+PqnBZoliim8YF0R9C3wBd031zqCfkLjSHgOlSFBVtU4q2iA70=
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:59:36 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::9) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Mon, 14
 Sep 2026 00:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:59:35 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:59:34 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 8/8] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Mon, 14 Sep 2026 00:57:24 +0000
Message-ID: <d34848299896c084c6aacbd2099d62d2004894b0.1789345277.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789345277.git.huibo.wang@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 97598d82-57c6-4d3d-596b-08df11fb722e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3HOxgYgboYkMUxTgWalC7Y+GvYk7kgU8Fbr+PEnjpylr8QLTgWr6pvZPCWl4EKJF5Exee8Dj1swOMGvCt9BQ+62ihIiBY4XHqjq5FHTY1NRiUWX4haCcL72FMZUFrMZDzVwRRp3SyqjxOvN8ymXGhm8u9rhlJFW3QfJ6q7Iu/6fNF1Ab0iQ7nOu88F68LdSjY91EaxIu+iSS47lWev7TyLp9T90SHmWrZwi1UKZf0cNAQwTid6W1VvPE1lIvn+wMcqPOzDwuuKxaT3nwF4R8x4E+czJTiXClfQn43aVGP52vd/4rcFscsjZt7cNfmTuJPAS7CA9ugvb9mBb4REg9XAE95jlBdLI8UXz7zX1dFPUWLtgk7eOPnQbw6U4qDM2ygDfU4MOqgQOaaz+cV0OIYSrq5YNgOnFt3h0q0JoYi48PstRvO3FEaIr9tHaeYjsYHNLzH+h3ZS3H8+soN66+diKY+g74k5SCWtgbcY43HxLa62R+l5p0IrASGfERKIHCThyQMFkUtDdyPwnsmnV0q/dNoYid6Ff0Md/LyhywAQQuKrmkz4ChlYmTmGILhpjOhlTz4ObCra7f13+NyNujR6PHpgpkXohCgQLsPIyUC0KtVoJBq8gBj+nQ1s1WTi/e6Wne7clDLfsGIdo/7pLISf6RUz6/9TBY8rOAWjsSaOvhYtnK6HAXg7lRakNIrFQ8BN44c6BrdBeENWKPRxDjUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ynK6qfdY8cdwQrdZiCh/AiNrub3h+KJgYZNYc5f7GqU8IRTy/dPWY8Gmaz2lrKv4V2p3pbwZAJBFEmpbuPNCvHOM3AhCi2pn9URt2xUEtb9zRiB4II1u2fitAWalWKZy4dmVnJU82WJ+CH7VRcOKuMDV9vom5bjGHEGzkovEB7PueGhNdHm0lQ9WEROB+0uKJc5GBgRNoUHWYE5mHJXlKM3Hi1NyJVmvazCaMZsfQnGObiB+h0BoKYxH2ac6b5q8uddDm6XgrqFPkSSm8KXggyMSaxWNaGXvh474ByLhid+D/D3hR+MzjSSjwT2Fnu2Dz/hx+aladImz8IUj5EWdMFWbnE7CaU6IexQwTW8o47hp004730RlhijF0Pe11xaU0V09it0XxoIshb5G6fsE94ZWXfvDfYbzhonBXLvWJkr4r4yLvZpCYk8tvJ4ksNz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:59:35.8733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97598d82-57c6-4d3d-596b-08df11fb722e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786

Now the Alternate Injection support is complete, add it to the present
SNP features.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 73012b1456ce..448ee63ef773 100644
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


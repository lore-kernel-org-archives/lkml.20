Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011034.outbound.protection.outlook.com [40.93.194.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FA23E334
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928334; cv=fail; b=NGh7RnwRsUz79p10SXUpdV2ZZWoRPoF5j4kU6htMQ+I5nXSslmPJeg99WZwMSEOHXlywwySaDgsue143+ayK0mQ0oPnZEk262p9yL9CwSrrDaEQi4YkRcgABvc9y2coSg7ZuQLsBWInnP9FdkNfcVWtRQZfIr8OGPPEf01ggsg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928334; c=relaxed/simple;
	bh=GflrT3BpyVnsZ3byIV+nqBX83lfAt/C5IlKi75mHafM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwqOsEjol1CDP+QQYPgmO0a8Ee9RRaJXwCRFUfLVhXCMGoQ/g4fHchTLRathnOI66uxYVBRCwffNFE00GMnOeHEU0Og7GcwYJz06bq2gCyE/C09pQDnFwV9E5rsdynWSsHJXhXyHXcEunbJwS8gImhHIJvhdddbgvaRznMkB7Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z4fA3lZS; arc=fail smtp.client-ip=40.93.194.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z4fA3lZS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg14Cr1HuvsFK5D4fAihfq9ner/jwGtjrazb5xG+/OnA58IqjxCffckwbdLW/qX7ayvdq4M1tlcVhXfauO/qaZ/mWLdFS3emymS9LkIYjnOLmlU9C4UqFOq4OUVQj6JNuYo2C7ikN/E6IGLlDk4a+2tmIl6V1Z7Y9OgrZBkrPjb44UwzRB5eFJtmFDDapbGS1id5uP0YGYoRj6H0IVMertamA5iiF5dYkpMhmZRTEmcUF4f/Qe0iMcUaj0p3EuVNWYZt70JmXs3n1dWGpCcBMgw5zHFxC3QdWbHcHY6DyPpxboUOqtkE0RQ/RpD6zEeVuJ8/S/x4ezHrO/xxFdkaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZ5bzfnIiOGHKYesNBO6d0Ekcm5dLvIKXzKAtOxzSjM=;
 b=VcWyCh0wNOW9ZuPTLaYdjkukoO2X0PFIK6kKdAGLE0N42Rs7zk4LE0RsyGGIz7qmfucWEapQ6cH7YiuKX0Tx/JZlC9FB2oVQbFaY7EYksXtDjYkwpQ7UWYqz5RTdOQWmYE6I25Lxy/i5WzDrQ7kwwPzO0jV/1prvfhlXC4z2WzDo6VMpZ1LfYf1wB/l85zXlmdjgUFp0E3OViYN/CW0JcDld2+05F0aeEfKgbpC2AluVmz77CNUfbBoLL6ZXYyhaZzaxEYtnJgTKRn9EkDTxJRE+4oXxnsHpZxXrLguGmvLK6R1Bth+xWeXzGO5Kb39/C3uco0iK7CTcxiTHRLGMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ5bzfnIiOGHKYesNBO6d0Ekcm5dLvIKXzKAtOxzSjM=;
 b=z4fA3lZSoTrRLwKEzAAL8pCku3xECx2g+w8NsO4hRdKypsF1e9Qe4AnXhK1n+5uBrNQ0L1fc9LFrRhdlB2pEDi/IbkObYLA2AtXeSKRcy6X8gWaLpGwgZo3G9Q3REdcmTIzbLEVHATGfBTzEOsFFZKzmMqBFDkcIW32nNWEH3/s=
Received: from BN9PR03CA0637.namprd03.prod.outlook.com (2603:10b6:408:13b::12)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:18:48 +0000
Received: from BN7PEPF0000009D.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::a4) by BN9PR03CA0637.outlook.office365.com
 (2603:10b6:408:13b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009D.mail.protection.outlook.com (10.167.248.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:18:48 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:18:46 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 8/8] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Sun, 20 Sep 2026 18:17:00 +0000
Message-ID: <1f34eadd5c376ea5e16ea37b5c3bf9b5cbc9ac6b.1789927246.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009D:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: e23ebf43-8148-4ca7-2f2b-08df17439d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ko6+QotEt6SzJKD64u0IFcm/41gXQKE1onTCgcaQN817IsRtQO5IIl5I8dMxJuYkk3CIMzuUuCUubv2u+fXkb+dUJhh4kfXgTDR1Lf1fgkUvZ7tn9eME3zgA1ttaNPGEZj8AcJYMzy35xOXrdAXJ0xO/VWb8gTAnDcgbA5tHIT48kh3bmIvdeySgqc0xmjcWEzc07CI3NxgJgeIBDz36y95ddz3mrffxtQt5WjT1QZipXpS4IKwWY3/twNxW7KRDEzm/lfDeDFFRY/WND59VSTpZ8Amxqb+oN7HwfYtjIuhw/mvzOo0SKXWrKcpt4u16uLDrUL9t8x8AZhiJazLGZEjXPjjT7nQtWpfcE/LrpbyMhS/rRPun3n37swTVnap7lvJ5KZOpOma++/qdxqxPMkssjPTRzmhdNfqPRDEYyqBb4xyaYL/OMMNpziicJzAMt2V9+JWUkNDzJZqS73Y6IRbMcvC+in3bg2TvgEqC18QnvPWuUnGH/gDl/IC9F0TJed6eI8axrvDhiPJ1Kdy4P+BcIiJsIYJEuy6xF0lmyZx1d3U2WXAEV5ZrpM2VZxNPoDFwtPcxR/IQo0eRezKtWQ/Qzz6/vLE8ueDZGyMT9HiOmKD/xHsgoQtplT4rqGHc9ZqeaUO/nh2fwpnlm0GwW8zxJHmtQdPBW41G1ced5lWv7ZnETqMkKr9rVci8Znxd/UxvKeqgoNCgz2bY+eqi5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HtBnsqPKHjq7PUUWSQRAhQ3o9kN3abTprpl0VXS27GZMN1PqbOiNyTg/IpkjEOXj/TXXJRVNKi4Er647nkqWjawvAOeJaPSselo7LhuQA9dNoOYoDSgVIoPFwhP8ivni//Pr+04oDnNheb3h+EAbI7/4XeBCLkmG2NrJaBt5Pwi8bSiWI/B+zIHvsU/bSlVcJfmJ3lOKATTf/h+5NOByyrTmRtCH7E6468Wuak1Neub80hGyEzauXX88SytGb5aOo6r8oGCW/rcbGV9TH6SWGtQ2fDU1bGRMJ+FopBHt2d0Un1zVeuFza5M5MNoKgIdov3voQgsfVdtJvGVNeEEzS0SIFJEsapP+JjggDDjhSOUzpXVVvTUvzv6MQ/VoAy+Ny+AKT/LNg7+gnE2PZpNFNwC8DAJM2LwAxfuLdtXzDQPX4hvWi2KohlJ1g9XV+nfR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:18:48.0168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23ebf43-8148-4ca7-2f2b-08df17439d62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

Now the Alternate Injection support is complete, add it to the present
SNP features.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 6ab6276f731f..62b1e54988ac 100644
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


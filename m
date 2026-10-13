Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2C52FE43
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913962; cv=fail; b=QsyaSdgZCgznKFsTciVCx6lHryxIfure7rVGl6sdWONUrjWtrbidqAMd2TnCn8Y6UBdh8sodFmQoZYdSxYpv0ItbMPMyuQmWwJh6YiBG5fz/G1kRicLJSWcyADHgKKPgzHYlcfDBHEL/8B9PNigh8HdDrXHZT5UJ4T/3O0BfV48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913962; c=relaxed/simple;
	bh=V9qni/CLxM2OPc/pVD6hM2SOx1MAsgeDBXguL4mwACE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvW1slnVB0IcII3Kh2revozuYUcP8yjaXozjna8bJQXvKIcSxlCNjk8+R0shDYHHcJiXCsQNVtcIYzEopKh7jBpeO7y+SEMx6zCoUZK0E8y3HD3NZhRdeT6uvDmgiZapPHABnSxT8fgAkaYs80M81KfvUQk1+PJibDGddJ7GWJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=scVCzCwj; arc=fail smtp.client-ip=52.101.46.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="scVCzCwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOgiNNm6YKwKoy4Z6LMnwbHkhFLErE1oZRdB0gXDHwrgusn9W8sA8VpUm9eyFHfT+l49NU4YlCKS7UJzaHwjjEbfnPPLJd2rDaGFLOy366ACewSfaLvI7MVQ6dTgUYtonbj1Qzk2scLbSZvOZHTX6VLJ/z6DFIG67nMO6JWE3dTkoXQgRb27Dsv+GOzVYBQN1AI5+C/MxAWn7pIYFDievWc0EZar5VsRpvvDiB6gaiwHHAGFhelg9T9RrWBVSQJo8RqUK/lqIjjm0ehRycMefhNZWl+YC5lpvNhJ7sZ0dw+ZiVO4V0yVvq/qAFbzvXbld1qd2tM+QgoYA0bZI9ErGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=UIwMQGWgGNczBGwe1cjVt7JLnz/ftr3i7gaPOXTvwStYKvwJLdLTcZgNCJhz4qLuAlF5c5AseWy7K4r/oZNujS4PcbgC4yk0Au28P/PBtCijGWs7k+2RpghG+Ar/1W4k5L/uhIzbwBcXffJW068Q5oPrUineo0K5CjYtNURawXif4UA7+v1igeBbFl39l0NdHobVIeW6RAGkNMZ5+SyTpAK+aE4mnumFI59Jj4ekx9UdTCz9SiFmUe4SuGbOLh+1riKI6xa+Wg3FL4G3oeuhmJTibr0X6BJd1BFCx5YRL1apQ7hYWnV7i/4HhJnv8/q5tbvSYlwrZcXjSTbDpaodgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=scVCzCwjEuHuC7veZ56b3/NrW12q9MaxN4+UyJjV+cJBboX9Wgq6NHH7hgcW3xD3Qt51mgt6kyMLPNrCApZIsCCM69RJaeAhet4MiPIRvSxkw64VGGfgAkZq2alxzfqr38XyTlBWL3XFDTm+2iruTEryLE/Suyxsp3+aDQ9iuso=
Received: from PH8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:510:2cd::22)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 17:52:31 +0000
Received: from CY6PEPF00000047.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::f) by PH8PR07CA0010.outlook.office365.com
 (2603:10b6:510:2cd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 17:52:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF00000047.mail.protection.outlook.com (10.167.247.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:52:31 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:52:24 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 7/7] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Tue, 13 Oct 2026 17:50:54 +0000
Message-ID: <3184275d42eec787299b5cca9b66bf872ee12983.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF00000047:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ef0654-f33e-46d5-2e09-08df2952c12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NVJT3NkuOLKTWPCM5ga2uEr9glMbJ9OeskyX/pa1u7k3WpVmAaDIMyDAmkVS+Mbgi2H37wzhBRgfSZvOFFvSTPGe3Bob7g7U6qyKWMhxBP9SzfM8VWFhy7+8qsPIyKRDUBY/QsxqlgzsclbwGhHCi6OLj7iCkxRVMlVpoJn1zsvFG+GKt56ul5EuZL3Vt0RWOe+IdaFjTFzHQtjO44kgxt/BNNcqwPBzgQGVwPCQ3B+CBXqXDTZLSttZuvjTfZMj1VLW0/JMxFCTPnyMqB2VJiFRKC8W2SDKJZIpN63dITwfIBoXZFEegRwXyIdu1vglmmubYA+9dLTcm3nzJpKS80qRv+Cs98jxlHyJX5WGu8cDxi0JzJQ8UaLXhGRTa7t1sDNMDeJ+3NDh+cRz9G+nhQVThTu71Hgb3BG7sJ0aAOoUJjQT3DSLVGc0N+PdVQCyvT2NLKVUXBlEIBJfCRP9kAUB++lF/IqhJaDCwxGc26eSFe2Sv9dgLWj3xCdnUyc7PSaEtUW42sRxLsR+gyofwAfZstqzJ3h1XczVanNQpWjk2/IQJlFw3BXPaLDuwlP+FBPD3PA6Z+ru5wE1bVFrGzYT7+ZhYF2tX/Ak0bLZoPcTcovAkx7WA9EJ4GpOzTzJ90hKsn78KDSC3Z0SdaQCDCvRPuVeWtbkG5NHpGfH9FZxL+93B8cH8NG9meHe0mQcLMuWTjKu0ydWsbwGaHp8XA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xb8+kuLWFtG/OMZEqzQ2XyMeZ33BZcVVDA7uKfKN7pulrVbwgpC0jA9eiCTriSkn4tMOOh9ROGfXH+JDwDAiuaNCclomreMKsj2xNIF9cfEtauO7sIyDQzXMXzUb6zImg0/D2IcxqmExpd78Q7e+XsVEp3jH+9JlWec8uSZNEgzQJEoo1wzW8UGLWpSd0+AqkQIAtKpsA+ZW+bDiVtjEa8TnasAj67lUflcNsWe5+100jIUeAzKT1Gxs6WTsYYP6iKfkK4DjBgeJDozi00jy+MeQRwfTpu+i2XRfzl4dCFZgGL1HzQRwaE30yigNLtt1aIVeVZi3YT4tAgRuSVubfHpYS2WR89VhaeFW/TUZ4xC5AinimVNxeHt3nOMTifY3WndBIh8snymxF0XcsgmFRHxPg5T5FRs8lCmH31apLvATEz9cvn8dkCp5nAXU1V63
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:52:31.4108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ef0654-f33e-46d5-2e09-08df2952c12e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000047.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026

Now the Alternate Injection support is complete, add it to the present
SNP features.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index fc2029746c50..ba42a1aee7e9 100644
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


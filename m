Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643254;
	b=zpUX4IZtrCiOOvSShs2pM5KqiHBHRSgEokoVfiFOwn/EEs/PnvLAJYG7LeOmh2/FtSv+
	 f7tzXeesSZ/xGmFpJXmlPqpQMMFcxqG7NvubeHCfGGkspniULx722wiZI7tbpuFJUEfMO
	 jQNZk9bja3snmGWDKJ7zzSrPqykP2sgvbiKR3rC91RkMYyNQMNod//hJwYpSGL7u47eNd
	 +7JXK6eXXj2Go0oF9vnh0a41u5VORPXaJdbWu0RME2bZP8gno8FTxRFRrMag/GB9AyWSP
	 kTrtDHFqWZ371wS9GVSWwB7fEU+iPnEPxtVfccO16oilOX0XsMlf1c7Uu20KtKZsRPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643254;
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
	bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
	b=xl34kuIFdsYIX3Az/Dtzrhv7eSQb6JMdCfz4d//LmxFq50L9QhHlGnKgHa+E5CTU0J14
	 bEgJihefk0l/klfOFBwpnc6PuikrAyT8YzJyNLiBVbYUMnnUBggcvtUHJgI4s+tpZyVWh
	 3slhcXKg0wGXItr4QYlrVd8PByx52ZUnktMiuN+drqSeR6Ti83slAb1Jc5piEuKSUh8fg
	 d6Mn05G7XniLi/s6vTwXog2P4J/cUwWjRyLjukx/T58j1PxF1kwaZ4ATB0+LP2jhjVw08
	 RAGAU9ILsE4qxozSqqKXB4YYyjTlgqu7ZmuxVYocWXDmaycOwpqBqypIdxiVFjLa5gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tK50O63H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.27
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB69606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB69606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tK50O63H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAp/TraEcfhFiqBFN13b05P054oT9kreLG+UxC6M67xnZcZy5B9bYxmRiPVq0VrvQp7GJBy55TCTQq98h7t4da1jNVyFDApdszP/fjgMr9s1KIiV/T5CyjLJDMlY/mrr4qhb1wheVjJ45rhSFx+SQ74rs1iTwn3D9jfsf5ZWAuwX+xd76U60MD5+Pt7+5Q80QX9jZAF8am9KENDDoFq5XnFqlZB4UJ7FBc5QOkSWlguE5EW6Abq1OruLYwPZynKGD9DdAThPbeycUrthWkuUuLbGDoA58QXEZ+7jpeEiTpY0X/do3Zdoiljro3UC87TT8QFBwhovY5Yrwr++Wy4TSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=ktMcH6tCyAi4/+2oUdptkHt4nDCM6gtOHMevQHJo/vl2aKU3jIv9tKIzDSSR87IlkWwy7QZgJHKf365rPn926Wy2meHBKc6czEH7vndo1meHRtYpbo8XSo7xQ+qroWYuWXwODkuwJVvHWF5nT2Nax94nV+lJpzhdo0NDISs19Bql2+Q/z07dqJfhJeUKd/BG52FuqJtdKU9lss9va5j1jBe0+qe0Td4n52gYKKj+g0mX9aoqtB4NQWUzu2W4RiXGo+jortpDWwIwArOK38as21OnGPHCdAgP9mibYEjMhOXyQAM+8RKq4sco04Ctl43NYzHqVh2LhE+tN+eZ2guNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=tK50O63HAdlhks3XYrLfnk/sNjje9cGe3b+pWFuFfNk41A0gNfggxzYd6puM4hFUEKnGU4vD9Kz0XXMAu3dPeHaBrtxviebSJ8SkRYErIFyfH8zYg43+fhNr4ObnqnR4N3fTrw46UtAVVlauWgs9vHw+XMZXVmJyXEHqcS+go2M=
Received: from MW4PR04CA0190.namprd04.prod.outlook.com (2603:10b6:303:86::15)
 by DSAPR12MB820198.namprd12.prod.outlook.com (2603:10b6:8:51d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:27:31 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::25) by MW4PR04CA0190.outlook.office365.com
 (2603:10b6:303:86::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 04:27:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:27:30 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:27:29 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 7/7] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Thu, 22 Oct 2026 04:25:43 +0000
Message-ID: <1c9c1bc25888b03bde8349da0dd00eb8faad231b.1792206487.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DSAPR12MB820198:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc1fab7-ace9-4783-6b18-08df2ff4c953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|18002099003|261021123027099003|22082099003|261009223027099003|11063799006|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Bb3sE1ff43YXTIk7rz7dD/si00x4I2Fu8HVvmVqLacQbThPgKpFAciv9nIKySARaU7kXEGbr6Qm4kKVj+ixtGbQRw/Nk8OcvRSPmNAMuo5vNJN0IE6mxT8F42/q0cuXlyIkbVL1rRXGNUJ0sK3PWiUrYHSUyMdKJPKZJsg2vwv4B+rdzFRyQG7p0wKRm4bVN2ZD9O4RIP5t6hhzaHUcHmbHpRaRmiv4iqCiNxfpBjelEREPKnwUCwpYDcl/fzFhBexYzGr9RONjO3awmrorCTN7uymFPdWSAxM99FCTy+GmQAjGJjkw2BTh2NGHYr5dlPpFlF6SaF7ICWa+9Sw9x0g0WxbeQo2zNpDDXl+cD5+TCpW0VnsEk6WgwtY8Cbxd4nfqKE10/6fuvFynIqO8t+GKEYdOqVurDDuxiCEPFFb0jVYfrSgq0Ystt0wPS0Mq9gYTXEg4xlA8DXOMlpIhwVvhC0lMWamRLlaxkTdPoBep1PFwcBz7ms9GtjRdTCeRMO4aFhZSMIgzJTQaPvyu1rcpNmAQzKDHE4iiu2m2iW2QBzJyRf9FNSwkbWkyhfYuILyJXoUC7icjuvh+++JqISW3q+XR+ld3B3fzHI+xqvPPju1ENs4OccqwOG1CS5hgdMYFW5nKaOm8pNUFE3r/1rGI+fNefVcfm3STAtxEDGmdOuM/XPsBxNQV9XZDm8TJXiCcvLJqfn89KfR2HU68uTg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(261021123027099003)(22082099003)(261009223027099003)(11063799006)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OZ5rGqtYHKXO6SsJ/Vc2DGm+bhmCDtCWEq3YOKlIOaoeof1jmCnVFIDC0g4Ogq6wGhL6qlDUPOO8Iohy4+rKObQYwdqr09LmNXDYcyMhcNe12etd1WnZsGf1jnz0/CGCmwRz9JfaoXCnLI8d4WOC/T/kI4TgOHr/czO5VNJ4MKy8b7W7CUWhS7rPrDjcJys7PyzK0nVduSVONo1T4hanNbtME53PcEbGRYbXMINVAYQvtwdt4BR/IkWyscRVOnhUrtLGco/mnFCDO9mpHZui51FKCODD4VHUzlK+1IEpqjm+cW/xhsF/H2ghtXj5zfPUvAif2sj3aPFtU8JM0U1pR4p80R0RYRTiQR783J5s/KGJjS3/oLvRXvx6FNC4UnSaufSld7Z1OosqX5t49bnoj5yT9CjmJdsrktckGEnwGizdv3v6RnQCT5eJF7s9vrfG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:27:30.4855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc1fab7-ace9-4783-6b18-08df2ff4c953
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR12MB820198

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


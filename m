Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928439;
	b=Qg96Lq6BbEaV5JhOeOalt1tYkds1ofW3G5JAWxEjb9M8RiLyDktFK/YMr4SvOl9f+C7o
	 H/X0zFoGHeXmF+ipUP8cdcDNyy104GoxU/RDNzheWvvlG95nfpIql10zr3ARErUeUJBKN
	 gYkPptJmSMDgTRuwYAA9CyHjU9OaurOj7yTbuJZvG68OhHmFUhL90ep3GrhUyRwPCRZuN
	 vF+yoSZeoj48fRa+3Z7MLB+UWLcVa+95dXZwltbdT67IhXLXYj6/wUQ1XSGl/E/hOtFDK
	 aiVFkZbZ5PPG8yRvarZx7gpkrwBX9R3TQ6b/WSquInCyM6xpcbgdFl90i/BDPIVY3sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928439;
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
	b=Wi6afeOJS9YslnCXTvTL6zmOC0etkjfRk5J2qdCRTjWeqgIMzYoG5ZjyrtOj5/WBwly2
	 kHqcyuEFDmCfWa6x184Rt4zaTNb+OcG9t3JBhHG3SqOOTSEzvBxOCcVgODm8KughmBnbC
	 VE4Z0uiJ9tMa1zw7BVXyzEn5D5vsGExcw7do7IFx9TauujYPapH5FDFkfenkfDx4MOCQA
	 DCOhoCSoKlz/Wbj3n/Ux53YvwoGHCK77PT+lepPdx1WQkzK92tGMMtE1qK9/kQYiV/0rD
	 fEG13IOPLA2ftONMsgZ8eUGMUr/TbvJPfmQrUiXvrlVREm+hOpY3pw5t9fnFbBShqAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qltXzZ3r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.47
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052A606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1052A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qltXzZ3r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9EMa71HybN3W30IzlEN4+nyHEZwZgdB8OtyBIznAC4/QzxNEiWPqIrfRIrMIMZgsvt9hkQY7d1XZmVKrt8QH98H379tZP596XBZS1mVbH5IBF7INdMmhJdlvorGHQ60plWnMqYR+XXr5T/DpNec30nmv+RCDRKszd2XJOY4+SAzzgHG1i/Mn3GGtOeyhigL/voDYbtcxWoVzsqVkJH+rpE9cz2/tIkZs1rhMBvnQzsi41f9IvLfqwdbC7sGvety5oIlro8lpQ/3/VDOpZG0JQ4w45NtCKl9unY14MfETmLmFhKp2lHpbmYM8KaOyw2DI7rFpve4Wu2QPJDcTPK/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=F1SvPbgWF5j0uKfieFv3WJE/3GVu0rUkpc08IZ97CM1QpoKaz07n9ckngbp/7VVoXWGVoV4PQo49ZXFZKbDybugXSb/viHlpndYADlU7t+4hpGcIi6Qn9LRqSZLZ6jaZLyG1ex2mkTjknho9j1Nxr02PLjsjoEAHVA71TSKdP6t8+Sq5Cc4FqHV3RaDPZ6VcVAry91XJGZgHBgt3gZYtc5etApx+2hhw/w+jEzkfIma/RSqFwxFjM6aNWzr3PUpt+osPOoFBbtmHP19HeHQ6MfCp8pcN2QoTKTIuvvtcUxToMi2xzpBQTpvPG18jWhrALWfAuA649rgk4gpTefqoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POkXr8B/ilmqJmWbOdrFsL2gRI8YjuDzRHktgGuIYjI=;
 b=qltXzZ3rILieWaDJyLgqXAkb2ar5/jFOl9KtFDe5iHWL6jxrT9bDicL9hoYVW1bbWmvjnlPuKyYpxuzKCP4J6Qr5uygDHA5WBpx+qB/Mq5ADk9dfY2qOguO4Vf3TI56CvWHK9tpAP0gFN2rqO9sqBtxoyL6XNltU3+jt3xnBMC4=
Received: from CH3P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::27)
 by DM4PR12MB9736.namprd12.prod.outlook.com (2603:10b6:8:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:27:15 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:610:1e7:cafe::3b) by CH3P221CA0026.outlook.office365.com
 (2603:10b6:610:1e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 01:27:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:27:15 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:27:11 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 7/7] x86/sev: Indicate that Alternate Injection is supported in the guest
Date: Fri, 6 Nov 2026 01:25:33 +0000
Message-ID: <0aab2845fe78dd02df06533c645888ce86cbf959.1793926736.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|DM4PR12MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: 06885242-17f4-4bef-385f-08df3ba51753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IfFEo1YcGb2ke1FmgNoAPKZe8MXKb7x3TbqN11qh9XJXNSSoVApdjd3uRMdldbV5l+t79A1w6rLYtUX9FJpGJ3ExIrQ0elc9FoGFve/Gvx9ZfOgOsNfMmRog12jIVwXoYap3/VqKxQBVLtaZygIv+spDdvzftWuKRW9Wyx9BTDmeTzGxd7ed9FaRR7PpOWmY71K1cUWAKwR6JXZdKJMK8AeeD8fOO8f92tH2HEbZOsoWy0evCyjGSUC1f063DwBJAVen9h7dX2PDzIqyz3UHaKCiSOIEm7x/a9i1knckHyIflMIwhvWkwHcpukunvgVlzY5Rt9Tck4MC3rmvdvX/N/TQGb8Cp4VOTpWpGKz1Xcyfy3Y2E4M93gc4hNnYY4HIdv34YHPRr8A/VgFKvbg33j+hmulr1oDgOfHKC96PNsgDLxhSN+fcLT7rdeFGm2RlTFUT9ZJYxEEnd7r/QMKg8xbYrTcAMnn3F3bOET7TNAEuN1wWdABqgLs7YJe1cgVzjD9f/efgZs5cddtjMX85PMuG9Gjt0Yv7uAAoxN4DJZOEGGWdGCxXXEcKMDOsMYucpQRZ8uNGXnttdX+mbXUu9T3Wg7q0Q8HrfXFRN7Nre8Mis9lZ/5vwFiYYTm1iVCuX1w3ZfBNS+0H+/XBWoikg6FSkDkB9Vs+Hdm9EqOqYcFos4Wi9ZdiqqYJPPaB2fpDLwAVPySagB2jtgIEN+rjtHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	36K8P040pXon29wzT1IUysgh+QNkMgLuwgC20hj20bje40BRnvw93jwTd56FsH8e2m4+sxXwZjJAlEe07Oa3Qn0wyBYSEAFQwwbNXInncgxNFX6t0igqhzOOgErq3u4fCY9LH8zD3MgFuiUtfXBOuTaRzAcyOBPVaO5vU8KXajqeGFXsTZetQiCSEI7kdc6lOkUFzSfiKCxG1TIC8Wf0swuGMQXV1Smy0wJektFoIfvHuI02V6GC09m1w5+KibU+GdmyU5ZVeKtSAm/adwyOqxtD55qm/qy3EG3XdUjHYimHA+/NhId0bUYQGXZvSonbGgv72b9ZvgBPwRsg9dtJl2kqZx4FMHKXp0+mSmQdgkyNpLkIrlVqkuddtCEGxZHkop3ufyWvj/ajoVlt2xwD71aHQZm+2YPtmXEKQFGLzDlYgDjWs4wO7xbjYwRuj1AC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:27:15.6434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06885242-17f4-4bef-385f-08df3ba51753
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9736

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


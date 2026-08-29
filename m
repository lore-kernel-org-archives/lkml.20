Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D82C11FA
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974821; cv=fail; b=Zp87h3IdcZ35CSqkN1NZnArimnQkn5HcGWhW1I32p+r4hA1ptRm9EIGCq4QLLOhpmqg2u/joICdBrSH/yPbU9J5QoUm6ITXKaI+rRX300fkboOeK01ZpT6+be6JeB/PuwpnsW+r4ZXvYenYWQWgHNUA7nFYgMYsI2DazoPXE5NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974821; c=relaxed/simple;
	bh=MS+xw9UsGxRyQQUMQlDEmWfonRalQNhfNEYTXdmNjBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvklT0Y/7xmh2unj6VDRrdxllqS7/dS9tQOjfSeKOh3Oj2HLXklrcH2NDn4DY9qVm8+nFYP8wgFf1YZLmuLL5eKv1gNZjbaixoNYwDHZDhWB2cLGsWpA9kYSKlrtsvGdkB1z+KwGTeoGwuXcgUYAabSrTxEoi+XCj/qieEwCnV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4ORPGX1Q; arc=fail smtp.client-ip=52.101.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4ORPGX1Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6CczA/Zc2oFeqrqYfLQivhvIidryz9rbDb5UzKZOPyJ5Rwk1umN8wtUekf+y5pDxUn7n4xGN+QTt1LJVCrUsqzrmt0UfVX9Xb4zGZ6kyp/WnbVTn6wad77Xwvosd8tikqpeBSoAqL3S92xELqn1jIhQevxZozk+cd7ZLJF7EeMEhh+M6uXvXI9pjKuHSZuaMJ8dy1cQ9xAwoBNmaiBNm2+VHk38UfimXB18al0LpANeaTENgYkqMMgOxAISLdzcel4lbXKqzLJmtYdtz1juQNg2/2X0TyxFwVQAJOOQ4u+ftIyddu1YSv04dB3hPR0tvJF3u0Yjn5RzFgbmgYr8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsTf2oQ6R1vzbXRtpz2mMGGuOYvS6XYLIeOSI5NvYEM=;
 b=apa02Z1h7DhAP8/KkBTPpGlt3FHo1pqhqEGMHm6rY6oMIwnObGjVPalQiB7yXc6r8yBK3Ul8uuSYYvcuk7BmUfCd3P+K+YYOeSfVB9GOu11RbUpKL92/EFrNhGD1uvXkVUjNIaNlsLLgJUksjbVS4rjzwhWtWfjE8bmc+df8IspAIyB3O9AEVpOZibFW/34zKuhJ65+2z5AKIpPFaBtxrCc1MPdEnHNrwXH7h54z/BDdiKFbe35v66+CeLsEUBneO0f38P+ZVO7rYTwYaVxHgxkHujVqMMd5zuRYL8/grqm9f01D5hRWKmvGK5bsBmahwOi4/hlmwf7IIhe6EsUYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsTf2oQ6R1vzbXRtpz2mMGGuOYvS6XYLIeOSI5NvYEM=;
 b=4ORPGX1QF5fysE+2jXuMCTiMCdCr5Oo/9Pvew6viNhT2mSkxZpmk4YRVL3nKmbP3vCfWk0H/AkHB7GNhdhZrOvC6228tEDhd8q1+Qe68e2s8R2NR9g4RGe0umWcBfZFelr9Zp3OOCMmkGT+Xu+jN6pyRkir3Ymr47j6OU9NJNAo=
Received: from BN0PR04CA0083.namprd04.prod.outlook.com (2603:10b6:408:ea::28)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:40:14 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::94) by BN0PR04CA0083.outlook.office365.com
 (2603:10b6:408:ea::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:40:13 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:40:13 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 1/8] x86/sev: Make SVSM calls preemption-safe
Date: Sat, 29 Aug 2026 03:39:39 +0000
Message-ID: <8e6e89b87e34a8eb2a20d52b0d92c26e7a61ac42.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dc0293-9d30-4dca-eabf-08df057f3c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dx+P2RdnXg9CSGMikiso7ttd5c/KfoZCtuHXuMF5D2+waOcqWqy9vsksWWkC0Q5+IQ09MLgzgbQlOrjk0RnVwAvycgnfYcBHOKGPEw/o5jLRxpF7sKZKdFelGZ12AP0PmzHtcPCsQFK/h3NS5dnmvB/Irf0Q6CQr0zRNZsBLPTjD9xEtv6i7fvnhLKhkwAXpVZFPJu1D376cjhgv5qbifQFM+tkHsBnHLbZyrZRHba5BbafwwlBjqnocI07H+QSj5DC4iDax94Ld+ZR3N9Jv/TAx7LgOBxD1iVEclXoJWQ9IYNiOaKcHmNzIoS6ztT5AqCyq8TEnerpkVTCZJLI4fqUdHnwfwKNuFV+T5jKKDGpMtrtSnD6fnqwnROQcaSEgT1wTrH5aekKIaEozfBWQlKzhNEq3J6vWbyEFCupHYtCXfWg3XWjG6jH431p2S0lEoeLdd2tbc7dVlL3dR67mNn4nWHWu8ECj3Vnm9WgF0+Z0RW8jxTi1mSEeCQiQJ0JXuXrowR/dBzNL2ioFRApH8JcegkezYnEKsIBKHZvrdB3qgUzcoBF7Jl9r0ZVzM2+H3WIDtxDErb4U7b9cdlUWa8i/kLhcmak4KnJwETE6GCG9nAYb0WHVT/vkgfJ0ESmgMQ0FzhfV9gQRx2/g0yMU6WS/xLndwtqAfBuuGqLc3SbGJDF7/wtUnWSSdaMiSfWFSA6F1BqOwVoVS9C6rclK/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9mqoecRRxa1CTA0kVnozeJ7CYag8a4I9nYCYZJ500Dwm//RkT99HkWJmpFJmNwTqEmkPCvZTKqUCkv8A39Yv/cEWInCOwrTY4SpmBerA+Ukfsa5dvYHKkwuaD1+hnNOlAFq69GvChZIgYarYUunFPOuXHWBoHAHaqi/FxOfRwJpM0nq4W2SFshe7V5qd/nWs5CkQKXH5v4/YI8VBpK8BVNHC3J4W4LJUJBHa5qkRzRO+UH4ENOJ8vrVIHxPW6FJATF7RQ9pdlLj/tOLYIyNj0pjLHkqXIkr/zt9uXNA/tTkIqlfnej/YkwDqWdR10EATOqIjWuCuFwmEXIEMWdTQLqJKRrL1kUP1e5zd/FGA68KjCWZ1HrAVBm5ThNKKXFijeFYIxEhby2emkXV35Z8qzj/6/O86/SVRCkGrbk2IxcgPo1w8eB+mX5yjyNwKDTjz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:40:13.6601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dc0293-9d30-4dca-eabf-08df057f3c16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885

Two functions in the the SVSM vTPM guest implementation do not disable
preemption when fetching CAA.

The SVSM calling area is a per-CPU structure. When a thread is preempted
and migrated to a different CPU after fetching the per-CPU Calling Area
Address (CAA), the SVSM call will execute on the new CPU with the
original CPU's CAA. Which is wrong.

Move the CAA fetching operation inside svsm_perform_call_protocol()
which disables interrupts around the SVSM call and thus runs
preemption-safe.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/coco/sev/svsm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/svsm.c b/arch/x86/coco/sev/svsm.c
index 916d62cd17dc..92ea93f506c0 100644
--- a/arch/x86/coco/sev/svsm.c
+++ b/arch/x86/coco/sev/svsm.c
@@ -74,6 +74,15 @@ int svsm_perform_call_protocol(struct svsm_call *call)
 
 	flags = native_local_irq_save();
 
+	/*
+	 * 'caa' is a per-CPU variable. To avoid using a stale or incorrect
+	 * 'caa' if the task is preempted or migrates to another CPU after it
+	 * is fetched, always fetch 'caa' and then issue the SVSM call with
+	 * interrupts disabled. This ensures the correct 'caa' is used even
+	 * under preemption or CPU migration.
+	 */
+	call->caa = svsm_get_caa();
+
 	ghcb = __sev_get_ghcb(&state);
 
 	do {
@@ -321,7 +330,6 @@ int snp_svsm_vtpm_send_command(u8 *buffer)
 {
 	struct svsm_call call = {};
 
-	call.caa = svsm_get_caa();
 	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
 	call.rcx = __pa(buffer);
 
@@ -345,7 +353,6 @@ bool snp_svsm_vtpm_probe(void)
 	if (!snp_vmpl)
 		return false;
 
-	call.caa = svsm_get_caa();
 	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
 
 	if (svsm_perform_call_protocol(&call))
-- 
2.43.0


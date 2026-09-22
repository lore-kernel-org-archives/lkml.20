Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC72D4C33CD;
	Tue, 22 Sep 2026 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108646; cv=fail; b=HL9wa3/A8zBFeyRYbLy3EvCZ8AYBMP4e8XrgFxjSy2tp9vjLg1hEooK20U4u7FZRm/lawaF4kS/MW+9b6qyZp99IGbzseFo2Gk4lXDDz0EWXQbjlmoEHIR+MxjbzXaSnp9o8mSOIlROv2xYPf7GuOHiQE4Jr33w6VqMxnwnUFOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108646; c=relaxed/simple;
	bh=wcXTiJ4iKzgDwkCBXCsrGhnKj/GrMG6GBuMms7eop30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaKhTwljdzh3+BK+KnNWpzfx/YYrFfNQAWF4NWw1vcWtAgoikc5O9DcaTVnNnTaQ/NuVGggENeiQ+wILw1lo1dMSF40koPGDkvAGsF5eLmhroS6Y5GJAAXI5aHDpTf58UtTYtczc7BWkKHm6D1BPeZYUdHXDdL+EBkkfbGlDdjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yHjjklTN; arc=fail smtp.client-ip=40.107.209.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yHjjklTN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2Z8TB3xwGrPFT9U5SoWK3ZmtK8J5eKohMVtIGoysb01GIPBhJGjAp2ESrDzV2eDVSOreyRQ8F4WCUo7wRjhZVxjSnBvu5agFcVf4O91QZ+PUMD8YpmL3o/dg+OAQQNRCLrx9vmYfmtXwq4TZxdDSh01Lv1lYFp75Y88by8q+Y5g4QwMszAPAtsEmT4TjVSFB+idxzeDIhcakGMLNl6INyyIj1rRmsva09487VPN035qBrF7JYbA9VwP92mgO1cvnW2sGCvNySIioJJIFm+HVBdrchsB4XM0R/yH98kOJKLHNNF0E9LMWm/e7zqveEyZHiLhKTGtlrYi9jv2rL2XpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROx5WcDztuEAjn6hBciXYbBkgPEq/HUz/0B6DLfOWuI=;
 b=Ipt9ELxIrdgpTf0T2Xe3y43SAEoyMKQlZ7xcGxMiJg++Kga6T16JHperk3WXYb6qMCcdbPbgb0cjVQxUvoDDXIbBlGlf2dsC1mbHxr03ldZDGfGrKKHYZUt9OT0W5nFAQ4JeqUGrrqTO9Sr/vOC2cWhQw9ChPAd/kmvcpFa+T1tNtEaOhsz+R1zIXgLDjOTqz4LNRy2qoYEklKFGNkuF/c2wyPPCkluEu/xj2jDAKAyqyvk7JbsL2AjLMti+wdTHjb2Mthp6z9xRhIS3lHNj2HETWvl6IGjyFA2ydAIvKucld7I5vmG1hbxDnlr0xQxGIYKGDdeDLyovtQ3ZD/Yt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROx5WcDztuEAjn6hBciXYbBkgPEq/HUz/0B6DLfOWuI=;
 b=yHjjklTNn2sgPMNZ0/PvJw2RDLPADaFSCvInghA1ZtV9/xBjQALizNXTDjed1Sz0eGHLlVLwT2XzAVLSB+AXfP+uUTFTxR97xUcbaklHnFbNV0mOk0XRLu+Zr5SmvgrtXIiBYEiQxZVUCZNkq8iIeMnd8dAZehyjF8lCJI2kGJg=
Received: from SJ0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:2c0::7)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 20:23:38 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::42) by SJ0PR13CA0002.outlook.office365.com
 (2603:10b6:a03:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Tue,
 22 Sep 2026 20:23:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:35 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:29 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 2/7] RAS/AMD/ATL: Refactor PRM address translation into a common helper
Date: Tue, 22 Sep 2026 15:23:12 -0500
Message-ID: <20260922202318.4079080-3-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922202318.4079080-1-yazen.ghannam@amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 5751d30f-c1c4-40f7-19d4-08df18e76151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|5023799004|56012099006|3023799007|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Cfcs0z9hB5H5o5go1ivPWYjs/HK8AdGJN4S6kT7PBQC9XE5KX0+IZwlA9Y+9CR6Cv1X/Hzp1g+4PXlN9y1uRaECWYwmWiA9UhdRTvoh333PBfzamSGgP2ueVxeiGojveIbGtu67noeL29d77K4qP+ke5l0t3zYTeXILEr9y2kqGKk6xQsF7Wt/YJN4RItxXKdAiKDZMW1Vo8csxW0ZQAW+pJGm03gOBoy3fSy0t0btdhul66iC72DOlu12DeEGEcxFnOq+V8VyDARcYjV2vOXnShmfd+GT60fcoaE0XEF9QgR92qO1zHhzyvhbxViX/RnTCvy6aAG1oTK+XIJ9FrXNAZtWG6cWzPwziiwNzocO6mtgAsoj0tqj7E6XlphnrjQV7STs4u0ZoRjNv1XFfj/TjKu83D/JxRtGIjmTScIHandO2V2BAMG7v4WcS3gXRlmgWNyRAt4MEN8s2WOWhqWHKW26FaRUj9J54q7KlhUKoixbGEX+y6bh3LKRigBf5jcywbTGmwW24Z2wjfoi0bO9XecMfAbyF5nxh1jIEbz8hnCTVdawwOHcBTkifB7gQzD2+PJ0vnGplLvzJRzOTw3HMkE3zPmjjcXs3QI04aE6pZ9/C+c3aHhjyq5QY+Dxm0sYdVAIW4tZFDwETGpXCBLxMV50htHTaWuxgXpVMhzBNS5FaALTLCh2aFJggB5r33ZHoGxTG+N7j1ZvMhzd/Odg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(5023799004)(56012099006)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KsTtBUrfxJ93H45DJ2oPCblKzHfUMdZmKxCGzHfu8Ikcn9XpqcVarpa4UOB8dFe4jcXafKUJP48p3z8sY52CbwteJMFp7RuSaaQRevmS8sS8IczJ2Yrbh+NBO2WK+KSFKlKX7mHCIkO1oh3ldLnI0yh7NPHHol8fYtI2JYmYPWFk5J2tO/f2wZoRpteUPrCcXbXdMWw/+WCTr+Rgna7iQEEs4aOMT9KGr2WzPUia+u79j+2UdDb1UKZeD09IwBuRAyiYwItMPwMMwVamGuLXYXRU7i6uorpzKrCdZLi1t7Rd70NWRTURYrqZEN28IoPWTO1fadlYFMHSGblqg+p85J93+Axi3+YG1T1wj0/yw6Y4uVZfA+F1BLiFh93nt9JoG2LnZFwtFzMY1sT6mu7mWV4Vhlrst3Zy8dsk5IrE8Fz9zsmKcPI68Bc4T9xaFYfq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:35.7872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5751d30f-c1c4-40f7-19d4-08df18e76151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759

Every PRM address translation follows the same pattern. Each fills a
parameter buffer, invokes the handler, and checks the result. Only the
handler GUID and the output buffer differ.

Factor the common sequence into prm_umc_norm_to_addr().

Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/prm.c | 42 +++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index eba9d104d09e..b3ff33a668c2 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -18,36 +18,44 @@
 
 #include <linux/prmt.h>
 
-/*
- * PRM parameter buffer - normalized to system physical address, as described
- * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide.
- */
-struct norm_to_sys_param_buf {
+/* See "PRM Parameter Buffer" in the AMD ACPI Porting Guide. */
+struct param_buf {
 	u64 norm_addr;
 	u8 socket;
 	u64 bank_id;
 	void *out_buf;
 } __packed;
 
-unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+static int prm_umc_norm_to_addr(guid_t guid, struct param_buf *p_buf)
 {
-	struct norm_to_sys_param_buf p_buf;
-	unsigned long ret_addr;
 	int ret;
 
-	p_buf.norm_addr = addr;
-	p_buf.socket    = socket_id;
-	p_buf.bank_id   = bank_id;
-	p_buf.out_buf   = &ret_addr;
-
-	ret = acpi_call_prm_handler(norm_to_sys_guid, &p_buf);
+	ret = acpi_call_prm_handler(guid, p_buf);
 	if (!ret)
-		return ret_addr;
+		return 0;
 
 	if (ret == -ENODEV || ret == -EOPNOTSUPP)
-		pr_debug("PRM module/handler not available\n");
+		pr_debug("PRM module/handler not available: %d\n", ret);
 	else
-		pr_notice_once("PRM address translation failed\n");
+		pr_notice_once("PRM address translation failed: %d\n", ret);
 
 	return ret;
 }
+
+unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
+{
+	unsigned long sys_addr;
+	struct param_buf p_buf = {
+		.norm_addr	= addr,
+		.socket		= socket_id,
+		.bank_id	= bank_id,
+		.out_buf	= &sys_addr,
+	};
+	int ret;
+
+	ret = prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf);
+	if (ret)
+		return ret;
+
+	return sys_addr;
+}
-- 
2.43.0


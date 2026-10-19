Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792428503;
	b=iG1aSGTLe7mqZPATY+itScCZ2TadXXDKGElwKbvX1xLfh53mMb7yvx3DNNgEOSWc1Q/S
	 xJmsFfwozNm0qIuwE5j5SN6UbCdoyKwFejylHO1JeEhQAGEdwntVX4D1q8mCtn5LwRuWK
	 lnwPj/jmGNB4mrBnvO9hij/O/jo7G6SeyvKLrrg0fBhlbkiJKSDa/DOV60JCuVufR8E9K
	 c3NgDhtygwHH05KseUD2cXH9vPH3loXz9gHB9QNiJnqrQmt5Xs8yZMgJyRzKGc40xr2+t
	 +ZcSfDzU6EsGxADOZM6a+bmgYWE7blEKapbvlAb9VZerxI5FYFoavhN7eDwpQ42c+kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428503;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=USy85UpfrJEBJ3d1tHMR+kjZEqTQKYWZpSm4PzYNaK4=;
	b=qfEE/SsEW1Kj+Mfz5DuMml+nX+lgmHBjNaeYor1p1njTxoymMInMcfMr1iikT+cOog4E
	 2Sh9wosHwzid9mPcHvqWqeuAKDIPSFW/CqOxDMAYJXCPNzAEY3s3J4B9xo6yeFAdBywkK
	 YCXGqEiwEeSBN9fQQbg+Xv5OMAPmDMRhfm3FE7WA+gNCDlHyptgZeJKElC7au8SYj5OYH
	 Qyx7ZEHMClmwjSvOWvuQq09mA0doSnbszaLShmvTrgeL5PNUrGlqKPe4i0AkaAk6MrLt2
	 SI1HoMOrFoYU5pPRcw6uYS+WCmDSGYYEzOUp22R8Gkoh47zzbmeNqKMxOQpKoCUTYYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3XlsiBjG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.63
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9E60A6F43
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C9E60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3XlsiBjG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiJ3alJEQut4sDietB4Pd0RaD2VMLTBRFHOSdqZN1n54ZYWjEinOvcxpP9CcIN4D0yRA+o26dWsDvw919MNAAVSm+iloBCcLfDeXUh2nTwvWiAHbSQUfZ08THB5SP7rIl3FV5mlu+JKaDItp+FwCFxPKyk/TNMYti8zFfL8CBc6nBKfeKA7YcVZuwnYUzTw8CYtQelFBdHIpsIuPoh0/jXAzg14Y+jHjCuCoUJ+G2Np1FafdvF9EQ8n7uIC3MPZewXzyaFXJFnZjJjqH8HAiLKPg+QR7aNv8lhaLB44gQbe1jMHXrCnJOH6wZE0DeWxU66PjqaMxxyrmcGIaSbvHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USy85UpfrJEBJ3d1tHMR+kjZEqTQKYWZpSm4PzYNaK4=;
 b=STcbTXGXr7aiaHt7dafizMsMau4+fIPPxI/+ITOzUl/lSQoOEdAh+jSBVEqQ8NvwQ6GApHA4caKVDJSHHZLWJNY2uqGBgtKpuYHsZj+stwL7HBV9BCMqizXkG/d1SdjNQvvLKTZKr3YSSaDeuWlvWbhLy3dh+f3EZpMuMIXOGrxt5iMUL5pMoof6ADlY68cB3aYNRPNGUDV/vNYe5H6vyGfbvzUNUcnviWqJGWGbb55fJTIQgC5/ENyg89qZCSaP/luSnZ4sFinMn8Ns0Y6Pe4xkI44Boj6F2XiD7xWzaSEl4SeR7BQ6G5PVz0BXkDEjd7A/cqgoRLdz79jQmngC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USy85UpfrJEBJ3d1tHMR+kjZEqTQKYWZpSm4PzYNaK4=;
 b=3XlsiBjGDAkclugGtudBs1WiZNOEMK15vY613cbCZENJ3GNOP8pFWzyjZRYhZ/SRU/opHiHt9yFhffelS4cDI2UqyPaZZYhD3QcKsF9tcTZBOoVzQm2FWOYDF+1mF53oxIz+mTFm+TtNs1132syhoO2TxGnvMYTkawcZN3t1eaM=
Received: from PH7P220CA0134.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::34)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:48:17 +0000
Received: from PH1PEPF00062F27.namprd02.prod.outlook.com
 (2603:10b6:510:327:cafe::7e) by PH7P220CA0134.outlook.office365.com
 (2603:10b6:510:327::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 16:48:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F27.mail.protection.outlook.com (10.167.243.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:48:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 11:47:55 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 11:47:54 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 11:47:54 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V5 15/19] accel/amdxdna: Make populate_range common for AIE2 and AIE4
Date: Mon, 19 Oct 2026 09:47:42 -0700
Message-ID: <20261019164746.827277-16-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019164746.827277-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20261019164746.827277-1-yidong.zhang@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F27:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: abddbd9d-babd-44bc-99c0-08df2e00c661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jtFREleFOMDXSlTgg4HFXFXwloftw7Io2WCHNNa11eTsBKlsABi5669TL8TNlYj0puBL7tlwT6m68sV06wA4GSOOwH4Xk1f+Dpkjo43YWrSJoXsAzngxanNg0AiY8ehPElYI1VEMuEVTfXa/RWx9nlTWcYkFJO0n6MEwJ4IOLOH/8mzA8W8HLOXTzhZrRiiG3HpSCO91YchbIV3YIuW1lsn+amqsz0uZbF+jKXiLizoG5mSRp9fWUCe3nllUaIxfKfO351mvAsJjyHPFeUizN2u1puQn38xZJFrXYiNcVIbqYhc/tfPonKW8GVqZwDFF6LwOHR35Dt60tC3DS52I4ZD5o0bJApSLxbRLHDwhXmaTYnyCVppra6K10w4acrsO/jNSozRlRwpTpHzOzFczuRNlHbQF38VJiPGpae3sS1da6EJaz7fOBgd+E6KzsnMwV4sZUZBMF8wGEuKJ3oU0CHNkEuj+M8WPItNIRqkiKnMG+R1fCzrcNollRIEDDPzMmGUcLqWBb4CO+Gnd+JfRJW/gJR9MzHEvKudnR2nBPOsEkHwTvBZy/UopPfNYFwWXSEd6+L13FG0XJBVPO/7yB1EKeggA8rEuZBP2VqQz7QVBkgkHStH5MpTuFalIvMac7rhnaYp6sxv5QGIrBKJu+kFDhDCtR6UNEtfPMzRCw5k1bD1pqWOxUfmoK6zMBMbTULZpkbopnCK8TGFwlJ663A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dvOQdA143HZ6ZFEqAj7z85fLa9dAAkdmuvFtFtSWZvpnB38UXW83UWHIdoeO5NGYAHBfyUuWgTKYtSnLoXUT176EQR6/hdVZtSLqDEelQ2odabzlXzHP9OIWECPJwoQq/B1X6PSHljtPna9H4x5ZuquuZuE7L77Il7Q6OntW8muJrir8ZqoxgXnoq3wPtWew1ztGjFGHwI/Wce/BV+3mLkraHtWoP0Vv3JDS3JDDEwiU66k/Mr3oJ+H+JlUmLVvjDf6DocM9dJ33U1KRdGoKQv4bKkqQLmkwSCxbU0h7cEudxojSJZtH4KgjlSP3kw/DCc1OClushIGha8gbR64mqrXOAth2nOMa8Kw147qaYZBUh27ePNt1+ifCk0B8tQ/60V+w3Y4bbsXpUfv2/Xs/OIQv/bY7OsyzAu6g+BkFqlfqQFI3asNnWYelWw0HtrTI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:48:17.1941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abddbd9d-babd-44bc-99c0-08df2e00c661
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F27.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

When a user mapping of a BO is invalidated, the MMU notifier sets
map_invalid and command submission must fault the range back in
before attaching the job fence. AIE2 does this in
aie2_populate_range(), which AIE4 command submission also needs.

Move aie2_populate_range() from aie2_ctx.c into amdxdna_gem.c as
amdxdna_populate_range(), next to the MMU notifier code, and declare
it in amdxdna_gem.h. No functional change for AIE2.

Signed-off-by: David Zhang <yidong.zhang@amd.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 80 +----------------------------
 drivers/accel/amdxdna/amdxdna_gem.c | 78 ++++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h |  1 +
 3 files changed, 80 insertions(+), 79 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 1c3cc32f119b..e1c0e0689b12 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1111,84 +1111,6 @@ int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
 	return ret;
 }
 
-static int aie2_populate_range(struct amdxdna_gem_obj *abo)
-{
-	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
-	struct amdxdna_umap *mapp;
-	unsigned long timeout;
-	struct mm_struct *mm;
-	bool found;
-	int ret;
-
-	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-again:
-	found = false;
-	down_write(&xdna->notifier_lock);
-	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
-		/*
-		 * Skip entries that have already been unmapped.
-		 *
-		 * If userspace unmaps the address and later submits I/O using
-		 * it, the IOMMU will reject the access and report a fault.
-		 * Ignore such entries here.
-		 */
-		if (mapp->unmapped)
-			continue;
-
-		if (mapp->invalid && kref_get_unless_zero(&mapp->refcnt)) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		/*
-		 * This also covers the case where all mappings have been
-		 * removed. There are no invalid mappings left to process.
-		 * Any subsequent I/O using the unmapped address will be
-		 * rejected by the IOMMU.
-		 */
-		abo->mem.map_invalid = false;
-		up_write(&xdna->notifier_lock);
-		return 0;
-	}
-
-	up_write(&xdna->notifier_lock);
-
-	mm = mapp->notifier.mm;
-	if (!mmget_not_zero(mm)) {
-		amdxdna_umap_put(mapp);
-		return -EFAULT;
-	}
-
-	mutex_lock(&mapp->lock);
-	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
-	if (ret) {
-		mutex_unlock(&mapp->lock);
-		goto put_mm;
-	}
-
-	down_write(&xdna->notifier_lock);
-	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
-		up_write(&xdna->notifier_lock);
-		mutex_unlock(&mapp->lock);
-		amdxdna_umap_put(mapp);
-		mmput(mm);
-		goto again;
-	}
-	mapp->invalid = false;
-	up_write(&xdna->notifier_lock);
-	mutex_unlock(&mapp->lock);
-	amdxdna_umap_put(mapp);
-	mmput(mm);
-	goto again;
-
-put_mm:
-	amdxdna_umap_put(mapp);
-	mmput(mm);
-	return ret == -EBUSY ? -ETIME : ret;
-}
-
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -1248,7 +1170,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 				goto cleanup_job;
 			}
 
-			ret = aie2_populate_range(abo);
+			ret = amdxdna_populate_range(abo);
 			if (ret)
 				goto cleanup_job;
 			goto retry;
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 0af1506f6363..46b9f6c960d7 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -333,6 +333,84 @@ void amdxdna_umap_put(struct amdxdna_umap *mapp)
 	kref_put(&mapp->refcnt, amdxdna_umap_release);
 }
 
+int amdxdna_populate_range(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct amdxdna_umap *mapp;
+	unsigned long timeout;
+	struct mm_struct *mm;
+	bool found;
+	int ret;
+
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+again:
+	found = false;
+	down_write(&xdna->notifier_lock);
+	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
+		/*
+		 * Skip entries that have already been unmapped.
+		 *
+		 * If userspace unmaps the address and later submits I/O using
+		 * it, the IOMMU will reject the access and report a fault.
+		 * Ignore such entries here.
+		 */
+		if (mapp->unmapped)
+			continue;
+
+		if (mapp->invalid && kref_get_unless_zero(&mapp->refcnt)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		/*
+		 * This also covers the case where all mappings have been
+		 * removed. There are no invalid mappings left to process.
+		 * Any subsequent I/O using the unmapped address will be
+		 * rejected by the IOMMU.
+		 */
+		abo->mem.map_invalid = false;
+		up_write(&xdna->notifier_lock);
+		return 0;
+	}
+
+	up_write(&xdna->notifier_lock);
+
+	mm = mapp->notifier.mm;
+	if (!mmget_not_zero(mm)) {
+		amdxdna_umap_put(mapp);
+		return -EFAULT;
+	}
+
+	mutex_lock(&mapp->lock);
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret) {
+		mutex_unlock(&mapp->lock);
+		goto put_mm;
+	}
+
+	down_write(&xdna->notifier_lock);
+	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
+		up_write(&xdna->notifier_lock);
+		mutex_unlock(&mapp->lock);
+		amdxdna_umap_put(mapp);
+		mmput(mm);
+		goto again;
+	}
+	mapp->invalid = false;
+	up_write(&xdna->notifier_lock);
+	mutex_unlock(&mapp->lock);
+	amdxdna_umap_put(mapp);
+	mmput(mm);
+	goto again;
+
+put_mm:
+	amdxdna_umap_put(mapp);
+	mmput(mm);
+	return ret == -EBUSY ? -ETIME : ret;
+}
+
 static void amdxdna_hmm_unreg_work(struct work_struct *work)
 {
 	struct amdxdna_gem_obj *abo = container_of(work, struct amdxdna_gem_obj,
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index 456a537eb68c..5c429869992e 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -104,6 +104,7 @@ static inline u64 amdxdna_obj_dma_addr(struct amdxdna_gem_obj *abo)
 }
 
 void amdxdna_umap_put(struct amdxdna_umap *mapp);
+int amdxdna_populate_range(struct amdxdna_gem_obj *abo);
 void amdxdna_gem_heap_free(struct amdxdna_client *client, struct amdxdna_gem_obj *abo);
 
 struct drm_gem_object *
-- 
2.34.1


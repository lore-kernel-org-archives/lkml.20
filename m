Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990571;
	b=avoxDxphSGQOVimIcxrpH/vd2XtrN2RZU+6ywwRczsw3Xer8CNCiGCjaV0ccpYpXT/kW
	 u3V3QxvEHNk3e61wkjtN/r0pLdZCsDedvKqjv7zzhCXJfVsWlR/G49YD0ceYWAcSCeDg0
	 ssRtDLy4n7S4yAigy40XWdyhNNK9FaCr3pWyy1LTtCLQZm1jFDByYppHvy5FmOpwm/jl7
	 emjrVUlCS9DZFtfhESpjTwFRAsUdWJU/2VUYghpxwHvLRgarCBvFzJC7WdtCGZZdYoD/9
	 +N3HD47ywOzXqOq6+UDYcbLAoa9/gtCGArYoJzflo1PPlitqgGYprV6MTs0Cx2OAZUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990571;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=Nk5su1MJTCoyBP+48he1QNLgng4jrDHUaheHP990Fq8=;
	b=pxHiIqaTSJVh9v2KzlcoDU+79wPbh1q9oDEyrbDfkUOQt13kLPaoNUXxJJWyQqO0tGnF
	 FCmAHXbaqtR98yfUhVgnvCJtGMYmVYe2A1S2Q4gE76SM8y/SJXdNyyCKjRFXZB6dmLNTd
	 dNZcn9xN/2hYkYOC51rx2CNG2OYbmcbyWQMAUhEdgSI1+Wk5qdC8v/xTO0D8OEhPiZS8t
	 P41asgVhPZGIr9oEUnyjPlzOJcegGpa9N3mAD0ctcYsQvQNGJ0rE1a9xatEIPCZftfEaf
	 qcuFNHp0uV16VfGj5J+n1zKwlqdfVrpPjvqGpbaP/sPlK5mYWHRgB1TjDK3woKlb35w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o+SGWGfL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.13
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013013.outbound.protection.outlook.com [40.93.201.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28747606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28747606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o+SGWGfL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWqW6HUq+xzlOFkx31+ECdzZFxEWuH6EmxmM5TPe7X1R1soFc75wjYFyZRk2cJ05t2r9Dc45tBcDjAFVIKjkoYKsox20dRgCjaH3pHXQnJ8rT0uBscQ+fydnoBLI3mHZX2sjJf4xXbTO29va597i5LvY3IJXUU0NkL8WJtUPGco6ZAsBxq3fdRUTm55/EIsPeObrRX9wH8Wg3+x4LRFp0PFNOZqAFyVTdYYlvHnsI8dPEVKtxPUGcW33xnuEnBMVCsPIyvYKlkPdeVZS10sDMarAGg15/fDs3+sVWN6F7wjQRCYjr2iPtxAnbtsUECePiYY8hvnjpzhoR5SCxrCKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk5su1MJTCoyBP+48he1QNLgng4jrDHUaheHP990Fq8=;
 b=qq2qcnKnELRK5BiOcP+PONXgLnbAYry1NiPrzfKKqdVKHPvZFVjYpAQtwNo2c0Udatx+ASM5NtSwQx8qYmwb5w7IHMxYEkso1eMbeEoXnbiULviDmvP3RgxD22N5RvYCDwX8QrG67nHjFdEmJPes8wArFu/F5qo8UI80XkUPbynq6qXAxUTpimcpBpHOTIusRJ2m2Fmq545P8VmRA2PJSmfTETTP3hVy+nEJdIHTogafjISa5Qcko83pu8JJ+EMJqVOkU1Cwiy5gRyye/MC6GCzAtUwdGoo8bW9gP4c3dT6CLz8xIwUnDOghxMn4YGYpVDmFfZ+sAlxTVyLv3cRvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk5su1MJTCoyBP+48he1QNLgng4jrDHUaheHP990Fq8=;
 b=o+SGWGfLyaiquiVdaCE78ayUdI1e/7jPmIimSOI8AOV9qmbR4DVbyT2DEud9iZjoge9tQxCf68JyY4jJfxZBftpfXdx9Zb6c9mvtRrBbMXZoKUmIYo6drj+l9LEc2OtTM52M0yA2EIZpUGQgPaJ36ZM5hY0/aVsdQZiGqd1QpmI=
Received: from PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::28)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 18:42:39 +0000
Received: from PH2PEPF00048916.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::2f) by PH7P221CA0058.outlook.office365.com
 (2603:10b6:510:33c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 18:42:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH2PEPF00048916.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 18:42:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 12:42:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 12:42:35 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 12:42:34 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>,
	<thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
	<honghuan@amd.com>
CC: Matthew Brost <matthew.brost@intel.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH V1 1/2] drm/gpusvm: add drm_gpusvm_pages unmapped and retry helpers
Date: Fri, 6 Nov 2026 10:42:16 -0800
Message-ID: <20261106184217.2720718-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: PH2PEPF00048916:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3e0db5-7dd5-4cbe-2a39-08df3c35ba1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|18002099003|11063799006|56012099006|261009223027099003|261009221227099003|261102123227099003|261102130727099003|261021123027099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	g3wzS3awf4LDellSzTaTox20DPAJWyUf+McEkpVs4dtqpkglIj1/k0BbX7hCQ2aA+iMAVuo5rgKOi78FDbgCBN1Wy3JNrBv8x0snViOqKSYxS4iuwoojOrTgdgIWzSreyPHkYMm3+v8c/xx72UNmFhrYu+mOJDA440H+E789wNWJbPC/lWQvrem4ks13nyyWJk1JYleQVNmzQOJXNlUamBfyix4jMyIEi33eBKnCZF+dZBxBR0Mm+oTL0jqOwiR1AW/dW6MsdNWN2v+YMOcJChih88X9MRMiBLCbLXzWerjwQbNqKR+KEC/QY8+F68dTbLFMyPd195zn3F/6Ks/cwD7iwtw41XlwzVclmsLHRhPZgThE8hOms3VHCYJg1fhuJGIjNo5sknxBoldXxCODmadyMulsc6PjBsnaBkjS76wOcUFE5xTR4bzsZRo2+r8XBy64qFQhAte/ce7PFfbngWDWUt1dRoewaJpjtD9VjYHV5rzsIs2/HJUDn9HaRHIY1v2IXUCjFGkJdqa/VJvOmWS+slormMvogZSOn+7CciAd/nO8Mm+SXfxsiHkNzrbKhugIM0nBZceDeQQGRxOfYWU7+AJphjG6MJfyblsRVf8cy/RMROoROadpgZHqoL4+a5M4RZ8jBcTEe+rco7HvI/iYK3yNLq7GjqNb0mrfw/xRkQzewhDHCzQ1b9xhxHTeR8DW7pFIqSMbmQ7I0hl25Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(18002099003)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261102123227099003)(261102130727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zbPhZzZtes56I/6d6npGJraS8JFmh4O5AHOReA4T8jASr0m/KgbjG95gV/uW7bFshj55AM/R+soNb8dmghrvVWdW6QA+TKxrEhXGHVdD7RVR0FBhZfM2gGq4kvZqL7jRT9uYlsS3Dy6rhFb2R8CFzCAe7l6VmF1zHbjtvIc9aFjVrxlsFhPhhbV6I6L393N6ZH5bzMPNouR2MlQ34td/Dfu8giEHF6UvKgathSs6Sxkc4AnuEQur2Stcp3oAwYNriyKp9MByKvbKDphDWHTykDesCaSfc34nsVRSrHBmh+cUNopkVn9Xpjlxu/t5AoSW27ovPPK4Te6459lunQOXSUgpogrO7cvYGrk6qc/vdlUeatHI4QhNxOIM0pxktaYxkBFvzEdrwE9jNvJ+2xqxxFjC6LfvzqbEz+rxPGreNtcjJf3bKBQ9vA7fq3j1Cwt1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 18:42:36.1975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3e0db5-7dd5-4cbe-2a39-08df3c35ba1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048916.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227

From: Matthew Brost <matthew.brost@intel.com>

Drivers which only use the drm_gpusvm_pages API (no drm_gpusvm_range)
have no way to mark pages unmapped from their MMU notifier, as
drm_gpusvm_range_set_unmapped() requires a range. They also have to open
code the mmu_interval_read_retry() check on the recorded notifier_seq
to commit pages faulted with &drm_gpusvm_ctx.no_dma_map.

Split the pages part of drm_gpusvm_range_set_unmapped() into
drm_gpusvm_pages_set_unmapped(), and add drm_gpusvm_pages_read_retry()
which performs the commit side check with a lockdep assert on the
notifier lock.

Assisted-by: LLM
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 49 +++++++++++++++++++++++++-----------
 include/drm/drm_gpusvm.h     | 29 +++++++++++++++++++++
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 03dbe304e4b8f..63a26919f59db 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1761,9 +1761,8 @@ static int drm_gpusvm_dma_map_pages(struct drm_gpusvm *gpusvm,
  *
  * With &drm_gpusvm_ctx.no_dma_map no mapping state is recorded, so
  * drm_gpusvm_pages_valid() never returns true and success is only a snapshot:
- * the caller must recheck mmu_interval_read_retry() against the recorded
- * &drm_gpusvm_pages.notifier_seq under the notifier lock, and hold it until
- * its work is visible to invalidation.
+ * the caller must recheck drm_gpusvm_pages_read_retry() under the notifier
+ * lock, and hold it until its work is visible to invalidation.
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -2021,6 +2020,38 @@ bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
 
+/**
+ * drm_gpusvm_pages_set_unmapped() - Mark GPU SVM pages as unmapped
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @pages: Pointer to the GPU SVM pages structure(s).
+ * @pages_count: Number of GPU SVM pages structure(s) passed in.
+ *
+ * Mark @pages as unmapped, after which drm_gpusvm_get_pages() fails with
+ * -EFAULT for them. Intended to be called from the driver's MMU notifier on
+ * MMU_NOTIFY_UNMAP, and usable without a &drm_gpusvm_range by drivers that
+ * only use the drm_gpusvm_pages API. The caller must hold the notifier lock
+ * in write mode.
+ */
+void drm_gpusvm_pages_set_unmapped(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_pages *pages,
+				   unsigned int pages_count)
+{
+	unsigned int i;
+
+	lockdep_assert_held_write(&gpusvm->notifier_lock);
+
+	for (i = 0; i < pages_count; ++i) {
+		struct drm_gpusvm_pages_flags flags = {
+			.__flags = pages[i].flags.__flags,
+		};
+
+		flags.unmapped = true;
+		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
+		WRITE_ONCE(pages[i].flags.__flags, flags.__flags);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_pages_set_unmapped);
+
 /**
  * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as unmapped
  * @range: Pointer to the GPU SVM range structure.
@@ -2039,20 +2070,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 	struct drm_gpusvm_range_flags range_flags = {
 		.__flags = range->flags.__flags,
 	};
-	unsigned int i;
 
-	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
+	drm_gpusvm_pages_set_unmapped(range->gpusvm, pages, pages_count);
 
 	range_flags.unmapped = true;
-	for (i = 0; i < pages_count; ++i) {
-		struct drm_gpusvm_pages_flags flags = {
-			.__flags = pages[i].flags.__flags,
-		};
-
-		flags.unmapped = true;
-		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
-		WRITE_ONCE(pages[i].flags.__flags, flags.__flags);
-	}
 	if (drm_gpusvm_range_start(range) < mmu_range->start ||
 	    drm_gpusvm_range_end(range) > mmu_range->end)
 		range_flags.partial_unmap = true;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 4d31c6bba7455..b43432af56377 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -349,6 +349,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 				   unsigned int pages_count,
 				   const struct mmu_notifier_range *mmu_range);
 
+void drm_gpusvm_pages_set_unmapped(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_pages *pages,
+				   unsigned int pages_count);
+
 int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 			 struct drm_gpusvm_pages *svm_pages,
 			 unsigned int num_pages,
@@ -383,6 +387,31 @@ static inline void drm_gpusvm_init_pages(struct drm_gpusvm_pages *svm_pages,
 	svm_pages->notifier_seq = LONG_MAX;
 }
 
+/**
+ * drm_gpusvm_pages_read_retry() - Check whether GPU SVM pages went stale
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @svm_pages: Pointer to the drm_gpusvm_pages.
+ * @notifier: The notifier passed to drm_gpusvm_get_pages() for @svm_pages.
+ *
+ * Check whether @notifier was invalidated since the last successful
+ * drm_gpusvm_get_pages() for @svm_pages. This is the commit side check for
+ * pages faulted with &drm_gpusvm_ctx.no_dma_map, where no mapping state is
+ * tracked. Pages that were never faulted always report as stale. The caller
+ * must hold the notifier lock and keep holding it until its use of the pages
+ * is visible to the invalidation path.
+ *
+ * Return: True if the pages must be faulted again, false otherwise.
+ */
+static inline bool
+drm_gpusvm_pages_read_retry(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_pages *svm_pages,
+			    struct mmu_interval_notifier *notifier)
+{
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	return mmu_interval_read_retry(notifier, svm_pages->notifier_seq);
+}
+
 /**
  * drm_gpusvm_pages_first_dma() - Resolve the device address array
  * @svm_pages: Pointer to the drm_gpusvm_pages.

base-commit: d2a8cee91bfa8616f713c7c8f539a81e8e3554ea
-- 
2.34.1


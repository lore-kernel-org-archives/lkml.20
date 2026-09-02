Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D24A8400
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361054; cv=fail; b=KuVnLM91+yI5MayBHZKKFw5roPdLiXtB0FIhsftn8OTTJ2k71Y8qdqBojmtjNaBvirPnwgr0pzxiLZKoa5QDMdbHoVFFr8KvGB/ZkT5/PYBBpQXFZ/Y5zrf6Foyn1eysWCY89wT72ly6rm9KzE/p9Cyo1AemR5oE27BMv9VxcuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361054; c=relaxed/simple;
	bh=hxsTZn4aCQzpbZJHEwwm/LpXf0h1jNh2Qpwqfc9fiXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZzvwnd8MMG2LWOhetFfYPYiGj5AYSGP+bV9nQlNRtBDD6uANW5TVLG1s7cWkjPSKwnOfHl8JzqrptDVe8Fs6efboODIP9lrDAiGx7fjcxGXJ8oCgNZ3ycMoo3Y7xjcDIYr5lyPWWCSBbDStZb6nrGxP/Y9GLmCBtx7QPyGHnYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hGL0ziNU; arc=fail smtp.client-ip=52.101.62.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hGL0ziNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAQaJXjwUjCytiSGAO59LB9TgprUu2tiMt8qeue09+AVoQWSDX7JuXfKvDrqVRTIHiUBoYu5lfC4NDQCBH2hIcYD+YaaWLNwJOoqMLARqo1e3OHXnMLost88eh02S6lhk3o7LBUvM54AWQm6Tw1f5HrYb7REcbq5P/d2SVna0cw2ZKT+sRtGyxqt01TeNPKvTkTFUCWGbV6ff1J+kUo32SrJTTpjCGnB3w2FplqwlqFcj08zEMxhEKqEEOAUNbMJ4IbJVNit6ieblI+R6o2a5r+3N7BEJYXnZXjDQVTxT2qVKssappUApWw0AWTAelGah6uOsyrmtJybE4X1ayVeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHGSmCPt9HoL+Sr70+//FcCUuN4z+X1FbEeWs6pAAB8=;
 b=WcXSF0n1UGrnRAIJ81HNRECwyNfa0bcZZBmbXT0Iyo4MEr+/uBvLvN5ttuv25RpH1Dk+y28qiohk1XnxuCnnnFsZyQabaRpHj3tS48ECsJx4BPBU4uSi+wAqAhCY2gx2dpawHfQkcWY6l0PLQeK3QHzknyp9IX18PsYJuJ0wQJPh7Zjba3HIVfZye4a9TXXnpPDYidVJnR31OA9nGjOxh6szDob/xlVkMUCxpBxc7q5T0+HGpNncsHzlrAV+lCL7/5nEtFTaqck9x47Fu0bzixFY82WU+hXkXILQT6haj1WWoswiFao61jA4S0QC0gvggwyKgaTr5VkTVt2QUZeMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHGSmCPt9HoL+Sr70+//FcCUuN4z+X1FbEeWs6pAAB8=;
 b=hGL0ziNUdjXvD14zCsq5LFg17Em8kbrZIQcRTfozr2X6WixrB2ivYWAVWwKGpwS/Xn8rVRng3fsuOxqQv26w+OAXV43ZBGY+9Go48G3UKtXm5YKIvzklbUW7/98chhM4cdToxjRiJwHhdXmdYYWH+WLYFJiy7ASHFhQYhoj+UUs=
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:57:16 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::58) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 14:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 14:57:16 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:57:14 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Wed, 2 Sep 2026 20:26:58 +0530
Message-ID: <20260902145658.183267-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902145658.183267-1-srinivasan.shanmugam@amd.com>
References: <20260902145658.183267-1-srinivasan.shanmugam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0aeca6-640b-4178-f1af-08df09027ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|6133799003|5023799004|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XOvfWs/X9kDBTTOz71htfJbTG0/D+WCJCG0kRSG3/htM5Fua+3WePa9fyFzrRst0b8pTwgOtcHtxIrDbVb0Zjm/hAlpFM0RbvqH8k1w5warTWT1vz9dWKVqRDqYzs9QrPsbF+ZbMT+OXcIHE4Dciymug1Vu9G9fKKAX3e5e4sZONnowN1n6cljkDjQXz79WgatOvfHOo1zeF+obKzcnfoyK3hLvA71UzKeG/R5lLTGWFKSUs1gC2adrnvmbBj7y9kzkWKnzLkhd3I4nWp8AA+xC+O6iR+BSFwrF1on9YZ0rJzk7r076ZDbaoNQGdogRTuGqoSERLA8NY0dUeTLPPXLItEuy+oGvocrRXmjW9MnJNLc4IluWe1C4XvMsauUdRg2aLkCnEzcShA9VgOyG6IZGRk/HYUxhuLN0ix4a2iDyCatQVwAwOZDzIQv3zA3JZ8SXk2YAQGKT0MsBuRcn5UJlBQES3fCjKAxdJHN8feF8nBzHNm7kaCe0upq91v/YxiqHBuilGKktFjDEGxRmE7v8hHeDiknoO+0Et/IbI9ZchGGiZ6In0le2gbITd18qraoFrQnbzlITn8MnJXnxr0J8kwjJKzrd9bHxkMdYmr7qsHDivN7BVXv9m/l+BUfYpnzAZn1HvueT0Uuf6hxAab77FrfMwTfjZE9qz/hIcxMZiRA2EGnACUECnmEFZH06HI88dkpdYyMZAM4g5csB3Eg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	djqvZR1Gk/FV0RphUbt5fcAM/GJIHUXdGP8plvparxJhfY8NOxGsQIjw6yJTIbP0SxshLpBWSthsoPBLfQ1l0NF3HYFksJN+Q2BgrNpfOkwW3o9oX/lSGAaBSD0pLWpgBxKd/gvRjWJR+rz5E9a0S/pLxf1cR4LD8rdjQj1DUSrelde4I1OXoDnuGGqOMfjUUlen6kAPQXBt9v/6j2MxUK4oWVVoSXbFfW3V9rSXuPRWYM8ODzJmeVFhQAZ3N+49qSi/YP1ZZC9Eb3mI7Dr4Wy2cWO0B8uX9rA9E6I3J1Vp0VZuo8ta/TYTzxQTPTI4xEanIAcB1PEnRiuqJDmNidPG1HSJQJTfc824RbruM/FAnpxDIZ3ZJ39zGxpVeROE3QUwd7enM0ET20Suu4KK5/2dpJhbmxvJlwYpaEEKxlBAGRMQDyMCU2QHx+xu65hxS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:57:16.1951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0aeca6-640b-4178-f1af-08df09027ab5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845

GPU drivers sometimes need to read a value from a userspace VA when a
dma-fence signals, compare it with an expected value, and only perform
the deferred work (e.g. eventfd_signal) if the comparison passes. This
is the per-signal filtering pattern used in AMDGPU's EOP eventfd path.

Add optional compare fields to drm_user_fence and a new helper
drm_user_fence_set_compare() to configure them. Supported operators are
==, !=, >=.

When cmp_op is set, drm_user_fence reads the value from userspace via
copy_from_user_nofault() and calls ops->worker() with mm_ok=true only if
the comparison passes. If the process MM is gone or the read fails, the
worker is called with mm_ok=false to allow mandatory housekeeping (e.g.
wake_up()).

Drivers that do not need filtering (e.g. XE) leave cmp_op unset and the
worker is called unconditionally — no behavioral change.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: I200dd4bf32286ba9bdd2ecb68fffb3c205f9fd52
---
 drivers/gpu/drm/drm_user_fence.c | 97 +++++++++++++++++++++++++++++---
 include/drm/drm_user_fence.h     | 52 ++++++++++++++++-
 2 files changed, 138 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 0f229b7210a9..06a5683db10d 100644
--- a/drivers/gpu/drm/drm_user_fence.c
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -2,16 +2,25 @@
 /*
  * Copyright © 2024 The Linux Foundation
  *
- * DRM user fence — extends drm_work_fence with kthread_use_mm() support.
+ * DRM user fence helper.
  *
- * Use this when a GPU fence signals and work needs to access userspace
- * memory (copy_to_user, fault-able operations) from a kthread context.
- * For work that does not require userspace memory access, use
- * drm_work_fence directly.
+ * Extends drm_work_fence with the ability to access userspace memory
+ * from workqueue context by borrowing the process MM via kthread_use_mm().
+ *
+ * Drivers that need to write completion status to userspace (e.g., user
+ * fences, signaling eventfds) embed drm_user_fence and implement
+ * ops->worker() to do the actual write.
+ *
+ * Optionally, drivers may configure a per-signal compare via
+ * drm_user_fence_set_compare(): work is skipped unless the value at a
+ * userspace address matches the expected value at signal time.
  */
 
 #include <linux/kthread.h>
+#include <linux/mm.h>
 #include <linux/sched/mm.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_user_fence.h>
 
@@ -30,13 +39,46 @@ static void drm_user_fence_do_work(struct drm_work_fence *wfence)
 	struct drm_user_fence *ufence =
 		container_of(wfence, struct drm_user_fence, base);
 	struct mm_struct *mm = NULL;
+	bool call_worker = true;
 
 	if (mmget_not_zero(ufence->mm)) {
 		mm = ufence->mm;
 		kthread_use_mm(mm);
 	}
 
-	ufence->ops->worker(ufence, !!mm);
+	if (ufence->cmp_op != DRM_USER_FENCE_CMP_NONE &&
+	    !(wfence->fence && wfence->fence->error)) {
+		if (!mm) {
+			call_worker = false;
+		} else {
+			__le64 raw;
+
+			/*
+			 * Use copy_from_user_nofault() to prevent a
+			 * userfaultfd-registered page from blocking this
+			 * workqueue thread indefinitely (DoS).
+			 */
+			if (copy_from_user_nofault(&raw, ufence->cmp_addr,
+						   sizeof(raw))) {
+				call_worker = false;
+			} else {
+				/* GPU writes LE; convert before comparing. */
+				u64 cur_val = le64_to_cpu(raw);
+
+				if (!drm_user_fence_cmp_match(cur_val,
+							      ufence->cmp_value,
+							      ufence->cmp_op))
+					call_worker = false;
+			}
+		}
+	}
+
+	/*
+	 * Always invoke the worker so drivers can perform mandatory
+	 * housekeeping (e.g. wake_up()). Pass false if the compare
+	 * filter suppressed the write.
+	 */
+	ufence->ops->worker(ufence, call_worker ? !!mm : false);
 
 	if (mm) {
 		kthread_unuse_mm(mm);
@@ -63,8 +105,47 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
 			 const struct drm_user_fence_ops *ops)
 {
 	drm_work_fence_init(&ufence->base, wq, &drm_user_fence_wfence_ops);
-	ufence->mm = current->mm;
+	ufence->mm        = current->mm;
 	mmgrab(ufence->mm);
-	ufence->ops = ops;
+	ufence->ops       = ops;
+	ufence->cmp_op    = DRM_USER_FENCE_CMP_NONE;
+	ufence->cmp_addr  = NULL;
+	ufence->cmp_value = 0;
 }
 EXPORT_SYMBOL_GPL(drm_user_fence_init);
+
+/**
+ * drm_user_fence_set_compare - Set per-signal compare filter
+ * @ufence: user fence
+ * @addr: 8-byte-aligned userspace address to read from at signal time
+ * @value: expected value to compare against
+ * @op: comparison operator; pass %DRM_USER_FENCE_CMP_NONE to disable
+ *
+ * When @op is not %DRM_USER_FENCE_CMP_NONE, the worker is only called
+ * with mm_ok=true if the value at @addr matches @value according to @op.
+ * The worker is always called for mandatory housekeeping.
+ * If the MM is gone or the read fails, mm_ok is passed as false.
+ *
+ * Must only be called before drm_work_fence_add_callback().
+ */
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op)
+{
+	/*
+	 * get_user() of u64 is not atomic on 32-bit — caller should not
+	 * reach here on non-64-bit kernels.
+	 */
+	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_64BIT)))
+		return;
+
+	if (op != DRM_USER_FENCE_CMP_NONE) {
+		if (!addr || !IS_ALIGNED((unsigned long)addr, sizeof(u64)))
+			return;
+	}
+
+	ufence->cmp_addr  = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op    = op;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index 36c61aa7d102..1e3b017cbc30 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -20,8 +20,9 @@ struct drm_user_fence_ops {
 	 * @worker: Called from workqueue context with the process MM active.
 	 *
 	 * If @mm_ok is true, kthread_use_mm() is active and userspace memory
-	 * may be accessed safely. If @mm_ok is false, the process MM was
-	 * already gone; skip the userspace write.
+	 * (copy_to_user, etc.) may be accessed safely.
+	 * If @mm_ok is false, the process MM was already gone; skip the
+	 * userspace write.
 	 *
 	 * wake_up() or other post-signal housekeeping should also happen here.
 	 */
@@ -34,11 +35,23 @@ struct drm_user_fence_ops {
 	void (*destroy)(struct drm_user_fence *ufence);
 };
 
+/**
+ * enum drm_user_fence_cmp - compare operator for per-signal filtering
+ */
+enum drm_user_fence_cmp {
+	DRM_USER_FENCE_CMP_NONE = 0,
+	DRM_USER_FENCE_CMP_EQ,
+	DRM_USER_FENCE_CMP_NEQ,
+	DRM_USER_FENCE_CMP_GTE,
+};
+
 /**
  * struct drm_user_fence - DRM user fence with MM borrowing
  *
  * Extends drm_work_fence with kthread_use_mm() support for drivers
  * that need to access userspace memory when a GPU fence signals.
+ * For work that does not need userspace memory access, use
+ * drm_work_fence directly.
  *
  * Call drm_user_fence_init() at creation and drm_user_fence_add_callback()
  * to arm on a dma-fence. Call drm_user_fence_cancel_sync() before teardown.
@@ -50,11 +63,20 @@ struct drm_user_fence {
 	struct mm_struct *mm;
 	/** @ops: Driver operations. */
 	const struct drm_user_fence_ops *ops;
+	/** @cmp_addr: Userspace address to read for per-signal compare. */
+	u64 __user *cmp_addr;
+	/** @cmp_value: Expected value for per-signal compare. */
+	u64 cmp_value;
+	/** @cmp_op: Compare operator; DRM_USER_FENCE_CMP_NONE disables. */
+	enum drm_user_fence_cmp cmp_op;
 };
 
 void drm_user_fence_init(struct drm_user_fence *ufence,
 			 struct workqueue_struct *wq,
 			 const struct drm_user_fence_ops *ops);
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op);
 
 /**
  * drm_user_fence_get - Acquire a reference to a user fence
@@ -106,11 +128,35 @@ static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
  * drm_user_fence_cancel_sync - Cancel callback and wait for worker to finish
  * @ufence: user fence
  *
- * Must be called during teardown before freeing resources. May sleep.
+ * Must be called during teardown before freeing any resources accessed
+ * by ops->worker(). May sleep.
  */
 static inline void drm_user_fence_cancel_sync(struct drm_user_fence *ufence)
 {
 	drm_work_fence_cancel_sync(&ufence->base);
 }
 
+/**
+ * drm_user_fence_cmp_match - Test a value against the compare filter
+ * @cur_val: value read from userspace (already converted from LE)
+ * @cmp_value: expected value
+ * @op: comparison operator
+ *
+ * Return: true if the comparison passes, false otherwise.
+ */
+static inline bool drm_user_fence_cmp_match(u64 cur_val, u64 cmp_value,
+					    enum drm_user_fence_cmp op)
+{
+	switch (op) {
+	case DRM_USER_FENCE_CMP_EQ:
+		return cur_val == cmp_value;
+	case DRM_USER_FENCE_CMP_NEQ:
+		return cur_val != cmp_value;
+	case DRM_USER_FENCE_CMP_GTE:
+		return cur_val >= cmp_value;
+	default:
+		return false;
+	}
+}
+
 #endif /* __DRM_USER_FENCE_H__ */
-- 
2.34.1


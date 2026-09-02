Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30204A64C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364128; cv=fail; b=IV3AITATXAl7EKp/99GOoCR7A5SmzkGrX5XCv6m8FoCmPj++Tu50K7iUiJenhtGEgFKIj5hHzv7vunCZt/Bs+4nq1TvcjyK9bxXsFGKrC2rAj1YDBzk+Q2m0UFUNsgtAB183eiQ0XAVceB4JvogRXMYVQ/UuBKdBxBujrFKBJ80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364128; c=relaxed/simple;
	bh=Blx5OEAlqJmS2y2ZOfZwR8w/9xj6hr2ZmUtXxsdei7g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSCQ1/GZPUKCDe9Z+yQWU6wPVimLBcQ4d9bId8Uy85dIjNJNcwGLjI6IIw90gN7r1nv8a/08ge8UpQv3v5DuJr9dNbhakeG7LOmO4c9nBN75i2A7c1+eY11mrT9uvM3MCVVfK5Kvi2nLSxK62/lL2+9NvRwjRmJxoTAyH6poWH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RztEc+Uw; arc=fail smtp.client-ip=52.101.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RztEc+Uw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWoN5RRQPXXtwhu3lgDc0hkm1iPYf98rDOyVdtY1dIjQN+9v5wqY2D0aS03sKRVFsPxriyUFVUiC++yy4N4C2PG3Y5IaSueNE55k09KsppXi/Vlpr5XG2VJf5tc1ZChF2mW3Mju0Dlg5IkNun/C6aMyN9V+E9pQE+OA9wzt113nnx7OcjVnN1fWJ/oyEcstz17Q1IhUaJnN+A4den4ygf3IQtjtvS6r9//JSiIxUs6gFdrHmm7wprgu3FkFktokJxw95h51e23Us1lBtttvb3Duu865bvvQqrdoHHp32CmzsI0JwfL8DoczYZ804YMwRlmXW0O7rZ+Eab4jCbsGm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKH0FP668Qgul/YsgqdvxMj/lykvC2Fo3oljEAiWt2M=;
 b=kSK7QF+bFl8nmIC5r5QMOWGZYREauUZ5taObylzbrq0ygD5k4SbAwdqUFXLyT89FuWXIaxmHD4LCFLlerQxJOjquLtLSpEd2NeaWLuR3MunBPmUQSnZ73B0dGMbIRlyRx1lzefBmOUApN8UCxFi8YESad3rIfRsLDD8v9WZa7d1l/34Ww/w9Mp9MXhWCwjqn39KJxQtYLUzve5L5ez4mS4ormRTaoscdCnZ3C24U3v3tP8xqnZDKmATZQhdv6jNFfxyq0IWrQOHvX6KM05mu8e2SYoFqt4kpU7hBjih1nhrVg9XZPEPE57jZaWTr4bAEZR2hUV9EQNC1GZafz0mCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKH0FP668Qgul/YsgqdvxMj/lykvC2Fo3oljEAiWt2M=;
 b=RztEc+Uwk1SwNYQcTuGkvH9fL0SuozXDrUyHUzXbxwXe9ibPJGxLj35C8sp1p54SmeHcMK/vnZS3e2t7j/VIz4cDo4YTveAdzTvdO1vsEf2ArhpsYTBTz3/qyFls+2ozPII7Vc5N9kU8o4L9VYfbNjECClru4e/zhKp/g3FMA4Y=
Received: from CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::34)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:48:37 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::85) by CH0P223CA0016.outlook.office365.com
 (2603:10b6:610:116::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 15:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 15:48:36 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:48:34 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Wed, 2 Sep 2026 21:18:17 +0530
Message-ID: <20260902154817.185499-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902154817.185499-1-srinivasan.shanmugam@amd.com>
References: <20260902154817.185499-1-srinivasan.shanmugam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 584e7678-e66b-48ce-3b78-08df0909a6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|6133799003|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OMJirypUAPQQjkR7mp886lo/NUJQrn/9+UFSfH9PumlheLv373DWMYfIYAuLZ9Z+eqDn6zd/McDe0TOo3X93Nbd9Kxp93UX/YG1pz8O/3wiRqG4bBpw/slyoMoy4oO52qNMMJkaqsBczvnpfo02j2mUkFNeSgF/iKTQNJ873cdIdAKGUztqm0vM6m17zj3RdCiNdjKu0y389YVj/j0t3vN2NfW2F+uZA/eNerj1lVV5AwL/XZztFrRQr+JfXgUbOibjXLhwJ4nGR43FQbMiiWzq2tyTNirwEeotFUI+aR0HnV4RCL2+FM3dfRuLYMeh+41FQs50IOD5zAswa6+JRIcRAQXSOnJX7shWxAtCxHELdHdHhOUwVdUwvb4LXMrTN8/zywCmFD3sRur2G3Yq3Zq8SoBuMvexKvqSNyk/9CpbrmQqUthvVNGICZ8ezJk8JTCaiFynm+ElxO3a5k8rkvqBjXW/wulEhsAG5tHZ0hj6I46FrK06uEdhzwmWeOF3lUEBSBQ46wtG9zUSjB0S5lC2nAiLxbaENBANOkdTKx4LaqxjgneFtqJYIyo+0/m1/Tuak1UIgaDHWy7K8Ri++FoNX8NL4X84KVSJUpIboBKcQyiNlNaxA+KLG/yhzry/st/eabRa+TAvBppfMN54tHwpx/rs928G4lSx4Nq6MFLVLj7V5TIZ0ZS+58ERylEMsrphYdK+IbsFIFtjCN2CTxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lk1qITTbPOhsquJD9b99w74sWlLucmGcrTyENO1ayF2xHA6EXZ17vGIacm02fR96rj9VPVBRbgCmfzaAsFiBoU79/SKZvVgt4P5Qy2eHs9e1fcazG7fsSUNeoo9JvJBbedDZvuUUI7lNSi1B7hXa+JM9NmpQ3cbCf9NqIAdlM8SguoqW1241FraHz5j41n4a7GIGq5V5rBhRjBfZgXmHe4DO89SvCs8vsPkDDu66g4pvo6hRmaL2MyaMgQSv8uB776QVZ7G1lXKjmQ/y5t2NiD7EtS72oy7fcXzOAaW31hx5gd3VDxwdK4eBH17XUcjdZENXHYzLer74w4Vse87cLtfys6dOH+Am1wLuh03hTPYNRKrIKSUXWZl2o4rVVgjsQKQsD6ql0Wqv6BResSQ43vqx7CLxPbBXiOTbbBAyX6MOaLCeuRLhnI+rslogPa2T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:48:36.8746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584e7678-e66b-48ce-3b78-08df0909a6e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747

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
 drivers/gpu/drm/drm_user_fence.c | 104 ++++++++++++++++++++++++++++---
 include/drm/drm_user_fence.h     |  47 +++++++++++++-
 2 files changed, 142 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 0f229b7210a9..d9bd3128ff6c 100644
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
 
@@ -30,13 +39,50 @@ static void drm_user_fence_do_work(struct drm_work_fence *wfence)
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
+			 *
+			 * If the page is not resident (e.g. swapped out,
+			 * NUMA-migrated), call the worker conservatively to
+			 * avoid dropping legitimate completion events.
+			 */
+			if (copy_from_user_nofault(&raw, ufence->cmp_addr,
+						   sizeof(raw))) {
+				call_worker = true;
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
@@ -63,8 +109,50 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
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
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int drm_user_fence_set_compare(struct drm_user_fence *ufence,
+			       u64 __user *addr, u64 value,
+			       enum drm_user_fence_cmp op)
+{
+	/*
+	 * get_user() of u64 is not atomic on 32-bit — caller should not
+	 * reach here on non-64-bit kernels.
+	 */
+	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_64BIT)))
+		return -EOPNOTSUPP;
+
+	if (op != DRM_USER_FENCE_CMP_NONE) {
+		if (!addr || !IS_ALIGNED((unsigned long)addr, sizeof(u64)))
+			return -EINVAL;
+	}
+
+	ufence->cmp_addr  = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op    = op;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index d35438eaa9e2..94bc2fd59d73 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -40,11 +40,23 @@ struct drm_user_fence_ops {
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
@@ -56,11 +68,20 @@ struct drm_user_fence {
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
+int drm_user_fence_set_compare(struct drm_user_fence *ufence,
+			       u64 __user *addr, u64 value,
+			       enum drm_user_fence_cmp op);
 
 /**
  * drm_user_fence_get - Acquire a reference to a user fence
@@ -112,11 +133,35 @@ static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
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


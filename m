Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B23DE423
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361054; cv=fail; b=gR8j2aYdfkiEE3eeeefARFDqLv9LxJzZZUpXOyszRLNw9Wn1qEi87sCG308OR+LAKVwcz9Q/l19q2X2b3PSPHsOljMDnPSC3b08Kax2nn6ATOks2SEpGQAKJ2ROeHT/AvPB6x1rmehu2IrhqYX/b/TMH097nq1Wc7uLOsf10QPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361054; c=relaxed/simple;
	bh=K0C9lCKpaXjfGzTodh/1YB6mba4ZlP9dV8fa8hw7c7c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGqDzm0aIM0ecahPM21pFIqBCy+mb5ucX0ZNUIKQMFyNvs47S0Ym6Dpn0rMa+CaysID5GIz0mbryqcaaj3exoovH1x8hAjUM8BlERYsHS/tnnTR2GGgNxZ73nKNfdfUPCAxUVEd/Ndz5aivTo9mjIZ9HTQAz+WjU2WyJvj61lcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F4ecqmtm; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F4ecqmtm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0ARyQ3MqLe8PYDQXSY70vXf7nUaLA4KLzKGLb1Ts+kolP3nxgxIFg+CoymYqYUbYzo6h0ylwcFT06tv0XfVTeN1Hu5Eponj1V9MEzsrILsV4Qb0TK5ypxSsnTHnKj+3hyddLmp2xYjrVM5ReLOqIpKZYVMi5i0cahlwgjcLRGEl1kR0+lEyftmYjujGMZVY5neQ23g6EIum0plqfGbaFHTpYNRiHUyLegQH9dhMU8/0TIvOw6P4C0t/w2i0FxlKaZf9zn+deDrjL68ibMY38RmBDNICM+HH9uRw3X0E0rsF1jwDCuAT5Kc9eT1B6pDUixwZPyl01LNCfIEOD4m5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShvPUcKU89i1LUEiz6+vmlRLpGlMszODDhzNJ+9K7rI=;
 b=i+17ZGRLl1NSP01Dw2WbfvHXEs697WVW3ydOzJk0oRH+wc7Q17976GRNVQOa9ZvIrc0NsiCxCvu4Fa7upig8Qq4qmnaic1BqfTkLtcF6gJWWgLdTA/PKc2/TW+J0KCEVvrvjhXhyl4KYmZjF+6O13TpT4CHQPQIC+wcb8hUQzVzNlHYLyDLQoNN24dDd0KO/NHIMzVpl6wx4lKO27xnaxgmDWWSA9+fHPf9tzjy5tdYhP4NUpedjZ4CACsBfKSvwQZkAJwi2hynrLJBUD+Pk/RNniX0yu90uq5HhAWgLf6+FQlO771sAUqp2/q7T1eSObdDkZIe+7AL5X6B7zfuYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShvPUcKU89i1LUEiz6+vmlRLpGlMszODDhzNJ+9K7rI=;
 b=F4ecqmtmC5dXNnqQ8lT82BWd4UFbOx1XOBsUH/Dp9cWfCWOzivMgBqjHcZG8tkJ0tjJq2QUTFECCRse52LVUgIn+kKC19JXg3jwDIZzBlTuDoQueQhykH+KfK1CAtXqbZy5v4rVMBEROdvdT4bP5o2BFg563KtL64ipNTELugzQ=
Received: from SJ0PR13CA0158.namprd13.prod.outlook.com (2603:10b6:a03:2c7::13)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:57:15 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::f) by SJ0PR13CA0158.outlook.office365.com
 (2603:10b6:a03:2c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 14:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 14:57:14 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:57:13 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] drm/xe: Convert xe_user_fence to drm_user_fence
Date: Wed, 2 Sep 2026 20:26:57 +0530
Message-ID: <20260902145658.183267-3-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6db610-6dd1-40e6-4ca1-08df090279e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jGzfiEKiHEcO+qy9qxZvJnJFD2k8yB46gV4wQyk34QiCzKN4NLHYzZ3WL1LDDOR1a0GWuWylX4ZZtHVMlr6drdlboZXM6gndm1sbSiyezh+t1RSWBcxgnxpKYTduBnaI7jW2Td0WgD2vIcJNftUVbwxPqhGIsAh5m8+zEpDYKyQp9wWdURGQXqE/oNbBsEvRvc1XN9jWngkgXz+27RhuY+rYxZ/t2obhkXAsiYSNWeWoDuxBQiVQHAEieNniBXG9AEfF+Ms9F/+WHCqko/nsFT9zyLi7ZXGqwkd+wBuyAHpoUZsb2SPyheNi4ZL/naaNtnRO8VhEZX7iwoNCAWa6wqzW0uBxCxkiP/GQbsRQJJfRro/M8XEYdOmjhOYb881/711KSxGBxOsI54cYsyaJ2F9me+DHVGqNyNUSFdw0aeftPymR+Gx03B/QlEGD1AG4exMosyTZdUyFe49nneIq/PCMr8nRC/1jDBFuiW2CnQvv90GsFZt4HLCe5+j0v09kaSHGlbt0XlosjzQH6m+cviJ2N+f3uLcVDNbhzIigO5QTQthvS9PZOBKSeRj6dhpoQEDy+UbxY441tzQvq5ygVB6bUPPIfqHFZMz6sNUiuFzURdPC2xMnh1RAjtkQyyVdPBNZx18Ox5YCHrFiZEFVv3lp8fw3kezJAiJqnhSO0NJ3l4v//oMCoDz54cF7rbgJXCb+PYrbAy40RmI+8fnUMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wvsy20xqrifGWCbwRe85rjtZ5huZa6LSrB3345I8+WGQJnneRN75/big7coV4tN/p2Kde9sVuua3734BR0iHq3+Xx1wNI2rIxOq8Ev+JpU/J6lLkaZuFQwWRJmjvVlbmSDjnHIaC6ihxtXBRPRmj6t6BEOflBbrRwrKYKTd0r6heM2MKG3fulj5Ha3vamfenZtMWS9xcozDMml8ZXUs1xbfGywlxYxsEwDwB3g7zb8JXV301MTA5cG8uBN0+LE3qWwt0Azhtzaq6J2m3xEyR5UXiwSSxwyJVUzn9UBdgEK+Y+BD1pai0uhCKL+l9HE7AycE++FkeeXPqoDUmoe4fbsojjuCkrQy1Ak1O3Uk4sUMmFF573DPpud9TgA93T1lIeKVYTx2+dUqlOyptbdeADHtFyqJ8AhFfrG0osALRMDj/aXrJ3YHSCA1bMYhOzUgr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:57:14.7944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6db610-6dd1-40e6-4ca1-08df090279e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759

Replace the open-coded user fence implementation in xe_sync.c with the
new common drm_user_fence helper.

struct xe_user_fence now embeds struct drm_user_fence as its base.
XE-specific fields (xe_device pointer for the ufence_wq wake-up,
userspace VA, expected value, signalled flag) remain in the wrapper.

The local user_fence_destroy/get/put/worker/kick_ufence/user_fence_cb
functions are removed. Their logic moves to xe_ufence_ops.worker and
xe_ufence_ops.destroy, which are called by the drm_user_fence helper.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 147 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sync.h       |   2 +
 drivers/gpu/drm/xe/xe_sync_types.h |   1 -
 drivers/gpu/drm/xe/xe_vm.c         |   1 +
 4 files changed, 82 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..05f6794af1ee 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,12 +6,11 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
-#include <linux/kthread.h>
-#include <linux/sched/mm.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
+#include <drm/drm_user_fence.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
@@ -19,36 +18,58 @@
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
+/*
+ * xe_user_fence wraps drm_user_fence with XE-specific fields.
+ * The drm_user_fence base handles MM borrowing and work-item lifetime.
+ */
 struct xe_user_fence {
-	struct xe_device *xe;
-	struct kref refcount;
-	struct dma_fence_cb cb;
-	struct work_struct worker;
-	struct mm_struct *mm;
-	u64 __user *addr;
-	u64 value;
-	int signalled;
+	struct drm_user_fence base;
+	struct xe_device     *xe;
+	u64 __user           *addr;
+	u64                   value;
+	int                   signalled;
 };
 
-static void user_fence_destroy(struct kref *kref)
+static void xe_ufence_worker(struct drm_user_fence *base, bool mm_ok)
 {
-	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
-						 refcount);
+	struct xe_user_fence *ufence = container_of(base, struct xe_user_fence, base);
 
-	mmdrop(ufence->mm);
-	kfree(ufence);
-}
+	if (mm_ok) {
+		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
+			drm_dbg(&ufence->xe->drm,
+				"copy_to_user failed, user fence wasn't signaled\n");
+	} else {
+		drm_dbg(&ufence->xe->drm,
+			"mmget_not_zero() failed, ufence wasn't signaled\n");
+	}
 
-static void user_fence_get(struct xe_user_fence *ufence)
-{
-	kref_get(&ufence->refcount);
+	/*
+	 * Ensure the fence value write is visible before signalled=1.
+	 * A UMD polling signalled must see the committed fence value.
+	 */
+	smp_wmb();
+
+	/*
+	 * Mark signalled after the user memory write so UMD can safely
+	 * reuse the same ufence without hitting -EBUSY.
+	 */
+	WRITE_ONCE(ufence->signalled, 1);
+
+	wake_up_all(&ufence->xe->ufence_wq);
 }
 
-static void user_fence_put(struct xe_user_fence *ufence)
+static void xe_ufence_destroy(struct drm_user_fence *base)
 {
-	kref_put(&ufence->refcount, user_fence_destroy);
+	struct xe_user_fence *ufence = container_of(base, struct xe_user_fence, base);
+
+	kfree(ufence);
 }
 
+static const struct drm_user_fence_ops xe_ufence_ops = {
+	.worker  = xe_ufence_worker,
+	.destroy = xe_ufence_destroy,
+};
+
 static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
@@ -63,51 +84,22 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	if (!ufence)
 		return ERR_PTR(-ENOMEM);
 
-	ufence->xe = xe;
-	kref_init(&ufence->refcount);
-	ufence->addr = ptr;
+	ufence->xe    = xe;
+	ufence->addr  = ptr;
 	ufence->value = value;
-	ufence->mm = current->mm;
-	mmgrab(ufence->mm);
+	drm_user_fence_init(&ufence->base, xe->ordered_wq, &xe_ufence_ops);
 
 	return ufence;
 }
 
-static void user_fence_worker(struct work_struct *w)
-{
-	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
-
-	WRITE_ONCE(ufence->signalled, 1);
-	if (mmget_not_zero(ufence->mm)) {
-		kthread_use_mm(ufence->mm);
-		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
-			XE_WARN_ON("Copy to user failed");
-		kthread_unuse_mm(ufence->mm);
-		mmput(ufence->mm);
-	} else {
-		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
-	}
-
-	/*
-	 * Wake up waiters only after updating the ufence state, allowing the UMD
-	 * to safely reuse the same ufence without encountering -EBUSY errors.
-	 */
-	wake_up_all(&ufence->xe->ufence_wq);
-	user_fence_put(ufence);
-}
-
-static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
+static void user_fence_get(struct xe_user_fence *ufence)
 {
-	INIT_WORK(&ufence->worker, user_fence_worker);
-	queue_work(ufence->xe->ordered_wq, &ufence->worker);
-	dma_fence_put(fence);
+	drm_user_fence_get(&ufence->base);
 }
 
-static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+static void user_fence_put(struct xe_user_fence *ufence)
 {
-	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
-
-	kick_ufence(ufence, fence);
+	drm_user_fence_put(&ufence->base);
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
@@ -282,24 +274,15 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 	} else if (sync->syncobj) {
 		drm_syncobj_replace_fence(sync->syncobj, fence);
 	} else if (sync->ufence) {
-		int err;
-
 		drm_syncobj_add_point(sync->ufence_syncobj,
 				      sync->ufence_chain_fence,
 				      fence, sync->ufence_timeline_value);
 		sync->ufence_chain_fence = NULL;
 
 		fence = drm_syncobj_fence_get(sync->ufence_syncobj);
-		user_fence_get(sync->ufence);
-		err = dma_fence_add_callback(fence, &sync->ufence->cb,
-					     user_fence_cb);
-		if (err == -ENOENT) {
-			kick_ufence(sync->ufence, fence);
-		} else if (err) {
+		if (drm_user_fence_add_callback(&sync->ufence->base, fence))
 			XE_WARN_ON("failed to add user fence");
-			user_fence_put(sync->ufence);
-			dma_fence_put(fence);
-		}
+		/* fence ref consumed by drm_user_fence_add_callback */
 	}
 }
 
@@ -434,6 +417,34 @@ void xe_sync_ufence_put(struct xe_user_fence *ufence)
 	user_fence_put(ufence);
 }
 
+/**
+ * xe_sync_ufence_cancel() - Non-blocking cancel of user fence callback
+ * @ufence: user fence reference
+ *
+ * Attempts to cancel the pending callback without waiting for the worker.
+ * Safe to call while holding dma_resv_lock or vm->lock. If the callback
+ * has already fired, the worker runs independently — xe_ufence_worker
+ * only accesses device-level and userspace resources, both safe after
+ * VMA teardown.
+ */
+void xe_sync_ufence_cancel(struct xe_user_fence *ufence)
+{
+	drm_user_fence_cancel(&ufence->base);
+}
+
+/**
+ * xe_sync_ufence_cancel_sync() - Cancel user fence callback and wait for worker
+ * @ufence: user fence reference
+ *
+ * Cancels any pending dma-fence callback and waits for the worker to fully
+ * complete before returning. Must be called during teardown before freeing
+ * any resources accessed by the worker.
+ */
+void xe_sync_ufence_cancel_sync(struct xe_user_fence *ufence)
+{
+	drm_user_fence_cancel_sync(&ufence->base);
+}
+
 /**
  * xe_sync_ufence_get_status() - Get user fence status
  * @ufence: user fence
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 6b949194acff..b5ff3387c592 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -44,6 +44,8 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
 struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
+void xe_sync_ufence_cancel(struct xe_user_fence *ufence);
+void xe_sync_ufence_cancel_sync(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index b88f1833e28c..67048199b070 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -12,7 +12,6 @@ struct drm_syncobj;
 struct dma_fence;
 struct dma_fence_chain;
 struct drm_xe_sync;
-struct user_fence;
 
 struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b01f31ed4417..fbd2c28de8a6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1181,6 +1181,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	struct xe_bo *bo = xe_vma_bo(vma);
 
 	if (vma->ufence) {
+		xe_sync_ufence_cancel(vma->ufence);
 		xe_sync_ufence_put(vma->ufence);
 		vma->ufence = NULL;
 	}
-- 
2.34.1


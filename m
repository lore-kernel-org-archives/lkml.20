Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869E29D270
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069447; cv=fail; b=fWNrK1X5xl4G4g1rJ/IImDpWf2fKNit0rRVUwYXunmu5ZOs9XrLcPMSE1VT3emvgP6j38rUPqV9keEGp4a5aRFqbgyITRhhfLF4TPB9apigpDGXAInsHd6nirhW+DGD8kJDZeHu3LZT8cWJ4SneDBFvLL69l2yqNPy4pci86eYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069447; c=relaxed/simple;
	bh=npkOlvwlz8z1Y1onFEZ5tWFaUjZfazIAjCezV/Xy2Tw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbWLukQskSv239uxPA1cW2GX4hF1UhS61L9SjmLsExY9fTOnyTSIsUFPE6L7U2oBsc/FrgMHI0cVvsTrViMoGIqC0binvWMrTkrJCzf10RSPdQt7RC1iJMvG8mrsk4dzaxWbzUjfSOR7b9hjK8hlSgXS9fTHbMRj9hUv9nTOQxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v6LHzyfI; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v6LHzyfI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMkOTWNJkOv7o9HYY2irxowzYVZcH754mTpwAFS4kI4472VGFVFEiNB05TYkaAxle4pNEZtS7ww7Xc9wXx4AR4DUaGXThQrhKeDH/DXmniNYYt8aQlF3RKKlaMo9uinniZBBzH5Bx5CLA0G2unVh06+qggc+fx6dyjqVfTD9gVJOfMIaPeKoivH6BYrSSySyS4ssi559EU4aeYbC56ymLCP4P3HzxQV84S507N9IUuaWuQXn5/EK8yS+PYqndj0iMO1D6Fz1p1FMnnH6pTHMzophj3ROqh+Gsfa2uGVf01acuTYyVRr2xNAisjEGmvUKq3Yh6f7xwO5ZBwXa5nBuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9oAEflEphoDIl6J2aejSrrH8pLOvpq+BMD3rsC5dOQ=;
 b=Z200e0XyU/2tfaCZbmiod8GxjbX6VskhJ+mY+XCtTtPp9Nc+TaulcjqnwNr4On3KEoucE+5EeGgF/Ocsjt1kmbagEH+tNEqgwJA0EiKdbB29V6syXzuqW32h77yI84mRWmVjgprm0AQYGn5oN0YpiA+2JdpY0KqKr1e4arCJzwLWAcqce1OGf4Bn67t3tz0gbmlrBfNU9/+A5IB+ypyoMolHWJHXjesqRjSo+aH0aK2AXO1KIAl7iDTrQ8B8ygf5guOKbXeXiJnwauwN2wq9Ot0j/NYqksfkZfJnHygQKC3JNh08+Kyo/OqzaQZtneIWYGnZ+w1TNrPHZ5JwhIk63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9oAEflEphoDIl6J2aejSrrH8pLOvpq+BMD3rsC5dOQ=;
 b=v6LHzyfINaAW+PSp3i2SlaPWwl3XVMCefLqOR+WMkDRfWSGEoPJOBP4hWMTZZBm6hgua/LkigSew+e7UetmkqkIg5GiChoMiM6Mmp6jP1OxDkkf2EFDXo6z9i1ImcfEVquoNdaAg8OL2Jf3iJ+EJkFyyIIYZOm1R7UUZsRoCFhs=
Received: from BLAPR03CA0039.namprd03.prod.outlook.com (2603:10b6:208:32d::14)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 05:57:21 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::71) by BLAPR03CA0039.outlook.office365.com
 (2603:10b6:208:32d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 05:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 05:57:20 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 00:57:19 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] drm/xe: Convert xe_user_fence to drm_user_fence
Date: Sun, 30 Aug 2026 11:26:45 +0530
Message-ID: <20260830055646.102644-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830055646.102644-1-srinivasan.shanmugam@amd.com>
References: <20260830055646.102644-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA5PPF6407DD448:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d6b397-b0bf-4ecb-4d9a-08df065b8e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gysGvV9qNOA1czcDfIDfPHZou1w4wTZCrZ96F9z2t0CKvU4TytwroOFwEVlBen6B6sG5efIYPYIDTpU/ajjy+dT9xB/FwAQcdsc+GTWnvgFPCOlXhgFHvx2YHlooitw7nB+r5fJziUM13hZfkhbcjHb3cXtCbl0429k/eY80HswrlXCptNZc6h9mdd40CKfUsz7S3d+apeenovSMH3+HUx31bj/Owlc2yP8Ww7UbRxqUgnIWbGxRsRt7QW/SYZdDNZ8rGtTtyr6goYAt6yTT4alYrlUC+MNTGQFnjv0ldyQUNyrBbwSzelTw19NgUQbsQLDvJW1ix66elHxiI2eGwcpPu7FMbhAl/Qcj1hL9Zmloas3nZi2re+YftugyZDgCHkmGLB8ruqkAyQSjvXY8SVtemAqLqsNfzIXwH3PVFzWAboIa7rNeFM0Pf6bCcdbY7f5iCSsxOe8t3mNnG0cCjlngAXrJY2OIe40IXhkb2zbysx3he8a6OmPu5GUCoOE57rjFUw5VlkadrB41ZaH7kJCmMQlDIAtm01yslALoQgnhLAksYwyh7hNkPpw0XlXIFO02zVyy5YaF8I+oZCX53JG+1+SKEi3uxFVMG/feLRFJFs3Z5Nka24flbD2xvINyJmhfUODb9zSZzp7TvKCPfVvpJ/qJjicKr44tIYNcm7dbPz4IxJXH0Q5KaK+FYzXUYONwiIWptiWG3rqzRwZj7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N5B6qDWTibqSiGAR28jZKrgRvy4Od4q78omirAWOjj5uZ2PpUmQZ2UKxDZzfzJDDB9uPk6+QnAlpI/SnW9Q4vQkitLUkutwhyQr10VUB3T+Z0SafNvgRyaO3EAyC9cipay/TadHr2AQzOnkaYKDACtwjsBe/IqWceBUi3qLHWv/D1osfpW+BWoSa+gOcWYLArzxAFd8AbRi7WeAYIQ1NF+CZ1NzVy0v92/7UlHgts7luwNHsJfKjNXu/plbXS1v4wcZPWi6CNkjD4MWaG3lWBNnVSN54hO1Ilkb3eYbPSbL472NeE+Sb0FvXinFrqvDlX9yTWkotFTq4Ci/xdXCDKMpZ+17dVaIhWSgNQ+1WnYtrBOr9s0moL9fLnAzqUfj9y4iWerpWTJ2TJJh4YDrlNPJvJSyZ1I86+a0tV/lhfSAnjDCGZjYuvCtT7seon0D+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 05:57:20.6452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d6b397-b0bf-4ecb-4d9a-08df065b8e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

Replace the open-coded user fence implementation in xe_sync.c with the
new common drm_user_fence helper.

struct xe_user_fence now embeds struct drm_user_fence as its base.
XE-specific fields (xe_device pointer for the ufence_wq wake-up,
userspace VA, expected value, signalled flag) remain in the wrapper.

The local user_fence_destroy/get/put/worker/kick_ufence/user_fence_cb
functions are removed. Their logic moves to xe_ufence_ops.worker and
xe_ufence_ops.destroy, which are called by drm_user_fence_work().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 149 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sync.h       |   2 +
 drivers/gpu/drm/xe/xe_sync_types.h |   1 -
 drivers/gpu/drm/xe/xe_vm.c         |   1 +
 4 files changed, 84 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..2d1e07792506 100644
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
@@ -19,36 +18,60 @@
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
+	/*
+	 * Mark signalled before waking waiters so UMD can safely reuse
+	 * the same ufence without hitting -EBUSY.
+	 */
+	WRITE_ONCE(ufence->signalled, 1);
 
-static void user_fence_get(struct xe_user_fence *ufence)
-{
-	kref_get(&ufence->refcount);
+	/*
+	 * Ensure the signalled store is visible before the user memory write
+	 * on weakly ordered architectures (e.g. ARM64). Without this barrier
+	 * the CPU may reorder stores, causing userspace to observe the user
+	 * memory update before signalled == 1.
+	 */
+	smp_wmb();
+
+	if (mm_ok) {
+		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
+			drm_dbg(&ufence->xe->drm,
+				"copy_to_user failed, user fence wasn't signaled\n");
+	} else {
+		drm_dbg(&ufence->xe->drm,
+			"mmget_not_zero() failed, ufence wasn't signaled\n");
+	}
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
@@ -63,51 +86,22 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
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
@@ -282,24 +276,15 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
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
 
@@ -434,6 +419,34 @@ void xe_sync_ufence_put(struct xe_user_fence *ufence)
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


Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EF64A5EDD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364127; cv=fail; b=nDQLOOYDJGeX87SvATENGwefuPRyWU2slZVLpXX0JHMAiVdkdnUoBaYlX76CGKPZT8EdFjhTiR/UJfpC83TKBSSL1OyYEbXpq/Oktx+ssNJ4KF90+ez1hDCf7WkOsLzbwE9o3KRlmwXTsPFVjEwwNqTVDcmOEKZK4rQgVdbc/w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364127; c=relaxed/simple;
	bh=F5ksDY6ZeP4ghUFZ3fZ3r+VhD3/IyRQWIkOX6sMRfFo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTLtxHXXl5dtZaFMRq77XSrYPvzVpo4mfz94d5TzkqQTBt347J7yR/MtW9xkpSEc53lQA83sVS1MO3KiIa1w5e2YM7sUZdCYzYifV/iCLckypXelGt9NGjMERDyZOtM/O/mDYCosGrLmni4t3nawlQ/umrK0Mp2fyHMxG6hRU4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m77hqJx0; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m77hqJx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IljGl3gXE7qViIpTEIlASE1tcnAbFdQttJe0b0qa6Laqhac456Im+MgRxyIsD9ZGtvkvH7RdSev/HbQJ1Am3kcZSpmpRfn3CXwfRDpHtQw8zQCLFcOyEhZMM4UczswJNhtjhxOmYtxLPmKYVile976fN7+7tkvTRO2UZwMxdZNcO65SHqFOomBKtEYZunUOLWMgnu7MOWoLBmgc9tKFqFQruEdldPoXqDWTP7kS8ddJ/ycd1JTeHA6+KlVgPpDpPQdt691HMyrybiM+QjwwRPGZRqzJl4bwM1fursv9UkHD1LqUIprBEVu1njx6a+BzUSe14n2VdC7gFDvAUWMfvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imG/RYoa56zQF4B2p39XCb/7A1PTc4xOSWxv+e/Y0a0=;
 b=Sm/iLUd4GlH8IVPjlEh1MBNGuT+sJOk0ml9OdxQdDG1q9/MDPGtUcvWPoPUUqrN4MAxqhd5+KczfAHvl+2mL4axliw8MOoQbeWtvczZNlpVilvOAs26NCm6nt/TjFVTHlS87vUMOlcZpqrMR5aT63qrpgE8A//lsNo4tzatCnFu4QQHrGApx1F7l3sTn+L/YtDt5Us7q4YXDoX1Qt/C27WFZoaLXOlAcAVgpGBU5irgfSRanZfulvGIHSmLZKk+O50TLbbCEaRnG+VBR2VFccp8VtQRMzA4OisQTyndg+nSr5aiOVfVE+J4tEc/HyVMy6xJgYmr/WAS+zPUw/jaANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imG/RYoa56zQF4B2p39XCb/7A1PTc4xOSWxv+e/Y0a0=;
 b=m77hqJx0z6dwUBuo3ZfWXl4u4qBDCaSWs/hZ0nB/4xi0FaaZ1Oo64ZTEtEwAHQJ9IWw976ci83vVvoYYA6c66LP32QsgKiNUpGw0Gzur2KwKdXbLbEQSz3eaTQamznpQuvCLFKkVaGZLgudUfcANXVp4ilNzzsZciL/cpDLPvYA=
Received: from CH0P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::16)
 by CYYPR12MB8937.namprd12.prod.outlook.com (2603:10b6:930:cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:48:36 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::8d) by CH0P223CA0005.outlook.office365.com
 (2603:10b6:610:116::16) with Microsoft SMTP Server (version=TLS1_3,
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
 15.2.2562.46; Wed, 2 Sep 2026 10:48:33 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] drm/xe: Convert xe_user_fence to drm_user_fence
Date: Wed, 2 Sep 2026 21:18:16 +0530
Message-ID: <20260902154817.185499-3-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|CYYPR12MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a44325-507e-4efb-2675-08df0909a685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SeSQtJ6Fu8fUaa7Z1ANZLDudwBb/pakpBgajy3tC3xtc1pBEb4obka4KxG60tiHq9jqSjzT5PWnn0iABVSPWrUNERCPr6mFzv+rWp0Dcx4e/l0ABdQzbOBRjK1x/BE+n801ay/3dESu+qTT361MOl2suUdaJLO/M/rXoBl/0MUz9azosZRACfMI0MuAPckYEGanxNQJtg3FvuiEw1DfufdI1lFMKie49UmbeYN3uUbfFCfesIRberRPcsi5BbwnmB0pq8ee2bJfsA+pLymu3Nt3yd8Xpjvy76lZ1koumx6WLWmzsd8w7jskyv2f/VFim5cTf/Z1FKl604DBdQTsTKFCTRidDEx3X/xyYXVdxY77EIHhGg7KaBkLn5UBLz/lVTQstXa17y8v+otKx07ZaMq2Yak4bpA62zG9wFxpk8sYspXwVqwO0KcSUpHt+G19lftkPGlZXzJNvOZkAv1puye0U1QQLgWmF19/NrShBSnRS+J4ohitlZbNMtbPlK1JrGE2o9jaspJdNQyPaa8aj9fTRMD2bXycuyLDS7sh1QjhuORwA0gAx25D2rbmcVChi7+NqfwsDK279H2EiN5Ikj7XegJSiXM74Rm22LIxUh0xHxdgvswqDGNWjo6pIwB2KS1cYvSHeGQcY9V9wU9iKk9v7z9goU/rRF4wxLQBI99U/fmvwIE9T6FlReagiQrKx1uKODgFgKGuCHyzeDGHxqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zIrv9Ns5n1HFKXRYec1oUFMJZJD+L/Yjm39neAzIkeaXAiRobuiAbaEk6JDjK4V2tI656JxiB49N2im2SzwwbQcVbOvwW5wCVRfZ1yGVkEu303CsxKeE9u0ucx+o8dUYzKjsMPhgwQdvfw1KozKpe46BpTwHDJ720F1F0X+lEDpPv2y27jwOPsEHBuSuXModSLYkslarBimNDjx7RpdyBuolkFNCSMzFQksrq+/NfgZmTfys4/nrokA3EIPCUcY+1NgE95hfeaMp3ef8jrpEmb7mfsU0sxHIsm36MUXQJqYJcEWdCh6i7orAQ9cH8SxY37w3SjU+5hYNie6YTdPAOSHKO+LChmFvq2Q6R1EckfTiv4PCchoHtNPxCcU5abotAJW2IOe2EI0BaJBT9k3pnqql30iwdgoXo4Flh/+STigrbG5AoU7qROuWb6U2IOVZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:48:36.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a44325-507e-4efb-2675-08df0909a685
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8937

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
index 37866768d64c..a67ace940931 100644
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
+	/*
+	 * Mark signalled before the userspace write so that if userspace
+	 * observes the written value and immediately issues a VM unmap,
+	 * check_ufence() will see signalled=1 and not return -EBUSY.
+	 *
+	 * NOTE: copy_to_user() may block if userspace backs the address with
+	 * userfaultfd or FUSE. Drivers requiring non-blocking semantics should
+	 * use a dedicated workqueue instead of xe->ordered_wq.
+	 */
+	WRITE_ONCE(ufence->signalled, 1);
 
-static void user_fence_get(struct xe_user_fence *ufence)
-{
-	kref_get(&ufence->refcount);
+	if (mm_ok) {
+		if (copy_to_user(ufence->addr, &ufence->value,
+				 sizeof(ufence->value)))
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


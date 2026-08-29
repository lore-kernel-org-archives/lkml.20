Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B843AD524
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018080; cv=fail; b=YdOE35poRyGgCHbweP//WeBBo9RqQbh4saeSD/t7HjXqpFTLLEvMb5xs5zYi2Atvyjh/gdMn1zgD3Lbypjy3ZsX3Sl9Z1c3cisK1YXmBLQAxfJhHh7SS7m7c+NapDZBJ04TGRrec3Kd0m3jGQW1/wB6RmWRSutmfYmyml2LkxmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018080; c=relaxed/simple;
	bh=n0xF7zUtKNPTOOwYweKeRDHglCX6E+H4ioyfK4pwTM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sb0p39P2s6CKp6pcRGra+2eBG989/SZ/KsKXFZ0R5brc95PVDw2m1x7ifKXdkwmH4uDxZz1LfH3u4R3beYPOBdD2deiRfcCx75f3/SsYhURWg8fz2QJui2zR9ud/WlLsBSL4cEbvqEdeJ4rc6p4ZgFcIR6VYf/FJY/HGCijsqs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qlei5mdy; arc=fail smtp.client-ip=52.101.62.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qlei5mdy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTf/uDjI17OYStiEjDNemM/FLYqQzmbowQMhpMn6L7DuxcBylR39FWBWi6xvQ+Ww3LoGMaZzwGWghDvpEWvKw2JnWkx7RgbYuoB/2J9/NMAmciUd7GLZkctkJXkWfSB+PSAPQPf+ZAbxqKjzcSMSp4TG216C7xjRxNua5uCL0FfqcuNY3nwiOPk6kQRpapRx/UxTUkixP+whEZrVZtaHyUVIxdusL2djs6F7lBzKdDpqKNousXc27TjXp6dB+JxJsy5esWbEpLMqExaJrDTzMl1RXvOXUHeg2wUqbGZP+NpJy09Q4naLcE3ZuU5N/pk2A6ZtCKJBQIgsSUW/cy3jQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VJYkysNpjJ92AI1dWahq+vyPgGPHdah1H67bEyvrzc=;
 b=K1UJd3ulO31DKb1hkV9yOTwRWQmNZS9bSRBAjtR6ssSIAtcDGvsypHw5xG0ASeGC6fMLEGNthOApoJ+J3dWKE/Q/MJ1DCRuzIVJ+ofP4Y2Nt82Cc1bXufUa49qWffilTWZud7Z673LFBK0HJ9aq38bEE30qD0bl3OkEZk7wyQJKjFLEfmbMk0y5LWmtFrlBrmKQm08E3SjURJPYWi1+Ypehnk30JN6+aCy2IKJEcPDtc4l0EytFmWSm1UOQXvUVyJ2DC0jlBjdF6lpoep1lDyZwhISDX73UkDH39kDzk8XgUaWBwFiVNvKM/OP869tDOd+8yrt3One5HuKrqOHsYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VJYkysNpjJ92AI1dWahq+vyPgGPHdah1H67bEyvrzc=;
 b=Qlei5mdy1TcQEwRzeeeJoD5RbUtD6mzM0TBzKsNTh+aQZG1WWAozHXdV57+NVKlzes295UIEYZTWOAQz8zhMvEso7I1ETPNJJhQ59k6VxmSY101U7rpS4uozH072xwS9qKW8Jf5fgvcMSITuIZtaqCLKHP8FkbC+jOVHOz5RgtQ=
Received: from BY3PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:39a::17)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Sat, 29 Aug
 2026 15:41:14 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::34) by BY3PR03CA0012.outlook.office365.com
 (2603:10b6:a03:39a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 15:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 15:41:13 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 29 Aug 2026 10:41:12 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] drm/xe: Convert xe_user_fence to drm_user_fence
Date: Sat, 29 Aug 2026 21:10:31 +0530
Message-ID: <20260829154031.42551-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260829154031.42551-1-srinivasan.shanmugam@amd.com>
References: <20260829154031.42551-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: e109bde2-a3c6-42ce-9d18-08df05e3f527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yhKlHJhFtKCAmCCOIsNpFW2gAf6Xls/DeeIwOmS+wVBUZAYBSSHj6+aMeNNfPtwlP7oUvK4Ut6u3R/LtJf7OPw1ghTUw6HGJvErfvsWI4OF8SUDIXp+50DFsXg1Y3e5lGyqgLrEg/fpivJZEB9Y1rwLp4kIYHqDboRNvfod0tVO0dB95kUEKOjN/DdZ+mQmWeaLjNROJMO6iQGvAFUqIU1Fk2DrJ5gKdROzks87lqZnJk/6q4YpXfqD0lCbe2ECVIX2JF88UuhhkBydIdV/POXoPnBBTNSg3fVFd7JcshBY8wYJ/jOU04Kuy8+JH7l7dsakmrQluhSslhrtXOEWhWxknaV5Y29MdARsK3FQwGo7rmjVh9fpxVO5vxlDBCIo+0Lcbx0cKl6N/KhkswhADfGziR8yIYHmIYo2uGC74tKXMaFSlJmyVsbpEkWMgEByuWrw5zpSBrqPxXs3HWsIzn74CJD0Le7k3mp0+8KeA/Lu+9pVBQ3LtZrq6UGvI9nUgTgoiw/60wOE+D7bcVDWip1ZiV19rJ658J51ZptLZpy1Gn6LXKFmG715yubNE5u8unib4VAyKzt9KFHpe/RJ3jo4LrXjhUEICZXFHsZXcMnZhaIRYCx/uAtcV2opkD9z4LWlzPmqsjdCM57wfiGjkd+P4wcRJ0QBgHkEoerbCX9bHwBH3XdUki4oYf9IVn+YfAQLIw69cyqYnQ7qHJO2atQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N5QO5Drgq9f4kDO6f3WhG19iaH0ryoPql6IUCElyQzyOt8p61CY+6GSIR55hCduBkkY5ezbRCs70LoKJS9GSE5GumBLg9oVmBpX/Ac5taMEWBgplxJGxOvqWi45gXdnF+x4k4XxSwbnw9anNpVyK3m/7e1ldKnf9rP+S7VCcMzj33MervaumJNLkArd7ha8Z6VAt/FTNgdk9kGxb2+QmZimRjaM+93PygCif8E2wBs40ZCTpW98dbTR2zxHLSLxapaECLHY+HIAtPCOJc9tTLqNnmteeSiKKaK8D2RBkEeVfPYYwF6DZGMaodrgTGySW08YYR05qNlFqanugLZVGFhprWuZhcNCe7wGfXRRZSn8qO81pNhHfhYUSuo9LYF8EoId6XiJVoRHHcYmikV96eJd6u0BDAErsfWeb1qZtxwyF1sXtgsYUkmK83yPNcG+U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 15:41:13.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e109bde2-a3c6-42ce-9d18-08df05e3f527
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

Replace the open-coded user fence implementation in xe_sync.c with the
new common drm_user_fence helper.

struct xe_user_fence now embeds struct drm_user_fence as its base.
XE-specific fields (xe_device pointer for the ufence_wq wake-up,
userspace VA, expected value, signalled flag) remain in the wrapper.

The local user_fence_destroy/get/put/worker/kick_ufence/user_fence_cb
functions are removed. Their logic moves to xe_ufence_ops.worker and
xe_ufence_ops.destroy, which are called by drm_user_fence_work().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: Ic61b6e0159874027e91e054103b676c4c63b1566
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


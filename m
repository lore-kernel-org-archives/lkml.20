Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93DA2C3257
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069448; cv=fail; b=htF3FhknvrneTimv/zdar/mcSdq/L6bSJ4dkHhoQ2zvkdyzWI4BfOPUhTUdxwuYNw95bPsk1mxy6P5htdqk5UR/MhqAEzhCjJ33z1pvlnVJxYX841VZeG23GCUGwY9fbMH75CD4movprZcUYqbjdbwxQn5Bw5zh78kdgUM2SBcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069448; c=relaxed/simple;
	bh=7vY4PM+k71TTJuv85uDy2wB028Ga+oGgvxSPwx01QOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0NBnEVgt71Gph0/LDK4tgGSk+KYjbe3R3sNjMESnuU7jKjRxlxnJ/81PgWSAX1hQAbCSABB80yMk71cvStSxn4JIfokaYhktJvoOGTrbySCcjdCLWogNLO1abVeiUYYFWkGZhFTAFIVHeJH4E4NTT17fEQbl5Yd3uREec0tQ8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3UVgECkJ; arc=fail smtp.client-ip=52.101.193.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3UVgECkJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAAVVvYViCCCZJz/zjlPwrGB5A6WJTV9ZCpZjF1sZ5IfuRWX3G/+48VewRxlpSoFw3uD0KwqQOpwdUB0FUcDnFdvCfJmZsFWTkutPY7yWKVzV1O0sHD6ajU6judh5q29kIsEMd6nNHyRNA1JOXRpOwtKQMO1nxh2pnQbN0VPSkuUdad+pPZOWUCuY60M0WsOgqSgvj6EjSEKvxIE3MFnWifc779wp1VM8mPuN0A4YYU7rnYhCOstRm+AUp4I+OAuOxxh/ZeadGBq0My9WGBnhMVgVN8czWHYCW+oxZODv4N1B2uAAxM6aStVGep2eHLL5KFOafO+exHStJueGNFWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYvo+As9LpHe5Z0PPsDWq2Lo51F72anIYfSQbcJlkPo=;
 b=KO03IbWY4b9MxU+NntIqPq6paH4wVBhlVSMzHiUnkzsIteNUpo/V2foil4dI9iSWAZX3wy5rvrqYUXMDzKA8H48fd5jwvzYxrj5aK7VAMnquM/6VQ6cdpbsNyHVN6Ydp6o3/4XvTkzU8ksIj53TuJ3/raeQAUXLwDiv4YToqqr+/G8jPsp12TOloyoCzE/+1VonRHDyAXYAchLE0uAEHKn8rlsKP+ZdrL0utDLWpO7JxNX/IPTo3Hqlrq9fcj+wdp/T2+OwxLqXah05W3e6gdtk6gvyaPOj8+s0udArbS/JYVOWytN+SXaSZ8tRuRl1mchfPGJKZdYiWD2Eew+LJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYvo+As9LpHe5Z0PPsDWq2Lo51F72anIYfSQbcJlkPo=;
 b=3UVgECkJ7GArdXqXYaXD9UO26iDZgqgkwd3zIqPErZFHei2Fvd1eTq8EV/BZ7AFW5/AU0DvGRnlWHNZ/9OZ+i3sb3Vq4/G7UpbCT6AAPNrOgLRGYQrg6P+JEayPG5egSaUb9nrXaynv9xG0kTfBYRKiHIwlRisODgeICS0bOki0=
Received: from BN0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:408:141::26)
 by MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 05:57:22 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::16) by BN0PR07CA0026.outlook.office365.com
 (2603:10b6:408:141::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 05:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 05:57:21 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 00:57:20 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Sun, 30 Aug 2026 11:26:46 +0530
Message-ID: <20260830055646.102644-4-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: e6db0f63-8ee7-46f1-58c6-08df065b8edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I0Cu1P6DJiPRrJMuUnengJAmz8uOXUgkYUIMAqeBhZS1t5D42nONGC6paL7nEyFdgc1aGo7ZtdyBCKzY1rD9OxwW3+IfNpGK2VVmCDZZgACd6KpXFbtIeX+bObwcRSO40xu/6wymfAPWDKfb3DaUUBogW9p3V4tpAqWryz7Wgntr90vgq565Tiu5haFzQVsx+u08yaInB+iDCdCj1ik0vU1rpV3kZQm2WTQiMqm27EV1MwklpsW5IyZFfFoOQ5U4uEvUWvXz8Iq54+6In6xo2wMF8/oYooS0YnVlZlfDcM9xm45m3Iml1ir77vh3pJIpZpsICBnunc5Se0E4uXqb7uJN4Fmgzk8mEhVtALekDHdiDcqoXrrHfVhPzLnByXJ+el9wWhwZwSCRAQUak8LFmNBTLXcD4GFVghy1sJ2/TVEvePmQibUuRCuAoJ7T6p2qwH4NA7MfEpQbJ+5bCwGYZoqfhy81LdnXPfB1q+8zVNdmn0OyDEUWcnv/MJ8hNp2ITSRhNb31aFqZfzWHgbGkUm4bBipfz5MSdu7YH+PW1PUKxnxQ8q+cbwwLC1VanD3s3+qS7/bqW4X0ONqY+JfaTgRAVNzwxQ3N8Nf4t2MEdcHrpdtCHPn6pbELthosSy9tNrsa1pQqTxClnHTEvBb9PeuoXnkhbCbZcka/N6/WN2JqGBwFxMwi3qxdyYL8wSCtq/cxGXi/MTkHY/s5a7qUsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yZZS0iYA0zrN0hitY92pAWeZ7/OvBlhBawn2SBgWa9CR4X85rxFRngL/3jPOAh/0Nqz2wUjoRXetQDSL4WuWLHEV432cFVFVJTRwjEtuuP/0YXNFoqsX3zZDndIGUrI16xswWeeqvRIUXBxFepp50lKuOzfbjIptZCP7o90s8+7g7uqt7oaw+FPODHqWdnASRD6A+B5MePe1C14YB5EpYsDCNdrKVwGG8MuzfkhE5IHZnjlToSwV2kP6PXZEK9NMnq6oLdD/0TKks0CWEIu9legob495xBzEJFjwC/uUeMdYyGVCCFmRQ78BW/j8Y4kPFBDVXCS59aVCTD2NOgN09/+K17bpGAxm8eK513QvtmDUsOQkG2hMXFN2ne/IrjBdTyLQCOgctm/cUzowCIQbCQvP9utPsbHo1618YYk6dKpJTLiG14ZekgWU8PWQ9PcF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 05:57:21.7990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6db0f63-8ee7-46f1-58c6-08df065b8edb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238

GPU drivers sometimes need to read a value from a userspace VA when a
dma-fence signals, compare it with an expected value, and only perform
the deferred work (e.g. eventfd_signal) if the comparison passes. This
is the per-signal filtering pattern used in AMDGPU's EOP eventfd path.

Add optional compare fields to drm_user_fence and a new helper
drm_user_fence_set_compare() to configure them. Supported operators
are ==, !=, >, >=, <, <=.

When cmp_addr is set, drm_user_fence reads the value from userspace
via get_user() and calls ops->worker() only if the comparison passes.
If the process MM is gone and cmp_addr is set, the worker is skipped
since the comparison cannot be performed.

Drivers that do not need filtering (e.g. XE) leave cmp_addr NULL and
the worker is called unconditionally — no behavioral change.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: I44fe8ec50babaa140dd875c00e249e0f6edc0551
---
 drivers/gpu/drm/drm_user_fence.c | 80 +++++++++++++++++++++++++++++++-
 include/drm/drm_user_fence.h     | 29 ++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 664178e2d74c..9e141533622e 100644
--- a/drivers/gpu/drm/drm_user_fence.c
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -12,21 +12,68 @@
 
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
+#include <linux/uaccess.h>
 
 #include <drm/drm_user_fence.h>
 
+static bool drm_user_fence_cmp_match(u64 cur_val, u64 expected,
+				     enum drm_user_fence_cmp op)
+{
+	switch (op) {
+	case DRM_USER_FENCE_CMP_EQ:
+		return cur_val == expected;
+	case DRM_USER_FENCE_CMP_NE:
+		return cur_val != expected;
+	case DRM_USER_FENCE_CMP_GT:
+		return cur_val > expected;
+	case DRM_USER_FENCE_CMP_GE:
+		return cur_val >= expected;
+	case DRM_USER_FENCE_CMP_LT:
+		return cur_val < expected;
+	case DRM_USER_FENCE_CMP_LE:
+		return cur_val <= expected;
+	default:
+		return true;
+	}
+}
+
 static void drm_user_fence_do_work(struct drm_work_fence *wfence)
 {
 	struct drm_user_fence *ufence =
 		container_of(wfence, struct drm_user_fence, base);
 	bool mm_ok = false;
+	bool call_worker = true;
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		mm_ok = true;
 	}
 
-	ufence->ops->worker(ufence, mm_ok);
+	/*
+	 * Per-signal comparison: read a value from userspace and compare
+	 * with the expected value. Skip ops->worker if the condition is
+	 * not met. Drivers that do not need filtering leave cmp_addr NULL.
+	 *
+	 * If the MM is gone and cmp_addr is set we cannot perform the
+	 * comparison, so skip the worker rather than calling it without
+	 * having verified the condition.
+	 */
+	if (ufence->cmp_op != DRM_USER_FENCE_CMP_NONE) {
+		if (!mm_ok) {
+			call_worker = false;
+		} else {
+			u64 cur_val;
+
+			if (get_user(cur_val, ufence->cmp_addr) ||
+			    !drm_user_fence_cmp_match(cur_val,
+						      ufence->cmp_value,
+						      ufence->cmp_op))
+				call_worker = false;
+		}
+	}
+
+	if (call_worker)
+		ufence->ops->worker(ufence, mm_ok);
 
 	if (mm_ok) {
 		kthread_unuse_mm(ufence->mm);
@@ -65,5 +112,36 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 	ufence->ops = ops;
+	ufence->cmp_addr = NULL;
+	ufence->cmp_value = 0;
+	ufence->cmp_op = DRM_USER_FENCE_CMP_NONE;
 }
 EXPORT_SYMBOL_GPL(drm_user_fence_init);
+
+/**
+ * drm_user_fence_set_compare - Configure per-signal value comparison
+ * @ufence: user fence
+ * @addr: userspace VA to read when the fence signals
+ * @value: expected value to compare against
+ * @op: comparison operator (see &enum drm_user_fence_cmp)
+ *
+ * When set, drm_user_fence reads @addr via get_user() each time the
+ * fence signals and calls ops->worker() only if the comparison passes.
+ * This enables per-signal filtering without open-coding the read+compare
+ * pattern in each driver.
+ *
+ * Must be called after drm_user_fence_init() and before
+ * drm_user_fence_add_callback().
+ */
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op)
+{
+	if (WARN_ON(op != DRM_USER_FENCE_CMP_NONE && !addr))
+		return;
+
+	ufence->cmp_addr = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op = op;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index 2b2b640f510f..764dd55ed3a2 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -33,6 +33,22 @@ struct drm_user_fence_ops {
 	void (*destroy)(struct drm_user_fence *ufence);
 };
 
+/**
+ * enum drm_user_fence_cmp - comparison operators for per-signal filtering
+ *
+ * Used with drm_user_fence_set_compare() to control when ops->worker is
+ * called based on a value read from userspace.
+ */
+enum drm_user_fence_cmp {
+	DRM_USER_FENCE_CMP_NONE = 0, /* always call worker — default */
+	DRM_USER_FENCE_CMP_EQ, /* call worker if *addr == value */
+	DRM_USER_FENCE_CMP_NE, /* call worker if *addr != value */
+	DRM_USER_FENCE_CMP_GT, /* call worker if *addr > value */
+	DRM_USER_FENCE_CMP_GE, /* call worker if *addr >= value */
+	DRM_USER_FENCE_CMP_LT, /* call worker if *addr < value */
+	DRM_USER_FENCE_CMP_LE, /* call worker if *addr <= value */
+};
+
 /**
  * struct drm_user_fence - DRM user fence with MM borrowing
  *
@@ -51,11 +67,24 @@ struct drm_user_fence {
 	struct mm_struct *mm;
 	/** @ops: Driver operations. */
 	const struct drm_user_fence_ops *ops;
+	/**
+	 * @cmp_addr: Userspace VA to read for per-signal comparison.
+	 * NULL means always call ops->worker (default XE behavior).
+	 * Set via drm_user_fence_set_compare().
+	 */
+	u64 __user *cmp_addr;
+	/** @cmp_value: Expected value for comparison. */
+	u64 cmp_value;
+	/** @cmp_op: Comparison operator. */
+	enum drm_user_fence_cmp cmp_op;
 };
 
 void drm_user_fence_init(struct drm_user_fence *ufence,
 			 struct workqueue_struct *wq,
 			 const struct drm_user_fence_ops *ops);
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op);
 
 static inline void drm_user_fence_get(struct drm_user_fence *ufence)
 {
-- 
2.34.1


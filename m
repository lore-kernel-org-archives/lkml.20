Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D62D1913
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059573; cv=fail; b=vBM4BvJ+LGQFTUbXCfD08QVU5dpX8rhRl3yJmRGt/ASObQjyn849s078XdFVGRxQNSk8nttiWRQ71/Z6RqdBS8GCZ1H5hPTAr3Ba8X66bgYwWfb87Nho1IJWDDfKKJ7293jvd6meaYvEnqXpEPBUHbLRwXWf4l+QLKnkfqfWbZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059573; c=relaxed/simple;
	bh=0uUDYXTHSn6c/d9z9fXpN1Egh6elgNsnt5O1LvYED0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nMkpoOIuJgoN+OXpB18IfcO5Nkg/+gzs6hjJMR+WjvdVZ0oMrXUjbScxqSm8qNgiv5bXepeI7vxQgmF0fMuUAN15UtnTFqR8U2UVUwcu36Dln4S/cxGQsZmFolv7uCoG8n1JBsjF9BOCtPlFzLhb+d0DA9D6WJOyZhwJIrRXy3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GGVj8FaO; arc=fail smtp.client-ip=40.107.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GGVj8FaO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkDcZbpQeyQ5/Pw3l88F+Qgp0SNe2RTP5rK0yuWuIFN3YTms8BoEPj2kiFWNTJ1cr3JsmHD921pPghUt14Eislcjmy3++q+9AoYrXCHYM1sASKiIb7ZGVstfLOPGp1fZxrsI5Wp/G+EkUB0RrKuY1BPD1mIp5OKZmcj0PFnetySe2mBGny1vAke3nMIFBssZeZ82sLvsQwpP0wDGVY25XGir/5xa0/fF0BSWF3BaDzeVK+fIsJzZvaFpT/+pP+5OKuXT2KGZWUxET/QWf5vVheC9Mpp7Yqpn0N4NZcymhbfg9M2SDAiJryiKcWw+9q2UgR4bANIUAbYn37y6CHA9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2xRjcpCwGMAptPNQOJpSKSe7EEKBtwDW+CUROCMjYY=;
 b=iKkEwPJkvquTp47KfivBBKPNdT2WjsPes6oINJVOsAQtwwPy+SsYCKXNsP569bshiSZWe8WkCFEqPBltSoIXVDxPpEMnIAbxoXnTd9VOuFPAeKPNZv4U4qBhr40OBmmexhhTv3O+QlbF1MwzQiXSq2vvB/EkuUcE/D3i/vJZ0T8S3Knee/eVrXPDi8QLi4j6q0vgDxqeO0LLSohGSmYHDxFHW74s6ExnyG5s64n/AxLhelIwHtIGrxdQwdUQpiIIfK4qMVv5L01ycmio5lvz8taTNQRO+6mEqJnbuvIeIM/Is7SANu7CrFvOH/pvZPM3GmHIougbK+zmWnDt9dY1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2xRjcpCwGMAptPNQOJpSKSe7EEKBtwDW+CUROCMjYY=;
 b=GGVj8FaOzr4MJ1Y3Dbg4vePkdrmog5eEty+nmsQez6l9MJ0pHvfzZ89DzS4Qf+a3ZwS0HeCgGIcK91rORinfgoJu7uB3XIkhZyBBg2PYHNuVPzFAaBuWcHsJ9X7becPVSoCqRD3g+T/MStqTQOE02DtA0e5iQYWSn0ta+S8NhDI=
Received: from MW4PR04CA0275.namprd04.prod.outlook.com (2603:10b6:303:89::10)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 03:12:45 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::52) by MW4PR04CA0275.outlook.office365.com
 (2603:10b6:303:89::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 03:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Sun, 30 Aug 2026 03:12:45 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 22:12:42 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Sun, 30 Aug 2026 08:42:25 +0530
Message-ID: <20260830031225.69819-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830031225.69819-1-srinivasan.shanmugam@amd.com>
References: <20260830031225.69819-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb37dc6-3c79-4fe3-0a2b-08df06448ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q+DkfXnhbP+4wfsilIeU4cM2LyREuZwjnJX0IOEGIHIF3gzxrS9qFtVck3a94VuWZclNmR6xG+/WlsHlM9UkigHLYWvpOkiveK/ujWI25oDXrrNXpWvtTKaDqFjixBv60d4bEkXEjBb2S9VK1Oujv1MNeb9cJtHtWDKC4+Az6cwwcl76oV/Hgqk9dizUK+S+8OSJuGjnMlpWHGi5h6NhnKCb4rUmCOAFUo7GMJHot/6PXFQKFPFdKknV00RzhAeY1Fia0IEQ7hrcJRyiqVxmKuTY9YBNwz0zleR8x2qiMR1+sKBT4hAXCecRxFeBjXYX1ReMC12IZ2HFVoMQHCbnO4GNP4S95QQxs7gKAzj5as+luTsfrbJiC8KWY2C7WhHGwEMP8Bpj60davVn97JfoVQXIqB+t3EURjsC/nk41dd/+yQJilVD36NjhGL3JcJ08xeWZr/Kko5xZ/uyhX546rSrN0kYdCpAbmRnUiGiskEz1Jwv+Pu1trTB4ZTSa+YADzhAWpq5Nn6km6KCRp0rnZWtfA5LXxxVNU+WqQhcYI07/6b4A45d4EElEw7YlPfN/+RuZbcn+osuJfn4pF51DQqVh9rrjmXaWd2o50nQ3kAUioZxdw4LgY3NpDqjkW7MFt+EXVA2trVnEe3WiutlwrLHrL8cbI1FtXBimjSdjm7tqADYBKb0PbyxXH005eLFjflVV3uRitLbEE/tSKBbj1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aET2cH8hots/OebKHLZQlzxkr4dp/7MPrK/zDc13hYzBlgod84YB6FNxS6X1ZZ3/9esmy6QY40qKeOFNgU3EvcLHazbVdx0v0r8Smkiot5B77dwH+CW/WJ+TmVjnMpCCPsUHxp8Pceeqfv/xCMcsyg18WwbeP/h7hGADb4vkOpIJjhEWQO4M2AzHuZG2GNcZyMTUdruwlc00xx820KutmnCECthv9PN24LWNZGc17sAgEI44qAB/tXqGmM01vc/14Cix9DcvGZuWUR1WN0MTJJE+wTVDOGs1zGt8RNoNpV804y3Q1SXLazaa/AoGRUtYJmiNdRCOK+JWpe3p1XUcQWaw0hhuv6BwQhnWIgqK2COSonOSj/q3SCHgRV3cObYO0MNhUxv7FsJsp6tz3tnTtZqLejBnPnyAEeBP+ayl+8R/0dUrN1W9xo7Wh9znvffZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:12:45.1817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb37dc6-3c79-4fe3-0a2b-08df06448ffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113

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
---
 drivers/gpu/drm/drm_user_fence.c | 77 +++++++++++++++++++++++++++++++-
 include/drm/drm_user_fence.h     | 29 ++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 9f6327406d3e..3e429eab7d99 100644
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
+	if (ufence->cmp_addr) {
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
@@ -65,5 +112,33 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
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


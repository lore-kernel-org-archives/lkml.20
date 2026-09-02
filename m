Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335C476CDD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346703; cv=none; b=Kk2sUV9rtEUOYL1z+PzF2Xzh6Bk0m0ajlXG3vqzUZOwhFOsli6tfKT8JXEtKCdCPppm898LecTH3GJYN+R5pUsAwAFHvBoxClw8xDZXr+U4ICT6n3E9lQFodzaS999i+t97od+KKi7sEr5ELrCQIgSBSOLH3X95Mbe0qJNbLspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346703; c=relaxed/simple;
	bh=crGsxoU7bQBb8UDL7a0wPLslcJBB88WGfuL6ADjICbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBqWFn5RgBkiU3i2NlD4EokCTtoIi0qnhMFGG5VJxAlj16mwi/bOw/wWS2iVVlV6B9DpM6R65N4WV6WmwdOWgypwaz5ZKuUuYm4houYL/E5aXMun6Bn8az7Rpch/DWq53nHLXJgpAC/pAjGSrxSMDc5iGELWWEQivqQkkGUQSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhHdTW6m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhHdTW6m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceab75934dso10412505ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346701; x=1788951501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5n4pILB8Comw/tnf+oqPysx0XcGiglgqtePGDPNDzs0=;
        b=ZhHdTW6mxm3NGjrC5FEVXrQzyfEBvj8zEM5uQz6geOyiLZf90BR2XXuzLFlNAxkKKv
         w12Mk0KqR8DTLRGVmvry7sL4i+7JUCwE8GCWW5OYM7RJDFMNnTy7ttjoESiqmK2dayOh
         0UbTa2Qzuw96nBUB6RH59CFHE+77V1EjE9lFX22cG0ft3BHsd5w3PQJpuvX5rGD4JvLh
         46O7mKGv4y0xbk3O35Um1e/HY6dUcgQm1cc9xfe1VaAaez7A9+2vTIJ8VQr4Gfilvvg2
         nJwc5NyC/EQ6KEJc+mqGGuAWeZBbSQMRVS3VY560DZPFwE8rt9mZuM1xAnh8G70fgHx3
         asow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346701; x=1788951501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5n4pILB8Comw/tnf+oqPysx0XcGiglgqtePGDPNDzs0=;
        b=GHFxKDLhhO4sgchyyEPuXA9RS47hz6lHXUl7XYXkRUaE7eujg4Proo/MQyU+CAqONY
         If66OKJ/ACks10N3k0Lhej9f1koNe99pCQm0lrbdIJQT8TO+wM6Ggp1KjTOXXtMpZtEg
         ntTGffQjw4SPg1d1WRqQ7PXKYuidtY9H7lf+JHd05wLklCh5v88cfLBvlRC1opIrOwR3
         wZCv3zLfs4kEluDTq+HL8gDan2Yi4+qpsn79aFoP4nb22qpTPnwk/TcHrgL/O+G1JAM1
         iyGH+UwA+IlXUH3IZwZnmEJvpp1yZ/oM6VjTFv9u8Ag9Dn6ioXZJOt4Gp2w0HQaN2mva
         fL4A==
X-Forwarded-Encrypted: i=1; AKwUvBxLy/XqlEP88n/Z1Dwqay1rHOOXxm1HAFiYCrQ0l5h458PYhd0IOId8fuJq0kXiCMFsZTh7B3jNchuDOSg=@vger.kernel.org
X-Gm-Message-State: AFuF++ne0ISPOQuGAIvWQb6LFAWJ4O18I9t8nmT4kdsu74Sigyt84Tv9
	UOjrFaIwSK+vryFhE8UNn47qgwJd7DRzTOMv0l+ZGreAS6t9zsry8TQ=
X-Gm-Gg: AYBFou2zk55mcXoVDdZrRNRc8hMI8/8Hs93k8LiGnmLqXo1OlNFIarT5PY1uPb7ki+S
	lw1AieZ9W0ZjuTRPoXhQg2eAt/T+oFUGPTV/Pp890yImeHnvOW+i2XeTY5G8yNz5kEml/ubUwwj
	5+svUCSPbmHvHumD/GIKUqD4srBqI59VYHvU1n1rIr7bzWO1PRluWfYGFfalJImYryUKMCOelm6
	AXRz6/olvk1xyZLeqUO0EC1l98AOy9uQX3iwEZzkIm3V6mnv/wYESul9ZQ9yvAUhJ4Od1TqBtPU
	1bVa28EVY4QDdiR98ejfOaG/jF9VQVXGsOHV0E52QnvgJJuMZdrfXIjr4n93rYq+FWwHvj/ssTX
	OzjE3DNuczm+ZkaD/cqo69aVfQ6wQioLa1Wx4qYVYgb1gKxillE1XWVizKZMTdihG92Bq/LIsZP
	2HWZpy9pqZ+f2V+WtgL89d/sVtbL5/ZkSQgsoJg5J/Q55iVtE0jJ4Dfhqb4HQPhl+FkvDMYi4/2
	bvEnYoTkFl2vHTkjDO8r5MYSfY=
X-Received: by 2002:a17:90b:4d0a:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39aee1476d7mr4967532a91.24.1788346701144;
        Wed, 02 Sep 2026 03:58:21 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfcd65sm4963143a91.3.2026.09.02.03.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:58:20 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: tursulin@ursulin.net,
	phasta@kernel.org,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/sched/tests: add a UAF regression test for the timeline name
Date: Wed,  2 Sep 2026 19:58:08 +0900
Message-ID: <20260902105808.1541063-3-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902105808.1541063-1-malhyuk97@gmail.com>
References: <20260902105808.1541063-1-malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test that reproduces the drm_sched_fence get_timeline_name()
use-after-free fixed by the previous patch. It holds a reference on a job's
finished drm_sched_fence (standing in for a userspace sync_file), frees the
mock scheduler, then queries the timeline name through the public
dma_fence_timeline_name() API - as a SYNC_IOC_FILE_INFO consumer would.
Before the fix this triggers a KASAN slab-use-after-free read of the freed
scheduler; after it the cached name is returned and the test passes.

The test needs no hardware - it exercises the drm_sched core through the
existing mock scheduler under KASAN. Put it in a new tests_integration.c so
tests_basic.c stays focused on core scheduler behaviour.

Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_integration.c

diff --git a/drivers/gpu/drm/scheduler/tests/Makefile b/drivers/gpu/drm/scheduler/tests/Makefile
index 9ec185fbbc15..10abe07c06d2 100644
--- a/drivers/gpu/drm/scheduler/tests/Makefile
+++ b/drivers/gpu/drm/scheduler/tests/Makefile
@@ -3,6 +3,7 @@
 drm-sched-tests-y := \
         mock_scheduler.o \
         tests_basic.o \
+        tests_integration.o \
         tests_scheduler.o
 
 obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += drm-sched-tests.o
diff --git a/drivers/gpu/drm/scheduler/tests/tests_integration.c b/drivers/gpu/drm/scheduler/tests/tests_integration.c
new file mode 100644
index 000000000000..0572f1e3a80b
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/tests_integration.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Jonghyuk Kim(MalHyuk) */
+
+#include <linux/dma-fence.h>
+#include <linux/rcupdate.h>
+
+#include "sched_tests.h"
+
+/*
+ * Integration tests exercising the drm_sched interaction with the wider
+ * dma-fence infrastructure, e.g. fences exported to userspace outliving the
+ * objects they were created from.
+ */
+
+/*
+ * Reproduce the drm_sched_fence get_timeline_name() lifetime bug.
+ *
+ * drm_sched_fence_get_timeline_name() reads the scheduler name, and the
+ * drm_sched_fence ops keep .release set, so the fence is NOT ops-detached on
+ * signal (dma_fence_signal_timestamp_locked() only clears ->ops for fences
+ * without .release/.wait). A driver that frees a per-context drm_gpu_scheduler
+ * while userspace still holds the exported ->finished fence (via sync_file /
+ * drm_syncobj) leaves the scheduler dangling; querying the timeline name then
+ * touches freed slab memory. KASAN reports a slab-use-after-free read in
+ * drm_sched_fence_get_timeline_name(). Confirmed instances: amdxdna, nouveau,
+ * msm; same class as CVE-2025-38703 (xe) and CVE-2025-71302 (panthor).
+ */
+static void drm_sched_dma_fence_timeline_name_uaf(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	struct dma_fence *finished;
+	const char *name;
+	bool done;
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_sched_job_new(test, entity);
+
+	/* Arm + submit; the s_fence is only created by drm_sched_job_arm(). */
+	drm_mock_sched_job_submit(job);
+
+	/* Independent reference on the finished fence, as a sync_file would. */
+	finished = dma_fence_get(&job->base.s_fence->finished);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+	drm_mock_sched_advance(sched, 1);
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	/* Free the per-context scheduler while the finished fence is held. */
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+	kunit_kfree(test, sched);
+
+	/*
+	 * Query the timeline name through the public dma-fence API, as a
+	 * userspace SYNC_IOC_FILE_INFO consumer would. Before the fix this is a
+	 * use-after-free read of the freed scheduler; after it the cached name
+	 * is returned and the test passes.
+	 */
+	rcu_read_lock();
+	name = (const char *)dma_fence_timeline_name(finished);
+	rcu_read_unlock();
+	kunit_info(test, "get_timeline_name() on stale fence returned %p\n", name);
+
+	dma_fence_put(finished);
+}
+
+static struct kunit_case drm_sched_dma_fence_uaf_tests[] = {
+	KUNIT_CASE(drm_sched_dma_fence_timeline_name_uaf),
+	{}
+};
+
+static struct kunit_suite drm_sched_dma_fence_uaf = {
+	.name = "drm-sched-dma-fence-uaf",
+	.test_cases = drm_sched_dma_fence_uaf_tests,
+};
+
+kunit_test_suite(drm_sched_dma_fence_uaf);
-- 
2.43.0


Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB44A3878
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360139; cv=none; b=kDjArfoyKhTC6xH1QgcSZpfMGdQJmZa1fKng1pa6QTN7DwAEQJl8OdmVX3i7lLOhP/S0w6VApr5qls8iEC2YGS7AJUGU6V3JwOd4YZqjJb50RQlBw81PhbBMdKlaneTZZeqvMyhyBiH+QiMpdqvIKKlEUG0vtGpByzY4YsFVDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360139; c=relaxed/simple;
	bh=ukCNfk1vZD9/PIg2R2oV129xQHtKSDmDjm8/Kp+FMc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaxTuYOZe0mvpiwLpdpsXN5r0ccR0GhVTQD7jrdFQpegGTNUt9NO9ZrRuvJlsl6a4JpEmftuYtHCfEF5TX/XhThi0b0qqwJvGMdLQVPSSpGxAgX4+yZft9OZXGN2m0YbfHMcvk0dqieoj5q29oit94ePPKjrZMSfMx6TLcHN0Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq9TqCxL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq9TqCxL"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1205365b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360137; x=1788964937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4rzi1j9WrZOHI2yOdIU+qwSR0bj2vsquJxO94rhuiw=;
        b=Jq9TqCxLRPjgPh0PZoGuDpbs2348rH2+DGqFTm8VWU+IaIBhZjpuxl/nEhzIorgtVX
         faUVyj6KjU/Pa+P8F3dJm5c3ILagpyITuRPK51f7sEwI47M8Ik4yxMpy/d62ieMa2qMI
         1Bv+p2fVpRlMCVvylcNqXyWoSGUvPyXgxPtvZG+zSiNVkovE/Qf0HkVTEAm6a+WxJhW/
         +11WlGeZFiuV0fp2WwZ1dUge2QKxqddNHE3VibvoLiJWUmCrw+amSziztWlwnlA/fngH
         li2KfapbEhu2ESrs/J2jS+E0qknt1VFPBO0bxsU8hXaWBoDYaUxckEfOKikCI/eyUBhi
         1DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360137; x=1788964937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4rzi1j9WrZOHI2yOdIU+qwSR0bj2vsquJxO94rhuiw=;
        b=lke8aIhBr3QVJnfwzKQhkbOyiqUJO91cem/6IuTQlE+W7MoWTdg5+dQgtKwtJ6geFc
         WJ6TB3+agoCXxI/2S/ca6BAW4h+Ev4d9IawR38aad3dqourkjPDhlABsx+l+KhjFSXrm
         MxrCPk3n8KQyYoZfsi7b7JZlwrXOD5YFFaCfO4qcE2BWWOZFuywp4SsNEh1VcITQ9JiX
         piK7+lAc2xr+iMcitPja/HKWt8D5npBNdZHxYPbNRdQSFELfiOyjXs4v+a8sjN2lQBAp
         EwZVovYAWd936fazfd0RfI0Jb4rO9MmD3Jk/EFXSiGjPmftVVL3eG0xC5xK7bldOpiLG
         I6LQ==
X-Forwarded-Encrypted: i=1; AKwUvBylqxHYuTU2SiZSWFH/HI4VmNZ+vKZmrn0BAm+F7ppCzRbLBlH5QmCFNh9uoY2AbcdOASbZNIS9RMjMbUo=@vger.kernel.org
X-Gm-Message-State: AFuF++lmEJurraccNNo36oKWCr57JVYz1z+4x5sopbVQ3YPIZil1Brkt
	bvOyuUHcqGuyCJ5bsq5TZMIY32zDTxEAXnDMiGXBmNrJ5Dv6UL1fRK8IyDVwy2lcNsKs
X-Gm-Gg: AYBFou3VSgCivWSmhrXmqlrcg2SqROrgUDGDAvu06vorjgOEXGO+YfB+sYbSYYZiLg2
	lZaC2GJOwSCa/YuhYgXCOePtrbHJdUnkfr4Uqpgr8yXwr7NeIDkoNhlROaGoiM5YdAw5O1TE3xW
	WRV/EXSdQBXE9jgSv+zMnluovdO8lZOly5ve/aTzr6LA5D6LVQPAgkZzCC56zfq6mK74OVPDQgs
	tmAbfz36F16PDNjUvgBoasmyOf4L3NLdPpaF1i56xZX3Zbb2KPZlfGYRKkcHw8ENpUDE1v7mHT5
	M2irqCJu+3PXMU5wNm3tiDXuoOZ+/LFXjJngb8ftsibOxVEFL9xIf1gLGI+O46OKCEuH9is9oTR
	U4XCBSZiP3SOC0FQG+WBmGZOUODFGnmgd47gpiy5Qdd+Az4MuDrla/k1RAvD1sEMoEM3yXez40N
	3GZXoOaOFltjW/X0T/s8564ygEHI8TH2lLHWq20qRCZAPgPyM0HDPuamHJYFHsDty1trkDHJa35
	LTQfqmhFW/Y6Lq/+8DOrW1wMDA=
X-Received: by 2002:a05:6a00:e19:b0:857:73c3:4468 with SMTP id d2e1a72fcca58-85f453a2973mr3154986b3a.23.1788360136614;
        Wed, 02 Sep 2026 07:42:16 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f8d8asm1655776b3a.12.2026.09.02.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:42:16 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: tursulin@ursulin.net,
	phasta@kernel.org,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v3 2/2] drm/sched/tests: add a UAF regression test for the timeline name
Date: Wed,  2 Sep 2026 23:42:04 +0900
Message-ID: <20260902144204.1843670-3-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902144204.1843670-1-malhyuk97@gmail.com>
References: <20260902144204.1843670-1-malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test that reproduces the drm_sched_fence timeline-name
use-after-free fixed by the previous patch. It submits a job on the mock
scheduler, takes an independent reference on the finished fence (standing
in for a userspace sync_file), lets the job finish, frees the scheduler,
and then queries the timeline name through dma_fence_timeline_name().

Without the fix the finished fence keeps its ops attached after
signalling, so this dereferences fence->sched of the freed scheduler and
KASAN reports a slab-use-after-free read in
drm_sched_fence_get_timeline_name(); with the fix the ops are detached on
signalling and a static string is returned.

The test needs no hardware - it exercises the drm_sched core through the
existing mock scheduler under KASAN. Per review it lives in a new
tests_integration.c rather than in tests_basic.c, since it is about the
scheduler's interaction with the dma-fence API rather than scheduler
behaviour in isolation.

Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
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
index 000000000000..5e1ca6c6fa5a
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/tests_integration.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-fence.h>
+#include <linux/rcupdate.h>
+
+#include "sched_tests.h"
+
+/*
+ * Integration-style regression tests that exercise the interaction between the
+ * DRM scheduler and the dma-fence API, rather than scheduler behaviour in
+ * isolation.
+ */
+
+/*
+ * Reproduce the drm_sched_fence timeline-name use-after-free.
+ *
+ * drm_sched_fence_get_timeline_name() dereferences fence->sched. A driver may
+ * free a per-context/per-queue/per-VM drm_gpu_scheduler while userspace still
+ * holds the exported ->finished fence (via sync_file / drm_syncobj). Querying
+ * the timeline name afterwards must not touch the freed scheduler.
+ *
+ * The dma-fence contract only permits access to driver-provided data (which
+ * includes the memory reached through &dma_fence.ops) before the fence is
+ * signalled. dma_fence_timeline_name() enforces this by returning a static
+ * string once the ops have been detached on signalling. For that detach to
+ * happen the finished fence must not carry a .release (or .wait) callback.
+ *
+ * Without the fix (finished fence keeps a .release callback) the ops are never
+ * detached, so this reads fence->sched->name from freed slab memory and KASAN
+ * reports a slab-use-after-free. Same class as CVE-2025-38703 (drm/xe) and
+ * CVE-2025-71302 (drm/panthor).
+ */
+static void drm_sched_dma_fence_uaf(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	struct dma_fence *finished;
+	const char __rcu *name;
+	bool done;
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_sched_job_new(test, entity);
+
+	/* The s_fence is only created by drm_sched_job_arm(). */
+	drm_mock_sched_job_submit(job);
+
+	/* Independent reference on the finished fence == userspace sync_file. */
+	finished = dma_fence_get(&job->base.s_fence->finished);
+
+	/* Let the job get scheduled (hw fence created), then signal + finish. */
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+	drm_mock_sched_advance(sched, 1);
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	/*
+	 * Free the per-context scheduler while the finished fence is held.
+	 * kunit_kfree() releases the backing memory immediately (rather than at
+	 * test teardown) so that fence->sched becomes a dangling pointer now.
+	 */
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+	kunit_kfree(test, sched);
+
+	/*
+	 * Query the timeline name of the now-stale fence. With the fix the ops
+	 * have been detached on signalling and a static string is returned;
+	 * without it this is a use-after-free read of the freed scheduler.
+	 */
+	rcu_read_lock();
+	name = dma_fence_timeline_name(finished);
+	KUNIT_EXPECT_NOT_NULL(test, name);
+	rcu_read_unlock();
+
+	dma_fence_put(finished);
+}
+
+static struct kunit_case drm_sched_dma_fence_tests[] = {
+	KUNIT_CASE(drm_sched_dma_fence_uaf),
+	{}
+};
+
+static struct kunit_suite drm_sched_dma_fence = {
+	.name = "drm-sched-dma-fence-uaf",
+	.test_cases = drm_sched_dma_fence_tests,
+};
+
+kunit_test_suite(drm_sched_dma_fence);
-- 
2.43.0


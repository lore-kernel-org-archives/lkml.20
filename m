Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747F3DD502
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509196; cv=none; b=P7S7fekLwmlWF+BvxUKryoeP7LCk2jftRObVNdTS8r6t2akcktKzf6Ilbd2zsM6XDpeYgVxolzpez0XiPVzumO8r054J3LYFSvHvDkir5YivhcCveM+Lbgov0bOBbLTVo6Bqja3PLvOg5TaXl+JJZEXIpA/+sC1p1PTZFeDb3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509196; c=relaxed/simple;
	bh=dpLdFWVE3fNkRLtb33Mz6KWyINNfY9Yz5XOlg4KbKVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzyQCvpjU1JrFOMENQvBijO3+QNEXDWurysIzM9ssiP7k7jXS3niWesi4zn/bB6A7QYy0ugSi4VBa6ojtVw14/sGGp2jnw4TTxtiJ9lZwCBYG9z6T8H5rAfDEgPY5JdSP2wuRC0efZ8ZvNCTuGWqghE5oCbSVx40hKF72ph3SW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4/s4bOU; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4/s4bOU"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso657595a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509194; x=1789113994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaFo74pEjy74IX81W7yJ+GS8RxmbNRM1kYRnfOPg9z4=;
        b=O4/s4bOUmvy1k+QNMyGD529KVrzwvffZNlD2Q4+rqzfhZ50CZ5AD15UNEAb/ftswwE
         fwi/uaJ1TGRbgQtJBsRww2Pqj4+l3lJFW7V6f+YVF60p5sx1PW6LklWTpzsgD9du5q53
         tTn6ARSNCgFyUJSfn1LAAkstdXHsbBSHT1lBpL5Ou5hBVG0ot2lLb8kPwZNIbY3OaoRd
         toY8YZw+fhmRYgVYlgJ3Elo+QJUdP9aHgBoIpL7TEWgZuKC4aVlvaYmfAw+yEyId3wle
         Tghsl+8h8onpxl+7W8P3jUNiQLc0y9OvvLHjnh0jnrdCarNw5rwKOwXhhE4jKmVsIc73
         Ct5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509194; x=1789113994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaFo74pEjy74IX81W7yJ+GS8RxmbNRM1kYRnfOPg9z4=;
        b=CHhpWB+jxZnjvjK1Wko49WwDQOTLodQktGWNlAW4AOf7AXeTM42QMWrFaEoq8Jett3
         YeDT+srYIjBQI3XpTP3qedwWNVPXzW5Bt/rdVDrd73AJ3yRrJYSWBj3XngvY3kY7cQUs
         1VCbrN+oyDy+hRBXo0OIPLGqxYSE+HHg4XRxyQDs3O14Iq7MHsi/9aIv1/XzZhuwBZp3
         KZG1KpP1b8oFSxIHvL/oVfTBBVnZrG7aRNi2YPdSS0F+BUOQ+aAsQa9yS4gMdE0OzHXk
         BGrPWW9595kK2qrWFKqz78/duTUavKyyV0pbLVuknZYMQWr5jeNbrOnP9rCplbJCEY3S
         qtrw==
X-Forwarded-Encrypted: i=1; AKwUvBxQyzC6XBl9EBiGXM29qLD7tjJMaYizTfIUPBwUI8EU9BSYasj+kz7iOqbN47UHVTKoYt3Y23kjV7YOgkk=@vger.kernel.org
X-Gm-Message-State: AFuF++l7ftAa/yDuME49EUzAvUJomV28NHwzCojEtH/mVZ8gtx3ZuEhn
	Ci2ZAKeW2KnBEDgNkB+vw761uNPqY1XrFr7C+VKerDQRyEIJX0h+5hs=
X-Gm-Gg: AYBFou38tMnH8HOxLm+rf/b2JBZ1psZf+oYWOrXzwwEMBtyCAW5tbDi/Hh2q5xko9RB
	3HwnO1kgQSaVwKnQXHxcswZkKVeM9S0TdzhUstMCPT0rvjpGnqfLn5aFnDWKb3MPok++nKOAWBN
	EyVVjC7R1zAviKx3mpsSJ7vYB9vhoNC1Vn5RW0KYZxpbhsoMJeBMWGeCbTnGI1l5oIzxoJmBysN
	jZUfKiYSInFw/MQrCoLiToWqXLKY1SnsPwicR1uN/CUPm7KYIEkb8NLrQ7KkkgKrLBxEZ0VyFXH
	/hr1FfeWFDZZhr+eW3bS+3coRlYQvbi+rQVeUEYPQh4cg7lODSzmAmqAS3fltkoKN5UTqBQtQgL
	/CCnDSIGgMwQnwxak2F20B5v7lcvgB3Ds06wYX8y3Zi/Eu+5EqwrQOJMrk9Xo1xmtShoPTLPWgK
	Spjer3lAsDDP14pmcrdvu+VuPzMVvkLxkE3ccaX3UaWsMyuF3Ej2//uafbGh+Fd7ujDXGufe67e
	maeJUqo5IRwMsP6UHfImJL/SVU=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr7586853a91.8.1788509193780;
        Fri, 04 Sep 2026 01:06:33 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b261549f3sm3181153a91.16.2026.09.04.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:06:32 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: phasta@kernel.org,
	christian.koenig@amd.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v4 3/3] drm/sched/tests: add a UAF regression test for the timeline name
Date: Fri,  4 Sep 2026 17:06:18 +0900
Message-ID: <20260904080618.2098450-4-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904080618.2098450-1-malhyuk97@gmail.com>
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
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

Without the fix get_timeline_name() dereferences fence->sched of the freed
scheduler and KASAN reports a slab-use-after-free read in
drm_sched_fence_get_timeline_name(); with the fix the name was cached at
init and the freed scheduler is never touched.

The test needs no hardware - it exercises the drm_sched core through the
existing mock scheduler under KASAN. Per review it lives in a new
tests_integration.c rather than in tests_basic.c, since it is about the
scheduler's interaction with the dma-fence API rather than scheduler
behaviour in isolation.

Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
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
index 000000000000..4a2d5571440d
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/tests_integration.c
@@ -0,0 +1,88 @@
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
+ * drm_sched_fence_get_timeline_name() used to dereference fence->sched->name.
+ * A driver may free a per-context/per-queue/per-VM drm_gpu_scheduler while
+ * userspace still holds the exported ->finished fence (via sync_file /
+ * drm_syncobj). Querying the timeline name afterwards must not touch the freed
+ * scheduler.
+ *
+ * Without the fix this reads fence->sched->name from freed slab memory and
+ * KASAN reports a slab-use-after-free in drm_sched_fence_get_timeline_name();
+ * with the fix the name is cached at init and the freed scheduler is never
+ * dereferenced. Same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
+ * (drm/panthor).
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
+	 * Query the timeline name of the now-stale fence. With the fix the name
+	 * was cached at init, so the freed scheduler is not dereferenced;
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
+	.name = "drm_sched_dma_fence_uaf_tests",
+	.test_cases = drm_sched_dma_fence_tests,
+};
+
+kunit_test_suite(drm_sched_dma_fence);
-- 
2.43.0


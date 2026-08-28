Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE73DAADD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929092; cv=none; b=pMN0Dzi2kf8LcSOho3hdXz/9pLlSMRHhZEVKqTpivmonZCDcpgGcOnbnQokaqq0HfB6fcZsv45oif3wkcJ05IroQagXLzXZVwdFrk4opLFNPVfIpw8JYwdnemkYnOwE7CE45cGYLCRYfJfWu+DND753+RzFYuBPwIOK8KS3Rhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929092; c=relaxed/simple;
	bh=qfrJbJBmuOXs/R7ZViUhL3sk3TtGFRGTyuf8b/EnpNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZR+InrPSPDQ1EViI4k5O7WIajy5IRwhkj9a2dwh4T67+I6M4j4LsnNCkfuEGTuW2FHTY1G93JuOCL/8urG8wlxmoIXYojLqmDYNLVYMH3QkAh0zz1zY3lIZ1szMbmtuQWp4F6ruEBXYYUyTLM0Ib6lTk+TUj/EQ0QxEETTkiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpVIYDDT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpVIYDDT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71a50caa9so12936265ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929090; x=1788533890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpZ9SLDzN6L/jZYPiTPvyIKpc053VdrqfuuoBmjatWk=;
        b=FpVIYDDTpLLljGfaP9QEdQFPUDarLGPvlgezrSzTd5xO78qe28kcI+XUQd8tAIFAOL
         wGl3d25JCjaiaZT5UO9QHuh6lQpoF+cSp+WT94ZfgqR7k/FnE2gNIe3qDTk4jtP7Nc6V
         /DjLe43V3fBG7JIXMbBSWajuyJ87PKb6cuiOhNHprsrSEtokGfBSYEAZSYIgsc9/k+V5
         qLS30eHFDqMhzVcaqFxCdfg+VyEvYsv2AvnM4pjnbl7cV9EXin3Frbjl8XqdTCE+FQiG
         mhQGPOpnHaNJrRXrxCZp2XjdZr23hjNtpACXnS6IekyjERomtTGXNGlX3vLtbgmevDjo
         H/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929090; x=1788533890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpZ9SLDzN6L/jZYPiTPvyIKpc053VdrqfuuoBmjatWk=;
        b=OZJNSpKiLWUzldaBAdt++5UfJiZj7Ig0Xyd3nXM8NoLfaYTfWWsICS+FIRcG7aUIX6
         54SNqdcDcU016VSvHo0eWr/tPVX9mkVMHr7jP/S1fYrP30spMq8RfD4lv6ZFT9UkJ+1g
         EMB5geBmP9G91LV4YnuFbCFNCWW0k/nl4oTj+5OExPb9vvDF3tOfZ7coNDDEF3ZZg3Of
         z07eMcsi6Y4ooOTIkDI8p2/32S6goLy3Hu0u2FkUOk48x3/J3zbhGCZJQ73HzYhy0zx4
         5/3rGnL2BMkTUem64aOdvEBeG7Akr6cBpwkRzCFnedLjt0zlXOi5XkS0OVwD5lbZgtAo
         gJCA==
X-Forwarded-Encrypted: i=1; AHgh+RrYmYIL3b6KYVlZgmNP9jrqRHiamoWxxQL9jh8tUtmbJA9VEbLw/AeBLCXnDMJXtWT/5f6zIIS3u4Ay9OU=@vger.kernel.org
X-Gm-Message-State: AFuF++kWR3wCzXu72/Uq/9bnd1gD5zlK6vEE3zGgnsyJtlScNFwwy5KR
	1W//jyjWb7IpuQDODuEHgw9mMAJOPfZQkD/Bw+8fLGdE8bcCmshaV2c=
X-Gm-Gg: AR+sD12PgQhmcTslMjLJP/b3m1KP7RhwJu+HQKwS9YJdfkbHoSA7g6Yt8w0fcErudkE
	/5X5eAifSVQeBfCc+At87k77minOgs2ZTEUV/D4rFmJopgQfyScunDMN7r8Oemvublz6kacnbaZ
	GWKZKUpCTF0zngmm0ZTQvoZq9yz5GG/xx75qTH0epL6pLqE1XxeOeBM3Lt4kQQasbK1f/FxWVwC
	YcLjbvl3dZMqY7K9mFwClFVcQkOlSzhdyeLxqa9HJKIqoeErrFuPl4hiYF13VCIaW3dxTSN7RuF
	SsSGWLnqjSd/IxQb9SlElhDhwnMQSkmOfeRJ1/rFqTwA6czzTsLWTrV+IGSnNGd0gUv+qDx9/th
	N4rVuydJ8P2tevSaMz5tqeCU4I6UQvuJVYQsUfkKH5VMXnLku0y/BHlwQ5SDKjgAddcspp67bkl
	NOZOqTMlKbi5e5wgMBKu/NrL3GDVb8KvZcZwMXhJUbpU0cg7m3QtURZWkH1Kkxu9gHqm1SlZxfQ
	pjbNCdbgeLTjU8Dv1T2qgN1O/0=
X-Received: by 2002:a17:903:2342:b0:2d7:414e:f2f with SMTP id d9443c01a7336-2d74def676fmr134531005ad.14.1787929090198;
        Fri, 28 Aug 2026 07:58:10 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6fcsm6159625ad.56.2026.08.28.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:58:09 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v1 2/2] drm/sched/tests: add a UAF regression test for get_timeline_name()
Date: Fri, 28 Aug 2026 23:57:57 +0900
Message-ID: <83d1cde658ad4c34080398ea89fc17dc1e87d5ae.1787928528.git.malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787928528.git.malhyuk97@gmail.com>
References: <cover.1787928528.git.malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test that reproduces the use-after-free fixed by the previous
patch. It holds a reference on a job's finished drm_sched_fence (standing
in for a userspace sync_file), frees the mock scheduler, then calls
get_timeline_name(). Before the fix this triggers a KASAN
slab-use-after-free read of the freed scheduler; after it the test passes.

The test needs no hardware - it exercises the drm_sched core through the
existing mock scheduler under KASAN.

Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 65 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index a5a5a35a87b0..2c6744b58f04 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -555,9 +555,72 @@ static struct kunit_suite drm_sched_credits = {
 	.test_cases = drm_sched_credits_tests,
 };
 
+/*
+ * Reproduce the drm_sched_fence get_timeline_name() lifetime bug.
+ *
+ * drm_sched_fence_get_timeline_name() dereferences fence->sched->name, and the
+ * drm_sched_fence ops keep .release set, so the fence is NOT ops-detached on
+ * signal (unlike stub fences). A driver that frees a per-context
+ * drm_gpu_scheduler while userspace still holds the exported ->finished fence
+ * (via sync_file / drm_syncobj) leaves fence->sched dangling; reading the
+ * timeline name then touches freed slab memory (arbitrary-read once the slab is
+ * re-sprayed). Confirmed instances: amdxdna, nouveau, msm. Same class as
+ * CVE-2025-38703 (xe) and CVE-2025-71302 (panthor). KASAN reports a
+ * slab-use-after-free READ in drm_sched_fence_get_timeline_name.
+ */
+static void drm_sched_fence_get_timeline_name_uaf(struct kunit *test)
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
+	/* Arm + submit first; the s_fence is only created by drm_sched_job_arm(). */
+	drm_mock_sched_job_submit(job);
+
+	/* Independent reference on the finished fence == userspace sync_file. */
+	finished = dma_fence_get(&job->base.s_fence->finished);
+
+	/* Let the job get picked up (hw_fence created), then signal + finish. */
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
+	/* UAF read: fence->sched->name is read from the freed scheduler. */
+	name = finished->ops->get_timeline_name(finished);
+	kunit_info(test, "get_timeline_name() on stale fence returned %p\n", name);
+
+	dma_fence_put(finished);
+}
+
+static struct kunit_case drm_sched_fence_uaf_tests[] = {
+	KUNIT_CASE(drm_sched_fence_get_timeline_name_uaf),
+	{}
+};
+
+static struct kunit_suite drm_sched_fence_uaf = {
+	.name = "drm_sched_fence_uaf_tests",
+	.test_cases = drm_sched_fence_uaf_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
 		  &drm_sched_cancel,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
-		  &drm_sched_credits);
+		  &drm_sched_credits,
+		  &drm_sched_fence_uaf);
-- 
2.43.0


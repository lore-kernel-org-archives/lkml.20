Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD2305680
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426237; cv=none; b=mXOXKX1yl6ES65J8cVd1/VclNjTRPYeamwRKIlJSHYxqwVZlVicqd1IGoB8Heit3dk0X14AIti2SKmP1f94/B8p0t8l+k68wAmFGSiJMGY8IzYtJ/KkEsKDJAkK2+ts1e+VTlp2w4MU0QpyLf/hF6dAYc/oVQ/25LOpSrD8eGCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426237; c=relaxed/simple;
	bh=21Vhw8Sf8iEiUuERUCd5l+TZdmvIet77ciwl2zv72TU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=btownyeal5jbV+28cwcabY5PMo9oq7xrvqo83bt9jqbWS6ErCDe0jf4RZMbz+XhUrtd0dNqIfjqjnsy97OJ5c+dYHV/8FN4tPoJUlqr+GObun+VmaCtAVCiJmhfsBVvkNZAYSa/ZmKpXqbe/+LAiQh5XF1YcdrwYZjPQAsQA5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ifGobQJ1; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ifGobQJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Hq
	+PQvivij3P3MEGYcAKZIRnspRAwgEpPvp+39rTTpk=; b=ifGobQJ1hRZQje/TKP
	ytN+JRqVpEhbeEzHPc+hpApX079U8hH2meRedfu5VloKIKhzH5CFt7KXVZCzlaRb
	7rvcY0y2hTyZtjNG23NTxbHb1KOi6lBUxdkItFBTdwOInisUJEDNQYC25tGnQcqW
	DXdwSaDAIQtFD7gw0LPdC8WqM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXfwfBN5lqWkugOQ--.30928S2;
	Thu, 03 Sep 2026 17:02:59 +0800 (CST)
From: oushixiong1025@163.com
To: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH RESEND] drm/sched: Create faux device for KUnit tests
Date: Thu,  3 Sep 2026 17:02:56 +0800
Message-Id: <20260903090256.552317-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDXfwfBN5lqWkugOQ--.30928S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kGw1kKryktF43JF48Xrb_yoW5urW5pa
	9rZFWYgrWrtFyDKrW7ua1rZFyfGw4xC347Kr1DK34Y9F1vqFy5tr4DGrW3Jry7ArW7ZFWS
	vwnIgw47GF4jyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn2-5UUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4gP+DmqZN8P1HgAA39

From: Shixiong Ou <oushixiong@kylinos.cn>

The DRM scheduler KUnit tests currently pass NULL for the dev field in
drm_sched_init_args, which causes a NULL pointer dereference in the
drm_sched_job trace event when it calls dev_name() on sched->dev.

Use faux_device_create() to create a fake device for the mock scheduler,
so the scheduler always has a valid device pointer. This avoids the
trace event crash without requiring the production code to accept a NULL
device pointer, which conceptually makes no sense for a scheduler.

An atomic counter is used to generate unique device names, since
multiple mock schedulers can exist simultaneously across different
test suites.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 14 ++++++++++++++
 drivers/gpu/drm/scheduler/tests/sched_tests.h    |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 14403a762335..cd87e405bb1e 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2025 Valve Corporation */
 
+#include <linux/device/faux.h>
+
 #include "sched_tests.h"
 
 /*
@@ -10,6 +12,8 @@
  * Test cases are implemented in a separate file.
  */
 
+static atomic_t drm_mock_sched_instance = ATOMIC_INIT(0);
+
 /**
  * drm_mock_sched_entity_new - Create a new mock scheduler entity
  *
@@ -296,11 +300,20 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 		.name		= "drm-mock-scheduler",
 	};
 	struct drm_mock_scheduler *sched;
+	char name[64];
 	int ret;
 
 	sched = kunit_kzalloc(test, sizeof(*sched), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, sched);
 
+	snprintf(name, sizeof(name), "drm-mock-scheduler-%d",
+		 atomic_inc_return(&drm_mock_sched_instance));
+
+	sched->faux_dev = faux_device_create(name, NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, sched->faux_dev);
+
+	args.dev = &sched->faux_dev->dev;
+
 	ret = drm_sched_init(&sched->base, &args);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -323,6 +336,7 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 {
 	drm_sched_fini(&sched->base);
+	faux_device_destroy(sched->faux_dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 553d45abd057..bbf4da585866 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -7,6 +7,7 @@
 #include <kunit/test.h>
 #include <linux/atomic.h>
 #include <linux/completion.h>
+#include <linux/device/faux.h>
 #include <linux/dma-fence.h>
 #include <linux/hrtimer.h>
 #include <linux/ktime.h>
@@ -44,6 +45,7 @@ struct drm_mock_scheduler {
 	struct drm_gpu_scheduler base;
 
 	struct kunit		*test;
+	struct faux_device	*faux_dev;
 
 	spinlock_t		lock;
 	struct list_head	job_list;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus


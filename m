Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA425485923
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042577; cv=none; b=lVoY4JBV0xvkEdityj5rTyqGQUFy/SCncLQpsmZb30FuWARRXz/woDRjCmg5v6a6y1zh5xrba4X/Cr6KRtS9KEq/oLt/HD5uELloK9kFHCEtTGQ4ge5NratPm+bgd/G7Pf+n5QBpZVXpLlS14Ut8MWAuWCyPD0u7JgS5uwHEdEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042577; c=relaxed/simple;
	bh=R5PinbZI+vURMHqg2kqWSMtvNT7jiMvqIannT8ShC/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bvUaqls4PfstEIBo2ikc4P2/0AQDCJPbYbJJ0oTOF3WO1GfVsEwg6WA/eqz7cVLyJpZQLOa1lhkO15TSKgeFDoJU2NJ+npjRrRNo+tuWqKF5h1rFBeFs0i+10XlgKzC68f96ZFTmzzXXLz+/mLbdklEaniVxsO91IAqSsa9yvsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR3bdl02; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR3bdl02"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6f9e2f681so79570685ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042571; x=1789647371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2qTN47DytVlrGBOGC1ZcAmYzr5IdVvI8pSq4pv9E3g=;
        b=iR3bdl02P7p55V3pLSUFrMxRV/+rAnjjkWVdhLbu8swDTJGhus5YhOJLIGDmiI/p5l
         ZsyCZogcAW4BVNjQJG4Ydlbt2XCMAMSmEV5oeyTqD7xp0YpbfrHr0GNa/XH3zZA7iFHR
         cMW9L03/y/3EBcAJQSPddcffQ3rETGbGqojbqTII9sh1gxbJSBJN14PMEQS22vCOVrCV
         zD8CGOghKev7E+6wZYAacbf3hUVEPIXpWH1rg2GYXOvuqBDdtmqmrGPFYTQd+6Rbs7km
         OHe5ociyUokUJSpStAgCmpK9+hpKQ9NHAA0sUrEp93EXvfv1HfD7CzF+jjpJXQXYqOj+
         wNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042571; x=1789647371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2qTN47DytVlrGBOGC1ZcAmYzr5IdVvI8pSq4pv9E3g=;
        b=IG5Eh7PkjZUaiXZrl0dWFXi/zxoC/K7P68860ghSfSKdGtW4EZ3HNV/UZV2xjouirA
         HooN4c/erWn3OM6fczu75HAGBPkD0KU3SZiM5Ptq/3ylRT8jNUAfmidm8ijoW+bcj1+X
         RT9e9VA6EQf0odaMaaGFjK0JXsXHZ4gjAe3QZGguIaX6hTz8sFR/h8XJ+tecVIkS14Q5
         zZKokTWcqdV085X+gnnlIIGMgaP0rsaVSzFaH0090GanHlpHiOomS248xvR5bs4pi5vb
         nlSv6qM9gwWCdo9iwS1X7+bLDxXKYe74f97/otrnZzn/mVoA35DR84spCCER05daDpdy
         Tjwg==
X-Forwarded-Encrypted: i=1; AKwUvBzHw2j9obwuIFYg0dmTs+Fp90GA178hnn4occ7kSCKMPLRQMdFSROHdkD/2LW+/yVl9IOhy1rH/Ire0wjM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksm/5GYFKH32sE494fwScii5zoGgazE35trK2VUZGcOi34TlDI
	ue1IwHPM+zwXSsx3P3+LetBpXyc5pfVBEWGNTbIaR4rMJ4GY8b/q9Gc=
X-Gm-Gg: AYBFou1CoB8qjFhWtZrjI0lHKBVXqrLrgbwFOWp6GE7yT+Eq8UyGI6be0DqDzYA+Exu
	GanQ90wyeUIP3Js/zi1LRQXi/2i5lnoeIOS0jzbbiMVnIfhTieX1u4B8y5QD6JyRCSsW+Rf7qPB
	CbULyJDCpA1vMdBoskscrboH0AqnpjDVNp6DQrVYrOtyQOTDSRlCAUlIgdtE1TLuY+zVFureGOE
	31XRv9pQxcFcHj81Dj5s77ZeTe2K6x4Bwxwi4H1/bnxvUvaSdQyDtelyiZwSKJXv2tfD1ZF3UxA
	mRIhrKc8eVD9SZzG7bgZSzHl1uHxQbgQvTYPmOKie9NehEjM4TucsF2P0ay7ah0HIany4Fd+V4x
	ftq/+gn1472RRjPGI1w0CHjQDmQYdvNvhAUYHq9iMcSF/F1N4E14LMJjc82KnDiEfj8i0KmUKS1
	VfDrEgm0uI9k+eHIlVpb7Ea7tSl5/YpkgM4oym+4BGgCsmmVQzDIk4Ect5lnngZBkVyxykUDDlD
	O82EtjWm6J8NbTNAnI4EHubSw==
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id d9443c01a7336-2db12106896mr612699565ad.0.1789042570833;
        Thu, 10 Sep 2026 05:16:10 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm88647225ad.3.2026.09.10.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:16:08 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] drm/sched: Free the run queues at the end of drm_sched_fini()
Date: Thu, 10 Sep 2026 21:16:01 +0900
Message-ID: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fini() frees the run queues at the top of teardown but the array
holding them at the bottom. The early half is on the wrong side of
cancel_delayed_work_sync(&sched->work_tdr), which waits for a timeout
handler that can still walk sched->sched_rq[i] through
drm_sched_increase_karma().

No correct driver can be there, since every fence returned from run_job()
must be signaled before drm_sched_fini() is called. Free the entries next
to the array anyway, so run-queue teardown happens in one place.

Link: https://lore.kernel.org/dri-devel/20260910054605.634135-1-donggeunyoo.kernel@gmail.com/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Targets drm-misc-next (0878e6053d01).

A cleanup - no Fixes:, no Cc: stable.

The KUnit case and how to run it:
https://github.com/donggeunyoo/drm-sched-fini-uaf-repro

x86_64 under QEMU, KUNIT + KASAN + lockdep, whole drm_sched suite, three
runs per arm:

  before  38-41 KASAN slab-use-after-free reports, all from
          drm_sched_increase_karma() on the timeout worker
  after   0

 drivers/gpu/drm/scheduler/sched_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6cb6f9546493..fec04c944c5e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1210,9 +1210,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
-		kfree(sched->sched_rq[i]);
-
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
 	wake_up_all(&sched->job_scheduled);
 
@@ -1226,6 +1223,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
+
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
+		kfree(sched->sched_rq[i]);
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
 
-- 
2.53.0


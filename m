Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B99C4A3D20
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360135; cv=none; b=JV+3/PdGOna7hNjG+4Cwwg3TJY8KwWrantPu9HFOh1noOEZdpxURk4KdF7p35mSOR1nggSiazkVqg+xPwLgzCNgwdXO1txyF19g+ibFq2X37D+vCQnwDN/oT8XiP35UxAB3j3t5tHqqwG7KwgTTHWMirXUF17Tj+GVnGVLfF4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360135; c=relaxed/simple;
	bh=c5ay83Qwb7x0dU/2b2EUwRPqJpURNXKi4T3C8WOXdOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rc1REOYCMMb41lRgIWfypHVRMxvx/3rzJsSMJIaMTt9tgNxGyP/OCdJQcZqeHgO0xyyXoikVJ1cnfZPB0v2/rs+kzB05cklPHwDoEUf25VdLrNeErRiKhwCxP+TcM6df9cQKK+NPyEXcpv+R8nGUNCafflNsATwSa+sW219yQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pe1Z6N0X; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pe1Z6N0X"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso984193b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360132; x=1788964932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKM/PPFy7W4wICYY4yvWsIe6e1r+fY7pf2VDor/H3i8=;
        b=Pe1Z6N0X5fePpl1ql4YlNirPHjoezhZy+d1PfmLczD95AQhezAimTIOM+3Cr9eP5WC
         31v/W6NOnKV+Vls147ZAiSugatnQgjbk/GefEqRxJ1kCxjxbMZkwkLO1YXEGyY8PvtgC
         2mx6RkRFHIVI8lmkM0e+3pqtx5CbHae4/wncMiEKIAtyhQsvW3z6ZarKOHIeIKlMDWCn
         9c8oxilt0JXds8HHsFoKQbQAzy8Jqt5SjNeZY45FTBD39FzNFMSZAHLUMrCczOGsSuCK
         BOe26bDbB6xUI/7He0JnHSLk/jTk70VrHbkxqWS+9QHVtFaULJUAvkmrylnzP1OMZUdk
         hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360132; x=1788964932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKM/PPFy7W4wICYY4yvWsIe6e1r+fY7pf2VDor/H3i8=;
        b=NGG4xXEsfB7xB5najBfi8Vt/btaChJeFq8D0S1iAbRwVM0ZixtjGZaO2XmxGa7L3Kd
         IszcJgWQCcLq8gLEnrwhHFM+ELJ8vVup3lYQTfb0PQfJgefyLW/Kg8gBdeVEYedr66OP
         9oGXmU/ZaQbpSxxTnc2yAAfCC4+ZQN/8eriXViNO+fPeF8ZOgJ72nZZFuUu/4YvOJTTC
         DP6K/uqY+DD85qow11gnWVoMwfOim7AKcw4nhuzvrn4uI+kwWLP+WKh9iOrwj9UGrvNM
         /R0fbQYyzd5Rz/ZAguWX1Ww/rf/5G4YlaDT5P2Iy5MnhjD4FfaJ0t9AYqFGz3ioTnYib
         sD+w==
X-Forwarded-Encrypted: i=1; AKwUvBztJib5dJq5j5Zm8hS9RUGejb73Qse0XOqK9EroNw//JFF0F7hMMGEvIYKGrVAbgNSiXuvYAnPmIH1bC/M=@vger.kernel.org
X-Gm-Message-State: AFuF++mIAoCLapLAAcCiSunKqmOhmsOGCbirZdT8JPbtw3zN5Y5qIfcD
	b1qmVGtIbenAOZIdBKr3IiBNQrV05WMzh//nkk4v7C7xUt1/vRe2Ik0=
X-Gm-Gg: AYBFou0JFDoWbgewuHWhJkuTuKkqx52AM/obFantIZ2bcXiGcmpdn0xclC/A6xdzI6Z
	9he7suzuY46mbjyI4dFh8Emep1Z3ld0H+zEbog/OzDGAqW1CL4hymiWUSe6z1WwWmCTwJszs0EJ
	glWHSkEbi0tCjKGZvEjeKEgDRW9yJZkayq2jZ+PFt8dw18deAv1a6sO3ay0iOjGjusuHFjidcS/
	vKnr3vGtcNBk1baaVnqiEtIW6hDhPqeuIw1T9ApZRYS6iJc5gMsQpsvLPmkaO5Dzf4roAPNK9mv
	xm1U283umdBG0Kf0x0ps7FRcTCwE9RzfIuM1syP1vMQrMSKJ16k8RmIWULJ+o6gTh38TS+CQF7Q
	KZ2wYgEMoioAFuMqbvpGdAnEuIKk3SDhojHQnwadgCjKgOA0Pw/sZAo42bMEDEjFdadt3BrthnA
	QFNq/0rysLvhhVPZEAKRPQP0R9LEmj5ORhKqJhQeRBCx0/KkbXRv+TtFXqTqO8C3olb/6R6mWQ3
	fCK2tA4BkCv24pWgT1YpLQMOns=
X-Received: by 2002:a05:6a00:368c:b0:851:c1d2:c48d with SMTP id d2e1a72fcca58-85ed25e0713mr8399867b3a.8.1788360131651;
        Wed, 02 Sep 2026 07:42:11 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f8d8asm1655776b3a.12.2026.09.02.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:42:11 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: tursulin@ursulin.net,
	phasta@kernel.org,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v3 0/2] drm/sched: fix use-after-free of the fence timeline name
Date: Wed,  2 Sep 2026 23:42:02 +0900
Message-ID: <20260902144204.1843670-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_get_timeline_name() dereferences fence->sched->name. A
driver that allocates a drm_gpu_scheduler per context, queue or VM frees
that scheduler on context teardown, but the finished fence can outlive it:
unprivileged userspace holds the exported fence via a sync_file or
drm_syncobj and later queries its timeline name (e.g. SYNC_IOC_FILE_INFO),
reading the freed scheduler. Same class as CVE-2025-38703 (drm/xe) and
CVE-2025-71302 (drm/panthor); amdxdna, nouveau and msm (VM_BIND) are still
affected in mainline.

This series fixes it in the core rather than per driver.

v1 and v2 took the approach of caching the name at fence init. Review showed
that is the wrong fix:

 - Tvrtko pointed out the documented contract does not require the name
   passed to drm_sched_init() to outlive the scheduler, so caching the bare
   pointer only narrows the window; and

 - the sashiko review bot pointed out that caching does not help drivers
   whose timeline name is dynamically allocated and freed with the queue
   (drm/panthor, drm/xe) - it just moves the UAF to the string's lifetime.

Philipp suggested dropping the finished fence's ->release callback instead.
That is what this series does. dma_fence detaches a fence's ops on signalling
when it has neither .release nor .wait (dma_fence_signal_timestamp_locked()),
and dma_fence_timeline_name() returns a static string once the ops are gone.
So with the callback removed, get_timeline_name() is simply never reached on
a signalled finished fence - no ->sched dereference at all, for static and
dynamically-allocated names alike. The finished fence's only job in that
callback was to drop the scheduled fence's reference, which patch 1 moves
elsewhere.

Link to v2 (name caching):
https://lore.kernel.org/dri-devel/20260902105808.1541063-1-malhyuk97@gmail.com/

Note: detaching the finished fence's ops on signalling also makes
to_drm_sched_fence() return NULL for a signalled finished fence. Callers
already handle NULL (the normal foreign-fence result), a signalled fence is
an already-satisfied dependency so the scheduler's dependency collapsing is
unaffected, and it avoids the container_of() on a possibly-freed foreign
scheduler that amdgpu_sync_same_dev() and pvr_queue_fence_is_native() would
otherwise do. Flagging it explicitly since it touches an exported helper.

I did not add Fixes:/Cc: stable tags: the ->sched->name deref dates back to
1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location") but only
became reachable once drivers began allocating per-context schedulers, so
the right attribution is unclear to me. This is stable material as the
driver instances are live - happy to add whatever tags you prefer.

Tested with KUnit under KASAN (kunit.py --arch=x86_64), matched pair:

  - unfixed (finished fence keeps .release):
      [FAILED] drm_sched_dma_fence_uaf
      BUG: KASAN: slab-use-after-free in
          drm_sched_fence_get_timeline_name+0x9c/0xb0
      Read of size 8 ...
  - fixed (this series):
      [PASSED] drm_sched_dma_fence_uaf
      Testing complete. Ran 47 tests: passed: 47

(The whole drm_sched suite passes with the series, no regressions.)

v3:
 - Switch from caching the timeline name (v1/v2) to dropping the finished
   fence's ->release so the ops are detached on signalling (per Philipp);
   also fixes the dynamically-allocated-name drivers caching could not.
 - Rework the scheduled/finished fence lifetime: the scheduled fence now
   holds a reference on the finished fence, which is released last and freed
   from dma_fence_free(); @finished moved to offset 0. drm_sched_job_cleanup()
   drops the scheduled fence's initial reference.
 - Move the regression test to a new tests_integration.c and query via
   dma_fence_timeline_name() (per Tvrtko's review of v2).

Jonghyuk Kim(MalHyuk) (2):
  drm/sched: fix use-after-free of the fence timeline name
  drm/sched/tests: add a UAF regression test for the timeline name

 drivers/gpu/drm/scheduler/sched_fence.c       | 46 +++++-----
 drivers/gpu/drm/scheduler/sched_main.c        |  9 ++
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 92 +++++++++++++++++++
 include/drm/gpu_scheduler.h                   | 22 +++--
 5 files changed, 139 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_integration.c

--
2.43.0


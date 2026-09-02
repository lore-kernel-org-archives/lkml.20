Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E546EF96
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346698; cv=none; b=t39QuM/l6hoXsBw+F9ujGU8cCkuWtEYp3xCo6eYaDZXKBSRIm+EnNpFhnKw+50ZuiQYr3dGPBODKdgWxhCZbuLIa+fe4sqQ4ZUKVyLTgOQ6I6FK0iuidVX4CTn2qUZHSeYtmx1SdrAPiJggkKlv52M1PamBcu5skMSNqwLLM81o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346698; c=relaxed/simple;
	bh=6K4vtn/4+xieyVGi2YOnmpNHHBnMYaIj3a+4cjuWVcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uK18fdKHaGuPZ94HTMK85VHzXTp2Mgnor2x4gtUjjd5wxl8rY0fiVTCEKv5JGadvwiHbdCM28gElrhp13b907r5rJ48bXRN9aQnJmP/MOEjtk7EWhk448DFzvhGkh6bWLAXi7EmqM4Aw3mpokN9oZlf13g1iNR6gBWb5cIHXv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yok6JBLh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yok6JBLh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a5aad413so784858a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346696; x=1788951496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhJ3rNj3BMMmAadCEQfLTR+seEymXdU0q5qyqSuHK34=;
        b=Yok6JBLhgZafXhen4GpZMDtESJOPVsi7gLRh/WyLGA3MKNne6tKxhZJfVKKTru5RwG
         plZBtLbN/kusVzhQuhK4TV0EslMiyzQgxYFAd912HVfWLxp6wZLULsbbnc132t5DxNRI
         qSlA/PSOSr/Nhybg0rpLc+vdhPLBo/zWCOH2bhvO7MShXx7Ncf9jg2/TWYTuaztZ/xHI
         uBdhjKCwQgv18/jyxAvT+sAy6zFPrayhzWCkS4BXN0E2eceMSJwXIYUTzf7xT3iOrVn8
         C1tAHedDvafC2ZuK6Opveg4mVuWCB2hG+usVowJ5+VkM8hvuxXOx/DRwAUyMhfaf70zO
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346696; x=1788951496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhJ3rNj3BMMmAadCEQfLTR+seEymXdU0q5qyqSuHK34=;
        b=ES/+O0c0Fx0qhL6hcHYeuL3hI0nOPrHPy+n8zNMCL1hz8stwzEn1Nt0pTY9dHallNM
         raTdWtAD+J4prBGSAmfnV9UnWGFVPJ+NLUHTgEO4qT3vWnwFttBaCDJtyhrup+DN6+l7
         uHHIpGDP8icihr505p6V7JQ7PbnKPpfkaEegt1HFIVXWOHeUWJh3PlSsRfgaDSgEuDiq
         SZcVHEjq+/LqIeHyQ3SGm4stPPDoFm588HdMsPCapSs+2fvTIptiYPS/oG5nCiPtI+jD
         a+mfCYLNkm9w9S1YKGXkufJ1jS8ThtJ6F1GiR6AgJM/l8hwE8JJ1Uj4XS2RSiWNpvpmw
         DAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkPTf9DEpJ/od4qbcJGnBD7F5w34hS+RR7dPgD8fyFgGlDwwXI57xihJZIv7jZ3FZ9Kcd6GEe2jCz7euk=@vger.kernel.org
X-Gm-Message-State: AFuF++lLyb6PRWhNB22wmh798lSyRJUvDW78cBMd8cLpMhaVjn/PsdCa
	4RUd2/LmEzGCqkDfrTtDJH9AxF+Ifskh4NQxOIligiKOyf2jI3e35Ok=
X-Gm-Gg: AYBFou1qLruA+F/OvX69JxxWg6v1J58RkDenYc8839Q1UFv8oE6XftclW0b8tiWvRI5
	Y5T9ziH3Lw0VUsGP3ZX46ZSDEDegCQSsVU2/4NVVoTkmz6UVX4fuCoHwL2mvZ85sVz94nwCH+Pl
	lKo034/o6wpNlRO7c8yO6nhtzwxDPov8auq4Lx0kFttQPzomPkyDbJhCJRpXwGRSbmaaUxbGpsP
	fjqya10ZEqWNnWM5J7WZg0b9xQ1lP11RJPvwqxEQqtfz8b24lS9KjGk3nESRykj5S8ZhjyaW+X8
	Jd6FmB28CPRVaTowx09PE/QuCi30JCLSahWyuHoAE06UBy9RBq9LBj0K70jUOa6VtsQppnjAbTU
	JJ2HRm/nTlFFICStc4QEwY9WaHdtvWFkLmfGmOPggyKxwAiw5SlhP2kY1zeZAkaXKiW77Nv7anO
	V6x0f9dwP5W26oA06zL6I8/Kck/ZzPXcPTa+NwX0U9xiWDN/GXiPzbQzszosWKuj+F7GiwwW/XV
	l0pfXzjn4xSYVJhQt1RTWXaC+Y=
X-Received: by 2002:a17:90a:dfc5:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39aee17a08fmr6299131a91.24.1788346695576;
        Wed, 02 Sep 2026 03:58:15 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfcd65sm4963143a91.3.2026.09.02.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:58:15 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: tursulin@ursulin.net,
	phasta@kernel.org,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/sched: fix use-after-free of the fence timeline name
Date: Wed,  2 Sep 2026 19:58:06 +0900
Message-ID: <20260902105808.1541063-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_get_timeline_name() dereferences fence->sched, but a
per-context/per-queue/per-VM scheduler can be freed on an unprivileged
context/fd close while userspace still holds the exported ->finished fence
(sync_file / drm_syncobj). A later SYNC_IOC_FILE_INFO then reads the freed
scheduler:

  BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name

This is the same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
(drm/panthor), which were fixed per-driver. amdxdna, nouveau and msm
(VM_BIND) are still affected in mainline, so patch 1 fixes it in the core for
any per-context-scheduler driver at once.

Patch 1 caches the scheduler name pointer in the fence at init time and
returns it from get_timeline_name() without touching fence->sched, plus
documents in struct drm_sched_init_args that the name must outlive any
exported fence. Patch 2 is a KUnit reproducer exercising the mock scheduler
under KASAN (no hardware needed).

v1 -> v2:
 - Keep caching the name pointer and document the lifetime rule, rather than
   kstrdup()-ing per fence, to avoid an allocation on the submit path for a
   debug-only value (Tvrtko).
 - Reworked the test to query through the public dma_fence_timeline_name()
   API and moved it to a new tests_integration.c so tests_basic.c stays
   focused on core scheduler behaviour (Tvrtko).

Tested with the patch 2 KUnit test under KASAN (kunit.py --arch=x86_64):
  - with patch 1:    [PASSED] drm-sched-dma-fence-uaf
  - without patch 1: [FAILED] - BUG: KASAN: slab-use-after-free in
    drm_sched_fence_get_timeline_name+0x9c/0xb0 (read of the freed scheduler)

As discussed, the cleaner long-term fix is to drop drm_sched_fence's
ops->release so dma_fence detaches ->ops on signal and decouples the name
itself (Philipp); that is a larger sched_fence rework and is left as a
follow-up, with this cached-name fix as the immediate, backportable one.

Jonghyuk Kim(MalHyuk) (2):
  drm/sched: cache the timeline name to fix a use-after-free
  drm/sched/tests: add a UAF regression test for the timeline name

 drivers/gpu/drm/scheduler/sched_fence.c       | 16 +++-
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 83 +++++++++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++-
 4 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_integration.c

--
2.43.0


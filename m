Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312814C6517
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768849; cv=none; b=qlhrSWVu63EGS5g2Srmb1GdqtW2siXh85P+nrAV+lJuIlJ6jsbgHufCa9XJOm+QfA238GoSLXfqN57BSXxxSvGRLvfPWDM6TUGOohl5qG3tyhegFp5mXDSjPE78hW5QNzxbpZWQtx8LF3bhcDJwpCYeDcrt5J/aCDlejJf2i9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768849; c=relaxed/simple;
	bh=jOj0nGq+c6ouATA66MO2woS1Ki0X2pxS3NB4B+62yd4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=psQOabaDCCIjRlWLEs37Zh3RKOfyCE5UFy7WYtQzzBtrkCFpbVgMVijSHCU8uxKfI4Nm0m8BHpbH3TLgsguer7HxdVlxfCmkwy/S5rGT2WbJfcD+0BCIUQ4jT2t7/i16gT2r/1NeaJGOKL7xP2rZ8z1UdEVI/QrzP12/4JKbFc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZVs8fCuO; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZVs8fCuO"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f9d150c3so3086285f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790768846; x=1791373646; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=owMC9khuhP+e3QmjJLE7NHWx2GpchftIweYKj9nwbcI=;
        b=ZVs8fCuONj7v27+aidGjVkC5Mhk0V38ZuV4agClGuXzyriv89pXUsMFMd/d3JxN0qU
         Xq0OWtrOxwrB1t/SHP2rmthvNtT0NsmWFItihzpBYlQ68kXDIMjwJnC4JzoxBLuaWnG7
         cL6wvSmFCvUPtNO/EN1D7VYTkueG9auOCyZs0AYyezCY14lgnx+VDSZHlYp7Bg5A3rpD
         d3gU5XNIqRzDa0UrWn8jAkR2+Z0OO2qU/pkJj7RyszSwpX7Wv2hyi6O3WY4XtZqANt2V
         9Uvehyb6A+rA1NAgb0+cnG86GerypAILBLyuSUguynTVzfbNMqrQF4IlQ1ZP6owSHUhJ
         ay8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768846; x=1791373646;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owMC9khuhP+e3QmjJLE7NHWx2GpchftIweYKj9nwbcI=;
        b=uDLxSSBRsEyrtxWJ0mERJJqeg1ZA91xgPCkkKhMWngmcf35R/0RUuxi6XFLbkCp4TO
         /UfwFDIj/WyyGhOPgN5e4Qnnro5r4AhUtkUVRx1E5IqOlzEhrYOxFRqRQA4VQD6mKI3h
         j3jnyrvVOjASTUmjEkZXVElNmBQMUxLTmA6TReB6ohTmpSx0B8GY/flL6pV23pIttjII
         UhjMq/NuiLniDMSNuuswMyOF0u8xhI3m+H75u6Ytl2Wb9gXA0Hfq1RDolaulgbom7HUx
         FfCJvTcyQ10jpwhoChLmx5OtVWAk1WEY36YAtZlQkTIrjX7aCIJ6SIS+eJHb92BrWvXx
         icWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpTd5G5RApg7mq8lrt+iSuj7AETXU0CKJCVrU6UfLia6dJdGDYievenHgpaJk8vntfLEufko/m8Zxjfnw=@vger.kernel.org
X-Gm-Message-State: AFuF++lla6cwC3G2ypWdfxJba0unitw5M/BkMZmvjXIK3lj9GcK8FZ7H
	Hjez5vsPeyTNMleFr3ypPWnyTLNiTyJxP/B/UDOoKD8qpf/h8GLsg6xCEtfVnvDMdleFWOSQ81F
	6/D+KM6Lqm4hAjg==
X-Received: from wmpo20.prod.google.com ([2002:a05:600c:3394:b0:4a0:23b:31a7])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d3:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a01aff9b3dmr16789185e9.12.1790768845892;
 Wed, 30 Sep 2026 04:47:25 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:47:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930114725.331370-1-jpiecuch@google.com>
Subject: [PATCHSET v2 sched_ext/for-7.3-fixes] sched_ext: Fix missing
 ops.dequeue() on remote local DSQ moves
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

When a task in the BPF scheduler's custody is moved to another CPU's
local DSQ, ops.dequeue() is deferred until the task is picked and then
reported with SCX_DEQ_CORE_SCHED_EXEC, instead of being called without
flags when the task is inserted into the destination DSQ. Patch 1 fixes
this by reverting the enqueue side of b75aaea24c9f ("sched_ext: Properly
mark SCX-internal migrations via sticky_cpu"). Patch 2 adds a selftest.

For 7.1.y, patch 1 also needs 18d62044cda7 ("sched_ext: Preserve rq
tracking across local DSQ dispatch"), as noted in its stable tags.

This is based on sched_ext/for-7.3-fixes (d35a535d3e3e). Merging it into
sched_ext/for-next gives a trivial conflict in the selftests Makefile,
where enq_blocked was added next to dequeue_remote; keep both.

Testing was done on x86_64 in virtme-ng with 4 vCPUs in an SMT topology
(2 cores x 2 threads) and CONFIG_SCHED_CORE=y. Without patch 1,
dequeue_remote fails in every run (30/30), e.g.:

  sched_ext: dequeue_remote: dequeue_remote.bpf.c:141: 15 (rcu_preempt): late ops.dequeue() with SCX_DEQ_CORE_SCHED_EXEC (enq_cpu=3 cpu=2 seq=1)
     ...
     ops_dequeue+0x114/0x170
     set_next_task_scx+0x104/0x1e0
     __pick_next_task+0xc7/0x180
     __schedule+0x154/0x1870

and the full sched_ext selftest suite reports 31 passed, 1 skipped
(nohz_tick), 1 failed (dequeue_remote).

With patch 1, dequeue_remote passes in every run (30/30), with ~140k
custody enqueues per run, ~90k of them followed by the task running on
another CPU. The full suite reports 32 passed, 1 skipped (nohz_tick),
0 failed. dequeue_remote also passes 10/10 with the runner and its
workers sharing a core cookie, where legitimate core-sched picks out of
custody do happen.

v2:
 - Reordered to put the fix first and folded the Makefile entry into the
   test patch (Tejun, Andrea).
 - Fix: clear p->scx.sticky_cpu right after reading it, making the fix a
   revert of the enqueue side of b75aaea24c9f (Andrea). Reworded the
   comment and shortened the description (Tejun). Noted 18d62044cda7 as
   a 7.1.y prerequisite (Tejun, Andrea). Added Andrea's Reviewed-by.
 - Test: check p->core_cookie on SCX_DEQ_CORE_SCHED_EXEC instead of
   skipping when core scheduling is in use (Tejun).
 - Test: count CPUs with sched_getaffinity() (Tejun), pop past stale queue
   entries in ops.dispatch(), reset and print all counters per scenario
   (Tejun), destroy the struct_ops link and reap workers on error paths
   (Sashiko).
 - Test: deduplicated the descriptions and lowercased single-line
   comments (Tejun).

v1: https://lore.kernel.org/r/20260929161730.185271-1-jpiecuch@google.com

Thanks,
Kuba

Assisted-by: Claude:claude-opus-5.5

Kuba Piecuch (2):
  sched_ext: Call ops.dequeue() when a task arrives on a remote local
    DSQ
  selftests/sched_ext: Add a test for ops.dequeue() on remote local DSQ
    moves

 kernel/sched/ext/ext.c                        |  10 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../selftests/sched_ext/dequeue_remote.bpf.c  | 265 ++++++++++++++++++
 .../selftests/sched_ext/dequeue_remote.c      | 202 +++++++++++++
 4 files changed, 475 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.c


base-commit: d35a535d3e3e71f92a051d94e415f43612c4edfc
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


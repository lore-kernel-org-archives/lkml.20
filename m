Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E41511E67
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778267; cv=none; b=o/VEQ4XhvpRIEv/8h9ar7Ax6fgLvo8ZiCg51/AjVcQaYt3yIkicQoGa+7nJvZyCvYTEzm55BubaTXZ9cQjLGwrJWMhOnm6IQWGww7iGRIdH/EqlVfzmtjbbq/SBFWGtLwPGoPUQXMQmfh7eMpVB9H7nwTBYJhs10OHlPF7/IvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778267; c=relaxed/simple;
	bh=w+DtvmeialJB9x9SRkQEK0OYx1mc4mEYZ03OWytTkIE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IJoFuCuMlnTM2oDFffbpNSu7ts1AAPXvNvs5Zw8oogv/5vl3uK3Js9K5X2wsMuX35mz42MgIxLEi1JLg0UnOUW0n9kElYYA5NMQRFP/sCxFegDToFzJkMK2/RcGt/DN03KDY7Un/oyjGKFXxVNhO+pPr4AFdqVWzjnyBt170cCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QJ5ikBFH; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QJ5ikBFH"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a5d7e3ac13so5683481a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790778254; x=1791383054; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfUv3bn823RJxdA8KgRrASglO9ITKlt+SqGbcVInGAg=;
        b=QJ5ikBFHzNAbwMfnz4anueqYEaeptdy/8f18pBkCoFVbT7zxyZN/Ml6GaymXpCifrF
         MxYnHIPI8bkyb7kmO7IAL/91t7/Da9pSOuQ6DGZldTUC366v1cLC79oSSpbc5fWLyiA7
         UNRjG48v5znhMzdTxCDMlK7XkK/gvYunpfZEVsrg/DStjp1KPsweaGzuRaStik1de+pA
         +rQDSM37Tu+6NkG97XvakClXmoYXLCSIrXIJguSNNiQGPSiyzS4Ig+rCLS8hrNrfzQja
         m0WeBY7J6uTF12KK1/VNpvxUi7HyoYvNB73AoQjb8iqSlnxyVzP+rjnN2Eqb3GgLO+0M
         OaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778254; x=1791383054;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfUv3bn823RJxdA8KgRrASglO9ITKlt+SqGbcVInGAg=;
        b=qMNdIBKeXJz5Ygn+WYF7zXDyfn0m+yHAIAFd4vpvwovCi/OSvIB6KKW6cm3vpw7G8T
         zcs6St8nAn+EllleoGEQjCl06GBY2IxxA6a2KC1ZyNRjREo4NHhASORiPqRT4BnVim6b
         0/WyBX8By2NHhTFdJ/8UmWLpQKdvzm8clTfGl4fteGcd3BFsCAW+7wYUgFqDxNiQLieZ
         WYrmCM0nu2fJnNaUR3ezUW844TglSW1eUv1jSV0gYdkpN3OQUKAzTWUyAfs5PCyL7CRP
         BFQaBvpAfu7r6VGsiVS+bW/L/iceKnokooBe1gVUgHcvWlL3St436J8idnS3BxU2ejBt
         hTvA==
X-Forwarded-Encrypted: i=1; AKwUvBxdRctLR2Kx24UPU08Jz2ni9wfNOm/7XXwhjoU0Iwa+Y7jgSVEJTELFPBHLzYs958RnYwIjjsazJRC79BM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCkt2mr9VrLhSbBKm4C43O8JtObmJ+cAaaIJYpDFMsqTXo0K7y
	IJwDXZEEK3c6tw4o8cGHrOZXd7QlcnSei/nqFATnmdqFRpTXmq0fYboZoey65HUYZwOE9LXduNj
	NqEhNyntfmftmFg==
X-Received: from edyb9.prod.google.com ([2002:aa7:df89:0:b0:6aa:fc50:1dde])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2082:20b0:6ae:1a0a:ae9b with SMTP id 4fb4d7f45d1cf-6ae1a0ab0e4mr904441a12.25.1790778253694;
 Wed, 30 Sep 2026 07:24:13 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:23:57 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930142412.552765-1-jpiecuch@google.com>
Subject: [PATCHSET v3 sched_ext/for-7.3-fixes] sched_ext: Fix missing
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

v3:
 - Test: kick the dispatching CPU if ops.dispatch() runs out of pops while
   the queue isn't empty, reset enqueue_seq in ops.init_task() and clear
   the exit record before each scenario (Andrea). Added Andrea's
   Reviewed-by.

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

v2: https://lore.kernel.org/r/20260930114725.331370-1-jpiecuch@google.com
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
 .../selftests/sched_ext/dequeue_remote.bpf.c  | 270 ++++++++++++++++++
 .../selftests/sched_ext/dequeue_remote.c      | 204 +++++++++++++
 4 files changed, 482 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.c


base-commit: d35a535d3e3e71f92a051d94e415f43612c4edfc
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


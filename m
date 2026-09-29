Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3384E50B0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698654; cv=none; b=NcSZIusoacaByk46Eff1KSBX0aZfV9MUQEjVsUu3Bp/0QlUsvTKgJkELqC6TsJd3dB9lnv6rJit7T9LFgaeVWSo6QrAwysNUQJ1rYHPgJV2px48v9K5fHpoAK4IU/W33m33MsyZl1dQkPNuxvQHwqh2nsYefDgI5TtKTKlN4ERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698654; c=relaxed/simple;
	bh=YdjoKtP1em+LNFUenaaFDnwTq/qBHkbg2KuVHSCYjyE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZY37mpVAj/zP4SCsRvWvEOgNtC8Op70z8A2iXeC6DOa6xmtbplCU7qd2zPItaP22J0UxLp3xuCKflvT/2XehZYcPkX31CWrgqQWeDRjC4Hv/D8N2v5Dos6tSjp4UnwwLnRH2R344xVm+qAZX8o71KMRXsnwbHkZQyeJe729/xFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4yV2xBb; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4yV2xBb"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso29090025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790698651; x=1791303451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0azr8zZg0nRvm5mZWbQlZBuE34GAu+5gLcWr9Qc6JlQ=;
        b=d4yV2xBbLWqDsQbWK75JAgwfdbpnAw6H/9/yiuo1ANPM1oTZLmJwgfETEMoOwSz6Iz
         e25NnJ1Bc8Rzr9sSGSPR3BYYnMgKMrD+qdvHHOPwtRqm7bCUujNtmhWGNDS/AQP60kLB
         FehZKgL9gUZxbJSC2qAXLMzL6OfgicUo9/ALI7Sk49dZteJvS/W8scURCsWCvoKn+xzF
         8R5ByfO39ZbhintLeZeNwaz1kR5ARGfKJdk8IGPEvB44Q5ebE+WTwfh4OEbCy7px9C2e
         R9adv/2Xn5V4StrS3fy57WbXjd2VIWLktSzuKWe9NaC3rna230Wy2ab8sZWmYrSs//TY
         H9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698651; x=1791303451;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0azr8zZg0nRvm5mZWbQlZBuE34GAu+5gLcWr9Qc6JlQ=;
        b=BhMApB9Q8RfP2ANm4G2mJtrdTrpB66NvBSVFd7d0fPXPuf0hOxrnKZYln2oUsTlhdy
         yc8NxaDlkCDDe2UJ+TC/nRJK2Yyf9D6L+zqsOzp9xsEO4tUoFm5R1McwP0+Anu3VL/fy
         kbu7wCIMNCK5fBf1EcUDOViLap4O1PIODmdYCEL1KxCHGHe/pgH9M824NH7pIvdn3Lrq
         wUPNkPBLG8XynVkAj+i7Mhn8L9bvifqmLKg6PMg5g4OnaNtsRk/eCc1UMncZ5QT9lIrQ
         H4pvXzGl/jgXWgCDgsFsl8CP86ulr4YjNOTL1UIcNoBpyWv9sTL0dV86HVz7KJLVIiYs
         5V5g==
X-Forwarded-Encrypted: i=1; AKwUvBwL7JSE04L4/fN/DtsdCTmoEhOTkuQQ6wDQ/4HjQggPhmp5oxlSJVVsNpSU2IoR5whlCe0KIfi95WaIzKE=@vger.kernel.org
X-Gm-Message-State: AFuF++kcAW0uukmttixeppumQkEhL6DAmE4JqPciHoiImY5Sr+LNDGCK
	3zE2vKk3aEeFygghS3oZziopf6pelUW1BDCNbF4mlO1ky3N/jIymt7wmk9TP66xbsb3Snx4DVrh
	LDlaV0H4Xf4i47Q==
X-Received: from wmbil3.prod.google.com ([2002:a05:600c:a583:b0:4a0:146f:133b])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:698d:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49ff06e504dmr237604865e9.21.1790698651301;
 Tue, 29 Sep 2026 09:17:31 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929161730.185271-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.3-fixes] sched_ext: Fix missing
 ops.dequeue() on remote local DSQ moves
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Since ebf1ccff79c4 ("sched_ext: Fix ops.dequeue() semantics"), every task
entering the BPF scheduler's custody gets exactly one ops.dequeue() when
it leaves it. A dispatch to a terminal DSQ ends custody with a flag-less
ops.dequeue() at insertion time.

That doesn't happen when the task is moved to the local DSQ of a CPU other
than the one whose rq it's on (SCX_DSQ_LOCAL_ON dispatch,
scx_bpf_dsq_move_to_local(), scx_bpf_dsq_move*()).
move_remote_task_to_local_dsq() sets p->scx.sticky_cpu to mark the
internal migration, but enqueue_task_scx() only clears it after the task
has been inserted into the destination local DSQ. task_leave_custody()
thus skips the custody exit on insertion, and the task sits on the local
DSQ with SCX_TASK_IN_CUSTODY still set. The BPF scheduler is only told
later, either:

 - when the task is picked, via ops.dequeue(SCX_DEQ_CORE_SCHED_EXEC) from
   set_next_task_scx(), even though core scheduling isn't involved, or

 - on a property change while the task waits on the local DSQ, via
   ops.dequeue(SCX_DEQ_SCHED_CHANGE) for a task already out of custody.

The existing dequeue selftest doesn't notice because it treats the late
SCX_DEQ_CORE_SCHED_EXEC dequeue like a regular dispatch dequeue, and it
still arrives before ops.running().

Patch 1 adds a dequeue_remote selftest that makes remote moves the common
case and fails on a SCX_DEQ_CORE_SCHED_EXEC dequeue, on a task running
without a preceding ops.dequeue(), or on unbalanced ops.enqueue() /
ops.dequeue() calls. Since core scheduling can legitimately pick tasks
straight out of custody, the test is skipped if any task has a core
scheduling cookie when it starts. It isn't added to auto-test-targets
since it fails on the current tree. Patch 2 fixes the bug by clearing
p->scx.sticky_cpu before scx_do_enqueue_task(). Patch 3 enables the test.

This is based on sched_ext/for-7.3-fixes (94480606a677) and also applies
cleanly to sched_ext/for-next. Testing was done on x86_64 in virtme-ng
with 4 vCPUs in an SMT topology (2 cores x 2 threads) and
CONFIG_SCHED_CORE=y, with no core scheduling cookies in use.

Without patch 2, dequeue_remote fails in every run (30/30), within the
first few custody enqueues after the scheduler is loaded:

  sched_ext: dequeue_remote: dequeue_remote.bpf.c:143: 156 (runner): late ops.dequeue() with SCX_DEQ_CORE_SCHED_EXEC (enq_cpu=1 cpu=3 seq=1)
     ...
     ops_dequeue+0x114/0x170
     set_next_task_scx+0x104/0x1e0

and the full sched_ext selftest suite reports:

  PASSED:  31
  SKIPPED: 1  (nohz_tick)
  FAILED:  1  (dequeue_remote)

With patch 2, dequeue_remote passes in every run (30/30). A typical run
does ~140k custody enqueues across both variants, each matched by exactly
one ops.dequeue(), with ~90k of them followed by the task running on a
CPU other than the one it was enqueued on. The full suite reports:

  PASSED:  32
  SKIPPED: 1  (nohz_tick)
  FAILED:  0

With a core scheduling cookie in use, dequeue_remote is skipped as
expected.

Thanks,
Kuba

Assisted-by: Claude:claude-opus-5.5

Kuba Piecuch (3):
  selftests/sched_ext: Add a test for ops.dequeue() on remote local DSQ
    moves
  sched_ext: Call ops.dequeue() when a task arrives on a remote local
    DSQ
  selftests/sched_ext: Enable the dequeue_remote test

 kernel/sched/ext/ext.c                        |  16 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../selftests/sched_ext/dequeue_remote.bpf.c  | 272 ++++++++++++++++++
 .../selftests/sched_ext/dequeue_remote.c      | 243 ++++++++++++++++
 4 files changed, 527 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/dequeue_remote.c


base-commit: 94480606a677deb68d5622cf0ded88626514b3f2
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


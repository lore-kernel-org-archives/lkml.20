Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D2283FE5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839274; cv=none; b=R9wkBcGKqCVl+EQhR6mmC358KErbCEgSC6UzzWk6yeysD1SuDbUgHphjCXT1bkFDyEfltaxDSWgmqtlIFW/qJHD7dlSGWo4b05eLCyJjRtpagye5kDpTQ3tCId5C9OKJpW3WuG3ekzgQQFmRpZhO0qIqF1tWeuZte11eYHwN0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839274; c=relaxed/simple;
	bh=aeAaA07GABE4JoakZuKvhmq762Hq5uDOPAvt4Crg6zg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rxklZPxY2nOjqukzZ2G7s9vRla1xVkcdcz8niN1w7joamkXNrn2b25nALNklEO+48D9CUg0qgZcwTz1qV8UHuInQfnx3MOXuKpqWve3h4gu1Q+dbdRny869mDm+wVMYfoNKS3iLaB/Hpry3jXN1I/V7N6T1/9Pp3EXKZtRG0zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oOG6UTEp; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oOG6UTEp"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1bbf8dbe9so1683514a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791839271; x=1792444071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sR5e3yVayLLoMCHbSaaCawnerE3WPoM3BkiRdMrVVRI=;
        b=oOG6UTEpSh1qJLE9TniK3nUVMdCfGylzmNG57nf/o3B3qO+bYMzAVG+wOWzRIu7tmp
         hbCcuPGFUtTulGYxGRELGUDbY6AqxsiVSlII6XhARH8OJJKORNsQ/N6fM+XY4hW1jLKq
         mkJ3CK2ZCsOtEpsKpq9JJZugyaXxezp/3DACI/OQk3JJ6+hTknNMJ29LyA7v+dT7hjII
         6CltqvHdl2YT7W6KqMf0z7nZctxlvFRTdlzCv6vi9o4cSYYcxN91sSg8iKYQa4CqYBSP
         XNyKdHwsvxArCT28ucuKn2UWZ5rEmR428MPeASkJZEn+3QUHrGy++keabrrX/9HXa1M0
         QhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839271; x=1792444071;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sR5e3yVayLLoMCHbSaaCawnerE3WPoM3BkiRdMrVVRI=;
        b=Hp4sTPpZ8UTrSzE/K9DbxjNWYRv2cZ1qmnbXpEUkLGtyqw79jBSMVqE/Rgk0yZTk9+
         zenXbaoeERUhGyRkYVPUPxQ7zeCcjj123lfIB1NF/Vxe2mURHlpb5qiHzWhX3NUll2Bl
         /EtxnbFljmLkyIOcCWbff9k60kWPtnlJGb46j8DzT7FgJSIVwCJTu8sZgJ4T0YFxZnW+
         fPVewcGQ6T3UzWdfw7pRo9kms5eq7GkE6TtZ7TTcdKG0mn8UjHI1BerHlWOwVi67EzFU
         DIk0nfjM8T37XmOtlvOf2xy6oVUGBv2ZBs1H8wgxhyWWw8DgKqoRsP5YpyHy6YlzvD9B
         dZkg==
X-Forwarded-Encrypted: i=1; AKwUvBzpsNi1EM8MtOzpB+dTzSO1T3ZVeumjl8X0bU4lfkbyMo9nvdAj6bicsqLjHAkBAZLgjYRioPojLrTrahE=@vger.kernel.org
X-Gm-Message-State: AFq9FYINjyImIBoaWurwSYieFmeK44pnNP1y3ryeJflnJSOHpcGHnlOZ
	NWgC/kuB+IEjAgMR7X9dQX5iVfRInU9itEZ+iEWM1ArLPwyE5aT6pPujWD6hEQyQ6He2GLmDBdB
	HqWVL2nNpxO9Xyw==
X-Received: from edwf5.prod.google.com ([2002:a05:6402:1505:b0:6b1:b12b:7e7a])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4290:b0:6b1:e361:5550 with SMTP id 4fb4d7f45d1cf-6b1e36161e8mr754709a12.17.1791839270819;
 Mon, 12 Oct 2026 14:07:50 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:07:44 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012210749.2955291-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.3-fixes] sched_ext: Wait for
 SCX_OPSS_DISPATCHING on DSQ consume and move paths
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a dispatch finishes into a non-local DSQ, scx_dispatch_enqueue()
links the task into the DSQ, updates its custody and drops the DSQ lock.
For the global and bypass DSQs, it then calls ops.dequeue() without
holding the task's rq lock. Only after that does it store SCX_OPSS_NONE:

  CPU A (dispatcher)                    CPU B (task_rq(p))
  ------------------                    ------------------
  finish_dispatch()
    QUEUED -> DISPATCHING
    scx_dispatch_enqueue(GLOBAL)
      lock dsq; link p; leave custody
      unlock dsq
                                        do_pick_task_scx()
                                          scx_consume_dispatch_q()
                                            lock dsq; unlink p; unlock dsq
                                            scx_move_local_task_to_local_dsq()
                                              /* modifies p->scx */
      ops.dequeue(p)  /* no rq lock */
      ops_state = NONE

ebf1ccff79c4 ("sched_ext: Fix ops.dequeue() semantics") moved the final
store after the DSQ unlock, so the task can be found on a DSQ while still
in SCX_OPSS_DISPATCHING. cb86607ada73 ("sched_ext: Don't run
ops.dequeue() with a DSQ lock held") also moved ops.dequeue() for
global and bypass DSQs out from under the DSQ lock, and the
scx_move_local_task_to_local_dsq() calls after the unlock as well. Per
the comment in scx_dispatch_enqueue(), running ops.dequeue() without the
rq lock is fine because waiting for SCX_OPSS_DISPATCHING to clear
serializes it against other users of the task.

dequeue_task_scx() and set_next_task_scx() wait in ops_dequeue(), and
7de9a6fb44ea ("sched_ext: Wait for SCX_OPSS_DISPATCHING before
reenqueueing a task") added the wait to the reenqueue paths. The DSQ
consume and move paths still don't wait:

- scx_consume_dispatch_q() -> scx_move_local_task_to_local_dsq() when
  the consuming CPU is task_rq(p), as above. This applies to the global,
  bypass and user DSQs (scx_bpf_dsq_move_to_local()). For a user DSQ, the
  consumer takes the task out of custody and calls ops.dequeue() itself
  while the dispatcher hasn't finished.

- move_task_between_dsqs() (scx_bpf_dsq_move[_vtime]()), which moves the
  task to another local or non-local DSQ.

In both, the consumer modifies p->scx (dsq, dsq_list, flags and, if
scx_resolve_local_dsq() diverts the task to the rescue or reject DSQ,
the reenqueue reason) and may call ops.dequeue() while the dispatcher
can still be running ops.dequeue() on the same task without the rq lock.

The remote consume path, unlink_dsq_and_switch_rq_lock() followed by
move_remote_task_to_local_dsq(), is currently covered by the wait in
deactivate_task() -> ops_dequeue(). The series adds the wait to
unlink_dsq_and_switch_rq_lock() as well, so that callers which act on
the task before or without deactivating it are covered too.

Reproduction
------------

The race is easy to hit by adding

  WARN_ON_ONCE(atomic_long_read(&p->scx.ops_state) != SCX_OPSS_NONE);

to scx_move_local_task_to_local_dsq() and move_task_between_dsqs() and
modifying the dequeue_remote selftest so that ops.dispatch() inserts
tasks whose CPU differs from the dispatching CPU into SCX_DSQ_GLOBAL and
ops.dequeue() kicks the task's CPU and spins for a bit to widen the
window. The warning fires within seconds in a vng guest:

  WARNING: kernel/sched/ext/ext.c:2416 at scx_move_local_task_to_local_dsq+0xf5/0x110, CPU#4: swapper/4/0
  RIP: 0010:scx_move_local_task_to_local_dsq+0xf5/0x110
  RAX: 0000000000000003 ...                    <- SCX_OPSS_DISPATCHING
  Call Trace:
   <TASK>
   scx_consume_dispatch_q+0x13c/0x290
   do_pick_task_scx+0x10a/0x980
   __schedule+0x586/0x1020
   schedule_idle+0x22/0x40
   cpu_startup_entry+0x29/0x30
   start_secondary+0xf3/0x100
   common_startup_64+0x13e/0x158
   </TASK>

With this series applied, the same setup doesn't trigger the warning,
and the dequeue, dequeue_iter and dequeue_remote selftests pass with a
clean dmesg.

Merging into for-7.4
--------------------

Based on sched-ext/for-7.3-fixes. Merging into for-7.4 conflicts in two
places:

- cea8b60e4aee ("sched_ext: Move reject DSQ draining into core") moved
  the reject DSQ drain from sub.c into scx_reenq_reject() in ext.c, which
  needs the rename too.

- 13ae184e4b82 ("sched_ext: Handle proxy-exec races in remote DSQ
  transfers") restructured unlink_dsq_and_switch_rq_lock(). The wait goes
  right after p->scx.dsq is cleared, before returning true. This covers
  the proxy-exec path in consume_remote_task(), which parks the task on
  the reject DSQ without going through ops_dequeue().

Kuba Piecuch (2):
  sched_ext: Rename scx_reenq_wait_dispatching() to
    scx_wait_dispatching()
  sched_ext: Wait for SCX_OPSS_DISPATCHING before moving tasks off DSQs

 kernel/sched/ext/ext.c      | 29 ++++++++++++++++++++---------
 kernel/sched/ext/internal.h |  2 +-
 kernel/sched/ext/sub.c      |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)


base-commit: 069403dff337feb192bfc70fb28ddc8a171e20c1
-- 
2.56.0.385.gd3acb90ef8-goog


Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8174457B6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974382; cv=none; b=cbhruwaPPBTfHaQkq5uitGE/kv5sEXEsqz6mI+yvvst5tQLlctQODXVAKP0qR8yULqZx1rmp1PkOz+J2GzjDU5u9ZNliKJbDDYO+vs50wqK571m1kYws8KGuEpoO5v18ocs45sWq17ZZ2busiZITkEyBTvRxeGvgQXFUg0ea3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974382; c=relaxed/simple;
	bh=P4ANKqW6k3SijlzaDDsRSdx1FhV/zAyS4jS6SjL8g2o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MFPlYsji09z1tbxghdzHRfIUHDKvo5nHOBqvriaWRCXJAiSID3Quru0x3kByTfA5s7d6tsR76DMaffW4cKQn5eoYAfB1UeAAIjj4kIqZ6Ca87x6OThL7pOrAMhU0wNOiy6tA/3s/nlHJGYaJT8sh8lnTe5nfE5/QJPe/diEo5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h7NrCpDj; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h7NrCpDj"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a91d818528so291254a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790974370; x=1791579170; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5Y8l6zarOho1gqNQcevN8mToET+8rsGamK/Z8+ErYs=;
        b=h7NrCpDjWLgvFXjCbA0akLpTJjHlV6McCwwExbUSWhnvqJxXBB+pSwg0w6i+LWvVCh
         vmNPvDPEj3karLICalyUTgbpORdrYqLZ82bU7ReL8qaF+AIA71gMn+l8Xccd2JV4CI2c
         QfwrxbzUhOvZ3StxtltfwLOzM7f3mBNYpT5mzEgDXILXq5TdY3CCeLV5RzHpubdL0bvq
         iIsN5UglkOTolad/ag4IoJjJT4Jttm5AYNsHu59loA/tHnw3PQ7UvYFh/jBI9ll7BAIn
         TCaC5Inf5F553sW22SoHCTWg+B/6DX7MeJKdEAByj+Z5hIrlJ34kYuRTjzBi3CFJT9gu
         upNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974370; x=1791579170;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5Y8l6zarOho1gqNQcevN8mToET+8rsGamK/Z8+ErYs=;
        b=vz1x5vz8OOyINpplDFX/PnHKkx9e4xrSlaz/H3AxTEr7Dn6Q+3q4xQkLrrFuyFuGlm
         8JD2OpY5GV7Tueya97FpKh+NCYrPar36AfS4MNc/4fbhpjiYAvmo4c1MfLz3rIeFi3zM
         Yal+OhnG85gjttHY+sHxLn5XX7GQ+tFVxmHBUfBi4Hp6XMF3KLPN1Z9GMm6sjWyL6+GC
         XjMMuDcGi0iXDypJZZvAwi/JutieKweMCDzqaRhm+ZyOyhUhuoKHe5CzMDDEj3kjmRWH
         6ZJAYbZdexnG7L280ZU8SEoijwgDLbTUBUztV+cUEahzQd3eChp1VXVitTvCjy1ymo4q
         Ev/A==
X-Gm-Message-State: AFq9FYLkggq/fDN7RaFmxgx3ItflIo9JIB12nlvJpgp+E/bCzCzg1txi
	ufi7FnSOD5C2xh+4gROLlyMVuSXnGp7m7SF4WGtdZo1hJBqR7WCXzqgZW0r1/GAJV0ebwEBAB+b
	bMaUhaeg+RHjYdA==
X-Received: from edgj17-n1.prod.google.com ([2002:a05:6402:a5d1:10b0:6a6:6326:bdd8])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3253:b0:6aa:9866:551f with SMTP id 4fb4d7f45d1cf-6af9e3821e3mr2307303a12.45.1790974369334;
 Fri, 02 Oct 2026 13:52:49 -0700 (PDT)
Date: Fri,  2 Oct 2026 20:52:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002205242.3820674-1-jpiecuch@google.com>
Subject: [PATCH sched_ext/for-7.3-fixes] sched_ext: Generate qseq from a
 per-task counter
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	David Vernet <void@manifault.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev, 
	Kuba Piecuch <jpiecuch@google.com>
Content-Type: text/plain; charset="UTF-8"

finish_dispatch() uses the qseq embedded in p->scx.ops_state to tell
whether the QUEUED instance of a task it's about to claim is the one
scx_bpf_dsq_insert() saw. qseq is generated from rq->scx.ops_qseq, but
the counters of different rqs are independent, so if a task is dequeued
and re-enqueued on a different rq between scx_bpf_dsq_insert() and
finish_dispatch(), the new QUEUED instance can end up with the same
qseq as the old one:

  CPU X                          CPU Z
  -----                          -----
                                 enqueue p on rq A, qseq = N
  ops.dispatch()
    scx_bpf_dsq_insert(p)
      records qseq N
                                 sched_setaffinity(p)
                                   dequeue p from rq A
                                   enqueue p on rq B, qseq = N
  finish_dispatch(p, N)
    qseq matches, p is claimed

The claim itself is still atomic so the core stays consistent, but an
insert issued for a previous QUEUED instance gets applied to a new one
which the BPF scheduler has just received through ops.enqueue(). This
breaks the guarantee that dispatches targeting a stale instance are
ignored.

Generate qseq from a per-task counter, p->scx.ops_qseq, instead so that
consecutive QUEUED instances of a task never share a qseq regardless of
which rq they're on. The counter is only updated in
scx_do_enqueue_task() with the task's rq locked, so no additional
synchronization is needed. It's 32 bits so that it fits in an existing
hole in struct sched_ext_entity on 64bit.

Never generate qseq 0. NONE and DISPATCHING don't carry a qseq, so
scx_bpf_dsq_insert() on a task in either state records 0. With a
per-task counter, every task's first QUEUED instance would otherwise get
qseq 0 and could be claimed by such an insert.

Remove the now unused rq->scx.ops_qseq.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 include/linux/sched/ext.h   |  1 +
 kernel/sched/ext/ext.c      | 15 +++++++++++----
 kernel/sched/ext/internal.h |  5 +++++
 kernel/sched/sched.h        |  1 -
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/linux/sched/ext.h b/include/linux/sched/ext.h
index 582d7cd4a983..36c04797436c 100644
--- a/include/linux/sched/ext.h
+++ b/include/linux/sched/ext.h
@@ -207,6 +207,7 @@ struct sched_ext_entity {
 	s32			holding_cpu;
 	s32			selected_cpu;
 	s32			runnable_cpu;	/* cpu @p is runnable on, -1 if not */
+	u32			ops_qseq;	/* protected by rq lock */
 	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
 
 	struct list_head	runnable_node;	/* rq->scx.runnable_list */
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index e56c3c95018f..7733b4a0f984 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2057,8 +2057,15 @@ void scx_do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	if (unlikely(!SCX_HAS_OP(sch, enqueue)))
 		goto global;
 
-	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
-	qseq = rq->scx.ops_qseq++ << SCX_OPSS_QSEQ_SHIFT;
+	/*
+	 * DSQ bypass didn't trigger, enqueue on the BPF scheduler. Brand this
+	 * QUEUED instance with a fresh per-task qseq. Skip 0 as that's what
+	 * scx_bpf_dsq_insert() records for a task in NONE or DISPATCHING.
+	 */
+	do {
+		p->scx.ops_qseq++;
+		qseq = (unsigned long)p->scx.ops_qseq << SCX_OPSS_QSEQ_SHIFT;
+	} while (unlikely(!qseq));
 
 	WARN_ON_ONCE(atomic_long_read(&p->scx.ops_state) != SCX_OPSS_NONE);
 	atomic_long_set(&p->scx.ops_state, SCX_OPSS_QUEUEING | qseq);
@@ -6947,9 +6954,9 @@ static void scx_dump_cpu(struct scx_sched *sch, struct seq_buf *s,
 	seq_buf_init(&ns, buf, avail);
 
 	dump_newline(&ns);
-	scx_dump_line(&ns, "CPU %-4d: nr_run=%u flags=0x%x cpu_rel=%d ops_qseq=%lu ksync=%lu",
+	scx_dump_line(&ns, "CPU %-4d: nr_run=%u flags=0x%x cpu_rel=%d ksync=%lu",
 		      cpu, rq->scx.nr_running, rq->scx.flags, rq->scx.cpu_released,
-		      rq->scx.ops_qseq, rq->scx.kick_sync);
+		      rq->scx.kick_sync);
 	scx_rescue_dump(&ns, rq);
 	scx_dump_line(&ns, "          curr=%s[%d] class=%ps",
 		      rq->curr->comm, rq->curr->pid, rq->curr->sched_class);
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index 1df8f583b0ec..5b37faa532d6 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -1998,6 +1998,11 @@ enum scx_ops_state {
 	 * dequeue/requeue, the dispatcher can tell whether it still has a claim
 	 * on the task being dispatched.
 	 *
+	 * QSEQ is generated from the per-task p->scx.ops_qseq counter so that
+	 * it doesn't repeat across QUEUED instances of the same task even if
+	 * the task moves between rqs. 0 is never used as a valid QSEQ since
+	 * NONE and DISPATCHING map to this value.
+	 *
 	 * As some 32bit archs can't do 64bit store_release/load_acquire,
 	 * p->scx.ops_state is atomic_long_t which leaves 30 bits for QSEQ on
 	 * 32bit machines. The dispatch race window QSEQ protects is very narrow
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..37df14377516 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -816,7 +816,6 @@ struct scx_rq {
 #endif
 	struct list_head	runnable_list;		/* runnable tasks on this rq */
 	struct list_head	ddsp_deferred_locals;	/* deferred ddsps from enq */
-	unsigned long		ops_qseq;
 	/* both stashed across the activate_task() in move_remote_task_to_local_dsq() */
 	u64			remote_activate_enq_flags;
 	struct scx_sched	*remote_activate_sch;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


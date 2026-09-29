Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721151B175
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698657; cv=none; b=rEN8SH2JwtD4gNRNCmiWUAKy28X27GzvEXm0g8Xk6vUhkh1VV5Es7GeSdIIZ9y5pPcAKwxehPNMcOIyLh179BC+xHnkOWaNUSBj8kYGNFbyJhiynUOBB4H4LXa6HMrfhAfNbGVlFN9eB+sfnLWCRZbgtDaMK98ho96Y/mfoCJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698657; c=relaxed/simple;
	bh=qJxAG6G8/LvW6p4Ong3UCYruH3W/HI/b/QEEpkkiYHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XZ7EmBrKwQFwnDUBNAKDGaoMwbVwryGGk2k5Kl+oPA+kTuIXmB6fGYZH9YyuQ+drbQjIwJpLEejA8lJj7uPgETV2j4CF5RJf4GUT8KAjD2glIqdb/8FDpvXa6oPMVPJKJo5GC4ktbQPOqqSmvUpXn80fP725J/2kueJb/TeD3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9EeG9Hr; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9EeG9Hr"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso15451585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790698654; x=1791303454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUg1JPo4dsFZ+2B785rvlA2QB0vfJBtEIvCNiSYWqL4=;
        b=l9EeG9Hrn/BhckGCo+wTYtReC6xUW2S3pgsvlInVeKPozZ8UxS+VYlg57ygnxIvuQs
         IU0VC+Nao2/0irragVKxLxwzBUP/j3UD8T+QN7lvK0N8wwOq2fm9U5HCF4/lsvY8a05h
         eot+R2RgYIi8ktD65lBF0J0+G88sCb/rAcnBK+oF3WccicSW6XBMn4TJ4qXVaBLA6eW8
         2z7wRi5hSSeZigt/+3JjrLBRvuZEp9KSqoBufagzGdGnBAoQb5Imfz1WfXCishnAzk0q
         PPWM67GcvoRQ+oszp5E8ZyBy2hzGrvW4UAVanwAgPuSjNJHqis1KwYAHkBHafqptK2N8
         ln7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698654; x=1791303454;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUg1JPo4dsFZ+2B785rvlA2QB0vfJBtEIvCNiSYWqL4=;
        b=Nr9ZmIBlZ7Qe1OJeh0k2nLPR4zbh31Lz0wqRUJ6dgHZsJc5wHy5bqqCjJAq3R3X0km
         NDRdRdVnFdra2CDG9UkroNFFYnVdq3Lw63pPfq/AJRtrcPaRO+VlinXweRvrWChVpGUJ
         AbJY3Xj+RhG03G/j5OsAiSuHgx6qkuHDhkpd8tayb6DnC/74ip7QNY8YbVlHKmF1nDr7
         ZNPvMokSzB3z/77tLYt+HvX/eQl2jbRZxGYr8ty7F7nVc/V1MC5NcYYuqDwbOXWsCOwX
         kg8IhctqSmjdmMDLVQ/BDkisqxIRO3uzwyV5y4eZrgdFlIFMc9ukFM4m3osGathO8xuZ
         erDA==
X-Forwarded-Encrypted: i=1; AKwUvBxB8ImCofnmALpFJXdzFVlaxToq3UMFDgS1AKHxOjpHh4TOXCgMU/wlK3LZwsWVz72iVPFE1d12Flj+zjY=@vger.kernel.org
X-Gm-Message-State: AFuF++kqPTTwOlpp7dq5qX1aADR1MKTVabTM0K0YAJVHra4xr79lxNSW
	w4/Bs6IAsogJV1zihmRZR8SDiEJzops5ZzKQJawxG0J05rvkncIdbqByDtg4ymwIrw32oKEj7DH
	j87RiLKNR8BwPZw==
X-Received: from wmom18.prod.google.com ([2002:a05:600c:4612:b0:4a0:ca2:a388])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8b:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49fe66c301dmr338444905e9.3.1790698653925;
 Tue, 29 Sep 2026 09:17:33 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:25 +0000
In-Reply-To: <20260929161730.185271-1-jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929161730.185271-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929161730.185271-3-jpiecuch@google.com>
Subject: [PATCH 2/3] sched_ext: Call ops.dequeue() when a task arrives on a
 remote local DSQ
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the BPF scheduler moves a task to the local DSQ of a CPU other than
the one whose rq the task is on, e.g. with SCX_DSQ_LOCAL_ON dispatch,
scx_bpf_dsq_move_to_local() or scx_bpf_dsq_move*(), the task is migrated
by move_remote_task_to_local_dsq(). p->scx.sticky_cpu is set across the
migration so that dequeueing the task from the source rq isn't treated as
the task leaving the BPF scheduler's custody.

However, enqueue_task_scx() only clears p->scx.sticky_cpu after
scx_do_enqueue_task() has inserted the task into the destination local
DSQ. task_leave_custody(), called from rq_owned_post_enq() on insertion,
still sees the migration in progress and skips the custody exit. The task
ends up on a terminal DSQ with SCX_TASK_IN_CUSTODY set and without
ops.dequeue() having been called.

The custody exit then happens only when the task is picked for execution,
in set_next_task_scx(), which reports it to the BPF scheduler as
ops.dequeue(SCX_DEQ_CORE_SCHED_EXEC) even though no core-sched pick took
place. If a scheduling property change hits the task while it's waiting
on the local DSQ, the BPF scheduler instead gets
ops.dequeue(SCX_DEQ_SCHED_CHANGE) for a task that has already left its
custody. Both break the ops.dequeue() semantics, under which a dispatch to
a terminal DSQ ends custody with an ops.dequeue() call without special
flags.

Clear p->scx.sticky_cpu before calling scx_do_enqueue_task(). The routing
decision in scx_do_enqueue_task() uses the local copy, and the departure
side is unaffected as p->scx.sticky_cpu is still set across
deactivate_task(). ops.dequeue() is now invoked on the destination rq when
the task is inserted into the local DSQ, as it already is for same-rq
dispatches.

Fixes: ebf1ccff79c4 ("sched_ext: Fix ops.dequeue() semantics")
Cc: stable@vger.kernel.org # v7.1+
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index ad391a8cbd05..763de7797056 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -1501,8 +1501,9 @@ static inline bool task_scx_migrating(struct task_struct *p)
 	/*
 	 * We only need to check sticky_cpu: it is set to the destination
 	 * CPU in move_remote_task_to_local_dsq() before deactivate_task()
-	 * and cleared when the task is enqueued on the destination, so it
-	 * is only non-negative during an internal SCX migration.
+	 * and cleared in enqueue_task_scx() on the destination before @p is
+	 * inserted into the local DSQ, so it is only non-negative while @p
+	 * is in transit between the two rqs.
 	 */
 	return p->scx.sticky_cpu >= 0;
 }
@@ -2189,10 +2190,15 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 	if (rq->scx.nr_running == 1)
 		dl_server_start(&rq->ext_server);
 
-	scx_do_enqueue_task(rq, p, enq_flags, sticky_cpu);
+	/*
+	 * An SCX-internal migration ends once @p arrives on the destination
+	 * rq. Clear sticky_cpu before enqueueing so that @p leaves the BPF
+	 * scheduler's custody when inserted into the destination local DSQ.
+	 * The local copy in @sticky_cpu is used for routing.
+	 */
+	p->scx.sticky_cpu = -1;
 
-	if (sticky_cpu >= 0)
-		p->scx.sticky_cpu = -1;
+	scx_do_enqueue_task(rq, p, enq_flags, sticky_cpu);
 out:
 	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


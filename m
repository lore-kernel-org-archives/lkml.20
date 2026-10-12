Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14014DA9AA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839275; cv=none; b=IqTMXqvQQu39hAAuMECbhsfOJAsOFWpXlLQWi0lYiMkHEc1a1C7NcYZT36XlEfAd95vN8kdxTAnpBC6lKHm2hZ+dtxwFinldcsoRQ7HCoDNzAjZV48Q9NuB1AThL3OUR2pYK+4IHy3mJpNEmDq6+1xf+gyqrynPTYIjBuVQ1x4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839275; c=relaxed/simple;
	bh=hqn5P4L3CZnxjs8yZX9QzNZcOkEwsd2v7845ON8L4oA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uG6FizNWRee4YSszTN25TJUpknYbVI/5BNNfDTXYlPUNSL9FtmP0HCG5gIG1u/I/07kqzu9JdPJ+ITl0Vy65vKNAfH+mnVMQW4uJpdZC/FhM4zoOrMCUAcT495XSv/VCAkxrqX/eZdFXm/6trkuu26jcxKjOxDdz8npADeUU40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MK65AzqH; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MK65AzqH"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16db51147so15011915e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791839272; x=1792444072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nju8hJCq3oU25r3nG8uHzCMNYnVy7/XIFrhD7fzQFSQ=;
        b=MK65AzqHAu52RI8G3Q8lbqymKCMpfHmKKjvwQiBU2U+BIs3KUdpBd3yd3nltDsLng9
         G17BptsI0VVrmQEqYnFNpd9IgogztZSEfxk4gEIZWH/dk6MuscMfX+eQhF8nzFBmSgmW
         0lZCNR+sAwjFf53hBafGi5lma0cznUL+vPWQF9N7yYwiJOa6hL5A5a/Zb29AydZ7gYSs
         AmdXN8QDj2B0ym2uUJ6wpYBw/AvJaPO/k076+y0KJ/gIl+iLuoqAOYLFACiL7HxDIRGM
         EWOWTxIwC7r2RtN/0oPg5Glk3Urfr4KFeKm58dQNskQI+dh3uzTMZDeHVD0guHF1vIIR
         Cvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839272; x=1792444072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nju8hJCq3oU25r3nG8uHzCMNYnVy7/XIFrhD7fzQFSQ=;
        b=zirxu1UrfVPCS88YnLe5ZqBhK/spxCEAurJMMsHs/ewp4xq7t3j0MtM/aNrHDDVliy
         J5wcNh+4FMyzSJBvO5oxKHjd0Y2wdierQn0BBzfKquDTRzOaPL+hTL8iu66Jp0Dicyja
         Rfo40Bmu1yBZcbH4zPcFcABYrsxE12YabySoE9XeTVDl5pHZ1xR2sbYTJyiMq647msCa
         PaqFZWkIhhGZ35dCf511/JVJyvw17AVM8IS1xl33fNi0/NLB72a5WbkW3afBhePdskQK
         fYqOG08dAsc8C3dxgelR1CXUVEfH+Z2mxn3ugAmUQB1pS25J3UzwiEV0mjTPdeWpjzoS
         chPw==
X-Forwarded-Encrypted: i=1; AKwUvBxPNfkDhx8ngQqpEtAHr2E3pcbh37KgzLeikIGOreUPUWd92KhMF2216ZpESoW72xlq8eh/89OqcCNdj5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRxRooGDwzIL30Ap5FDIY43Wep9l+kSDbsoPoHzmzq4UEeZY4Z
	xpErunE5LC/QPEIfSAQ7fnTGg5ZkJZmvisRthSbGPocW+Rpb0HdeQkmwAahK7mEC27pVVbCAcJ/
	qM3Km2YJA3RUfIw==
X-Received: from wmbjn2.prod.google.com ([2002:a05:600c:6b02:b0:4a1:8bbb:59bd])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr200521275e9.0.1791839271989;
 Mon, 12 Oct 2026 14:07:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:07:45 +0000
In-Reply-To: <20261012210749.2955291-1-jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012210749.2955291-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012210749.2955291-2-jpiecuch@google.com>
Subject: [PATCH 1/2] sched_ext: Rename scx_reenq_wait_dispatching() to scx_wait_dispatching()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Waiting for SCX_OPSS_DISPATCHING to clear isn't specific to the reenqueue
paths. Any path which takes a task off a DSQ can find it while the
dispatch is still in flight, and the next patch calls the helper from the
DSQ consume and move paths. Rename it to scx_wait_dispatching() and
update its comment accordingly.

No functional change.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c      | 13 +++++++------
 kernel/sched/ext/internal.h |  2 +-
 kernel/sched/ext/sub.c      |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index a6a72ae7f815..acfeadf5503d 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4483,11 +4483,12 @@ static bool local_task_should_reenq(struct rq *rq, struct task_struct *p,
 }
 
 /*
- * The dispatcher stores the final ops_state after dropping the DSQ lock, so @p
- * can be found on a DSQ while still %SCX_OPSS_DISPATCHING. Reenqueueing @p
- * before that store lands would have it clobber the new %SCX_OPSS_QUEUED.
+ * The dispatcher runs ops.dequeue() and stores the final ops_state after
+ * dropping the DSQ lock, so @p can be found on a DSQ while still
+ * %SCX_OPSS_DISPATCHING. Wait for the dispatch to finish before operating on
+ * @p.
  */
-void scx_reenq_wait_dispatching(struct task_struct *p)
+void scx_wait_dispatching(struct task_struct *p)
 {
 	if (unlikely(atomic_long_read_acquire(&p->scx.ops_state) == SCX_OPSS_DISPATCHING))
 		wait_ops_state(p, SCX_OPSS_DISPATCHING);
@@ -4536,7 +4537,7 @@ static u32 reenq_local(struct scx_sched *sch, struct rq *rq, u64 reenq_flags)
 		if (!local_task_should_reenq(rq, p, &reenq_flags, &reason))
 			continue;
 
-		scx_reenq_wait_dispatching(p);
+		scx_wait_dispatching(p);
 		scx_dispatch_dequeue(rq, p);
 
 		if (WARN_ON_ONCE(p->scx.flags & SCX_TASK_REENQ_REASON_MASK))
@@ -4660,7 +4661,7 @@ static void reenq_user(struct rq *rq, struct scx_dispatch_q *dsq, u64 reenq_flag
 		}
 
 		/* @p is on @dsq, its rq and @dsq are locked */
-		scx_reenq_wait_dispatching(p);
+		scx_wait_dispatching(p);
 		dispatch_dequeue_locked(p, dsq);
 		raw_spin_unlock(&dsq->lock);
 
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index 85579fcabf52..352547aedbb7 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -2123,7 +2123,7 @@ void scx_kick_cpu(struct scx_sched *sch, s32 cpu, u64 flags);
 u64 __scx_bpf_now(struct rq *rq);
 void schedule_dsq_reenq(struct scx_sched *sch, struct scx_dispatch_q *dsq,
 			u64 reenq_flags, struct rq *locked_rq);
-void scx_reenq_wait_dispatching(struct task_struct *p);
+void scx_wait_dispatching(struct task_struct *p);
 int __scx_init_task(struct scx_sched *sch, struct task_struct *p,
 		    struct cgroup *cgrp, bool fork);
 void scx_enable_task(struct scx_sched *sch, struct task_struct *p);
diff --git a/kernel/sched/ext/sub.c b/kernel/sched/ext/sub.c
index c9b44ab3bd0a..fee75fcdb59d 100644
--- a/kernel/sched/ext/sub.c
+++ b/kernel/sched/ext/sub.c
@@ -797,7 +797,7 @@ void scx_reenq_reject(struct rq *rq)
 		if (WARN_ON_ONCE(p->migration_pending))
 			continue;
 
-		scx_reenq_wait_dispatching(p);
+		scx_wait_dispatching(p);
 		scx_dispatch_dequeue(rq, p);
 
 		if (WARN_ON_ONCE(p->scx.flags & SCX_TASK_REENQ_REASON_MASK))
-- 
2.56.0.385.gd3acb90ef8-goog


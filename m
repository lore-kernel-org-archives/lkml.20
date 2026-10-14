Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C741442D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965868; cv=none; b=V/uomQJursw9UsWnE91Dd5UCamhwEEawb7KFpFHJkj6PnPnc5jIfCy9h9yixiUfUpTzxKZwzOh0B/R0i0WHCJGwvWrdlX8ppYsriXzlnnlNs1RidzZ0ZWIFr6+ZP+HR+N2cfUcA449Se0XZvwHAA/lufO0O68yq7oC5msjSdPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965868; c=relaxed/simple;
	bh=tUBU0/WulXQcg2g0gXOl+rdAXw2lv66IvHvw3JjBTlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp7gPAYyt73o9sbLYztydsnJsjPy3xnUlhP5mnh/YFKFm1BASG3v/xJLij6Rd+oOk38zMuzl5ycBV+Vf+4kS/747lGTC3UufLkpbo2JTC22vhDJ+CToegzgOUq7KzYXSXN/HBrsT8q4HCzUvEUXAVmmVLQSf7KmQ87bY/YW6Cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtLPykqD; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtLPykqD"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso2417126a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965861; x=1792570661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=krlQGpBVV4KRmT2ONfftEqwQdWa/rxCJSR0eehOD8bc=;
        b=VtLPykqDEAQzHsNdcIhaq8bkq/gosxFcMQdiN/dtImk69jXNTrnSGmNezVJgcyUshn
         y+eoNvzd3hATeU2Ch5+ekodItE3wIKdW7paDh129JDi7d7h8h/yO36tCGQ3Y/IT/qUa8
         HoCfDRCXgktRlgm5z5x8PNhyUHAkkJx9h08Wa0mWHTBCG6/awF03WHAlERu4JCeZklEq
         UBIt5fuQyQnX8/dajmITeWekz3enOb73zgMVIKQhyICksZxt1WtSVFeMzxuqepxaqgq8
         g71vpl2yA9KWgLKGN1+XgTz6uar96rPrOapaXlqmQPuGFlv5LADMhuMSy2Yrq5AiP4v9
         pj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965861; x=1792570661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krlQGpBVV4KRmT2ONfftEqwQdWa/rxCJSR0eehOD8bc=;
        b=lCqSTpDBSkgsyXtvvJgJ84dKve1tSYtthWL5fAzBir0KP59+eF66LVzIuB5oCMq/pF
         +mL8TT4ki7Zq6LJt/8a/wm7Yz1Fl1SH3ueLct8iAH+wSbiV+ZpN5WxkzeXoodV63IuRv
         Sps3wso6zfWC/BMTk48vj/zO5mM2jhu8eQp+MAsZCcVZAi37VsNwi7iAZrXUjPKq7ndt
         xnnIg1FFDxXpHAkVBJmnoyyYB/BHoaovm0+qNAOcHMP+FwqI9/fVHvctsxZ+pWS/ZF2a
         gPUxBJqMlrirCv0ubJefD0RnaTI1Vh9rE5xQMOHXBxnTUa7HG9sYo2tdmQ96OsdneEUA
         xaqA==
X-Forwarded-Encrypted: i=1; AKwUvBz/WtwWx/DqfLOm1upJkEiowwKRroB+MpxqDwAjo5iSVVIxgJW8CbKd+uZnydPzQZAnWubGhIyHGDmIjQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr0w3gKfYF/n60jDeho64uBnpBe50wgWX+/bWjvOz6+9Gxlaxt
	8UHwgOoRYz4RH6DLkCVMqOCmQP2UeN1+AkC1mzNHCNbmrHYsT+HwP/WP
X-Gm-Gg: AYBFou3ofw5vN/vwvg1UQTTuz4DxUI98og7u8rDmQYh8utl3svy+jrbpxqIGDzwYAHd
	wACt0jhiao5RfXUdxxc6W26ilzfStOWSDCi9cKFILDYAotyLVkoh5vbII3RcKWgP55K83mIhaBT
	mjJtoMDvETy9ARPUCzCPnfKfFo7NKlgTx/tZcCcEhb2bDhEkbJhkqDWbjn7JhISZ3qyoqBQJi8s
	80TkwDSX5FWbw+EPtadswlp0m3abiuWdVcVQoJSZabuv1iC3zbzixAXyhVulrfATALF7ckH7Mtc
	rcw7CRarxpO/c0HW/Jio500faRxi6hfEXtwXWY/U6B0bSC7yRIe+RiUK4Zw99x+nMrgh7aiPnST
	EwK7iwD7xJ3oaOjwSE06bsjiuhXZ2ld5Yjg9JSx5+WZmDa8Cq7vNimEuGJ7DkuHK9eeLgpSSknq
	kWsAgV1lXN8Xq92dIa0dghWk6aDdeTmE4XB1neYnRNQEKOdq72ZRr717FKxuVTcSuMyx6mSJ9u0
	FIhzRjjVeU=
X-Received: by 2002:a17:90b:4c8a:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ac63bfe81amr1896646a91.41.1791965861037;
        Wed, 14 Oct 2026 01:17:41 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca91sm3565544a91.12.2026.10.14.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:17:38 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Balbir Singh <bsingharora@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Josh Snyder <joshs@netflix.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] delayacct: Account blkio start on the correct task
Date: Wed, 14 Oct 2026 16:17:31 +0800
Message-ID: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__block_task(rq, p) tests p->in_iowait and bumps rq->nr_iowait, but the
third statement in that block takes neither argument:

	if (p->in_iowait) {
		atomic_inc(&rq->nr_iowait);
		delayacct_blkio_start();
	}

delayacct_blkio_start() stamps current->delays->blkio_start.

That was fine when commit e8901061ca0c ("sched: Split DEQUEUE_SLEEP from
deactivate_task()") introduced __block_task(), because its only caller
was block_task() out of __schedule(), where prev == current.  Commit
152e11f6df29 ("sched/fair: Implement delayed dequeue") added a second
call, at the point the delayed entity is finally dequeued:

	/*
	 * Fix-up what block_task() skipped.
	 *
	 * Must be last, @p might not be valid after this.
	 */
	__block_task(rq, p);

The paths that reach it do not run as @p:

  - pick_next_entity() -> __dequeue_task(DEQUEUE_DELAYED), inside the
    __schedule() of whatever task is prev on that CPU
  - wait_task_inactive(), in the task doing the waiting
  - switching_from_fair(), via sched_setscheduler() or rt_mutex_setprio(),
    which may or may not be @p itself

So the stamp lands on an unrelated task, and @p keeps whatever
blkio_start it had.  When the I/O completes, delayacct_blkio_end(p)
computes local_clock() - p->delays->blkio_start and adds that to @p's
blkio_delay and blkio_count, and may overwrite blkio_delay_max and
blkio_delay_max_ts.  The error is however long it has been since @p's
blkio_start was last written, so it is unbounded.  ->delays is
kmem_cache_zalloc()'d, so if it was never written the delta is the time
since boot.

Measured on an 8-vCPU guest, 2.5 GB file on f2fs over virtio, one task
alternating a 1 MiB O_DIRECT read with two seconds of pure CPU work,
pinned to CPU 0 against three CPU hogs so that the reader gets
delay-dequeued.  Reading delayacct_blkio_ticks from /proc/self/stat
around the second read:

  DELAY_DEQUEUE    18 runs, 4 wrong: 206, 20316, 20729, 21968 ticks
                   reported for reads that took 25-50 ms
  NO_DELAY_DEQUEUE 12 runs, 0 wrong, all 1-3 ticks

The 206 case is the two seconds of CPU work swept in; the 20000+ cases
are blkio_start still at zero.  In a separate run under the same
conditions, a kprobe on __delayacct_blkio_start() caught it being called
with current == "sh" and current == "kworker/0:2", neither of which
issues any I/O.

Consumers are delayacct_blkio_ticks in /proc/pid/stat, taskstats
(getdelays, iotop, delaytop) and the per-task blkio_delay_max peak.  The
error also goes the other way: a task woken while still delayed goes
through ttwu_runnable() and has that sleep dropped entirely.

Pass the task to delayacct_blkio_start(), the same way commit
c96f5471ce7d ("delayacct: Account blkio completion on the correct task")
did for the end side when commit e33a9bba85a8 ("sched/core: move IO
scheduling accounting from io_schedule_timeout() into scheduler") moved
that call into ttwu().

Note this only makes blkio_start agree with the existing deferral: both
the stamp and rq->nr_iowait are still taken at __block_task() time, so
the interval a task spends delayed is counted by neither.  Whether that
interval should count as iowait is a separate question.

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/linux/delayacct.h | 10 +++++-----
 kernel/delayacct.c        |  4 ++--
 kernel/sched/sched.h      |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/delayacct.h b/include/linux/delayacct.h
index ecb06f16d22c5..e595d51699377 100644
--- a/include/linux/delayacct.h
+++ b/include/linux/delayacct.h
@@ -92,7 +92,7 @@ extern void delayacct_init(void);
 
 extern void __delayacct_tsk_init(struct task_struct *);
 extern void __delayacct_tsk_exit(struct task_struct *);
-extern void __delayacct_blkio_start(void);
+extern void __delayacct_blkio_start(struct task_struct *p);
 extern void __delayacct_blkio_end(struct task_struct *);
 extern int delayacct_add_tsk(struct taskstats *, struct task_struct *);
 extern __u64 __delayacct_blkio_ticks(struct task_struct *);
@@ -126,13 +126,13 @@ static inline void delayacct_tsk_free(struct task_struct *tsk)
 	tsk->delays = NULL;
 }
 
-static inline void delayacct_blkio_start(void)
+static inline void delayacct_blkio_start(struct task_struct *p)
 {
 	if (!static_branch_unlikely(&delayacct_key))
 		return;
 
-	if (current->delays)
-		__delayacct_blkio_start();
+	if (p->delays)
+		__delayacct_blkio_start(p);
 }
 
 static inline void delayacct_blkio_end(struct task_struct *p)
@@ -257,7 +257,7 @@ static inline void delayacct_tsk_init(struct task_struct *tsk)
 {}
 static inline void delayacct_tsk_free(struct task_struct *tsk)
 {}
-static inline void delayacct_blkio_start(void)
+static inline void delayacct_blkio_start(struct task_struct *p)
 {}
 static inline void delayacct_blkio_end(struct task_struct *p)
 {}
diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index 479e860aff705..d6158ecbe0be5 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -126,9 +126,9 @@ static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *cou
 	}
 }
 
-void __delayacct_blkio_start(void)
+void __delayacct_blkio_start(struct task_struct *p)
 {
-	current->delays->blkio_start = local_clock();
+	p->delays->blkio_start = local_clock();
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a25..5bba703160e58 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3106,7 +3106,7 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
 
 	if (p->in_iowait) {
 		atomic_inc(&rq->nr_iowait);
-		delayacct_blkio_start();
+		delayacct_blkio_start(p);
 	}
 
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);

base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1
-- 
2.43.0


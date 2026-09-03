Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC477446075
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434031; cv=none; b=Nup0iFRZ9PmD3pY86KHU3j/yAX9pEx6Jpw4hv4CgTtldRzK9Huu8uuB1hluLYHuENuADdBTQrB5PJky22ICO/+ZufZaekJcRzNADXrRHxJ5LESN3Tw1huRmjOzLbraTTN9+d5+6wlAYYfR87gNY0Has82GTU/cunxBuQq1fmsy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434031; c=relaxed/simple;
	bh=hd6vzKJsOJbmZPpx1u6g0M8XRXCofaxgyOa/SVCy7KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWflfT7stf8f0A2TO8LXe2WhEg5hptLTBKBJNgl45lvArxT+caswYgGqixhIh7FbsKkHwQDRKNFuqSWjnFNq+fctv8Ia0xI+GBike0nZIfCAfcNstWoAHPaDCv8KmXW6d43/Hfe7xE9P9dBiWYtB5CXmps2IQYX/DK6QZhcNSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p4SKM6UA; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p4SKM6UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zq
	2lLvo2jJEdzhkyFKofBzs52vepQTWKLiIjF0jovNo=; b=p4SKM6UA0AgCkruqOD
	HZiV27VIaO/Wq0Jd9gnIKOUHySulOAKtveztiC7+ZR50qUrha+q+zdTYvKiItcw5
	+ZN2anh0kXG+7m2CrfJdErbl4Z9iHo8ioPNCliCD+Wbpgi1yqjEfH5j77VYsST7/
	BJzC5kn/d0VgloWx01dZWeclA=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHjMwvVplq2Ee1Pg--.51302S2;
	Thu, 03 Sep 2026 19:12:47 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	juri.lelli@redhat.com,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	connoro@google.com,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/rt: Fix RT watchdog accounting for proxy execution
Date: Thu,  3 Sep 2026 19:12:47 +0800
Message-ID: <20260903111247.3538976-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHjMwvVplq2Ee1Pg--.51302S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw48Kr1fXr4rJFW3XrW3trb_yoW5WF4Upr
	Z0gasxJw4DKa4jqas7Zws8u3yrWw1fJ342qr4DJryrArn8KF1Fgr1vqa4avF909ry2vFya
	vr1vv3y2ya1jyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_b1UUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwg+hAWqZVi-3KQAA35

With proxy execution, task_tick_rt() is invoked for the scheduling
context in rq->donor, while rq->curr identifies the task that is
actually executing.

The RT watchdog looks up RLIMIT_RTTIME through its task argument and
updates that task's rt.timeout and posix_cputimers state. Runtime
accounting, however, charges execution time to rq->curr, and
run_posix_cpu_timers() checks current after the scheduler tick. Pass
rq->curr to watchdog() so these state updates follow the actual execution
context.

Reset rt.timeout when a non-RT execution task blocks while using an RT
donor, or resumes with a non-RT scheduling context. This ties the timeout
lifecycle to the execution and scheduling contexts, handles nested proxy
chains, and preserves the timeout across scheduler preemption. Native RT
tasks retain their existing behavior.

Tested with a proxy-execution reproducer using SCHED_FIFO and
SCHED_RR donors. The unpatched kernel charges rt.timeout to the donor,
while the patched kernel charges the execution task and delivers SIGXCPU
to it. Nested proxy chains, blocking and non-RT context transitions,
scheduler preemption, and donor cancellation were also exercised.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c | 13 +++++++++++++
 kernel/sched/rt.c   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..c429e410f6dc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6746,6 +6746,11 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 		return false;
 	}
 
+	/* End the current proxy execution episode when the owner blocks. */
+	if (sched_proxy_exec() && !rt_prio(p->prio) &&
+	    rt_prio(rq->donor->prio))
+		p->rt.timeout = 0;
+
 	p->is_blocked = 1;
 
 	/*
@@ -7221,6 +7226,14 @@ static void __sched notrace __schedule(int sched_mode)
 		rq_set_donor(rq, next);
 	}
 
+	/*
+	 * End a previous RT proxy interval when a non-RT execution task is
+	 * selected with a non-RT scheduling context.
+	 */
+	if (sched_proxy_exec() && !rt_prio(next->prio) &&
+	    !rt_prio(rq->donor->prio) && next->rt.timeout)
+		next->rt.timeout = 0;
+
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e6e5f8a2caaf..bdcfc4fa8922 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2545,7 +2545,7 @@ static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
 	update_curr_rt(rq);
 	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
 
-	watchdog(rq, p);
+	watchdog(rq, rq->curr);
 
 	/*
 	 * RR tasks need a special form of time-slice management.
-- 
2.54.0


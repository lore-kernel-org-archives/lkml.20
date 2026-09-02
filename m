Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140246D2B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361469; cv=none; b=hOrTU9ta/OnSsrBQlTnM+hyBF3i1TBH4+DoOMiM4s0gjgk9SH4VKHB2oGc0b3CFD7CO/mWwfoH5RP8wWsgsenkGtIVNlEk/MR8HmW8DgYn9QgPgbToS1dfwCRaXTbgYoKKxyr8erufg5N/cdPGqtBg/aUvuz0CNubEr0+YQmbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361469; c=relaxed/simple;
	bh=0Wc5r4qHPgbC65Zcpt6nmZs5aL7vwqGQsO9C/8PQ0Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ps5fjwG1HZzWUsgyL7vHXd9qcDbI4wpH/X2EG2DJxv0RDUDk6I3Pz4i/UJhlux/UEdgXxgJapaHCcsk2rrwbRBvugTQ3NzMYX5uBdnK/KeJkeQn7H3L0B8AWA2sKyKGtPWs0VZzBX+uObqwD6jbkjpM/62JoHU3JCgdldsCt4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=A8LMH0/w; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="A8LMH0/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yq
	ADD3o+XKYfElMjIJ/SS1q/1/RBu9HuM51efZOAzWk=; b=A8LMH0/w5HpX3BKoH/
	ZBLPec8BAQw405qzkU08pT1WGB1TKkltpRFf1KkZ/B5Fa7yuMGMRtjjStBQY5Lib
	0se5B58bzM3ViLEh1yuXYPh0ueacFp+GT63r0k2aiX+bFNgqMxyl0gpHcHE5lSGV
	weYqjz6UoDHI8IXuqxvxnNjcs=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDoKbOphq3x6fAA--.21835S2;
	Wed, 02 Sep 2026 23:02:52 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	tj@kernel.org,
	jstultz@google.com,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/core: Call wq_worker_tick() for the execution context
Date: Wed,  2 Sep 2026 23:02:09 +0800
Message-ID: <20260902150208.1209922-2-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnDoKbOphq3x6fAA--.21835S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18KF1rXrWkJrW5uF4fuFg_yoW8Cw48pF
	Z7W3W5Jr4ktayYq3W8Zws8W34fuwn8Aw4fuF4kCrWa9rWrtr1Fgryvqr1avF1Yvrn2kFy2
	vr1q9a4IkF4DKaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRx21WqYOpzmGAAA3U

wq_worker_tick() accounts CPU time and detects CPU-intensive work for
the kworker that is actually running. With proxy execution, rq->donor
is the scheduling context while rq->curr is the execution context.

Calling the hook with rq->donor can skip workqueue accounting when a
kworker is executing on behalf of a donor task. It can also account a
blocked kworker when the donor is a worker but rq->curr is the task
actually executing. The former can delay WORKER_CPU_INTENSIVE handling
and pool concurrency management, which can delay pending kernel work
and userspace operations depending on it.

Use rq->curr for the workqueue tick hook while retaining rq->donor for
scheduler accounting.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..a86fd3d88714 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5770,8 +5770,8 @@ void sched_tick(void)
 {
 	int cpu = smp_processor_id();
 	struct rq *rq = cpu_rq(cpu);
-	/* accounting goes to the donor task */
-	struct task_struct *donor;
+	/* scheduler accounting goes to the donor task */
+	struct task_struct *curr, *donor;
 	struct rq_flags rf;
 	unsigned long hw_pressure;
 	u64 resched_latency;
@@ -5782,6 +5782,7 @@ void sched_tick(void)
 	sched_clock_tick();
 
 	rq_lock(rq, &rf);
+	curr = rq->curr;
 	donor = rq->donor;
 
 	psi_account_irqtime(rq, donor, NULL);
@@ -5807,8 +5808,8 @@ void sched_tick(void)
 
 	perf_event_task_tick();
 
-	if (donor->flags & PF_WQ_WORKER)
-		wq_worker_tick(donor);
+	if (curr->flags & PF_WQ_WORKER)
+		wq_worker_tick(curr);
 
 	if (!scx_switched_all()) {
 		rq->idle_balance = idle_cpu(cpu);

base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.54.0


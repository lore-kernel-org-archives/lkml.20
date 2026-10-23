Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793076;
	b=KqyGzxLWkoPPM9vBLbi7CqkjUuiFt785o3Yav29r8eRPC+zwrI/ACTQb9fCOXweeU8eq
	 9YRxLWt5mB0EGIfnRR7yy1KuXyEWU8L+EOq8g5CX3rERFALFrAi51P7uyyOl86rNP+9L6
	 qyg8OEVSOW1g8PNo4QJFZO8HF96uoPMKf3/GHFwwE4OZO4+A7DcebH2Q9ZjUMSkyXAc+T
	 vmKevD4A4vI1yCXbNHksCgTPzy2QEZjWxuF1SyqjOvOGKAazZavlWotrvZnPTi5xmXgtk
	 qzBbEHv5jhpCqrV7YPDh0Rh+24wAmUeBuvPbBAJ3PEPERI+vN9pj+dirxKYmVUx6mWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3pew01NS0T0nJms9HabRzjaU8su/NDIdILWmbqWJRT0=;
	b=WQljRam1VpaXUWUcMi3US+eiPELZdIKVKdVTuFf08feI+rNH79aGBPIDX/wef2/QNPP7
	 VQMArp2Zu/YRnmFLH55oeFQqqbUa4IRebaRZ2epSnovy5kb6kVJJiplrSxDLmce+4skoM
	 T95lgJrPCdlCg2bLk628BEfXTFDQ48cjl6/I6GQv7OOG8kaezRx3iXGfrOVOVa3VVFvNG
	 7AEqn0DMBpth8zAYfMSf/7jExJBK5vyIH6w9s7UCuWjeOGE87LnSMYYHgeiHm/oXb/gT2
	 rIaaOSgOX7plhERqmDFxsZzLHhncf3Dxd2x3ipMgCgXGZ8djkwWYgLZJY5qAQZyq38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RtDsPQFJ;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AA5606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AA5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RtDsPQFJ
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so9142375ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793076; x=1793397876; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pew01NS0T0nJms9HabRzjaU8su/NDIdILWmbqWJRT0=;
        b=RtDsPQFJcbaMBz3VuYYggnckwB/kBTbK1I/PTOcrEzRfDcTsp71rnovoiZtW10ltDK
         49WZ1JNyL9MNJiXtiEj5FyPEuXeEUIH0Bhs+js7T6NM5pSvfOniUk7zooLQpN5GgUXo2
         Phz75PiDK+dH1GCKT914Y8TUy90lGCDMenFWzPBESwtYqU/nMeoZJ/oKliGuGc/FjMPk
         7fmVd77t2e34Zlc0/ij9zy4ZXYlQ7q89H2tuSzYkUOmU6wLkN04J8HKrOoJAMBGCN1yp
         +0kjJGXMih30Ig/9/EZ5u7pK9XevAqNhoSH3XqVqwcfQq8vo6OHMQvkoLjRugAYtCSfi
         ICFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793076; x=1793397876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pew01NS0T0nJms9HabRzjaU8su/NDIdILWmbqWJRT0=;
        b=MPbR9Khx/PPpbfogwBmVfJCKat/4y7i4OMe8lxl7G7FVEu8/U782rfgPVahJf6pWj0
         rkg+h+wskIDBUEHCQ2IGnLHOuh9yQMSt4UnCy33NRxWF5O84vV4C9LoTbtP6ptYHMdkU
         PBVlXHYJXDZp8Wq0cqORqHKathBtmzI2lpgSkr/FLkHn/uPvs+Y7HHVImS+ysdg5P28R
         MT27lyZ97K47MumoQdF3H+2yVi/9nhs0USWHrCrpuKmpe5QxHP8CdTqTnqZgTfyYXGLk
         D/djJt4BTWijbuzwWQzEukCcnPiwALGC9z50jrJljRfXpJv18bPk2pehHsmvZkCF31/E
         xtpg==
X-Gm-Message-State: AFq9FYKq2khJTJAxWjE470B/Jd2rLnZvQdViXVtZv6qQPNwygDjoaupS
	RQhzsFYeocmKmDt9eKON0bnPmCwMtsq6DWTfIVz6mzH/naFe6fY2Ypr0XhepIVFcCfhDv9B0Hqb
	bJ+J0aV2BXRNzVNTVC5yldcgyhc2DwoxfuIx/pg02RMzDZAJN0Lb/vmInDD2+B9jeazrYz4DhMq
	AW3TZklYAY1W401Q+K+XEzLbqSqi+NDKjEeMS6GykrR1p2BH/l
X-Received: from plbjb17.prod.google.com ([2002:a17:903:2591:b0:2e2:c8c0:e8eb])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf12:b0:2e9:66c4:1713
 with SMTP id d9443c01a7336-2ea9c917ba4mr2224925ad.58.1792793075434; Fri, 23
 Oct 2026 15:04:35 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:13 +0000
In-Reply-To: <20261023220431.1106611-1-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-3-jstultz@google.com>
Subject: [PATCH v33 2/7] sched/core: Use the scheduling context for remote ticks
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, John Stultz <jstultz@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>

sched_tick_remote() assumes that a CPU in full dynticks mode has only
one running task. It therefore assumes that proxy execution cannot be
active and that rq->curr == rq->donor.

However, sched_can_stop_tick() can stop the tick with multiple tasks on
the runqueue. With exactly one SCHED_RR task, the tick is not needed for
round-robin timeslice rotation. When there are no SCHED_RR tasks,
SCHED_FIFO tasks do not require the tick because they have no forced
tick preemption. Lower scheduling-class tasks can still be queued in
both cases.

Consequently, a SCHED_FIFO task blocked on a SCHED_NORMAL mutex owner
can remain rq->donor while find_proxy_task() selects the owner to
execute as rq->curr. sched_tick_remote() can therefore run with
rq->curr != rq->donor.

The full-nohz state check in sched_tick_remote() is intentionally racy
and can allow an extra or missed remote tick. This issue does not rely
on that race: the tick can be legitimately stopped in the cases above.

Use rq->donor for the remote class tick and its full-nohz tick-interval
sanity check, matching sched_tick() and hrtick().

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
Cc: Hui Su <sh_def@163.com>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Cc: kernel-team@android.com
---
 kernel/sched/core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0ab15f03cb947..729ebaca35e1a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5934,26 +5934,20 @@ static void sched_tick_remote(struct work_struct *work)
 	 */
 	if (tick_nohz_tick_stopped_cpu(cpu)) {
 		guard(rq_lock_irq)(rq);
-		struct task_struct *curr = rq->curr;
+		struct task_struct *donor = rq->donor;
 
 		if (cpu_online(cpu)) {
-			/*
-			 * Since this is a remote tick for full dynticks mode,
-			 * we are always sure that there is no proxy (only a
-			 * single task is running).
-			 */
-			WARN_ON_ONCE(rq->curr != rq->donor);
 			update_rq_clock(rq);
 
-			if (!is_idle_task(curr)) {
+			if (!is_idle_task(donor)) {
 				/*
 				 * Make sure the next tick runs within a
 				 * reasonable amount of time.
 				 */
-				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
+				u64 delta = rq_clock_task(rq) - donor->se.exec_start;
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
-			curr->sched_class->task_tick(rq, curr, 0);
+			donor->sched_class->task_tick(rq, donor, 0);
 
 			calc_load_nohz_remote(rq);
 		}
-- 
2.56.0.257.gf7497c7d27-goog


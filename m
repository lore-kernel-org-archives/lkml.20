Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242205;
	b=ld+5Bxdw9aR4z+/fsuTTkJS8y6ht120uRq69SD08RG6DLjO+KqFlLIA2eZI4szzcgXFt
	 oFeMSjkg5JbErhTSeBJJCGHcc9z9FJEP35ly7EA8cEyHHXvDko7gkP6LsTL8rq43Wq1Si
	 XLxZZogIT3ytM2idb+M+GPQ+2UHIPp9gVjPLjm64vu17h2zLMf+DKyGbWwQZ7KQaIVeui
	 2srh3JgKYEO1DJPlw8K3RmWY1F76McWKVu0bVKj1GhctX2xLPqXVyQV+eZL5QVPuzv+xq
	 Vewh2Yo6JPPGshFBzSkBGRPYgye6gvRjudIGKkxDoTHFqXOuzUrJXpI65pq0VQosVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ldczjvem2i6q2WhSmnnja5U3I99zaiiMJyYqWlHhT8=;
	b=lyp+diPglSz9XtkJmGoQ7lUFJP/ljziWFuoreSGzUfUlbjQVu5Nk01HEyoivBxukEMtx
	 ahamUIVV7xvfEiMKT2UOphaiFtQAeLO7fjsOuTBWCHtYY4aA2+3EijKlZdOkVciSrldK6
	 uKTBGaaHPbbKwkH5TZmgv9d5NILUnRBP5MafgRMiG3KxcwzOV6H6705ykBHTwcjddVtIB
	 m4qwKzs7HUbET5sL67MWturGNxRXLtsKva/XlleLueme34nWdSUF+eUtssXGYXFzgag6T
	 r5J588+fee9XIB9hdyw7/dNYPoKD0Jqc9ZMcoaE548fKNMJDFiRZYEpcryrgHH2+PHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PXDkFzd/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C860A3839
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60C860A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXDkFzd/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11208675e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242203; x=1794847003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ldczjvem2i6q2WhSmnnja5U3I99zaiiMJyYqWlHhT8=;
        b=PXDkFzd/EtNL4zYJdGY/PMQTPtmsPyr32e/ALGMe0yUdW6mMBS+eowfujuKy1qF1hl
         vrhPxhR+ff5pP97EXS3Vjwld0cE82PVq1LCY3qDpWqMNv6wMOv8cP/D49YBZKufg07Ma
         fRsn9fyZv8z4bK4+aab9/mTM78lQiEJPH0EtGQ3i1i0zMI7J4S/p5wrATGUdJr9Q+iXZ
         NbJ4LKJKeQGUn/Qc+6cqjiTYTnYmqPEeUdooqeitHxVDmBZUwnm8CJCY2WsZcxdENy9F
         KBHjZ4ZTmJ1lCjYPf7uINlSUxCmr2raOLK4Gq8VJjkUX5+H/uWn+0WM3IwJqE0QoY2WZ
         C14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242203; x=1794847003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ldczjvem2i6q2WhSmnnja5U3I99zaiiMJyYqWlHhT8=;
        b=Ul6RrAIrdGc9M1gyrZz6E5OOBjGT1NM9rP2nKXWdrjgQnH7ZZrImXkqMpxHplcqzO6
         t8iQddM42lamQ0M4p7KMS9NwizLiyKecB8Ovhz4OJG1Ozcul/7nbvfC19KIVuB0awv+l
         AvZwZDemFXtO59QmKTm4Y81WKT1uannmwvQi5bNZJHUfZGz86P/U8MZHHHBnGF3bwvEF
         ocl47aKSRlC+gKtvJQGICnaGmzlDFS+SYRgsTVXRegh0u3znFRH9qSizxhdypXlDqp8Q
         F2FZh7A35WJgvul0SppXUxNLtZdWsvUhLqhnFfoQNwaACj2+5nWm02CQQVCRfqg2a/HX
         iFKg==
X-Forwarded-Encrypted: i=1; AL+hErGQqr1uFBZ3lKKXBZckRfJM7vhlsvoa736DCLSt/07mMm2m/viVU5WDYhE3dAQ3hR6ROf5ducfbIqkbmnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AljhBRRPKgbFJTHdAJrZTfCkQpzm4FhIS75R2+LGhOrQ1h2X3
	fbIDqLeUxU+EGcD9pNR8t4adoeUhGf3mIpSZkD8//q5BZL1ZXTRaBxg4
X-Gm-Gg: AYBFou3fWHc8ppp2KD+BLCNwhMKrSP9l/r5wbe30fcWg6uIyJJqDXJHJAr3idTy3kjY
	WAn9lgwu/IyD8YP9tBX5lXDK9syf/msV5/96Cb22S3xRyfdOHWXlRVJuM276djCsiQx+tXgmksp
	4HIcAV9qurQOPYCerYDdYuokcUrV2hdHdtEe+qlqLm7m3kEK9PF/uONgDucCdVW1Cp5lFVVjrm3
	fl11o2GnIpF4aAwL8IVpfRIN38Vr8EuLSQuyqXiOmuKriZpM1XUwGLLnmYRsCWO5jJVSgzN7aTE
	Y4UDr4Hskclfm8Z0IqwoMaIr2nzw/ohMNAnzOyJQ7MN08vvgk6cDPmq04lhaV/YQVFskUXtzIQ3
	8WifSQ+Tf82gUX3gxtOSnc5+RQn4I1gYVj5yh5Wc2IbSBnut1BgYDALg/waN38FVGnVnVeX83vc
	e+zhZl2AYjajgwKkRu+u9TUir1QuzfYu4/37FMr8DtbHvPNtcGJhZ4C2vndwJ+j4LvicsU/tv4d
	4O4ODbdLUP8JZZ3QRGFxe4/A0MnaHaSyIYMY2epao5I1UmXZcbiPeltlxMiZUb3Z6x49+q/Qt/G
	hYOkPihwLkJZVpEUeK3U2J2rmA==
X-Received: by 2002:a05:600c:3e0a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4b94d762e54mr87236505e9.2.1794242203274;
        Mon, 09 Nov 2026 08:36:43 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:42 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 13/29] sched/rt: Implement dl-server operations for rt-cgroups.
Date: Mon,  9 Nov 2026 17:35:59 +0100
Message-ID: <20261109163616.195264-14-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement rt_server_pick, the callback that deadline servers use to
pick a task to schedule.
  rt_server_pick(): pick the next runnable rt task and tell the
  scheduler that it is going to be scheduled next.

Let enqueue_task_rt function start the attached deadline server when the
first task is enqueued on a specific rq/server.
  The server is not symmetrically stopped in dequeue_task_rt as it is
  stopped when server_pick_task returns NULL (see deadline.c).

Change update_curr_rt to perform a deadline server update if the
updated task is served by non-root group.

Update {enqueue/dequeue}_pushable_task and rt_{set/clear}_overload to
only set the CPU-wise overload flag only if the root runqueues are
overloaded, but not for HCBS runqueues.

Update inc/dec_dl_tasks to account the number of active tasks in the
local runqueue for rt-cgroups servers, as their local runqueue is
different from the global runqueue, and thus when a rt-group server is
activated/deactivated, the number of served tasks' must be
added/removed. This uses nr_running to be compatible with future
dl-server interfaces. Account also the deadline server so that it is
picked for shutdown when its runqueue is empty (future patches will
try to pull tasks before stopping).

Update inc/dec_rt_prio_smp to change a rq's cpupri only if the rt_rq
is the global runqueue, since cgroups are scheduled via their
dl-server priority.

Update inc/dec_rt_tasks to account for waking/sleeping tasks on the
global runqueue, when the task runs on the root cgroup, or its local
dl server is active. The accounting is not done when servers are
throttled, as they will add/sub the number of tasks running when they
get enqueued/dequeued. For rt cgroups, account for the number of active
tasks in the nr_running field of the local runqueue (add/sub_nr_running),
as this number is used when a dl server is enqueued/dequeued.

Update set_task_rq to record the rt_rq of the cgroup's active_context,
tracking where to schedule the given task.

Update set_task_rq to record the dl_rq, tracking which deadline
server manages a task.

Update set_task_rq to not use the parent field anymore, as it is
unused by this patchset's code. Remove the unused parent field from
sched_rt_entity.

Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Co-developed-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 include/linux/sched.h   |  1 -
 kernel/sched/deadline.c |  8 +++++
 kernel/sched/rt.c       | 70 ++++++++++++++++++++++++++++++++++++-----
 kernel/sched/sched.h    | 17 +++++-----
 4 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index febc03b02fa4..8780ef5def7e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -629,7 +629,6 @@ struct sched_rt_entity {

 	struct sched_rt_entity		*back;
 #ifdef CONFIG_RT_GROUP_SCHED
-	struct sched_rt_entity		*parent;
 	/* rq on which this entity is (to be) queued: */
 	struct rt_rq			*rt_rq;
 	/* rq "owned" by this entity/group: */
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 7c2f4d2c9301..17f303294d6c 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2293,6 +2293,10 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)

 	if (!dl_server(dl_se))
 		add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else if (rq_of_dl_se(dl_se) != dl_se->my_q) {
+		WARN_ON(dl_se->my_q->rt.rt_nr_running != dl_se->my_q->nr_running);
+		add_nr_running(rq_of_dl_rq(dl_rq), dl_se->my_q->nr_running + 1);
+	}

 	inc_dl_deadline(dl_rq, deadline);
 }
@@ -2305,6 +2309,10 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)

 	if (!dl_server(dl_se))
 		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	else if (rq_of_dl_se(dl_se) != dl_se->my_q) {
+		WARN_ON(dl_se->my_q->rt.rt_nr_running != dl_se->my_q->nr_running);
+		sub_nr_running(rq_of_dl_rq(dl_rq), dl_se->my_q->nr_running + 1);
+	}

 	dec_dl_deadline(dl_rq, dl_se->deadline);
 }
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e6f018db7579..ec0198902b70 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -284,9 +284,19 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 	return 1;
 }

+static struct sched_rt_entity *pick_next_rt_entity(struct rt_rq *rt_rq);
+
 static struct task_struct *rt_server_pick(struct sched_dl_entity *dl_se, struct rq_flags *rf)
 {
-	return NULL;
+	struct rt_rq *rt_rq = &dl_se->my_q->rt;
+	struct task_struct *p;
+
+	if (!sched_rt_runnable(dl_se->my_q))
+		return NULL;
+
+	p = rt_task_of(pick_next_rt_entity(rt_rq));
+
+	return p;
 }

 #else /* !CONFIG_RT_GROUP_SCHED */
@@ -314,6 +324,9 @@ static inline int rt_overloaded(struct rq *rq)

 static inline void rt_set_overload(struct rq *rq)
 {
+	if (is_dl_group(&rq->rt))
+		return;
+
 	if (!rq->online)
 		return;

@@ -333,6 +346,9 @@ static inline void rt_set_overload(struct rq *rq)

 static inline void rt_clear_overload(struct rq *rq)
 {
+	if (is_dl_group(&rq->rt))
+		return;
+
 	if (!rq->online)
 		return;

@@ -392,7 +408,7 @@ static void enqueue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 		rt_rq->highest_prio.next = p->prio;

 	if (!rt_rq->overloaded) {
-		rt_set_overload(global_rq_of_rt_rq(rt_rq));
+		rt_set_overload(rq_of_rt_rq(rt_rq));
 		rt_rq->overloaded = 1;
 	}
 }
@@ -410,7 +426,7 @@ static void dequeue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 		rt_rq->highest_prio.next = MAX_RT_PRIO-1;

 		if (rt_rq->overloaded) {
-			rt_clear_overload(global_rq_of_rt_rq(rt_rq));
+			rt_clear_overload(rq_of_rt_rq(rt_rq));
 			rt_rq->overloaded = 0;
 		}
 	}
@@ -511,6 +527,7 @@ static inline int rt_se_prio(struct sched_rt_entity *rt_se)
 static void update_curr_rt(struct rq *rq)
 {
 	struct task_struct *donor = rq->donor;
+	struct rt_rq *rt_rq;
 	s64 delta_exec;

 	if (donor->sched_class != &rt_sched_class)
@@ -520,21 +537,32 @@ static void update_curr_rt(struct rq *rq)
 	if (unlikely(delta_exec <= 0))
 		return;

-	if (!rt_bandwidth_enabled())
+	if (!rt_group_sched_enabled())
+		return;
+
+	if (!dl_bandwidth_enabled())
 		return;
+
+	rt_rq = rt_rq_of_se(&donor->rt);
+	if (is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		dl_server_update(dl_se, delta_exec);
+	}
 }

 static void
 inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 {
-	struct rq *rq = rq_of_rt_rq(rt_rq);
+	struct rq *rq;

 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
+	if (is_dl_group(rt_rq))
 		return;

+	rq = rq_of_rt_rq(rt_rq);
 	if (rq->online && prio < prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
 }
@@ -542,14 +570,15 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 static void
 dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 {
-	struct rq *rq = rq_of_rt_rq(rt_rq);
+	struct rq *rq;

 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
+	if (is_dl_group(rt_rq))
 		return;

+	rq = rq_of_rt_rq(rt_rq);
 	if (rq->online && rt_rq->highest_prio.curr != prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
 }
@@ -610,6 +639,15 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	rt_rq->rr_nr_running += is_rr_task(rt_se);

 	inc_rt_prio(rt_rq, rt_se_prio(rt_se));
+
+	if (is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		if (!dl_se->dl_throttled)
+			add_nr_running(global_rq_of_rt_rq(rt_rq), 1);
+	}
+
+	add_nr_running(rq_of_rt_rq(rt_rq), 1);
 }

 static inline
@@ -620,6 +658,15 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	rt_rq->rr_nr_running -= is_rr_task(rt_se);

 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
+
+	if (is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		if (!dl_se->dl_throttled)
+			sub_nr_running(global_rq_of_rt_rq(rt_rq), 1);
+	}
+
+	sub_nr_running(rq_of_rt_rq(rt_rq), 1);
 }

 /*
@@ -815,6 +862,13 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	check_schedstat_required();
 	update_stats_wait_start_rt(rt_rq_of_se(rt_se), rt_se);

+	/* Task arriving in an idle group of tasks. */
+	if (is_dl_group(rt_rq) && rt_rq->rt_nr_running == 0) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		dl_server_start(dl_se);
+	}
+
 	enqueue_rt_entity(rt_se, flags);

 	if (task_is_blocked(p))
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b55ce13412d6..0166e75c7733 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2427,15 +2427,12 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
 #endif

 #ifdef CONFIG_RT_GROUP_SCHED
-	/*
-	 * p->rt.rt_rq is NULL initially and it is easier to assign
-	 * root_task_group's rt_rq than switching in rt_rq_of_se()
-	 * Clobbers tg(!)
-	 */
 	if (!rt_group_sched_enabled())
 		tg = &root_task_group;
-	p->rt.rt_rq  = tg->rt_rq[cpu];
-	p->rt.parent = tg->rt_se[cpu];
+
+	guard(raw_spinlock_irqsave)(&tg->dl_bandwidth.dl_runtime_lock);
+	p->rt.rt_rq  = tg->dl_bandwidth.active_context->rt_rq[cpu];
+	p->dl.dl_rq  = &cpu_rq(cpu)->dl;
 #endif /* CONFIG_RT_GROUP_SCHED */
 }

@@ -3116,6 +3113,9 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 	unsigned prev_nr = rq->nr_running;

 	rq->nr_running = prev_nr + count;
+	if (rq != cpu_rq(rq->cpu))
+		return;
+
 	if (trace_sched_update_nr_running_tp_enabled()) {
 		call_trace_sched_update_nr_running(rq, count);
 	}
@@ -3129,6 +3129,9 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 static inline void sub_nr_running(struct rq *rq, unsigned count)
 {
 	rq->nr_running -= count;
+	if (rq != cpu_rq(rq->cpu))
+		return;
+
 	if (trace_sched_update_nr_running_tp_enabled()) {
 		call_trace_sched_update_nr_running(rq, -count);
 	}
--
2.56.0


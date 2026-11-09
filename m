Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242216;
	b=oxL5EIpb6J8+BruaS33RW2KLwwW18O+W2tLZueZ2QN/SQquEiV6RtSOhpsvVY0eL1C+q
	 7JczoTSMi32zymgChXwryg9CD7wTDpCxXfMyj5IFGk4JDforwIeDdCsphiTqnbr+ZpGo/
	 9+m+pMwaW60g6IMVBsjI+FMeaztdm0mLlVJUY5Ox8I8yBTI1WcX4OX5oHybwADyXUjEF+
	 EzfDGzs7KMqUf04G/zDvL2FHgTZC+ckBIVnxeHaVzsYEGkWQv5mxS2N0IAn83ucBR3Z1f
	 J9xrvuGmI01YmzUkclr2Mf+qh9kQ6bJnQM5RNP830YE3BBw36ewyHTGHJ+lhJCpO5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KcIjo2huR4gFwGnFpf64WoFNBDsnsdPcDg9Gewk+Kmg=;
	b=hYcPfF9/sZ6BcR15TnYcZxih47/M+iwGqB6zPv0YDtCwaav1cXXJBcTAHIfN0uxr787E
	 FvaICvX31dnws1o0gUe1nmbBC+VZGf2onHYo6rFHJDLquUG8i3Yqa1kCi3WVNoe6ssbg+
	 cZblWJdCVu2yjjs0jql3A0jnsY6O3Je5lqc3WEeq17IkFdZIeIBEGdmrBAg3/0+n6w7Hl
	 uN/S6spYf+ICI5TsHAtEVVctMnF13H/JpQnN/bdlELS/NFcqZH+c96rPWpk0FGjI7JyzR
	 1XOb0fyk30YjlxkAMd8al7s3/+mSkYH5Z6aexEiYwBTRDXXrr1oPfvtcWH9AUB4FOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mNidKtF4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B326073648
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B326073648
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mNidKtF4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8735075e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242215; x=1794847015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcIjo2huR4gFwGnFpf64WoFNBDsnsdPcDg9Gewk+Kmg=;
        b=mNidKtF48zgO+YCbrgnhMwgek8M9YQFCr43AGDT7GmGLvxNAV+sAap7bvqx9qZRpyc
         qfq5X2h4swn8zwYZIBppu50VkduStIaexbjdTko+RytF6O4Ot6jo/tWVD0YdfVdsSVc3
         XAX8a/LbhJn5ctZYeXNL2XpW5BC2KOmCl0uqfu1nFsgDlNFGqYy+ZqPJE/pfIfDb348E
         Ss4k6vflYyykqTbNHvrjjY9xvkfK5NRaRli0ft012bAqwea31JhewInlFR+nes7r2twZ
         ftvXoCB4ZP4JGNDc1hH3wj/0C1AFq4u+Lvjrt+JW3HvoOFlhMSeqgJqxAb4zB085crHV
         c39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242215; x=1794847015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcIjo2huR4gFwGnFpf64WoFNBDsnsdPcDg9Gewk+Kmg=;
        b=fmKX4cc+a+dgzZW2OGb8IDPeqaDZPXCFCS1Ze9pwKYFvhPrDgBHCU5mJVUZeAMFpFU
         LeZZTSQL9jdNO8SWCmdbos+K77ewWgiUAxp0FGW4yy4sQjzQFpSISykwHtrxVkGWhBX5
         8vizYD+BHoUeWtJ3y9Pgh7c58bh9ciiu+EQ1Z9mXjbzHgXAV9dMh7K3oBKpp88Lx23hc
         1fWFFiJufFcOteWY3zgxXt8t2HqK8xkVRzSDeVGBwUnJz2cEJLOVhhaioPll0P+r5rVH
         p/mt6vDZrdgR0KbGHlgy9Xo1GRX1yMUhHFCeJb8JODvcjxviahlrjJIrjvPqYlZkz5L3
         nAFA==
X-Forwarded-Encrypted: i=1; AL+hErHc2A6dxYzuUegXRxWSzHK2wN+OrAtwXf8ce910E3KOys1urekscHT2sTHD1UrlwehVtBRkMjR5lyod148=@vger.kernel.org
X-Gm-Message-State: APuU4Z8um2/DjcSZkHBRG1K0lmXC2436+Jigdkb47AGvqNnuDVuvRoSg
	7hS7QCQLfJtDwmhS0bxcRqNpi3TAa789jIrEgVSYSbxOEB2B+IDsb9R3
X-Gm-Gg: AYBFou0qflfA+HYCkDNvHLkdv/zIRI7VqXw4TWG4LSRv15j2nssuyOn+EAccENtAhc6
	z4H7qldWi8MBBPfu4l1f6Jo5loAWYgEXQbnJg4HhOTyBbD6I589PEIGZNujp2kCV8JL5/ZC528U
	3dHmP3qsZtWLCALOvd0P4Yy2MDNqFRCKz9EwXz5ps3zFfV6ev0NyhT+kWx0IpTVvdCrhiv/7HqA
	7JUvAKJXNe+DNb6lXWmwGY9AcXdVHYCD4vENXwn1VDqD+QLmti1e17iY8bLgl8L/HP0lM5XBQUe
	RmHw+2neEoQ5EqDEbD/fG7UVMpuF2MXf/RrW/c6JjCPmpR1yLPM9smouPTQytkZHobotmG2GuPt
	f30XjuEMrdYVwydzLGFS0uYqlYuWM/bvH7iwtVwfsqzCU5u+lqRJ9dkJMw0TvjWKUhOHMZShK7k
	otARX+hnf15KGy1+kzJ1do8TQnEUJ0p3oXStBDYld8jBkk9rNcwG4LLAHj1DxmPRg/8VwltsCZT
	jFv9LMH2/0ro+2d/WSifmu5YtBPY8f2tBhHg/nMHcGiTJ2810cWoQBUyQYd/Rz3/DPjog9Se/ye
	XAb9iP1vH2lSXvsgA5j5Sfn99lCp6rz4fuY9R6taEyjcuXA=
X-Received: by 2002:a05:600c:811b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4b963c6d1c8mr76438335e9.22.1794242214867;
        Mon, 09 Nov 2026 08:36:54 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:54 -0800 (PST)
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
Subject: [RFC PATCH v7 20/29] sched/rt: Hook HCBS migration functions
Date: Mon,  9 Nov 2026 17:36:06 +0100
Message-ID: <20261109163616.195264-21-yurand2000@gmail.com>
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

Hook rt-cgroup migration functions:

- select_task_rt_rq
  Always return the cpu where the task is scheduled.
- balance_rt
- put_prev_task_rt
  If a server is throttled, put_prev_task_rt is invoked and a push is
  necessary so that the task can keep running on another server if possible.
- switched_to_rt
  Keep track of the deadline server that is assigned to the task switching
  to FIFO/RR priority.

Set rt-cgroups runqueues to online to allow balancing in balance_rt.

Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Co-developed-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/rt.c | 42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 0b7c36f8acdc..9d95cf5fd520 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -266,6 +266,7 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 
 		init_rt_rq(&s_rq->rt);
 		s_rq->cpu = i;
+		s_rq->online = 1;
 		s_rq->rt.tg = tg;
 
 		init_dl_entity(dl_se);
@@ -1017,6 +1018,10 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 	struct rq *rq;
 	bool test;
 
+	/* Just return the task_cpu for processes inside task groups */
+	if (is_dl_group(rt_rq_of_se(&p->rt)))
+		goto out;
+
 	/* For anything but wake ups, just return the task_cpu */
 	if (!(flags & (WF_TTWU | WF_FORK)))
 		goto out;
@@ -1106,27 +1111,30 @@ static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 	resched_curr(rq);
 }
 
-static int balance_rt(struct rq *rq, struct rq_flags *rf)
+static int balance_rt(struct rq *global_rq, struct rq_flags *rf)
 {
 	/*
 	 * Note, rq->donor may change during rq lock drops,
 	 * so don't re-use p across lock drops
 	 */
-	struct task_struct *p = rq->donor;
+	struct task_struct *p = global_rq->donor;
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
 
-	if (!on_rt_rq(&p->rt) && need_pull_rt_task(rq, p)) {
+	if (!on_rt_rq(&p->rt) && need_pull_rt_task(rq_of_rt_rq(rt_rq), p)) {
 		/*
 		 * This is OK, because current is on_cpu, which avoids it being
 		 * picked for load-balance and preemption/IRQs are still
 		 * disabled avoiding further scheduler activity on it and we've
 		 * not yet started the picking loop.
 		 */
-		rq_unpin_lock(rq, rf);
-		pull_rt_rq_task(&rq->rt);
-		rq_repin_lock(rq, rf);
+		rq_unpin_lock(global_rq, rf);
+		pull_rt_rq_task(rt_rq);
+		rq_repin_lock(global_rq, rf);
 	}
 
-	return sched_stop_runnable(rq) || sched_dl_runnable(rq) || sched_rt_runnable(rq);
+	return sched_stop_runnable(global_rq) ||
+	       sched_dl_runnable(global_rq) ||
+	       sched_rt_runnable(global_rq);
 }
 
 /*
@@ -1293,6 +1301,13 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 	 */
 	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
 		enqueue_pushable_task(rt_rq, p);
+
+	if (is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		if (dl_se->dl_throttled)
+			rt_queue_push_tasks(rt_rq);
+	}
 }
 
 /* Only try algorithms three times */
@@ -2110,12 +2125,21 @@ static void switching_to_rt(struct rq *rq, struct task_struct *p) {}
  */
 static void switched_to_rt(struct rq *rq, struct task_struct *p)
 {
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
+
 	/*
 	 * If we are running, update the avg_rt tracking, as the running time
 	 * will now on be accounted into the latter.
 	 */
 	if (task_current(rq, p)) {
 		update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 0);
+
+		if (is_dl_group(rt_rq)) {
+			struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+			p->dl_server = dl_se;
+		}
+
 		return;
 	}
 
@@ -2125,8 +2149,8 @@ static void switched_to_rt(struct rq *rq, struct task_struct *p)
 	 * then see if we can move to another run queue.
 	 */
 	if (task_on_rq_queued(p)) {
-		if (p->nr_cpus_allowed > 1 && rt_rq_of_se(&p->rt)->overloaded)
-			rt_queue_push_tasks(rt_rq_of_se(&p->rt));
+		if (p->nr_cpus_allowed > 1 && rt_rq->overloaded)
+			rt_queue_push_tasks(rt_rq);
 
 		if (p->prio < rq->donor->prio && cpu_online(cpu_of(rq)))
 			resched_curr(rq);
-- 
2.56.0


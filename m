Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7D4F55DD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955925; cv=none; b=urGS3svFBAQfUR0KcSw7BGNnycmLPrsIHA8epaljs6L5nMnyYIM/+0xNIRzKSGLXWClMutKcTYliKagyfHjq+5ibldk82GkN2eH+T1Xz45CWLfyKuXixoR0YRg3p9KUC2YVFVgfmnsxcvioSKImC148hLX1fVDqq6bvSXvueRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955925; c=relaxed/simple;
	bh=g8ii3PyBa0GiHh/9S+lqpPXalszN2DsJKkDUpSbsdmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S64cE6h7Oe+dvvgoY8DEGtGUubcNazU1CegiccrUEbCbRDxxIe5lCufDnr2kBQJuqpg0eQCw5wYs/3nFGdS4vcgo69XHpmeTPGvuhbP+1AQrLxy8vMUE8GjE4cxbT+9kYj/Wmynxs4KECVq8hGrLF646W3Jf7D+x5wT+uV31Gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCt63O+h; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCt63O+h"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so171795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955917; x=1791560717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEo/LxwFi1EqrOkkcTTlEnXPhiZDemt/Tt2IhYFOTaI=;
        b=oCt63O+hGo7Ys7L58ABzIznQdFa1xPVXIVtaNv8aeEwxK5n6ff+zXBZnvp93ldnYqR
         327ehEAhnwGXUQpzckSSLYkzHXjgoUjLpYM5ILJlTfwmTmwVYhG8whjRevf2TZp36PWB
         zrAqgyDScubLuKiZ7BAG0m7nHm4M/XB98ViXAjeE1vC0nlBPmt19l0lyXO2k/Rw5IbOv
         yGHQUfibLhaQCOmYFW20Kb38SJDHYb+vlycDPD0dvC/t6Vx7vPtL3sYya4DWwhoFuh14
         jQftif9Sm1q1c2cYtVWlhsfpXVIbcbLHxZF8gkIcc2G9lOQMkWAmyaHu3DK/14pckp5D
         Fobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955917; x=1791560717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEo/LxwFi1EqrOkkcTTlEnXPhiZDemt/Tt2IhYFOTaI=;
        b=xqzQXiRxColkab56Py3sbNvUTDkTbC7o9inUh7Qh0Qrts5zG01RXdAibNdZfevQfbZ
         7UTZzVJJWqJWzCMlUcWpAgKqn+P53/daRHrxm1hhyWmOHQM0g+8OSqv7uhnt26mBqFdL
         y78NROTQwDW+067jc214PXwHihfv5B1kvSflFV53MhfGyczBqRBZL7OKimr943lrnctA
         teIT9mgkXQeP0SnukIKIr2H0ccqdp+AOILp9DNnSuVQoW42ACoM7h9XfdLw3sXfbi5Cq
         LUfyHmmFRqSyStsze+0bJOBFNGJ+hDc+JPAcPvmxBavKsYx6MgviQ71ldehPNt1X/mPj
         Ulgg==
X-Forwarded-Encrypted: i=1; AKwUvByR/zVzA84h/KbF/hwoBGdMIqqEWGiL+7CN12+q2z/FoFzM74UQyegk9iMZBHk94gaQWg40hX4gdQIWf/I=@vger.kernel.org
X-Gm-Message-State: AFuF++nFVBtGyRfSMPGCvdC8E7m8OXNw0GuvVE/4P6TaeFNCdrpf0oe1
	DYtxJuiE4AuM88pm4Kt/Y1h1ug/AJhq3PWNC5WVN2J/UlhrJC6ncJfoeNwosHTRRORs=
X-Gm-Gg: AYBFou2CqTelXubSwIZPuO/7KRmde9KAzoPFRwwdcOrenVlrOS4Lzt/NfgQekJ7dPH7
	C/pD84d+msYK93eX+itN1eniBTT6IV1Z0EkUOOMvpwnaPq44LKEpGG9UyF/S2CiI1Irl82TgPet
	YnQUYLbDxXP7DpiFS3ITtalXFCxg1NzzMIpcYOPhkAlWyWZs/fWjKDz0kTqUqnupiP5AGR6zs+I
	0xsSNk+kycbphPCXmB+48cxeSm97VLDyPFGmSK/8NphbzO5GB810RFiflTjnhwAyS4HeTVfWliB
	pm2o6Z68Oj/kn537JewT0+n5/v3+BJCBIg1fSMjrFB+yN79DChvYz13/ffz/7bafZCRDsX9v0ZS
	lloLxcLy1wBhJ5iiryk6AzyPNYvXeAcqKhMn9IMDj8Y2nkhsA8YuO/f5jJX1p7Y5v7EROaFMC7f
	Gpfu0oJk7lQiTWdMBF+PTBEH3rXNYEZJW6yGx1s1F16b+wvwhH095C7urOY2tOiG5tBkAADMfLL
	bkont/PKtvPf//F8sPPEwri6jI=
X-Received: by 2002:a05:600c:4ecf:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-4a0276c616bmr60045805e9.34.1790955915970;
        Fri, 02 Oct 2026 08:45:15 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:15 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 09/18 v2] sched/core: Add rq flag to tick parameters
Date: Fri,  2 Oct 2026 17:44:06 +0200
Message-ID: <20261002154415.2270586-10-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to force migration in tick, we need to unlock the rq

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c      | 6 +++---
 kernel/sched/deadline.c  | 2 +-
 kernel/sched/ext/ext.c   | 2 +-
 kernel/sched/fair.c      | 2 +-
 kernel/sched/idle.c      | 2 +-
 kernel/sched/rt.c        | 2 +-
 kernel/sched/sched.h     | 2 +-
 kernel/sched/stop_task.c | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 837dc74c9a8d..1e34c8fdbee8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -923,7 +923,7 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
-	rq->donor->sched_class->task_tick(rq, rq->donor, 1);
+	rq->donor->sched_class->task_tick(rq, rq->donor, &rf, 1);
 	rq_unlock(rq, &rf);
 
 	return HRTIMER_NORESTART;
@@ -5800,7 +5800,7 @@ void sched_tick(void)
 	if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
 		resched_curr(rq);
 
-	donor->sched_class->task_tick(rq, donor, 0);
+	donor->sched_class->task_tick(rq, donor, &rf, 0);
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
@@ -5896,7 +5896,7 @@ static void sched_tick_remote(struct work_struct *work)
 				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
-			curr->sched_class->task_tick(rq, curr, 0);
+			curr->sched_class->task_tick(rq, curr, NULL, 0);
 
 			calc_load_nohz_remote(rq);
 		}
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..1f6bc63b3110 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2879,7 +2879,7 @@ static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_s
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_dl(struct rq *rq, struct task_struct *p, struct rq_flags *rf, int queued)
 {
 	update_curr_dl(rq);
 
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 53275bc7c029..cdf48af9f05e 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3790,7 +3790,7 @@ void scx_tick(struct rq *rq)
 	update_other_load_avgs(rq);
 }
 
-static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_scx(struct rq *rq, struct task_struct *curr, struct rq_flags *rf, int queued)
 {
 	struct scx_sched *sch = scx_task_sched(curr);
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6ba2efeba435..483ed5807dfc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15346,7 +15346,7 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_fair(struct rq *rq, struct task_struct *curr, struct rq_flags *rf, int queued)
 {
 	struct sched_entity *se = &curr->se;
 
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 76f3c84ca684..1ba0303aacb4 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -538,7 +538,7 @@ dequeue_task_idle(struct rq *rq, struct task_struct *p, int flags)
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_idle(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_idle(struct rq *rq, struct task_struct *curr, struct rq_flags *rf, int queued)
 {
 	update_curr_idle(rq);
 }
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..35b3831a72cf 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2541,7 +2541,7 @@ static inline void watchdog(struct rq *rq, struct task_struct *p) { }
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_rt(struct rq *rq, struct task_struct *p, struct rq_flags *rf, int queued)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 293f23620282..c1d7e04d2899 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2741,7 +2741,7 @@ struct sched_class {
 	 * sched_tick: rq->lock
 	 * sched_tick_remote: rq->lock
 	 */
-	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
+	void (*task_tick)(struct rq *rq, struct task_struct *p, struct rq_flags *rf, int queued);
 	/*
 	 * sched_cgroup_fork: p->pi_lock
 	 */
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 1e0109ec36b3..3d99b23afd89 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -74,7 +74,7 @@ static void put_prev_task_stop(struct rq *rq, struct task_struct *prev, struct t
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_stop(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_stop(struct rq *rq, struct task_struct *curr, struct rq_flags *rf, int queued)
 {
 }
 
-- 
2.53.0


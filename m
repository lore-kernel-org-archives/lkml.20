Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978403;
	b=AEZCpuIYq5hBuOO5Nc7GqP55K1XI43LpR7EpPUeWnYGlyXP9h5v0Ty6XMhWrYycrvHW+
	 d9ASxDjvSK7etbXQMAmi6nehfUkioAzUhrRQVAvGYJp8i5JxfLW+c7Doko46COwp52c65
	 Uu+dImUErGlmRFqhR9JoOGk1BwHY2atQGIBa8nDi6l8JVwVwf//DdrwiHT/M6dLWI0WCF
	 vFqET8w3trQd6S8vWvLg7KffbvrXtd/Dqkver8LUQWI19GdNZp+nlNwfNbUMZln8Qy6Se
	 E71Zqs63WcGVTdGI380OWHBBm8TWqn2Z/dGET9/pNQlya85lUZW4juug1EHiwa5dB8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Pf+5maXqpAz569Db8vuW9XhpxdXWCoWb3bAlNcqK4w=;
	b=fx8qQk2jNMdujHg7j+s2psOwsZux2BFE0X/E9MOkN+JIXadguH2gLI+jczPBfNlwBfEN
	 rC+uUikmPiwyufBojiFk/QJNsJgR6RuJekb625AbQb5rNeh5MJ26EQXo4rerIDWPo9SUt
	 mqZqcziokBgnkGh31UQlRmewYDU67yNwPqi3jvvOGd6hiUikOfo/Pf4yHH9DulV/zhBV6
	 rfOBC6khSqVafLrG6H0A5QtCBDEwt37zLzS/dKmIowNMA2FPPjD41DVJxk3JETrVj4dM2
	 YAVtwKS1jqr02FUFEgVcpZYZCm3QpYy58WexJuVt9gAQPhJN1MMN5oidDIxsoKb2dSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t7SyoZBI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F49606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t7SyoZBI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6428055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978400; x=1794583200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Pf+5maXqpAz569Db8vuW9XhpxdXWCoWb3bAlNcqK4w=;
        b=t7SyoZBIBoZFNXuyn5yZTnUuz98ANHEto6OEXdHoXX5qKE6pG5n2Sp1ufGGychaXgR
         mFMLOL8xHq1i6qzBjW9mkHtESYxBi1uJF+goREKFJJZE1fEmzMwt6dxk8HUUuZ7Rjk6o
         h7gIXbvjMhzPPTEKFY0O2A1giNPU4+so8IYk2WMVDsT1G4TI7NujitUx++lz7/t1xw7/
         ulbnckEfFh6Nlc4665cymU14v/60bl6lQmRvoiOgW0xEz4p99sR9kLB2bfBwD9QlqRsG
         pR+yEO71NDrjBxak0ssKcPl9nmG4RbnwTIjBttOlrr2jNKMJrfWCFLVDsQNmRyPO6BiD
         LIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978400; x=1794583200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Pf+5maXqpAz569Db8vuW9XhpxdXWCoWb3bAlNcqK4w=;
        b=ZpRfggXe5fuEZ/fPXhkwhRvgEEVSbVvzW1EbJJiYjTUFaDWs3L4NNpEfwteGlktBgi
         nosLbQNLDKo6vxo3SSFGc/io66yJ/BUM5kO6qFYDO6vTDD1DeltGSv78E4o7y5qcuuMM
         raPaCxhj9i08VKHsmaPIZQ34cNI5mzhIVHqTxfA5vWBbzIRn+sRQAz1u2ar+k6p+OmSA
         8aujtKOJLtV/Z78xquqSv1C+rHim6bxtne2P9F3PpsQSASAyzWTmJrCtC0/Y10xTNTXI
         D1Q+usRTcue/xdgfSkgqJcHGRnhzfUTFXAA0gydcrb8pYtNTtZ6oRz1E63NRQB78IgZV
         RqrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRfG0Ym0/HstM9iI9taHKm30MpFgSmHbM5YMBee++RMHGrjPSQP/X0DSz/R1yrPUAIxODljMWL1cot/D4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hNJNFk1dewwr+WagHZfnNeogfwIcxd1/gMe5hAualJ15mpVFm
	L3PTjzIqWLH4nrvr5Fjm7fQftK+V465hQUpN+gSH17WVOjPKUyz7NKXYCZaCjusTzZw=
X-Gm-Gg: AYBFou07iJrJNELWoCTA0mfycBGdLvzxkbs6P3MqYgTXLBSTOhHwa3/jUD7uGG6AeQx
	lpQ+41fokHy0692fEwz1wsjtK3SV8iclQfj4VCWg+TTElMhKRCkzbOI+jzZsn0YyLr6g+7q6ilC
	kU7wf0XveLvIq8INyHq6uccLZb024AYUtODPjw5c5Hy0Jc3CLb15VOdfMr8EHLfl9fRK5Tdde1S
	5zkjzNbzBLcctjgZzY366VELNjwiM4qoqQwIInPQrxzh2djpX8OEMoisClFk4jV2qg76aEu9bHy
	x3PBlb66Szfs66QooEjJHMmqAXEO2l6AIyuR15xaKgWLN0Rm5NxkrwedwkurakJL1HGf63XCK/N
	lB0ahTSrCVU0EjU0pK9IAHbKILT7pCPTUHBsDUuf0XMe8oEfQj7z0+1Hpt1yN3EMwdfSQLrcszz
	/u7K93oTYu/T3F7X7utDVUySiDP2riNUSnUN0+ZJ5YcfSojmucvS/G2oqcsH1GyWHjXfsyREBEN
	PCxWYPkUDd6DP9l0OS9h/vJSvXmNp8EuBfjFdCMRtzjw6GQsmp4o5OvEw/x9qP8F97sQKhORGM0
	g+edF0OP5ybM1MVQxiaTBShvmhBJ/n7K77vbolzU8GNijFk=
X-Received: by 2002:a05:600c:5294:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4b6dc40027cmr50426165e9.3.1793978400357;
        Fri, 06 Nov 2026 07:20:00 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:59 -0800 (PST)
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
	kayracizmeci@gmail.com,
	tim.c.chen@linux.intel.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting CPU
Date: Fri,  6 Nov 2026 16:19:33 +0100
Message-ID: <20261106151947.3991524-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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

Add a new level for selecting CPU when select_task_rq_fair() fails to find
an idle CPU. This last level compares the min slice to select a CPU where
the task could run 1st.
This helps a waking task to select a CPU where a longer slice runs
instead of one where a task with the same or shorter slice already runs.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c |   2 +-
 kernel/sched/fair.c | 157 ++++++++++++++++++++++++++++----------------
 2 files changed, 102 insertions(+), 57 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 031efe7d49fb..d71da9069218 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9012,7 +9012,7 @@ void __init sched_init(void)
 		rq->sd = NULL;
 		rq->rd = NULL;
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
-		rq->min_slice = ULONG_MAX;
+		rq->min_slice = 0;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
 		rq->next_balance = jiffies;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc99b94d9ce..039dce244aaa 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8842,11 +8842,25 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
 	return new_cpu;
 }
 
-static inline int __select_idle_cpu(int cpu, struct task_struct *p)
+static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
 {
-	if (choose_idle_cpu(cpu, p) && sched_cpu_cookie_match(cpu_rq(cpu), p))
+	if (p->se.slice < get_rq_min_slice(rq))
+		return true;
+
+	return false;
+}
+
+static inline int __select_idle_cpu(int cpu, struct task_struct *p, int *slice_cpu)
+{
+	if (!sched_cpu_cookie_match(cpu_rq(cpu), p))
+		return -1;
+
+	if (choose_idle_cpu(cpu, p))
 		return cpu;
 
+	if (*slice_cpu == -1 && choose_sched_slice_rq(cpu_rq(cpu), p))
+		*slice_cpu = cpu;
+
 	return -1;
 }
 
@@ -8937,7 +8951,8 @@ void __update_idle_core(struct rq *rq)
  * sd_balance_shared->has_idle_cores and enabled through update_idle_core()
  * above.
  */
-static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpus, int *idle_cpu)
+static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpus,
+			    int *idle_cpu, int *slice_cpu)
 {
 	bool idle = true;
 	int cpu;
@@ -8946,11 +8961,18 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
 		if (!available_idle_cpu(cpu)) {
 			idle = false;
 			if (*idle_cpu == -1) {
-				if (choose_sched_idle_rq(cpu_rq(cpu), p) &&
-				    cpumask_test_cpu(cpu, cpus)) {
+				if (!cpumask_test_cpu(cpu, cpus))
+					continue;
+
+				if (choose_sched_idle_rq(cpu_rq(cpu), p)) {
 					*idle_cpu = cpu;
 					break;
 				}
+
+				if (*slice_cpu == -1 &&
+				    choose_sched_slice_rq(cpu_rq(cpu), p))
+					*slice_cpu = cpu;
+
 				continue;
 			}
 			break;
@@ -8994,10 +9016,11 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
  * comparing the average scan cost (tracked in sd->avg_scan_cost) against the
  * average idle time for this rq (as found in rq->avg_idle).
  */
-static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int target)
+static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd,
+			   bool has_idle_core, int *best)
 {
 	struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
-	int i, cpu, idle_cpu = -1, nr = INT_MAX;
+	int i, cpu, idle_cpu = -1, slice_cpu = -1, target = *best, nr = INT_MAX;
 
 	if (sched_feat(SIS_UTIL) && sd->shared) {
 		/*
@@ -9027,13 +9050,13 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 					continue;
 
 				if (has_idle_core) {
-					i = select_idle_core(p, cpu, cpus, &idle_cpu);
+					i = select_idle_core(p, cpu, cpus, &idle_cpu, &slice_cpu);
 					if ((unsigned int)i < nr_cpumask_bits)
 						return i;
 				} else {
 					if (--nr <= 0)
-						return -1;
-					idle_cpu = __select_idle_cpu(cpu, p);
+						goto abort_idle_cpu;
+					idle_cpu = __select_idle_cpu(cpu, p, &slice_cpu);
 					if ((unsigned int)idle_cpu < nr_cpumask_bits)
 						return idle_cpu;
 				}
@@ -9044,14 +9067,14 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 
 	for_each_cpu_wrap(cpu, cpus, target + 1) {
 		if (has_idle_core) {
-			i = select_idle_core(p, cpu, cpus, &idle_cpu);
+			i = select_idle_core(p, cpu, cpus, &idle_cpu, &slice_cpu);
 			if ((unsigned int)i < nr_cpumask_bits)
 				return i;
 
 		} else {
 			if (--nr <= 0)
-				return -1;
-			idle_cpu = __select_idle_cpu(cpu, p);
+				goto abort_idle_cpu;
+			idle_cpu = __select_idle_cpu(cpu, p, &slice_cpu);
 			if ((unsigned int)idle_cpu < nr_cpumask_bits)
 				break;
 		}
@@ -9060,6 +9083,10 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 	if (has_idle_core)
 		set_idle_cores(target, false);
 
+abort_idle_cpu:
+	if (idle_cpu == -1 && !choose_sched_slice_rq(cpu_rq(target), p) && slice_cpu != -1)
+		*best = slice_cpu;
+
 	return idle_cpu;
 }
 
@@ -9074,16 +9101,21 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
  *
  *   Rank                            Val  Tier    Meaning
  *   ------------------------------  ---  ------  ---------------------------
- *   ASYM_IDLE_UCLAMP_MISFIT         -4   core    Idle core; capacity fits
+ *   ASYM_BUSY_FITS                  -6   core    Busy core but capacity fits
+ *						  and task can preempt current.
+ *   ASYM_IDLE_UCLAMP_MISFIT         -5   core    Idle core; capacity fits
  *                                                util but uclamp_min misses.
- *   ASYM_IDLE_COMPLETE_MISFIT       -3   core    Idle core; capacity does
+ *   ASYM_IDLE_COMPLETE_MISFIT       -4   core    Idle core; capacity does
  *                                                not fit. Still beats every
  *                                                thread-tier rank: a busy
  *                                                sibling cuts effective
  *                                                capacity more than a
  *                                                misfit hurts a quiet core.
- *   ASYM_IDLE_THREAD_FITS           -2   thread  Busy SMT sibling; capacity
+ *   ASYM_IDLE_THREAD_FITS           -3   thread  Busy SMT sibling; capacity
  *                                                fits util + uclamp.
+ *   ASYM_BUSY_THREAD_FITS           -2   thread  Busy CPU and SMT sibling but
+ *						  capacity fits and task can
+ *						  preempt current.
  *   ASYM_IDLE_THREAD_UCLAMP_MISFIT  -1   thread  Busy SMT sibling; capacity
  *                                                fits but uclamp_min misses
  *                                                (native util_fits_cpu()
@@ -9091,24 +9123,26 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
  *   ASYM_IDLE_THREAD_MISFIT          0   thread  Busy SMT sibling; capacity
  *                                                does not fit.
  *
- * ASYM_IDLE_CORE_BIAS (-3) is an offset, not a state. On an idle core,
+ * ASYM_IDLE_CORE_BIAS (-4) is an offset, not a state. On an idle core,
  * fits += ASYM_IDLE_CORE_BIAS rebases thread-tier ranks into the core tier:
  *
- *   ASYM_IDLE_THREAD_UCLAMP_MISFIT (-1) + BIAS -> ASYM_IDLE_UCLAMP_MISFIT   (-4)
- *   ASYM_IDLE_THREAD_MISFIT         (0) + BIAS -> ASYM_IDLE_COMPLETE_MISFIT (-3)
+ *   ASYM_IDLE_THREAD_UCLAMP_MISFIT (-1) + BIAS -> ASYM_IDLE_UCLAMP_MISFIT   (-5)
+ *   ASYM_IDLE_THREAD_MISFIT         (0) + BIAS -> ASYM_IDLE_COMPLETE_MISFIT (-4)
  *
- * ASYM_IDLE_THREAD_FITS (-2) is never rebased because a fully-fitting idle-core
+ * ASYM_IDLE_THREAD_FITS (-3) is never rebased because a fully-fitting idle-core
  * candidate early-returns from select_idle_capacity().
  */
 enum asym_fits_state {
-	ASYM_IDLE_UCLAMP_MISFIT = -4,
+	ASYM_BUSY_FITS = -6,
+	ASYM_IDLE_UCLAMP_MISFIT,
 	ASYM_IDLE_COMPLETE_MISFIT,
 	ASYM_IDLE_THREAD_FITS,
+	ASYM_BUSY_THREAD_FITS,
 	ASYM_IDLE_THREAD_UCLAMP_MISFIT,
 	ASYM_IDLE_THREAD_MISFIT,
 
 	/* util_fits_cpu() bias for idle core */
-	ASYM_IDLE_CORE_BIAS = -3,
+	ASYM_IDLE_CORE_BIAS = -4,
 };
 
 /*
@@ -9127,6 +9161,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	bool has_idle_core = sched_smt_active() && test_idle_cores(target);
 	unsigned long task_util, util_min, util_max, best_cap = 0;
 	int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
+	unsigned long task_slice;
 	int cpu, best_cpu = -1;
 	struct cpumask *cpus;
 	int nr = INT_MAX;
@@ -9137,6 +9172,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	task_util = task_util_est(p);
 	util_min = uclamp_eff_value(p, UCLAMP_MIN);
 	util_max = uclamp_eff_value(p, UCLAMP_MAX);
+	task_slice = p->se.slice;
 
 	if (sched_feat(SIS_UTIL) && sd->shared) {
 		/*
@@ -9160,42 +9196,49 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 		if (!has_idle_core && --nr <= 0)
 			return best_cpu;
 
-		if (!choose_idle_cpu(cpu, p))
-			continue;
-
 		fits = util_fits_cpu(task_util, util_min, util_max, cpu);
 
-		/*
-		 * Perfect fit: capacity satisfies util + uclamp and the CPU
-		 * sits on a fully-idle SMT core, this is a !SMT system, or
-		 * there is no idle core to find.
-		 * Short-circuit the rank-based selection and return
-		 * immediately.
-		 */
-		if (fits > 0 && preferred_core)
-			return cpu;
-		/*
-		 * Only the min performance hint (i.e. uclamp_min) doesn't fit.
-		 * Look for the CPU with best capacity.
-		 */
-		else if (fits < 0)
+		if (choose_idle_cpu(cpu, p)) {
+			/*
+			 * Perfect fit: capacity satisfies util + uclamp and the CPU
+			 * sits on a fully-idle SMT core, this is a !SMT system, or
+			 * there is no idle core to find.
+			 * Short-circuit the rank-based selection and return
+			 * immediately.
+			 */
+			if (fits > 0 && preferred_core)
+				return cpu;
+			/*
+			 * Only the min performance hint (i.e. uclamp_min) doesn't fit.
+			 * Look for the CPU with best capacity.
+			 */
+			else if (fits < 0)
+				cpu_cap = get_actual_cpu_capacity(cpu);
+			/*
+			 * fits > 0 implies we are not on a preferred core, but the util
+			 * fits CPU capacity. Set fits to ASYM_IDLE_THREAD_FITS
+			 * so the effective range becomes
+			 * [ASYM_IDLE_THREAD_FITS, ASYM_IDLE_THREAD_MISFIT], where:
+			 *    ASYM_IDLE_THREAD_MISFIT - does not fit
+			 *    ASYM_IDLE_THREAD_UCLAMP_MISFIT - fits with the exception of UCLAMP_MIN
+			 *    ASYM_BUSY_THREAD_FITS - fits with the exception of idleness
+			 *			      but can preempt current
+			 *    ASYM_IDLE_THREAD_FITS - fits with the exception of preferred_core
+			 */
+			else if (fits > 0)
+				fits = ASYM_IDLE_THREAD_FITS;
+
+		} else if (fits > 0 && task_slice < get_rq_min_slice(cpu_rq(cpu))) {
+			fits = ASYM_BUSY_THREAD_FITS;
 			cpu_cap = get_actual_cpu_capacity(cpu);
-		/*
-		 * fits > 0 implies we are not on a preferred core, but the util
-		 * fits CPU capacity. Set fits to ASYM_IDLE_THREAD_FITS
-		 * so the effective range becomes
-		 * [ASYM_IDLE_THREAD_FITS, ASYM_IDLE_THREAD_MISFIT], where:
-		 *    ASYM_IDLE_THREAD_MISFIT - does not fit
-		 *    ASYM_IDLE_THREAD_UCLAMP_MISFIT - fits with the exception of UCLAMP_MIN
-		 *    ASYM_IDLE_THREAD_FITS - fits with the exception of preferred_core
-		 */
-		else if (fits > 0)
-			fits = ASYM_IDLE_THREAD_FITS;
+		} else {
+			continue;
+		}
 
 		/*
 		 * If we are on a preferred core, translate the range of fits
-		 * of [ASYM_IDLE_THREAD_UCLAMP_MISFIT, ASYM_IDLE_THREAD_MISFIT] to
-		 * [ASYM_IDLE_UCLAMP_MISFIT, ASYM_IDLE_COMPLETE_MISFIT].
+		 * of [ASYM_BUSY_THREAD_FITS, ASYM_IDLE_THREAD_MISFIT] to
+		 * [ASYM_BUSY_FITS, ASYM_IDLE_COMPLETE_MISFIT].
 		 * This ensures that an idle core is always given priority over
 		 * (partially) busy core.
 		 *
@@ -9219,15 +9262,17 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 
 	/*
 	 * A value in the [ASYM_IDLE_UCLAMP_MISFIT, ASYM_IDLE_COMPLETE_MISFIT]
-	 * range means the chosen CPU is in a fully idle SMT core. Values above
-	 * ASYM_IDLE_COMPLETE_MISFIT mean we never ranked such a CPU best.
+	 * range mean the chosen CPU is in a fully idle SMT core. Values
+	 * ASYM_BUSY_FITS or above ASYM_IDLE_COMPLETE_MISFIT mean we never
+	 * ranked such a CPU best.
 	 *
 	 * The asym-capacity wakeup path returns from select_idle_sibling()
 	 * after this function and never runs select_idle_cpu(), so the usual
 	 * select_idle_cpu() tail that clears idle cores must live here when the
 	 * idle-core preference did not win.
 	 */
-	if (has_idle_core && best_fits > ASYM_IDLE_COMPLETE_MISFIT)
+	if (has_idle_core && (best_fits > ASYM_IDLE_COMPLETE_MISFIT ||
+			      best_fits == ASYM_BUSY_FITS))
 		set_idle_cores(target, false);
 
 	return best_cpu;
@@ -9381,7 +9426,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		}
 	}
 
-	i = select_idle_cpu(p, sd, has_idle_core, target);
+	i = select_idle_cpu(p, sd, has_idle_core, &target);
 	if ((unsigned int)i < nr_cpumask_bits) {
 		target = i;
 		goto select_smt_priority;
-- 
2.53.0


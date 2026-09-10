Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFAE38F248
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=o08N7pxSLe9bVsycHYlowPoChKdVZmbg80pFX8D0tNrvz66+YVl+vTP7/OwF7D86+XJI7gw3E/aCOPXy3gAlLA6uQRKQhdqzPX1+Ufqhw/HG6jcNik9YmRmun7abWwt4SrAOE53VGXVz3PAQ7OF92PG3HLsQcuxtuMQWNkBm+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=7rqDzVbAOrvGHPe3+y17ORUypnLLrLSrXFuJ0eFrblU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jJ3Zuhv7R8QCWO9tRaXGBEmcKRETrS/XURv8dEqjLbJ2MNO2e68Ez999qwPmkTbG5nHQI5kO+KsxI+fZPinNTWbOKFf8/D7T8DswoKxWXuXUxRX5QXV+FI2LNai8HAb/Fzb7SpS5UxbWvS2i9Cs9IzRLfoLXZ/FRtQsAlcZdUx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ae3UiVv6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ae3UiVv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4t
	nSggQ8oN3baWQ2VgtsX9D1878Stv467Btkc2KmqxQ=; b=Ae3UiVv6U5La4d87WL
	HBy8D0gxOm+OZVpT9V9IA5EFBE9SjQiRM1i0s6JMRSWZjfS/rCFeL/nkpnDObxHL
	fOJVotGqNGBDGpkd4be3gg6dPdK3LCdeEwHaDSvxZ7/RmjQN0dRTjgXH1ZnUcZOk
	SmpWuuUFtZ2Ouww83hBkD5NyI=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S7;
	Thu, 10 Sep 2026 12:30:00 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Thu, 10 Sep 2026 12:29:45 +0800
Message-Id: <20260910042950.1619727-6-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF4DZF1rGr4UGr1rtFy3twb_yoW7Xr15pF
	4Fqw13trsrAw4Ivw1fCrs7Cr1Yv34rGw47Kr1fJF95Ca45Xryv9F1FgrnxXFyfCr1kZFyj
	qFW8Kr17CrWqvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDDGcUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wjh62qiMkiB6wAA39

The logic of select_task_rq_fair() is relatively complex, and on typical
embedded systems, the number of CPUs in sd_llc domain is often limited to
a maximum of 4, and sometimes only 2. This makes the complex logic of
select_task_rq_fair() seem less necessary. Additionally, the update logic
for the nr_idle_scan value that select_task_rq_fair() relies on is also
quite time-consuming.

Moreover, embedded systems require better real-time performance, and with
fewer CPUs available, it becomes necessary to bind certain tasks across
the sd_llc range. The default enabled feature, SD_WAKE_AFFINE, causes
select_task_rq_fair() to take the fast path, often overlooking some idle
CPUs across sd_llc domain, leading to increased scheduling latency.

To address this, we introduce the select_task_rq_fair_thin() function,
which serves as a streamlined version of select_task_rq_fair(). It can
quickly perform CPU selection while also considering the real-time
requirements of embedded systems. select_task_rq_fair_thin() retains the
priority selection logic for prev_cpu and recent_used_cpu, and it will
prioritize CPUs within the sd_llc. If there are no idle CPUs in the
sd_llc, it will then look for other available CPUs to run.

When the LB_PROMOTE feature is enabled, select_task_rq_fair_thin() will
replace the original select_task_rq_fair(), and the update logic for
nr_idle_scan that select_task_rq_fair() relies on will no longer need to
be executed.

Testing has shown that in our system with 18 CPUs running at 2.1GHz, where
the first three sd_llc domains each contains 4 CPUs and the last sd_llc
contains 2 CPUs, under same fillback scenario, select_task_rq_fair_thin()
executes 25% faster than the original select_task_rq_fair(). It saves 22ms
over a 10-second period, with this optimization accounting for 0.174% of
total system time. Additionally, we measured the execution time of
update_idle_cpu_scan, which took 0.5ms over the same 10-second period. If
we use select_task_rq_fair_thin() instead, this time can be eliminated,
accounting for 0.04% of total system time. Therefore, the overall
optimization contributes to a reduction of 0.214% of total system time.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 52 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 20d03ceed9d7..f10e709921fd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9661,6 +9661,51 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	return target;
 }
 
+/*
+ * A streamlined version of select_task_rq_fair().
+ * It runs faster than select_task_rq_fair, especially when there are not
+ * many CPUs. It will prioritize selecting an idle CPU in the following order:
+ * 1. prev_cpu
+ * 2. recent_used_cpu
+ * 3. cpu belongs to intersection of sd_llc and cpus_ptr
+ * 4. cpu belongs to cpus_ptr but not belongs to sd_llc
+ * If there is no idle CPU in cpus_ptr, it will select prev_cpu.
+ */
+static int select_task_rq_fair_thin(struct task_struct *p, int prev_cpu, int wake_flags)
+{
+	int recent_used_cpu, target, cpu, start = nr_cpu_ids;
+	struct sched_domain *sd;
+
+	if (likely(available_idle_cpu(prev_cpu)))
+		return prev_cpu;
+
+	recent_used_cpu = p->recent_used_cpu;
+	p->recent_used_cpu = prev_cpu;
+	if (recent_used_cpu != prev_cpu && available_idle_cpu(recent_used_cpu))
+		return recent_used_cpu;
+
+	target = prev_cpu;
+	rcu_read_lock();
+
+	sd = rcu_dereference(per_cpu(sd_llc, target));
+	if (sd)
+		start = cpumask_first_and(sched_domain_span(sd), p->cpus_ptr);
+	if (start >= nr_cpu_ids)
+		start = cpumask_first(p->cpus_ptr);
+
+	for_each_cpu_wrap(cpu, p->cpus_ptr, start) {
+		if (available_idle_cpu(cpu)) {
+			target = cpu;
+			goto unlock;
+		}
+	}
+
+unlock:
+	rcu_read_unlock();
+
+	return target;
+}
+
 /*
  * select_task_rq_fair: Select target runqueue for the waking task in domains
  * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
@@ -9682,6 +9727,9 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
 
+	if (sched_feat(LB_PROMOTE))
+		return select_task_rq_fair_thin(p, prev_cpu, wake_flags);
+
 	/*
 	 * required for stable ->cpus_allowed
 	 */
@@ -12564,8 +12612,10 @@ static void update_idle_cpu_scan(struct lb_env *env,
 	 * So the write of this hint only occurs during periodic load
 	 * balancing, rather than CPU_NEWLY_IDLE, because the latter
 	 * can fire way more frequently than the former.
+	 * When LB_PROMOTE is enabled, select_task_rq_fair() is no longer
+	 * used, and there is no need to update nr_idle_scan.
 	 */
-	if (!sched_feat(SIS_UTIL) || env->idle == CPU_NEWLY_IDLE)
+	if (!sched_feat(SIS_UTIL) || env->idle == CPU_NEWLY_IDLE || sched_feat(LB_PROMOTE))
 		return;
 
 	sd_share = sd->shared;
-- 
2.34.1


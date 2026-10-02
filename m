Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C84E2F33
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955916; cv=none; b=JWwLsGYE8Lnm5nKdj67G+GT8+y0M/Z6tJbIra3Ww0GJa7y9XUffk+ogoJLuP9NTOAyRDpdafQcHQpOYr/RdBopvZW9iXlbKA4Ph1hh+Wv0PjTrctApVRD0iuNAHDYcqbgLsDUwhxLO7O3ayhb0wywyOzzHqB6yjb3gL270v8YTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955916; c=relaxed/simple;
	bh=/2VD4LC+odtHLOqq8yAYPNfVMXKOIt4UdVKHp/RrnnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6vy2SQIcYWJKsCMu1FUv021hXmp+bWKOVJCzibpdq6eZHIIKuEYQdgxkVfcr/ARdsC7RkeMSlQmhk7eCg3o+6xUUfXyMBMh/kOQ+LVrhG6lRKfq/c3dkTv3T8MVbCQd4N8VN4lJT+g6+bD/1eYz7bONXoh7X1/4J/RN+wVouEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wb/XAB/n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wb/XAB/n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so285455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955911; x=1791560711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPyZg82TXoz+4EHOEjtMUqhGA+LRIEAnq1slizudzTs=;
        b=Wb/XAB/nJgpvpc8YrkhodzXvs8PU/n4yKh4z0eJ6JMJtLROViFLhjWTLqaZMOSRS1P
         rYmEM+kzLKvXwo9s1LnwYZYw/FDx34C97aMKwe9XXO/tiyfMchnrdbrqxdjm75161Xfo
         wH6EFzh0x/myKKZnALcG4RpWe2vtO8VVffzpSkS+Ac0sJjwIlUBSfqHa8DsR6T3r1Ouf
         u2S2gZBSidpwhSNBvdC22vK8IEFyaXkAURn3Y9g2TaARsY+LOJla+qgBPPr/kzZ9CLl8
         t2od+GnRTCvsraG3UWgTEp1p5JvuDTBpAJZfjRWjKEjobDCI5NI3OG7EXv7wVD0XFy8a
         VN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955911; x=1791560711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPyZg82TXoz+4EHOEjtMUqhGA+LRIEAnq1slizudzTs=;
        b=Qpoc0CpMctoAOAN77k4Y56bZRkYhCFrbHTMP4/ZB5sW20h9UzBwSpHxRezgja1D1pH
         1acbpkvR19jJGe6/XHBB3Mq/wmywo2ll6IuX4qeLJkVH1tw8OMNUDlMg7wkkW+4ZWbJJ
         RWjcfQkSqPUxmGwpLyqptB3dA97MGI818Jizvi5ex9m+OMOwrG5PhzISzfGcPW5BhMLp
         Ts2SwuI0Fe/aT8nC7rAK8wd7TpIu2cCV7UWN/hEmhdkxsLOeGOmE3g3NtWL2Ml/aJMwi
         KZqUXiFBq9HUFKNkYrqAob5n1+EQ4GYX6gm07HGt5N64tHSZf/czKnn9ALQw0Wc79yiP
         7S1Q==
X-Forwarded-Encrypted: i=1; AKwUvByeu+tTWYnJQqbpkWMnfwOpjHW0QFm3sTmt27M5quCgvM4CKBs07q+D9F6YqBSDT8UtGFZM6Lnds/o0gv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lT5XBqQ9WZx8PkBg2xRHtFfWluNgDSv91DE0LFQUSn+PfaUi+L
	bWLKW10HB/d2LbdBmJ5VuNR9v/vHB+t8wL1T/7bMhXoxkk8dXCHoFV6oE9J9J1Wk/0Y=
X-Gm-Gg: AYBFou2VTeqXoNydg3QYsTMyDKMjv5sTtu3nAB2/kFLpbjj9DeEmdTEj9rEymrrMgJF
	Uy1Tc+0PTt78+lHbn0+Hx6IK3YADf6yvD/cySjut2S7ew/YtnJ7gBvlk6DAQTS9f8g5Jix+o3s5
	HduEQ4ZManHsjd4dbC5BxW1tXcMqIHzW9MubVX/oz4ssll9KeCKaRjYcfSSfuNZit3OGno5gmJW
	fe4rrCm6w8fX0AxnyUqEmvsmxayNW/qRswYHE3y4WrIA5dgv8uIQAxA0UnZHFP0pgZ6+7t4+a9C
	HQp0R5uEc7aq3zvRb+cDd5m6i/HUAKJ/wQJl3IZK8Zw68qTCUc9yCkWH6iy/cI8chZzxOgof4fY
	Z769E/6/TdaNeZOvlzhboRK2r9Xtxif98NKRZOwvQeETb9Nyik/li2OUgrUhXZLwyeztPxuFcVR
	waYTxxGa5Ek4fE3nqX/gp2uscBlaGR2hPvRj3WkRtB3DRB9lG/hKhPi93rQpMI9953dFLLYuaFO
	wzOIUeFKXDKLKdA
X-Received: by 2002:a05:600c:138b:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a02759b46fmr60064605e9.19.1790955911245;
        Fri, 02 Oct 2026 08:45:11 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:10 -0700 (PDT)
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
Subject: [PATCH 06/18 v2] sched/fair: Prepare select_task_rq_fair() to be called for new cases
Date: Fri,  2 Oct 2026 17:44:03 +0200
Message-ID: <20261002154415.2270586-7-vincent.guittot@linaro.org>
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

Update select_task_rq_fair() to be called out of the 3 current cases which
are :
- wake up
- exec
- fork

We wants to select a rq in some new cases like pushing a runnable task on a
better CPU than the local one. In such case, it's not a wakeup , nor an
exec nor a fork. We make sure to not distrub these cases but still
go through EAS and fast-path.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c |  2 +-
 kernel/sched/fair.c | 57 ++++++++++++++++++++++++++-------------------
 2 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f38cf5a37a8a..837dc74c9a8d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3618,7 +3618,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 }
 
 /*
- * The caller (fork, wakeup) owns p->pi_lock, ->cpus_ptr is stable.
+ * The caller (fork, wakeup, push) owns p->pi_lock, ->cpus_ptr is stable.
  */
 static inline
 int select_task_rq(struct task_struct *p, int cpu, int *wake_flags)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 19a0e67827f7..f12678850ce2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9800,46 +9800,55 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 }
 
 /*
- * select_task_rq_fair: Select target runqueue for the waking task in domains
- * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
- * SD_BALANCE_FORK, or SD_BALANCE_EXEC.
+ * select_task_rq_fair: Select a target runqueue for the task.
+ * There are 2 ways to select the target runqueue:
+ * - The fast path which only looks for an idle CPU in the LLC or the smallest
+ *   asymmetric domain (i.e. the lowest domain with all compute capacities).
+ * - The slow path which looks for the idlest CPU in the highest domain with
+ *   the relevant SD flag set.
  *
- * Balances load by selecting the idlest CPU in the idlest group, or under
- * certain conditions an idle sibling CPU if the domain has SD_WAKE_AFFINE set.
+ * In practice, WF_EXEC and WF_FORK uses the slow path whereas WF_TTWU and no
+ * flag (Push) uses the fast path.
  *
- * Returns the target CPU number.
  */
 static int
-select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
+select_task_rq_fair(struct task_struct *p, int prev_cpu, int select_flags)
 {
-	int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
+	int sync = (select_flags & WF_SYNC) && !(current->flags & PF_EXITING);
+	int want_sibling = !(select_flags & (WF_EXEC | WF_FORK));
+	int new_cpu, cpu = smp_processor_id();
 	struct sched_domain *tmp, *sd = NULL;
-	int cpu = smp_processor_id();
-	int new_cpu = prev_cpu;
-	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
-	int sd_flag = wake_flags & 0xF;
+	int sd_flag = select_flags & 0xF;
+	int want_affine = 0;
 
 	/*
-	 * required for stable ->cpus_allowed
+	 * Required for stable ->cpus_allowed
 	 */
 	lockdep_assert_held(&p->pi_lock);
-	if (wake_flags & WF_TTWU) {
+
+	if (select_flags & WF_TTWU) {
 		record_wakee(p);
 
-		if ((wake_flags & WF_CURRENT_CPU) &&
+		if ((select_flags & WF_CURRENT_CPU) &&
 		    cpumask_test_cpu(cpu, p->cpus_ptr))
 			return cpu;
+	}
 
-		if (!is_rd_overutilized(this_rq()->rd)) {
-			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
-			if (new_cpu >= 0)
-				return new_cpu;
-			new_cpu = prev_cpu;
-		}
+	/*
+	 * We don't want EAS to be called for exec or fork but it should be
+	 * called for any other case such as wake up or push callback.
+	 */
+	if (!is_rd_overutilized(this_rq()->rd) && want_sibling) {
+		new_cpu = find_energy_efficient_cpu(p, prev_cpu);
+		if (new_cpu >= 0)
+			return new_cpu;
+	}
 
+	if (select_flags & WF_TTWU)
 		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
-	}
+
+	new_cpu = prev_cpu;
 
 	for_each_domain(cpu, tmp) {
 		/*
@@ -9871,8 +9880,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
 
 	/* Fast path */
-	if (wake_flags & WF_TTWU)
-		return select_idle_sibling(p, prev_cpu, new_cpu);
+	if (want_sibling)
+		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
 
 	return new_cpu;
 }
-- 
2.53.0


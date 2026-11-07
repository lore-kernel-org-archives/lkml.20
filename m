Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052980;
	b=vgkA9UPQeKvwpMJAZLfiOijYLqJhUuyYc5accLTS8mSEeZnRbd8guVwIU1PzsVD1zGuz
	 qlrDqmJp1uj/TVBBVNBofAS5Q1ntCg05NOiZ57SRjKcclEtQoveRcDryfhpvtaUfX79wa
	 fL/0Y2JluT1NrW7yU4nLlg4kOmz64eZOVDSy5V1nZNhks8Mo91Jh4/crkrN+0fDWpJzBg
	 5JItfz+/rVVf+JnEsgaegt8bHu2ii+Mgjio4UdWweFDmgKGdhhTf7IaWiy7vG33OvrkzO
	 uwfLlLQTsDt+rojsCVXZ9+iP2gtq9di9j0n7N1/ptHg93wcW+6U/ILsdcwHQChki8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052980;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=dzmn5OvuL6HWddApDFOpicmssA7vwWfg++lvft7UzdE=;
	b=tYhmC3TX2eW1rLS2bZ5R7dXe1FfhSB4q2ze64Pj+11S2oH9lW2+rDtrUBuojmR7JBH5D
	 kYwpFWx+x9KNIu6/GFumxOx0SQ9Y144x6dirJd65/x5DPaLe9/zZdpSo7wZDeogm8m2xR
	 W44+lBMaG7Bu+s7ajsuXqiCGIVuO0vTaqxAreQBiI8sLxrsrClUWC/pqWE0xIl/eFsbaS
	 x5l2O2WPiKTMei7A6cFobznHpRnmqn44rGI8yo+yjPbIi7oN9tMtSALor22zRhQsgIqT8
	 jT+i9oeEIIwwnCx6mFXNcuCXEP6IYd64a9BLLEDPfXd20YDbV7gaFvvrD9D+AHBlIhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=i0HWzt7v;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA5606A338
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEA5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=i0HWzt7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=dzmn5OvuL6HWddApDFOpicmssA7vwWfg++lvft7UzdE=; b=i0HWzt7vUpyKm9YiG6cRoROZCV
	I/cT62+40Jv/VOLZ3cvVrcH5TxIHbhGQAqJOALyFdDDvXKf5LhKjU2hB7yDXmzcCOt1rFMvyTVEB1
	gOPUP7lxmXblwiuwMdxl7hV5L3lJ9BFZB8KKBD9AfkNiWSA8x6cfXk4GRaolLF5oxNyySplquvPgJ
	jz01VjAu92KIUjQcuyEukOlH9NzQuW6B8ubia8PhX0h0OxC/hnSJITVS6IC0J4EagcYGZSUnPtfws
	70FZrPkEqHmqR1dOsfiWxJcuMw4wLr0r6/mGyXTd9YW/nSzC4C14IU/BgeWaNIQYZiAnYZYWYq0Vm
	pX23FfGQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8B-00000005BYi-1t1g;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 319F730312D; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.655754098@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 08/12] sched/core: Allow newidle for core-sched
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

As reported [1], it is possible for newidle, as called from pick_task_fair(),
to migrate a task that was already selected for the SMT sibling.

That is, in case of core scheduling (pick_next_task()'s restart_multi label),
pick_task() is called for each SMT sibling. Suppose SMT0 picks task A, and SMT1
has no tasks and does newidle, it must not be possible (but currently is) to
migrate A to SMT1 and also select A.

Avoids the 'stealing', but doesn't yet enable newidle just yet.

[1] https://patch.msgid.link/20260603095108.GA1684319@bytedance.com

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |    3 ++-
 kernel/sched/fair.c  |    3 ++-
 kernel/sched/sched.h |   15 ++++++++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3065,7 +3065,8 @@ static int affine_move_task(struct rq *r
 		return -EINVAL;
 	}
 
-	if (task_on_cpu(rq, p) || READ_ONCE(p->__state) == TASK_WAKING) {
+	if (task_on_cpu(rq, p) || task_on_core(rq, p) ||
+	    READ_ONCE(p->__state) == TASK_WAKING) {
 		/*
 		 * MIGRATE_ENABLE gets here because 'p == current', but for
 		 * anything else we cannot do is_migration_disabled(), punt
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11184,7 +11184,8 @@ int can_migrate_task(struct task_struct
 	env->flags &= ~LBF_ALL_PINNED;
 
 	if (task_on_cpu(env->src_rq, p) ||
-	    task_current_donor(env->src_rq, p)) {
+	    task_current_donor(env->src_rq, p) ||
+	    task_on_core(env->src_rq, p)) {
 		schedstat_inc(p->stats.nr_failed_migrations_running);
 		return 0;
 	}
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1594,6 +1594,14 @@ static inline bool task_has_sched_core(s
 	return !!p->core_cookie;
 }
 
+static inline bool task_on_core(struct rq *rq, struct task_struct *p)
+{
+	if (sched_core_disabled())
+		return false;
+
+	return rq->core_pick == p;
+}
+
 #else /* !CONFIG_SCHED_CORE: */
 
 static inline bool sched_core_enabled(struct rq *rq)
@@ -1639,6 +1647,11 @@ static inline bool task_has_sched_core(s
 	return false;
 }
 
+static inline bool task_on_core(struct rq *rq, struct task_struct *p)
+{
+	return false;
+}
+
 #endif /* !CONFIG_SCHED_CORE */
 
 #ifdef CONFIG_RT_GROUP_SCHED
@@ -4269,7 +4282,7 @@ void move_queued_task_locked(struct rq *
 static inline
 bool task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
 {
-	if (!task_on_cpu(rq, p) &&
+	if (!task_on_cpu(rq, p) && !task_on_core(rq, p) &&
 	    cpumask_test_cpu(cpu, &p->cpus_mask))
 		return true;
 



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647276;
	b=oE3N0M/xrcBdGQTDKqjajSIFJnZ6+YWNR/dFeXjuhwcKL8QVpZaskrKPOgYG5t3X4WRD
	 PAoxS78Bg/bb3sOpCZqF7TQ/a8sFJ/dDv369nthuS71fLbYtWTnoYl52bnLcj8wcO8YIZ
	 bcM4ezMFgz77RExfZxoVuurJYBmU4OSyhGVmz3gm/oSEVH2KfNvYyEXpO96p3M/2oJ53q
	 4P1tduNYsAd6C7o0oBwFdwSTsjWto+A2mZk3pJzolJLUGC6/Qf7LwlgDWfEKK9pyQDIjI
	 ggLRNxMCPYrfxtxDQS/W1yGitAJq9/gYA9Herw+S2sjmlWOtojgLn27hP1Y/Rm1VRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647276;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sgye7KMtIQghLo0c5ZRO6JjF5lRmO6nRJnfahgHri9Y=;
	b=f3cXT4EJA6bb+rITTPDB9N6pHRDJ6I3UYn9bA11/Ez1rPRzi1lFfwiqPYg9bPNNKr1Ys
	 sJGxqgR4J+Ein9cAZxf4zKq2GLvc9YFjP2LSnDMc8K6YPm7RacxMyn54hroEm3wP20tU1
	 JohIByY8gAoP/4lpmrr0Hb0Xazf9b1wSy5y+NMX2TFobjn2+buekjwshXspbh3oh9KdhR
	 2oLCL/olt+K0LAebti6YK6tkAAEm4u84tpRYHh35yN948q/NRT9D89NoAz2lv4rhCaTra
	 YYGea4U1kzOFkGvJqSC8MK7V9xhK+nSC51AiCAO0mQoT+8PDYGyAG8XmSXYig3+P8PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5x9PtL+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05C606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5x9PtL+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC0F1F00A16;
	Mon,  2 Nov 2026 19:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647275;
	bh=sgye7KMtIQghLo0c5ZRO6JjF5lRmO6nRJnfahgHri9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T5x9PtL+ia4V482NgFjJylYf2pvIQMVjExEi/y6v98ekmEHkhDDdT7EfSa9tFB2X7
	 8AH3E/fIWay3Cz7JfbKWT3Jvlk+OyiNVFSGdInKMYihFu20oIyFzBb1xUpuvPVpwrZ
	 uC5YPF5dHPzuQUolaMTLybLvvt3TwxYDnnbYOKkvNE5FOSjyoyMpRAhbR0lLj06dUa
	 /9O5TQPwQZTBCTBa7y/T0IvNncs8BqctVQjKnEpoMTAvAqh6FaFvreOhIIrqVsncIM
	 xruUdkdCAsnQ1G6kwD8ARw/EhyfUV/lVcTswtfxmmDk9G4jvafgCv4dKfgMQQu2xOW
	 Ba+bV8z5cVQjg==
Date: Mon, 02 Nov 2026 09:21:14 -1000
Message-ID: <705081716ac8615650a0cc4b668689ba@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread creation
In-Reply-To: <20261102101759.GF1813469@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com> <20261026115707.GF2668200@noisy.programming.kicks-ass.net> <20261030034540.2074077-1-4ncienth@gmail.com> <20261030154940.GW2668564@noisy.programming.kicks-ass.net> <36ce43428e53d1d6e47dddb43697ccf2@kernel.org> <20261102101759.GF1813469@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Peter.

On Mon, Nov 02, 2026 at 11:17:59AM +0100, Peter Zijlstra wrote:
> On Fri, Oct 30, 2026 at 04:28:54PM -1000, Tejun Heo wrote:
> > cgroup_threadgroup_rwsem is a global percpu rwsem and taking it for
> > write on a regular basis can be really expensive.
>
> Yeah, but setsid() isn't more critical than moving tasks between
> cgroups. Also, AFAIK nearly nobody is using autogroups these days,
> because systemd does the cgroup thing.

We don't want to take the write lock on every setsid(). It would have to be
limited to actual autogroup joins, which seems doable but likely adds a bit
of complication.

> > Either way, AFAICS, autogroup doesn't need cgroup_threadgroup_rwsem. The
> > cgroup side has to be settled early in fork, but the autogroup side
> > doesn't. Can't we just move the autogroup assignment later in fork, to a
> > point where it can't race against setsid()?
>
> That is more or less the proposal, but it rather creates more complexity
> rather than reducing it.
>
> Having two different rules for p->sched_task_group, depending on cgroup
> or autogroup isn't at all appealing. Not to mention adding even more
> fork callbacks.

I see your point. Moving the autogroup handling into the cpu controller
keeps it better contained though. sched_cgroup_fork() places the new task by
its cgroup only, and the cpu controller applies the autogroup once the task
is on the thread list. This isn't a hill I'm going to die on, but it looks
like the better direction to me. Can you please take a look at the patch
below?

diff --git a/kernel/sched/autogroup.h b/kernel/sched/autogroup.h
--- a/kernel/sched/autogroup.h
+++ b/kernel/sched/autogroup.h
@@ -27,12 +27,12 @@ static inline bool task_group_is_autogroup(struct task_group *tg)
 	return !!tg->autogroup;
 }
 
+extern unsigned int sysctl_sched_autogroup_enabled;
 extern bool task_wants_autogroup(struct task_struct *p, struct task_group *tg);
 
 static inline struct task_group *
 autogroup_task_group(struct task_struct *p, struct task_group *tg)
 {
-	extern unsigned int sysctl_sched_autogroup_enabled;
 	int enabled = READ_ONCE(sysctl_sched_autogroup_enabled);
 
 	if (enabled && task_wants_autogroup(p, tg))
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4958,7 +4958,6 @@ int sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs)
 		struct task_group *tg;
 		tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
 				  struct task_group, css);
-		tg = autogroup_task_group(p, tg);
 		p->sched_task_group = tg;
 	}
 #endif
@@ -9598,6 +9597,15 @@ static void cpu_cgroup_cancel_attach(struct cgroup_taskset *tset)
 	scx_cgroup_cancel_attach(tset);
 }
 
+#ifdef CONFIG_SCHED_AUTOGROUP
+static void cpu_cgroup_fork(struct task_struct *p)
+{
+	if (READ_ONCE(p->sched_task_group) == &root_task_group &&
+	    READ_ONCE(sysctl_sched_autogroup_enabled))
+		sched_move_task(p, true);
+}
+#endif
+
 #ifdef CONFIG_UCLAMP_TASK_GROUP
 static void cpu_util_update_eff(struct cgroup_subsys_state *css)
 {
@@ -10562,6 +10570,9 @@ struct cgroup_subsys cpu_cgrp_subsys = {
 	.can_attach	= cpu_cgroup_can_attach,
 	.attach		= cpu_cgroup_attach,
 	.cancel_attach	= cpu_cgroup_cancel_attach,
+#ifdef CONFIG_SCHED_AUTOGROUP
+	.fork		= cpu_cgroup_fork,
+#endif
 	.legacy_cftypes	= cpu_legacy_files,
 	.dfl_cftypes	= cpu_files,
 	.early_init	= true,

Thanks.

--
tejun

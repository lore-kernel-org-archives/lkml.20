Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3640D590
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830487; cv=none; b=DrskKK6DQdsPlQke1SwfiHowtHfmpXrVr4AYxwYYWxsCJbxWi/oGej1utplZ2ra46gXcGy5mzDjv9L469p8OEHw6bcw0shRVkShkD1mH1HlD4C0v5mnISCrksLHUMdmS4n9ZMcfuS/T8Vpy55OGGe+qF3JNdeE+WEBZu2FBZqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830487; c=relaxed/simple;
	bh=S3ad9Bb3yoWkVr0XL82fgpjIoeEwxjbNB7KqajHsBF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4MutmVhLd5xZHQ52hraP3e44WIvM4wbcp1hKqBC5oMzI7K8A44z53hjw1gydmLRLyrZmrLc96HiPUV5iPhL0O+uOnWkK/XjlB+KnJHS4d4vDQ6u2TO1lo8+T9kSxFGQIcZFIuCiwI4LUKL/KuTaeGDtX6Z5p5GeZas7H8oE0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kh2pKL8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kh2pKL8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8D71F008A1;
	Mon, 12 Oct 2026 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791830486;
	bh=7o5T8y7aVSgylO/ub5/ymVP7ZOF5OpAiEQv6VNNFlhk=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=kh2pKL8tHNAUxvJHzgXBpPR9bR6lGymUMIgWsMAfG9I2VHFGIiL/XsKsYVneYse61
	 ZGerPzyiFzpmhEGLDaB0DWI1fY5wwu/LoS4PvTGomtu17trvJ2AePoVzWqOtoehM9v
	 GbvA84B9i7AueXX5hnUSuh2QLChS/zxE+2W9iKs36i5c4nwUSUeo1wgxpXhAKKwl3M
	 7H2XOtDxxmobDvny5hef37dvhMoj6AhPsey4bTDElhBmRXFeisPdm/DAvs49PdNIYq
	 aAolHhNyt9M9uETFVGMy02jnneKwVdPyl3Ff0PtmYPo44BxzIgN34onx55jwaJV8nT
	 2QUKtk5cuNdwQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B8AD2CE04A0; Mon, 12 Oct 2026 11:41:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 11:41:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [BUG] Apparent lost wakeups
Message-ID: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The scheduler appears to lose wakeups on both x86 and arm64 systems
when running the rcutorture TREE01 scenario with RCU priority boosting
enabled, but without also enabling testing of RCU priority boosting.
The following pair of commits in my -rcu tree [1] make these two changes:

c7684673c6ca ("EXP rcutorture: Enable RCU_BOOST where supported")
4b08261f7bff ("EXP rcutorture: Disable RCU priority boost testing on non-TREE03 scenarios")

These two changes were motivated by CI systems reporting RCU CPU stall
warnings due to low-priority tasks being preempted for extended periods
of time.  The hope is that undisciplined RCU priority boosting would
eliminate these issues.  (For an example of a disciplined RCU priority
boosting configuration, see the TREE03 scenario.)

The following command reproduces the lost-wakeup problem, which shows
up as RCU CPU stall warnings caused by rcu_torture_reader() kthreads:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 20m --configs '19*TREE01' --bootargs "nohz=off rcutorture.onoff_interval=0 rcutorture.nocbs_nthreads=0 rcutorture.shuffle_interval=0" --trust-make

Replace the "19" in the "19*TREE01" above with the number of CPUs on your
system divided by 8, rounded down.

This issue occurs on both x86 and arm64 systems.

This wakeup failure occurs in other scenarios, but more rarely.  The thing
that makes the above reproducer do better (or worse, depending on your
perspective) is that it is providing only eight CPUs for each guest OS's
17 vCPUs.  This could be considered abusive, but if so, it is abuse that
provides orders-of-magnitude acceleration of a real failure that also
happens without vCPU overcommit.

The following pair of commits add diagnostics that show that the stalled
kthread is consistently preempted on an idle CPU, which is a perfectly
reasonable transient state (for example, during delivery of a resched
IPI), but not a state that should persist for many tens of seconds:

49be2ba9f0fa ("rcu: Add running and boosted indications to RCU task stall dump")
e3bbe32c1fd9 ("EXP rcu: Print CPU that preempted stalled reader wants to run on")

It appears that the cause of this issue is the wakeup racing with the
target CPU entering the idle loop.  The AI-slop patch shown below does
a recheck of flags to detect this condition and exit the idle loop when
detected.  Note that this is *not* a complete fix in the general case
because the wakeup might happen just after this check, and to its credit
the AI agrees that this is not a complete fix.  However, this "fix"
does appear to prevent (or at least severely decrease the probability
of) the problem for the above reproducer because of the nohz=off kernel
boot parameter.

This patch also splats when the recheck detects a racing wakeup, which
demonstrates that this patch is actually doing something.

An alternative and (apparently) equally effective workaround,
involving resched_cpu() executed by the RCU grace-period kthread's
force-quiescent-state processing, may be found in my -rcu tree:

34bace6b7fab ("EXP rcu: Send resched_cpu() to idle CPUs having preempted RCU readers")

So why does is it necessary to disable rcutorture's testing of RCU
priority boosting to reproduce this lost-waitup issue?  Because enabling
this testing means that there are per-CPU kthreads that wake up once
per second, which forces each CPU to notice any runnable tasks.

As always, please let me know how I can help with further debugging.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git

Assisted-by: LLM
Not-signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c47..90f2dfc67e2d0 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -279,6 +279,7 @@ static void do_idle(void)
 {
 	int cpu = smp_processor_id();
 	bool got_tick = false;
+	struct rq *rq;
 
 	if (cpu_is_offline(cpu)) {
 		local_irq_disable();
@@ -339,6 +340,24 @@ static void do_idle(void)
 		 */
 		local_irq_disable();
 
+		/*
+		 * Lost-kick safety net: never sleep with genuinely runnable
+		 * work queued.  Exclude delayed-dequeue tasks, which are
+		 * counted in nr_running but not pickable (as in
+		 * wake_affine_idle()).  Lockless reads are fine: a spurious
+		 * hit costs one extra schedule pass, a miss is re-checked
+		 * on the next tick/interrupt.
+		 */
+		rq = this_rq();
+		if (READ_ONCE(rq->nr_running) >
+		    READ_ONCE(rq->cfs.h_nr_queued) - READ_ONCE(rq->cfs.h_nr_runnable)) {
+			WARN_ONCE(1, "CPU %d entering idle with %u runnable tasks queued\n",
+				  cpu, READ_ONCE(rq->nr_running));
+			set_tsk_need_resched(current);
+			local_irq_enable();
+			continue;
+		}
+
 		arch_cpu_idle_enter();
 		rcu_nocb_flush_deferred_wakeup();
 

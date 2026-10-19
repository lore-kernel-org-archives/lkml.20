Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18A4EC665
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415349; cv=none; b=LkI4TtFKnCpCh5NU6ygr2WQZLjY/QMK+e6f0Q2Mb3xPlhzCzFYfiy3kXTjLu1DjeiOSwgPYO9lSy2p0Qku3v/p7atL21ggeQTSEeYc16w/5nOWByeFokJMEfgKu3GETgXE4knv6/G3VQFSXoUuhU3TAIxfqHIG9Fq2zYe9BZKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415349; c=relaxed/simple;
	bh=86ovk0zkpGbj7OKntWyQDzbKifaEyiuL7KSrwXPZyak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYpzTlhAk9LpvcuvjKxk3EzWkGBifdP06KG9XmrW5RiDbWFKqlGg6uxkWvLz+jezaTTA44iMn3cXlvwDagj8gr9pBUPhIV+075W/Z8zQQNiDCicvYCA/YFwFQEBxrtHWVXZhkdzU64/fCDL1u5VLgEZv7JRfiOvUZX3VxUh0x9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWnOjDKq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWnOjDKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08011F000C4;
	Mon, 19 Oct 2026 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415348;
	bh=b9cHiVjXB5mBVPfFzH3RvDIkrHCNkl/a8jjaFQvW5ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SWnOjDKqJtVFklAD5UNiaAndA33GbewiztAeHQTBuAcPc9IwmgvtlHitGsNnLoDB6
	 I+im4VLZNoS5zvbkpnTpCdDn/xHz12nqvudSz/caBbSlsokuT5qjRpQoNRDmGrInws
	 I+ykGPvo2YfeNprZgcNXFzN5mn2M49LB4e+2XH3RB1WyFzdyHG0jb7zIh/SoXOyITA
	 WzCJgeYrGz1fDr2s6RMiJ6ayzeCPrJkyLrFRJhcf5NGFds/DWyLpXU+V9sc7KwPfqr
	 ggJbHOHt5TzkO68INXGAmwspsPPjrTOQUExm65h3reNNYH5KIg2+Ek+eqMeq3AB6Qk
	 FpLQrCrTyEJdg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	x86@kernel.org
Subject: [RFC PATCH 02/49] x86/cpu/cacheinfo: Move CPUHP_AP_CACHECTRL_STARTING to post stop machine
Date: Mon, 19 Oct 2026 15:08:09 +0200
Message-ID: <20261019130856.49711-3-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The cpu_cacheinfo_mask is only accessed by hotplug operations and
therefore the current CPU can be cleared from it while other CPUs
have exited hotplug stop machine.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c        | 21 +++++++++++++++++++--
 kernel/sched/core.c |  1 -
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 064c1072ad50..da07c804ff53 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CACHECTRL_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1294,9 +1294,26 @@ static int take_cpu_down(void *_param)
 	 */
 	cpuhp_invoke_callback_range_nofail(false, cpu, st, target);
 
+	return 0;
+}
+
+static int take_cpu_down_post(void *_param)
+{
+	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
+	int cpu = smp_processor_id();
+
+	WARN_ON(st->state != CPUHP_AP_CACHECTRL_STARTING);
+
+	/*
+	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
+	 */
+	cpuhp_invoke_callback_range_nofail(false, cpu, st, target);
+
 	/* Park the stopper thread */
 	stop_machine_park(cpu);
 	return 0;
+
 }
 
 static int takedown_cpu(unsigned int cpu)
@@ -1313,7 +1330,7 @@ static int takedown_cpu(unsigned int cpu)
 	 */
 	irq_lock_sparse();
 
-	err = stop_machine_cpuslocked(take_cpu_down, NULL, NULL,
+	err = stop_machine_cpuslocked(take_cpu_down, take_cpu_down_post, NULL,
 				      cpumask_of(cpu));
 	if (err) {
 		/* CPU refused to die */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..c1ed3ba39092 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5953,7 +5953,6 @@ static void sched_tick_stop(int cpu)
 	WARN_ON_ONCE(!tick_work_cpu);
 
 	twork = per_cpu_ptr(tick_work_cpu, cpu);
-	/* There cannot be competing actions, but don't rely on stop-machine. */
 	os = atomic_xchg(&twork->state, TICK_SCHED_REMOTE_OFFLINING);
 	WARN_ON_ONCE(os != TICK_SCHED_REMOTE_RUNNING);
 	/* Don't cancel, as this would mess up the state machine. */
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730051814C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415472; cv=none; b=irYSGm8eIVIsq0MteKeyjxXflwuD5zKPmNpCtcHYsB+RxmtCzaYH1QSoKdoQpqiIEHKnJZInGaLWZbvxmMMbwLepbMhU4zb0LsERTnyuv4xvRvOlC03K9CmM5bpbivjmKKCg1rcXEw/K159LQXiDPnCimbdWC2fHR0Sio+/13wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415472; c=relaxed/simple;
	bh=/R+GULq86OBeop4KQSXa7kdIhvz5Tt9rNhlIurmSVMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAe13rd7NgLLmTIVEa00xg1m/CS4FtIcOgKtNhc7GekY0dQFiNQRJ9cbxYx77igLXSfw1PiCVAxvVGFO75sDUS4xAFPtIIhWMj6u5VVbL5htaoJibV1lXkMtRN90OJlK6bNJaf/nC6JSGr+YJwlX7HM8CrARgA/u/0kb5gPsA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7jXNz09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7jXNz09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC5D1F000C5;
	Mon, 19 Oct 2026 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415471;
	bh=vJNS/P0ZdSiNvIO4F3mrsU3nmJbL6xNB/8bNlfFTVDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g7jXNz09Xa4M0OJCviuJmtnNyRS+88MQw3RA1gELRCPSbVvDATotFAHaBj6b3QSwL
	 iidb4kX8JI/kxQagKMVgaJ/58JPNgLpo2Tvt1GfclwU2VZKIPVlt77rxuoUvDO/3iV
	 99I350dQm4FmxrIBwFzpgTg/kfcj4dnDW/LKYBMy+RUQrpB8V0fhdJR4WRhVU/VWHB
	 MvL218u6Hs0e4cHAmjVLQDFnI1uniKRT3vtfq2d+o5bdJBd1W5pP9ejm9bjNs23sxx
	 WWTSBHsUborFB1WlPgD4Au2K5AbTXMmw8QFBVmOvOHfwu4u/upiQKUah//hCbS+mps
	 zJZTdi+BTzMig==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 47/49] tick: Move CPUHP_AP_TICK_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:54 +0200
Message-ID: <20261019130856.49711-48-frederic@kernel.org>
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

The teardown callback here can run concurrently with other CPUs:

* The cancelled local tick doesn't interact with other CPUs.
* The local clockevents are removed under the clockevents_lock
* The CPU is removed from broadcasting under the tick_broadcast_lock

The only needed change is to send an IPI to the new timekeeper because
outside stop machine, other CPUs may be in dynticks mode.

Then the teardown callback can be moved to post stop_machine()
accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c              |  4 ++--
 kernel/time/tick-common.c | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1da41620a583..59ffcd4534c8 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HRTIMERS_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TICK_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_HRTIMERS_DYING);
+	WARN_ON(st->state != CPUHP_AP_TICK_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 6a9198a4279b..39b8cb3e3484 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -16,6 +16,7 @@
 #include <linux/percpu.h>
 #include <linux/profile.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
 #include <linux/module.h>
 #include <trace/events/power.h>
 
@@ -394,13 +395,14 @@ void tick_assert_timekeeping_handover(void)
 int tick_cpu_dying(unsigned int dying_cpu)
 {
 	/*
-	 * If the current CPU is the timekeeper, it's the only one that can
-	 * safely hand over its duty. Also all online CPUs are in stop
-	 * machine, guaranteed not to be idle, therefore there is no
-	 * concurrency and it's safe to pick any online successor.
+	 * If the current CPU is the timekeeper, hand over to any online
+	 * CPU and kick it out of nohz if needed
 	 */
-	if (tick_do_timer_cpu == dying_cpu)
-		tick_do_timer_cpu = cpumask_first(cpu_online_mask);
+	if (tick_do_timer_cpu == dying_cpu) {
+		int timekeeper = cpumask_any_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE), cpu_online_mask);
+		WRITE_ONCE(tick_do_timer_cpu, timekeeper);
+		irq_work_kick_cpu(timekeeper);
+	}
 
 	/* Make sure the CPU won't try to retake the timekeeping duty */
 	tick_sched_timer_dying(dying_cpu);
-- 
2.53.0


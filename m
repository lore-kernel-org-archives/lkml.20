Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896390;
	b=10OMdN7MFeW98zbg/2dQ/VEP2vgfwpWL1LrNe6UjFRPN9gp+g8yGQRtruBGrbhNSiEq6
	 CXqDL7I0zJfbH4wyaZvnGa69sl/+2Q1QQqFR6UCw9GjBmZNJDZMIhvcBJXUv6z8IMRVx7
	 j9vRbBvWG9SDuXZSByRgo+BS/0fOXDRNDvttvLVU8h7vPYNAgb8SJmcaLjNV5duwbkNR8
	 nSuAARn/PhzwmALMM34isr/XzOrsH8ByUEY4MygqvgrV+17VX4VgkXWZtOP0lBJYVHDVf
	 Wu5QNOKhtjFmVQCHpikLOP2GmvVlqAzHb71Wx6/auYcJryvyGWNG/+nWTIG0VRSHdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896390;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2MAlxzHforYcMESFJMXV/ob08iffrmd0YRGH6QUHHwQ=;
	b=jvoKUr7ShP9zwKpDvdjJAHfZf7wgNypO7A1DGbIHZwouCjnMlCHE8Sj9YzZU4kxQwj6t
	 +F5xSUYrNX3qm466TWQR7L+FU0rFn4m0NfcvmZew9rVsfkII/U3BXXnazOQjs8bUJuJT7
	 t7XqBhVVdmtOW7u1Udwvx5ui2XM8HGCHsBFaF9W5pm3Gr7s+HAsRrIko1WboEQ3HRWyBV
	 k6N6UsIgaq15GvYEAegV/LZ7vMO7ULTmT36DB/8WZzXMXnpGMGuW50Fw+ovXUajteIfK3
	 UdyLxMqzCJS/F2JRbRoNNyOyKpDhZaeceV/Y3XiHZ8QU2qZbf5wbLnWQXEwTD+w5ErQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtrMraZY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7296D606D801
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtrMraZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB7A1F00919;
	Thu,  5 Nov 2026 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896390;
	bh=2MAlxzHforYcMESFJMXV/ob08iffrmd0YRGH6QUHHwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CtrMraZYIjNVLiXTdvbX0u1Nw5CQr40rarrbN5ZgebsO7DfD99O1TI27sHGzQ1n+O
	 STfIjtQhKaRBnFWGTF7iciPBnuqYmY/1Zrrv9S2xh65B4XhOYLNBPbCcj1uQYC0HSY
	 gKkuFGjeORfBoDk8lVGY+8jAVXXOUb9+1RmfR2bB4swCmgebiCV1cFOzAUeHT7TjRP
	 MJ53EYFGsiaKswVaQgInE3t7i6hWPZVMK2Dh8f9iB/wo2ODBG4q05gvLvPsgRRndWG
	 d9rXOwPBowF+Af6jOH719/awrZ6/4aaUI/00ohocKz6/ij4Qe/6K7zuVwC7HH3oqr7
	 YgKjusf/rdoGg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 45/47] tick: Move CPUHP_AP_TICK_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:43 +0100
Message-ID: <20261105163045.38862-46-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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
 kernel/time/tick-common.c | 15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4d34c4ed9836..82943ec3ba28 100644
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
index 6a9198a4279b..16e29f38dcb8 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -16,6 +16,8 @@
 #include <linux/percpu.h>
 #include <linux/profile.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
+#include <linux/sched/nohz.h>
 #include <linux/module.h>
 #include <trace/events/power.h>
 
@@ -394,13 +396,14 @@ void tick_assert_timekeeping_handover(void)
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
+		wake_up_nohz_cpu(timekeeper);
+	}
 
 	/* Make sure the CPU won't try to retake the timekeeping duty */
 	tick_sched_timer_dying(dying_cpu);
-- 
2.53.0


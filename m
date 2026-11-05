Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896260;
	b=d4Zqj23EI5LxGLrmue5jBgKWnhAKmA+LotiGCP6G7XCN1wpDL2h/xivz6At49N17apNK
	 zhVv7QgjkW0Bsb2RGULpV94GmPVgK/KCu3Iawhg2bc9tHyhhCtmMyahGXlhSodUdK+V+A
	 EiHYF2xEEFocwWduZtDxBm4dz57HvOxN7IxVbSHbsPmd2w/XLGtIPIX3+BZ6WFd14PF2G
	 mhsCX5yPcQZaY24bcrL+bFXA6LmGltBELkfWCKPcYhGLagckxdMc3iUl4PuLLJvC9VxXj
	 3P1TpD+N8TC7vyVZZfYqu/p4Rzi1u6ZjY3ofSx/CbnwHwViNytVlqof3mBOyL9C475w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896260;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F4drlvlvJ5apWkmhmYqS4OSIPGtDt295cdnGHNUWQi4=;
	b=cVT5NyVM2Kgkni17WN3bXYSv6/iO2cNO8mmv7v+kXWn24foUn9W8Mtd65T1ZNDHFkhkb
	 6S8yDvGWYULSXSlrZUXEUtgGXmvZIR0lrc1NpPtj3myXM4szs/smcd/8lbTBNC2yIHMaG
	 439stfAIVgtVveAWS+efKV+A0mKbo/NB+k8nufCIURzsvbQoSMQbDr2I4pNK57kcxcrqO
	 gDru8bhjAS39dm782mpNb5LJyENkQr5V8qFc8HRj0P65AofdFU0caOHqLEeQl5MXe0Tu9
	 h3luqkE1Fk9Zgu8CNMo9BO/ovh8rSPHAIw+2VXOspdEL0DcvU8dvoWI0Q+bUVB5JlEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaTsHafE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D366083614
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaTsHafE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F981F00A18;
	Thu,  5 Nov 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896259;
	bh=F4drlvlvJ5apWkmhmYqS4OSIPGtDt295cdnGHNUWQi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LaTsHafETxawLWYl0/lFitIwrG4U6u7aRXRLppEN/0i7puOE9Eth77wLwUGKRhpvz
	 jtZ4xWkLZQKMSQb0CRgajsj/oQxQFeW5SM9AJvh/L1YLRo5Xe9+6APkwx+j1ztnuh5
	 0TV++vDJK5vAy2aN7vdA9/Lt60i3UPvgbOjFfE92U1uh50KMT2N17A6d0ojP5UN+B5
	 ZnU2MbO2UY0Hj79S4tYcu233VSzZbzLqb7d2dqpUmbGxzCoRNp0IiLoRyS5IRuJtuZ
	 ym/fKpPKYBSScmaRRsOTuzvrF+ry2cL6XnxhK/TChdzDxs5ITnuUR2Iufsy+SN8b6v
	 hzRnWrx5/GMYw==
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
	x86@kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 02/47] x86/cpu/cacheinfo: Move CPUHP_AP_CACHECTRL_STARTING to post stop machine
Date: Thu,  5 Nov 2026 17:30:00 +0100
Message-ID: <20261105163045.38862-3-frederic@kernel.org>
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
index 1ae03f1e8f84..c48cdff149f6 100644
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
index 04b62c16fa8c..eb6bbc610a06 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6003,7 +6003,6 @@ static void sched_tick_stop(int cpu)
 	WARN_ON_ONCE(!tick_work_cpu);
 
 	twork = per_cpu_ptr(tick_work_cpu, cpu);
-	/* There cannot be competing actions, but don't rely on stop-machine. */
 	os = atomic_xchg(&twork->state, TICK_SCHED_REMOTE_OFFLINING);
 	WARN_ON_ONCE(os != TICK_SCHED_REMOTE_RUNNING);
 	/* Don't cancel, as this would mess up the state machine. */
-- 
2.53.0


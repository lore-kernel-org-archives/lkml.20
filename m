Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB194FDA41
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415419; cv=none; b=Tj4tu2+AzOxW0oWvTs5GlNWrhqVI4zbB8qV+ozEmKYZl0LFMG1sQuxhPvgBX0TlIke/PqYXHb+UJT2AuKFGWBr2zD7nfADMyn44nSAmkrmBUs5NNXKP8NXIrdnt5LeMQFX+NP0w7d05bvfEr9wQ4rYuzihzWXR4y5UfXhIya3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415419; c=relaxed/simple;
	bh=kS2Es8Fqgp7IqReDQZWsMYuQq50lib4L9VZql02dj+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4XGXApEC6KrWTnGRvMzEl7AbpOmmfTIQlAeo/nZavSIZW1amkLU9FscJnRD7kgixkPB6D0nXgxW/9st0dbLcRhoPfy7K9IHsTLOTBHTK/vv+MZ+ydN1kRz9LQwKtVarjQy02huegrYeFCevTBqIot3SXRV1m2rpjoGPXK3WqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHDeNEIf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHDeNEIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FFE1F000C6;
	Mon, 19 Oct 2026 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415418;
	bh=H6bzNLxpYNUITKX58xGsvra/Cn0d0UUUdSZn56eyZ7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHDeNEIfiUoy/yBewk4Bum2FRQ2vVsMQ4iBe3RmKTpoWDvr9+gbYaQ4x7q1H2Mqxm
	 ZZ5izqE3OeuuoOGWUUyMMAQ/CzOECoVKW8MbmVK4Kclq2FBatd6KfgxSQ22+deq40v
	 lqOkHguNOGkSjWuSr5QhKMWBBfsEccG4cClIw29r2S9pjejpeg06UXgt1ahN2khS7f
	 7nt7zi5Tayg3TyWtAd+zzFMfl02B/et89puu6ydhVBy+JzF495IHGTp2PaJOQO4HMx
	 1iqjl4ejXinyC2wO+doKSw/P13wb0aST9NURBrQZSx5xi1j0DagEhPgB5vgoP1I09Q
	 OJ8gHgGMlXjGg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 25/49] clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:32 +0200
Message-ID: <20261019130856.49711-26-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index ca335111abb2..7bc94829b68c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


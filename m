Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04833E347
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415354; cv=none; b=rQBYzH+mgfTrfrCwcTkCWbWaJH9bQAknoWRVWYjcPWw31ztFT7GKPEHRMax04yVmUCXSgnL706SbbhV43tZLHqshTpiUp70lHefugSIIBavLEnAexJSIRjFK6fUSNUPBm09tppm1/SrGfICxNzEtkKtJItl27zqX/803TefqXeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415354; c=relaxed/simple;
	bh=R3iO0YBeO+1YLVtVxqieQpMSgmFrD9t366A6pTmbVY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqlo1l7FUoCkudxU/Q2ke2JihZIPcNSAoHdcPY5E+vXusN2gx39G+WwAeKYjdaekzDypcgiTUSur98wyDZzQ4fYBwRuySNv9XHZDEKUL3t4QaZuf8u8ohfyiarr4wJOLXAvQ+7ZQQGBxrEADX/AKaxjRQaP0R0+Tu8lHclcJF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGwqCAcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGwqCAcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F418E1F000C5;
	Mon, 19 Oct 2026 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415352;
	bh=8nPvTyyxaOr4cFb+Dot9Pu38m3w5s43XoED5ZCnAm0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nGwqCAcyBNhS34gjpubGAgioulyw0auaSVDK1GK8g1m9+tHa9aPBMwQz5zh5wC6Dg
	 OslyBdEekjA1djj3HNvZAQsRsJen1S7xBPRftAaNPpW4knWjOcMJ1HTtHnF+ikP7Gf
	 1BTb0JFXm6sv3wAJpfuRouAJFbqbwe3WhUzO3c2rYbd6XvnErqUsiwVPLeHvS9PptH
	 eXu2f3P/cgoyx4bgX8to82LT9ygYDnUvtJ+/Laa0jwpT/6elXFRC43DT9PudlgGMOO
	 cChJm+yceBqZI1iubY2l4f1zrL+S2iqLF97y33FCztBoHzaWs/5N6Kf0rvweQlfGTL
	 bfsGgykc863VA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 03/49] sched: Move CPUHP_AP_SCHED_STARTING to post stop_machine()
Date: Mon, 19 Oct 2026 15:08:10 +0200
Message-ID: <20261019130856.49711-4-frederic@kernel.org>
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

- The nohz_full remote tick can be shutdown safely while it runs
  concurrently.

- Updating the RQ clock shouldn't be a problem while offline with other
  CPUs around.

- Since it is seen offline, no task can be queued to it remotely.

- dl server stop is sychronized with rq lock. hrtimer_try_to_cancel()
  can become racy but then if it fires, it will just early return.

- calc_load_migrate() just folds local load to the global accumulation

- update_max_interval() only depends on the number of online CPUs, which
  is stable at this stage.

- hrtick_clear() deals with a strictly local timer

- sched_core_cpu_dying() doesn't race with anything

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index da07c804ff53..4f3f0ae36893 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CACHECTRL_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SCHED_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,8 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CACHECTRL_STARTING);
-
+	WARN_ON(st->state != CPUHP_AP_SCHED_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


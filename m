Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277D94FD7A3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415417; cv=none; b=YOElzB6lbvn3YVEBQFzqB+6x565aB1OjjKNfmBC+17l6KPbvWO5yENi0sth/L1hYuURO8fOB7viX+yd2+vAY1taeKCXcX7xv01qkcpw7XGAeoKm0DSqf5+wDgx6yTGijM6UrsRRdbWZSUxSb/0JBqFKvtFRyeKIYPcrWR90XQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415417; c=relaxed/simple;
	bh=Wm+rxjE7YHmz8PJBdzJM/PH/ADkxTKLbwB04Km9zwgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcE3X7jqpsZtesi6gw2wuTG3ofPkfKU4AZZkfv0nRNUgHJlZxMfY7kOP0tkECnpM7bFEWrk6qLt6DxNwz+9bjqevJk/Hjbens3NMjWwboMKkUbkDK6P9SQ/owUSSkzVV2qzlWJ7UckWVyJwlvmmeHatVJLQTYjK4jIUZekdJ2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nujvMSPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nujvMSPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEA41F000C5;
	Mon, 19 Oct 2026 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415416;
	bh=agCw1h+tg2HhF7GH4iWgeqQSvS4+wCtaUhhRsD0uEvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nujvMSPsk5RqsOR8xFIrjNXzPdVIxmPTsHdrILSym+8vouuexZcD3X6nFqHaY7sI1
	 LnSkTT5Zivnr1beBZLAwJMM+W/uCePLTKbl5s/B97ug4HssaGcC1L9SejTYajKTgBj
	 H8s+Gx2wnom28qvNlw7WEUXBLlQ6bo9VLIavpCJyLG1WJmwA0Fxu3/rxZSFu1HQRmW
	 udV66VpWM4oHJYtgmeCdFF5mPATiavo/XBhZxE/BFaotKw0WHHxMezTGQcv9FxSV2e
	 eSunQHttnzoMHU2aZPNuAM4FzkO6jtRHbnY2LdN9GXq4XyVne/588235beKHCLtWdd
	 +5euW+iEovI7A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 24/49] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:31 +0200
Message-ID: <20261019130856.49711-25-frederic@kernel.org>
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

The teardown callback here only clears the CPU from the
evtstrm_available cpumask, which is only ever checked locally for the
current CPU. And set/clear from other CPUs are atomic.

Therefore this callback is safe to run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 90d37ee0f282..ca335111abb2 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C44FD787
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415414; cv=none; b=ktm55ExedA9zrBjZYkG39W4cTrHxnrKK5Hcd+TWvwxxP3YRoWwHy8+LpWP9V2wWM6RPgHEvsg5+P3aU6Z1es9F3zOrrWTkMK8MpVcNmwJdClFr6yZKD1kaTxiU7GVKf5W+D8WovpBMmuUsNb3DvIqiaXniEFShdNQB3kzrzJIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415414; c=relaxed/simple;
	bh=hr7CC2Y6+9UIQuJd2wzdD2Auk+Y+v7QW0d4ptDTmV+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf7062BeQRL19R6LveIfMLss8SvSEAs7jOtsOyo+0HTgF8EP9LvqDCB+v+zE7bMIbtQqklrkPZq7edp4bEKgoifHcZHPNfGm0g3JE+Ldx1ehKPzEPKMii5UFleS8IqkHEUen4CBNl+POKpm8Hf2MODvIEhba5oRXyCW7F65241M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arD8Tfou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arD8Tfou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356A61F000C4;
	Mon, 19 Oct 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415413;
	bh=Yb/LHn6YrmdgZdljrcbF7YxTFHXAXRpDPhG81H7HP7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=arD8Tfou+Nn5srm0vu5BqKqra8FirHoi8VO58OWbN6bWw3bzWyqXcw4+7R2c2Ps7S
	 uzqeSmRYJ+ONJAqKAbj8SZGcbMcvPF9gUHUH2m2BnA1EMQ9AcK8sF2slwGvSgNVl7q
	 kcCLjlNxKRSJ5YuvcywolQv4rFImtC2YczNq5w+aKgdqW9aQLDrQvUh0o0LB2dtQVn
	 O32n6G2tIiRqb5r/KogvuX5SIQSWpjlZzDgLK7uLyH5aWsTxzHUGg4o0IIACVsgxng
	 PCZL2sHhtH7DKh9rC8HKH8eO3jrXp3FcVLYlg7hNjKHQ6P+rIkTLqS9sep/cy2xGbr
	 KBvHjmEwvpXLw==
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
Subject: [RFC PATCH 23/49] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:30 +0200
Message-ID: <20261019130856.49711-24-frederic@kernel.org>
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

The teardown callback here simply performs IRQs disablement, which can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 27e6542fb6c4..90d37ee0f282 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


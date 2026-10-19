Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764394F96AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415447; cv=none; b=CmRRUc0TcoqEs4H8YMtwtNjMinWaEsFsn9/3+IH3xcTauTwPsflTE5qufFXEHw55dX0nV+Pz9z6OiA6BRIfm3O1u39TTtiPgSzlesoqWdEQ/ndDzB6R06etWU0YagUwcW2TzUN9HEvrykUcDaidfE4KqWBPaG19ZUeGi722ia9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415447; c=relaxed/simple;
	bh=5EzxrmdgmqQ9Iew00WRgtRfDA7oqqYB7YYsMO65ww4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKQ290U1HS614j0o2wJiDCADjh651UDKzUvYsH80gSgaHnrJWA2vsz8hWyQWIJ/ClEY/2193A5TYX0OWmnzhtNcJT88K/ySF0prrsRfIXiGub9IjqRGJ/gQF3hXK/0HrtqLPcMNEltVpReTVRuWN3Wvf6gslAK80syF3AQoDxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMd05uaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMd05uaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596E21F000C4;
	Mon, 19 Oct 2026 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415446;
	bh=cHFewh0wcyttEz9ahpNHnLuhwWl7Z9G2VM94SDy1lsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NMd05uaauLu9V8d8z8nwRBeM8iidHey9WAmBgX5YD7/yrJju2x861SZB5PF4Feuyr
	 NlSjkSyyg+AHO9gGRE1WBHFXCFzQ/25PLYGC9JbdrE4V/x7Dt+q2vLLqFIMYnjDf46
	 kTw5HHJHusj2mLJ7tOdF+QN36XNap/27TcK7M1/kmG7fy1Qq0S+orp8YEQgQDLJm+r
	 VRh4pX/7fSO4SeTJuYekHXFUpqg0NYGNBsHecFWbikApHunEDYE28Y13Lo4DIzXPim
	 oIw5gn6On8KhIMCws6vwBsH9UAf0oPx7oP3DQzdJE5ciKYNJQ2oc1LePiwOlo/9xVK
	 Q8aP/Ecc7TYLQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 36/49] clocksource: clint: Move CPUHP_AP_CLINT_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:43 +0200
Message-ID: <20261019130856.49711-37-frederic@kernel.org>
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
index c2f25b6f72a4..9735d6cd01d8 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RISCV_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CLINT_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_RISCV_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_CLINT_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


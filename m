Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC764F96AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415452; cv=none; b=eQPhpMC69ZwLUIsDtsElCb/IEf15ZdJ5IfFJQv85eO+SROn6V91ZOPlt+h/PH/wZDrAklNj5JqhlnQ3YzlECQyrBxSAUm37dWlfC0Aup5oJbee5t0AxUebE0IlFGgvxKUtVPqR55SmgR2pNubXS3343Z6p71OOdsU0o27jlZ4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415452; c=relaxed/simple;
	bh=OYGIRsiBHjIubpgZ8VpTEio5MlHSdHaL0B9R9j6iIA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsmJZL9BFvKjBAsdSycGCu7PAPxaSeoNei4sw/6BzpslsK/R1noRfHuCWuBmVexBqEE2oxVqGOzAAn1sYu26bXfI3km5wRzfuNIhTe3mHgIYVxMYRzUqFUXv6ssvRESoFi8BoOFNpjGcJMEqg59DkkkidCw94WEbsQhw9HEg6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0hXcuH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0hXcuH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2227D1F000C4;
	Mon, 19 Oct 2026 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415450;
	bh=IKOpEZ8w5AskyWGbA+4l5TeFJW9axDk9orZvSRY+hzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m0hXcuH/YJSiTeaFQL1Eyj83kZlUct24UNxZR4hCseKt8FHV4iC1taAa4NydvOsF+
	 kGXnV+q0LfpJ65HPAeRKTShpAMUfAH9+8xTpQ2crnBQ2qEC75eIt3k/wzdzfJhMNrA
	 wyGYsBis6nUN6q3S0oGAuWEmOxteV3GjKXjpHKOPEG/eZXtGTsg1sIQ4xDXgcKnfyS
	 t+rrsspGZkZUIlnkcOujsD/kmotI0MqVxAshysuYHKyd34XbeYRnRcihOk9h2Y1F8i
	 8DSg2LPXk91uHa/9VO26jRP57Kw3l6v8LZDRYT/qLrg1hTdzq/vkY/SmUPEYBDylR0
	 PBjY3yaX5IOQQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 38/49] clocksource/drivers/timer-ti-dm: Move CPUHP_AP_TI_GP_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:45 +0200
Message-ID: <20261019130856.49711-39-frederic@kernel.org>
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

This state doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f8c8fbbd0628..c2356a36d345 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CSKY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TI_GP_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CSKY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_TI_GP_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


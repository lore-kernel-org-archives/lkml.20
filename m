Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896378;
	b=rTn2JxSR/gnCNzrVF5FoKBW+QMDbmOTqfErPgdxGUJclKuq87Q+60Xg5mpJIOtW16QvW
	 DzABuRNdIxHd6lUylztCtP+3T0ZIashszhe8OEuHanITq+jU5arYAhAYz+C59R/Wjzi0L
	 uwmYXfSkoKOeF0K3EOi86PhYuesHBEWiHECKdQLd7GS+sfd5+H49NEWZc1d3RQ/Gu21CT
	 kKPS1tkhM7EPz4QxWjAx15LpmcwDWVYH6qAxx8IXLS0EJPCXJfwoRZajvbFJobZCIhtp0
	 n6PIl49IRKoLup5G75bD0ZKIpKKca/rSlRLWwhDL4q0J99hPCLvrZVWx2kWpYUQuJtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896378;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=daaGydOz1Y6OADJlLIPv7bWr3S2j5AgKwUzJ/93xNMQ=;
	b=u0CLze/MCe/OvtM8uvlnc6MrsR5c6zOHSTIilKOYdHyP9svaEKIc7K2LPfHlnjEC7jO4
	 2QRkTv7AJQNgTJpbuCtYaFWh00ByUpXXpNis3zjDlHuc9q/QUAl/yvbLsm3WmP4bX9O2a
	 RqLs3KefHgkS62ZZ43uVPSD39l0QJvxoI6dPHb4M/rD8p15nAubTz7pz4YKvfExry1of2
	 X+eYmUWlq1ideKqO7OSB5vHyf908OEV7lIqlEvrA2O0xAqkDYlvXu6O50ZHURs/ByAora
	 CWRwW3Bfoqux5AiMjM9Zh/hmHb7ClDURRaWlh0kDFzqtvf6s6FS5ENM719DEzvSsGqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmR+PtDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893EF60A260F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmR+PtDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471361F000C1;
	Thu,  5 Nov 2026 16:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896377;
	bh=daaGydOz1Y6OADJlLIPv7bWr3S2j5AgKwUzJ/93xNMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kmR+PtDfFfgLSvNRrok2HVM1f+DDb8qLbeq7s2HlItFlZjndAm2Wd/tlOadAJd/fv
	 n7X/PNUYK+2cVqJgrr9i9ol3Wm9dvUaAPsGLIFn4O6/FZtdM7R0ZIDQN7NIsbHU1lU
	 DdbkDDeRLRpks5403Ix3nSLcY2wtb4A7Org8TUTLsBVdy8yo1hCxrB88PZ9Qx/QW/x
	 1dXfhkAkwMC3UTmW3zSItdNyRmLTYvk6sOfJbx+UgW6sGKYGYE12QY1sfHSlaM7Qup
	 WZE5wI2fIAK2SIfmsL75ziIcrsPwhC+z8MsJ+gAqPamTdcRNdzXpu3DRF8bi2k/EoA
	 6u+uaHmb86ELw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 40/47] clocksource/dummy_timer: Move CPUHP_AP_DUMMY_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:38 +0100
Message-ID: <20261105163045.38862-41-frederic@kernel.org>
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

The state here doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b49b67ef5ecb..47b33c6759aa 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HYPERV_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_HYPERV_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


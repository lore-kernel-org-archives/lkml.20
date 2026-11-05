Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896335;
	b=UZEm37w+6JZmHHRgfGM90MGFvlEsGGormvJGKYQ655i8KTFgblAy9frvVg245SHnC8XW
	 JWGPdMgSS7hprab3O6rppK9rGZTuLIgdZyfkAXT2C2bdnsx3t0tq9Bnj32hxYbrIXn9vq
	 Pe6X/jIbWYeLNtE5Al0Y2fmWeq4m6WOeR3cbjXhAeV+ozmDNdpZIywBGBc/OSrumh1KUR
	 +Nev9MkUU4BQRkfW04bHgbPGZIc7pP2uiSCpKHfUqNFhShSV4i0dn8Z1GNz7T9yzyO26O
	 5OJdZ8FegLXYaBEwU61S6CdXJMn0SVvYlZjgxdNGUzPUzsJZcaItnjr0ZSoRvbapung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896335;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x9LP6CXivlT650CDHPY2LNyMQwhkNHnjZr4UOIbAV+Y=;
	b=MxfVJSyCOQ0OtuV8jA9WPSmYmDun8ziZ+cqDbsX96QbSXC6xL1FuqCRIv0FC7ZMEkZUh
	 7iLCDiptJF80KbZdgjkqixQ9MNfTe7T1sZJY2Lebj5zVmf0PGezwe7Szn4FOhGkL27a+A
	 PG2doErT08fMYH+gbaEQK15uyjcQ6spo86BwVVw+AyNq5YEnoy1fHgpwRFuuxMeRD+21h
	 4t9VB6ue5A98bldapiIFeQaEoErnjXQjsmCMKNGrIdtlDdj4DPyYgI4AHnGpj72oYkNTg
	 7R/BTmtiZ9WmjjKQs/CUin/few8RE77OHbit5drkaKwL+FEF/EYi3Jb+2dgeE80v/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUxR6E4v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E7606A92F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUxR6E4v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830281F00A02;
	Thu,  5 Nov 2026 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896334;
	bh=x9LP6CXivlT650CDHPY2LNyMQwhkNHnjZr4UOIbAV+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BUxR6E4vRBW3eyixM5PsFYHh4FFjOkAAnNJSfvyEKvilcdL21r0IBYDrzS4JHHpmA
	 OLxI7wmY0YztOB6kMK0fiojVtGzbcBeKPZdV0AjUo+265Xt0gEKsyAFnr1ZzGuIFPF
	 QUigmCyDd9Py6lHXbrGHaJdGNx3Gr4Z3zEyCGXeMcyEDRSv+mMcMwUatVn5Z/sLvEj
	 Vg3jH/53ZS7xf7O91QTNlOM98SmNTGiQ0peKWKcUJstesJ1LuyJ7MlDNzRbHD572MI
	 RkWOV8GoEP9USzQofJ1OPbOIGYKvgkf/0W6MUl0Ylb7YEhho7N7uwdWzkbphzl2R6U
	 6yZU7m9Qkqfgg==
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
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 25/47] clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:23 +0100
Message-ID: <20261105163045.38862-26-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6f4c609163e5..d980d11abf27 100644
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


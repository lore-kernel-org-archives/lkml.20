Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896366;
	b=wXCRb9Hj41m81bmRCsJI54ppywO5BT/6yYjR5Jlh57bwqjVwcrLxg3wiRSLXFVf4L2Qq
	 h7c6jeayxru/Hrb8AZbmtdMuUMyzpAMEMhuF4misMQ1RM7ZgCqNQWKBFJUqAhDJK4tRhB
	 oZ6wEEVldrXWTYnPXrWuZwiPjRGvQHRi6FvApZvPmXvtV3s1ENjum6w2DBFYfeoUyHzIJ
	 L0odHPaRyqjp7ygEObgnQ1oivdMnMG3v91vcJpM0FzN5BXEfAyokm/IG8bq2Wg0qj7HqT
	 0uwgkwZqVkGkggbqaQwnkuR+tSsULZw59j4UI0TOT438w4Z+Nrxs1NwIPvMqfGiu+MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896366;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cpsPkAp2Rrm1pPfJbprfMW7GjVyRJR3frtLl+XFKrCQ=;
	b=A0QZZbYtX+WQ82Ra1IceSI9qpVqTg6ULq2x7stWkbzVtXoBhRtmlXSVGz0b3V6ExFlIy
	 7aUcriuL79wIy81RvavyOFGzARYm9jDFiJIEpgnNU3TANvpmrYPdL0UCI9cvlC3U37qUK
	 bhDWELu93vTu9pX8k/hxfc0G8d/d9iMOt6WWvCY1K42Wk3CAfYcLDv+63L2HgEFENXDdu
	 eZOgvajbtxyqBZm0I9IWncbquRN1DLPV3ZAEfN+qiHu/d7RI/0kn6IKqb5/+N6sGmknkX
	 xoAoetPnnAqj2h7/nFU+I5lw8+nPc25UxLfx9JuWgwSq5ihEWLGGHUKNEzmITYzFDQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l/1lLDLJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D5D606CBF2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l/1lLDLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9311F00919;
	Thu,  5 Nov 2026 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896365;
	bh=cpsPkAp2Rrm1pPfJbprfMW7GjVyRJR3frtLl+XFKrCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l/1lLDLJsDWJxlXfRoD4dwwDVAWE/D6V0vlkos62vJNRKKVOJr/Cah+GZkfsgymOx
	 90spIYW/zkZa/48aYvKNLg2T1FCwzNIsuj8fWA6lnDEg33rmqGfHpaPsAj71IOhPr1
	 STcGDsF4iZKoI10Fz7YdDMn9+e9BKEKFraYaFsOxdJsBDZJaDV6fRwmbUrmFF9S0wT
	 kHEioP1BS/8wB0rY5KsETXl5mj8L8p/8pj8Zbaownc6DOXKnZYcYrriUuA/NRrDb7c
	 FRFC8Q7eLHAEJfCOsk2rD2nRBh4T2aGlXRzMEmx+tfXkLfChfp/81a8c9SkJvkaKlH
	 H33PRIE91Oabg==
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
Subject: [PATCH 36/47] clocksource: clint: Move CPUHP_AP_CLINT_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:34 +0100
Message-ID: <20261105163045.38862-37-frederic@kernel.org>
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
index 04692ae09199..01c343b4daea 100644
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


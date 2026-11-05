Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896357;
	b=hhtHu8Fp563RtDwaQHwqBIwxmTndDyq7j6fQaE+xRjjqsPSjjjR7iO0z7br+cLd9bejy
	 3ts4Elw9FpI7DF7OGPOcJANCVuFtX+XkCLklmeE2VP1RW8QsbbdBbFYeRQlzNJCvE8D6T
	 fKPAL190uSd9W2JKBPA2OnxZ2/3Netn7eA8hGY1gNzUvQ7guWEHkE2SojbciG/Wy4dDD1
	 oU8Ymq0j75xWQHd6CDZd74e46pOc4disUQgDC866OxYyjcV9ZXwhoVOR9Y7w04MISuQKG
	 CDfXPAeCWfbrvYMdQAe7Ni/bTHkNSN4kmkZuY/r6TIyXIm89qLagNMU9zRSLGPcI+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896357;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1QYv6eJfoY0AD+wV9/qT5A8worb2ZD6rE8Lmv/XuSb4=;
	b=3elkytb8d2TJF/4IXWKPnL6FP/lakGUYdF+kvY5f1xu3HwelGGikHjHbaVJOQX+i5QpR
	 WV0fnRcdf5R9Z2qRavWXXxoLK+/kH+jr1SAUuSznT1dLNEyem1+jEY4wWtYp6iMX9dXhF
	 Ho4Q2/yoaKwHFeEpU8TDZTC5fEKeof41CL9k6L+sVdDcwwzH3IFAc6tJ8klSJ4x2A+iJC
	 n8M1KdIZB0Bc/Trcbgx4SQ5LotlRJLWGS5cB2vOYBwZvmRSC3AWct8pivH3+T1Qhu9cNs
	 8X/JCK0wDdgBviF8PmGMqaRalg1go7mdjP3QByDZMA8jABoeIhwUeiPnmmBNXlztTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7hvwOgv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D1606BF2E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7hvwOgv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDA51F000C1;
	Thu,  5 Nov 2026 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896357;
	bh=1QYv6eJfoY0AD+wV9/qT5A8worb2ZD6rE8Lmv/XuSb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I7hvwOgvtbHLs7Q91y7YbuBvYoWXhxnPjTQ+0ctrocYtftCoh2R+ip7Emtc3Voqn1
	 JfjdAFE1cebCf16cKvAFtPAC9vdxkyYEmbx07SkKNLM6bUhIBieTBwQgG2HtfZZVWP
	 4YB6ckKdZ4h4HeqsXqFpA0GJz3R60vxoITIVmeQVb19lYSEZ+tisd09hE/HXe2XsEw
	 uB6Fos0HsKaBajK5AWZcx6Gw103IB8Ecz9japmGWSS+kLUq7RpRonqTUjTckAhdZcH
	 Yl6jj4DGtsNNGwj3/1oK3YVFA/mIqfaY0K0s1BEvg1wXs/R9T9Ee9MsYEl8FplIjTi
	 4lWQPgAmij4UQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 33/47] clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:31 +0100
Message-ID: <20261105163045.38862-34-frederic@kernel.org>
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
index 4451c5997cc6..3fb757c6bc7f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


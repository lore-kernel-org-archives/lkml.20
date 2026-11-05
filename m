Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896284;
	b=kDEJla5CI0jAmQx/IjOTRRc8bRV98a2vhEFj+FnaX/PnWndkM8RixlZn1bzioeZMvdE0
	 GQN1to/glV6EsvWjGJJI0wfNCPI/99eTEBDsWy2uWegKg45Ntc2BviFLcMvGKzvTrNmtX
	 tPOAHePVRUtA72ve/ZlB44cwkNRmTgHb/Jqe3dei2hVXVQnAblr0l7Zr+2I8moFQXwIED
	 C7BgfM1Xj31p1dWQ++tq83nuduerMfa2D3RP8zt1lH9zP5SbXcWcuM4D/iWLjEz4zGHYN
	 LCkDGeZ56rjKvfrhnYQeqFj+k/ionDqkRqCapJvsGU0WpXSLjoJ8MAdvJbiGKdFY4QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896284;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ojdQO36VxpBln+lcBBfyYeZVhigXx2PzGxmPWtpJuqs=;
	b=ISuBwQMKgeAJcn/hXJld7dPOL3rg3ae9kzwdNEEp/RzbJYUjgYWSswMOCKu8EADZVUnL
	 Ra/pzD8V3wIrG9NKFY5uYcahF4XmTKGHJ8kGXEvf2+zr3lVcjKRH+4mkpaCSAtULQnooY
	 c1jh22vGrH4XAFvQMBZhmLQSamyUnbXcgk/lqnbNq/AiE3CYEZvgbD3hdqpHp/qTVw17X
	 QW8PRHaM8hIyE+7KOsOfeUHKucS9aGrkmRcdUxDGUrNG8G7PD1wnCFLnNQqJecVyxUANQ
	 Ao73EdsSOojkCbemVgfngEe3DZfmhuKSNeI0MnkLPUivxaa6QqwdskFteoZoNlFnqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyFM2slw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095260A382F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyFM2slw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B91F00919;
	Thu,  5 Nov 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896284;
	bh=ojdQO36VxpBln+lcBBfyYeZVhigXx2PzGxmPWtpJuqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SyFM2slwcNEzQxdyqKnv71uJj12gtCsSIyOOogNNwwT1c/UhRQe6GO/k6PVXzplol
	 PvCpy6c8Rf3DbAw+A66Za8aaUbyDfTK5qjqyknbuDUETOpTDfDT1O02gxZOgvBSq8u
	 cKWVvex8KerxG7LcILXGca2TLev7nlLjfEb9DP2Dl9h6hwexbvA++R+Kk2lS/6qiPr
	 GkSHdgTNGKCEoeFfCjnz+OcKzaPODHU+tM/atsISP6+fJ+prbOkaG0FhOXzbzmB3E1
	 ZFggRmplMGIYY4sjZSvaDPKygIV/n/bwGA/YuPdjMFGnNRs9yBvb8OrqVTMwQfEsrJ
	 35tw2r/ari49Q==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 10/47] irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:08 +0100
Message-ID: <20261105163045.38862-11-frederic@kernel.org>
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

The callback here simply disables a per-cpu IRQ, which internally locks
the irq desc. Therefore it can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2200c6691ac1..c7794716bca6 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_AVECINTC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_AVECINTC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


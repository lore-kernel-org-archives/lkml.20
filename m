Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4144F5DEE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415376; cv=none; b=J4zT/HqZ9hlpboSepGQeKh6ixhGNqeuwtwyJUTZAuwQhIxQX6WnUM+0JP66c49Z+ml34DzFo+J+El4snEE3C5pkR5tAz/LsjMqjhsLjRANC9jKAuYIY2q1QKmQDq45B19286Rp+3oxnqrrnF0MQxkB1HN8ITOnU8rWdaWUx2S1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415376; c=relaxed/simple;
	bh=k1CaHKbZTa18Bgyna4lmqvaBNjEqvnjmg3voQKlH2Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CV53mnsjAghk4rGx9xK2eiG6Ur4Qt4m7SS2MTI+nPKaeXliNJchxY8sW9AUhT3QlY5LVapB8wBXoMzHWJH8MemXkNz7HjZG00YOTcVUZRnCXlrywSY6SdoC+So3DOZdA7OlIFXLaW05hRtl3HunKThuDs9uIGxjsvRgJgzJmjk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqPnIbfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqPnIbfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9334C1F000C5;
	Mon, 19 Oct 2026 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415375;
	bh=F+7OQ7D99zBUWcKXmR6nwAllZD785ROGHMpCqf6hFSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IqPnIbfMaf3qn6e7ZvIzXImxeewXsjgrrAZT4suwmBgNEDObCHzzSmrfQzT/tN05S
	 2dV911lfugPPx8edesd5F9XePidBHABF7n913XODpLz9wrrwG35MmU8QinpT2HwLjY
	 IE2NJOdLOm62ffQ/QJ4rHEAl0eWs0xJL4t37wnM6w7uibJNDjR+3a24R2gi2ApaT0o
	 9EB05dXByktSzDHeFbjRjy53d49c9tcW1Cqj47mcOPfL9DrxMCPA6JmjVcCMxmdapP
	 cTEhk50FCB6S4MPk2bZxJv8sRbX5OCOK9q70mrhVjC3WavesRa8z892ADlzzeQ7Jaq
	 MluhGCk5JypJg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 11/49] irqchip/aslint-sswi: Move CPUHP_AP_IRQ_ACLINT_SSWI_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:18 +0200
Message-ID: <20261019130856.49711-12-frederic@kernel.org>
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

The callback here simply disables the IPI in the per-CPU region, which
nobody should touch concurrently because all other CPUs see the current
one as offline at this stage. It also disables the per-CPU IRQ, which is
internally protected by the IRQ desc lock. Therefore it can safely run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 661648ada894..6acf07afbaf5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


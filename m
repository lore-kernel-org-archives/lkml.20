Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827E4F96AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415382; cv=none; b=LQ6DQPKeOsnY97ZNjfTrWJ+Q9hJjR/K44vc1nah8LvJkUkVwCUk3fpLIMPVpRmHRLvJEbd969XEi03gdmmEnelu0mYPrNaaykLUdw0eM4vNZ0sE7bNfj8DfcSTlBtAaqKWtZGxFDUOfu2EG3vpOoy9jz6NnGoTJ5q0XVogsU7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415382; c=relaxed/simple;
	bh=CA5OkNJQB8WQZciYKTJS2BujXFDYjwZje2SAAKsthdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSVtw7zuC125gLRA3mcE8kWfEDNYcNlX42ulZ/KsCS4uL3DL/ru3R4zGVwh0qfaqTzbL/MjhzeKcfSIcfcq75ZpoX3NY9LHd9Spm9cMN2hSvDvpOWcwJbdSYf4A4wBlf3nb65n7JnZGFm+fV2TkqjkbmxXxO4tpLYdd3RcDE4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLRS8Fme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLRS8Fme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3089C1F000C5;
	Mon, 19 Oct 2026 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415380;
	bh=zuYU0p6gW3GtlURDrEitcF0tAGS5h10jmHmr1crmBI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QLRS8FmevDl0jWckmFq7s711Sak5mXMHcxhqSpcfxqhrZFndP/xrRwFiPf4QQERk0
	 QmUAdK+zBJ1479JVVaDGYkC9Hd/CAx91xbcwqFGcMz3uvUEqAUtb2O64UhnJ7w3z9E
	 0d0rB3UWwYLIjh14sZihtts0QNun7MpwjR2fqIoWMQpCyXrvDkH6G5iVv8E+VcvLn4
	 OUEN2vFho1GUrGs1pJywNNLQugSg7I8Qff2ayeMbt5hH9c/s3Xfh03My5kjJIefDzB
	 fGDMFOxb/D1kemjNg2f8TOxCyjB7AwSPzOwrpAaX/2qi02DIxwYUL6vWvJCvhYKxyd
	 +33D3i1UXrULA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 13/49] cpu: Move [CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING..CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING] range post stop_machine()
Date: Mon, 19 Oct 2026 15:08:20 +0200
Message-ID: <20261019130856.49711-14-frederic@kernel.org>
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

None of the states here have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index ce4e2ece371f..5ac2a925f7d6 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


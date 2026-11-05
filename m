Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896383;
	b=gmw+zu45ma3HVUpZ9AbTxrIrPQntbFxc1AcW8hN+tjgn9aGux4oS19dJXcWOlT99E1Oj
	 meJJoxQ/8m9E1KoYP/107PdZL/wo9fwmb/4rLq72oId6q1qKqlUjmCL7ypkg/frjyUEee
	 AHYxh4jF6iNm/EkJY/EXWWTXLEgT5vlDA7pVF47n1M0GCWqv4LmQfYv2Ii9v+MF23ufJ1
	 coQ7p6I/KVJ3JUwJtu/oiuPjBN8tzlnwE0pruMb6Qd7SauL59uNXDQTX/k6+63giQ5DRV
	 wFBCtiToiQ7U2UX8rUKI0+vR9z1jco/PZ5DAwletLTv4p1l0x2OIOSJE6sAHF8UjjLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896383;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nwcv3++i/TErxV9xDiR3YHa7UZm0ogEpvwslfNMrSKw=;
	b=R7UMs1Su0eNcPcgCsGg4PFNGMmS2Q08Dz3awEs3/Jl9k7E4olIW/6vp0iccgnzwMumFl
	 2Pb+CxksozjI6GSivqa7nN84XchnJtbnxIZbiikcl0jRETS2K2zUewdCRIw8N78/qcyaE
	 qst79etCMqdCu2rORETbOVTTE8aaMyqhYzMJYHbmipYAXqo1bb2EosywPbawTkKii7A5r
	 yuieDcaRfr0Aw3g4WsgEAAoMor0WhfB/sbB6EMiE9mG6Ftjk0JnJ/1qZ7hjZZHjudLqS0
	 k/XSxW3gjZbh2T5mAol2ESLxr+/Np5e4jUz6H95b7szpio0VRcY0nA00XqbGErscfNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P75fwexR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC5606F910
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P75fwexR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4723E1F000C1;
	Thu,  5 Nov 2026 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896383;
	bh=nwcv3++i/TErxV9xDiR3YHa7UZm0ogEpvwslfNMrSKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P75fwexR4gJFiahlfIxkyxWpB3L3R24m9VMsdRU2DeFdynhRxI6Mv/tGKBNNcLQGX
	 dCmseJ0J8J9kIgdhwZYQvA5XOUF8hdP1dQflaaUlqm1z1Y3nXmLu8VssuBeyePyGfy
	 IcaAMk+I3pTy3Oj3HrbleOyt/eM9jYW7SMj3e8VUBb+sAKsFzRlQOnJsjQXOnorgoO
	 Z8ESdYweptPpmkjT0DgNh5xb4dCHDHpwFC9SHEyYQ2HwSDDNjBF2SGI2JMXFQC4GOU
	 aVF8UxEp9s+YCLgMYtOkr/v38l29QGZcnNzgcmoV3nJNbGEjNIk3Nky73/Yl3P6PKx
	 CaUTEE/Zs19PA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 42/47] ARM: xen: Move CPUHP_AP_ARM_XEN_RUNSTATE_STARTING and CPUHP_AP_ARM64_ISNDEP_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:40 +0100
Message-ID: <20261105163045.38862-43-frederic@kernel.org>
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

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 5c84a39f6f06..f1672902dd2e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM64_ISNDEP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM64_ISNDEP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


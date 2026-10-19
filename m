Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3AE4FD263
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415408; cv=none; b=brAi6WYrOnqV4R8b66B6JISMUAgpgnJnBbvrC8eozcJKCjxoL8J3SmNF9GKKV/6BxYhovQbIEmFAT0ko1LmTlTzE5/Z/h89wV7uFJt+UKv+RRB8ZFf1ORfsNgM8sGVEHMcWo6shJBeym6xS1cVIlddF3rNQsU9TPx+KDEwWfiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415408; c=relaxed/simple;
	bh=i2RWjea9mxD9svVgNnDGLvHTA219cVzxecBM3mzB0v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWz4VeNMEx8ymYhS6EMtke1wvvyxTAbTdTTXhuKAXKGvZKvK0O2oZVBcZjgfgjxbV8RpO0MwYrczIYbWn8wDq12wXH5Wc4Q4JWKnLE1pxHig6pLAAoN1j9mZ2FJ2GSafQD7EsM9e5a7xy0d4vcOYxSIXmyaHGh44STjW7qFsOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFLzlrrN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFLzlrrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76411F000C5;
	Mon, 19 Oct 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415407;
	bh=JfFnHIQswXgjAATM2WjaIntcOReaKHtse3Er3j4flI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GFLzlrrNT+70mA4GzKfeMRQNoaifWC7yKQlW5LhmrYCpOt1NItlopgVdL/5SX/es9
	 /C/UIhXQso0AN0oXVTdy6lYWAwYo0Rj0eeZRc7dIIBl4582zR2YkinIEZbOi8vfVkr
	 zrKh8N1yM5Ru1kk8qPkX25+c/2rZnQ7zNjNRxpCSqV5RJxGzl9R98lGN8TOB4Y3gwP
	 DWwQrHPF6LFcRVippaz1QQi+d/lfBH97dumtl7sHIHuY62jUrSanx9ELq2EWTibXso
	 4Ll1EIXdq2bIMe0odF7DGEo5VskUQbDhCDzsh6E4noYg/Su3q38rZyYGZ/rVuxKYtQ
	 eZGgCLlAMnKwA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 21/49] ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:28 +0200
Message-ID: <20261019130856.49711-22-frederic@kernel.org>
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

The teardown callback here disables the L1/L2 cache prefetch and the
write full line of zeros mode. These operations should only impact the
outgoing CPU and can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c69a265e4383..c08ef67e3499 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


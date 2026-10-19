Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1D4F96AF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415380; cv=none; b=EyRrgS6NJiMuDYglVJYwoxy3CeHgKGSI4JZlQ3yAmDEql4m3OYHED5OJ9iN+g7WW03ppuQ/Q5g2C1j2yVqOdvu2bZzRdHW46UXvAhu30BFTMCupOcgxbDVFmMVlL/VzhZnFqznI81xbPbv6RW8AwY9Mhu2WZcA3ivHQUIURWRQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415380; c=relaxed/simple;
	bh=ZACgpChuNbU0qCfghkD59qY1+EPkiwhHcMAN5Wi8kVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BN4bwO8Tz3BXVdGInDIhdapcJFDZXTaFnL2uW+9ietzKSs1SPKAF8ekHYUv9uGgcEyG7LYe+qLLwyvnJhw0ZZsoZk6wZ0Yi3i8HPUORAnsyQhhkzg33T24pwxoRFsDVfYTH8xWlfzEU50SbSlXkhyyIBRrHmCMwDmvEKM+q9a9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2v+7cGp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2v+7cGp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1A81F000C4;
	Mon, 19 Oct 2026 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415378;
	bh=2ltEc+eZxkTom69hLae+Xdkd8PkspZJkmoyFqTkrd20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q2v+7cGpgqUftBDwzL+ctAj9tyHalWz8s0rPAYsKAAmNIt9/0O6hqTIsGFlPGT8ne
	 tuMRGBpoRkawpYukoe+pvwUrSR9cex9qVMwTW8+447169dalWHlKg2zMyiGof4c/pG
	 17GdUEg5BoSLcNBE0NMfUpANAj2J2YyVDim1JAqYnBGbtLmtmSdltn5c2aO9xFg6HN
	 IFta0P5b6vmaCzKSo9SGkgyxUqrfwrHOApDxbC7vKwHgsIbABVc04ENcrXyqraSQ/B
	 MEONpo0ucfT44H8bLg+jRmb/BngOlxuRBa518Fya+SkIQ2AruYrM0ORSFgphlJcKJ5
	 fOjfgO+V9n3XA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 12/49] irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:19 +0200
Message-ID: <20261019130856.49711-13-frederic@kernel.org>
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

The callback here disables the current CPU IPI, which nobody should
touch concurrently since it is seen offline by other CPUs.

The sync protects internal datas with &lpriv->lock and the IRQ matrix
offline is protected by &imsic->matrix_lock. Therfore it can run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6acf07afbaf5..ce4e2ece371f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


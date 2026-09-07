Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2451D520
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799245; cv=none; b=qF6J1MWOjH/FJ1IkyCbkk8/KVgpuGSlz4cHm1MlEWmRonn+w/DMEgvYC8au7Ba1s1JYyah4ZoNCSK5SsnQejjJBMm6VzLSq60RZxcaJMSh9WkdhG56ubrR7f9WZlC/7dbyuD+1wo2SHbsKmyB254mcqJqg7sJaRxtO9AKxA4rP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799245; c=relaxed/simple;
	bh=F/eIKVxoRM7+eCCK+fTCtxM0onowSoTzMu5Ye07uNJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROK6rZkwP2nHtr3Tj8ilr1H/dw22HGOsOSgeruJA2WHYY+mwqH+Vq02jUHkRCVFvZIr90ulpToTsqZMGAF5OyMhm1EFM4DJU40VtWCrW4n839CGmfxplcLu4RXItjtMxMoE7tz49d1lZS0fK/r4mDBVFgATJekA3mS0pAxvHNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqQiwLF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqQiwLF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86F1F00A3D;
	Mon,  7 Sep 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799243;
	bh=PaWEgmueo8IVck4dwZ9rseBcFsOQjJHuo9EpQo9RZ2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GqQiwLF6RV4PV/kPo9LX/Uy9wh7QegNKRRoE7fAt79YnY2JfLZFFZy60iRpZOp5WB
	 tdjgrwZcdhoE1wd/pTZSJfNdGTo8O5ppaUQI4ffmQFR4/9ummYcWOwiO4PJ6CBotNx
	 sHVV8Kg5d3WlkKtpMfEcyWchmhitnmtbqd/ff8eG02835Scub+c5eC+InTP87TQY75
	 unamOUxBVHNQI1zhqs1SffAPEJF/g1zbbRegcGwI72bhowr2OPT9SgceLYEdAUYk9q
	 vtGYxNdK6m5Fk8UumgaEWP2N9XxlKr2NLJmo4G+Ov2xx7JSi3QK25FPrFpgERLqK3a
	 KEBuXf0R5I3dQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
Date: Mon,  7 Sep 2026 17:40:06 +0100
Message-ID: <20260907164024.17164-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some architectures (such as arm64), cpu_relax() is effectively a NOP
and so isn't particularly efficient when used in a tight polling loop
such as the CPU state synchronisation in cpuhp_wait_for_sync_state().

Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
that it is executing within the kernel and so we can use the more
efficient polling mechanism provided by the atomic_cond_read* API.

Extend the generic implementation of arch_cpuhp_sync_state_poll() to
take the state details as additional parameters and polling using
atomic_cond_read_relaxed() instead of cpu_relax() once we have reached
the alive state. No change on x86.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/x86/kernel/smpboot.c  |  2 +-
 include/linux/cpuhotplug.h |  2 +-
 kernel/cpu.c               | 13 +++++++++----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e919b7..362f85cbdbaf 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1138,7 +1138,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 		pr_info("CPU %u is now offline\n", cpu);
 }
 
-void arch_cpuhp_sync_state_poll(void)
+void arch_cpuhp_sync_state_poll(atomic_t *st, int old)
 {
 	if (smp_ops.poll_sync_state)
 		smp_ops.poll_sync_state();
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index feb32949aeea..bbcee650155f 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -509,7 +509,7 @@ static inline void cpuhp_online_idle(enum cpuhp_state state) { }
 struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
-void arch_cpuhp_sync_state_poll(void);
+void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 97a9bfe4edad..d9fe204f02cb 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
 	(void)atomic_xchg(st, state);
 }
 
-void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
+void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
+{
+	if (old < SYNC_STATE_ALIVE)
+		cpu_relax();
+	else
+		atomic_cond_read_relaxed(st, VAL != old);
+}
 
 static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state state,
 				      enum cpuhp_sync_state next_state)
@@ -328,7 +334,7 @@ static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state st
 			return false;
 		} else if (now - start < NSEC_PER_MSEC) {
 			/* Poll for one millisecond */
-			arch_cpuhp_sync_state_poll();
+			arch_cpuhp_sync_state_poll(st, sync);
 		} else {
 			usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
 		}
@@ -395,8 +401,7 @@ void cpuhp_ap_sync_alive(void)
 	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
-	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
-		cpu_relax();
+	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
 }
 
 static bool cpuhp_can_boot_ap(unsigned int cpu)
-- 
2.55.0.979.g7e5102b832-goog


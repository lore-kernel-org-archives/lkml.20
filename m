Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218523;
	b=4nUypuBy0RUSjitaZA6/ydzCDJEYuPzHTitiCkf3y9hAkFjUG8Kroi0WQWHcSD54lQSt
	 wkKdPMq3qMaVBoLKGzZ/SexkPT/f4RtBFON+ukjQqOfQk257NweRRJ9As0KlUFFDgjygW
	 rNGqI1YPe4vo7ep2eZXu5WrMHgetHDvnikEZ8QCMUT2Bt3eSkSQrQ5BcjovMEtRMVimpF
	 K2wHZ+XzhRjn5KCd56MrL1c9BS5uF7BXsdakey5JcSr8WRPT4PP/nDi2Rjv9/j6dZnRQX
	 Eyw1vEqLbC8ubjy0MqnbctvEJvLwYnMzz34Sbsdxx7DR5YxdXISgLJCcgx755E7bnfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218523;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=GfEVGnVHQBtkbaeC0FsDQUDGkZkl7phNuxB6A1eAEyY=;
	b=Nhii2MfmDccHYfikHya2t0dbwp55N9dz6Gh7vHiC7ByykPwNvsQpqF5nqaSOYMb9Pl9O
	 p2kitzXnlkZFy3vFdymrGmnkEBgi/YuExL/I3Yfb3ZNomd9P2rQ6nAPjyKjPCiuXCuUX1
	 JHLo/82i4sFwrEkZ/UMaJpdSAudvxdjx8tg4bwl1b7nplrPiXiaKIXeQd/8MVfjLq/VxK
	 VgdXHlTSiq2ZlDMThFY4NFDpUAPXqFA16tgg9g/GUYPcPzMJIIE7fI3A+6H0DPzM9ElWb
	 HPn/gdQ0kh8zyAbJGXt4HoRGTHXrrW8e+RxPL3O/X08WWU+daGYLkqPyY9oOWB3AVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OXhSSCP7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=olr0AU8W;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE62606A33E;
	Mon,  9 Nov 2026 10:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE62606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OXhSSCP7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=olr0AU8W
Date: Mon, 09 Nov 2026 10:01:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218520;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfEVGnVHQBtkbaeC0FsDQUDGkZkl7phNuxB6A1eAEyY=;
	b=OXhSSCP7nEDcjzYNeGyf0KdBY1e5NZsSqf2ucuVQKu87sxDGE9aH7YxMu18K8/wRPu9uBs
	y4ecW6JyNyT5nn4pSG26/N0zDnklHRVii1DkyEo50R1NI8lM/Tkhr2YA/Su6PArwEojeER
	1bGqelwhAWhpDx2YAUmkr9WQle5v7/UFVdp5Lfn8zHhAQftg6cBWcC+WylIpVKFHvIw5sI
	ycVM1vD9QOjhTdo3vIu5Ck5EEZBeIOa7LaC8MnZvTsWAt7YSFAAzpHRqf2ySkpRu+eEMyp
	+yGyVuve1QlMlER/oC2/1tdG31koYQLGpOGKp/kqfftW5QSXCrHOs+I51cRxzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218520;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfEVGnVHQBtkbaeC0FsDQUDGkZkl7phNuxB6A1eAEyY=;
	b=olr0AU8WwJMap9w6QH2qbvuijt3q8PmHuQB9bsqo7v7Wa5w0aiE0MUcIyGotLbm7xcg5kl
	+eQui96hjalKfBBw==
From: "tip-bot2 for Srikar Dronamraju" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/hotplug: Remove unused idle_task_exit
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016095711.1364609-1-srikar@linux.ibm.com>
References: <20261016095711.1364609-1-srikar@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421851896.2093942.8605421794872134062.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     879ebf19774f8338fb27257c21d2bc94caae97d0
Gitweb:        https://git.kernel.org/tip/879ebf19774f8338fb27257c21d2bc94caa=
e97d0
Author:        Srikar Dronamraju <srikar@linux.ibm.com>
AuthorDate:    Fri, 16 Oct 2026 15:26:40 +05:30
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:58:06 +01:00

sched/hotplug: Remove unused idle_task_exit

Commit 21641bd9a7a7 ("lazy tlb: fix hotplug exit race with
MMU_LAZY_TLB_SHOOTDOWN") moved the handling previously performed by
idle_task_exit() into the scheduler CPU hotplug path using
sched_force_init_mm().

As a result, idle_task_exit() is now an empty stub and the remaining
architecture call sites have no effect.

Remove the calls to idle_task_exit() and the now unused stub.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20261016095711.1364609-1-srikar@linux.ibm.com
---
 arch/arm/kernel/smp.c                        | 2 --
 arch/arm64/kernel/smp.c                      | 2 --
 arch/csky/kernel/smp.c                       | 2 --
 arch/loongarch/kernel/smp.c                  | 2 --
 arch/mips/cavium-octeon/smp.c                | 1 -
 arch/mips/kernel/smp-bmips.c                 | 1 -
 arch/mips/kernel/smp-cps.c                   | 1 -
 arch/mips/loongson64/smp.c                   | 1 -
 arch/parisc/kernel/process.c                 | 2 --
 arch/powerpc/platforms/85xx/smp.c            | 2 --
 arch/powerpc/platforms/powermac/smp.c        | 2 --
 arch/powerpc/platforms/powernv/smp.c         | 1 -
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 --
 arch/powerpc/platforms/pseries/pmem.c        | 1 -
 arch/riscv/kernel/cpu-hotplug.c              | 2 --
 arch/s390/kernel/smp.c                       | 1 -
 arch/sh/kernel/smp.c                         | 1 -
 arch/sparc/kernel/smp_64.c                   | 2 --
 arch/x86/kernel/smpboot.c                    | 2 --
 arch/xtensa/kernel/smp.c                     | 1 -
 include/linux/sched/hotplug.h                | 2 --
 21 files changed, 33 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index a9f4600..eed8c2c 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -319,8 +319,6 @@ void __noreturn arch_cpu_idle_dead(void)
 {
 	unsigned int cpu =3D smp_processor_id();
=20
-	idle_task_exit();
-
 	local_irq_disable();
=20
 	/*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 014b163..48b425e 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -372,8 +372,6 @@ void __noreturn cpu_die(void)
 	unsigned int cpu =3D smp_processor_id();
 	const struct cpu_operations *ops =3D get_cpu_ops(cpu);
=20
-	idle_task_exit();
-
 	local_daif_mask();
=20
 	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 92dbbf3..e6333cc 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -294,8 +294,6 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
=20
 void __noreturn arch_cpu_idle_dead(void)
 {
-	idle_task_exit();
-
 	cpuhp_ap_report_dead();
=20
 	while (!secondary_stack)
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 11f5483..6b21af1 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -478,7 +478,6 @@ static void __noreturn idle_play_dead(void)
 	register uint64_t addr;
 	register void (*init_fn)(void);
=20
-	idle_task_exit();
 	local_irq_enable();
 	set_csr_ecfg(ECFGF_IPI);
 	__this_cpu_write(cpu_state, CPU_DEAD);
@@ -503,7 +502,6 @@ static void __noreturn poll_play_dead(void)
 	register uint64_t addr;
 	register void (*init_fn)(void);
=20
-	idle_task_exit();
 	__this_cpu_write(cpu_state, CPU_DEAD);
=20
 	__smp_mb();
diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 054e331..0e557e7 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -344,7 +344,6 @@ void play_dead(void)
 {
 	int cpu =3D cpu_number_map(cvmx_get_core_num());
=20
-	idle_task_exit();
 	cpuhp_ap_report_dead();
 	octeon_processor_boot =3D 0xff;
 	per_cpu(cpu_state, cpu) =3D CPU_DEAD;
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 35b8d81..e4a523b 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -391,7 +391,6 @@ static void bmips_cpu_die(unsigned int cpu)
=20
 void __ref play_dead(void)
 {
-	idle_task_exit();
 	cpuhp_ap_report_dead();
=20
 	/* flush data cache */
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index b01ebaa..51e68a4 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -804,7 +804,6 @@ void play_dead(void)
 	unsigned int cpu;
=20
 	local_irq_disable();
-	idle_task_exit();
 	cpu =3D smp_processor_id();
 	cpu_death =3D CPU_DEATH_POWER;
=20
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e584299..73eca9c 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -766,7 +766,6 @@ void play_dead(void)
 	unsigned int cpu =3D smp_processor_id();
 	void (*play_dead_at_ckseg1)(int *);
=20
-	idle_task_exit();
 	cpuhp_ap_report_dead();
=20
 	prid_imp =3D read_c0_prid() & PRID_IMP_MASK;
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 703644e..8606ecd 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -164,8 +164,6 @@ EXPORT_SYMBOL(running_on_qemu);
 void __noreturn arch_cpu_idle_dead(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	idle_task_exit();
-
 	local_irq_disable();
=20
 	/* Tell the core that this CPU is now safe to dispose of. */
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/=
smp.c
index 32fa5fb..9dc81e4 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -121,8 +121,6 @@ static void smp_85xx_cpu_offline_self(void)
 	/* mask all irqs to prevent cpu wakeup */
 	qoriq_pm_ops->irq_mask(cpu);
=20
-	idle_task_exit();
-
 	mtspr(SPRN_TCR, 0);
 	mtspr(SPRN_TSR, mfspr(SPRN_TSR));
=20
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/p=
owermac/smp.c
index 88e92af..f8e674c 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -925,7 +925,6 @@ static void pmac_cpu_offline_self(void)
 	int cpu =3D smp_processor_id();
=20
 	local_irq_disable();
-	idle_task_exit();
 	pr_debug("CPU%d offline\n", cpu);
 	generic_set_cpu_dead(cpu);
 	smp_wmb();
@@ -940,7 +939,6 @@ static void pmac_cpu_offline_self(void)
 	int cpu =3D smp_processor_id();
=20
 	local_irq_disable();
-	idle_task_exit();
=20
 	/*
 	 * turn off as much as possible, we'll be
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/po=
wernv/smp.c
index b1201db..9a480c9 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -172,7 +172,6 @@ static void pnv_cpu_offline_self(void)
=20
 	/* Standard hot unplug procedure */
=20
-	idle_task_exit();
 	cpu =3D smp_processor_id();
 	DBG("CPU%d offline\n", cpu);
 	generic_set_cpu_dead(cpu);
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/plat=
forms/pseries/hotplug-cpu.c
index bc6926d..1ade9a8 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/sched.h>	/* for idle_task_exit */
 #include <linux/sched/hotplug.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
@@ -64,7 +63,6 @@ static void pseries_cpu_offline_self(void)
 	unsigned int hwcpu =3D hard_smp_processor_id();
=20
 	local_irq_disable();
-	idle_task_exit();
 	if (xive_enabled())
 		xive_teardown_cpu();
 	else
diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/p=
series/pmem.c
index 0f1d45f..af48dfe 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/sched.h>	/* for idle_task_exit */
 #include <linux/sched/hotplug.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 0bc56d8..3480431 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -66,8 +66,6 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
  */
 void __noreturn arch_cpu_idle_dead(void)
 {
-	idle_task_exit();
-
 	cpuhp_ap_report_dead();
=20
 	cpu_ops->cpu_stop();
diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index f7c262a..aa574b8 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -918,7 +918,6 @@ void __cpu_die(unsigned int cpu)
=20
 void __noreturn cpu_die(void)
 {
-	idle_task_exit();
 	pcpu_sigp_retry(this_cpu_ptr(&pcpu_devices), SIGP_STOP, 0);
 	for (;;) ;
 }
diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
index 108d808..afd57bd 100644
--- a/arch/sh/kernel/smp.c
+++ b/arch/sh/kernel/smp.c
@@ -108,7 +108,6 @@ int native_cpu_disable(unsigned int cpu)
=20
 void play_dead_common(void)
 {
-	idle_task_exit();
 	irq_ctx_exit(raw_smp_processor_id());
 	mb();
=20
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index 371460e..e98b5dd 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1290,8 +1290,6 @@ void cpu_play_dead(void)
 	int cpu =3D smp_processor_id();
 	unsigned long pstate;
=20
-	idle_task_exit();
-
 	if (tlb_type =3D=3D hypervisor) {
 		struct trap_per_cpu *tb =3D &trap_block[cpu];
=20
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e..dcbaf3f 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1407,8 +1407,6 @@ int native_cpu_disable(void)
=20
 void play_dead_common(void)
 {
-	idle_task_exit();
-
 	cpuhp_ap_report_dead();
=20
 	local_irq_disable();
diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index e4c25d0..094e1da 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -336,7 +336,6 @@ void __noreturn arch_cpu_idle_dead(void)
  */
 void __ref cpu_die(void)
 {
-	idle_task_exit();
 	local_irq_disable();
 	__asm__ __volatile__(
 			"	movi	a2, cpu_restart\n"
diff --git a/include/linux/sched/hotplug.h b/include/linux/sched/hotplug.h
index 17e0485..18fa3e6 100644
--- a/include/linux/sched/hotplug.h
+++ b/include/linux/sched/hotplug.h
@@ -18,6 +18,4 @@ extern int sched_cpu_dying(unsigned int cpu);
 # define sched_cpu_dying	NULL
 #endif
=20
-static inline void idle_task_exit(void) {}
-
 #endif /* _LINUX_SCHED_HOTPLUG_H */

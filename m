Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FE4F4D02
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415347; cv=none; b=RYWJ8BK4wHA/zTuCs4P+PZsUdlI7v7OIQhmSykSgVJTJ2VtiBQdKAyZSKDASeNYmH+TwF622/gvDU1IP5y7Yqf9wxCs+Tr1vBSnVo5AAZo7UVwYsEO/aujzXNHENKRkFbMn49A3a7pXem8sZbB0xvd/9elrxuIqwppKj152SWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415347; c=relaxed/simple;
	bh=wRLdbUbY9Tl+0Taq/XhYHNjoLwMAxe3bwBG3sy9Ia8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWGmC/6THitFXvnI/hvwl6xrSiKCHL7xS9Dtn7Idpw8Pg8Z2o7afSqouwykMz0LF6iSkRIkSLz/iJG/lJ7PVbUYyATwHMRHF+iLrnLLqusnOCHkmm+ApBMrV0JNMl0Btq0Is0PXyGAplrwQ7h5suTmXGzehCyAwAMD+WvwgmoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAS5Wiwd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAS5Wiwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BD21F000C5;
	Mon, 19 Oct 2026 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415345;
	bh=SklPKmmL5LR+jXDDr4ynkBP3fkvLqiTHFmS/ZsI77Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mAS5Wiwd9n4LVhROVLFUZf+f7MmqJKQZnfg18SG5dMZJEdAI0BCJfj45YcuVIDxc5
	 eMGPjeA5iG3W4ZfFZYgJcl89MrGx1VVMbZ/ucZFfm1A0cOpUj3Cm6p7jzFPfY+Fnk7
	 CQOBu5N7UbpH5tuK7TVr0urDK+j4r7665+ODuilgNkUd4smm0EMB5xwOC5N0PMNF6W
	 fNNmdR5foZV4bXd0fVeYoBkELH6Kv7B1xlqkOln5nKnp9Ph+Z7n82TiIs6pVjrEFMa
	 9aoWjzsSsf3TQg36d0At4lJxdDOqlA/zlsfAk445gCTU2M+INX3eEg3iOASzghPsrN
	 Npf6eZgKUVlpQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 01/49] stop_machine: Add post function to execute while other CPUs can exit
Date: Mon, 19 Oct 2026 15:08:08 +0200
Message-ID: <20261019130856.49711-2-frederic@kernel.org>
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
introduce a new stop machine post function to be executed after the main
one while other CPUs are released. Now stop machine machine state
becomes:

1) Schedule stop_machine on the given mask (all CPUs in the hotplug down
   case).

2) Global synchronization rendez-vous on MULTI_STOP_PREPARE

3) All CPUs disable IRQs on MULTI_STOP_DISABLE_IRQ

4) The outgoing CPU executes the main function

5) Rendez-vous on MULTI_STOP_EXIT so that all CPUs synchronize with
   the main function.

6) Concurrently with 5), the post function is executed on the outgoing
   CPU with IRQs still disabled while other CPUs can exit
   stop_machine().

Add the new post function argument with the following Coccinelle script:

	@@
	expression arg1, arg2, arg3;
	@@

	- stop_machine_cpuslocked(arg1, arg2, arg3)
	+ stop_machine_cpuslocked(arg1, NULL, arg2, arg3)

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/arm/kernel/patch.c                  |  2 +-
 arch/arm/probes/kprobes/core.c           |  2 +-
 arch/arm64/kernel/patching.c             |  4 ++--
 arch/csky/kernel/probes/kprobes.c        |  3 ++-
 arch/loongarch/kernel/inst.c             |  3 ++-
 arch/parisc/kernel/patch.c               |  4 ++--
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  4 ++--
 arch/powerpc/platforms/powernv/subcore.c |  2 +-
 arch/powerpc/platforms/pseries/lpar.c    |  2 +-
 arch/riscv/kernel/patch.c                |  3 ++-
 arch/s390/kernel/kprobes.c               |  4 ++--
 arch/s390/kernel/time.c                  |  3 ++-
 arch/x86/kernel/cpu/microcode/core.c     |  3 ++-
 arch/x86/kernel/cpu/mtrr/mtrr.c          |  3 ++-
 arch/x86/virt/vmx/tdx/seamldr.c          |  2 +-
 arch/xtensa/kernel/jump_label.c          |  4 ++--
 include/linux/stop_machine.h             | 10 +++++++---
 kernel/cpu.c                             |  3 ++-
 kernel/stop_machine.c                    | 14 +++++++++++---
 19 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/arch/arm/kernel/patch.c b/arch/arm/kernel/patch.c
index 4d45e60cd46d..c49db43c69a4 100644
--- a/arch/arm/kernel/patch.c
+++ b/arch/arm/kernel/patch.c
@@ -124,5 +124,5 @@ void __kprobes patch_text(void *addr, unsigned int insn)
 		.insn = insn,
 	};
 
-	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
+	stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch, NULL);
 }
diff --git a/arch/arm/probes/kprobes/core.c b/arch/arm/probes/kprobes/core.c
index 9fd877c87a38..3f6520c12d29 100644
--- a/arch/arm/probes/kprobes/core.c
+++ b/arch/arm/probes/kprobes/core.c
@@ -171,7 +171,7 @@ void __kprobes kprobes_remove_breakpoint(void *addr, unsigned int insn)
 		.addr = addr,
 		.insn = insn,
 	};
-	stop_machine_cpuslocked(__kprobes_remove_breakpoint, &p,
+	stop_machine_cpuslocked(__kprobes_remove_breakpoint, NULL, &p,
 				cpu_online_mask);
 }
 
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..43a8d545f050 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -233,6 +233,6 @@ int __kprobes aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt)
 	if (cnt <= 0)
 		return -EINVAL;
 
-	return stop_machine_cpuslocked(aarch64_insn_patch_text_cb, &patch,
-				       cpu_online_mask);
+	return stop_machine_cpuslocked(aarch64_insn_patch_text_cb, NULL,
+				       &patch, cpu_online_mask);
 }
diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 3c6e5c725d81..3bbd44d21ca3 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -48,7 +48,8 @@ static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
 {
 	struct csky_insn_patch param = { addr, opcode, ATOMIC_INIT(0) };
 
-	return stop_machine_cpuslocked(patch_text_cb, &param, cpu_online_mask);
+	return stop_machine_cpuslocked(patch_text_cb, NULL, &param,
+				       cpu_online_mask);
 }
 
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 0b9228b7c13a..f0f04406909c 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -284,7 +284,8 @@ int larch_insn_text_copy(void *dst, void *src, size_t len)
 		return err;
 	}
 
-	ret = stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_mask);
+	ret = stop_machine_cpuslocked(text_copy_cb, NULL, &copy,
+				      cpu_online_mask);
 
 	err = set_memory_rox(start, (end - start) / PAGE_SIZE);
 	if (err) {
diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index 35dd764b871e..097d7fde833c 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -114,7 +114,7 @@ void __kprobes patch_text(void *addr, unsigned int insn)
 		.len = sizeof(insn),
 	};
 
-	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
+	stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch, NULL);
 }
 
 void __kprobes patch_text_multiple(void *addr, u32 *insn, unsigned int len)
@@ -126,5 +126,5 @@ void __kprobes patch_text_multiple(void *addr, u32 *insn, unsigned int len)
 		.len = len
 	};
 
-	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
+	stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch, NULL);
 }
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index d9b5b751d7b7..d7fddc93a1aa 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -551,8 +551,8 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 		// Ensure state is consistent before we call the other CPUs
 		mb();
 
-		stop_machine_cpuslocked(change_memory_range_fn, &chmem_parms,
-					cpu_online_mask);
+		stop_machine_cpuslocked(change_memory_range_fn, NULL,
+					&chmem_parms, cpu_online_mask);
 
 		cpus_read_unlock();
 		mutex_unlock(&chmem_lock);
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index f7668ef1ac1f..ac9c7685141b 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -366,7 +366,7 @@ static int set_subcores_per_core(int new_mode)
 	/* Ensure state is consistent before we call the other cpus */
 	mb();
 
-	stop_machine_cpuslocked(cpu_update_split_mode, &new_mode,
+	stop_machine_cpuslocked(cpu_update_split_mode, NULL, &new_mode,
 				cpu_online_mask);
 
 	cpus_read_unlock();
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..c847b81bdeb3 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1678,7 +1678,7 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
 
 	t1 = ktime_get();
 
-	rc = stop_machine_cpuslocked(pseries_lpar_resize_hpt_commit,
+	rc = stop_machine_cpuslocked(pseries_lpar_resize_hpt_commit, NULL,
 				     &state, NULL);
 
 	t2 = ktime_get();
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 2239c28981bc..dc7c544e9f62 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -297,7 +297,8 @@ int patch_text(void *addr, u32 *insns, size_t len)
 	 */
 	lockdep_assert_held(&text_mutex);
 	riscv_patch_in_stop_machine = true;
-	ret = stop_machine_cpuslocked(patch_text_cb, &patch, cpu_online_mask);
+	ret = stop_machine_cpuslocked(patch_text_cb, NULL, &patch,
+				      cpu_online_mask);
 	riscv_patch_in_stop_machine = false;
 	return ret;
 }
diff --git a/arch/s390/kernel/kprobes.c b/arch/s390/kernel/kprobes.c
index c450120b4474..3dcedcad9fd6 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -158,7 +158,7 @@ void arch_arm_kprobe(struct kprobe *p)
 		swap_instruction(&args);
 		text_poke_sync();
 	} else {
-		stop_machine_cpuslocked(swap_instruction, &args, NULL);
+		stop_machine_cpuslocked(swap_instruction, NULL, &args, NULL);
 	}
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
@@ -171,7 +171,7 @@ void arch_disarm_kprobe(struct kprobe *p)
 		swap_instruction(&args);
 		text_poke_sync();
 	} else {
-		stop_machine_cpuslocked(swap_instruction, &args, NULL);
+		stop_machine_cpuslocked(swap_instruction, NULL, &args, NULL);
 	}
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 2b989bebd220..352bb9dc3e13 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -588,7 +588,8 @@ static void stp_work_fn(struct work_struct *work)
 		memset(&stp_sync, 0, sizeof(stp_sync));
 		cpus_read_lock();
 		atomic_set(&stp_sync.cpus, num_online_cpus() - 1);
-		stop_machine_cpuslocked(stp_sync_clock, &stp_sync, cpu_online_mask);
+		stop_machine_cpuslocked(stp_sync_clock, NULL, &stp_sync,
+					cpu_online_mask);
 		cpus_read_unlock();
 	}
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 0dd0c7241c57..8a54c419fc28 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -620,7 +620,8 @@ static int load_late_stop_cpus(bool is_safe)
 	if (microcode_ops->use_nmi)
 		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
 
-	stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
+	stop_machine_cpuslocked(load_cpus_stopped, NULL, NULL,
+				cpu_online_mask);
 
 	if (microcode_ops->use_nmi)
 		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 468c53b20acf..497e95fb275c 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -175,7 +175,8 @@ static void set_mtrr(unsigned int reg, unsigned long base, unsigned long size,
 				      .smp_type = type
 				    };
 
-	stop_machine_cpuslocked(mtrr_rendezvous_handler, &data, cpu_online_mask);
+	stop_machine_cpuslocked(mtrr_rendezvous_handler, NULL, &data,
+				cpu_online_mask);
 
 	generic_rebuild_map();
 }
diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index b1137ca6150d..3fd03d552f18 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -341,7 +341,7 @@ int seamldr_install_module(const u8 *data, u32 data_len)
 	/* Ensure a stable set of online CPUs for the update process. */
 	cpus_read_lock();
 	init_state(&update_ctrl);
-	ret = stop_machine_cpuslocked(do_seamldr_install_module, params,
+	ret = stop_machine_cpuslocked(do_seamldr_install_module, NULL, params,
 				      cpu_online_mask);
 	cpus_read_unlock();
 
diff --git a/arch/xtensa/kernel/jump_label.c b/arch/xtensa/kernel/jump_label.c
index ad1841cecdfb..2278db2af2a4 100644
--- a/arch/xtensa/kernel/jump_label.c
+++ b/arch/xtensa/kernel/jump_label.c
@@ -60,8 +60,8 @@ static void patch_text(unsigned long addr, const void *data, size_t sz)
 			.sz = sz,
 			.data = data,
 		};
-		stop_machine_cpuslocked(patch_text_stop_machine,
-					&patch, cpu_online_mask);
+		stop_machine_cpuslocked(patch_text_stop_machine, NULL, &patch,
+					cpu_online_mask);
 	} else {
 		unsigned long flags;
 
diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index 84e7fb627ba4..f8c1f2e2371b 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -131,6 +131,7 @@ int stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus);
 /**
  * stop_machine_cpuslocked: freeze the machine on all CPUs and run this function
  * @fn: the function to run
+ * @postfn: the function to run after @fn while other CPUs can exit
  * @data: the data ptr to pass to @fn()
  * @cpus: the cpus to run @fn() on (NULL = one unspecified online CPU)
  *
@@ -138,7 +139,8 @@ int stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus);
  *
  * Context: Must be called from within a cpus_read_lock() protected region.
  */
-int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus);
+int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
+			    void *data, const struct cpumask *cpus);
 
 /**
  * stop_core_cpuslocked: - stop all threads on just one core
@@ -161,13 +163,15 @@ int stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
 				   const struct cpumask *cpus);
 #else	/* CONFIG_SMP || CONFIG_HOTPLUG_CPU */
 
-static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
-					  const struct cpumask *cpus)
+static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
+						   void *data, const struct cpumask *cpus)
 {
 	unsigned long flags;
 	int ret;
 	local_irq_save(flags);
 	ret = fn(data);
+	if (!ret && postfn)
+		ret = postfn(data);
 	local_irq_restore(flags);
 	return ret;
 }
diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..064c1072ad50 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1313,7 +1313,8 @@ static int takedown_cpu(unsigned int cpu)
 	 */
 	irq_lock_sparse();
 
-	err = stop_machine_cpuslocked(take_cpu_down, NULL, cpumask_of(cpu));
+	err = stop_machine_cpuslocked(take_cpu_down, NULL, NULL,
+				      cpumask_of(cpu));
 	if (err) {
 		/* CPU refused to die */
 		irq_unlock_sparse();
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44..d9db763a969a 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -168,6 +168,7 @@ enum multi_stop_state {
 
 struct multi_stop_data {
 	cpu_stop_fn_t		fn;
+	cpu_stop_fn_t		postfn;
 	void			*data;
 	/* Like num_online_cpus(), but hotplug cpu uses us, so we need this. */
 	unsigned int		num_threads;
@@ -238,6 +239,10 @@ static int multi_cpu_stop(void *data)
 				if (is_active)
 					err = msdata->fn(msdata->data);
 				break;
+			case MULTI_STOP_EXIT:
+				if (!err && is_active && msdata->postfn)
+					err = msdata->postfn(msdata->data);
+				break;
 			default:
 				break;
 			}
@@ -582,11 +587,12 @@ static int __init cpu_stop_init(void)
 }
 early_initcall(cpu_stop_init);
 
-int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
-			    const struct cpumask *cpus)
+int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
+			    void *data, const struct cpumask *cpus)
 {
 	struct multi_stop_data msdata = {
 		.fn = fn,
+		.postfn = postfn,
 		.data = data,
 		.num_threads = num_online_cpus(),
 		.active_cpus = cpus,
@@ -608,6 +614,8 @@ int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
 		local_irq_save(flags);
 		hard_irq_disable();
 		ret = (*fn)(data);
+		if (postfn)
+			(*postfn)(data);
 		local_irq_restore(flags);
 
 		return ret;
@@ -624,7 +632,7 @@ int stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
 
 	/* No CPUs can come up or down during this. */
 	cpus_read_lock();
-	ret = stop_machine_cpuslocked(fn, data, cpus);
+	ret = stop_machine_cpuslocked(fn, NULL, data, cpus);
 	cpus_read_unlock();
 	return ret;
 }
-- 
2.53.0


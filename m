Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896257;
	b=TMJaIkPELoYzX3Q/6ZPAuJVWY6NyII89JmUVRiP7j0p0rUdiP51SLnUiQzKB6PIujtvp
	 JDZhhVvTqiPruoBsQrfuPcS3mNLVjJ+z6WDfl3xeNP/8KU2jmuscuD4xld7qV9YHZykmm
	 jonaZ0sI6DkKHNd9TqCcfeLS5JFMmhMAY0ANXv8X1QPj/rBd3LJFPAAvzRaNaJ8Cl84ll
	 pgnYqwU+XxqHUBNriC44T3JIWjAWagGoY6rwCwQlurjbaKcJLTEx+hNq2MX+7WWnhKcPe
	 DYVvojiKLeQyWVQH9SwuQ8kFaNk/oTAooNvZJ1NQwDywARBdo1YITJslfeODOXloHvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896257;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vbFDvHB/nnpMGXOJ+EP9xgZ84bCEnXivSzweLho2gH4=;
	b=l8E4nYQ+7UEDsxg0fYQxBlodohjQZoWhYLiAJY78ZqytzBQbULjomfPwzw8Z//JYkRX0
	 q7n8GU7R4thqebRli7piXsFYFwSA7Q9MM7xSI9KXls5Ex15ZAUK9rHiO/N/33qRRT6aO+
	 qCIAo5Jm2NEpd2W8qW69RlDV8MDSx+lXMgusgThOBMVeTY+Dejhak+vZuajjAcXQ/OhF9
	 SZj2zIYS+aDkkzYlZuZ3rzXpX+noxwwCFaTEX+G+N7P9Fnr+2nkUZ+9DeEuzrE5PhWSD3
	 9KaQsxZz3Nz1nsKhUv3hHnlh3EJm67u98vD5dUL3n7SJPmJnv6LTp+p8eF73mvNjauA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOSp9dHG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD76082BDC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOSp9dHG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33291F00A1D;
	Thu,  5 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896256;
	bh=vbFDvHB/nnpMGXOJ+EP9xgZ84bCEnXivSzweLho2gH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bOSp9dHGQ0395mjvxAnMx2REKrudU22feeCgcClOcnwCp2+L4AkuN3zseRweLpQe8
	 1Z2Bf/m3+QV/Sm6Yt3CKBXPIHY47KGtXZUL7IMZn+w0UnMnIOrIC1VUiKZ1QAOkF18
	 SHm/k4ZR3BgAL1FGcE99eJ6GwEVRZZiBCClIMo7qHXWqNBMWpoJKtJmsxMv06BCA3V
	 wc0yTVdA9F3JjWTp0xzxkGzIFnRE6Vw9/5Sqmo85advp387Pc2C630lFM2ZT0WaNXz
	 PYknBTSfWpJrx05w2zWwZDlmEnJNjotF+a7N0V7JK0RW4hFQcqCIiMPVQZHZKRHq+m
	 0sFKYGGjGEokQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 01/47] stop_machine: Add post function to execute while other CPUs can exit
Date: Thu,  5 Nov 2026 17:29:59 +0100
Message-ID: <20261105163045.38862-2-frederic@kernel.org>
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
 include/linux/stop_machine.h             | 12 ++++++++----
 kernel/cpu.c                             |  3 ++-
 kernel/stop_machine.c                    | 14 +++++++++++---
 19 files changed, 48 insertions(+), 29 deletions(-)

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
index 2b5adf01c550..4fa99aae5120 100644
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
index e806b124e4ba..692007d9d468 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -161,7 +161,7 @@ void arch_arm_kprobe(struct kprobe *p)
 		swap_instruction(&args);
 		text_poke_sync();
 	} else {
-		stop_machine_cpuslocked(swap_instruction, &args, NULL);
+		stop_machine_cpuslocked(swap_instruction, NULL, &args, NULL);
 	}
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
@@ -174,7 +174,7 @@ void arch_disarm_kprobe(struct kprobe *p)
 		swap_instruction(&args);
 		text_poke_sync();
 	} else {
-		stop_machine_cpuslocked(swap_instruction, &args, NULL);
+		stop_machine_cpuslocked(swap_instruction, NULL, &args, NULL);
 	}
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 6102db8e4e7d..040fcb195d78 100644
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
index 84e7fb627ba4..18302a104188 100644
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
@@ -175,7 +179,7 @@ static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
 static __always_inline int
 stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
 {
-	return stop_machine_cpuslocked(fn, data, cpus);
+	return stop_machine_cpuslocked(fn, NULL, data, cpus);
 }
 
 static __always_inline int
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 376d297a6292..1ae03f1e8f84 100644
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
index d085ba1f4b44..588ed6d3dafd 100644
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
+		if (!ret && postfn)
+			ret = (*postfn)(data);
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


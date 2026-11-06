Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981262;
	b=1fcYQx/1LDEyhWLQJWEsFBCd3f3vJdW642ju8n1NOx2J+f0ptsOIlvgKnjeJ4FO75jse
	 pSLmhLD1AFYb0b2cobBu65obq1PucN+l2Y+lnlIEoT+mnH2kix+bYgzMtoml4WdEhkrqw
	 zTewHmB40EZcuc3GJT8HfYUzm3RFvmyHneRsO3P3RPKIN79Al1dV/nRDewOv/TtSE0crm
	 6vz+JNmpNMtmfQxFq0KrDoUN3MQ2bL/vjrH61V/O9KbDCitZIHrl2A2i9jbwMhT3Eb4lO
	 dhFd07bVkXUgf47PGFrbw0f0/7k0SkTWoYyWDMi/hZuuFCboLtQkkp+LOpKh8rYSB4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981262;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NipuA/eK1dXZUrxlfRPmYiWQOy1Y5J2kDspueExyqzA=;
	b=ukNYPYza9vVOZO0AAxzbYPnp1wEyIa+NF5fR3MclTLyIyywoR09hECo8RMTUX2RvY51k
	 yQNPsHaAdHAyDBl6YuMWXFyMfBjhU3uM0zf2qnAwK9i4pWb47sYdXVRO8TrZyJHcyeQBj
	 WG/MDratPUkAv+ZDdCDE4RjXG5N4CIBtXcZcuRciqJF/ua20xHutSdAIHLHojCzWy/iyr
	 FMpkE3Llxnp8AIWfPgVhbgSS6nb44G17KabsABECD10+6zKPxNMUhNAi3Xy4UgbKj/t8u
	 lGAU0mlAWYbWvsKOGjWaBQY4SZHllatUzBKVuT46kFqh981EtblvrQK+B9mEldkHAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pByuUQPj;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823D9606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823D9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pByuUQPj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NipuA/eK1dXZUrxlfRPmYiWQOy1Y5J2kDspueExyqzA=; b=pByuUQPjDXxTVB9W0m2X9fmWkw
	Ue9JWbwwzUp1pzwryinn+HxWckwsUFVrG9qvXOWHP4EY3D/SNR/+oV8XfvCJHLrWxyRFEo5fMMwdX
	YiSWddYAa3jUB/+9YflBuwuuQ0BE/dzJxRXJ6YLfp6qbf8582WASdBQ7POjyctioTWg/Ssd9l2q4I
	gjRfAo034eNOZT/uamIlCAsPz60+NxRVK9Int2i9ECVOiG/aFnKGnMQiC5Kd1mSWNoans/sCb80E5
	CLucSRC3MhSkc+jsbfuVCqaZUTUxKyM8DwA0kFrbisITA9LJ+3Ww1b2IgcUcYDoywvTiL3DE2R0Nd
	KdaU+5Qw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMTU-00000004RNu-28Py;
	Fri, 06 Nov 2026 16:07:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DAB89300882; Fri, 06 Nov 2026 17:07:30 +0100 (CET)
Date: Fri, 6 Nov 2026 17:07:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
Message-ID: <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>

On Sat, May 09, 2026 at 11:50:14AM +0800, Ruidong Tian wrote:
> task_struct keeps growing over time.  On architectures that compute the
> per-task stack canary offset from asm-offsets.h and pass it to the
> compiler via -mstack-protector-guard-offset=, this growth eventually
> pushes stack_canary beyond what the target ISA can encode.
> 
> On RISC-V, canary loads are emitted as
> 
>     ld	t0, TSK_STACK_CANARY(tp)
> 
> where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
> [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
> the build fails with
> 
>     cc1: error: '<N>' is not a valid offset in
>         '-mstack-protector-guard-offset='
> 
>   * On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT,
>     so randomized_struct_fields_start/end always expand to nothing and
>     stack_canary lands at a small, stable offset well within the
>     12-bit signed immediate range.  The build error goes away.
> 
>   * On architectures that enable RANDSTRUCT for hardening, stack_canary
>     stays inside the randomized region and is still shuffled together
>     with the other fields by the layout randomization, so its hardening
>     coverage is preserved.  asm-offsets-based architectures read the
>     shuffled offset at build time, so the generated canary accesses
>     remain correct.
> 
> pahole on a typical 64-bit config shows that the area around the
> wakee_* fields already contains a usable hole:
> 
>     struct __call_single_node  wake_entry;           /*    56    16 */
>     /* --- cacheline 1 boundary (64 bytes) ---       */
>     unsigned int               wakee_flips;          /*    72     4 */
>     /* XXX 4 bytes hole, try to pack */
>     unsigned long int          wakee_flip_decay_ts;  /*    80     8 */
>     struct task_struct *       last_wakee;           /*    88     8 */
> 
> Move wakee_flips to sit after last_wakee.  That opens up a clean
> 8-byte slot at offset 72 into which stack_canary fits exactly:
> 
>     struct __call_single_node  wake_entry;           /*    56    16 */
>     /* --- cacheline 1 boundary (64 bytes) ---       */
>     unsigned long              stack_canary;         /*    72     8 */
>     unsigned long int          wakee_flip_decay_ts;  /*    80     8 */
>     struct task_struct *       last_wakee;           /*    88     8 */
>     unsigned int               wakee_flips;          /*    96     4 */
> 
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
>  include/linux/sched.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 368c7b4d7cb5..5064c4afd19c 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -848,9 +848,15 @@ struct task_struct {
>  
>  	int				on_cpu;
>  	struct __call_single_node	wake_entry;
> -	unsigned int			wakee_flips;
> +
> +#ifdef CONFIG_STACKPROTECTOR
> +	/* Canary value for the -fstack-protector GCC feature: */
> +	unsigned long			stack_canary;
> +#endif
> +
>  	unsigned long			wakee_flip_decay_ts;
>  	struct task_struct		*last_wakee;
> +	unsigned int			wakee_flips;
>  
>  	/*
>  	 * recent_used_cpu is initially set as the last CPU used by a task
> @@ -1060,10 +1066,6 @@ struct task_struct {
>  	pid_t				pid;
>  	pid_t				tgid;
>  
> -#ifdef CONFIG_STACKPROTECTOR
> -	/* Canary value for the -fstack-protector GCC feature: */
> -	unsigned long			stack_canary;
> -#endif
>  	/*
>  	 * Pointers to the (original) parent process, youngest child, younger sibling,
>  	 * older sibling, respectively.  (p->father can be replaced with

This seems exceedingly random; and very prone to also randomly breaking
as task_struct is further modified.

Why not do something a little more structured; like so?

---
 arch/riscv/include/asm/stackprotector.h | 4 ++--
 arch/riscv/include/asm/thread_info.h    | 7 +++++++
 arch/riscv/kernel/asm-offsets.c         | 7 +++----
 drivers/misc/lkdtm/bugs.c               | 4 ++--
 include/linux/sched.h                   | 6 +++++-
 kernel/fork.c                           | 2 +-
 6 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
index 43895b90fe3f..b56e49ce0580 100644
--- a/arch/riscv/include/asm/stackprotector.h
+++ b/arch/riscv/include/asm/stackprotector.h
@@ -15,8 +15,8 @@ static __always_inline void boot_init_stack_canary(void)
 {
 	unsigned long canary = get_random_canary();
 
-	current->stack_canary = canary;
+	tsk_stack_canary(current) = canary;
 	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
-		__stack_chk_guard = current->stack_canary;
+		__stack_chk_guard = tsk_stack_canary(current);
 }
 #endif /* _ASM_RISCV_STACKPROTECTOR_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..eed764f06682 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -73,6 +73,9 @@ struct thread_info {
 	 */
 	unsigned long		a0, a1, a2;
 #endif
+#ifdef CONFIG_STACKPROTECTOR
+	unsigned long		stack_canary;
+#endif
 #ifdef CONFIG_RISCV_USER_CFI
 	struct cfi_state	user_cfi_state;
 #endif
@@ -86,6 +89,10 @@ struct thread_info {
 #define INIT_SCS
 #endif
 
+#ifdef CONFIG_STACKPROTECTOR
+#define tsk_stack_canary(p) ((p)->thread_info.stack_canary)
+#endif
+
 /*
  * macros/functions for gaining access to the thread information structure
  *
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..eb694e1215bb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -49,7 +49,9 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
 	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 #endif
-
+#ifdef CONFIG_STACKPROTECTOR
+	OFFSET(TSK_STACK_CANARY, task_struct, thread_info.stack_canary);
+#endif
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 #ifdef CONFIG_RISCV_USER_CFI
 	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
@@ -88,9 +90,6 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
 	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
 	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
-#ifdef CONFIG_STACKPROTECTOR
-	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
-#endif
 
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 	OFFSET(PT_EPC, pt_regs, epc);
diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f8..977ee7584249 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -247,9 +247,9 @@ static noinline void __lkdtm_REPORT_STACK_CANARY(void *stack)
 	for (i = 1; i < 16; i++) {
 		canary = (unsigned long *)stack + i;
 #ifdef CONFIG_STACKPROTECTOR
-		if (*canary == current->stack_canary)
+		if (*canary == tsk_stack_canary(current))
 			current_offset = i;
-		if (*canary == init_task.stack_canary)
+		if (*canary == tsk_stack_canary(&init_task))
 			init_offset = i;
 #endif
 	}
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..b7702fefed63 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1083,7 +1083,7 @@ struct task_struct {
 	pid_t				pid;
 	pid_t				tgid;
 
-#ifdef CONFIG_STACKPROTECTOR
+#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
 	/* Canary value for the -fstack-protector GCC feature: */
 	unsigned long			stack_canary;
 #endif
@@ -1697,6 +1697,10 @@ struct task_struct {
 	randomized_struct_fields_end
 } __attribute__ ((aligned (64)));
 
+#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
+#define tsk_stack_canary(p) ((p)->stack_canary)
+#endif
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
 static inline bool sched_proxy_exec(void)
diff --git a/kernel/fork.c b/kernel/fork.c
index 5efceb8d58a7..878d586bda25 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -964,7 +964,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	clear_syscall_work_syscall_user_dispatch(tsk);
 
 #ifdef CONFIG_STACKPROTECTOR
-	tsk->stack_canary = get_random_canary();
+	tsk_stack_canary(tsk) = get_random_canary();
 #endif
 	if (orig->cpus_ptr == &orig->cpus_mask)
 		tsk->cpus_ptr = &tsk->cpus_mask;



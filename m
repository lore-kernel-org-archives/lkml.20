Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981686;
	b=3HfiXV2b4Dj7qnIZgS+GMPBKxN0oYeRA/M9wAsgauTo0SAS4vGWOcmP1qQBt1BbwmS9r
	 LkxDsUkV0HHwVyRMNlM3bz9LyL72NZYbXxCWVChzZeVkGWVdPPDZtPlqN2AcKVjTZ9qGU
	 zT+w5mFPwh8ZRkzFbFj9e62QLLfu+oWkbakZPRYa9ZHlM4LWfEgo6GkMWY7BeahC+LCqN
	 HqoPjHbwlpOPNsWqyT4Niz158dI/otJx2kkfGv3OW810SZjuY/XCxQ1WcFMuwMpIMVz9w
	 9LxaYJ8fqApH4vZFkvGPeA3cXleIEByku17UFVZSbBFjL7DUSQT8oZXWLOL5jKZHJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981686;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Vfs6Gp27n5CuVhG0QqTC+w+/CbPNYwiZFwgux4fLn7c=;
	b=ag5zMgxKry6MqwwvGou+AZY+1HX8ZAFBumFbenEFjDfzwD8qgix5/eGtQSTdYuHNq9+e
	 RHYyWQ5gBnrJAYSHb4wJEG0FlkJkPCUSdRehiKBtNQLC5n3jj7SgjCgyRDamH9OdanRRh
	 EKb07wxxuaie+/G1m6jtApq0FliTx9lBqJrGCJO3PJWJRXaXWpUNw6k+I7/HFOya2isBw
	 gOzvaAucqJzL2kTh5PTROhN2CIbm7cbawjAJzXVDCIC8/g1GYHwhHF/FeT8LTC/F59pFo
	 8lts8Svxsin55tLQ953RG4K3uJD82ksYFw1n+Yp8G8INModjl/+tkyCehg9rqP5G3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=it48pUKy;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AD4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=it48pUKy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vfs6Gp27n5CuVhG0QqTC+w+/CbPNYwiZFwgux4fLn7c=; b=it48pUKyg7t4dyGncuzbTzNx2R
	YqTNAfMfFoNwk22GKiBnBpWu/XrzVc08u59jXbBhrz0gfwE0lyh7H80xxddQk1FKvvZuBe0c3hmcx
	Bs2rUSJkOM+x+QuoZ9i5hQRwqMevf6B9wIUjVcZXbQeHekdhETepzT/HQLCrqH1XL6DYkQ7ML8OWd
	DMmERtxrzc3W3ZABC4+iySg4EMBuR26AkXpO3ookzcpEpcR46BzcvOTpMp0t6jHnsJxY8oA5k0Gk8
	eoqCi5nT+iW7cFN3FRbjab779+jOM1Y/xeEtS0uw9mMCf+c7vs3xgJ18G3uAPWWbYWVt9rujHLU/G
	sWad6HRw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMaD-00000004v3C-2S1e;
	Fri, 06 Nov 2026 16:14:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7E781303154; Fri, 06 Nov 2026 17:14:28 +0100 (CET)
Date: Fri, 6 Nov 2026 17:14:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
Message-ID: <20261106161428.GC1922751@noisy.programming.kicks-ass.net>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 05:07:30PM +0100, Peter Zijlstra wrote:

> Why not do something a little more structured; like so?
> 
> ---
>  arch/riscv/include/asm/stackprotector.h | 4 ++--
>  arch/riscv/include/asm/thread_info.h    | 7 +++++++
>  arch/riscv/kernel/asm-offsets.c         | 7 +++----
>  drivers/misc/lkdtm/bugs.c               | 4 ++--
>  include/linux/sched.h                   | 6 +++++-
>  kernel/fork.c                           | 2 +-
>  6 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index 43895b90fe3f..b56e49ce0580 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -15,8 +15,8 @@ static __always_inline void boot_init_stack_canary(void)
>  {
>  	unsigned long canary = get_random_canary();
>  
> -	current->stack_canary = canary;
> +	tsk_stack_canary(current) = canary;
>  	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> -		__stack_chk_guard = current->stack_canary;
> +		__stack_chk_guard = tsk_stack_canary(current);
>  }
>  #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 55019fdfa9ec..eed764f06682 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -73,6 +73,9 @@ struct thread_info {
>  	 */
>  	unsigned long		a0, a1, a2;
>  #endif
> +#ifdef CONFIG_STACKPROTECTOR
> +	unsigned long		stack_canary;
> +#endif
>  #ifdef CONFIG_RISCV_USER_CFI
>  	struct cfi_state	user_cfi_state;
>  #endif
> @@ -86,6 +89,10 @@ struct thread_info {
>  #define INIT_SCS
>  #endif
>  

This should probably have a comment about 12 bit immediates somewhere.

> +#ifdef CONFIG_STACKPROTECTOR
> +#define tsk_stack_canary(p) ((p)->thread_info.stack_canary)
> +#endif
> +
>  /*
>   * macros/functions for gaining access to the thread information structure
>   *
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a75f0cfea1e9..eb694e1215bb 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -49,7 +49,9 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
>  	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
>  #endif
> -
> +#ifdef CONFIG_STACKPROTECTOR
> +	OFFSET(TSK_STACK_CANARY, task_struct, thread_info.stack_canary);
> +#endif
>  	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>  #ifdef CONFIG_RISCV_USER_CFI
>  	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
> @@ -88,9 +90,6 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
>  	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
>  	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
> -#ifdef CONFIG_STACKPROTECTOR
> -	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> -#endif
>  
>  	DEFINE(PT_SIZE, sizeof(struct pt_regs));
>  	OFFSET(PT_EPC, pt_regs, epc);
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 2761685cf4f8..977ee7584249 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -247,9 +247,9 @@ static noinline void __lkdtm_REPORT_STACK_CANARY(void *stack)
>  	for (i = 1; i < 16; i++) {
>  		canary = (unsigned long *)stack + i;
>  #ifdef CONFIG_STACKPROTECTOR
> -		if (*canary == current->stack_canary)
> +		if (*canary == tsk_stack_canary(current))
>  			current_offset = i;
> -		if (*canary == init_task.stack_canary)
> +		if (*canary == tsk_stack_canary(&init_task))
>  			init_offset = i;
>  #endif
>  	}
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index e4f6323d7855..b7702fefed63 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1083,7 +1083,7 @@ struct task_struct {
>  	pid_t				pid;
>  	pid_t				tgid;
>  
> -#ifdef CONFIG_STACKPROTECTOR
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
>  	/* Canary value for the -fstack-protector GCC feature: */
>  	unsigned long			stack_canary;
>  #endif
> @@ -1697,6 +1697,10 @@ struct task_struct {
>  	randomized_struct_fields_end
>  } __attribute__ ((aligned (64)));
>  
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
> +#define tsk_stack_canary(p) ((p)->stack_canary)
> +#endif
> +
>  #ifdef CONFIG_SCHED_PROXY_EXEC
>  DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
>  static inline bool sched_proxy_exec(void)
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5efceb8d58a7..878d586bda25 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -964,7 +964,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>  	clear_syscall_work_syscall_user_dispatch(tsk);
>  
>  #ifdef CONFIG_STACKPROTECTOR
> -	tsk->stack_canary = get_random_canary();
> +	tsk_stack_canary(tsk) = get_random_canary();
>  #endif
>  	if (orig->cpus_ptr == &orig->cpus_mask)
>  		tsk->cpus_ptr = &tsk->cpus_mask;
> 
> 

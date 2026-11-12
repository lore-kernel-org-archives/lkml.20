Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490408;
	b=wBAQDtlOqyi86ha6LScJE8MlEK2Ywu4FJHpXw3SYdgfYfIPVNKSoVW0uCCSwp9H5+L+W
	 AgxP0RpVGIFd2BGvQSUS9EOjkVhpP9nyYJKlz/Oz39N6kIq765eQdu1CaROH7tgYYPVw6
	 CKT6k21ZZWNDAWOXjqlqrEcyHp43XC6f4dPtMrPeR99FzOA29Zg7y7BzEwb4ROEDGgIAF
	 CMKWHK6G7ehpyNuO7a1V9w8/VYcbIXA8PSqDKDrbu2zR4w3/z1mL4vzwNTdYqL9TM/Dqf
	 JTUIMljGVt+qhojHBrelUwccRzFex5udgzlODhGWyKCcQmm8fd53Oxi7iP3eiHGSX4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490408;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=xkqkpIt1plIFnGyOUK6a5uhEcdFmWHTHz+38OI/2VXQ=;
	b=M87iQt0nAqC25SNQyx4J+AoK7sqk00tZTdPREgtUbJ3hWcbv3CBJvDHeInG4Am/YcRMJ
	 qsKstIKqcoHq7TvU2rg54c1MhFNxvZ3DaMZubyZU3Un2zOKumHLYLNrEDgG82pkXnu1dA
	 YbshZYs3QPWfUfq8MWURCmc9VrucoUid0TCe8cRqxD4zB1Bn/c6c/Xpjj6VEjtaohX5ZZ
	 Fh3BfiJMQNHEJDdCmbqR47qhqwPGIXLku+ckmFAcLNmAxyAqWs1gH0sHFtGX09591say/
	 HOwEqLFVA19kT9YSPgcPa4jqGYXqWufU61AXG04ohlwFGiNNdtium4xyICIyh2Vqb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YNYfiyZq;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDD5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YNYfiyZq
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id RSOgxmcz0JFmFRUvZxcIeM; Thu, 12 Nov 2026 13:33:21 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id RUvYxSKJjYskhRUvYxDZrd; Thu, 12 Nov 2026 13:33:20 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af5c021
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=JfrnYn6hAAAA:8
 a=SRrdq9N9AAAA:8 a=20KFwNOVAAAA:8 a=HaFmDPmJAAAA:8 a=dieMQkrgBA8TE_BiV8UA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xkqkpIt1plIFnGyOUK6a5uhEcdFmWHTHz+38OI/2VXQ=; b=YNYfiyZqmGVTl0GoZfbx6Nqy2U
	dvVh6v7SqvLKXSdykc4wDKN1OHmCl5PB0+kzx5VSwu6Qkiko0JdI5ZfA1MIJTTYbFEnnPDs9MzN7L
	+V3AnEE2ePPr8G52XJqGLbT+RXPQCC2FR+fuFXJRQj6ey+fh//6sjGpEEcMQ47dsrF6snYPNSJqWX
	P3T7nYVUTdVZzlkImTKoh4ccP5wUDtp9vAS1OiZUMqncDHLX8XbB5WO5CBHpdq8wbdxSTFGqX9M/V
	LWxxd3Hfa1fIj5l7gnU49Uhr+CaSmOPGs56N2MOi5cTH8ZdAc1qzbyidhySog+02CCgXpLOGbXeFp
	a39ycTjg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:49516 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xRUvW-00000003BR4-1yMX;
	Thu, 12 Nov 2026 06:33:18 -0700
Message-ID: <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
Date: Thu, 12 Nov 2026 05:33:16 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
To: Valentin Schneider <vschneid@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 oliver.yang@linux.alibaba.com, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1xRUvW-00000003BR4-1yMX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:49516
X-Source-Auth: re@w6rz.net
X-Email-Count: 6
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDxUk7mUwS/j/j/k7FWiBxXdDiTcHV9OsHqHPwBMdNHH2HgWRpbrHl+BHwX1rwz6hlLl+yICvcDhgm+O4VQIm2QZcnjDfn0+HsiQQQJwXJCjjBpPB4dN
 X6+urodSSKk+Y0jVQBSd4vdp0mK6g+UzSwaRqIAnID5qH/XKui+sgokRYeIzLCBGcZqeHIw2YxAURKSJM9UabSKD6jy5GRgG7Gc=

On 11/9/26 03:15, Valentin Schneider wrote:

> On 06/11/26 17:07, Peter Zijlstra wrote:
>> On Sat, May 09, 2026 at 11:50:14AM +0800, Ruidong Tian wrote:
>>> @@ -848,9 +848,15 @@ struct task_struct {
>>>   
>>>   	int				on_cpu;
>>>   	struct __call_single_node	wake_entry;
>>> -	unsigned int			wakee_flips;
>>> +
>>> +#ifdef CONFIG_STACKPROTECTOR
>>> +	/* Canary value for the -fstack-protector GCC feature: */
>>> +	unsigned long			stack_canary;
>>> +#endif
>>> +
>>>   	unsigned long			wakee_flip_decay_ts;
>>>   	struct task_struct		*last_wakee;
>>> +	unsigned int			wakee_flips;
>>>   
>>>   	/*
>>>   	 * recent_used_cpu is initially set as the last CPU used by a task
>>> @@ -1060,10 +1066,6 @@ struct task_struct {
>>>   	pid_t				pid;
>>>   	pid_t				tgid;
>>>   
>>> -#ifdef CONFIG_STACKPROTECTOR
>>> -	/* Canary value for the -fstack-protector GCC feature: */
>>> -	unsigned long			stack_canary;
>>> -#endif
>>>   	/*
>>>   	 * Pointers to the (original) parent process, youngest child, younger sibling,
>>>   	 * older sibling, respectively.  (p->father can be replaced with
>> This seems exceedingly random; and very prone to also randomly breaking
>> as task_struct is further modified.
>>
>> Why not do something a little more structured; like so?
>> until someone smarter can come with a risc-v specific improvement
> See :-)
>
> How's this? I fluffed the changelog and added a comment to that
> stack_canary helper
>
> ---
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Fri, 6 Nov 2026 17:07:30 +0100
> Subject: [PATCH] riscv, sched: move stack_canary to thread_info
>
> task_struct keeps growing over time. On architectures that compute the
> per-task stack canary offset from asm-offsets.h and pass it to the
> compiler via -mstack-protector-guard-offset=, this growth eventually
> pushes stack_canary beyond what the target ISA can encode.
>
> On RISC-V, canary loads are emitted as
>
>      ld	t0, TSK_STACK_CANARY(tp)
>
> where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
> [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
> the build fails with
>
>      cc1: error: '<N>' is not a valid offset in
> 	'-mstack-protector-guard-offset='
>
> On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
> stack_canary does not benefit from being in the task_struct randomized
> region.
>
> Move the RISC-V stack_canary to thread_info, and introduce an access macro
> to point to the right stack_canary location. Other archs are unaffected.
>
> Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> Not-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>   arch/riscv/include/asm/stackprotector.h |  4 ++--
>   arch/riscv/include/asm/thread_info.h    | 16 ++++++++++++++++
>   arch/riscv/kernel/asm-offsets.c         |  7 +++----
>   drivers/misc/lkdtm/bugs.c               |  4 ++--
>   include/linux/sched.h                   |  6 +++++-
>   kernel/fork.c                           |  2 +-
>   6 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index 43895b90fe3f6..b56e49ce0580e 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -15,8 +15,8 @@ static __always_inline void boot_init_stack_canary(void)
>   {
>   	unsigned long canary = get_random_canary();
>   
> -	current->stack_canary = canary;
> +	tsk_stack_canary(current) = canary;
>   	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> -		__stack_chk_guard = current->stack_canary;
> +		__stack_chk_guard = tsk_stack_canary(current);
>   }
>   #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 55019fdfa9eca..b3a1e1ddbfb0e 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -73,6 +73,9 @@ struct thread_info {
>   	 */
>   	unsigned long		a0, a1, a2;
>   #endif
> +#ifdef CONFIG_STACKPROTECTOR
> +	unsigned long		stack_canary;
> +#endif
>   #ifdef CONFIG_RISCV_USER_CFI
>   	struct cfi_state	user_cfi_state;
>   #endif
> @@ -86,6 +89,19 @@ struct thread_info {
>   #define INIT_SCS
>   #endif
>   
> +#ifdef CONFIG_STACKPROTECTOR
> +/*
> + * The canary is loaded via
> + *
> + *   ld	t0, TSK_STACK_CANARY(tp)
> + *
> + * This imposes a 2047 byte (12-bit signed immediate) limit for the stack_canary
> + * offset, which is a RISC-V specific limit. Because of that, we keep the
> + * stack_canary high up in task_struct, in thread_info itself.
> + */
> +#define tsk_stack_canary(p) ((p)->thread_info.stack_canary)
> +#endif
> +
>   /*
>    * macros/functions for gaining access to the thread information structure
>    *
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a75f0cfea1e9f..eb694e1215bbb 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -49,7 +49,9 @@ void asm_offsets(void)
>   	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
>   	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
>   #endif
> -
> +#ifdef CONFIG_STACKPROTECTOR
> +	OFFSET(TSK_STACK_CANARY, task_struct, thread_info.stack_canary);
> +#endif
>   	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>   #ifdef CONFIG_RISCV_USER_CFI
>   	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
> @@ -88,9 +90,6 @@ void asm_offsets(void)
>   	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
>   	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
>   	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
> -#ifdef CONFIG_STACKPROTECTOR
> -	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> -#endif
>   
>   	DEFINE(PT_SIZE, sizeof(struct pt_regs));
>   	OFFSET(PT_EPC, pt_regs, epc);
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 2761685cf4f87..977ee75842490 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -247,9 +247,9 @@ static noinline void __lkdtm_REPORT_STACK_CANARY(void *stack)
>   	for (i = 1; i < 16; i++) {
>   		canary = (unsigned long *)stack + i;
>   #ifdef CONFIG_STACKPROTECTOR
> -		if (*canary == current->stack_canary)
> +		if (*canary == tsk_stack_canary(current))
>   			current_offset = i;
> -		if (*canary == init_task.stack_canary)
> +		if (*canary == tsk_stack_canary(&init_task))
>   			init_offset = i;
>   #endif
>   	}
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index e4f6323d78555..b7702fefed635 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1083,7 +1083,7 @@ struct task_struct {
>   	pid_t				pid;
>   	pid_t				tgid;
>   
> -#ifdef CONFIG_STACKPROTECTOR
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
>   	/* Canary value for the -fstack-protector GCC feature: */
>   	unsigned long			stack_canary;
>   #endif
> @@ -1697,6 +1697,10 @@ struct task_struct {
>   	randomized_struct_fields_end
>   } __attribute__ ((aligned (64)));
>   
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
> +#define tsk_stack_canary(p) ((p)->stack_canary)
> +#endif
> +
>   #ifdef CONFIG_SCHED_PROXY_EXEC
>   DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
>   static inline bool sched_proxy_exec(void)
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5efceb8d58a78..878d586bda256 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -964,7 +964,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>   	clear_syscall_work_syscall_user_dispatch(tsk);
>   
>   #ifdef CONFIG_STACKPROTECTOR
> -	tsk->stack_canary = get_random_canary();
> +	tsk_stack_canary(tsk) = get_random_canary();
>   #endif
>   	if (orig->cpus_ptr == &orig->cpus_mask)
>   		tsk->cpus_ptr = &tsk->cpus_mask;

I'm seeing this build failure on RISC-V with gcc 16 and CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested 
the proposed patch with gcc 16 and it builds and boots (on real hardware) just fine. So for what it's worth:

Tested-by: Ron Economos <re@w6rz.net>

Also re-adding the RISC-V folks.


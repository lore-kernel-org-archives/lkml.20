Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227C2D2394
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039699; cv=none; b=WqF/hFmOOh2RTntN3gUpARo1ZXadRhuQm+M9jo/MqnIphQyaG5YkECLphYkXUG/yQS3xOBgmvAWqJRnshbmQ/j5fNEcymoU2IRV41cSig7Y8NmpGoazEs1XyVDLqCKxjj9Qm/RLAuXrsDQdb4JsU+BGM0P9RvojKVInwkrNyDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039699; c=relaxed/simple;
	bh=PuB4FAolKmr9wiAFZuRuz2XwqivMnfXIBcZbdV96mMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PouPcNTOCuIU+eEYme/rL5ZZw5uqVpaJEk35dOjknqt93JzVWH+30jznS0jKZzuFoLdiW6MQvP+vQ7bBhANCWT1dchREhjYwxkSQV0YiMtsYyNoZts2Olt31vk1wUVTQEMI644CtFWkTwCkw46bZvXwl+Adu8HkFVeJGeurq4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8Jq3rp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8Jq3rp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466761F000C4;
	Thu, 15 Oct 2026 04:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792039698;
	bh=lPhFMlKbnevA2dxyWYfEBOkTsgsLNfvFF+EJg8wslHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8Jq3rp43rSd6COSaLNj2L3jMeE5/yEwtWaQdaJR+2q9UNsCYR+qfy8ys5eC1eNA4
	 lebFiJ+0mhZSg46bdDhgFMrlVPzvF7IKw+tbFtzCU0biUvEa8AyQ8KZvCNtu6AKnqY
	 ghlJ7uL9kWgLqFlL7Z29MZLzvoiRz6NHINaWXBF+FndlvpKZWNRDqeO5VkN/LAOrjI
	 S9DL1CVr5RzyUrqUzY/TOZ1AiHuIIvRM52n6gQFyGBmjFLROuEDT0gQrZK2ltR4xEr
	 EbObgbS+FsBAbIeg0sScDFZmZ7fbBUMEEDcYQhUD97X9v+AnQc7UT5SqU8rXJeKpnz
	 37tYTUpO0PmlA==
Date: Thu, 15 Oct 2026 12:28:15 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Always inline on_thread_stack()
Message-ID: <atBWXxzTqLBj6Q6W@xhacker>
References: <20261012204211.3351-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012204211.3351-1-kmehltretter@gmail.com>

On Mon, Oct 12, 2026 at 10:42:11PM +0200, Karl Mehltretter wrote:
> With CONFIG_IRQ_STACKS=y, GCC may outline on_thread_stack().
> CONFIG_KCOV_INSTRUMENT_ALL instruments it, and do_irq() calls it before
> irq_enter_rcu() increments the hardirq count.
> 
> Normal KCOV records this interrupt coverage in the task's buffer, making
> results timing-dependent.
> 
> With CONFIG_KCOV_SELFTEST=y, current->kcov_area remains NULL. In QEMU, a
> timer interrupt called the helper before hardirq accounting. KCOV treated
> it as task coverage and dereferenced NULL. Fault handling recursed to stack
> overflow and stopped boot.
> 
> On a BeagleV Ahead, the unpatched kernel did not finish the selftest within
> 120 seconds. Three patched boots completed it and reached init.
> 
> Mark the helper __always_inline to keep it in noinstr do_irq(), following
> commit 1894a4030582 ("x86: Always inline on_thread_stack() and
> current_top_of_stack()"), which fixed the same out-of-line call from x86
> noinstr code.
> 
> Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>


Good catch!
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> Tested with GCC 15.2.0 and QEMU 10.2.1 on v7.3-rc7. Both images
> used byte-identical configs and v7.3-rc7 rebases of these seven pending
> patches (canonical commit IDs shown):
> 
>   3a25097bf845 kcov: use unsigned int for kcov_start() mode parameter
>   e39a9c820c37 kcov: add kcov_pause()/kcov_resume() helpers
>   ae2662563c3e hrtimer: pause KCOV during deferred rearm
>   554af946139e sched: pause KCOV in __schedule()
>   7f608b777204 sched: pause KCOV in try_to_wake_up()
>   2ba73ec2a246 sched: pause KCOV in wake_up_new_task()
>   5ee777070fac context_tracking: exclude from KCOV instrumentation
> 
>                               plain inline  __always_inline
> KCOV selftest started                  yes              yes
> KCOV selftest finished                  no              yes
> Reached /init                           no              yes
> 
> The plain-inline image stopped after printing "kcov: running self test"
> and reached the 45-second limit. The patched image reached /init in two
> 60-second runs. Those runs timed out after the marker because the test
> /init deliberately loops.
> 
> The first common patch is a type prerequisite. The remaining pause and
> exclusion changes suppress separate KCOV callbacks that otherwise obscure
> this test. CONFIG_RISCV_ISA_V_PREEMPTIVE was disabled to avoid a separate
> vector-entry callback. The only A/B source difference was this patch.
> 
> The same images were tested on a BeagleV Ahead (TH1520, four C910 CPUs).
> The plain-inline image did not finish the selftest or reach /init during
> 120 seconds after the start message. It reported RCU stalls, and CPU 1
> did not answer NMI requests. No panic or stack-overflow message was
> printed. All three patched runs completed the selftest in about 0.301
> seconds and reached /init.
> 
>  arch/riscv/include/asm/stacktrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> index b1495a7e06ce..c7c991452e11 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -16,7 +16,7 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
>  extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>  			   const char *loglvl);
>  
> -static inline bool on_thread_stack(void)
> +static __always_inline bool on_thread_stack(void)
>  {
>  	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
>  }
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

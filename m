Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44FD280035
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914668; cv=none; b=kXCFxSQl26DVf7eeWMAAbjxKg8RBi7bqrdyUuZSk8Tztdvpc6w3Gxbfomnv0ImP3OcIk1FdK1bLDlyMHeAKilb7cr88/j1yKam3k3vjiyRqIAZre7NG3MGt1LUFUTamPD26Jo/aq/YVxk3gi7PPKct+1r0XXIOQAt9BJI0X0wrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914668; c=relaxed/simple;
	bh=ORKpbp7AjgMPCFMtfbhN6DauyJKy5S+lNm/IL9cyM0E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SwWsh0obAxyvoI4drz3AzEeNuhmI9KtVpgi5pT+xsr6Nzu+BI0qoUUMFrA5IFe9B+lw9hP+3uvXptO7K0+7V9OC6Dt7dUu5a097+HF2AfI0E0RbqeI0mh3DfOBU7DX+HMHW6Zr+0e3u7sEOAAyOEAkj3tewCVA2rma9Qohno/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJPnX0UX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJPnX0UX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B329C1F00A3A;
	Wed,  9 Sep 2026 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788914666;
	bh=kNrn+bxRvquraUlROLkcePbW5n9v1zW72iJISV/dC6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AJPnX0UXFhNV5xoNjXBGdJ4z7uNqkT32fNhDo4Czr2ql6qVWOgp5Yc7GuEUQw3ZJH
	 a6MnN0SxApcff8inluNHzdkmCiy6wmGLF0wEc6qdIDhlDSMTqY6qXSHlxJ355OEOjv
	 iqjyxRgpqoKpR/cH3wRm5XnuHTWoASfx6dPW57N9in7B9NN2zjRSg272Z5DXQlITmm
	 6BItK11c+mHdJVBj9RE3qCUs8/YHeg8IhlwXLQKRKgS4ONGQB2HF3BW6JD5fKJf3FT
	 dnqs3IxuEV/LQADzjVWsSJOUjpeBTaB/bIO2hDR+3RQhDBgZ452vI4cF7nqMKvmGkr
	 SRN+U1KWY0/Ng==
Date: Wed, 9 Sep 2026 09:44:20 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jinke Han <jinkehan@didiglobal.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <laoar.shao@gmail.com>, <peterz@infradead.org>, <jgross@suse.com>,
 <kees@kernel.org>, <rppt@kernel.org>, <jpoimboe@kernel.org>,
 <calvin@wbinvd.org>, <pfalcato@suse.de>, <linux-kernel@vger.kernel.org>,
 <tiozhang@didiglobal.com>
Subject: Re: [PATCH v3] x86/kprobe: Fix crash when probe cs call
Message-Id: <20260909094420.049df579134ec8525e1eef40@kernel.org>
In-Reply-To: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
References: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks! Peter, Ingo, can you pick this via -tip tree? 

On Tue, 8 Sep 2026 15:37:42 +0800
Jinke Han <jinkehan@didiglobal.com> wrote:

> When I used eBPF to probe the call instructions within a function,
> we encountered a kernel crash.
> 
> The ebpf tool probes the 257 offset of the __hrtimer_run_queues
> function.
> 
> <__hrtimer_run_queues+249>:  nopl   0x0(%rax,%rax,1)
> <__hrtimer_run_queues+254>:  mov    %r14,%rdi
> <__hrtimer_run_queues+257>:  cs call <__x86_indirect_thunk_r12>
> <__hrtimer_run_queues+263>:  mov    %eax,%r12d
> <__hrtimer_run_queues+266>:  xchg   %ax,%ax
> <__hrtimer_run_queues+268>:  mov    %r13,%rdi
> 
> The scene of kernel crash is as follows:
> 
> [73665.737181] BUG: unable to handle page fault for address: 00000000000f41c9
> [73665.744253] #PF: supervisor write access in kernel mode
> [73665.749643] #PF: error_code(0x0002) - not-present page
> [73665.754843] PGD 0 P4D 0
> [73665.757390] Oops: 0002 [#1] SMP NOPTI
> [73665.761073] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: P
> [73665.782671] RIP: 0010:__hrtimer_run_queues+0x106/0x230
> 
> Note that __hrtimer_run_queues+0x106 is __hrtimer_run_queues+262, which is
> at the 6th byte of the above cs call instruction. Since the cs call
> instruction occupies 6 bytes, the exception occurred in the middle of that
> call instruction.
> 
> The root cause is that when using eBPF tools to probe in the middle of a
> function, kprobe with int3 is used as the underlying implementation.
> During single-step emulation of the original call instruction,
> int3_emulate_call assumes that the probed call instruction is 5 bytes
> long. However, the actual CS-prefixed call instruction occupies 6 bytes,
> so it constructs an incorrect exception return address. When the CPU
> returns from the kprobe handler, the next instruction to be executed is at
> the address of the last byte of that CS call instruction. Coincidentally,
> starting from that address, the CPU fetches and decodes a completely
> different instruction, which ultimately triggers a kernel crash.
> 
> Fix the issue by using the actual instruction length obtained from
> the instruction decoder when constructing the exception return
> address, rather than relying on the hardcoded CALL_INSN_SIZE macro.
> 
> Cc: stable@kernel.org
> Cc: linux-trace-kernel@vger.kernel.org
> Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Acked-by: Yafang Shao <laoar.shao@gmail.com>
> Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
> ---
>  arch/x86/include/asm/text-patching.h | 4 ++--
>  arch/x86/kernel/alternative.c        | 6 ++++--
>  arch/x86/kernel/kprobes/core.c       | 5 ++---
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
> index f2d142a0a862..ea09381070e8 100644
> --- a/arch/x86/include/asm/text-patching.h
> +++ b/arch/x86/include/asm/text-patching.h
> @@ -164,9 +164,9 @@ unsigned long int3_emulate_pop(struct pt_regs *regs)
>  }
>  
>  static __always_inline
> -void int3_emulate_call(struct pt_regs *regs, unsigned long func)
> +void int3_emulate_call(struct pt_regs *regs, unsigned long ip, unsigned long func)
>  {
> -	int3_emulate_push(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
> +	int3_emulate_push(regs, ip);
>  	int3_emulate_jmp(regs, func);
>  }
>  
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index add62db3e82c..d13bc5215d87 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -2172,6 +2172,7 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
>  	unsigned long selftest = (unsigned long)&int3_selftest_asm;
>  	struct die_args *args = data;
>  	struct pt_regs *regs = args->regs;
> +	unsigned long ip;
>  
>  	OPTIMIZER_HIDE_VAR(selftest);
>  
> @@ -2184,7 +2185,8 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
>  	if (regs->ip - INT3_INSN_SIZE != selftest)
>  		return NOTIFY_DONE;
>  
> -	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
> +	ip = regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE;
> +	int3_emulate_call(regs, ip, (unsigned long)&int3_selftest_callee);
>  	return NOTIFY_STOP;
>  }
>  
> @@ -2754,7 +2756,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
>  		break;
>  
>  	case CALL_INSN_OPCODE:
> -		int3_emulate_call(regs, (long)ip + tpl->disp);
> +		int3_emulate_call(regs, (long)ip, (long)ip + tpl->disp);
>  		break;
>  
>  	case JMP32_INSN_OPCODE:
> diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
> index 4e5f8c1736ec..133ff20caccd 100644
> --- a/arch/x86/kernel/kprobes/core.c
> +++ b/arch/x86/kernel/kprobes/core.c
> @@ -510,10 +510,9 @@ NOKPROBE_SYMBOL(kprobe_emulate_ret);
>  
>  static void kprobe_emulate_call(struct kprobe *p, struct pt_regs *regs)
>  {
> -	unsigned long func = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
> +	unsigned long ip = regs->ip - INT3_INSN_SIZE + p->ainsn.size;
>  
> -	func += p->ainsn.rel32;
> -	int3_emulate_call(regs, func);
> +	int3_emulate_call(regs, ip, ip + p->ainsn.rel32);
>  }
>  NOKPROBE_SYMBOL(kprobe_emulate_call);
>  
> -- 
> 2.34.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

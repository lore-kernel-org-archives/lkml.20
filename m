Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F7318ED7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831873; cv=none; b=CNb+UIMIeFhnP2rznqowwd0bBHLf+qFWM1L9/N18tE0bqZIiSNLMfU3Kh0gX/DR2I4/qj2nD+ePdQqAtd+4DVK9AuIbGmMIVUT142mnZp5EZV/t0jhCyhsMnv+yPWKbu5XuHEVi4MYK4x282aP+pehaAd1s/62bRfXSK9DLmAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831873; c=relaxed/simple;
	bh=o0OsYQeLgDmhDKtQrpKzlHEKymjnSOEQVwtMc0ZpYXc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d183dLa/kIr1QVGQ09BU2awHioWkNJ5FRVwuHhXEHA4a6a1cqnsf4JwLo+YGzVaqPI1lcqiZC5YoOFITe9UsAyFj9Q+q5npGteXk+WXyuaNOEagjOBs8lueiT7po2Y5VNUXhExXTsRhGEg6RPlRX0iJtbrKzolUhw0B4GJY/eS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVPkJvpC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVPkJvpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91F1F00A3D;
	Tue,  8 Sep 2026 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788831872;
	bh=AGZSozcoUwcMNLUN8VQ7pEvCWCMT2uW1wkRHUV42Jg0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IVPkJvpCUuoA7eURhCLPYMDOdTzq+5NA6GDXBshp8SbW230rFnth9NBouA3mljwD+
	 1ZuOEfqM3NJ6HmYHkGwJYbQqdme3KG0/m1vph9Egu4QadpaIumtjHhMg5Lp4MVKgse
	 fgbz3B0ZnsiZ23OmxKitjHw8+BdSLKY2a6iXFTcjYw092EWr0H3w8afA9bNk7P1Ac0
	 kDIKOjXlHpZV11y6XI3bCQrsQf4HBDbOKPv8E38H/P7wkpoPQ34AEOGNKhZtH3Bwfk
	 0cEBNWVnu1JXDdEEMbF6rrnSbrm6yMWWk2zvRYw3w00XPeiSCgvirqJfdqur3D9RTO
	 EI2fsSuBERHzg==
Date: Tue, 8 Sep 2026 10:44:25 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jinke Han <jinkehan@didiglobal.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <laoar.shao@gmail.com>, <peterz@infradead.org>, <jgross@suse.com>,
 <kees@kernel.org>, <jpoimboe@kernel.org>, <rppt@kernel.org>,
 <sohil.mehta@intel.com>, <linusw@kernel.org>,
 <linux-kernel@vger.kernel.org>, <tiozhang@didiglobal.com>
Subject: Re: [PATCH v2] x86/kprobe: Fix crash when probe cs call
Message-Id: <20260908104425.98040997699efaa2bc741e0b@kernel.org>
In-Reply-To: <20260907192416.GA4979@didi-ThinkCentre-M920t-N000>
References: <20260907192416.GA4979@didi-ThinkCentre-M920t-N000>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 03:24:16 +0800
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
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Acked-by: Yafang Shao <laoar.shao@gmail.com>
> Signed-off-by: Jinke Han <jinkehan@didiglobal.com>

Thanks for fixing! I have just one comment here;

[...]
 
> @@ -2180,8 +2181,14 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
>  
>  	if (regs->ip - INT3_INSN_SIZE != selftest)
>  		return NOTIFY_DONE;
> -
> -	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
> +	/*
> +	 * As seen in int3_selftest_asm, the effective return address
> +	 * should be placed immediately after the instruction sequence
> +	 * [int3; nop; nop; nop; nop.]. Therefore, CALL_INSN_SIZE works
> +	 * perfectly well here.

Nit: This explanation is somewhat wrong. alternatives only support 5-byte
call. The TEXT_POKE_MAX_OPCODE_SIZE is 5. When len == 6, alternative.c
explicitly reserves this only for 0x0f prefixed Jcc.d32

See alternative.c 
> /*
>  * NOTE: crazy scheme to allow patching Jcc.d32 but not increase the size of
>  * this thing. When len == 6 everything is prefixed with 0x0f and we map
>  * opcode to Jcc.d8, using len to distinguish.
>  */

So we don't need to take care of 6 bytes call here.

Others looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

BTW, can this be picked via tip tree ? or I can pick it.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

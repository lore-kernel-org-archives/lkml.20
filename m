Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104131;
	b=RTKoDmSK8MzTEVe65BQ1IpGqX+9wfWx+R97UBZZKtfIG+XWQOk1eQ9qzB5Ut/KS5Yqf2
	 6rF6EDanz4UyvLP3962yTDjK0n17d73QbMW23Fx08r6MAcy4+J69sl9e0Qj38cPQLk1xl
	 Lm7lX1vq/Jxsu9s+wbyQrTzzrRmrCRYMMf6wm0nT87PR/iH6Bp8S4MRcq0ak+pz8GCLMR
	 jsfW0PIe3sxz+9vvnJbddxDr5QomWHULx221XoNnqbKQOQsIqqSlik10lLuu5Pm6iue1R
	 zFkY6V/r4YQUZQKNCCR0fkcFCF3Uz/bqR1DjoE3iCjjqorWNetW5UsREyFJhIOvcG8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104131;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oQEbe3DigURkbbZBKljnP0hlfAkUpqtqIvMCZNdUxiM=;
	b=Av0s1FXr2e6hxVP5XPVFnihG+L73ZVsk11xHOwdsZDYgeB65PclCmbFh4g9eKhDPOy9X
	 Pf7m+o4A4GCOckAqqje5rApJixDIepQ2yxVYRXqKmt1rFw3x7RFXMlOE8PWHY3YcfBR3W
	 LkZl/xJVh455ZWBYx6Fp93k5C8tQpe0ZAR3mEmY1gBHfmXbuaBa5j6NPH8qlL9HsW/mp1
	 MiPPt5YFTNgjnsW62Sj9Ev6fujDx2kknhQGU6lKw6+qj/AGD62az2UwnixpkJ/u9gTH+J
	 UmfTKFKd9RlUDDpGCfIevbuMLVJzWrg91OloNqHhhaTkwkNAF/RVfablEdNC6hSLgmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frPVn++X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BDC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frPVn++X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54961F0089F;
	Sun,  8 Nov 2026 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794104131;
	bh=oQEbe3DigURkbbZBKljnP0hlfAkUpqtqIvMCZNdUxiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=frPVn++X2TPro6F5ja2r6Amed4YVGwNsgDtwgGFkOlrdu5KdM44suvzp++cHqGi2m
	 irbKuG0FFG3EamocARcVdHSqH1HvycXKu2U6rLPRCuuduYSnYOU0vT+rqhQE0kUiXM
	 NJXPJKmiKVAWrCtGTPQM7UpY2FltTXCTAcQf2wrJcdq9iIoT/hWmICgJuMZ2GcMcgx
	 iKQNvB8h/C8v1eAeQxj5F2ley1UXvj9ZmKA255A7UPP9661c+mTn3OppsnutDPzFeJ
	 fprNzd2Qua9ophL9r1lnh10WtpR/Na8gu3uGFMHjYVyjLu3gfTIpXzXhaihrLbvYMZ
	 oyg/H6st3Xl5w==
Date: Sun, 8 Nov 2026 09:55:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: entry: Mark ret_from_fork_kernel() and
 ret_from_fork_user() noinstr
Message-ID: <au_WiGUxh1mROgKY@xhacker>
References: <20261107194931.69176-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107194931.69176-1-kmehltretter@gmail.com>

On Sat, Nov 07, 2026 at 08:49:31PM +0100, Karl Mehltretter wrote:
> ret_from_fork_kernel() and ret_from_fork_user() are traceable and
> return after syscall_exit_to_user_mode() enters the RCU extended
> quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
> function_graph tracing is enabled with
> FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
> watching and triggers the ftrace_return_to_handler() warning.
> 
> Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr and bracket
> the kernel thread callback with instrumentation_begin() and
> instrumentation_end().
> 
> Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Assisted by an LLM.
> 
> Tested on v7.4-rc1 (d48723711bae) under QEMU riscv64 (-smp 4) with
> NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING, PROVE_LOCKING,
> nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line, and
> function_graph tracing during parallel fork bursts across CPUs 0-3.
> Without this patch, two consecutive runs trigger:
>   RCU not on for: ret_from_fork_user+0x4/0x368
>   WARNING: include/linux/trace_recursion.h:132 at ftrace_return_to_handler+0x2e0/0x2f0, CPU#2
> followed by an observed kernel paging request Oops in
> ftrace_graph_ret_addr() while unwinding the warning backtrace.
> With this patch, two consecutive runs complete without the
> ftrace_return_to_handler() warning or unwind fault.
> 
>  arch/riscv/kernel/process.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1cad..10c1bee77145f 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -225,14 +225,17 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> -asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
> +					     struct pt_regs *regs)
>  {
> +	instrumentation_begin();

since riscv has no objtool support, this can be removed.

>  	fn(fn_arg);
> +	instrumentation_end();
>  
>  	syscall_exit_to_user_mode(regs);
>  }
>  
> -asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
>  {
>  	syscall_exit_to_user_mode(regs);
>  }
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
> 
> -- 
> 2.39.5 (Apple Git-154)
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

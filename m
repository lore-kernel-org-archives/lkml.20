Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198996;
	b=xQu5tztcOGpIFbA3ul7PaVKAypqZavjKu953Mj/o2SbAqXRs56znV7/mMe+X77Hul7dT
	 rYkCKNVCa/UEUuX6so698xQCetpvp6njvCRdaeBwcvBQVEHF9oDaNzL0ql4DmWfddwbQf
	 mtZdFFc9BEwvo69WEEHbXJZsYGYUND0HTG34vMrhKLPVsUhjy/JSmhMMF09zP+kW29L5A
	 +ekXHCXfhHwJmZLuTmi2Aj06NYI+5jl+YHxiOsTcysED7IjmNY/Q92h0ZkrOWx+YGY8/P
	 LifN84CMMcGJmfRs58Mib22loO7MeA+s+tKeIDvTng0EDV3c21pRUReOVJK2P/rt1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198996;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uTmIS9aKyym5dH1US1ljpTNJCXSvpIpBaRQvIEMaxHs=;
	b=aUgqP2mkZv+LP2vk1/imhPAgzvkxSlSJQ8aZILRs9oJ3OwBVE8WSeeWYRSnzAbUiVSRa
	 LCOx/z8wEoostRwZagXERFEh5KmcquZShL1J1PASsDH9fzhw8EFkrfG6AIIoFh0fCEsjS
	 2p78UhwOsA1MPExzqGgDCDSjjJE3GGPWxHJBRO4MrdYodTvp3veW65P/FUkOy3v7tBAT5
	 kwyLvB5+gWKOxC1Wy4Ogo1tI/HAQmn2reGue7oyHuwhTPfrBL9slAnoXkmlpKkAQu4b5u
	 NlcK5sjpM+HFZ76gQihurc3L8miOYnrEYNSHC4zzFSjjbvf+H1y50LFa8tQsngsZcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma6N62v9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22545606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma6N62v9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA141F0089F;
	Mon,  9 Nov 2026 04:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794198995;
	bh=uTmIS9aKyym5dH1US1ljpTNJCXSvpIpBaRQvIEMaxHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ma6N62v9XBEMD4MKGpZQhtguYQqVYkJd+iTa7t/DpXBS8g0ZtUEwKBL+08sEzT78g
	 rtnDCxaD+fEJPEqdESt5wJyDWiAcH6Ia6eB7M/sjGJQUA0oJaVGgCwwhc7aHzDzCys
	 7CK2MaD9eXw8V9K0Pu4bqiGzY9QeDpL/RHfintzQmOv+DHyh7IqgxY9JrAsgTD3Oco
	 YVdKTgRskwuwXWIT2vCdzrxAMVx/LdfqEz4Cfh4JATemMcdSZkRHGoiitmA0kVrVLm
	 /Os2aalndyNDqSi5tJaiHqlHEXV3U4IRX0/7+FGRaNXel8aUv4FFnCRpXjqqUtpORu
	 B+OvYiT4ihCjQ==
Date: Mon, 9 Nov 2026 12:16:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: entry: Mark ret_from_fork_kernel() and
 ret_from_fork_user() noinstr
Message-ID: <avFJFlcVI1ycJzmJ@xhacker>
References: <20261109041845.33695-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261109041845.33695-1-kmehltretter@gmail.com>

On Mon, Nov 09, 2026 at 05:18:45AM +0100, Karl Mehltretter wrote:
> ret_from_fork_kernel() and ret_from_fork_user() are traceable and
> return after syscall_exit_to_user_mode() enters the RCU extended
> quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
> function_graph tracing is enabled with
> FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
> watching and triggers the ftrace_return_to_handler() warning.
> 
> Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr.
> 
> Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Assisted by an LLM.
> 
> v2:
>  - Drop instrumentation_begin()/instrumentation_end() around the kernel
>    thread callback. They only feed objtool's noinstr validation, which
>    riscv does not have (Jisheng Zhang). ret_from_fork_kernel() and
>    ret_from_fork_user() disassemble identically to v1 (Clang, defconfig
>    with NO_HZ_FULL and FUNCTION_GRAPH_TRACER).
> 
> v1: https://lore.kernel.org/r/20261107194931.69176-1-kmehltretter@gmail.com/
> 
> Tested with v1 on mainline d48723711bae (after v7.4-rc1) under QEMU
> riscv64 (-smp 4) with NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING,
> PROVE_LOCKING, nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line,
> and function_graph tracing during parallel fork bursts across CPUs 0-3.
> 
>  arch/riscv/kernel/process.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1cad..6f2b46d1a8e98 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -225,14 +225,15 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> -asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
> +					     struct pt_regs *regs)
>  {
>  	fn(fn_arg);
>  
>  	syscall_exit_to_user_mode(regs);
>  }
>  
> -asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
>  {
>  	syscall_exit_to_user_mode(regs);
>  }
> 
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
> -- 
> 2.39.5 (Apple Git-154)
> 

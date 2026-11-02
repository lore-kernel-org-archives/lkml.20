Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639193;
	b=a85jsfutZBAPOE2+XfbEuAlVrWByj8ogF7O/j1tD4QlpwrRtvu3B4KopouG2G6wU1p+z
	 7AK9JKh211ho6iwDZolj8i2cKNymafpSyUvitCVIgo7pFs04/r3DUAcYxkyiXZ38ooqrh
	 HoPVYGY1XQ7tDoFEJ4DHgovnH7UoFjYy1o46lVlYzUMlgulQaFfaJZIFeGiYKI5AhxGIa
	 Mlqo+bLNjHzLEtGi99yPcKFDSlTAXsKl45XLC+4eYZ8mZePHiVJonXJFj8MQ03/pmAonY
	 Lot99FWvvrRuV+KfWpZuK2EYzyuGqsvzqDDKbbGjUupYJEQK3kHEFeM4NZPvsBN0i5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=unqZsi9O/31qc9ncF7sp3/0wHMNoeSCeWr1AW4U6s0I=;
	b=KqC3PC5mKnfrJDdIG2LkKHcOuyhthn5SS8yNHQeLhHzOVHyq3ekPiPzGhM15ZwCcsay6
	 Hy8Rk8xYr8skpqMC/NLeb0JgFS5TQu4i56RyJWMtBwVDdi7ZNCGZvaQBSjjJ+YyG1+kqk
	 0IYqnVhsChenywLLfcZL9EHiMuJtsob7eis13IZWJWrgSAYdOY7IjvG84pCR1lMeQWG3+
	 jZfSK1uu6X9MTbCC51cPVX/9PfYSgFliP5+Etm/I7E+oJnMeWetHhfjdY+nFbL2xkD6Xy
	 Qt/tpZQ1l/aGMTgtJ4SQjp83eWuGs2uy6V68rB2Eb/FF5XuDVeFe0tbBmh1KeHXveIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=trvQZCGc;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D39606A905
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D39606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=trvQZCGc
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1572256f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639192; x=1794243992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unqZsi9O/31qc9ncF7sp3/0wHMNoeSCeWr1AW4U6s0I=;
        b=trvQZCGcrpDqrHiWyDt56jGp/gDQrU/JMKbsNnjjkuRR0K1+1aG07rNFJYpcAD3FhF
         V7pl679TN1B/jOy/2V1DEMaRGIXDTLofalLL3XHzrbGZHSMCDjx7Weco81zdmCtSC50P
         TE8n5b9dVTILJj1yE451gsLVZGgklUJk1vUCf8jLhHstKS2idgmkBwd6fF9MlGOM8808
         HygRH+jUI/kTB/14DjY5YqoM+fWXXCuKjC/BxkLgJYfDvz8j19sR3xDz7zKbyLurNyPr
         X8TxrdaArR19kNZPXKWkrGfjvBftjeFn/2ofpSNYJtZWO9AOjGOBRhYexu7LG+AZi8zL
         O4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639192; x=1794243992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unqZsi9O/31qc9ncF7sp3/0wHMNoeSCeWr1AW4U6s0I=;
        b=spE2gqndbxtUE/i/U2qse1oL7epRNsitenVeam+xDivZ/cWLKD4doyEhxKwLOTPorm
         sgVdXo09SSpD1ZoBrfi5KQ7pPe/BumlvkuqEtywLPAXmvarEeBGQwXYlRvWQTLIerWi9
         hLOlzKo8Ozhql26I5w/Vpq0fKvbF51HBJAj1Z39muo3PkD0r5mAupvnwFWRwYl1QRMcg
         8znNYFqrYUNXRy1zG1IdH+9aL8KTZNTWs30CypCOn3GQKRqICFBfynazC1NCo98p2dao
         i2Oy4L70yTMSc97vWkXRNZwQm//M/8gUa9KuYkbZgk5MMLqZV6MEv0DvxuGTz735sxnT
         6Hgg==
X-Forwarded-Encrypted: i=1; AKwUvByKslGojvPHWdQKeedzoO91TP/lwE9A+OGkWYVuwU6j6jIXDncAHPleKNVPAHhEMf5MGZvlzSGSvHcKcGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8idBlP1l5Ih/yVJoW6DxgQET6/EvKwj9pwx/wwldxlDkyX4mrA
	uFd8MGoUD99mnthtphaIfzbksr8yZnFMSix3DAi/KNasyAf49oVnpxBU
X-Gm-Gg: AYBFou3t8vhz++EWnaQNw1vazfXdxFnfmDZLBn9j6E+2H85+tpQgBA/Uz6ezIgiBbXf
	caA319Xqs+EJXKypqwXX9FmX4UySoqfD3dtya56QO6d10Pm1ZBeJcgQkijy1S5hlcMeLfYkby55
	3thCsJBd6bsrIxuh32g1pq2yQ/CY14KWVxncchNXlchBwSA0YRgcVugGKyzB6PPnjHZwOt8wFhq
	MzfxH1uhjiHeAEEj7MNpZq1zv4xNCUDJDZxAFcj6Piih7FH8i6UEJXGHVXVogLw0FxRCfPqMhvB
	NIPhgtgzU6KaEV6tITYAOa0okX0hcA2RX3oTNWig15fSe/kABeRjPUunoHcSnNc5WYEPvybZgQT
	OY3xM8ajh4Zd0c52A0IBMUpKjR6R19tAyeuZ+e0iEx6Ipe68bRDAHon+Fo+uR6DxhIcjIFNiveG
	QRiA7rMzX/bGExuvgAHcRHkvtEhuE60kLhyDkn+S92r9Uo+1PWxWKyIoewj9ezhNnPBa0eoc2YS
	sAbzCVjo+GZP3u61Hj5sjofg2OC4VpoJla83XR/XbEFeKVsytq4t/96O7L/aNCN4lnr7VZBMfsW
	uRjU9YhK7o8J6mWyu6DkNCOdNPXSUBsctrWQVN+TnZWXpjfeBQ==
X-Received: by 2002:a05:6000:178c:b0:487:b50:101c with SMTP id ffacd0b85a97d-48e6e2bc04cmr25156413f8f.5.1793639191708;
        Mon, 02 Nov 2026 09:06:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm21612015f8f.12.2026.11.02.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:06:31 -0800 (PST)
Date: Mon, 2 Nov 2026 17:06:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, jpoimboe@kernel.org,
 leitao@debian.org, keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 4/6] x86_64/entry: Mark all syscalls __noendbr
Message-ID: <20261102170630.1dfc00eb@pumpkin>
In-Reply-To: <20261102114000.771366690@infradead.org>
References: <20261102112549.714541309@infradead.org>
	<20261102114000.771366690@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 12:25:53 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> Since system call dispatch is now strictly through direct calls, there is no
> reason for the syscalls to be called indirectly. Mark them all __noendbr.
> 
> Notably, the sys_call_table[] is purely a lookup for tracing and the like,
> nobody actually (should) dispatch anything through it, and with this we make
> sure nobody *can*.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/entry/syscall_32.c            |    5 +++--
>  arch/x86/entry/syscall_64.c            |    7 ++++---
>  arch/x86/include/asm/syscall_wrapper.h |   23 ++++++++++++-----------
>  tools/objtool/check.c                  |    9 ++++++++-
>  4 files changed, 27 insertions(+), 17 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -12,6 +12,7 @@
>  #include <asm/traps.h>
>  #include <asm/cpufeature.h>
>  #include <asm/syscall.h>
> +#include <asm/ibt.h>
>  
>  #ifdef CONFIG_IA32_EMULATION
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> @@ -19,8 +20,8 @@
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
>  #endif
>  
> -#define __SYSCALL(nr, sym) extern long __ia32_##sym(const struct pt_regs *);
> -#define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __ia32_##sym(const struct pt_regs *);
> +#define __SYSCALL(nr, sym) extern __noendbr long __ia32_##sym(const struct pt_regs *);
> +#define __SYSCALL_NORETURN(nr, sym) extern __noendbr long __noreturn __ia32_##sym(const struct pt_regs *);
>  #include <asm/syscalls_32.h>
>  #undef  __SYSCALL
>  
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -8,9 +8,10 @@
>  #include <linux/entry-common.h>
>  #include <linux/nospec.h>
>  #include <asm/syscall.h>
> +#include <asm/ibt.h>
>  
> -#define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
> -#define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
> +#define __SYSCALL(nr, sym) extern __noendbr long __x64_##sym(const struct pt_regs *);
> +#define __SYSCALL_NORETURN(nr, sym) extern __noendbr long __noreturn __x64_##sym(const struct pt_regs *);
>  #include <asm/syscalls_64.h>
>  #ifdef CONFIG_X86_X32_ABI
>  #include <asm/syscalls_x32.h>
> @@ -25,7 +26,7 @@
>   * kernel/trace/trace_syscalls.c still wants to know the system
>   * call address.
>   */
> -#define __SYSCALL(nr, sym) __x64_##sym,
> +#define __SYSCALL(nr, sym) (void *)&__x64_##sym,
>  const sys_call_ptr_t sys_call_table[] = {
>  #include <asm/syscalls_64.h>
>  };
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -7,9 +7,10 @@
>  #define _ASM_X86_SYSCALL_WRAPPER_H
>  
>  #include <asm/ptrace.h>
> +#include <asm/ibt.h>
>  
> -extern long __x64_sys_ni_syscall(const struct pt_regs *regs);
> -extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
> +extern __noendbr long __x64_sys_ni_syscall(const struct pt_regs *regs);
> +extern __noendbr long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>  
>  /*
>   * Instead of the generic __SYSCALL_DEFINEx() definition, the x86 version takes
> @@ -83,22 +84,22 @@ extern long __ia32_sys_ni_syscall(const
>  			__MAP(x, __SC_TYPE, __VA_ARGS__))		\
>  
>  #define __SYS_STUB0(abi, name)						\
> -	long __##abi##_##name(const struct pt_regs *regs);		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs);	\
>  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
> -	long __##abi##_##name(const struct pt_regs *regs)		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs)	\
>  		__alias(__do_##name);
>  
>  #define __SYS_STUBx(abi, name, ...)					\
> -	long __##abi##_##name(const struct pt_regs *regs);		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs);	\
>  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
> -	long __##abi##_##name(const struct pt_regs *regs)		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs)	\
>  	{								\
>  		return __se_##name(__VA_ARGS__);			\
>  	}
>  
>  #define __COND_SYSCALL(abi, name)					\
> -	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
> -	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
> +	__weak long __noendbr __##abi##_##name(const struct pt_regs *__unused);	\
> +	__weak long __noendbr __##abi##_##name(const struct pt_regs *__unused)	\
>  	{								\
>  		return sys_ni_syscall();				\
>  	}
> @@ -257,8 +258,8 @@ extern long __ia32_sys_ni_syscall(const
>   * For VSYSCALLS, we need to declare these three syscalls with the new
>   * pt_regs-based calling convention for in-kernel use.
>   */
> -long __x64_sys_getcpu(const struct pt_regs *regs);
> -long __x64_sys_gettimeofday(const struct pt_regs *regs);
> -long __x64_sys_time(const struct pt_regs *regs);
> +long __noendbr __x64_sys_getcpu(const struct pt_regs *regs);
> +long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs);
> +long __noendbr __x64_sys_time(const struct pt_regs *regs);
>  
>  #endif /* _ASM_X86_SYSCALL_WRAPPER_H */
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -4672,8 +4672,15 @@ static int validate_ibt(struct objtool_f
>  		    !strcmp(sec->name, "__patchable_function_entries"))
>  			continue;
>  
> -		for_each_reloc(sec->rsec, reloc)
> +		for_each_reloc(sec->rsec, reloc) {
> +			struct symbol *sym = find_symbol_containing(reloc->sec->base,
> +								    reloc_offset(reloc));
> +
> +			if (sym && !strcmp(sym->name, "sys_call_table"))
> +				continue;

Does that slow things down somewhat?
Could you do it the other way around??
So remember the bounds of sys_call_table and just check whether the relocation
in inside it.

Try building x86-64 allyesconfig :-)

David

> +
>  			warnings += validate_ibt_data_reloc(file, reloc);
> +		}
>  	}
>  
>  	return warnings;
> 
> 
> 


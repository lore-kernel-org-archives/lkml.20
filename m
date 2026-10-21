Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567066;
	b=nIfT0hsh+goBaP59+8Eh6SPuH+LfU9cApm03FvRCZ1yBkLxemQjvgTn3FpUOmeRRuVCh
	 So48hAhzEvfMYHagNxJlqCNpwRJ8FNzVUtw15OUsX/Yxp/WyJbuMY8mM/Itdyvv0nve43
	 j/0ZCEPGf0ZAu/V/pGA0hKMKx2Us06wc7xgUhGhWwzGaXrw3LVoSq3c+PoUrJs5SlwFBU
	 V/7VOTN0ZQWaPoLW7g+fYeAnlbGs67j45FBsBKWjGxh9ZgCZoQf2r4uJf6/in/D9Shwy1
	 nS3w1w47fvDcAw5FJJUbzk2H+L/yGUl+AHTVAmQOnD4wImd/PVKBC77jsS1LFFhNRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dNHkp3TMA906yoOavuetpAdxfHJXR2U43F8kVqwiTi8=;
	b=vGL6GheoTN02xRgnJfGOJohIRoo7suy+MvBq18E44XNMpFwXLtd7ZpkrcQ1WTi07MQuS
	 5QL8nNGGG3rvcFx09Nw17J4e494aJm8MzejzENFNcbd9NobXtjX773XEdNKnhyJhEzi1K
	 Slaixze7SGwuioNmds1K73Q4ZwDL8e6nc/fEJKx6tqfn2d8KWorqpSmaxyrhxaM+UMhi5
	 VjudgdqLfWksW6SwwCBUGJ+TLcJw03bOTPphSza6YQbO6NxXnKLgwGu3Rz3AnaZ54kQiT
	 OuzXPxMxGCnuKIa/jNkNsLffqwyX95ARpXEwjZBp49/kHOlC+Dor6ENrMacqNL1gS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DtxOQrFp;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E4606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DtxOQrFp
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so351714a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792567065; x=1793171865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNHkp3TMA906yoOavuetpAdxfHJXR2U43F8kVqwiTi8=;
        b=DtxOQrFpABODuBqZHktKfaG9mogyVwJ/X9apkJfNc93fFijX+7IDDADjrEbAttqXdg
         yGr7DkVKbkZtAbZmgOiE/QCq8oj/iJL3T7bykDizeTn0yy6zJIgidw8uxcfSue4kkm9h
         UerIYqo+6C0Qz3YjRScg8evQNvd1PVwW7Zl6Pz5o8FuQ8yRbETjrPdDskwtePIe/QLlj
         qnB2w6dgr6KUlRf513wzDTCyd8g0Ji4EDk3/d2bI3RHAEAMEXBUeTvyqvPta09mguq3A
         4mLn9dBAWk1gUFCsEHAAEBkYPYU9zY6xaXuZ/RG8Sj8tLP3drNdpNyNu18JHCzkSuDkr
         MUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567065; x=1793171865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNHkp3TMA906yoOavuetpAdxfHJXR2U43F8kVqwiTi8=;
        b=Zl2L+PCU8dofCxtfrurlj6i6oZyJ+l8/tLzeYgKUbgChKj5EFzc9jldprI4hIaFqD9
         Vy1JWy0wevPwEVcOs5VWJj0RFyvW4eIYEIFP9IOlte9ieq5MkvNFi1obosym6XhhYVMz
         NocEI0h1v+rbkBrJvIv2/1nDsnpuk4SsUCs4I/kXwG4vDg/geamPOELXl4rv2KbX+MLK
         uVcqps264UkzEcw1GDmcrIhLtOcSXt+qcAtJCZwayPoKQsF6CUqot1SRGVp3qnMy/9EA
         Bo3uu4MqphVxrGVHchi6SpGSllq0LtFTq5vYcJKaLIR7GiU1UWpDYVdL37AewpDeEngy
         zrMg==
X-Forwarded-Encrypted: i=1; AKwUvByq4evBj2jSQI9XTMMb4S+PBXkXHbb4zT07UrTzmlrlpKihB9KhOzvt4dgF8fGIG3ecZtr0PwY1w9wdIoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHVHX3wvfUgFNWmfDiqunyvFurZ4SwPAw/iBtT0Hx9Beno4Ek2
	jsGVvuWTCB+uRub2JWY7VVfdO22VPtPpTfAWTLaEJTFfW6bqM4ZkT4or
X-Gm-Gg: AYBFou2osDrV73FXvgBj+G6s6tIjR2Ps0lzTyjvMuSo+BWyo3vJky3eruUAKgQnuft5
	U3Tz/o982OSeayD8w2jrJs5BI6f3HN+ZEaKVzlGb5GHGRiIoIIOZRIRVcJ0j20sUnl6Tp6E2gyn
	1+cmoImHkByx3FOEYu4eltHcNcPqq1eGw/PSAWgSL75f4BZq3cmTeSdgTdObZ8D+gbqIjBP4FEn
	/RkYMSTs/nzOOVL3VSdvnCe1UMpwrbW1KMwdId17FpySu6DqyZfcPXxzzTZy/9a87iNo9YueFiW
	r6+sXa2enuuQayXIncmaINriv6SfO0AVThEv7syDA91DqivkuZwk0RJtqc9BtnLVqMdUHi0fvop
	OaxMV0dbRyw2Y94L1OdgnxcZmUS27DwJdlfWoyvvFysUdkhHGyLNYCa1gvrhODyf5/AjyEtq7CO
	YUMWF7qx/R0A3+K0nwGSzc1rewOxy3f/cBAH8V6WBXuft/11opA5bTE+bE++vlYrl161xWF5Hio
	755gEdQPsni9zZPOP2mlDezpQ5cHPv9+Mom0KbdeNalShTjLF9uIbAJVn+U5oIrxztz5ji1AOd6
	ssEd7w7cKjQuatq6Q+eVNTWK
X-Received: by 2002:a17:90b:2886:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ad86f4519bmr1005499a91.18.1792567065115;
        Wed, 21 Oct 2026 00:17:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad7fb165a2sm3270457a91.0.2026.10.21.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:17:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:47:36 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Davide Berardi <berardi.dav@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Oleg Nesterov <oleg@redhat.com>, "Dmitry V . Levin" <ldv@strace.io>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] powerpc/syscall: Return the preset value of skipped
 syscalls
Message-ID: <athm2nYVnq6vYBY3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261018151539.440213-1-renzo@cs.unibo.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018151539.440213-1-renzo@cs.unibo.it>

On Sun, Oct 18, 2026 at 05:15:33PM +0200, Renzo Davoli wrote:
> From: Davide Berardi <berardi.dav@gmail.com>
> 
> When ptrace or seccomp skip a system call, the return value they set in
> regs->gpr[3] gets lost or the tracer is affected, since two recent
> changes:
> 
> 1. Commit 05c033db7e9a ("entry, treewide: Make
>    syscall_enter_from_user_mode[_work]() indicate syscall execution")
>    made system_call_exception() return syscall_get_error() for a skipped
>    system call.  syscall_get_error() is 0 for any non-error value, so a
>    success value set by a tracer at a PTRACE_EVENT_SECCOMP stop (e.g.
>    with PTRACE_POKEUSER), or by a SECCOMP_RET_USER_NOTIF listener, is
>    replaced with 0.
> 
> 2. Commit 69cb2be898be ("powerpc/syscall: Fix syscall skip handling for
>    seccomp and ptrace") made syscall_set_return_value() set
>    TIF_SYSCALL_RET with set_thread_flag(), i.e. on current rather than on
>    the task passed in.  When the caller is a tracer, as in
>    PTRACE_SET_SYSCALL_INFO with op == PTRACE_SYSCALL_INFO_EXIT, the flag
>    ends up on the tracer, and the next system call of the tracer is
>    silently not executed.  Setting it on the right task would not be
>    enough either: at a syscall-exit stop the flag would then skip the
>    next system call of the tracee.
> 
> TIF_SYSCALL_RET is not needed anymore: after the change described in 1.
> the generic entry code tells whether ptrace or seccomp skipped the
> system call, and every in-kernel caller of syscall_set_return_value() on
> the syscall entry path (SECCOMP_RET_ERRNO, SECCOMP_RET_TRACE without a
> tracer, SECCOMP_RET_USER_NOTIF) also makes it return false.  A user
> calling syscall(-1) without tracer or seccomp still gets -ENOSYS.
> 
> Remove the flag and return regs->gpr[3] for a skipped system call, as
> done before the conversion to GENERIC_ENTRY.  The syscall exit path
> already converts a negative error value to the "sc" ABI, and
> syscall_set_return_value() keeps CR0.SO in sync for positive error
> values.
> 
> Fixes: 69cb2be898be ("powerpc/syscall: Fix syscall skip handling for seccomp and ptrace")
> Fixes: 05c033db7e9a ("entry, treewide: Make syscall_enter_from_user_mode[_work]() indicate syscall execution")
> Cc: Michal Suchánek <msuchanek@suse.de>
> Cc: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Assisted-by: claude-opus-5-5
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> ---
> How this was found and tested: QEMU pseries (TCG, -cpu power9), ppc64le
> guest config, v7.3-rc6 (7b63ef2d55f2), with a small reproducer
> (ppc_skip_repro.c, available on request) which
> 
Hey,
Can you share the reproducer?

Regards,
Mukesh
>  - sets the getpid() return value at a syscall-exit stop with
>    PTRACE_SET_SYSCALL_INFO, then makes a syscall in the tracer;
>  - skips getpid() at a PTRACE_EVENT_SECCOMP stop with PTRACE_POKEUSER
>    (r0 = -1, r3/CR0.SO = return value), with both "sc" and "scv 0".
> 
>                                              v7.3-rc6      with this patch
>   tracer syscall after SET_SYSCALL_INFO      returns 0     correct
>   skipped syscall, success value, sc/scv     returns 0     correct
>   skipped syscall, error value, sc/scv       correct       correct
>   selftests/ptrace set_syscall_info test    FAIL          pass
>   selftests/seccomp/seccomp_bpf              11 failures   all pass (*)
> 
>   failing in v7.3-rc6: user_notification_{basic,child_pid_ns,
>   sibling_pid_ns,fault_recv,addfd,addfd_rlimit,sync,fifo,wait_killable},
>   TRACE_syscall.seccomp.syscall_faked, plus the timing-only one below.
> 
> (*) user_notification_wait_killable_after_reply (100000 notifications
>     with a 1 ms itimer) can hit the 30 s harness timeout under emulation,
>     with and without this patch.
> 
> Build-tested with W=1: ppc64le guest config, ppc64_defconfig (BE),
> pmac32_defconfig.
> 
>  arch/powerpc/include/asm/syscall.h     |  6 ------
>  arch/powerpc/include/asm/thread_info.h |  1 -
>  arch/powerpc/kernel/syscall.c          | 15 ++++++++-------
>  3 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 32be22b995cc..4b3c52ed6e9d 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -98,12 +98,6 @@ static inline void syscall_set_return_value(struct task_struct *task,
>  			regs->gpr[3] = val;
>  		}
>  	}
> -	/*
> -	 * Mark that a return value has been explicitly set by seccomp or
> -	 * ptrace so that system_call_exception() can skip the syscall
> -	 * unconditionally, even when the user requested syscall(-1).
> -	 */
> -	set_thread_flag(TIF_SYSCALL_RET);
>  }
>  
>  static inline void syscall_get_arguments(struct task_struct *task,
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 1e069a2e7ce8..0487e94d3416 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -120,7 +120,6 @@ void arch_setup_new_exec(void);
>  #endif
>  #define TIF_POLLING_NRFLAG	19	/* true if poll_idle() is polling TIF_NEED_RESCHED */
>  #define TIF_32BIT		20	/* 32 bit binary */
> -#define TIF_SYSCALL_RET		21	/* syscall error value set */
>  
>  /* as above, but as bit values */
>  #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index fbefe1927b10..52ceff4ef41b 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,13 +18,14 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>  	long ret;
>  	syscall_fn f;
>  
> -	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))) {
> -		clear_thread_flag(TIF_SYSCALL_RET);
> -		return syscall_get_error(current, regs);
> -	}
> -
> -	if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
> -		return syscall_get_error(current, regs);
> +	/*
> +	 * If ptrace or seccomp decided to skip the syscall, regs->gpr[3] holds
> +	 * the return value they set (or the unmodified first argument, e.g.
> +	 * for PTRACE_SYSEMU). Return it as is, the exit path takes care of
> +	 * the error encoding for the "sc" ABI.
> +	 */
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0)))
> +		return regs->gpr[3];
>  
>  	if (unlikely(r0 >= NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {
> -- 
> 2.55.0
> 

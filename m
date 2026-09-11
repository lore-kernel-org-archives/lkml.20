Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220CF3537F9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113227; cv=none; b=qQ+Rayr+zlGXHeVKKco7jG7YhcIVOPSt/UjskQOkV2jgpSYr5z8zkeQ9hGSoEeva8PW6kNSWjtjTB+nqTbfjLwz2MEAbmKi7hXVSe5V8JWAqq/Y23/sYq5w858791D/AtZYtadaa4jgKV0s6vq1DrT2MK2zdM3P2FlOO0S1kwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113227; c=relaxed/simple;
	bh=kZeGkzBl6hF9w8RxLyjN4EJoMY1viJwviyqHjoGBZ7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ElKCoNlnEwhPofNVqNfSh0r3WptYNIh/7E7rh3n1ezq7BeHrUm1xV8zY1zYVaYmfG2/XZt8hPaJtn9L203BTAgJrgqn4PoLgPM2Roceg37oTPEkxGUtAn6ZWnsUXF34Mtg4z4iZ+ZhUkObLDET9kTJc2k43b/YPm2X1L45t9+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AMo0eUCc; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AMo0eUCc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W6+glI+goJHVqKYDYCONg5FmS7+GpysWG5BLuwQqvu8=;
	b=AMo0eUCc9feVo66C77zPPBNSi+lNjw3r76+qQRNtidxEVYyIaBbPE5nUb97YFsHgsH0yUSQEF
	KweUX0s1l5dqnqWr1ljDwCndZGcYiVF0pivnWQFSF/YRfcQYJ7a858+0BbyY+Nw4vmBTa+ulMwq
	cPX442lp4U4hoSRVB87hm5w=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hh62Z0DGcznTVd;
	Fri, 11 Sep 2026 15:42:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 101AD40586;
	Fri, 11 Sep 2026 15:53:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 15:53:37 +0800
Message-ID: <f1675130-c72e-4c11-b2bf-daec44f02b29@huawei.com>
Date: Fri, 11 Sep 2026 15:53:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] arm64: entry: Defer setting of TPIDRRO_EL0 until
 exit to userspace
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
 <20260907164247.17223-2-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164247.17223-2-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:42, Will Deacon 写道:
> In preparation for using TPIDRRO_EL0 to point at 'current' while running
> inside the kernel, defer its userspace initialisation from the
> context-switch patch to exception return. This has the added benefit of
> not having to worry about keeping the in-memory value and the register
> value in-sync during preemptible sections.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/asm-offsets.c |  1 +
>  arch/arm64/kernel/entry.S       |  4 +++-
>  arch/arm64/kernel/process.c     | 16 +---------------
>  arch/arm64/kernel/sys_compat.c  |  7 -------
>  4 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
> index 9c853ed3ceab..6038ab3beb25 100644
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -42,6 +42,7 @@ int main(void)
>  #endif
>    BLANK();
>    DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
> +  DEFINE(THREAD_TP_VALUE,	offsetof(struct task_struct, thread.uw.tp_value));
>    DEFINE(THREAD_SCTLR_USER,	offsetof(struct task_struct, thread.sctlr_user));
>  #ifdef CONFIG_ARM64_PTR_AUTH
>    DEFINE(THREAD_KEYS_USER,	offsetof(struct task_struct, thread.keys_user));
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f63049ac32dc..59f045e496ec 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -47,7 +47,6 @@
>  	b	.Lskip_tramp_vectors_cleanup\@
>  	.if	\regsize == 64
>  	mrs	x30, tpidrro_el0
> -	msr	tpidrro_el0, xzr
>  	.else
>  	mov	x30, xzr
>  	.endif
> @@ -360,9 +359,12 @@ alternative_else_nop_endif
>  	.if	\el == 0
>  	ldr	x23, [sp, #S_SP]		// load return stack pointer
>  	msr	sp_el0, x23
> +	msr	tpidrro_el0, xzr
>  	tst	x22, #PSR_MODE32_BIT		// native task?
>  	b.eq	3f
>  
> +	ldr	x0, [tsk, #THREAD_TP_VALUE]
> +	msr	tpidrro_el0, x0

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  #ifdef CONFIG_ARM64_ERRATUM_845719
>  alternative_if ARM64_WORKAROUND_845719
>  #ifdef CONFIG_PID_IN_CONTEXTIDR
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 581f80e9b9b7..bfdc12166895 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -256,17 +256,8 @@ static void tls_thread_flush(void)
>  	if (system_supports_tpidr2())
>  		write_sysreg_s(0, SYS_TPIDR2_EL0);
>  
> -	if (is_compat_task()) {
> +	if (is_compat_task())
>  		current->thread.uw.tp_value = 0;
> -
> -		/*
> -		 * We need to ensure ordering between the shadow state and the
> -		 * hardware state, so that we don't corrupt the hardware state
> -		 * with a stale shadow state during context switch.
> -		 */
> -		barrier();
> -		write_sysreg(0, tpidrro_el0);
> -	}
>  }
>  
>  static void flush_tagged_addr_state(void)
> @@ -531,11 +522,6 @@ static void tls_thread_switch(struct task_struct *next)
>  {
>  	tls_preserve_current_state();
>  
> -	if (is_compat_thread(task_thread_info(next)))
> -		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
> -	else
> -		write_sysreg(0, tpidrro_el0);
> -
>  	write_sysreg(*task_user_tls(next), tpidr_el0);
>  	if (system_supports_tpidr2())
>  		write_sysreg_s(next->thread.tpidr2_el0, SYS_TPIDR2_EL0);
> diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
> index 0451f96c2c3f..59eee301c6f4 100644
> --- a/arch/arm64/kernel/sys_compat.c
> +++ b/arch/arm64/kernel/sys_compat.c
> @@ -89,13 +89,6 @@ long compat_arm_syscall(struct pt_regs *regs, int scno)
>  
>  	case __ARM_NR_compat_set_tls:
>  		current->thread.uw.tp_value = regs->regs[0];
> -
> -		/*
> -		 * Protect against register corruption from context switch.
> -		 * See comment in tls_thread_flush.
> -		 */
> -		barrier();
> -		write_sysreg(regs->regs[0], tpidrro_el0);
>  		return 0;
>  
>  	default:


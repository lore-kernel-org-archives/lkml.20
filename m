Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831597;
	b=ccwLVwXTqF8Mdg1QobIikzoef+NHtjQESsf+thHEA0UqzdSMZDjUUmoS/TlA1B0VvQHZ
	 Rh4940vIJsyrIXAphfQVwdstTJECve5lHAXNb66PqUCqLt3nF4C/72FDucHB+fpH8SXyA
	 /vZl8aXiaifGgwyG1cAToDXHO50jgNSvSOnuJ+/9ogIIjfgNhr9+jugUT7IIsSnobuz+l
	 JqGhsw90iCDGZBEMv0Z1RFSeFs3/GHUJmi+lhbA0ai9C2svRe9LLz/B0HgFhajufSQi2v
	 kvrMSed9SBBj4GCbLjxpCI6Aawqeipp28d9Upsm+KMvV+keblEjsheeNKPEVSMd4hxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831597;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y+b7pepc+bqSJnjvX8gOa7j05vvfbGVSW+Ko5NDA4NQ=;
	b=iyKd4TNgdnpQTCSvUdUS9Cc8QOaHzFwvmP6HAJPgi8fI0MLAJMs4Lh47/Kw6EXdTa7KZ
	 LU/JTPXIfwWw5IvfAbw/YhdT52u6qqaD+BfLuPntW3ORrY4Y2r2O9Z+ww9CxTDX0FWme4
	 0/bOdbXxSjdF5Gtg7vVjErg5lXQ0OOZ/lZZRiKXGjIa+WX03okMrtnVl6E9jugYOLljhJ
	 Z3lzkdeMMz5bVzPbKPZEhI7tXZegnEMMRf6fFnZsudfS9wzNgQacWPEAWhCaursgbUd5N
	 9sGEdEmTZM31oF/FOwVOPm4JkyMgu53Ms6WrwXgOw2yO00wXZ8F7uNw7BRY0TDrPKVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6i2kbJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6i2kbJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335D81F000C4;
	Mon, 16 Nov 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831597;
	bh=Y+b7pepc+bqSJnjvX8gOa7j05vvfbGVSW+Ko5NDA4NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6i2kbJuFcncsmN96i+B4eX/8pFwpz8E8Mj0REJTflzdzEb762gWULzIIoik2F4KM
	 pj78evRrW48pcJRQuHXSpbctZ6lrijH0BxBJIdQvPf5MKD7SsQpFX+jvHSBi6ijBro
	 bn2NqV23Kd9e5AK9NYaISlCfV3uL09YyX1FyxW8VPfRKrZDmxd7oU1kkqtQKUgnzlo
	 lzWossq90I4NOU9bLdEdu1jKUGxcm8uqOZGYj3WRs/kz0ksSRQH8Ej0avNY3Lmzz08
	 MaPZKqiAVbboL/9T+JNNSRHEdDUnMEgRN7Q8M16NsmWdo/UDBI8ltiHE50MdGVPSQs
	 rZGCww+HqQJQQ==
Date: Mon, 16 Nov 2026 19:59:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Zong Li <zong.li@sifive.com>, ivanrwcm25@gmail.com
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, debug@rivosinc.com, samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for
 user workers
Message-ID: <avrwLtiPQWedXpY_@xhacker>
References: <20261116032558.130928-1-zong.li@sifive.com>
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
In-Reply-To: <20261116032558.130928-1-zong.li@sifive.com>

On Sun, Nov 15, 2026 at 07:25:58PM -0800, Zong Li wrote:
> User-space background workers created through the copy_thread() args->fn
> path (such as io_uring io-wq/SQPOLL threads and vhost workers) share the
> parent's memory space (CLONE_VM) but never return to userspace.
> 
> Currently, these workers inherit the parent's user_cfi_state bookkeeping
> via dup_task_struct() (e.g., enabling shadow stack and pointing to the
> parent's live shadow stack base). When such a worker exits, mm_release()
> invokes shstk_release(), which incorrectly executes vm_munmap() on the
> parent's active user shadow stack. This triggers a fatal SIGSEGV
> (SEGV_MAPERR followed by SI_KERNEL) in the parent process during its next
> function return check (sspopchk).
> 
> Fix this by explicitly clearing the inherited shadow stack bookkeeping
> (setting base and active state to 0) in the user worker branch of
> copy_thread().

+ Ivan,

I think Ivan has fixed this issue in
https://lore.kernel.org/linux-riscv/20261028154315.1272705-3-ivanrwcm25@gmail.com/

Besides the issue, he also fixed another bug in riscv. The only
difference is whether set_active_shstk(p, 0) is needed or not.

And in the same series, a selftest is also added. So IMHO, we'd better
take Ivan's version.
Just FYI, arm64 has merged the fixes into linux-7.4-rc3

> 
> Fixes: 61a0200211d3 ("riscv: Implement arch-agnostic shadow stack prctls")
> 
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/process.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1ca..4bc95acc5462 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -261,6 +261,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		p->thread.s[0] = (unsigned long)args->fn;
>  		p->thread.s[1] = (unsigned long)args->fn_arg;
>  		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
> +
> +		/*
> +		 * User workers (io_uring io-wq/SQPOLL, vhost) share the parent's mm
> +		 * but never return to userspace. Don't inherit the parent's shadow
> +		 * stack bookkeeping, otherwise shstk_release() on their exit would
> +		 * vm_munmap() the parent's live shadow stack.
> +		 */
> +		set_shstk_base(p, 0, 0);
> +		set_active_shstk(p, 0);
>  	} else {
>  		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
>  		ssp = shstk_alloc_thread_stack(p, args);
> -- 
> 2.43.7
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

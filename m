Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D88386C22
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327080; cv=none; b=rKsgPcJNEzfQujaxboCT0ig2VK1MzFAlVfQAr/WL7iGQCLQ7iR0sjGTxBswKtfatn2Y/p7kGV8NgZ4xEuPhNYzTs6dBwRXe5yC7UrYLQItzHpyQffBU9Jy0piGbH4eF9+YmCndW7dQppAxFv53dABo6y4UcXNd54FhsPFvoFOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327080; c=relaxed/simple;
	bh=ekx1+NV9GI3or4eXTMUKCjnVSsla3o1yRSvAHPb66Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKwDKG3uK4+kx7ryf2vC2z2LE7SkPnXpcATfu8EAkDZMYDWFsX50WDtE4Fdy2w25UhSDEkSI+Yf7Xbq8e5B3G++uhIXsU0kMmbLTQ3N1ZFXnKqxyXHIYBrGe9b/MCUsTMllfcLV0v1WzNgP1PNoV1lRc/6JIGQO6JNj5ITTjhdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYnQZoal; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYnQZoal"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so720907a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788327079; x=1788931879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kU6RxwKiDhyQdRcFqAcmJYzkzhMZmlQGVOgZ8yrarwI=;
        b=KYnQZoalEkIQu8aznQ9sxFgNtWhZm5Dh8R5wGese+TMMx2YeuGV/HF8uA51xXRCBk8
         GpPJiXT94FUnZaXhIqIkPkme1LcBPUtl4hPf+ZHbx6tW//60YL9/dD68I4f+C77RFG9q
         eRxZ/slIJCEiQUcmQ/25rWnF9ZBZ6Q3NH9Xq8OoVew4aKQFt1buuoE4c8i9gCWxqggW+
         Jt/5IqymsRkbfJqvcXNejukkwxklRhp5X2ufYZ/7uUzVwZuDMnliNVmd9eIR+m+vffjl
         heTnyzr78T59A/uGN9kVz8xoa43UJk4MWcD35BCuDfB9F78vfGaMa5Yb+kbKN2aCgKR0
         pl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327079; x=1788931879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kU6RxwKiDhyQdRcFqAcmJYzkzhMZmlQGVOgZ8yrarwI=;
        b=Z03u6LuAhDDnQadtyjVXiXySwv6w8zplrwCkg1HG1WZ2kZkFAPs4n42fAPv1r0ENQP
         +gOzVQ3Cc8uZaIKp6yyCws3J0kupWRR2gD3Ngv/rCxW5FFdV0t7rdlgomDtjKmcpZ7mm
         CjpANYVXSvYN2iXSQS5aBPk22ozHdvJ6xUFrqbRM/Gb3jh+LyyKa678efXnblkFJgMNx
         sCYIk750SF8rSfjS0WQiHAy6jMNHzkrwGLIE/VsE7k2JL38ReUPfA107PxtYrgeQWs2N
         dH9ZDe2Lq1M7L/JMTbR5nYmQr6bXmDxeDRygsMwUQgprcadt1Xno3IbuQ8JK5xBruXD+
         VeLg==
X-Forwarded-Encrypted: i=1; AKwUvBwEwl1GhezeYF+ByfKfXh2IiVkTWHpl0aKedYL9usZ76CoTpDcESgGF36HMNwffsri8upVJLIawkiriwjg=@vger.kernel.org
X-Gm-Message-State: AFuF++nIBfq2Sd2vVGOjsO+NnpeOMPNww9ScZ//lD7plF8Fp3kw2KZqM
	lr/tFMVd7X34iowl2ja0py6Pu5Dx+KJyTuBH7hjXSpDwyF6HjsnfvEBf
X-Gm-Gg: AYBFou2htt4i61mcqudNCqVQg4P62if247oqtj1w3e3/Q1dX4Ad5akZrQ1yUkr8sInz
	y+H0kiwWJZxQrQZjS/SrHy0XgIS2ZQvvWpxQHnHQiRN14i+Zgh/r8l+AMPliuSLfIBj+kBa8L6P
	8eriDNXf73Xk2aN0Al3xPGP9/h1xd1m9Ayu4Pl8gieEc+c/+lERpoHj4jtsZc6u5g0jEiQCEOOu
	CXnfGCtlgZOVK52qcaXsalTz9q6fC+5CJCW1JR1ITgp1bo0THnXREChWSpecPrdXfGL7YYfkNlK
	K21lhJfuy2ZfXwDZpuxVm6BQkKPIK640k+4uGKd+IO9ZGJ/Zpkqs53G88d5uVio0mOdouN/dR2P
	uiVUDC8+J7FVJIAuTd9N54jReKnTm2oeedUO2FFd00NRZ3ncTByydjU6ksZdIM5VIevjKG4gBfR
	iiqIBC231LcnYhRh8UHZBMOpGBaXsDXxFbcvtvnUUxZ8vbnfIzk19Ivvo19si9IDnnoPs86tgaQ
	No0aEWt10SWewrWsUc4LR3nCfd/apEuYw==
X-Received: by 2002:a17:90b:28ce:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39af6486187mr819028a91.19.1788327078632;
        Tue, 01 Sep 2026 22:31:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([49.43.112.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07beb704sm3120736eec.30.2026.09.01.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:31:18 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:01:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, 
	Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH] powerpc/entry: Fix double accounting of user time on
 interrupt entry
Message-ID: <ape0GY5__P-_DdxF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260902050628.2553909-1-aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902050628.2553909-1-aboorvad@linux.ibm.com>

On Wed, Sep 02, 2026 at 10:36:28AM +0530, Aboorva Devarajan wrote:
> Since the switch to generic entry, an interrupt taken from user mode
> accounts user time twice: once in arch_interrupt_enter_prepare() and
> again in arch_enter_from_user_mode(), which irqentry_enter() invokes
> for the same interrupt:
> 
>   arch_interrupt_enter_prepare()
>       account_cpu_user_entry()
>   irqentry_enter()
>     arch_enter_from_user_mode()
>       account_cpu_user_entry()
> 
> account_cpu_user_entry() accumulates the time spent in user mode
> since the last return to user space, so the second call charges the
> same interval again.
> 
> With CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y this roughly doubles the
> reported user time of any workload that takes interrupts. On a
> pseries LPAR, ps/top show ~200% CPU for a single-threaded CPU-bound
> loop, and time(1) reports user time about twice the elapsed time.
> 
> Remove the accounting from arch_interrupt_enter_prepare() and rely on
> arch_enter_from_user_mode(), which runs for both syscalls and
> interrupts. The duplicate account_stolen_time() call is removed the
> same way.
> 
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> ---
> Verified on a pseries LPAR (CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y),
> 7.3.0-rc1, single-threaded CPU-bound loop:
> 
> Before:
> 
>   $ python3 -c 'while True: pass' &
>   $ sleep 3; ps -p $! -o pid,etime,time,pcpu
>       PID     ELAPSED     TIME %CPU
>      4980       00:03 00:00:06  210
> 
> After:
> 
>   $ python3 -c 'while True: pass' &
>   $ sleep 3; ps -p $! -o pid,etime,time,pcpu
>       PID     ELAPSED     TIME %CPU
>      4951       00:03 00:00:03  105
> 
>  arch/powerpc/include/asm/entry-common.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index c5adb5006361..984294e62568 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -222,8 +222,6 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
>  
>  	if (user_mode(regs)) {
>  		kuap_lock();
> -		account_cpu_user_entry();
> -		account_stolen_time();
Yeah, that's dual accounting the time.

Thanks for the fix.
>  	} else {
>  		kuap_save_and_lock(regs);
>  		/*
> @@ -426,6 +424,10 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>  #endif
>  	kuap_assert_locked();
>  	booke_restore_dbcr0();
> +	/*
> +	 * User and stolen time is accounted here for every entry from
> +	 * user mode. The interrupt prepare hooks must not account again.
> +	 */
I think this comment is very specific to the current problem. We already
have a commit history to explain this, I guess we can remove this
comment.

With that,

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Thanks,
Mukesh
>  	account_cpu_user_entry();
>  	account_stolen_time();
>  
> 
> base-commit: fb442a6673ff1046bf67754957d95880fdb394b5
> -- 
> 2.54.0
> 

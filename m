Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56621255A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151159; cv=none; b=hyr3JScrtrsPjljcDqeDs9BIiZerSTYPU3lpvhEUyH9rkIHnO/M94q1qr2y07FxACSsEV2H09BnqVBfDWo9kjeRsX6jT3Tdbz3mdW5VFOFZv+6k2WlbvhRcKiG7JmO6su8u8K9Tl0yayLIJB5hOgwhlKbI+H6WGCotteR/2hcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151159; c=relaxed/simple;
	bh=dXHJp2VXoQE+AtA8CPfTHZ2CnibDLPy+e8HCnzQfiSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN4Z7+srOMT04Y7U7mwKJChO6wNNJCY93abJ9jleeeqj/LPPZqYmZx6goF+40wif2rBa22wrZ/OxpuN2sxxcU0NX95tfXs21EXgVGLqLcaejkYKHnGhMEFtw/hsHPRVgUTjR5jVEqet4xKqDWK3+dvJzAs6t6leYob8YTLHbwd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwrVk7mC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwrVk7mC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3426600a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151158; x=1788755958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/oA8S1L4pWxs3ISigp4Fn5q6oJEvgV8RtCJCWRw4Ns=;
        b=DwrVk7mCfDIc2+7B7nFwnFD0c5gyrtkEXT+0JQLpqBxaE1i22JfeKY4acQSca/CKTx
         S5zV9drIqIn3pNSsPDqeqc1qWxbuj5EEkM0ENonovkUREZ6IrHIq3fBk32z0SFdlaSVc
         cg90pnrToflkIqOIGYaoOw3N8nn07IdHmmz0MeRD/VbFkRUr43xRwQpy+JGjSqyhp3mq
         mrt2BvQewkeaLkQf/1sQAOHg6VfiVVsUvexIhXFgEuSFo46xvPIo0pee8gCKhv6pH97B
         9kpexcfHgRHI+dPGG7+cxsxaU5YcnBj0Hz2uoR9hdkz7D0//SOTLsROp3j2GP7TxET4M
         tM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151158; x=1788755958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/oA8S1L4pWxs3ISigp4Fn5q6oJEvgV8RtCJCWRw4Ns=;
        b=jbnvZALtG+iHfWTNi3OZaO5IvrT7cXf0OAPlAESrArQNKubXghyNAXSp0H1FkGcR28
         ks+e6Qx00xqEdNPCUxp0rwEPzQvNZJQibOtIhoZFP8yZpXqeT4JtNi/0FSGZKHFrKR8M
         H9SwnTGZcpKd5HIxC6uTkk6GGidnrcq256pwHu9ivRwkMuf2NdtE4WpQE0C0xHGHdoFu
         8ZbMbNuT73QcpbtHO9RGaW7TfgSC1j/pRP0mJbvsGDjL8cO+FtI4kQlmWG99qBQO9sjv
         KHWQ8BJm4T1GIYPHAydaE8Q/hPAkKewRt/J0QBugYjuBi2JFS+vCXUfljsZxoewCl1us
         cMmw==
X-Forwarded-Encrypted: i=1; AKwUvBz/7K2m0+l+oJdqcAE0upwpFrpY6JK+k+fPxV9HyPENc7RCZyEOav2JrAaVM7jby/bz8/Z3ih9gZ8aUsEA=@vger.kernel.org
X-Gm-Message-State: AFuF++nmbk2/758G8X9/v+PzUagG85KOBzPavQXx3R3N82fopSg07s+k
	3nROAVhkWZDSXW8wq0SZx18ziOkjhKiXMZgmBn6kXRf2oAfCij/IXvZZ+6oC2w==
X-Gm-Gg: AYBFou3V1sBMkNwlD2/ekGIFYPGijOV9mXgmHRFLu1IohBoo+AqZPrxLWFYb+LVp/P+
	vAl68FbvwunMq0qtaiQjIAaCguqMcKjxj9vIxQ10hQcQdcIY4NenFK1jqZ46KwpzK9HjoyoadS6
	0DjyLCRdCukgoQO9UBOLbunekcG52FabgpNdn2rqf4t3SkE1TLsDXgrMHrUpKotkFJlOxt8YN5t
	VbpkRgs5UXov6s2XjiTzu5PSZFSB7fvwmxf7mScrPLRfZbaYFulrF507hKaM91C/5iLURmTdlLL
	3XHTUFGJR4QPwiCgwt8r5q4fqRJKdANEQjLl1FPH9vlVX5+IrY7Zt1xuZ9UoXDiOMIHuAClzGyD
	0mQq59oh0TeIwGMK3RcTtIsh8qs5HXRB4YMLSUKAN5LKF1oVtsBolDZvybTOhUgZLZ9wLX1ayEL
	SsZEux2HDKSabrdwr061I+xDSWDBItB2RxFNJy4x266IzCl6xMcZ2WxCL6PRKtjcSZeREK7VVF/
	EBQrvkPoW3IgS7WMJSLxsa00NPhswZs1w==
X-Received: by 2002:a17:90b:28c8:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-398f846047amr1327503a91.14.1788151157676;
        Sun, 30 Aug 2026 21:39:17 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([49.43.112.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19298269a91.8.2026.08.30.21.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:39:17 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:09:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: tglx@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/entry: Clear TIF_SYSCALL_RET before syscall
 error return
Message-ID: <apUBdKP1ytHSvuQd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260828053811.1042300-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828053811.1042300-1-sshegde@linux.ibm.com>

On Fri, Aug 28, 2026 at 11:08:11AM +0530, Shrikanth Hegde wrote:
> Shivaprasad reported a boot failure due to userspace processes crash on
> abort() from libc.so.6. It was bisected to merge request
> commit '3424d8c18a7d ("Merge tag  'core-entry-2026-08-17' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")'
> 
> Upon checking the merge, when syscall_enter_from_user_mode_randomize_stack
> fails, which could happen when a tracer like seccomp or ptrace intercepts
> and skips the syscall, the code returns to userspace immediately without
> clearing the intermediate flag which was set.
> 
> When the next syscall is made, it immediately aborts the valid syscall
> since the flag is still set. Hence clear the flag on occurrence of first
> failure.
> 
> Reported-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> Closes: https://lore.kernel.org/all/e301014d-568f-4ed5-bc64-b8a85ca0b1e1@linux.ibm.com/
> Fixes: 3424d8c18a7d ("Merge tag 'core-entry-2026-08-17' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> PS: I have kept the block below since earlier code was checking it
> regardless of result of syscall_enter_from_user_mode. If it turns out
> to be a redundant, it can be removed later.
> 
I think it is redundant as of now. The TIF_SYSCALL_RET flag is set when
error is set by the ptrace or seccomp, If the error value is set then
the syscall_enter_from_user_mode_randomize_stack will return false.
Hence the next check will become redundant. 

I also see that TIF_SYSCALL_RET is also set when processing the ptrace
syscall, Which can leave the flag set for next syscall execution. Which
can again trigger the same issue.

Regards,
Mukesh
>  arch/powerpc/kernel/syscall.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index 4916c205c4bb..fbefe1927b10 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,8 +18,10 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>  	long ret;
>  	syscall_fn f;
>  
> -	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0)))
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))) {
> +		clear_thread_flag(TIF_SYSCALL_RET);
>  		return syscall_get_error(current, regs);
> +	}
>  
>  	if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
>  		return syscall_get_error(current, regs);
> -- 
> 2.47.3
> 

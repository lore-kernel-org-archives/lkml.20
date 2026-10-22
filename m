Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707545;
	b=vPn6eeVPvx5fpIvJYKn0JSssii/rayFYwB1Gq5Pe1P1+008GH4bWIZEu3ncUJdL/TuIg
	 jQk8IyEGru75O45wMHURye4qgxy+2x+iiaXfv6cxgsQNgHBkNIrwJRelBL5vg8ZMCyoCZ
	 FCEfOy6/GeeWl6iMFR7UIJKFM+lVdVuIucUUHEyL6ZneTi2QtYLTMwKBoyInJ9/WfsPju
	 TqJW+37+FPXBwFA4hlHytXgoRM4wXe+dgx82woW/p6HResCY0TJ1Uy48lLBWmxqLih2GO
	 r8XJT3KdDiYwxYm1GGr5iDYhMOne+CuFyKIM5JKKJ4KnV4DlVB+d2k5OEP5UyeNOeKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U+fNGXuTxSBSDzV/8UaJRSMWMc2y739xNcnwuXMGhOM=;
	b=JI50hGZSc/tuFgQrQGzQVOzNhZpPyOHOhw9NZqYQDOrYFIxeEsRKNqJjmXaQMlC5jN5z
	 hHBXqRtQWrP9d0IdW65wacNzbPWE2azDIhni1cVmraLNPsfAsUU0lndPn/5NPUCwf6l2o
	 Y95k5l3x5Hznz8NFLcRbu8fFpgWgIZbgy7j05GtXjnJfsfvlk8kxSeH3ovgDw8kK3W5c4
	 aRmcF+V6MnD64jk7gCjWZUWqhyeLnKEEuju9yvnOWZ36aTXHkF16RFQ7aZQRPupTeEvF0
	 gtJKAk5GxrQ/VhykX26yfXyOBUdb7/LRyM0nLoZn2X0dtbreTKm0w6I6tiEfMgNcTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=UVXW82Um;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95730606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95730606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=UVXW82Um
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-7037daaa820so113339eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792707543; x=1793312343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+fNGXuTxSBSDzV/8UaJRSMWMc2y739xNcnwuXMGhOM=;
        b=UVXW82UmJEyPVGoE1zADd2PlLrWf2Q55H0DbUqCX+Rh2spjP8ewRwWzKPEyUjIQSga
         xJo2mvNGbLYJyaBFei59ls/n7MIrpcTy7kTLQD//L3zaWnVNbIl5TNsFW4XeqMKmydVw
         s7ByfXc6ixdSyAyg/98J6zjI/FfDxKQllk4H4ennofDE6CDoOnUbh9gI2wco4eMqqi1x
         /nrSrsPyt6t2DC7cYf5E9ajT6Cyu8r8bmDEEZ7hgo/Erdu+O1qySJZ6xCeGgqahs8fyg
         0bqcvwMOBrOVboCrbhQytVOga8EkCZyDzocKHTP/2/TtPcKN6gYT2iJJzkokWEOIeHwy
         PgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707543; x=1793312343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+fNGXuTxSBSDzV/8UaJRSMWMc2y739xNcnwuXMGhOM=;
        b=D21VwJaINIWSDC2QxLZEuzN5C8PWvF/XkaQVxcpU9qOoNZbOk/bf94RGdxpaUMg1GH
         QiFl4vSxfQQg8xV2VrDGYFnsKlN7KBEbOWCrWz70FmprvhXWlcZGspF2MGZngt4F5EhW
         r4i+3mtZdg2bHvGCvHeBJQGE3cvHXCq129efGSKQxsBaKa5Q5eV/Z+YTOKilKmbqoQvs
         8qL/0j5niZC9w1lwf6NG3KUuygUM79CXAbKb1uK/o4MQ/dHGF2iPJFxOA/n/EAKnyPAO
         VE8IUSFbZSkktNNsQcJhlRZTk/2irrjhVogKAJuxdUz4qiyFnHGRCQACTP5aFCRtN44M
         AjUg==
X-Forwarded-Encrypted: i=1; AKwUvBymIPdTukrBhx5TAHpCB+9G9Cg3HAJ5Llx/ikbJk9ljzlLxtxGtEcJoa2Mdi3YVLKJuaGm714S1N7C/pUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4oIRgfIrbf3Ljs2A7sI4zpeCgoLeIX6L+KTiArMw6nRrPw09r
	ENV1f8eJ/xWyPXvYkEk++NWqIuroTA6D4NRP3WN2aTfSGb60zRpaM6tHPo8H6PAtL6s=
X-Gm-Gg: AYBFou3+WG1z51tnl2O2EIHCfaQ7op5Eyzj12PSbBjM2lhvp0UNSUIkunT+B4CvP5wU
	Ye8+IQEw5pvtliqG/6sweLvh7WB2aJsMkQ+nM4Uk1si8R0sH7Lkk5w5lxmT1zwdlPbsnYgR2Fkg
	SuVQc/QqIz/cOy1YZ0iGzc1SWp4Gm8n2Sab+cdFE/SuAKvxcWyp/jRs3RAgzjL7ajW8pzJJ883x
	I5YXGAeutaqP2CXaOpX5/zLx8+NrhzQSR8Iq46XCKuLYhEs/g2n2LegNzrTF+ZTEjnqRhdaq0KA
	IS5sJsYc71kcCFFnVX0HUs1gPzHs2FpbDg5Tz8H71s8q7g3lFRpI1LuKNCl13UZGTeGOMi3sPQj
	wyU8Uz7O+e/U9pkECdy99gNQLYQq7kXv0KCZSX65v4p36D/1jQJBkXjMFBnvvuJ87uo8+4kFaqk
	aKE+b75wCXJHanC8ZlqgFTEgmsT8ycfmJgxL/9TvDCon/5zMXnAFgllsgmZaRpQwDZnkDOKWLut
	1j9g35ncILi3bXFnTC0g/djj7RUAU1QcGjTRpHiIbsoXgHgRf0Qmcvr2EzaykpcY78=
X-Received: by 2002:a05:6820:221a:b0:6f5:eeee:b22 with SMTP id 006d021491bc7-70b88a52a06mr594387eaf.49.1792707543577;
        Thu, 22 Oct 2026 15:19:03 -0700 (PDT)
Received: from localhost ([68.203.12.10])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a82021ea20sm312316fac.0.2026.10.22.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:19:03 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:19:01 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, zong.li@sifive.com, wangruikang@iscas.ac.cn,
	debug@rivosinc.com, qirui.001@bytedance.com, guoziyi114@gmail.com,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
Message-ID: <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>

Hi Yunhui,

On Thu, Oct 22, 2026 at 04:32:12PM +0800, Yunhui Cui wrote:
> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
> set in sstatus.
> 
> This lets next run with user memory access enabled even though its saved
> SR_SUM state is clear.
> 
> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> live CSR before restoring the saved SR_SUM state of next. This keeps
> prev's SR_SUM state intact, while preventing it from leaking to next.

Do you have a way to trigger this bug on existing code or is it the cae
where the bug could happen but we never experienced it in real life?

If I understand correctly, this can only happen when the user access
routing volutarily makes a schedule() call mid-flight, or a code fogets
to turn off SR_SUM right after an user access and has a live SR_SUM when
calling schedule some time after. Both case should be a bug as SR_SUM
shouldn't live in the kernel code that is not doing user access.

A trap-introduced context switch would interrupt a code that have SR_SUM
set. However, since the bit is cleared at every exception entry, the
context switch code would not see a live SR_SUM. Seeing the bit set in
this case means something is not turning SR_SUM off properly.

I aggree that this is the better way to handle SR_SUM in a context switch
but attaching a call trace or stating that "We have not caught this in
real world due to ..." in the commit message would be appreciated.

Cheers,
Andy

> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 61b7a77166971..628b85e3915a7 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
>  	REG_S s10, TASK_THREAD_S10_RA(a3)
>  	REG_S s11, TASK_THREAD_S11_RA(a3)
>  
> -	/* save the user space access flag */
> -	csrr  s0, CSR_STATUS
> +	/* Save and clear the user space access flag. */
> +	li    s1, SR_SUM
> +	csrrc s0, CSR_STATUS, s1
>  	REG_S s0, TASK_THREAD_SUM_RA(a3)
>  
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
>  	/* Restore context from next->thread */
>  	REG_L s0,  TASK_THREAD_SUM_RA(a4)
> -	li    s1,  SR_SUM
>  	and   s0,  s0, s1
>  	csrs  CSR_STATUS, s0
>  	REG_L ra,  TASK_THREAD_RA_RA(a4)
> -- 
> 2.39.5
> 

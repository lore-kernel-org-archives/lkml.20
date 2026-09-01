Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2299043B4BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278691; cv=none; b=Q5F7i+FiDy1CoRbjK4jLl+1cIOvCJ0zq3yZ6OV8VBoLVkWfcduQYHNBzfG1FC61YFfPcZau5qgEF/gLmVqyy+1CLw4RKgGSBDgXQ1IeHQ7oHnvtlAqT2QFGbamowZyRwuesWnmwQgbI0a2ZUtsGBa7CPSUyK/NPWrAu7urbM4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278691; c=relaxed/simple;
	bh=V7V4Z0XgmjsuqvE2KaM+pbGjdr/a1+AAjTI+Z66WgUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0ubP2XyBnFSGxVFt4wAaHNHYdrezukAYrWdIv33Oc0Lu2Wuw+KY9vzxsLPYjqr1TTHT/6/phQHOGGYzhLL2MCoqs2ILRcc9y72tl+PrZZ20+jPLSumq0XY2jMPWkz3DR3qG+3weA+3gn1Q4zcPVkzwV9+CHjnO0R63dTiBfzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ShMS54iM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ShMS54iM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929271756;
	Tue,  1 Sep 2026 09:04:45 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717CA3F85F;
	Tue,  1 Sep 2026 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788278689; bh=V7V4Z0XgmjsuqvE2KaM+pbGjdr/a1+AAjTI+Z66WgUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShMS54iM5M18ZHyNF1VoQWoLveiZeYU5AUcg1COKoa0ykCqnWM5YhkCm8LTOHMw3Y
	 /6AZOMP9Ez7x6BYcLGQZW/IopdG+XQz0AafCysUqFpT8InyKdbEIb9isAvu/cQXBKX
	 8emlw21brJefBooBx1j35fC20R0yzQ48NdiWRvIc=
Date: Tue, 1 Sep 2026 17:04:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, frederic@kernel.org, jstultz@google.com,
	juri.lelli@redhat.com, meted@linux.ibm.com, mingo@redhat.com,
	peterz@infradead.org, sshegde@linux.ibm.com, tglx@linutronix.de,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH v2 0/6] sched: dynamic: Simplify PREEMPT_DYNAMIC
Message-ID: <apb3naadvUkEJxGM@J2N7QTR9R3.cambridge.arm.com>
References: <20260803191731.3244294-1-mark.rutland@arm.com>
 <3f3191c6-d41f-4c4c-82df-7ed2cb8cbd84@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f3191c6-d41f-4c4c-82df-7ed2cb8cbd84@huawei.com>

On Fri, Aug 07, 2026 at 11:33:05AM +0800, Jinjie Ruan wrote:
> 
> 
> 在 2026/8/4 3:17, Mark Rutland 写道:
> > All architectures which currently suppoort PREEMPT_DYNAMIC select
> > ARCH_HAS_PREEMPT_LAZY.  On architectures which select
> > ARCH_HAS_PREEMPT_LAZY, it has not been possible to select the NONE and
> > VOLUNTARY preemption models since v7.0 due to commit:
> > 
> >   7dadeaa6e851 ("sched: Further restrict the preemption modes")
> > 
> > Hence in practice PREEMPT_DYNAMIC no longer supports the NONE or
> > VOLUNTARY preemption models.
> > 
> > This series makes the de-facto situation official by making
> > PREEMPT_DYNAMIC depend on ARCH_HAS_PREEMPT_LAZY, and removing redundant
> > code.
> > 
> > Since v1, I've had to rebase atop v7.2-rc4 to avoid a conflict with
> > commit:
> > 
> >   a2c02aa0c6ca ("powerpc: Remove dead non-preemption code")
> > 
> > Given this is now late in the cycle, and given the tip:sched/core branch
> > is based on v7.2-rc1, I suspect tip folk might not want to queue this
> > now. Please let me know what you'd prefer; I'm happy to rebase and
> > resend after v7.3-rc1.
> > 
> > Since v1:
> > * Rebase to v7.2-rc4
> > * Apply Revied-by tags.
> > * Fix typos in commit messages.
> > * Add patch to cleanup accessors (per Shrikanth's comment)
> 
> Hi Mark,
> 
> I did a test on v7.2-rc6 for arm64.
> 
> # ls -la Image_base  Image_patch
> -rw-r--r-- 1 root root 63158784 Aug  7 10:37 Image_base
> -rw-r--r-- 1 root root 63093248 Aug  7 10:31 Image_patch
> # ls -la vmlinux_base vmlinux_patch
> -rwxr-xr-x 1 root root 206396648 Aug  7 10:37 vmlinux_base
> -rwxr-xr-x 1 root root 206266232 Aug  7 10:31 vmlinux_patch
> 
> So the overall vmlinux file size reduced by ~127 KB and the Image
> size reduced by ~64 KB.
> 
> Boot tested successfully with preempt=lazy and preempt=full on Qemu and
> Kunpeng HIP09 server.
> 
> Boot with preempt=none and preempt=voluntary on Qemu.
> 
>     Dynamic Preempt: unsupported mode: none
>     Dynamic Preempt: unsupported mode: voluntary
> 
> But runtime switching via /sys/kernel/debug/sched/preempt works not
> right as below.
> 
> # echo full > preempt
> # cat preempt
> full lazy
> # echo lazy > preempt
> # cat preempt
> full lazy
> 
> We should also update the "preempt_modes" array, after the below fix, it
> shows ok;
> 
> # echo lazy > preempt
> [   37.407616] Dynamic Preempt: lazy
> # cat preempt
> full (lazy)
> # echo full > preempt
> [   52.067001] Dynamic Preempt: full
> # cat preempt
> (full) lazy
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7899,7 +7899,7 @@ static inline void preempt_dynamic_init(void) { }
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
> 
>  const char *preempt_modes[] = {
> -       "none", "voluntary", "full", "lazy", NULL,
> +       "full", "lazy", NULL,
>  };

Ugh, yes.

We'll also need to fix up sched_dynamic_show(), since it has logic to
conditionally skip "none" and "voluntary".

This is all a bit messy, given the enum value isn't used to define the
string array. I'll see if I can figure a way to make that consistent by
construction, but that probably needs a bit more rework...

> Otherwise
> Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks!

Mark.

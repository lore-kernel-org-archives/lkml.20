Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F19D3EEACB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278630; cv=none; b=nY89t8B+RjNOqxGehp9anyW9mHAJSJZvFxw1TcRWlxlH2xmvP57Al13q5vlGPW/+gYpPAFUdPN3A/Ei61mxOyId69VnxSVgtx5LM/AMBkvkaiZQKQrQEL/3SwB88A0GWf35+Viasqyiv6twMpRb8Whk6Upi8V4qdcbHrMyB+5Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278630; c=relaxed/simple;
	bh=e7KqR0cXv3zi2ctFk7HYcHk4godYoNTXTC7ZdWo8Jww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7b8xzeW1NoWexo539LJ+pQaPYsyh3QE7vutvshKSuJsZmpo3ibiYx95fKlHO6huZIBr7iAizfMFyFJFPvndk8G+AHnZKibSHY9Lo5GXgxt9kc+c2VPMAR/j0xsLrqnVyusZqa72pPpZLl3lqv8/zBGu1fPI+j2WqCalmV190CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rh7UB1se; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rh7UB1se"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203C21756;
	Tue,  1 Sep 2026 09:03:43 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B2E3F85F;
	Tue,  1 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788278626; bh=e7KqR0cXv3zi2ctFk7HYcHk4godYoNTXTC7ZdWo8Jww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rh7UB1se5I5Lg2542CkkOBB8wD97b8a9XqZOM1LIjABTpODaZCqiGEeOgA3k7IBgR
	 4oJ6rWybfTn94MUVgjPL7NYeiG9en7Gpyyl47FhoH/NzaCwMIYiXSjtJFWqwT4ldUo
	 NZgUN+JTiqxRPX2Oj78THPSM2r1L0INVPYkSljyQ=
Date: Tue, 1 Sep 2026 17:03:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, frederic@kernel.org, jstultz@google.com,
	juri.lelli@redhat.com, meted@linux.ibm.com, mingo@redhat.com,
	peterz@infradead.org, sshegde@linux.ibm.com, tglx@linutronix.de,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH v2 6/6] sched: dynamic: Simplify preempt model accessors
Message-ID: <apb3XyPKQVTVJqQx@J2N7QTR9R3.cambridge.arm.com>
References: <20260803191731.3244294-1-mark.rutland@arm.com>
 <20260803191731.3244294-7-mark.rutland@arm.com>
 <ab5ebc63-0361-4aef-aba6-f567655279f4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab5ebc63-0361-4aef-aba6-f567655279f4@huawei.com>

On Fri, Aug 07, 2026 at 10:00:44AM +0800, Jinjie Ruan wrote:
> 在 2026/8/4 3:17, Mark Rutland 写道:
> >  enum {
> >  	preempt_dynamic_undefined = -1,
> > -	preempt_dynamic_none,
> > -	preempt_dynamic_voluntary,
> >  	preempt_dynamic_full,
> >  	preempt_dynamic_lazy,
> 
> Hi Mark,
> 
> Should the annotations for NONE and VOLUNTARY be removed simultaneously?
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7788,12 +7788,6 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
>  # endif
> 
>  /*
> - * NONE:
> - *   (unselectable)
> - *
> - * VOLUNTARY:
> - *   (unselectable)
> - *
>   * FULL:
>   *   dynamic_preempt_lazy       <- false
>   *

I had left those lines to indicate that those modes were deliberately not
selectable with preempt_dynamic. Evidently keeping them was confusing,
so I'll delete them.

> Otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks!

Mark.

> >  };
> > @@ -7889,8 +7887,6 @@ static void __init preempt_dynamic_init(void)
> >  	}								\
> >  	EXPORT_SYMBOL_GPL(preempt_model_##mode)
> >  
> > -PREEMPT_MODEL_ACCESSOR(none);
> > -PREEMPT_MODEL_ACCESSOR(voluntary);
> >  PREEMPT_MODEL_ACCESSOR(full);
> >  PREEMPT_MODEL_ACCESSOR(lazy);
> >  
> 

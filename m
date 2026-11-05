Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869436;
	b=MkRnb1o3Q3LxQ5yqPXexvBqjvHYQN2eo0a8r5SWbpo/cDT3FOKU1bhUEiynLKZlN9GCU
	 pEdQT/eouCRccb+ubvxlT2ypa1QKCNW4jOlwZ8dMEAtb4o8vKee4f4FxKrSg/B/UMrGlx
	 mTCv9wF5yNcOyGWg028TulUz65E4X3pHZIRmIgBLUSwvvH8INNHFEEUwer/MMCGoAzRAH
	 lj0d1tHRMFZ/KdavouPvA3V9WRfx/L9oKSSMWCVvVmL4gbYgJyzwlrWtueyGpnLcOMbMY
	 V18VnwjvQxgRw26EvgxgJpMcYXOR0FjoGG1SDYG9ahueLCstHk+EKgueRrPOsuRr0rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869436;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=L0FBc/nu89y4Xm6JuoFrkqKFD6mo2DuPJAFzDmDjfsc=;
	b=aQ5mC6FDfCnjehO483myR0gQsbJaFxLtkWM79fUED0PXOxLb++Fd3BpdWVM2SaHLhSl7
	 ZGhJGV80LtfDBkM2yOq0fgNkcweQTMdzeOvwBAO9fwTn+d89JQXQqqEKJxzgGdJ1IFUi7
	 pkU2hiwNh+VI+mORIz54DtflLIUP0fiAbr5BM4VOGA22hqjukVWIT8QPkZZNlqABJ6RNQ
	 QxX+Vg751iGMBM/0FkS9d7Qfxfwz4wHydljUdO8eD559jC306iOtq7Bb9PT6RxFzvqj7v
	 P4vnEg7R3NuweK4yxX1c9fvCbWmyYMFUtVsnSeISiryu2lgv+OhX1mJLT2HSYcu8WtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MNwkgc3X;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C5606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215C5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MNwkgc3X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L0FBc/nu89y4Xm6JuoFrkqKFD6mo2DuPJAFzDmDjfsc=; b=MNwkgc3XxKJpOGtGRh2U0DthqQ
	0WXQ9NMWGdybuw/Z/wIoUFl44PyYtOdJPGBEOHtry5wGCryOknsVtDfhlf40y7HyeO1HbfO/yd134
	yysLrodjktHG92k7su2gdMHc4eVZbU8uiGL6rI8B82kshlyXzpVLNOj9sJGk5uKADxEl4YoXzunCe
	rPYfEJpocFvAT3pYHHbt4ilhAewN9nCPNIvrCl+mvIfcK7MtWG2kFk0vb6nbrQhBLdmSCJyisPtmY
	d35tJX3OXC0c+8OQSdV+zVaOPgV10hhq3ZErjJi+FldBae1+Pk+Y9IQN+rZinJLrtR4c8CnnneYvO
	LGQSM+vg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtNn-00000006Vlv-1lKC;
	Thu, 05 Nov 2026 09:03:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F3B133002F0; Thu, 05 Nov 2026 10:03:42 +0100 (CET)
Date: Thu, 5 Nov 2026 10:03:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] wait: Make ___wait_is_interruptible() return 0 or 1
Message-ID: <20261105090342.GS2668804@noisy.programming.kicks-ass.net>
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
 <20261104160722.1637541-3-vineet.gupta@linux.dev>
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
In-Reply-To: <20261104160722.1637541-3-vineet.gupta@linux.dev>

On Wed, Nov 04, 2026 at 08:07:19AM -0800, Vineet Gupta wrote:
> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
> of && or || folds to a constant other than 0 or 1. With a constant state
> such as TASK_KILLABLE, ___wait_is_interruptible() breaks the build with
> CONFIG_WERROR=y:
> 
>   include/linux/wait.h:285:39: error: use of logical '||' with constant operand '256' [-Werror=constant-logical-operand]
> 
> clang has the same warning, but it does not check an operator that comes
> from a macro expansion.
> 
> Compare the masked state against 0. All callers test the result as a
> truth value, so the behaviour does not change.
> 
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
>  include/linux/wait.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index c2af98b0074d..ebabdfb5b30c 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -283,7 +283,7 @@ static inline void wake_up_pollfree(struct wait_queue_head *wq_head)
>  
>  #define ___wait_is_interruptible(state)						\
>  	(!__builtin_constant_p(state) ||					\
> -	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
> +	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)) != 0)
>  
>  extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);

What is the actual purpose of this warning? This doesn't seem to serve
any value. Any non-zero value is a true, why is this a problem?

GCC doing this, don't mean we can't turn if off again.

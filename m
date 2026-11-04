Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811105;
	b=0+KTzTbGAtJN3un1xXFQqEVNz2b0aVAWFwjz8j7sMZ6GwDdWYlC+V1ACEzmhxbGhbENu
	 56EaWdhe4EI9QWD2YLclsHIT1wxZNLjzfAvMAOSxu12tNaEwKZZvj3bTfXkcWe6TX2fzm
	 jrDIpfqj7HUdp99sU45SWBYqEMTRk3dyAJyIqS+148GoOgNP0pHxM5drNIC+UjlRQwMVp
	 yJnZkXAPSrZsY36lWDt7LBNGLhQMWlMzYFP+vu4BKUN9w97pNXfzV3HcmcRDP0xHT5bUT
	 qLjO/XNrVKFSseTRDPyhcsdQF69DIs30nAvDMUUYsxc1EkjFf62/S4MHEBF494zv5hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811105;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=O/78z3V2uKfxkMr3m/0nYuByubd+lKz6Ex43q4dvKG4=;
	b=PebK1HMVgk6390faVHSGrC8KlKyFFL/oPJBl9ctEEyEUNrZPUnGxiZBJnvlskXBfxqLX
	 u66eMVVXXs+HXGxcvfi4pRmHRhHCEzH/R1abAsZ3mmRxjukdQDB1JPnjfIARlGDTgOMzn
	 BySXc97C5aiC3arWaB/PQ6ZosP0JFbsEIaKCRmx7hKM4ntkAmBNffoc8u9wDFYKc5d27L
	 bkZ+z9kwQxT8rvALqBwGFIVuGGA+84w/utqOiAwIM/9q5BObXahC7eGphFUo8VHfwetJO
	 x8f6JxQgj6O3vezKYTccfr2zxGjNNl4Gr7VkEh/khhCU52ZF/Bz/pEjMvAA8Q/OC7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UYt6/MHc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338AD606D80F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYt6/MHc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFFD1F00A15;
	Wed,  4 Nov 2026 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811105;
	bh=O/78z3V2uKfxkMr3m/0nYuByubd+lKz6Ex43q4dvKG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UYt6/MHcHZHIvd4O9cyJwHf5SJ55ABxZ49y9pmNCTwFcdmaQohBy3bVr4PZ/yrncD
	 UVemQo3L77xrhqWNvC543xf4l9kWes4/eUUThju+bGg3oqep8nnNK5sjZFNbTGI5kV
	 chRBn7ouEm2YMo2Mxh+TkPx38AD+lfqsDqgxOkzFgy9Dw9875iJASTk7/ltaSyfYc/
	 3B7kJ9dcviu1Ot7jhYkwVX8nvpamlbZrciyXlsxKNvTx3OcsOZHnuY2xNekSx7ctnn
	 3bbBvCrnUZJfjAj8hScLx9sbenhlwDT6aldbUr3u1fH04sXstwEONlZcX3fdErCzo3
	 Rwbdt1wT9oqEw==
Date: Wed, 4 Nov 2026 17:51:42 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: anna-maria@linutronix.de, tglx@kernel.org, mingo@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimer: Refresh softirq deadline after clock changes in
 low-res mode
Message-ID: <autinnoNb1wz3MPk@localhost.localdomain>
References: <20261101172344.426489-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261101172344.426489-1-thnkslprpt@gmail.com>

Le Sun, Nov 01, 2026 at 07:23:44PM +0200, Avi Weiss a écrit :
> In periodic low-resolution mode, hrtimer_run_queues() updates the clock
> base offsets at each tick but does not refresh softirq_expires_next.
> When CLOCK_REALTIME is moved forward, an expired soft hrtimer can
> therefore remain pending until the old monotonic deadline is reached.
> 
> Reevaluate the next expiry when hrtimer_update_base() observes a new
> clock-was-set sequence, before checking whether to raise HRTIMER_SOFTIRQ.
> 
> Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  kernel/time/hrtimer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
> index 17dd38a6cee7..5d1df371e931 100644
> --- a/kernel/time/hrtimer.c
> +++ b/kernel/time/hrtimer.c
> @@ -2289,6 +2289,7 @@ void hrtimer_run_queues(void)
>  	struct hrtimer_cpu_base *cpu_base = this_cpu_ptr(&hrtimer_bases);
>  	unsigned long flags;
>  	ktime_t now;
> +	unsigned int seq;
>  
>  	if (hrtimer_hres_active(cpu_base))
>  		return;
> @@ -2306,7 +2307,10 @@ void hrtimer_run_queues(void)
>  	}
>  
>  	raw_spin_lock_irqsave(&cpu_base->lock, flags);
> +	seq = cpu_base->clock_was_set_seq;
>  	now = hrtimer_update_base(cpu_base);
> +	if (seq != cpu_base->clock_was_set_seq)
> +		hrtimer_update_next_event(cpu_base);

It took some time for me to understand the issue because retrigger_next_event()
takes care of that already.

But if the clock is set and hrtimer_run_queues() happens to run before the base
is locked and update_needs_ipi() is called, the IPI won't happen.

It could be worth adding that to the changelog.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs

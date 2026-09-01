Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610C39A054
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267359; cv=none; b=hrVB7QA3dPC9uTSXEhrYLy7P13Zjt4MzEU9iWViFveWY5bRvxm6r655fkcWM+9A7XHlXJpjkWfZuxSc36JqS6iqFzdB7/aHPyQs+C2yK1j01XN7hZjGwHLcaUPHlvqe+kJAQar1rBUwUFUR2E6/tFWSwh9SBmbj9ZB0jUxxsgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267359; c=relaxed/simple;
	bh=OKHxlhdREFyBkV1l20E5PecozrRreU9W4PPmlH2iLEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmxCb6SXd/ZWG6It5lbOhsNNkAaTosD9OAhT1hIjuH8cLL/DBkl+QUg1xXxXc5IHDd52T8blfiLzuR17G7xDld8fXXmXs6Icz/w79yCyVwHn1ekG8Hsz7b/fu2sq5Jh6vS+8BxoqkuRlEOKzsISWpULDvYgrnjptXVZrVsr22fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ghk22jTn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ghk22jTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5404A1F000E9;
	Tue,  1 Sep 2026 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267357;
	bh=hDb2pRm25JPe9j0pWZLLz4Udh1axll+IWrcs/rbCFv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ghk22jTnnLp7osdkQ3GPUb+G9CjOMjFI/PUDU0aVikYLAw01YCHznpE2XfuDkGeQC
	 5WKTZrk8LUbPkzoJzCzXpeI6yzZ4LuWhMFISMKlnTOWMxzGDGcRGu7QzIwYBq94b4y
	 +vsVO/FQpdKEOHWdjc0kv6BQT1eeBL2vSwVbPnWl5h9VxkHouqC8u1uZHrTIay2fDT
	 2fcxvgc2YnLl4k9R9BD6KFwGQ/Hq6RT15nQ1dVE0TcUoQSGn+hRbP+cbxcmh+kzmXY
	 WtkFjytjHOR+ssRiS0+z+qAYDDzO7I6sEDzK4VcqnVAx2EIHQ/ELuAH0gXgr7fXIx+
	 d5/u0WULdtvvQ==
Date: Tue, 1 Sep 2026 14:55:55 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
Message-ID: <apbLW_Y1CScaZoR7@localhost.localdomain>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829202535.46470-1-s.shtylyov@auroraos.dev>

Hi,

Le Sat, Aug 29, 2026 at 11:25:35PM +0300, Sergey Shtylyov a écrit :
> In skew_tick(), the result of get_option() call is ignored, so even if a
> value of the skew_tick kernel parameter was not specified (or specified
> as a list or range), the kernel won't complain. Add the missing check...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> ---
> The patch is against the timers/nohz branch of the tip.git repo...
> 
>  kernel/time/tick-sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index c1ee0b256445..34ceccdd49b5 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -1483,7 +1483,8 @@ static int sched_skew_tick;
>  
>  static int __init skew_tick(char *str)
>  {
> -	get_option(&str, &sched_skew_tick);
> +	if (get_option(&str, &sched_skew_tick) != 1)
> +		return -EINVAL;
>  
>  	return 0;

I'm not sure that matters. Initcall return values seem to be ignored on boot.
Looks like only modules do care.

Thanks.

>  }
> -- 
> 2.55.0

-- 
Frederic Weisbecker
SUSE Labs

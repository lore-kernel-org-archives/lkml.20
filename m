Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05328218E91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802803; cv=none; b=NuabYR6LVuL9MS5bhEoAgbFrttepbyI0AcBFolTKdyCpTAhXS690xD0C+7xnHgafwHoCYkKeeG97z43VG3P2B7B+tep2PupS6/3Ph2P2Slz/ZvG4ZjPN/Wr/dqjLHIPCBiaOzZ5hlFi7kkyi0SV8wM+D8M61sEMq/7jLGTI3UCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802803; c=relaxed/simple;
	bh=9wu/UeadTBu8soR8gpeiylqvkE8PaAj9u+22Gm2b364=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYrvXKJQxL2rCtasfgAQatbBbFtFVNbobi8Urcqb+h5DanRyFJrhZv+udsuNfPEaOTtV47znpyJiy/U277H9EsOLFMR9s0Qw5ocg+/iHWZK8GUsOQmGZaDP5Pf+M6yzyNRyKZqrbitDGnW7jSpNvNCWzJ+5x3LOVeForZf5lxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T1TmHP7I; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T1TmHP7I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=URu5KIb6dN9BI3Uu+0vZLVMHyFFKiOfyrdqaGq4XALw=; b=T1TmHP7I5XtBmjvphZ8KW07n6V
	kcZYQ34v2sujnAeZujFt8JSUOAaVYXdR+DHa9MubVBK0yn/4stjAcWmTM6Yi52zTVYacWMHlrBK1Z
	6AEtKtaqszS7dlj8gDeBM3/FharCAtM8y0nWiEQUXvOJ0ry4w5nmHgBlFuQuhAGWzrwUM/S1x8gJB
	qcaJlZI28aMrNG8eFTiXTbpcD4RZq3D21oyBnmH4mUgatKryw49KI1+yoNj0nk5LYPNmAt0RH42h4
	2dnUXgOWQONqZo0f+g6YgxZqerusRqjVVkatvzL/jy7UF4tSTA4aEy9sDv8trYyCLrqIOzJi8iDps
	55aHFxqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDl4-00000004SNl-12xZ;
	Mon, 12 Oct 2026 10:59:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C75ED300720; Mon, 12 Oct 2026 12:59:53 +0200 (CEST)
Date: Mon, 12 Oct 2026 12:59:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] sched/fair: avoid redundant updates for unchanged default
 slices
Message-ID: <20261012105953.GR4121339@noisy.programming.kicks-ass.net>
References: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>

On Fri, Oct 09, 2026 at 11:49:40PM +0800, Chengfeng Lin wrote:
> Hi,
> 
> Repeated sched_setparam() calls with unchanged parameters still take the
> parameter-update path for a SCHED_OTHER task using the default slice.
> A small prototype reduced this cost from 618.18 to 163.23 ns per call on
> v7.2, saving about 455 ns (73.6%). I would appreciate feedback on this
> optimization.
> 

> This
> matters after an RT priority-inheritance boost has ended. Existing
> permission and LSM checks remain before the shortcut; explicit uclamp
> updates and reset-on-fork handling are unchanged.

Pff, so much text to filter just to find the issue. So you're saying
that you saw PI cost increase due to this change?

> Would this be a useful shortcut, or are there other updates that this
> unchanged-parameter case must retain?
> 
> Thanks,
> Chengfeng
> 
> Assisted-by: LLM
> 
> ---
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -491,6 +491,39 @@ req_priv:
>         return 0;
>  }
> 
> +static bool fair_params_changed(struct task_struct *p,
> +                               const struct sched_attr *attr)
> +{
> +       if (attr->sched_nice != task_nice(p))
> +               return true;
> +
> +       if (attr->sched_runtime == p->se.slice)
> +               return false;
> +
> +       /* Preserve the existing path for PI-boosted and sched_ext tasks. */
> +       if (p->sched_class != &fair_sched_class)
> +               return true;
> +
> +#ifdef CONFIG_UCLAMP_TASK
> +       /*
> +        * Unchanged fair parameters can still require an implicit clamp reset,
> +        * for example after a task was PI-boosted into the RT class.
> +        */
> +       if ((!p->uclamp_req[UCLAMP_MIN].user_defined &&
> +            p->uclamp_req[UCLAMP_MIN].value != uclamp_none(UCLAMP_MIN)) ||
> +           (!p->uclamp_req[UCLAMP_MAX].user_defined &&
> +            p->uclamp_req[UCLAMP_MAX].value != uclamp_none(UCLAMP_MAX)))
> +               return true;
> +#endif
> +
> +       /*
> +        * A zero runtime requests the default slice, whereas se.slice stores
> +        * its actual duration. Keep the update if the mode or default changed.
> +        */
> +       return attr->sched_runtime || p->se.custom_slice ||
> +               p->se.slice != READ_ONCE(sysctl_sched_base_slice);
> +}

Egads, this is unreadable. Also, perhaps wrong. Suppose the case where
attr->sched_runtime == se->slice, but !se->custom_slice. Or suppose the
slice matches, but you still need the change due to uclamp.

Anyway, are you trying to say something like so?

	if (!!attr->sched_runtime != !!se->custom_slice)
		return true;

	if (attr->sched_runtime && attr->sched_runtime != se->slice)
		return true;



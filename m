Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEC636F908
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815858; cv=none; b=ql2Sv5vKIzbHrxEBWiPXUmD131ngdjOkGKCiQK16NNNNeT0ISV0GeOsFtPjx0A+3iR7LESMXMmS7g0nGfn5N3ZLfyu12N+jNy6RCqKNwuify89NGPCn87ohgqwOyFFNTyrsHOtBBgb2ehaC3muRuxhDqLQ+TW5CCihHAQCfvAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815858; c=relaxed/simple;
	bh=CBlfcBUWYEnSRXmKlgvCFITlG7sd0lf5HQ2RROY3Fh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7r5r4JUE4YeaUnMe+5TxQTD3BCARuxQv6fwLxxAFK8EL11T7XJ7OJzfz7+cd7kcRHwCalLzd9McsEzqlqe6KuCwqNlsdxPC+3kPbcQcWo1+CbyzVm5/No/skAai4OeZZZQn7Cl6b/5uVn5TWPFRdMH/0l31DYadn/66of6yGyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fbM1TopE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fbM1TopE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p6pjVIEMbk6zQ7Q5RVUB2N9j756pih6zo5BZBvTWkTg=; b=fbM1TopEYoM6dnrV/2+al49Wvm
	zNdffnWzyziMZTKP2mCNur6lUUp3arYyyzHSIuEXmB/y2DuX/kvDqxxfo/l2arzvkVs824vYRI2oX
	PNO6/5heP8vb/8csbzCvBHJzhSpGHdqT2VziKNnIGY1B3YwL98czotxupiSXs+mNq5que2QKH9Z1c
	q7mDBBpIogEBhPcZ2rsem1RCCYxvzjwtS4cwi3emehPzaKP405tHhvjy1C4+K9/2IpaYrPE6iY6QC
	/Yu54rgWsakRkVukQGddSDjQHOe0fid4ygxqtiEkkTNHZ8sbLy48xFxGDtikAesCpzeWGk6feZliK
	liV3AIrQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzUZL-00000007G9X-2rPc;
	Thu, 27 Aug 2026 07:30:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6CD29300312; Thu, 27 Aug 2026 09:30:36 +0200 (CEST)
Date: Thu, 27 Aug 2026 09:30:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, zhanxusheng1024@gmail.com, neelx@suse.com,
	chjohnst@mail.com, mproche@mail.com, sean@ashe.io, steve@abita.co,
	rishil1999@outlook.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826224238.936456-2-atomlin@atomlin.com>

On Wed, Aug 26, 2026 at 06:42:33PM -0400, Aaron Tomlin wrote:
> The root_domain pointer rd field in struct rq is updated dynamically
> using RCU, and its memory reclamation is deferred via call_rcu() in
> rq_attach_root(). However, struct rq's rd field was missing the __rcu
> compiler annotation, and several lockless readers across the scheduler
> subsystem accessed rq->rd directly without using RCU dereference
> primitives.
> 
> Add the __rcu annotation to struct rq's rd field in kernel/sched/sched.h.
> Update lockless readers across kernel/sched/ to use rcu_dereference(),
> rcu_dereference_sched() or rcu_access_pointer() appropriately. This
> ensures proper data-dependency barriers on all architectures, enables
> Sparse static analysis validation, and documents RCU read-side ownership
> contracts.
> 
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  kernel/sched/core.c     | 24 ++++++++++-----
>  kernel/sched/deadline.c | 67 +++++++++++++++++++++++------------------
>  kernel/sched/fair.c     | 29 +++++++++---------
>  kernel/sched/rt.c       | 64 ++++++++++++++++++++++-----------------
>  kernel/sched/sched.h    |  2 +-
>  kernel/sched/topology.c | 11 ++++---
>  6 files changed, 113 insertions(+), 84 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2e7cde033a31..86de58f5825b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8547,8 +8547,10 @@ void set_rq_online(struct rq *rq)
>  {
>  	if (!rq->online) {
>  		const struct sched_class *class;
> +		struct root_domain *rd;
>  
> -		cpumask_set_cpu(rq->cpu, rq->rd->online);
> +		rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));

This seems wrong; rcu_dereference_protected() is only supposed to be
used during the update. And rq->lock is very much not the update side
lock of the topology.

Also, &rq->__lock is wrong.

And this is far too verbose to endlessly repeat.

Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727E4A499F;
	Mon, 28 Sep 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602667; cv=none; b=bS6f3489QDXQYItkYZzOUvmVitU865abajV2J9j1tlaiK4qg1XNfloDayecqcBdePUUmIRi8wI/BuuA1LLoNNCyIGZ4Bk4uPS3v/DRce1y9s/dr8JAKi9Vkbk8hFGdp9mZ8G3MVoLCsdLtQ9x/8/JL2qszGs7GYhzBnt2ggekZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602667; c=relaxed/simple;
	bh=4hg7Wvmz8fknmz3H0hVkCItBtyu/E7KlkmQnjV5SXH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAqBZBsFL5pG9HT0/aA0htK7CAk2+wjTsfX+RxYglRgkbfgfXm0GhYoqk8nrRkjj2Dc81UoRH+8zguOcNY84yL7l+Fm7kFhcl/iET9qiAOgsioTqt1mqhPVK3E4leFyZZyzhU6i+t7vV980KmKzdBXKhOWuys8Wef345sVNBWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PyilPd2M; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PyilPd2M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F+7GoJgI3F7grI/h9OiYRlUWl2AQqq7A7DnuMRlmWtE=; b=PyilPd2MtUPnHWn4L9zErq2rF5
	89ipaCmZ93P6rKqEEzI4h7hRv2cYps5YWAlSyd6yZiXv+ST1VNd+FmuEZxc11vpT0gjwzB3cVhvkT
	znaX1s9cAYgRi5ZbGRyFSEFcMVhRch8Iv37FwilNJvG5Ce9zQdH3RsbETtDQW7mMgLGdc9guIye5e
	nR7eZKx/Beo9ALj+76iUVdYYwtJMVmntQ6KAzxZMlILLgZg5VtK+k5qi44OACiS/uVs6f+gdjyApm
	p7abX5EM/rZ60kNYFz8x46topnRe0v12qzLNzSmPeTxJJFmyFqkEzZy9+nmdSMuV1uiPDkYOdDfNp
	ynqTHSzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBBXz-00000001Wja-0Rua;
	Mon, 28 Sep 2026 13:37:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C6324300754; Mon, 28 Sep 2026 15:37:33 +0200 (CEST)
Date: Mon, 28 Sep 2026 15:37:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yiwei Lin <s921975628@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in
 rb_add_augmented_cached()
Message-ID: <20260928133733.GP2009045@noisy.programming.kicks-ass.net>
References: <20260928122611.336351-1-s921975628@gmail.com>
 <20260928122611.336351-3-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928122611.336351-3-s921975628@gmail.com>

On Mon, Sep 28, 2026 at 08:26:10PM +0800, Yiwei Lin wrote:

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7455a83a6a990..60db4624b9897 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1066,9 +1066,20 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
>  	       se->max_slice == old_max_slice;
>  }
>  
> +/*
> + * Fold @new's subtree data into @se, for each @se on @new's insertion path.
> + */
> +static inline void
> +min_vruntime_merge(struct sched_entity *se, struct sched_entity *new)
> +{
> +	__min_vruntime_update(se, &new->run_node);
> +	__min_slice_update(se, &new->run_node);
> +	__max_slice_update(se, &new->run_node);
> +}
>  

So min_vruntime_update() can be written in terms of this helper like:

static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
{
	u64 old_min_vruntime = se->min_vruntime;
	u64 old_min_slice = se->min_slice;
	u64 old_max_slice = se->max_slice;
	struct rb_node *node = &se->run_node;

	se->min_vruntime = se->vruntime;
	se->min_slice = se->slice;
	se->max_slice = se->slice;

	min_vruntime_merge(se, node->rb_right);
	min_vruntime_merge(se, node->rb_left);

	return se->min_vruntime == old_min_vruntime &&
	       se->min_slice == old_min_slice &&
	       se->max_slice == old_max_slice;
}

And that is *very* close to being generalizable, obviating the need for
RBCOMPUTE. Does your LLM see a way to make that happen?

That is, for RB_DECLARE_CALLBACKS() and RD_DECLARE_CALLBACKS_MAX() this
is trivially doable, but I'm not sure I see a clean way to make this
happen for RB_DECLARE_CALLBACKS_MULTI().



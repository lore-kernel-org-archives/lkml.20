Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49944A409;
	Fri, 25 Sep 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339191; cv=none; b=Pv7/Nnc/PorVcY7GwjjNYzucpRHiwpsef5edRDgJZ3SR9gzi3Ucm5TTXm1WkKRTsi8hM1jxxUVbVdhruJNHBF1NyFzpVVGHY+4Qey2Epi/BcttYL70wUK4fMW/IyUfkN0HmXo2wFM0ofEa+eocjcW1olt0h8VMQcrYl6pk0czoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339191; c=relaxed/simple;
	bh=Bpryy22rrYkI+XpI+U9DjU6yvWHhoR5WtFYgeHfVYQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br56SsQPzm+5Mppc6DNJZ7lbjDkSY9Y8PWMMCh6lVsLHYUcSe6Rf71lsjP8HNVHoQBWv6FAVt7dimYDfLLNRRz+h8R0nFSi2hOSr9jJXdI4mBv+2pnjSo7+e3SXXvKGL6cZShdSj9owyaUGz+89qcraIaSSP+SbE7mkjuFLAwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B97f3/g6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B97f3/g6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152041F000FF;
	Fri, 25 Sep 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339190;
	bh=mnNVii+x5mejyCYl0rFiBctui+GkEUIPfz8Jn6JKzZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B97f3/g6tUQVSsuL25Eu/6gIe/RobaqBQv+9t5ufphq48AnuPkJKEzCxy71iHKubG
	 zQPD7nLbHx6m4vRp/+t70gRXC+IbCrG+MuFemktfCWFqopAOLg7DiSekILZzeEHaIx
	 jnOh3/r/ljIVxAcH22UHr3yL/tt1czsv5pPmxbDJjfRhMgdM92sd2lU9mMiBqPT8ha
	 0bxpAoHH0aC6ZrnujFWNkdIqlJZjM2lh4UwWGIrE0VKDAbcduXPqCaoKr/a54JpD8U
	 WHRivpG1RK8onX77zQ+bSdrSUoJ6b5jMfv47zLyJcBPajwd2Vudne1gYcesmTQgjjo
	 jgkyNUmbHgidQ==
Date: Fri, 25 Sep 2026 14:26:25 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
References: <arUS5b85ed6L01qc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUS5b85ed6L01qc@sirena.org.uk>

Hi Mark.

On Thu, Sep 24, 2026 at 01:09:09PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   fs/xfs/libxfs/xfs_btree.c
> 
> between commit:
> 
>   4d1d71f8b90dc ("xfs: remove dead kswapd flag inheritance from btree split worker")
> 
> from the mm tree and commit:
> 
>   26f42375404e5 ("xfs: fix NOFS state corruption in btree split worker")
> 
> from the xfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Do you mean non-trivial conflicts with linux-next? I always attempt a
merge against Linus's tree before sending a pull-request to check and
annotate any possible conflict, but I have never done that for
linux-next. I can do that, no problems. Where should I send a
notification to? linux-next@vger?

Cheers.
Carlos

> 
> diff --combined fs/xfs/libxfs/xfs_btree.c
> index 6738d9d1511bc,7effebe297ea0..0000000000000
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@@ -2994,6 -2994,7 +2994,6 @@@ struct xfs_btree_split_args 
>   	struct xfs_btree_cur	**curp;
>   	int			*stat;		/* success/failure */
>   	int			result;
>  -	bool			kswapd;	/* allocation in kswapd context */
>   	struct completion	*done;
>   	struct work_struct	work;
>   };
> @@@ -3007,18 -3008,39 +3007,18 @@@ xfs_btree_split_worker
>   {
>   	struct xfs_btree_split_args	*args = container_of(work,
>   						struct xfs_btree_split_args, work);
>  -	unsigned long		pflags;
>  -	unsigned long		new_pflags = 0;
>  -	unsigned int		nofs_flags;
>  -
>  -	/*
>  -	 * we are in a transaction context here, but may also be doing work
>  -	 * in kswapd context, and hence we may need to inherit that state
>  -	 * temporarily to ensure that we don't block waiting for memory reclaim
>  -	 * in any way.
>  -	 */
>  -	if (args->kswapd)
>  -		new_pflags |= PF_MEMALLOC | PF_KSWAPD;
>  -
>  -	current_set_flags_nested(&pflags, new_pflags);
>  -
>  -	/*
>  -	 * Don't use xfs_trans_set_context() here: it would overwrite the
>  -	 * caller's saved NOFS state in tp->t_pflags. Use a local scope.
>  -	 */
>  -	nofs_flags = memalloc_nofs_save();
>  +	xfs_trans_set_context(args->cur->bc_tp);
>   
>   	args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
>   					 args->key, args->curp, args->stat);
>   
>  -	memalloc_nofs_restore(nofs_flags);
>  -	current_restore_flags_nested(&pflags, new_pflags);
>  +	xfs_trans_clear_context(args->cur->bc_tp);
>   
>   	/*
>   	 * Do not access args after complete() has run here. We don't own args
>   	 * and the owner may run and free args before we return here.
>   	 */
>   	complete(args->done);
>  -
>   }
>   
>   /*
> @@@ -3062,7 -3084,7 +3062,7 @@@ xfs_btree_split
>   	args.curp = curp;
>   	args.stat = stat;
>   	args.done = &done;
>  -	args.kswapd = current_is_kswapd();
>  +
>   	INIT_WORK_ONSTACK(&args.work, xfs_btree_split_worker);
>   	queue_work(xfs_alloc_wq, &args.work);
>   	wait_for_completion(&done);



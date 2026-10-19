Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742A4E4308;
	Mon, 19 Oct 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414273; cv=none; b=JR+7SroF6eIFjymePu42OozNbagjE80VXUOEemsIYt7dlMMznq4cn2Lhkn7s6MDSm8Ae9t5yJdcgO6fvcP/UOX/36Zu+niY6xouBh49B2C9p2pUiCuQveTBs3t+sNLgudEuiHH50pJLiDkdTZKJEfTAoXl//x+n4bm6P9NP8jLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414273; c=relaxed/simple;
	bh=khHh5ooayH62/hPBTZatboWOrzHcGIJYlFHcKZT+VeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LE51UjPMTdpRsUuS0tZxWnU1bOPRFWm468tF7l3rI8OGUsrmOT3otQODGnAtIC3/nyg7MDL1kQb2mMgY58UZbXU07kF1wXTSuBY1Fkw1mKPAfzfCA5psA5YsunfLgaXmBVesQTsLZInYVgS+uTR5OHJ+bIR3DhZP9eaQ0s2kU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1po9/Cv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1po9/Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC33D1F000C4;
	Mon, 19 Oct 2026 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792414267;
	bh=kObkMdnvGeSnlUyvgNw6GOVIWwiykyT9/ZgXhMuzqVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1po9/CvrYHTR59+0FsEfo39j/pq+MxqegpMIj9BwdXMOth35ydrs+x0VEXcrjc7R
	 S2br5PVLvRLdzYo2YSIfeA/rJ5WS+glDw3DUiI3SxvYrwIlOlOQ/OpnEJJeHvLx70n
	 poGzH/IT1i60uo36yVelT6jk/pgt/ng0u5cmwuAl8pVplYv5ZdmrOh0jyfun8ajOVi
	 1BEjCPBKake4CN2aCZqJmyOfFjSA1KJWffluspSD4vEFHeOg20j/g6YXPqxCUaK2hV
	 UVnWESbbhHE5lWAULgBRqzv6Mp587FI35/0vk4rxgMbBRjl6WGxBoK0UglnHVl3iEu
	 nM+8uZehMFWUw==
Date: Mon, 19 Oct 2026 14:50:58 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <atYR5sFaEEvBYCdC@nidhogg.toxiclabs.cc>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
 <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
 <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
 <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
 <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com>
 <f7d2fe6f-558a-4bf6-bf17-00f3842b923a@sirena.org.uk>
 <20261019114806.1298980-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019114806.1298980-1-sashal@kernel.org>

On Mon, Oct 19, 2026 at 07:48:05AM -0400, Sasha Levin wrote:
> On Mon, Sep 28, 2026 at 01:48:14PM +0100, Mark Brown wrote:
> > There is a fixup in -next already which is hopefully OK, I don't recall
> > it being especially bad so probably Linus would be OK with resolving it.
> 
> Hi Mark,
> 
> The fixup in -next takes the mm side of xfs_btree_split_worker()
> verbatim, which puts xfs_trans_set_context()/xfs_trans_clear_context()
> back and drops
> 
> 23f91a51425e ("xfs: fix NOFS state corruption in btree split worker")
> 
> next-20261016 still has it this way.
> 
> The two changes are independent:
> 
> 2e6a6ca06fec ("xfs: remove dead kswapd flag inheritance from btree split worker")
> 
> removes the pflags handling, and the xfs fix replaces the transaction
> context calls with a local memalloc_nofs_save()/memalloc_nofs_restore().
> The resolution should keep both. The delta against next-20261016 is
> below.
> 
> Neither tree conflicts with v7.3 here on its own, so whichever of the mm
> and xfs pull requests goes second will hit this. Andrew, Carlos, could
> that pull request point Linus at this resolution rather than the one
> earlier in this thread?

Yeah, I heard about this conflict problem on linux-next and how the NOFS
state fix just suddenly got dropped by the conflict resolution.

It's on my TODO list to mention that to Linus on my Pull-Request for the
merge window tomorrow or most late on Wednesday.

> 
> This is the resolution llminus generates:
> 
> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 6738d9d1511bc..2434c54a35708 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -3007,12 +3007,18 @@ xfs_btree_split_worker(
>  {
>  	struct xfs_btree_split_args	*args = container_of(work,
>  						struct xfs_btree_split_args, work);
> -	xfs_trans_set_context(args->cur->bc_tp);
> +	unsigned int		nofs_flags;
> +
> +	/*
> +	 * Don't use xfs_trans_set_context() here: it would overwrite the
> +	 * caller's saved NOFS state in tp->t_pflags. Use a local scope.
> +	 */
> +	nofs_flags = memalloc_nofs_save();
>  
>  	args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
>  					 args->key, args->curp, args->stat);
>  
> -	xfs_trans_clear_context(args->cur->bc_tp);
> +	memalloc_nofs_restore(nofs_flags);
>  
>  	/*
>  	 * Do not access args after complete() has run here. We don't own args
> 
> -- 
> Thanks,
> Sasha

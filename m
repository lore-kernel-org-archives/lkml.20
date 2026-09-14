Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516E471431
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393160; cv=none; b=NiUxuViIUdiqINdwJ7NN0nGhyILwq94xaQ+3usZ3BUACzEeAWkRIi8xQ+Av2WgN7yv5f9zIynvKELBzhmWRIsEyb9gqCDhB9P7bss6MMUK3AA3Clc61VyjCkfRFgTqDcKNs+RDEM2dSjxLDQSyp+KFuJSRRjhTSNuewD0EE7opg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393160; c=relaxed/simple;
	bh=/9KwcFcUY+hBzsOq55/9D976S9pB/gBUtqUtk/MKKR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbBu7/iPVCTYLRY0Y+Clz+YcWRBmQVovPeiAW+IRR3MKOjak4XC89YREqQW5E5brVUszN1QcHojBjTDtW4dh1IZxea+3zmpsufL0DJ3YAz7fp+aafOdE1zjPKi1YuyLs74YQM98Xl8p1/e4/5mEwILAs0ZRr7TBgsUFKmOSiJqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4P56YCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4P56YCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6D81F000FF;
	Mon, 14 Sep 2026 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393158;
	bh=Wu/huhJSA+GFkwb696jBPBeb5IkeG1jxg469TwfDzg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4P56YCe/KX3zg7RJkdmGWFq3zvlv5GWBIwVrgdCtGZNtjqgqtHCpMiCZYNkDk7q/
	 ZtKtMNXyEiXKBun4rfcGHcVM2yDajyOkWD4wZd+tRFdOqx04ZS1bcWjtLi4xYIMieC
	 iKolypAErPf0OKT7L+UcueBqViqXtD33H3SbuYmb0zOvDCqkUnZ40APL5FhFUDId8l
	 YryMSFL6XtUOZPwHwNs2GsPbmEh3l8S1XbRDTs74UJSqJOUqOrcDBmh7jaLBhHNdod
	 d/UEQDHyRVjDctnPYGjRfHotwjW9H5dwTohsjUF2nPmQR4a1xfKQAbEl5w70H9NvGO
	 bQAvLonHuDGBQ==
Date: Mon, 14 Sep 2026 14:39:16 +0100
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mm/slub: make the case handling in __slab_free()
 easier to follow
Message-ID: <aqf4IsztnhrXBocx@thinkstation>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824122513.3829-1-hao.li@linux.dev>

On Mon, Aug 24, 2026 at 08:25:09PM +0800, Hao Li wrote:
> There are 7 possible transitions in __slab_free():
> 
>   a. partial->partial
>   b. partial->empty, offlist
>   c. partial->empty, onlist, exceeding min_partial
>   d. partial->empty, onlist, not exceeding min_partial
>   e. full->empty, exceeding min_partial
>   f. full->empty, not exceeding min_partial
>   g. full->partial
> 
> (There is no offlist variant of e, f and g as a full slab is on no
> list.)
> 
> Clarify which case each branch handles, and replace the goto with a
> return at the end of the skipped block so that every branch explicitly
> states its coverage.
> 
> Case 'a' is the only path that needs neither list_lock nor list
> handling. Give it an early continue: handling it upfront is much clearer
> than forcing every other case into a nested block.
> 
> Also, read SL_partial once after the loop right where it is used, rather
> than re-reading it on every iteration.
> 
> No functional change.
> 
> Signed-off-by: Hao Li <hao.li@linux.dev>
> ---

Looks good to me (with Vlastimil's suggestions adjusted),
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

>  mm/slub.c | 95 ++++++++++++++++++++++++++++---------------------------
>  1 file changed, 49 insertions(+), 46 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index b0cd0572e2f2..e20375307770 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5748,76 +5748,79 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,

[...]

> +		/*
> +		 * The slab might need to be taken off (due to becoming empty)
> +		 * or added to (due to not being full anymore) the partial
> +		 * list.
> +		 *
> +		 * Speculatively acquire list_lock before calling cmpxchg(), as
> +		 * performing cmpxchg() prior to lock acquisition races with
> +		 * concurrent paths, such as the shrinker.

nit: it's bit weird to mention shrinkers specifically?

-- 
Cheers,
Harry / Hyeonggon

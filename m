Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495785;
	b=PF5OaYG1l/LVqk7WTtu15WLH0c74FlSDk7z/jmAx6NB9aSdiQmxmkkx6/8gr1Bax8lYV
	 jhplq8m/+IUF6b56NWN0uK/k632jXZO6nVA+p/sg6+Jn37BFRBW4nh2iUtgNNeBuH9hQQ
	 DlzzaLR7wiUxpJ0yqidaFFsQN0OiB1ygsj6fEvAXGEGGoeLVp1Aw2/Sv7q/tqEENCcDi4
	 eEf816Q8apYMzMROcVvIGgMjziAHn6nnDEt7o5eFZO1+aJF6MAUhHXjgI707LgupTCUnl
	 thulg0ndhjkttJPRgmltW78thYwgb2R6PvMgI8lc5isCAjEHXvG8/Vn+pF9WYCHXJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495785;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7K9NJVRHkkfPoN7dlOGzjvSobTAnpjtwzm4XPW/Q2Zk=;
	b=anwYkTd/qV50frATxPa8fRI9RXDD79J5RHcRJozUlAYwbgQJsSjmgadHSKtPKBFs7y/a
	 U59bS3Kar4TKGj5gMgUirxCVCQWwpwC+JcE08wGXQdWAVuDPZX44OL/1gvDPoePpfsFgI
	 TS12FRZ9P/7p7IGo/2CxzlZgAd1XlAQiurqLk3QUZ7u2xlnx3eKLM3pxd1OtKKAu3rpSb
	 rtQ8QiZ9SpowZ/IGhQ62sTi9aYdYtrlSkHL7hgAiO0aTrciEVnz+WKNnANIbNjxWCsrHl
	 mheqxHXrCjOx9COUY0TpfwrUbw5urAY3xONBIaKOrKEwDdqFnjHpiQw0CmQIV9PE0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4gd8OWh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E05606A8A5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4gd8OWh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30C91F00A06;
	Thu, 12 Nov 2026 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495785;
	bh=7K9NJVRHkkfPoN7dlOGzjvSobTAnpjtwzm4XPW/Q2Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4gd8OWhuhCUm2RCHTG19SJR+Da/kGIIzr30q38JmfIyFEdwGgkXEBSFpTctG7UcT
	 S/ZzgkXA0/a8YDAdRrbn7Sgi8cJMgE9Pxh6GSTU5TfuG7iqjO3LbgtUxZCHmOF4bk8
	 wSjX7rLlOx30FQ33QK1ajCfqZkLBHPVkDKZ5rJfXth6VsZixQjymwb0JYWVGYX5Opm
	 A7vcUf1saG9qHwg3/HDw6LljAy85DIrPPAIbSe2rDOFHjB/jHahLuOPngEyCDc1SOS
	 JuSHS1oi2U2jpncNJ0nI+HKjurqAXMDMVeZhtweTmgEDBJImEuSC0kkzdEyRscl2My
	 CUhpx4oG6bXNQ==
Date: Thu, 12 Nov 2026 15:03:03 +0000
From: Harry Yoo <harry@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH v2] mm: list_lru: fix NULL deref when a folio moves to
 the root memcg
Message-ID: <avXR40QjHujG_H5P@thinkstation>
References: <20261112061231.2469026-1-shakeel.butt@linux.dev>
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
In-Reply-To: <20261112061231.2469026-1-shakeel.butt@linux.dev>

On Wed, Nov 11, 2026 at 10:12:31PM -0800, Shakeel Butt wrote:
> folio_memcg_list_lru_alloc() makes sure that a folio's memcg has its
> own lists in a list_lru, such as the THP deferred split queue. It looks
> up the folio's memcg twice: a fast path under RCU checks if the lists
> exist, and a slow path takes a reference and allocates them. The fast
> path returns early for the root memcg, which uses the global lists.
> The slow path does not check for the root.
>
> The memcg can change between the two lookups: when a cgroup is
> removed, its folios are moved to the parent memcg. If the folio is
> moved up to the root in between, the slow path gets the root, and
> __memcg_list_lru_alloc() dereferences the root's parent, which is NULL.
> 
> Users see a NULL pointer dereference oops while a THP is allocated,
> such as in a page fault, in khugepaged or at swap-in. tmpfs huge pages
> are affected too, and for them the oops can also happen in reclaim,
> for example in kswapd. The task that hits the oops is killed, or the
> machine panics if panic_on_oops is set.
> 
> The race is narrow: the folio has to be moved up to the root right
> between the two lookups. For example, its cgroup is directly below the
> root and is removed, or has its memory controller disabled, at that
> moment.
> 
> Fix it by checking memcg_list_lru_allocated() again in the slow path,
> like the fast path does. It returns true for the root, which needs no
> lists of its own.
> 
> Fixes: ae64f07a6a40 ("mm: list_lru: introduce folio_memcg_list_lru_alloc()")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---

The fix looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

> Changes in v2:
> - Check memcg_list_lru_allocated() instead of mem_cgroup_is_root(), like
>   the fast path does, and update the comment to match (Muchun).
> - Link to v1: https://lore.kernel.org/20261112024140.648088-1-shakeel.butt@linux.dev
> 
>  mm/list_lru.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index d1d256822ccc..ca8de3793166 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -645,9 +645,16 @@ int folio_memcg_list_lru_alloc(struct folio *folio, struct list_lru *lru,
>  	if (likely(res))
>  		return 0;
>  
> -	/* Allocation may block, pin the memcg */
> +	/*
> +	 * Allocation may block, so pin the memcg. If the folio's cgroup
> +	 * was removed after the check above, the folio has moved up to a
> +	 * parent memcg. That memcg may already have its lists, or may be
> +	 * the root, which uses the global lists and has no parent. So
> +	 * check again before allocating.
> +	 */
>  	memcg = get_mem_cgroup_from_folio(folio);
> -	res = __memcg_list_lru_alloc(memcg, lru, gfp);
> +	if (!memcg_list_lru_allocated(memcg, lru))
> +		res = __memcg_list_lru_alloc(memcg, lru, gfp);
>  	mem_cgroup_put(memcg);

I was wondering how we make sure reparenting doesn't happen after this,
but apparently it's fine as __memcg_list_lru_alloc() populates all
list_lrus from the memcg up to the hierarchy before the root.

-- 
Cheers,
Harry / Hyeonggon

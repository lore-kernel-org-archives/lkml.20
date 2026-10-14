Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410ED3E5595
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970323; cv=none; b=ImD1p6vLs3eD3MW+dF0aFvWyUKTKr3WA/E7uN1c65MPONuHGQRmTIxDdYYGqqFBjnXw8qB+pzav17WBzJJie30XG/EPnXleGVixWPB/OOrv8xWJFDBfDkFfvbPzO63hgazoNONctu+Ka8NDVcWRc9ZW00VwHXWVkbN2bndvEoNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970323; c=relaxed/simple;
	bh=eDipCfPtbK+30SXu2d8z7gFUjanhBZdt7ZSl6eXAfE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cC8bp5FOhXGXtj4sd6WuTIvRRWCybpWPEmWKMr7jy8RYGE2wFT4+IVytWd1hYyZAHJ89W9Kn7okvuRbgd2CxMrNdnVzNKR2rHnyuuOyVPJohiR1TOPUvbm66+/8bVyFL55FwMZIpcfUF63hhDoeKSSYtOrPwWFT+164qKAU2/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lB5mxCOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lB5mxCOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48271F000FF;
	Wed, 14 Oct 2026 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970318;
	bh=KOYPMVBEu35aikHlzxYIXaSJP48EsXpEC6OYR3pCYEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lB5mxCOBEnl0TCJuwrjDEwAL8FhUaw1lLBg49iUFpiAIn+qPof9A8DFu3mkO9jynw
	 Eo2F+N44KPhLO+mhy8+Xh1qUCe8tGv3fOK8bPnACBuCom0WvZVb9oS5bLKDwmjJAfG
	 4kfrWggA+Y4aAxQKHEEQvFGWb3v3vs7PAoNIhIUchSdRkT8Tgns4DA4enKWRv/r0MN
	 tPslUKfVc9h8gLBmy8/R7DAbuoUhDaK68S+G1NHfsCIJgugyEFA9z+ewdMPjg00LmG
	 fKw49V5n0a5XbIZFYFb6lFDvYD8Mw2qGzguC2MlwkEkfmCles4MOqGTBnUGdr6ejp1
	 CjLI+iwXCL1Tg==
Message-ID: <b90ec4b6-e0a4-4f46-aa3b-b1a3a08570c9@kernel.org>
Date: Wed, 14 Oct 2026 11:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec
 lock
To: Joanne Koong <joannelkoong@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>
References: <20261013221307.850803-1-joannelkoong@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261013221307.850803-1-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 00:13, Joanne Koong wrote:
> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> folio_unqueue_deferred_split() on folios where the refcount has dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
> 
> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> the deferred split queue lives on folio->_deferred_list in
> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> per-memcg per-node lock.
> 
> There are already other existing callers that call
> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> 
> Add folio_batch_unqueue_deferred_split() and use it in
> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> unqueue each batch of zero-refcount folios from the deferred split list
> after the lruvec lock is released and before
> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> critical sections, which run with IRQs disabled and are highly
> contended.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  mm/folio.c    | 24 +++++++++++++++++++-----
>  mm/internal.h |  1 +
>  mm/vmscan.c   |  3 ++-
>  3 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/folio.c b/mm/folio.c
> index 35e242b48870..85144078e635 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -109,6 +109,19 @@ EXPORT_SYMBOL(__folio_put);
>  
>  typedef void (*move_fn_t)(struct lruvec *lruvec, struct folio *folio);
>  
> +/*
> + * Unqueue a batch of folios from the deferred split queue. This must be
> + * called after the folios' refcounts have dropped to zero and before they
> + * are uncharged (see comment above __folio_unqueue_deferred_split() for why).
> + */
> +void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < folio_batch_count(fbatch); i++)
> +		folio_unqueue_deferred_split(fbatch->folios[i]);
> +}
> +
>  static void lru_add(struct lruvec *lruvec, struct folio *folio)
>  {
>  	int was_unevictable = folio_test_clear_unevictable(folio);
> @@ -177,14 +190,10 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
>  		 *
>  		 * We're bypassing normal cleanup. Clear flags that are not
>  		 * applicable to dead folios.
> -		 *
> -		 * Since the folio may be part of a huge page, unqueue from
> -		 * deferred split list to avoid a dangling list entry.
>  		 */
>  		if (is_lru_add && folio_ref_freeze(folio, 1)) {
>  			__folio_clear_active(folio);
>  			__folio_clear_unevictable(folio);
> -			folio_unqueue_deferred_split(folio);
>  			fbatch->folios[i] = NULL;
>  			folio_batch_add(&free_fbatch, folio);
>  			continue;
> @@ -201,6 +210,11 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
>  
>  	/* Cleanup filtered dead folios. */
>  	if (is_lru_add) {
> +		/*
> +		 * Since the folios may be part of a huge page, unqueue them
> +		 * from the deferred split list to avoid a dangling list entry.
> +		 */

In general, this lgtm, thanks. I am confused about this existing comment you are
moving.

folios being *part of* a huge page? Huh? A folio might represent a huge page,
but what does the "part of" thing mean here.

Is it simply "Dequeue any large folios" ?

-- 
Cheers,

David

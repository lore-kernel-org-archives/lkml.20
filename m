Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21739503BDE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859516; cv=none; b=DnDK/du6Kup7wGK2dne/QDYtuh349wcLYoHDXiBLiUur49BPdZy9SIQHg6RlhN0kIlLkXjAurK9NMCZXEFLW8nxe8uu3tYEy0502jPx39VCyazEhZnWCLNo5yRLPB80MXaKKJdjXMS8ExDlbgwbwHnLXgkae/jUe047u61OmlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859516; c=relaxed/simple;
	bh=I9KZP0tHEbTVTjqoDfZuiJyF18szh5qOBxEu0MUvboQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/CQQfFEyLhzj3QcvAT+pPcE7+HZwY2YEO5uM24D72FzSRa2NZ6CvmoiSN7ta7M2Sbp+U/5ql/6F4lrLNKxLEf7IcuD/m5YBOcFgTrAok6dakvc9btAN1BSDdLdYXPyGCOaaik34Z9b05JHN1PR5TbjDplAv4hWi6m7Di5NRWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5F51F00A3F;
	Tue,  8 Sep 2026 09:25:10 +0000 (UTC)
Date: Tue, 8 Sep 2026 10:25:07 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	hannes@cmpxchg.org, usama.arif@linux.dev, lance.yang@linux.dev, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, kasong@tencent.com, hughd@google.com, 
	balbirs@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
Message-ID: <ap_Tjt5vxal-B8DP@gremlin>
References: <20260907183340.1446132-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907183340.1446132-1-kirill@shutemov.name>

On Mon, Sep 07, 2026 at 07:33:40PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> __folio_unqueue_deferred_split() and __folio_freeze_and_split_unmapped()
> both clear PG_partially_mapped and take the folio out of
> MTHP_STAT_NR_ANON_PARTIALLY_MAPPED with the same five lines.
>
> Move the block into folio_reset_partially_mapped() and call it from both
> places.
>
> The helper asserts what both callers rely on: the folio is frozen, so
> deferred_split_folio() cannot set the flag again under it, and the folio
> is already off the deferred split queue. The list check sits behind the
> flag test because order-1 folios have no _deferred_list.
>
> folio_order() is safe to use at this point in the split process: it
> still shows the pre-split order.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Assisted-by: Claude-Code:claude-fable-5-1

Note that policy has changed on Assisted-by tags so this should be:

Assisted-by: LLM

https://docs.kernel.org/process/coding-assistants.html

> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

One nit above and below, with those addressed LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/huge_memory.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index dd66c6ad5af1..23ef22c2b5db 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3972,6 +3972,24 @@ static unsigned int folio_cache_ref_count(const struct folio *folio)
>  	return folio_nr_pages(folio);
>  }
>
> +static void folio_reset_partially_mapped(struct folio *folio)
> +{
> +	VM_WARN_ON_FOLIO(folio_ref_count(folio), folio);

NIT: I wonder if we could have a folio_is_frozen() that'd make this
self-documenting? As trivial as it'd be :)

If not, then a comment like:

	/* Folio must be frozen. */

Would be helpful.

> +
> +	if (!folio_test_partially_mapped(folio))
> +		return;
> +
> +	/*
> +	 * Order-1 folios have no _deferred_list. The flag is only ever set
> +	 * on folios that do, so the list can be checked after the flag.
> +	 */
> +	VM_WARN_ON_FOLIO(!list_empty(&folio->_deferred_list), folio);
> +
> +	folio_clear_partially_mapped(folio);
> +	mod_mthp_stat(folio_order(folio),
> +		      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> +}
> +
>  static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int new_order,
>  					     struct page *split_at, struct xa_state *xas,
>  					     struct address_space *mapping, bool do_lru,
> @@ -3980,7 +3998,6 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>  {
>  	struct folio *end_folio = folio_next(folio);
>  	struct folio *new_folio, *next;
> -	int old_order = folio_order(folio);
>  	int ret = 0;
>
>  	VM_WARN_ON_ONCE(!mapping && end);
> @@ -3998,11 +4015,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>  		 * leaves PG_partially_mapped set.
>  		 * Clear it here: the flag does not survive the split.
>  		 */
> -		if (folio_test_partially_mapped(folio)) {
> -			folio_clear_partially_mapped(folio);
> -			mod_mthp_stat(old_order,
> -				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> -		}
> +		folio_reset_partially_mapped(folio);
>
>  		if (mapping) {
>  			int nr = folio_nr_pages(folio);
> @@ -4516,11 +4529,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
>  	memcg = folio_memcg(folio);
>  	lru = list_lru_lock_irqsave(&deferred_split_lru, nid, &memcg, &flags);
>  	if (__list_lru_del(&deferred_split_lru, lru, &folio->_deferred_list, nid)) {
> -		if (folio_test_partially_mapped(folio)) {
> -			folio_clear_partially_mapped(folio);
> -			mod_mthp_stat(folio_order(folio),
> -				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> -		}
> +		folio_reset_partially_mapped(folio);

Nice bit of red :)

>  		unqueued = true;
>  	}
>  	list_lru_unlock_irqrestore(lru, &flags);
>
> base-commit: e3fc12b08aadde9cec7b3799ac0e0c9a1aa245c4
> --
> 2.54.0
>

--
Cheers, Lorenzo

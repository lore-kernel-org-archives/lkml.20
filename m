Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E952253B0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116381; cv=none; b=gRUnWFmHdFu+waAdoCbo12rTMeILPu/6+LsYDJ84n+MhGjTOk1y7hSSsYh8MvEO2QpeQlLiF7fn0VwjCcn+0NYBKVaw2PuvL0TYjjeSyGxOxBIfHvx+itus+WeD5GtGWN18anMU/OKCnlYsoVfO4RhgSMlKB5muNrY28H1CGrdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116381; c=relaxed/simple;
	bh=tORcxZ8WxZaGm3bMWeQCy13cx64OEIyVdLTn2VcOeEo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YMSZKrO+ZbUoD5O7X136LsTF6G9fVV17KcUB+faaFr8CLJRdW+F/+ElTh9HKlqnmtgQzKji55fH6q5VKm+vPDl7CuEvQd00BSrDkwttO6O11bnVJSxha1co+AqNN22nYWY8OpuS4haClzJYF47Jzlg81HVFq38MNBlt2NXMzZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=w1NWNG1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="w1NWNG1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C41F000C4;
	Fri, 16 Oct 2026 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792116380;
	bh=DM0j1Lbrqa60NRLPaBXB4br70YXcjW6a6D01KGA6+1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=w1NWNG1/Nv/RNrG5uBWWmwMExbnwtzifIlyv6TQ0kAf/uEO8IyRlZsZYXiNqM1muQ
	 JSMD14czXOQgKshHnpMqJIjkLRFUTiii/pLf5MEvIkBJKN97WMLLVwrn69KcRd+fFk
	 VPJZk8Xten6/BZECrSMloHVqh6IYiTXgpoCum2kU=
Date: Thu, 15 Oct 2026 19:06:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li
 <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
Message-Id: <20261015190619.deccb92624e356bf81084a24@linux-foundation.org>
In-Reply-To: <20261015060528.302634-1-jiayuan.chen@linux.dev>
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:

> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> swap_cache_get_folio() reads the folio from the swap table and takes a
> reference with folio_try_get(), without any lock. If the folio is
> removed from the swap cache and freed in between, and its memory gets
> reused, folio_try_get() still succeeds and we return a page that has
> nothing to do with the swap entry:
> 
>   CPU 0                                  CPU 1
>   do_swap_page()
>     swap_cache_get_folio()
>       swp_tb = swap_table_get()
>       folio = swp_tb_to_folio(swp_tb)
>                                          madvise(MADV_DONTNEED)
>                                            zap_nonpresent_ptes()
>                                              swap_put_entries_direct()
>                                                swap_put_entries_cluster()
>                                                  __try_to_reclaim_swap()
>                                                    swap_cache_del_folio()
>                                                    folio_put()   <- freed
>                                          page reused, e.g. as an anon
>                                          folio of another task
>       folio_try_get(folio)               <- succeeds
>       return folio
>     swap_update_readahead()              <- may clear PG_readahead on it
>     folio_lock_or_retry()                <- locks it
>     folio_matches_swap_entry() fails, unlock and put
> 
> filemap_get_entry() does the same lockless lookup for the page cache,
> and after folio_try_get() it rechecks the xarray, because the folio may
> have been freed and reused in between. swap_cache_get_folio() lost
> that recheck when the swap cache moved to the swap table.
> 
> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
> takes the folio lock of someone else's page, before
> folio_matches_swap_entry() finds out the folio is not ours.
> 
> Recheck the slot after folio_try_get() and retry if it no longer holds
> this folio.

LLM says to me:

: The original folio could conceivably be freed, its physical page
: reused, and the same PFN inserted into the same swap-table slot before
: the second lookup.  That would pass the check.  However, the returned
: reference would then belong to the newly inserted folio, and the later
: swap-entry validation would still be required.  I don't see that as
: invalidating this fix.

> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -92,17 +92,27 @@ void show_swap_cache_info(void)
>   */
>  struct folio *swap_cache_get_folio(swp_entry_t entry)
>  {
> +	struct swap_cluster_info *ci = __swap_entry_to_cluster(entry);
> +	unsigned int ci_off = swp_cluster_offset(entry);
>  	unsigned long swp_tb;
>  	struct folio *folio;
>  
>  	for (;;) {
> -		swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
> -					swp_cluster_offset(entry));
> +		swp_tb = swap_table_get(ci, ci_off);
>  		if (!swp_tb_is_folio(swp_tb))
>  			return NULL;
>  		folio = swp_tb_to_folio(swp_tb);
> -		if (likely(folio_try_get(folio)))
> +		if (!folio_try_get(folio))
> +			continue;
> +		/*
> +		 * The folio may have been freed and its memory reused before
> +		 * we got the reference. Make sure it is still in the slot.
> +		 */
> +		swp_tb = swap_table_get(ci, ci_off);
> +		if (likely(swp_tb_is_folio(swp_tb) &&
> +			   swp_tb_to_folio(swp_tb) == folio))
>  			return folio;
> +		folio_put(folio);
>  	}
>  
>  	return NULL;

This return is now unreachable...

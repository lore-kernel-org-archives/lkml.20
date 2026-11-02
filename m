Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642248;
	b=es6vkvfIGQpJNxI1OCFrWnfn+kVkTiUDcqF5CbLbsY4ujy/NxEdxGOfaMYv91epT0vNe
	 SwCOARfz6Iyuq6w3OR0ZYU8Qitzqhp2AGIwzOgyZyMYuaYYAGl6Tu4B0ASZMnIiy2j1sb
	 LBWdJXjGiMPdHBBdN1sAlmtmIu3DOVYZ7ejJU9FqSTE1UsJeu9low91BjQBurl4hmLVy9
	 eo2hICA1xPIylYsvfM0Q4idw5jZcFtvxr8PsppfQqxE1h0q93gcmG44VX1ri/R2MoEkkP
	 Cz0meu7E9lkUnIcMYRnTI/kJFataTn1HNobKUiFKCQFDfYdP56+Gf+UP6Xi+c79uw7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642248;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9yN/enZfckxR/KaazQYI51lP72amm4JJmcuC6uTU2Oc=;
	b=T0i880irx/kAn9HlGxDYUTh2eJuvaoEvUTFN4lXA0hNndqzhKKAqRFx9XiwR3MMOY4r6
	 8Qrb8a423FWxhX3EvbRoi5Q5pN82bCt/mYopVQpOxIMMOu90GqHFjlaEmJBYla6fZY2/I
	 vTCNM0lCeX5mossSj4nO5WTqIV92Lh67sxhB5dqiL6Y/hUDrOTK1ujgch2myJlkc0G1RC
	 TxNcRgmmKS/zkbAl8hNvwEZxrQ0YbvFDx7HgUboXJf68lSuh6DQqZqsVjLsEn7naXaAej
	 GJId1y4vEnoyYgnne5qQcZLr8B4oqBZxXg29WEZ3FGAD3AgEEpQhq1yRGYf/NfSL1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcTvm6uM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129560716C5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcTvm6uM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8930A1F00A17;
	Mon,  2 Nov 2026 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793642248;
	bh=9yN/enZfckxR/KaazQYI51lP72amm4JJmcuC6uTU2Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcTvm6uM4hHl2o6FdFgVY6v1NyTLeSRetQGO03jcOBvMddtdOrpST+IL4s6+Mfei9
	 NUkBnNxXuuxm07FIDtdNtX6ChQD/D2dIXexIESLJj/2rTuQLyCUS6gcbKPrAXDmAh+
	 bV24zqnSVUYA++RkUpi9jHHSqKou5w3csFuVevqeHe3fRimZ0pAn16cDVm0WKXqNRv
	 6KMyl12KfzdzrSgbMlECNk96GQn4rF4B6OHq/pUthlAr9Kvyh/sGYUr879prMdwXe/
	 8h0vD+0jvfMJz4YsePT7byIsb2bBayxtQqiIGXSOyKkNwSDCl4c+wZ9rWQBR47MON0
	 9Dbr8e2uoTmRw==
Date: Mon, 2 Nov 2026 19:57:20 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
Message-ID: <aujPACLfTbPJnIJa@kernel.org>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-5-songmuchun@bytedance.com>
 <179361471104.1337633.3959715900505206111.b4-review@b4>
 <09EF0F81-23CA-4F3C-BA0E-41F34A0AA4B2@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09EF0F81-23CA-4F3C-BA0E-41F34A0AA4B2@linux.dev>

On Mon, Nov 02, 2026 at 08:34:03PM +0800, Muchun Song wrote:
> > On Nov 2, 2026, at 18:18, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > Hi Muchun,
> 
> Hi,
> 
> It's my email client's fault. Let me email it again.

Things happen :)

> >> Vmemmap page allocation is currently tied to restoring a virtual range
> >> and assumes an empty destination list.  These constraints prevent it from
> >> being reused when pages are requested independently of a vmemmap range or
> >> appended to an existing list.
> >> 
> >> Generalize the allocator and give it an all-or-nothing list contract so
> >> the restore and optimization paths can share the same allocation policy.
> >> This also allows HVO head-page allocation to fail gracefully under memory
> >> pressure without triggering the OOM killer.
> >> 
> >> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> >> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> >> ---
> >> v2:
> >> - Collect Reviewed-by from Lance Yang and Qi Zheng
> >> ---
> >> mm/hugetlb_vmemmap.c | 39 ++++++++++++++++++---------------------
> >> 1 file changed, 18 insertions(+), 21 deletions(-)
> >> 
> >> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> >> index 0e5b2b182d1bf..4b20a8efc0678 100644
> >> --- a/mm/hugetlb_vmemmap.c
> >> +++ b/mm/hugetlb_vmemmap.c
> >> @@ -334,28 +334,26 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
> >> return ret;
> >> }
> >> 
> >> -static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
> >> -				    struct list_head *list)
> >> +static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
> >> +				    int nid)
> > 
> > Please indent with two tabs, like David likes :)
> > Applies throughout the series.
> 
> Sure. Should we update scripts/checkpatch.pl in the future for MM,
> since this script seems to favor the alignment approach?

Yes, makes sense to me. 
 
> >> -	for (i = 0; i < nr_pages; i++) {
> >> -		page = alloc_pages_node(nid, gfp_mask, 0);
> >> -		if (!page)
> >> -			goto out;
> >> -		list_add(&page->lru, list);
> >> +	for (unsigned int i = 0; i < nr_pages; i++) {
> >> +		struct page *page;
> >> +
> >> +		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
> >> +		if (!page) {
> > 
> > I think goto err_do_cleanup is cleaner than ad-hok cleanups
> 
> I’ll use goto style, either is OK for me.
> 
> > 
> >> +			memmap_pages_add(i);
> > 
> > This is confusing. Updating counters only to use
> > free_vmemmap_page_list() seems worse choice than walking the list and
> > __free_page().
> 
> I think the memmap accounting should be done right after each successful
> allocation — that way, using free_vmemmap_page_list() becomes more natural
> and simple.

Why are you against using a loop with a plain __free_page()?

We know for sure it's not a reserved page and there is no need in
free_vmemmap_page().

And with memmap_pages_add() per page do a bunch of atomic_long_add()s
instead of one.

BTW, it would have been nice to avoid per-page counters update in
free_vmemmap_page_list() too, but that's not related to this series.
 
> Somthing like:
> 
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index c04f53f708d2..cab9ec14873d 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -207,14 +207,13 @@ static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages
>  
>                 page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
>                 if (!page) {
> -                       memmap_pages_add(i);
>                         free_vmemmap_page_list(&local);
>                         return -ENOMEM;
>                 }
> +               memmap_pages_add(1);
>                 list_add(&page->lru, &local);
>         }
>         list_splice(&local, head);
> -       memmap_pages_add(nr_pages);
>  
>         return 0;
>  }
> 
> Thanks for your review, Mike.
> 
> Muchun
> 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> 
> 

-- 
Sincerely yours,
Mike.

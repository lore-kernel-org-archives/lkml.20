Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58B4CA770
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533533; cv=none; b=cNykKjT2ANZ/qpDgQoEFZbTwU7tk28wjjY1urmhSHhCNeVSrGOncDlDJxS6Z7doT8fSuXpIJTA9Cya4LX18qhFr5snKAVFSuCTFYZO7uZhGgQbmpDXDKQ40MraRs42Cb/QZJ1h1sGbSIXK+dcDWDXEwqMs6V3TfwDx9N8vPtIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533533; c=relaxed/simple;
	bh=EbdtcmZd+/CSZQY1wSoJkcBAlpBiOiTIaQoFI3+C6LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehGd7brYT0YL/hJ2NnW3j/l2BpSOss6bAfC0HbbUAcRDWZzLz5NN1XABt5NinyVKsjYHtCkCkDoIISMk/QvW0wYT9jodKaOIsCkCKDbEkAf1+WB65DtI8IW1xwXaGztNP/5mXVGarWjJlUhZzoCduN5Gw6Y42Mwz55S1NsFzZIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJD4MJZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJD4MJZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9AB1F00A3D;
	Fri,  4 Sep 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533531;
	bh=dwQzg2jEwGo+36T57R0zDsUiTlf1aTzJz1Ht0vOr634=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dJD4MJZRh25gKn1nsYZg1uaVLWJzXKYzmcpljcL5Mdbw+te3eMDvlsfSG9Bm+LauY
	 1PMYKdnizw1riPMM2zZVYBgaVIA7EtVJ8cov43aSLdyL2qOcmfIFD1DomRZ5O8h2yf
	 EFyXQv6mrObBDLRyCl/6eeK6rs2bzgC/U+vZqiS5JNr9YtAB13QZMQDTi7mXnTL7sn
	 ehioRVm6vFTKuzq+wmx2FoDPEws7k6y4ifeBcZityJdsRQ0vZzJwGD8c7gGtDnNyIM
	 L/RZfe3skN1RH/lKdBdkvfW4QdyAKjCn7jG3Qs9RVNbw6NvzkNADqAY8B06W6aB3e3
	 tVtFPdJOSG6NA==
Date: Fri, 4 Sep 2026 15:52:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Cc: Mike Kaplinskiy <mike@recall.ai>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [RFC PATCH v1] mm/madvise: prefetch private file COW swap entries
Message-ID: <aprY-BekgYlsK-Y9@gremlin>
References: <CABeknB82T0d3VUjz6Xwcdfa8spHvNzO6tZNTMwjJgF00EwrWWA@mail.gmail.com>
 <D758D1DD4372AF8E+20260904100919.2139680-1-zhaozhengzhuo@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D758D1DD4372AF8E+20260904100919.2139680-1-zhaozhengzhuo@uniontech.com>

On Fri, Sep 04, 2026 at 06:09:19PM +0800, zhaozhengzhuo wrote:
...


> Fixes: 1998cc048901 ("mm: make madvise(MADV_WILLNEED) support swap file prefetch")

Fixes totally inappropriate.

> Reported-by: Mike Kaplinskiy <mike@recall.ai>

Missing Closes tag.

> Link: https://lore.kernel.org/linux-mm/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>

(Very likely) missing Assisted-by tag.

Please follow kernel procedure.

https://docs.kernel.org/process/coding-assistants.html
https://docs.kernel.org/process/generated-content.html

I already sent at patch at
https://lore.kernel.org/linux-mm/apm68kgHC0NK2zVI@gremlin/ before this one, so
I'm going to take care of this thanks.

> ---
>  mm/madvise.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 73c2901b9adb..96cbce6c7f8b 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -193,10 +193,16 @@ static int madvise_update_vma(vm_flags_t new_flags,
>  }
>
>  #ifdef CONFIG_SWAP
> +struct swapin_walk_ctx {
> +	struct vm_area_struct *vma;
> +	bool swapped;
> +};

This is silly.

> +
>  static int swapin_walk_pmd_entry(pmd_t *pmd, unsigned long start,
>  		unsigned long end, struct mm_walk *walk)
>  {
> -	struct vm_area_struct *vma = walk->private;
> +	struct swapin_walk_ctx *swc = walk->private;
> +	struct vm_area_struct *vma = swc->vma;
>  	struct swap_io_ctx ctx = {};
>  	pte_t *ptep = NULL;
>  	spinlock_t *ptl;
> @@ -223,8 +229,10 @@ static int swapin_walk_pmd_entry(pmd_t *pmd, unsigned long start,
>
>  		folio = read_swap_cache_async(&ctx, entry, GFP_HIGHUSER_MOVABLE,
>  					vma, addr);
> -		if (folio)
> +		if (folio) {
> +			swc->swapped = true;
>  			folio_put(folio);
> +		}

This is pointless, it's not a good trade off.

>  	}
>
>  	if (ptep)
> @@ -297,10 +305,22 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
>  	loff_t offset;
>
>  #ifdef CONFIG_SWAP
> -	if (!file) {
> -		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
> -		lru_add_drain(); /* Push any new pages onto the LRU now */
> -		return 0;
> +	bool private_file = file && !(vma->vm_flags & VM_SHARED);

This is not correct. My version uses the correct CoW predicate.

> +
> +	/*
> +	 * A private file mapping can contain anonymous COW pages. Once such
> +	 * pages are swapped out, their PTEs contain swap entries even though
> +	 * the VMA still has vm_file set. Prefetch those pages as well; file
> +	 * readahead can only fetch the original file contents.
> +	 */
> +	if (!file || (private_file && vma->anon_vma)) {
> +		struct swapin_walk_ctx ctx = { .vma = vma };
> +
> +		walk_page_range_vma(vma, start, end, &swapin_walk_ops, &ctx);
> +		if (ctx.swapped)
> +			lru_add_drain(); /* Push any new pages onto the LRU now */
> +		if (!file)
> +			return 0;

General structure is OK, but again I already sent a patch.

So please no v2, I will handle this thanks!

>  	}
>
>  	if (shmem_mapping(file->f_mapping)) {
> --
> 2.43.0

--
Cheers, Lorenzo

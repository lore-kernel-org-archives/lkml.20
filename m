Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614727;
	b=w+36tvTiwqVSXVBcVmAn21EgK0LKKPIx91DnBde8R4XRk8PvFy+RbCH1BF5QOnAU3cGG
	 1jhUbfGUkC2MTDqGaaktPenAP+zuQaHJfK2bTOpt7/yA3m/4H1oQG7qE5kx9Grv05W30J
	 15AmqACEtRT2N6FXDw9kDsdOTBVfsthT+tCVvnYppi2NnB8afYihqbo01bz5MLtQ2M1UN
	 aO5+QwWIuxJTFAc3rN5qEphX2fbtym5VkjOGGxDjsuVAZ7RNagvqbfNPBKukqsduAJhO0
	 tECLsjgglKt0voXC9QATuTwyhk7Kdj7FkEODfMk5qPZ2nuv1nMiIqtFFnqqk/Y3mFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614727;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=c3eJZ//o+zBRx3n+KRLGGi0fci9Wz/AyVLE2s2T174o=;
	b=q7y49i0PkxRARTYB3ghIJsZjFqYWf1QJJR2M6MnlfY/7dA7CQZpQMqmrxWxjY4R9z1XU
	 jnmHauDakGiJyguQGs8EIwe4JgZiHYrMPuvoChS6TK/9+mwJuV7o7gyj5CRjxuQskIG2b
	 Vdj+he+BKqr1cqVDIuQ/isEjWVIN3oN6mMflEXWHF1LBzH0XOuJdCeHei61tLmEc4yqEk
	 4NFcYjIOHmkGf/KV1kon3Jmwfe5Zc4/zqozs1EePOsNuIjOhByctg2DVN3jnjRYrQjkAo
	 VVqus9sMjF3lzMb8viRpP0aPjzhE13s5FyzEK5DKt7K5KhbjlM7YBRdUvDcsyRYgPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyInaQOF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64E60A2608
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyInaQOF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF8E1F00A02;
	Mon,  2 Nov 2026 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614727;
	bh=c3eJZ//o+zBRx3n+KRLGGi0fci9Wz/AyVLE2s2T174o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gyInaQOFfRk2e8yXMRdWTkcW2xNGEoKXhOZcYvM6/2GQKtqSZVoEsnj5gIUQfcCzK
	 p0Bk+llE7u7gMGjxOI5l5DDOSt/dAy9KEyLCodoVh+7CWYZhCIoozanNq8HBEhBnv2
	 1frGVJq2z1DHseRGJ/5WlY2pnzlZQ2jGY8lyEi5NPWt23IX6BEtdIcEPhPBaTt4dj8
	 S/+PYEzRrZpZJvIOc+7blXSJ+XZ43xJv17EUpOZ89UuW4+hKhNiiTpsup1AxsWqe1f
	 zJE2aWk+JidwXS/3ApvchfmM5gClDmwQDXIyHA5iVM0MCCNJZlm2NGsw057Ag/zcKW
	 AGSk5Ll3O/xvA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-5-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-5-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.3959715900505206111.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Muchun,

> Vmemmap page allocation is currently tied to restoring a virtual range
> and assumes an empty destination list.  These constraints prevent it from
> being reused when pages are requested independently of a vmemmap range or
> appended to an existing list.
> 
> Generalize the allocator and give it an all-or-nothing list contract so
> the restore and optimization paths can share the same allocation policy.
> This also allows HVO head-page allocation to fail gracefully under memory
> pressure without triggering the OOM killer.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> ---
> v2:
> - Collect Reviewed-by from Lance Yang and Qi Zheng
> ---
>  mm/hugetlb_vmemmap.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 0e5b2b182d1bf..4b20a8efc0678 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -334,28 +334,26 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
>  	return ret;
>  }
>  
> -static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
> -				   struct list_head *list)
> +static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
> +				   int nid)

Please indent with two tabs, like David likes :)
Applies throughout the series.

>  {
> -	gfp_t gfp_mask = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
> -	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
> -	int nid = page_to_nid((struct page *)start);
> -	struct page *page, *next;
> -	int i;
> +	LIST_HEAD(local);

Can we use a better name here please? E.g new_pages?

>  
> -	for (i = 0; i < nr_pages; i++) {
> -		page = alloc_pages_node(nid, gfp_mask, 0);
> -		if (!page)
> -			goto out;
> -		list_add(&page->lru, list);
> +	for (unsigned int i = 0; i < nr_pages; i++) {
> +		struct page *page;
> +
> +		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
> +		if (!page) {

I think goto err_do_cleanup is cleaner than ad-hok cleanups

> +			memmap_pages_add(i);

This is confusing. Updating counters only to use
free_vmemmap_page_list() seems worse choice than walking the list and
__free_page().

-- 
Sincerely yours,
Mike.


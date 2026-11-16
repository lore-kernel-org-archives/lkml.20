Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825789;
	b=Z9HzeWg+tdUe816Azo6BjqkCNYJViLloOSJVGRRTeSh0Q4WAVBY9/f6bTnfINHEjZRwK
	 BJMD+AVEqt55wv4pBwoRcUDEirS7FmX9hEQi5oTjP44TxLS2VzenXrK1hjscSaDmkULjP
	 XBTj44rvknG7PKfdIN8+rWl0kbU/0FzUoMN6kdlZ7wAo29lhbbPavi5HR+z5Oz025oQqE
	 QbNQIPkvXyXInwuvwKBEERZ+eNcE3OZmKmI6oyElfUMUW4dV3jZGoAlbkKKjklXmm0ydI
	 fH9IWTcHqqXqWbWMbnqG8bGk4RuJkLrBBUfzYVt16NSAWJmhq+uJCiqzgmrY4Z5H1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825789;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=D2mPmAY7zwrcecu1heIJ2BvdNaHui2QL8RC2C/8dWPU=;
	b=SuZczKMHrC+RGPuN+1+bZKsei78nKgApCbBo7fy98l/kUxIkKepCV26c/v+sRut+j7ei
	 07kjMOVOl3oiXaY8l0v8k8FkxlGQv3G7/3gXIV1OBJmFUe8HLa/m865bPCht1sNHplDSs
	 UFkzzrDV70x2dKd8pq6kA+0a371MxDUFKTbqtOFIRB3gxDSyvw9s2HGc8TNUFg2YkXxBi
	 L0HgLEzZsVLt79M0IvM6f+aMroAmgUUDvT+dXDzENIZgx45HK12/aDZn7KDjz9R5/LSjZ
	 4aC+JsuYQRdGh+EBflRuERuwkAvXUu+irm8mFfRs23a4qwzrSqk0Mo/vhwBkn77ziZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCPQaEyu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920D6606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCPQaEyu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613A91F000C9;
	Mon, 16 Nov 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825789;
	bh=D2mPmAY7zwrcecu1heIJ2BvdNaHui2QL8RC2C/8dWPU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oCPQaEyu7Dw7pDWc6HhM89NOVPmqfWZvd8EZKHjqBBIVjtvzKNE4g4/OIKYeFxrOa
	 5aXtZ8pERlSoaF+67JMoZaOFmqfVMN5650dukmH8w0+Smz2ytGmvFzfDWxpvqO2rRz
	 Y05Qb/NnMYS8UKI+kxS+JxMp6AKC9bXF8a0ChPeovZKbvaDwzmQLM/pI/rB8rJsJQ+
	 BkKptcBIhMVBSManwdXhnD2IfL+cGOdTiM5DTX7O3ouyjrgo4QHDazlvttK9Jk+aIB
	 NQQChSP+RJWA5NQqnE/580z30qopKQXOVEmYc6MKAAjU+OAXI4jwX5q9KnQh09gzFG
	 qDp+yZpgquz5w==
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
Subject: Re: [PATCH v2 06/14] mm/mm_init: factor out frozen compound page
 initialization
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113033442.62970-7-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-7-songmuchun@bytedance.com>
Date: Mon, 16 Nov 2026 12:42:48 +0200
Message-Id: <179482576829.2379196.14870002582501235383.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> ZONE_DEVICE initializes compound struct pages while their refcounts remain
> frozen. The setup is open-coded in memmap_init_compound(), including the
> per-page initialization and compound tail preparation.
> 
> Factor the common setup into memmap_init_compound_page_frozen(). Keep the
> pgmap association and MEMORY_DEVICE_GENERIC refcount handling in the
> ZONE_DEVICE-specific path.
> 
> This provides an MM-internal helper for other early memmap users to
> share.
> 
> No functional change is intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Rebase on memmap_init_page_from_template().
> - Rename memmap_init_zone_device_head_page to memmap_init_zone_device_head_fields.
> ---
>  mm/mm_init.c | 114 +++++++++++++++++++++++++--------------------------
>  mm/mm_init.h |   2 +
>  2 files changed, 59 insertions(+), 57 deletions(-)
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index bf943ae72a3e5..f1e539aec3d91 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -738,6 +738,28 @@ void __meminit memmap_init_page_from_template(struct page *page,
>  	vmemmap_optimization_verify_zone(page);
>  }
>  
> +void __meminit memmap_init_compound_page_frozen(struct page *head,
> +		unsigned long pfn, const struct zone *zone, unsigned int order)

Do we really need the _frozen suffix here?

> +{
> +	unsigned long nr_pages = 1UL << order;
> +	struct page template;
> +
> +	memmap_init_page_common(&template, zone_idx(zone), zone_to_nid(zone));
> +	prep_compound_tail(&template, head, order);
> +
> +	/* Initialize the head page. */
> +	__init_single_page(head, pfn, zone_idx(zone), zone_to_nid(zone));
> +	set_page_count(head, 0);
> +	__SetPageHead(head);
> +
> +	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
> +		nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
> +	/* Initialize the tail pages from PFN-independent template page. */
> +	for (unsigned long i = 1; i < nr_pages; i++)
> +		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
> +	prep_compound_head(head, order);
> +}
> +
>  struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
>  {
>  	pg_data_t *pgdat = NODE_DATA(nid);
> @@ -1063,44 +1085,39 @@ static void __init memmap_init(void)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -/*
> - * With compound page geometry and when struct pages are stored in ram most
> - * tail pages are reused. Consequently, the amount of unique struct pages to
> - * initialize is a lot smaller that the total amount of struct pages being
> - * mapped. This is a paired / mild layering violation with explicit knowledge
> - * of how the sparse_vmemmap internals handle compound pages in the lack
> - * of an altmap.
> - */
> -static inline unsigned long compound_nr_pages(unsigned long pfn,
> -					      struct dev_pagemap *pgmap)
> +static void memmap_init_zone_device_head_fields(struct page *head,
> +		struct dev_pagemap *pgmap)

I can't say I like this name. Essentailly we initialize ZONE_DEVICE
folio here, so maybe it can be

	memmap_init_zone_device_folio(struct folio *folio)

>  {
> -	const struct mem_section *ms = __pfn_to_section(pfn);
> -
> -	if (!section_vmemmap_optimizable(ms))
> -		return pgmap_vmemmap_nr(pgmap);
> -
> -	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
> +	/*
> +	 * MEMORY_DEVICE_GENERIC pages start with a refcount of one; other
> +	 * ZONE_DEVICE pages raise it when handed out. Use atomic_set() because
> +	 * @head may be a stack template, while init_page_count() expects a
> +	 * memmap-backed page.
> +	 */
> +	if (pgmap->type == MEMORY_DEVICE_GENERIC)
> +		atomic_set(&head->_refcount, 1);
> +	/*
> +	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer and
> +	 * zone_device_data. It is a bug if a ZONE_DEVICE page is ever freed
> +	 * or placed on a driver-private list.
> +	 */
> +	((struct folio *)head)->pgmap = pgmap;

... and then we won't need this cast and the caller will just pass
page_folio() here.

> +	head->zone_device_data = NULL;
>  }
>  
> -static void __ref memmap_init_compound(struct page *head,
> -				       unsigned long head_pfn,
> -				       unsigned long zone_idx, int nid,
> -				       struct dev_pagemap *pgmap,
> -				       unsigned long nr_pages)
> +static void memmap_init_zone_device_basepages(unsigned long start, unsigned long end,
> +		const struct zone *zone, struct dev_pagemap *pgmap)

_basepages sounds odd for me, maybe _pages will do?

-- 
Sincerely yours,
Mike.


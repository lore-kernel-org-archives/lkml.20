Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825780;
	b=UsMQAdZAkDPCxLZEjQCi4or5uBustTs6fKHRLDWWXbgT/wNIdGjNDYCNIxocNxKmsTTo
	 dA53MgVqKCvVj8EInlH7q/g+e7F+c/kx1EYvVMnrJbUWZ1/ngDg+RcsIGGDTKM4ov224U
	 JvJCVz13+MV6tqsceVrENtiaayuP/TU7aoy9WXnhHPSeEnDcsi5DEXHFxKz49H/MQcM8G
	 Nq9EjQfiU5oi4j85vNMu/BD1mjuSmfKrZr9APlCJXDp8lzy9cVhP93Natslen9kF9RHY1
	 uEL4XebUycCQlT7fi+DUX7H41jmty/DcGEYhORfhPqDCR3tgCGHGFV9X5V8DinHRMjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825780;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=cx/84dIEgCToGVbSCcqCImRJVM/D/eNbp/YNfnFpfQE=;
	b=XFjzBhRegU1Ah1DzxuiEBjpAivNGtAKc9EtTaRBZfTwKJfrWXfPdLr1fgNix6OZqLbnR
	 V4liIYsHDPkdzE3A10ytw78KvIe3dTM9rVtcCHFNgjdjQ4OJKfPZ4bWcKB6kthVgQG9o3
	 ckpTOuf/MC4WvCF4AKwUtch6c+baycWMwjC8NUsnDMasMhT+2BBGA0KuedF6kagiNE9wW
	 CWKdetGBuKq/45L7QOFM9JBoLO6xXUxFhPtRU7tQbZ5LUjoEAbGGf1eQ3hPSigCb/6ZxA
	 Bblq5KOvVmrFRBWpaheJFLDUn0ABUwUMXzdONsPxNGEnoa69UriMBYdJ9Y3wKwr6lzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L53Kvpg/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1833606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L53Kvpg/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E171F000C6;
	Mon, 16 Nov 2026 10:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825780;
	bh=cx/84dIEgCToGVbSCcqCImRJVM/D/eNbp/YNfnFpfQE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=L53Kvpg/F1eR9dPgVhOXriObkAjop9B9ioQwhI2UPyGHVxcZANDFkOKiohK+anad0
	 H+wTCo1aRZcsrVFJtre153ASAH7f2xaNtBGyRXCu/ktsMvS1aF4FM3f6PExMl89eMt
	 GH5z1Y87L2dKpBYkBCHFBwYvcfyWaaCf6cl3JcawO5Y3tEBmW9PZrO9/V2A8sKHMSL
	 v9kXdZAgtevbm5LGMGqc8FhWiZqqtwLvH8AMEQzX2CnpHMMWV35yDDtrPLckX7F1KL
	 rkJET0alEEADoHw170MFKCCA4UmuC9BlxBIPf2vxAfkjCdb80HolkTMwkwzoqMb5HE
	 l9+M9ceWTKo1w==
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
Subject: Re: [PATCH v2 02/14] mm/hugetlb: optimize bootmem hugepage tail
 vmemmap init
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
In-Reply-To: <20261113033442.62970-3-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-3-songmuchun@bytedance.com>
Date: Mon, 16 Nov 2026 12:42:48 +0200
Message-Id: <179482576829.2379196.14337146328165617703.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Boot-time HugeTLB allocation has to initialize tail struct pages itself
> when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
> gigantic pages, this can cover a large number of tail pages.  Most state
> installed by __init_single_page() and prep_compound_tail() is identical
> for every tail page in the same huge page; only PFN-dependent fields need
> refreshing.
> 
> Initialize the first tail page normally, then initialize the remaining
> tails with hugetlb_init_tail_page().  This copies the already
> initialized first tail page with memcpy() and refreshes only the
> PFN-dependent fields in the destination page, while avoiding the full
> __init_single_page() and prep_compound_tail() sequence for state that is
> identical across tail pages in the same huge page.
> 
> The fallback path was measured on a v7.4-rc2 base with a temporary
> jiffies-based printk modeled after the existing timing in
> memmap_init_zone_device(), using 4K base pages and 64 boot-time 1G
> hugepages.  HVO is unavailable on arm64; on x86-64,
> hugetlb_free_vmemmap=off was used to exercise the fallback path.
> 
>   arch    base      with this patch  reduction
>   arm64   360.8 ms  256.0 ms         29.05%
>   x86-64  171.0 ms  165.0 ms          3.51%
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  mm/hugetlb.c | 23 ++++++++++++++++++-----
>  mm/mm_init.c |  5 ++++-
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cb2de24affdc4..d70ed37d2553b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  	enum zone_type zone = folio_zonenum(folio);
>  	int nid = folio_nid(folio);
>  	struct page *page = folio_page(folio, start_page_number);
> +	struct page template;
>  	unsigned long head_pfn = folio_pfn(folio);
>  	unsigned long pfn, end_pfn = head_pfn + end_page_number;
>  	unsigned int order = huge_page_order(h);
> @@ -3247,11 +3248,23 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
>  	 * we must initialize them ourselves here.
>  	 */
> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
> -		__init_single_page(page, pfn, zone, nid);
> -		prep_compound_tail(page, &folio->page, order);
> -		set_page_count(page, 0);
> -	}
> +	if (start_page_number >= end_page_number)
> +		return;
> +
> +	pfn = head_pfn + start_page_number;
> +
> +	/*
> +	 * Seed a template from the first real tail page and refresh only
> +	 * PFN-dependent fields before copying it.
> +	 */
> +	__init_single_page(page, pfn, zone, nid);
> +	prep_compound_tail(page, &folio->page, order);
> +	set_page_count(page, 0);
> +	memcpy(&template, page, sizeof(template));
> +
> +	for (pfn++; pfn < end_pfn; pfn++)
> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
> +					       folio_zone(folio), &template);
>  }
>  
>  static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f16a047796c88..934512bceda39 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -719,7 +719,10 @@ void __meminit memmap_init_page_from_template(struct page *page,
>  	if (!is_highmem_idx(zone_idx(zone)))
>  		set_page_address(template, __va(pfn << PAGE_SHIFT));
>  #endif
> -	memcpy_nontemporal(page, template, sizeof(*page));
> +	if(zone_is_zone_device(zone))

Nit: missing space after "if".

The comment at the beginning of memmap_init_page_from_template() still
talks about "the non-temporal copy", which is now true only for
ZONE_DEVICE.

-- 
Sincerely yours,
Mike.


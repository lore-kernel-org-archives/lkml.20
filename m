Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825785;
	b=H12pxyNh2xyJiLNir8bkpX74+TSA/tAoskQHmcFG6sJIFsucF3VdZPJb1RwqvhlbkXZh
	 hlg7o+g6AkNhtUf6vbv47Wu+xitZLPbq/CUp9nWXLqslaybdM/bRRp4fdrGq5Y2c1/bHM
	 r3MLJJJbKhSyBpWDxdERkuDKN4wt/Yp6A0+cpzBSK0KV+K3Ys26YNXqSepqmwuZT12AYv
	 u4+xaqvkZfQ/k5fV3Rl+Zx3HxSNZBgESTM/7uYpFZlk/ZFNcRDHI/1IvFdCsS/EID/dPP
	 t+Ct4tMCK7nUlDIBMtk2nk2up66LSljZr1FOQJ+KoVHda8v+ML5mh9u6oIucTemPT+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825785;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=z6AXf0siXdDWvTk64l5wL4TOepYq/+Ur1vzvg0dCyJA=;
	b=DVhqtvWwc3KNtIokQfJdTDdhgkTy4VHYl5bTMSK3CEjJZYfh/I+nuPu+Yd7VFDXxelGq
	 nc//CQVatPw/Sk/yBsnvBD2gNlaVs1j1ui2CbSkZI14otcEs3EQHBe8u1R2GwfLJh87Wk
	 2XO1ZAaobJbYP26Zam2lHeFciHzBibbEtapNXGcLvySqQsptFNN+S4bvLnraml+OZe7nH
	 qTChBXmv+DNA3/rFlzkb6yuCjaSdxg+5Ha/KENKaHvEu5ugqtZKMDlRQh521WxeRUJ74y
	 V1Ev5AqGscmJHzVGzZiGxS/jPrcPzFwpi/1w0cIafgmxsWZOWxw1FyVNpgCuZ+uICwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS+w2cy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62316606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS+w2cy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4961F000D0;
	Mon, 16 Nov 2026 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825784;
	bh=z6AXf0siXdDWvTk64l5wL4TOepYq/+Ur1vzvg0dCyJA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LS+w2cy0vGEr9WdSp4cnovx0NKyZkKklwL9lzx14eRcHKdgIyBEl+AiKIkLSU2CpL
	 RXopJ7DfT3NDkhWV+PauZ7u6ernGjkM1cE7NVC8Fsli0N72mfUiDjn/5QGn2NEwWCB
	 +c45IvJBwSeJgD63I+T7kepVMH0WK+22zq/Wv1XRZ+1obkD37/K0ARf2ncY4EilRLF
	 hKcEFXo9ZQI/uAA760lHOzJC3eAokAL2CdH0ahIEs2MY3rXJOvkmORu2sOsEZ8qgkz
	 Zymg9q8dUiiub+Mjt169OOmqlPLaQCFnH+ws877YImPJkiTuWa+Dx5h3jwj+7frNTm
	 6GDWQHreFp3bw==
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
Subject: Re: [PATCH v2 04/14] mm/mm_init: factor out common struct page
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
In-Reply-To: <20261113033442.62970-5-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-5-songmuchun@bytedance.com>
Date: Mon, 16 Nov 2026 12:42:48 +0200
Message-Id: <179482576829.2379196.2091312590305150578.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Several struct page fields have the same initial values for every page in
> a zone. __init_single_page() initializes this state as part of its
> per-page setup, while the shared vmemmap tail path open-codes only a
> subset.
> 
> Factor the PFN-independent state into memmap_init_page_common() and use
> it for both regular and shared tail struct pages. Keep section-, PFN-
> and instance-specific initialization in __init_single_page().
> 
> This also initializes the last cpupid and KASAN tag for shared tail
> struct pages consistently with regular struct pages.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Remove __meminit from memmap_init_page_common() so HVO shared tail
>   pages can call it after init text is freed (reported by Sashiko).
> ---
>  include/linux/mm.h  |  8 --------
>  mm/mm_init.c        | 22 +++++++++++++++++-----
>  mm/mm_init.h        |  1 +
>  mm/sparse-vmemmap.c |  7 +------
>  4 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 77b5d450fe45b..2e182498898ec 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3022,14 +3022,6 @@ static inline void set_page_node(struct page *page, unsigned long node)
>  	page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
>  }
>  
> -static inline void set_page_links(struct page *page, enum zone_type zone,
> -	unsigned long node, unsigned long pfn)
> -{
> -	set_page_zone(page, zone);
> -	set_page_node(page, node);
> -	set_page_section_from_pfn(page, pfn);
> -}
> -
>  /**
>   * folio_nr_pages - The number of pages in the folio.
>   * @folio: The folio.
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index af3b81733193b..d0a11989bd249 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -602,15 +602,27 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
>  			page_zone_id(page));
>  }
>  
> -void __meminit __init_single_page(struct page *page, unsigned long pfn,
> -				unsigned long zone, int nid)
> +/* Initialize PFN-independent fields common to pages in the same zone. */
> +void memmap_init_page_common(struct page *page, enum zone_type zone, int nid)

I don't think _common adds much here, memmap_init_page() would do.

>  {
>  	mm_zero_struct_page(page);
> -	set_page_links(page, zone, nid, pfn);
> -	init_page_count(page);
> -	atomic_set(&page->_mapcount, -1);
> +	set_page_zone(page, zone);
> +	set_page_node(page, nid);
>  	page_cpupid_reset_last(page);
>  	page_kasan_tag_reset(page);
> +	atomic_set(&page->_mapcount, -1);
> +#ifdef CONFIG_ZONE_DEVICE
> +	if (zone == ZONE_DEVICE)
> +		__SetPageReserved(page);
> +#endif

Can't we keep this in ZONE_DEVICE part?

If we can't, __init_single_page() sets PG_reserved for ZONE_DEVICE pages
and the

if (zone == ZONE_DEVICE)
	__SetPageReserved(page);

in the MEMINIT_HOTPLUG part of memmap_init_range() becomes redundant.

-- 
Sincerely yours,
Mike.


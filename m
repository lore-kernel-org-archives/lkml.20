Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD53DB983;
	Thu, 10 Sep 2026 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026806; cv=none; b=Jyw6sF9PVYfp5OwPscsatQuJvTdihkqQJMg5QX4x6OqJkZSL7/cGewwTOXclMtIWGuKVeJBhGgJulV1FSrplwXcCWVDXM4XecF2ZbEllxXdBC3cuDl+0UfhjCgrGpbXqIapdJw0FBlv0vurBXm5tIxCnA1J8utGmWXVZWddxT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026806; c=relaxed/simple;
	bh=RSdCzkYrR5h/cJKalhMpI2wCIS1TDFpoO7krbevk3UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1m7EeKj/cKkj4O0tYBcYsMkJDZjFgwr3dbzYSKfq9TpbDQBpi+jjLwSnbX2OsOQM35GAdyZrRDXKTC+KnrMS17lI+goNTxPB3o1iYQAdRatHfrfXfP3Cm5do1JX4jk71Pt9afwQ6MyDl7tSin8ZRDRTiQPNTOMgxNO4sKIEflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhV9mmVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhV9mmVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5A31F0089A;
	Thu, 10 Sep 2026 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026805;
	bh=KRB916lj3l/kaoIROZgvEq5UY1QI+PbW3M7goiEHvOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PhV9mmVJj8HaWPabBYhvMSsgZMBm/iNmNrVKbOAwBrvBUDAS3kQzPqHIsoQoErIZ+
	 kUhMB7AiLoWxhuQwHEtRsLJ+TcYl/HFfQkIH0iosT9Vlfk/ZtkRrN7667NE1qNLDHA
	 3AWysrlhQkVoPGtjqmN2K0E1FN0qTC1lIjb5S6M3W7UXsmbTNfwG4r9hY0DDdOA4r9
	 39KEZ4ww4zwmSXesWcJRj8jYzQ6s5AlQXWTz5KJiYZ7+480u/c5Ev5cs/GMeJ6Ikl5
	 m+vjuqsmPW9pRo8g5Hx1mk/LubFTe1VuqHcmHEu7leARLCHxOafE/t+y+DHmEzvslm
	 eEdS7mvZL1hnw==
Message-ID: <b803e45f-76c2-44bd-a913-9ce310319f41@kernel.org>
Date: Thu, 10 Sep 2026 09:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] mm/sparse-vmemmap: open-code
 init_compound_tail()
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-4-songmuchun@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260908030335.96549-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 05:03, Muchun Song wrote:
> init_compound_tail() is only used by vmemmap_shared_tail_page(), where
> the shared tail page setup intentionally passes NULL as the compound head.
> 
> Keeping this helper in mm/internal.h exposes that special case to the rest
> of the MM code and can make the NULL head argument look generally valid.
> Open-code the initialization at the only call site so the special-case use
> stays local to sparse vmemmap optimization.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> ---
> v2:
> - Collect Acked-by from Qi Zheng
> ---
>  mm/internal.h       | 9 ---------
>  mm/sparse-vmemmap.c | 5 ++++-
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index da14c56fb24e..0dca33db068f 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -786,15 +786,6 @@ static inline void prep_compound_tail(struct page *tail,
>  	VM_WARN_ON_ONCE(tail->private);
>  }
>  
> -static inline void init_compound_tail(struct page *tail,
> -		const struct page *head, unsigned int order, struct zone *zone)
> -{
> -	atomic_set(&tail->_mapcount, -1);
> -	set_page_node(tail, zone_to_nid(zone));
> -	set_page_zone(tail, zone_idx(zone));
> -	prep_compound_tail(tail, head, order);
> -}
> -
>  #if defined CONFIG_COMPACTION || defined CONFIG_CMA
>  
>  /*
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 70143dd8b579..e453ce4675a0 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -189,7 +189,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
>  	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
>  		page = (struct page *)addr + i;
>  		mm_zero_struct_page(page);
> -		init_compound_tail(page, NULL, order, zone);
> +		atomic_set(&page->_mapcount, -1);
> +		set_page_node(page, zone_to_nid(zone));
> +		set_page_zone(page, zone_idx(zone));
> +		prep_compound_tail(page, NULL, order);
>  	}
>  
>  	page = virt_to_page(addr);

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

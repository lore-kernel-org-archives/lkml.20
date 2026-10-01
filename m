Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68EE42E8F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865783; cv=none; b=Mnk5oAwqkXUv6xekrczUtVYQfJh56xtwG43+S3CE0PyQDl6OU1h1zp7ujYDIalt0V/donkGFCiYhA5DH7rPOYXEjxVHB1F30hq9FNk++DaWLCuyQ0upSbZDJ3IEQazlwEQXT7EVIDR49Y3tOcPTZpddWHqnuZa0GgHlEoZXofCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865783; c=relaxed/simple;
	bh=DI2fXTuDV05IIDDvF9K+RPS6mR9kYxsrORWkKiLOiqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saqHl9a4DW3/UpIuPHBim+WofiNjZkINJnfCczAnajFbni90bFRHMI/KVs11RabeOLJR5S8/dLeVe8nD7BvekMMUJu0sVQgY/1vioFeLtUNIc+qVda09sQYRaZUlLe0zN311bVogIcJTTszYVYRF2Fv25k08PxKt6XwsQoa4TkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATQ8I74B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATQ8I74B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AFF1F000FF;
	Thu,  1 Oct 2026 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865781;
	bh=mE8ugBn4aBPJ3MiNkA50lNnSRYdI1uITSgWQ30TMfOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ATQ8I74BR/BF6dUU++SXaq7I6Ck1VUK8xU6ciYD+3Yq9OVtY7acRBm1+vz/B65lHl
	 DF1YRe85C4R5RAMbAtbtHRrR80IEigqMuLFCyhcR+AaFk1VSlQYZZu5BQrNbBURuMG
	 syBdLUPqfXrl80oACFAlymuTJazq0Cmj7BieKQYbiPoqoedYOIm/PDYpnFoe8B0WJn
	 z84v0wjUNNjYIsznTbXcj79Q1zEf3omB7I/CvLt4BkMPUk1Kv0LziIJUwOuu5NevHH
	 aHlJHZZutXIab/4oxymEt5BTLNWAW1l1MJHo/BdxL+viezsQ9ccvB921pMRlzrwjff
	 MLpY18Z/6cO9w==
Date: Thu, 1 Oct 2026 16:42:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, muchun.song@linux.dev
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page
 init
Message-ID: <ar5xbQsUpSQZg0wO@kernel.org>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929053231.66085-7-songmuchun@bytedance.com>

Hi Muchun,

On Tue, Sep 29, 2026 at 01:32:31PM +0800, Muchun Song wrote:
> For vmemmap-optimized sections, tail struct pages may be backed by
> shared vmemmap pages. Those shared pages must carry the same page zone
> ID as the struct pages initialized for the section.
> 
> Warn in __init_single_page() if the shared tail page has a different
> page_zone_id(), which would indicate inconsistent initialization.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> ---
> v3:
> - Collect Acked-by from Qi Zheng
> 
> v2:
> - New patch.
> ---
>  mm/mm_init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1650d6bc1211..bd02e8d06965 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>  	if (!is_highmem_idx(zone))
>  		set_page_address(page, __va(pfn << PAGE_SHIFT));
>  #endif
> +	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
> +			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
> +			page_zone_id(page));

Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad later
than page so it'll have stale data in the page->flags, won't it?

>  }
>  
>  #ifdef CONFIG_NUMA
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.

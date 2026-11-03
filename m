Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724513;
	b=HYtf93G24F1zHH8LZPof9h3dJFJ7zBJX+ChUPdj1MoWcxEWSPo0DAguXRQnUy6SdMQQF
	 jFhnRcw21HgGX9i+HjcqI7rBl7Uki4fCQBTqf4siEpL7AuDvF72NAjmKGD9Sg0/6fpuzE
	 B/iqxEdDjAkNeIjKbDLkEwCoQdZt5+Otduu1p5PdlDdupfsEzVBiscyTsjVCv9TZUBer6
	 BvkHFhzduqMMWXT+s8WnVIao1uQ1hzypuWJ5itmfHDgXy8aV875DF9iRG8c59EAIqs5s9
	 tEaN7CLcOAR/32lPgTbMuachOs/7Y70dfE/seHpoaSGthKWu8Ku5DeEiS8ZyTa1SD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724513;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fzxroPSjg7djG2/E7Jnxw7+FksX3byDhaT1k3G3X82E=;
	b=ih7bJOotBLUsvirUIj/CrKK/M0gfD85S1FnHcyZXswzAHIcmx8L6ac7u41yWRIHAoTTb
	 RfZaWcnga+/LjHojdzxvlBqUu3XFxlUTyw4LTvxeIr8VWs5G11ZF/epvMFG/mjOlJrDLZ
	 TYrfgp8d4h6Pk5Lu5epOCEvz7vNS3nrS0nxJVkAqLzGH90HHUgxxYmMnmjKv6FVXo6RYx
	 v0T14Tj6dsFHhxqamfgLlkNVKFcVPbAfumSi38oPQXkO0Jq0NtPX//GNjIX3JCWDi+wvO
	 pfkdev/VvcYlGQeIrT9XI5cmBLVcuG3v0Zs1OH9Jt0h47ahE3xpWKhI5yldvJEPLxEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKjb+uZv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A9606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKjb+uZv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5847A1F00919;
	Tue,  3 Nov 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724512;
	bh=fzxroPSjg7djG2/E7Jnxw7+FksX3byDhaT1k3G3X82E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kKjb+uZvI/3jfX+ELwR4splMxe7pwzFhYBfrEt9iyYiE1DL9agVZLgu3AJaB0Y0IB
	 cApJ7w8OpkUG+ML/D8IwVmrjfyjr86K+f/UdCFMk8NKuQLpd+e8GPXslyhq/B/x+dl
	 pj9IrnJGZQU1YkYGOwdnOwzZVlVulhz+D1rowr93yTki3O8fxTsbcjYqdVujZ2t14B
	 dsgoqZNxFV1Ss/jx4YEbSLc2rtu03+rnhS4BrlRc1TmE9E24lj/+ALEd6WUpmcMCib
	 MhO5IXpTxw9Z75N/06GFpCORtyDW5cF76LRcFDz193BlrU98AKGkx4OiQoSRoahLgO
	 gpAK6EE+MzGKQ==
Message-ID: <85bbc54e-4c77-4385-9119-590f6c97aa2e@kernel.org>
Date: Tue, 3 Nov 2026 17:48:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/page_alloc: more checks for
 alloc_contig_frozen_range() with __GFP_COMP
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Zhenghui Hao <zhenghui.hao@qq.com>,
 Brendan Jackman <brendan.jackman@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261102-free-pfn-on-alloc-contig-range-error-path-v2-1-a9fe939a85c3@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261102-free-pfn-on-alloc-contig-range-error-path-v2-1-a9fe939a85c3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 17:24, Zi Yan wrote:
> When alloc_contig_frozen_range() is called with __GFP_COMP, certain inputs
> can cause a mismatch between a requested range and its allocated range,
> leading to the WARN at the end of the function and page leaks. No in-tree
> user passes such inputs. Add checks to prevent it:
> 
> 1. the order is at least MAX_PAGE_ORDER: free pages during isolation can
>    merge up to MAX_PAGE_ORDER, extending the allocated range beyond the
>    requested range;
> 2. the number of pages in the range is a power of 2: ilog2() can round
>    down, so that the compound page will not cover the requested range;
> 3. start and end are naturally aligned to nr_pages: a compound page must be
>    naturally aligned, and the unaligned range can also lead to a mismatched
>    allocated range.
> 
> Because of check 2, the same power of 2 at the end is redundant and
> removed.
> 
> Add a comment on the WARN path to clarify it should not be reachable, so no
> one in the future will try to fix the impossible page leak.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260628-keep-subpage-private-zero-at-free-v1-0-f4ce3930d10f%40nvidia.com?part=1
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
> Sashiko reports that if alloc_contig_frozen_range() with __GFP_COMP can
> allocate a free page range different from the requested range, the function
> triggers a WARN and returns EINVAL without freeing the allocated PFNs and
> causes free memory leaks. Add checks to prevent it.
> 
> The is_power_of_2() check and start PFN alignment check are added with the
> help of LLM.
> ---
> Changes in v2:
> 1. added 3 checks for __GFP_COMP to prevent the allocated range from
>    mismatching the requested range, which can trigger the warning.
> 2. removed the redundant power of 2 check at the end of the function.
> 3. added a comment on the WARN path to clarify it becomes unreachable.
> 4. dropped Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20260629-free-pfn-on-alloc-contig-range-error-path-v1-1-496ff9ca22db@nvidia.com
> ---
>  mm/page_alloc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 15ff5c1feef4f..003911ef393be 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7326,12 +7326,24 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
>  					    PB_ISOLATE_MODE_OTHER;
>  
>  	/*
> -	 * In contrast to the buddy, we allow for orders here that exceed
> -	 * MAX_PAGE_ORDER, so we must manually make sure that we are not
> -	 * exceeding the maximum folio order.
> +	 * The use of __GFP_COMP has the following requirements:
> +	 * 1. the order cannot exceed MAX_FOLIO_ORDER (>MAX_PAGE_ORDER is OK);
> +	 * 2. the order is at least MAX_PAGE_ORDER to ensure at the end
> +	 *    outer_start and outer_end match start and end respectively;
> +	 * 3. the number of pages in the range is a power of 2;
> +	 * 4. start and end are naturally aligned to nr_pages.
> +	 *
> +	 * 3 and 4 are also the requirements for __GFP_COMP pages in general.
>  	 */
> -	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
> -		return -EINVAL;
> +	if (gfp_mask & __GFP_COMP) {
> +		const unsigned long nr_pages = end - start;
> +
> +		if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER ||
> +				 order < MAX_PAGE_ORDER ||
> +				 !is_power_of_2(nr_pages) ||
> +				 !IS_ALIGNED(start, nr_pages)))
> +			return -EINVAL;
> +	}
>  
>  	gfp_mask = current_gfp_context(gfp_mask);
>  	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
> @@ -7428,12 +7440,13 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
>  			__free_contig_frozen_range(outer_start, start - outer_start);
>  		if (end != outer_end)
>  			__free_contig_frozen_range(end, outer_end - end);
> -	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
> +	} else if (start == outer_start && end == outer_end) {
>  		struct page *head = pfn_to_page(start);
>  
>  		check_new_pages(head, order);
>  		prep_new_page(head, order, gfp_mask, ALLOC_DEFAULT);
>  	} else {
> +		/* Unreachable with the __GFP_COMP checks above */
>  		ret = -EINVAL;
>  		WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
>  		     start, end, outer_start, outer_end);
> 
> ---
> base-commit: afb4eea28037fa55c4560313ecbd8a1e1da8369a
> change-id: 20260629-free-pfn-on-alloc-contig-range-error-path-acc001232468
> 
> Best regards,
> --  
> Yan, Zi
> 

Thanks!

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

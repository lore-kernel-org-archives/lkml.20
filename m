Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726948;
	b=AMcCSqieQnELMCah22an/rWB6bUKkh6d9VzTHVjbqm8bsjkyhs1katfLsOn828L9ERl3
	 QyeHmC8tzXfUlgKyuKwwMEAdorE7Tqtx0Su/s11fgS32+jLud1ag4TozzqgKJDNBmaxtl
	 2Wd+hNqKb5tiuEchNRAOWVnFxldyH9SBDtf5hDqcvhuogUsx3/i4DpbyNksazilDeMWNP
	 V/Rq3Eb809LdhEigHTt16DBzmsHxtAs8o87duPFDe8CkW/dC2nYZT/YccKiBuJ2rFCoQ/
	 LspV23e8uy+JjIaKGvITKAt8HQ7WSLuwPGTCDWiZz+5gY+KhPA/ViItzwy9t5CQpZIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726948;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pE2Np3lykFq0oDsMz7rUAvpVPt/uIba14MNTRAnJoec=;
	b=U3Mp3FQWJSWjUA9YS2sNSZo8kABBUlIBawnFFExLL+V0z3fgbwa/ssS4uaWmPeOmgcWe
	 TgGHUFiIdj2yMpvyH8/Vsq2KjFhiEn6Sh7s4Z62m8FOiPD9VBb3Y5wr36Vvy8BM181dTh
	 3J4AU0rn9UaAQRk1f9sWsD99j2/1UymqXtLbj9zIS2zdoifgmm1RJzQineGpVE2J2WtfA
	 R7QQNoolOCxBA/c7iK1UyYShtyOUBslauXLoPZi94+reCB5kePHjuSnYhFyDy50qXDt63
	 C/rq7cW53mtfnpLSNM2OfW1NSwd9XtKclBL0e9sOJ3VRYIa7dHR/XJ4EDV0hybtk43w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fy1CbYfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fy1CbYfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1F21F000C1;
	Tue,  3 Nov 2026 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793726948;
	bh=pE2Np3lykFq0oDsMz7rUAvpVPt/uIba14MNTRAnJoec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fy1CbYfrBs/Oux4o7jViXIGWEjIp2SDX+seRNw7Osj6jbA3F09gjrUVe3UA/OnvLt
	 VhGGVqXvEKuqTUhqp3qaK3noQrRPsl6TJbZKaM+bX+Kqq2+MZVjVfzkhaQy7WJLmgm
	 Mmp/LSVU75Ud8eS4Z92xbyopCXI39NYTrhXg9YTq/V1RW+G2UfGCoT6t1ow8LUtiWw
	 8PdgVvYMPG1bANAUARF5B3jAKQZpbP2PwgCVQX8z9xHdPR87XKeoDJya1dqbcpfZtK
	 IRdvMVLjIFD1aiFS+19JQ8/rZKQdHmsBcQrNPyyeW6kaNTOz3GNkmibgE9INLsL2jx
	 P91CV6KLqp8KA==
Message-ID: <28a08334-b52f-49ca-a209-624520864605@kernel.org>
Date: Tue, 3 Nov 2026 18:29:03 +0100
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
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Zhenghui Hao <zhenghui.hao@qq.com>,
 Brendan Jackman <brendan.jackman@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261102-free-pfn-on-alloc-contig-range-error-path-v2-1-a9fe939a85c3@nvidia.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
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

Applied to page_alloc/for-next, thanks!

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


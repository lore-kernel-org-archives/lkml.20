Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E847427A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839998; cv=none; b=lVfQojOzrcmKigRILTkoRPIh0yQpe1ScSOdGQK8eQfUwVr6Npx8ksoOrdXKDAYTXDj6nBMum0YEOBhyE3vKb75s4aq1CuM4BcVYfSPgsX+/hbkqEpabH8m/xOtt0YRga8+drONWI59CBZPdPzsyT6gW4b1JCztZG2Qs5H1iam9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839998; c=relaxed/simple;
	bh=Xr3CbzA7QclSa6fX2S6eiRffWE8lpDZbK1+QVGUpIsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y849sxSW20tA1dEOwgUHA+aCfxzBvovZDqhz0dDoFpFvPXaZWdbn8PjlbL1v2OL6zHwVx8U60+e5henhjCnBTe9n3n1lSgPZ1z89jHrgdnQ/a0veWMECCbRPtcWxnxVzAZTdZywNYUUE+MBabsuUKL7+YRhCUREiIEHofE9TdEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ds09ofY7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dxAIGk0P; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ds09ofY7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dxAIGk0P"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 37EE213801E7;
	Thu, 27 Aug 2026 10:13:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 10:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787839995; x=
	1787847195; bh=a+ad3PWrXwgTs5V91pQ1swMOoVBYuDGaQPrZTnXXjJY=; b=d
	s09ofY7ELOFH7RFgsvJ+emVZ/K8ZKNZ4+19jt40VhFb9thzys/ihqVT53zykCsDL
	BU/CTT+WD8gbFggtD4N1Z/gYmSILTA0nYnczsZ2GrDkBiYGJZhmi1zK3NR7uOFVr
	ZXM/wWj4eH+ZnGJBdN4wu9bCb/Ig5xgZtVgMeh4N+B/UoCwxWELzmQBxLuh9QkaS
	i+tIh4Q4jYNPMEcTPhzfPCbb+XWek7rt+TNBiGoLexkyuAi7NPcNIEFht8ftHs6o
	zLazJuIm0f6z2eOueSppO/vfCbtLd59GRgrjm5ZDX69oaAM61MYIzTbXJWu66Es2
	FxM5JuZSSzZFeX61oDuCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787839995; x=1787847195; bh=a+ad3PWrXwgTs5V91pQ1swMOoVBYuDGaQPr
	ZTnXXjJY=; b=dxAIGk0P0dHb8eQw+3a/USTt2FMJUs9Q32QnFiFe5CwjR4+XMq2
	RbmQUNENpHzo6wnzk9Zkx/k6AlxEKCHCOwlM+VXKhQWXYeBVcSSpOP0yExNM/2kV
	Al52kMEOx3afn6l1P8D9KrEzxD1VYPHHvLhaS7HA8x/awIijyC5JKWLxTmA1jh82
	JN4gx0RR2wYsScEYDKqTktsdoa/z9bVdXxJtyOAgfnrlTIAP2/ZNIR/YQ8xo7nHH
	vkalDXl4BLVvhjsSL+WwXZ9ovDUGsiZqxprylyZnm3YvPBeuEAA26VLP0RyAM4La
	aQOI9v047lx78LTxHRr/GFDfcOCCQCsuXfQ==
X-ME-Sender: <xms:-UWQagu2AJDZRbZ9-eQuu4sa7U66wg7jz1LfQ80-Kz0pEGzxilQYsw>
    <xme:-UWQavfra08ahe8CNDRwGZBZC0A7jsn8z8PTKts8Cv3x5xAY126zStkbDj4M3M9lk
    965MY6TiqwlPA-F2dGm3px7G1-DUnNOtXW3aG1KZ6MdBw4gghcL5hBi>
X-ME-Received: <xmr:-UWQagEX4jKyN3omyOG79EXEVPZc7LGzkFH98japSGv0G1xgNvIGqJXFSQM>
X-ME-Proxy-Cause: dmFkZTF5zwx6+vi1CF17Vvppug3FxN3o2hxSLt1bKKQt8LhiFApBJj51ijsaN2etDF3CDd
    jqq4P8ChL6OV5M81X6rGtEQ9HTYKgxocCr8ggIyBphA45QUrYa1nXXmbgDGuOTRWkx9Xau
    SFmtpywzmW0SYl5OeCOC/4Tdnt0GRfSbJkzrb7eQH2kHukPsFyTbcQ8v+oXGpdakNYvUKI
    9MARg7kD2h5P6L7fS2+NE6AoNGx3NuLZFIWxLV7F8ZfrFis+014diWNTTJu0aAeY7JNZaO
    WUkxfXJAa3o7ME6TrOvHV2hSdgYqeD4MdhHPLdiqonry5W1XSlRC4Ij1WbSW7qYH9Rdqe/
    6L0doc8mwOZYaqctOvFuYBOOY7U0AXBV6NWpi4rJKINiqzbe9xUaPOG8EFoQl8ZPa7hyzJ
    DAkI01TSGQlVZNxTuZLhOxIEgKDLmeajtPS8ayOOyrIpPkAlB/HDVqnJwKr27tzY4QDTME
    SEKW9gLt0Hz1nipQej1ZkfIZaXaXh7Ux/MvHrAf8cQ/FI1UgOcW/pCHmPKcbISFHROPo2e
    6rmR+9wXMqn6BdRsDneHCGxSsNGhgoGJOan045RacdmOwSEa7KHC17RR280qx5T3owUq/l
    HAbYT0q5Il0ICsWu7mhVBzrvwxivyNXjn1sSuVHmoLwK9Gj0fK3o76DGf6fQ
X-ME-Proxy: <xmx:-UWQarbNvv8yjLkZjvIlLbSuqEQxQspE7i9TRInWVNMGTH7ExKguFw>
    <xmx:-UWQaqrPeJPUPtepQDuRNPDf9TbubfzMmDu4-YhZVT6Gj4UlzKxPaw>
    <xmx:-UWQam3a6avKB9D368k3MNYgR3FVZs7A6k_pEoHBBP_1CfecO6gElg>
    <xmx:-UWQaljTuWGMKzF5yXGkQP3rqGh7_Ku4DjVg1Wn_v2K6nh-SQbkqGA>
    <xmx:-0WQapakKIu6QhZD5MNiSIJYREhbFyemwoFhzcIgNCVF-jikbi8l6FHt>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:13:12 -0400 (EDT)
Date: Thu, 27 Aug 2026 15:13:11 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 01/18] mm/swap: fix off-by-one in swap cache replace
 sanity check
Message-ID: <apBFoq08OWOOM3yP@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-1-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-1-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:14AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The DEBUG_VM sanity check in __swap_cache_replace_folio() iterates
> the old folio's range with "while (ci_off++ < ci_end)", so the loop
> body runs on the already-incremented offset: the first entry is
> skipped and one entry past the range is read.  For a folio split
> that entry belongs to the first after-split folio and was just
> repointed by the replacement loop above, so the check would warn
> spuriously whenever sub-folio orders differ from the head folio's,
> as non-uniform swapcache splits now do.
> 
> Use the same do-while pattern as the replacement loop.
> 
> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

> ---
>  mm/swap_state.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index b76eb3d876fd..59a577f685b5 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -389,8 +389,9 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
>  	    folio_order(old) != folio_order(new)) {
>  		ci_off = swp_cluster_offset(old->swap);
>  		ci_end = ci_off + folio_nr_pages(old);
> -		while (ci_off++ < ci_end)
> +		do {
>  			WARN_ON_ONCE(swp_tb_to_folio(__swap_table_get(ci, ci_off)) != old);
> +		} while (++ci_off < ci_end);

I don't particularly like increment mixed with condition, but it seems
to be consistent with other swap code...

>  	}
>  }
>  
> 
> -- 
> 2.55.0
> 
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

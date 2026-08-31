Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0C3BED1E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165593; cv=none; b=ILpPSyCEcMfy9ODoeo3nptzy+Cd9e3d13d5inuhhwd6odCc1wxLgbBDM/wfRjrrc4Te105OyzA7aeonRSK9z3FuvJ3iG4PG6pVhYyVJn0/QJnnLz8Hcbxn2jgcB7oSkrpNONtZb4dCM4TpeWDLvVlRVCY+L7Se+RCAheqI3h0MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165593; c=relaxed/simple;
	bh=utckoeSR1/t1en4mS6r3oK78zFlDfOozYh43GTzPoM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvGPTPDRqy6bG3qOA77rwdgLeTo4aWHszVRjmMyieUrnIFRTfS2FCBiHT8dCvM0NI3f1TKxBNMcFdZVdXgmSqRk21AFDzZEcVLA2I0gqZo4vvXLljtFCgWPp3G1qzw8m457f7LEr0BHJqAAv++q7ILeIcTean9brBkgCVBkzN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlVQxh1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlVQxh1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5491D1F000E9;
	Mon, 31 Aug 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165591;
	bh=07DNzbG7Ea9A57I2ROWNCLeREPGQQY/UiEj2oMbahtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZlVQxh1pZrIF6IuHK9/Bj9Do89thFo+qT9twAC9fuI7+6I2wqDE704FVePsFSBjNY
	 jUE7kviO2nwi2wjPX26x5gFT5kZi1W8J4DF7VSOpe2y058l0QxnqAGHId73E6G9RYT
	 3m76imtPCrTX5e42fIJwR7AEetVz5WUXkvl9NAQT+bY0iTpC3VMh8+Mi15tB8IPy2s
	 mdkQYBwBPZi/91DaUq3zLSK1c7hgrGfkQblMr/xeN0cufEtvEwvUJaUCLNL4LpOIUu
	 5de49mrXyubaR14qUSd8vPitPPWs3+aqYzQ18SR7Wb9TopFDuQmf9md10Bfjb2NOxg
	 72bpVJcYXwWaA==
Message-ID: <140594c6-0a39-4799-96f3-bbda79b6d832@kernel.org>
Date: Mon, 31 Aug 2026 10:39:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] mm: adjust out-dated document of __GFP_NOFAIL
Content-Language: en-US
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260829025847.26779-1-richard.weiyang@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260829025847.26779-1-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/26 04:58, Wei Yang wrote:
> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
> with __GFP_NOFAIL") remove a warning on allocating large folio with
> __GFP_NOFAIL, which was placed there by commit 903edea6c53f ("mm: warn
> about illegal __GFP_NOFAIL usage in a more appropriate location and
> manner").
> 
> While in that commit, it also documented this behavior which is
> out-dated now.
> 
> Adjust the document to align to current code, and adjust the comment
> while at it.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> 
> ---
> v2:
>   * s/is adjusted/was placed there/ in change log
>   * instead of removing the document, say "is discouraged"
> 
> v1: https://lore.kernel.org/all/20260827030548.16631-1-richard.weiyang@gmail.com/T/#u
> ---
>  include/linux/gfp_types.h | 2 +-
>  mm/page_alloc.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> index 190191411009..bfd4c43ed777 100644
> --- a/include/linux/gfp_types.h
> +++ b/include/linux/gfp_types.h
> @@ -244,7 +244,7 @@ enum {
>   * definitely preferable to use the flag rather than opencode endless
>   * loop around allocator.
>   * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
> - * not supported. Please consider using kvmalloc() instead.
> + * discouraged. Please consider using kvmalloc() instead if possible.
>   */
>  #define __GFP_IO	((__force gfp_t)___GFP_IO)
>  #define __GFP_FS	((__force gfp_t)___GFP_FS)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index ab385bc252cc..146f7e0a9462 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>  
>  	if (unlikely(nofail)) {
>  		/*
> -		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
> +		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>  		 * otherwise, we may result in lockup.
>  		 */
>  		WARN_ON_ONCE(!can_direct_reclaim);


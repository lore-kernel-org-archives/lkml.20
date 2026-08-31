Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1333C584F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166894; cv=none; b=Fn2Tx6kMCcSVcNQ641NMlOCJsP3TO76QGNSrXSCJAkkGZCuKzl6jh4EDWsBVfrXCd56mRZgwgoJ/MMF3FmX+cdQnq3GtIwv7oqZEx+ve9vK67UAklXaQ1NsdQOAZq/FfMfsLx9ZhchGnH3krj0v9fywM/vfL/wutD/oHj6SRWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166894; c=relaxed/simple;
	bh=GGn5/FnwMdOylbNe2joCABYvSXnYHKiHqQwO2uRUNeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F73eMaccpGgvD59HA7d55sVBRy/6O/VKkuh72qyMyH6H3EhaterbFguQm+yJSpFS6QrPYHTy8qvjbQSEyyUVk05RalKDE3jyHjr/XN9pVlIVz/j4H05g/C+GWFiQUOM24JeNfnuLOM/xn31WaovNERL+Gbq0NNy9q4RZSBNzghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atsmSRP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atsmSRP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112871F000E9;
	Mon, 31 Aug 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166891;
	bh=IFUViO5z4Y+XAB5uPhbTOwoEc6WJIUEHXXu3zrTrA4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=atsmSRP0yTem4BuDZMH4FBRRe/Fsouc7fL5l8UIs5ZEdOAVY8OX6/MCoUiZ7Q6s6d
	 Q+cm5WB7bQ8BQyBa+QMyfw0iRTW+SQZ9cExjiQxMu0n4uCoPDSYLxuUaYJ7ONhma2i
	 PJFRtzXGzQEYNuHAlnSF50cdG6Vz62latGOGtA7OElUGUThBUq9jOhVrH05eI/TCqx
	 hMaUcgVbT7y4zoBmmejGF2ILrpS941ENdEqRS+RVqZgVqguSIL/YuY6tnU3Mh69RIO
	 EaQvXwYfqa8IiiGkygQxDD+lT9vlltnFEQY05yKUAIA7mCdE1FvGbZJqTtZ5nzh7Zq
	 V4lyv/5RfUhlg==
Date: Mon, 31 Aug 2026 10:01:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v2] mm: adjust out-dated document of __GFP_NOFAIL
Message-ID: <apVC3tNDMx0AGsQj@gremlin>
References: <20260829025847.26779-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829025847.26779-1-richard.weiyang@gmail.com>

On Sat, Aug 29, 2026 at 02:58:47AM +0000, Wei Yang wrote:
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

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

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
> --
> 2.34.1
>

--
Cheers, Lorenzo

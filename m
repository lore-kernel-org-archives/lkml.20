Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A8435EC0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452244; cv=none; b=QNB/jC1KoGAOHQYBd6yxMzqEPob2xnIUKiLeB41fbe2YheGZTzajkMMpdxGdF1rRjQuTXKai6Za+SvbWySo/fJy4NTgzbYcgcXuFB9z1kqASvT3Et0aH14iUv5EYcZOJw9oJdfumwfsWGkKJYMEyEwjh1RPkNWBOOmtY7dhjiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452244; c=relaxed/simple;
	bh=1nqtY/8WE4BZ9hpx0avpzh5tP57I6tTdQEcgFlDmBrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVCdAIFWefIjkyoOzxZfQY57dfyEZ+gZiRJRXhBIyS8V776FQMWdu9lNw2gQBq7vnR+HPAW8Ea9ixGa9tN4hnIhVnP348pJVTdevbsC4YlPioLM04KeKUaMHRf+SdxnWW+9rM3CYzfYhniaGLo9UgSD+rWMkPdlvEEMcFhHPKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMAaxlNn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMAaxlNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F4D1F00893;
	Tue, 15 Sep 2026 06:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789452240;
	bh=8vCQE5R3+C/PNtR9Gpe0u3TKggkO3uc52l+x3OETu2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mMAaxlNnxdyl4mQxQyS/wkmDUx3chMaHciqE9DrDRwHke7Oyow2NxXwO8bFqHRs6Z
	 HQ/HbnfmXSgMapZcx//yZOtdcpBvP1pr2FSVxJyLQ/2CiIc9xqC+wc0IF48YOihe95
	 KVzUKgKfirySdLJY0oXOyyaUWo12vbxHe8UNYJMa0eCkfqlZM3bZFFcPPRXaNM5X6u
	 gzQCnmP5s+lGJjhCJ6m7ObDGNU0MUiVSgRTN/XfCTi6Fr75Dx+NlUlicWK2IqCFWjA
	 OfqeeLZaMsCBzYq3GhCQkALmwm5CtO4MiEpo0SqgdfLs6RCF0yheIC/HXVxKr8dJq4
	 Xn+Cg1UCgEWxg==
Date: Tue, 15 Sep 2026 09:03:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Yuan Liu <yuan1.liu@intel.com>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Jason Zeng <jason.zeng@intel.com>, Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>, Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Message-ID: <aqjfyGeQaL4g2EcA@kernel.org>
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
 <20260914072929.1883794-3-yuan1.liu@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914072929.1883794-3-yuan1.liu@intel.com>

Hi,

On Mon, Sep 14, 2026 at 03:29:29AM -0400, Yuan Liu wrote:
> When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
> zone, set_zone_contiguous() rescans the entire zone pageblock-by-pageblock
> to rebuild zone->contiguous. For large zones this is a significant cost
> during memory hotplug and hot-unplug.
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1533aebafb68..d40a8ff23370 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -817,22 +817,39 @@ void __meminit init_deferred_page(unsigned long pfn, int nid)
>   *   zone/node above the hole except for the trailing pages in the last
>   *   section that will be appended to the zone/node below.
>   */
> -static void __init init_unavailable_range(unsigned long spfn,
> -					  unsigned long epfn,
> -					  int zone, int node)
> +static unsigned long __init init_unavailable_range(unsigned long spfn,
> +						   unsigned long epfn,
> +						   int zone, int node)
>  {
> +	unsigned long next_chunk_pfn __maybe_unused = spfn;
>  	unsigned long pfn;
> -	u64 pgcnt = 0;
> +	u64 online_pgcnt = 0, pgcnt = 0;
> +	bool is_online = true;
>  
>  	for_each_valid_pfn(pfn, spfn, epfn) {
>  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>  		__SetPageReserved(pfn_to_page(pfn));
>  		pgcnt++;
> +
> +		/*
> +		 * With vmemmap, at this stage all pages in an early section
> +		 * have a valid memmap and are marked as online. However, only
> +		 * subsections in the subsection map are actually online.
> +		 */

I'm having trouble parsing this comment. Shouldn't is say that some
subsections in a section can be offline because of holes?

Other than that

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +		if (pfn >= next_chunk_pfn) {
> +			is_online = pfn_section_valid(__pfn_to_section(pfn), pfn);
> +			next_chunk_pfn = min(SUBSECTION_ALIGN_UP(pfn + 1), epfn);
> +		}
> +#endif
> +		if (is_online)
> +			online_pgcnt++;
>  	}
>  
>  	if (pgcnt)
>  		pr_info("On node %d, zone %s: %lld pages in unavailable ranges\n",
>  			node, zone_names[zone], pgcnt);
> +	return online_pgcnt;
>  }
>  
>  /*

-- 
Sincerely yours,
Mike.

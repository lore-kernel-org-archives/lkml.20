Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388C22D7A1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271537; cv=none; b=sGwLoNthnyLS/6Ms+BLrF/w8MMYUJd1aig1HBpIeHthflhr7UM2xldH7WV8JtZJHoVhfIU0l+OMrVt4kGIJG46aboNxUZQzgcdSZrRM2k0LqpyRZSVgSJO7oh3yGCTpVbGCr6B7kEiEUdj+OoxHVSUyQBrRnbGTndnpxBx3lnLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271537; c=relaxed/simple;
	bh=TwAbBY/6OMez7hRW9PVimb0JAHF1q/hRnW1H/0Q2tmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+rsQDI9lt3c53AQ0ZN5amGCme4AFITE6gGVWpq0g9Jkvv6m+0vompY/KFc3hHl6jjVfWPZjvTd6ruXg1XyLPTExJvc/djCdqyVYwLkKZyScDw/O1EDHDzjLd4wuMmklPOZBmR5UxA7J3fSTCcdW47a3WWAxzIHDXl06PL+nF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UI4TX5wD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UI4TX5wD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0141F000E9;
	Tue,  1 Sep 2026 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271536;
	bh=dcrb6sbDX8NQf4xXudAfBvNwwKe9AztSJMBpfmSsyxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UI4TX5wDFdPchD1XedrjbbD26i6ZK6ISiCdqAq9XMEM+b/MIXgrjKE9b03bv83i25
	 nz1fDVKIy09MDCFDcZor9KgQtWzfiCFTbS7vsZUcYVcDDV6cEPMq9Ax2GkQ2ekf8ld
	 O174WYoT5WcV5/rg9wl7Ix84GP5ShYP04ueQsJ5asi5YiGBJz+vZ3VCqzh3c6HyRUB
	 QqIWLXKaIQi4VPmIzqtgaYqMzsGHt99c45je3yMSWg/PnLfvR+PuDD6CEaOm0Ze7gK
	 KOdiZCKGq9QLEBj1yO6zPu9GwdrPJ2IZF73TVuRVK/qlYaJS29vb99VoOsDdxvS9Kt
	 s2Uj3CLaasoVg==
Date: Tue, 1 Sep 2026 15:05:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: remove unused mark_page_reserved()
Message-ID: <apbbpAiai6kXuWOL@gremlin>
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
 <20260901-mm-remove-unused-helpers-v1-1-f092d086f7dc@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-mm-remove-unused-helpers-v1-1-f092d086f7dc@columbia.edu>

On Tue, Sep 01, 2026 at 08:59:19AM -0400, Tal Zussman wrote:
> mark_page_reserved() lost its last caller in commit 6215d9f4470f ("arch,
> mm: consolidate empty_zero_page"). Remove it.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/mm.h | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1b28e6fc8d5d..e3736c42c4db 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4080,12 +4080,6 @@ static inline void free_reserved_page(struct page *page)
>  	free_reserved_pages(page, 0);
>  }
>
> -static inline void mark_page_reserved(struct page *page)
> -{
> -	SetPageReserved(page);
> -	adjust_managed_page_count(page, -1);
> -}
> -
>  static inline void free_reserved_ptdesc(struct ptdesc *pt)
>  {
>  	free_reserved_page(ptdesc_page(pt));
>
> --
> 2.39.5
>

--
Cheers, Lorenzo

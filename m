Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95C43CE70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279278; cv=none; b=khBetiUQOGfet4hzRcoR5Y8B6HLDpojNcImPfleiilgcPVDXIyrAndd9J7h3DDsvwPiLmGbO4IPeJ74pUYbI6sbXZK8HepWN3c+j4HBMEsy+CTOHiJFn3HtJl/j32xgot5RhkU143rSmro4DC+zRfHIlBkw5rUsu/Hfe0FR1eKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279278; c=relaxed/simple;
	bh=GRhRyUu4z8DnMFJsInc4jcH8YNChEhdDgtjWOvH3Upk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHJOi9fr7LP4CVBmm/DUyq1Fr4U6vDTm0a1CjrSjGrelwwVImcWqRZefp7egH78aC9N4X42K3GVUDvS4P/OyV7eKfk/MARt5VjOWCEXTWuFMSnxIZRveNuFsjDgNTiRA7YtN66jfZdaZSP4Fh+M15HyqSLRVjRWmUI5p2XpFolw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0DbHTsk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0DbHTsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAC31F000E9;
	Tue,  1 Sep 2026 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279277;
	bh=wVIPpiyauyiMJEeriZynPazSRkDSGB9FU14zxWlXue4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q0DbHTskfK/uEYRE4qw71FiJX4S5XMEW1aapCuuTjnY3Z915y63gZOgdxcoT0nlHi
	 gMGXbFStglQscVrcc3kIcn5PmuurUAQ/aCZ+HGKvVHWhvsS8EicnphyuajEvWWnndP
	 wc/OPVPUdyC0cgHFk4enf6r5QGhgw5Tbnvq70dLC0u9gKr0vgr7XYBSx+9DMduRPk4
	 XE84WmClikii3Lkt15xvhvWs89hSgjA+f5CKW17P625kYpdB1p+NNhSu9W3HVUiPB0
	 IEryfoBGX4NK8z2amc3iJbPCZt7EiMYsEc/0nRXjl5H4aOsQc1m0+qye2oOKJ2Znvv
	 s7mhsloGj8EIg==
Date: Tue, 1 Sep 2026 19:14:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: remove unused mark_page_reserved()
Message-ID: <apb55hq9Xi1gruAK@kernel.org>
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

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

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
Sincerely yours,
Mike.

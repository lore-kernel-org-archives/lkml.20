Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D83F1072
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813782; cv=none; b=iaRUFsyyw3eOnSSVPW5dn5dUzXECBFTyovqnWFWn7bia4wMDL4N8EOF+o7xOFc8CQT7Iox+2s50iQbj6VpGmB0NcTgCYsAuRC3BajgYTCnEo/rHc9eRicSStmbLcTCUJee9DH21H2tbjLuN+nAz7uzS+3xVogPX0+cYJw/s0a8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813782; c=relaxed/simple;
	bh=pmtadHnrZShdFI5VAbuzWP8Dbg9dELixHRP+U9S0jMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAqcCQCW9J/8VSNHkPCIZOjuQUC3Xf/7aMkv0DIXUdWH6ldqw7YgxHv6dZCBSF9FPebYekSz+xWmMhZYS4vuU110MexxtrQG2LMuytWN6sBi7FnYQXaj1eXmGcdKt1sfjVxg3A/CE69Oxo116htY5YwBJISBDgAyL8CJvRhNBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t3ObyEOH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t3ObyEOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C271F000FF;
	Sat, 19 Sep 2026 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789813780;
	bh=7VDCeAsJ2GjjHaIiTS2+Aqx9bChExliZfZyuB40wZfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t3ObyEOH+Q/ZSrDFHgA1orpgeeSp2dFDUB95vkDgkJwrOqZzJ5s+mXBrQ1xGbjk8i
	 cBQBqbljrVzDFvnYRWIM+eSPjBCzyR9IwPj8KNPitkLoqYlzrF+KSvTbR/Cf2euqsQ
	 Rp8sW3yoKxGdyWzvBSvN6sSnwTuK0K6dm+AKb2hk=
Date: Sat, 19 Sep 2026 11:27:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Message-ID: <2026091918-disparity-stifle-958a@gregkh>
References: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>

On Sat, Sep 19, 2026 at 12:04:36PM +0200, David Hildenbrand (arm) wrote:
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
> get_page() reference for each page regardless of foll_flags:
> 	if (pages[i])
> 		get_page(pages[i]);
> 
> This is reached from pin_user_pages*() with FOLL_PIN set.
> unpin_user_page() is shared between MMU and NOMMU configurations and
> unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
> GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.
> 
> This means that pin adds 1, and then unpin will subtract 1024.
> 
> If a user maps a page (refcount 1), registers it 1023 times as an
> io_uring fixed buffer (1023 pin_user_pages calls -> refcount 1024), then
> unregisters: the first unpin_user_page subtracts 1024, refcount hits 0,
> the page is freed and returned to the buddy allocator.  The remaining
> 1022 unpins write into whatever was reallocated, and the user's VMA
> still maps the freed page (NOMMU has no MMU to invalidate it).
> Reallocating the page for an io_uring pbuf_ring then lets userspace
> corrupt the new owner's data through the stale mapping.
> 
> Use try_grab_folio() which adds GUP_PIN_COUNTING_BIAS for FOLL_PIN and 1
> for FOLL_GET, mirroring the CONFIG_MMU path so pin and unpin are
> symmetric. Keep supporting the traditional behavior where users specify
> a pages array but don't set FOLL_GET.
> 
> While at it, don't return NULL pointers in the page array,
> as this is really not expected for GUP users; instead, just fail and return
> -EFAULT.
> 
> [ david: support traditional behavior with no FOLL_GET, extend
>   description ]
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Reported-by: Anthropic
> Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> I added a best-guess fixes tag. Given that this has been around for a
> while ... and it's nommu, I think this is fine just going into the next
> merge window. In that case, I will pick this up myself. If we want this
> as a hotfix, Andrew please pick it up.

Which ever you feel is fine, as it's nommu, obviously not many care
about it, including me :)

thanks,

greg k-h

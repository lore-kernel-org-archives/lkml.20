Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C746EF96
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347579; cv=none; b=A2hPDOyGaJv9AluJM2z9rEMm3FX8nLMRDzvjJZUlYVcYtps1EXpiKNIP6XgQWmRmZZeqMFGKxP9PJXST0zA6djZrPDujj7EfIzZNUwjrL7srzhzaOaEBi/SFVIQZs2rYy8isRkZljeMDucX2t1mMm0UJnBc5nVWUhpiR5b4s1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347579; c=relaxed/simple;
	bh=EceuUa74YGqHtWIXmoa6uQgLB1QQgomHuhwtT1S14OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SePQSC7QaTrTowXnksHsRCIkiJgsKLSxckSJ9MyKkKOKARzRdOVealuRHLc5u5MM+UQPX7xhwdgGgyCHzjepTV8/C+Jj6DD/KGOVQvYi3Nz4kRtS7KYjP7NkyvZR5CcgMxRvEcA7k/RykqNhkc1Iv7oELx1TEqVN6hi2dlJF16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy7NQKj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy7NQKj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A961F000E9;
	Wed,  2 Sep 2026 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347573;
	bh=A41e8mG5Gaj1F62VVkEOiclvFz4X0/9Pn21XkgxCZAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wy7NQKj3fhyw22FiWKKToNQI4Z6x9WLayrVH4AboIYUcVruYvgI3GGcGVq3IQqhS1
	 fnkCwqUTHk/rgvNiiADE+hlhHxyXXbHv9N9d59HRWskgxPVdU1i98zDzKuyqLinoLL
	 HzDVwlp0D4xqbtUBwnmZI6Lx0Y3B4Bop08EH8ZEWLNnJ2xPFL0tMfs16ItYVD3H9Qf
	 oosSM5ewYZuLTicqSEaf+TI08RqxEjKHl2pXFwHO6CIWGkGiVKf8XbOO2tKzr91OOc
	 5SOzxxRTlQ8rldNaR5UmoXFJyKm9BJORfQ+r5JhTp370iMGxL6ICiERHP5feSeHDg7
	 owJRKAHIoZSMg==
Date: Wed, 2 Sep 2026 12:12:50 +0100
From: Harry Yoo <harry@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slab: reject unsupported kmalloc() sizes
Message-ID: <apgEYg6IdJlBmUwE@nixos>
References: <20260830-limit_kmalloc_size-v2-1-bf4ca9c63c88@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-limit_kmalloc_size-v2-1-bf4ca9c63c88@nvidia.com>

On Sun, Aug 30, 2026 at 10:23:23PM -0400, Zi Yan wrote:
> kmalloc() is used to allocate physically contiguous memory for kernel
> allocations. For requests larger than KMALLOC_MAX_CACHE_SIZE, kmalloc()
> uses the page allocator and can only support up to KMALLOC_MAX_SIZE. For
> request sizes bigger than KMALLOC_MAX_SIZE, the page allocator can emit a
> WARN because kmalloc() allocates an order greater than MAX_PAGE_ORDER. To
> make the KMALLOC_MAX_SIZE limit more explicit instead of relying on the
> page allocator check, add a KMALLOC_MAX_SIZE check inside kmalloc() to emit
> a WARN and return NULL for requested sizes bigger than KMALLOC_MAX_SIZE.
> Like the WARN in the page allocator and kvmalloc(), allow __GFP_NOWARN to
> suppress the WARN.
> 
> Suggested-by: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon

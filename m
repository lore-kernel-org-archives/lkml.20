Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773F33BB128
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081151; cv=none; b=ZDiML+uOj6UUjwkRHuvGJhYMNGGsuttcOjQOYSVSbFGrQ9fdSOSOkaGqYpneYbTvizeffTTP2guGVsLuWwEj9PqXePnaotMURcMpZZXhMLrLFmV01wsa9XVp5aHgqoNM1zBuIFxgLpWxJorkFv1ix0IC1JcvoyrFQVkk6VJg2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081151; c=relaxed/simple;
	bh=/nsPFQ+knENtgyfFBGvM9pTrIjPek2cWSj+4DwQGBkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hd0ybPOz9gmDC19jGnZtwUad37HIeB7P9pfE2q5wUHq+MP8LqnXvCggg2AeqYuckQ6R0rOeCDZSbF4hLZxSGWN6mlAmd1PmZREURdlJy4CWsJyIJ9YcxHJqADI3K69YLVijFiQmXBWlFsP/VKRBjL7CeIjXK3pe/qoLbtWXTh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsIquxPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsIquxPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735571F000C4;
	Thu, 15 Oct 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081134;
	bh=cz1oUpp56Zew9WMeuLYnFSeLe5kZDdhcep3hXyffVkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsIquxPo3YGMGU8bVly+ySWIwCtz7VpX7N48Oe57rXA9hkwYB+4/BypRyYw31PusL
	 GqEHOuFLWjk8YwyANJlY6ps9CphdiGMDFWWD3XTLXykR7IP6zPAbBDAyYA9gL7FjGa
	 lCJmVl1nDbglKx7AJS8ow1t5SIwXLZcc16wtXLcnVPwzjL8fkgmkSQ0gbQyEdyz7uc
	 5py8cF3WvepQpTop22peaQh3M01PMEKR1/mKlhkjN3bNHCOSq1bcEM+HNiSaYY+auk
	 BhHtxqdz0usYhDsnqc2B23gp4cA+DFnF4C/LPUbMRYGYhwIfxtP8y4KwSJPYklx9EG
	 eYnilLva2gk+Q==
Date: Thu, 15 Oct 2026 17:18:52 +0100
From: Harry Yoo <harry@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shengming Hu <hu.shengming@zte.com.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: initialize the free pointer of the bootstrap
 kmem_cache_node
Message-ID: <atD8CeImfP79s-9b@thinkstation>
References: <20261010203906.93156-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010203906.93156-1-kmehltretter@gmail.com>

On Sat, Oct 10, 2026 at 10:39:06PM +0200, Karl Mehltretter wrote:
> With slub_debug=FZPU, validating kmem_cache_node reports
> 
>   BUG kmem_cache_node (Not tainted): Freepointer corrupt
>   Object 0xffff888000140040 @offset=64 fp=0x5a5a5a5a5a5a5a5a
> 
> and taints the kernel. Poisoning places the bootstrap object's free
> pointer outside the object, where check_object() checks it even while
> allocated.
> 
> early_kmem_cache_node_alloc() previously took this object from a
> freelist with an initialized pointer. It now takes it from the slab
> iterator and builds the freelist only for the remaining objects,
> leaving its pointer filled with POISON_INUSE.
> 
> Initialize the bootstrap object's free pointer to NULL.
> 
> Fixes: dc795d4c0282 ("mm/slub: defer freelist construction until after bulk allocation from a new slab")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon

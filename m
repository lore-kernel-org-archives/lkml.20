Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765331;
	b=2ShuTKq1bVQHa2G+hiG4V20kVImjzm+iZ+0YyPAvhEVrzNQ7Gk1FYsYDtmW2K7rmn2Mc
	 1VjR3GB+fLg+J8RDDUuhHYxSFZw8hXTjM/oTBSA07IKgn63eCfoeCaF/QG2fwuqqmkJOT
	 1VdUBrD/Ruih5vsfCLS8uL1W88m5U/Kc/wacHhtsf+wJQ2q4RvX6ECwa0suTWva6Jm8NG
	 fhHrII3cf8i70SsJQdaF4CsVZp6YpvZiCwChvhJO43Fh4j4KSUwJJd5utGNJBn2LF/0l/
	 7JMNkAQJMPv1nDjuZqU0fGSAYCR5Zt1YbwB9lrE1C2SZ4DQhajn36YXHCy8xSgafW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765331;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/HfmmYlqiiP4jalwWqUANyRmxPgjfk/Z/q+o2q0RLes=;
	b=XpGJyzIKa7cDeHRR5Xo4cRbnauPD1n4LTKLLDPpHqy6ab/bXyjFRh13c9qC1E6WdCL4A
	 ZpbCioMEQXGos/4nkz7JTNt1u7q6CVVErw/LPUcOT66CrYgZjzWc6HFAq000/2FOzaa6/
	 1Lg0qyHPESJIaS1MJMxFtLudxuj/r6QSviplxQiVUxgoZdVg85MJC+kRN4GCxxmiV+vuO
	 qP/0UYMWegXvePfYib78OZs6I9NxhT9qWYnKfV3KKv7n88k90bG8LzOTt3GLgjNXFT6oO
	 SkbG7YrbeXGXnlXZk5xsdyqROJDhB3P9hu/+yFT9++r85ZGRjFNDIW/XTeJazoncxZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jApyfLSG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97535606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jApyfLSG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2451F01825;
	Fri, 23 Oct 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792765331;
	bh=/HfmmYlqiiP4jalwWqUANyRmxPgjfk/Z/q+o2q0RLes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jApyfLSGiPS84kYB+liZcP1w29V8W514VORp+A4UcSvyS/iAQfrLBszs7g9P9qOCV
	 ytH2FXO3V/7w+sfVM3aloQgb7EGzbmmvB67bcaTEEf5XfxuxMMvcJ1oSJC0QnvWxoL
	 ws29x8lMfdhpzaKbKCC7GlrTR800w7yUMURB6BUDqIW+KeVuKjrmT04HLzPK7lLNqt
	 pckImXTFhuL+QJTur40oNyPqljxzH7cU4zOHAChFQkOuTLLyR+YP1XJ1ZyO4xNJtA5
	 DPwxwemSUnnc+K813/P0Cm3c73gF+JSuNu9WyQVjfEFK2jJ1oygAQ1XCeUAF7rXCj6
	 kODTzJ5Cw8OGg==
Date: Fri, 23 Oct 2026 15:22:09 +0100
From: Harry Yoo <harry@kernel.org>
To: Qing Wang <wangqing7171@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slab: only require the requested size when refilling
 prefilled sheaves
Message-ID: <attrLy_Q-53FnjhL@thinkstation>
References: <20261023094401.2042862-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023094401.2042862-1-wangqing7171@gmail.com>

On Fri, Oct 23, 2026 at 05:44:01PM +0800, Qing Wang wrote:
> kmem_cache_prefill_sheaf() and kmem_cache_refill_sheaf() only guarantee
> @size objects, but for standard capacity sheaves
> __prefill_sheaf_pfmemalloc() uses refill_sheaf(), which actually fills
> the sheaf up to s->sheaf_capacity.
>
> The call thus fails with -ENOMEM > whenever the sheaf cannot be filled
> completely, even when @size objects were already obtained.

This is extremely rare condition to happen, and so...

> This leads to needless flushing of the partially
> filled sheaf in kmem_cache_prefill_sheaf(),

It doesn't make much sense to micro-optimize slab in low or out of
memory situations.

> and may use pfmemalloc
> reserves to fill the sheaf beyond what was requested.

But the request size itself is a speculation and unused objects will be
returned back to the allocator anyway.

> Pass the @size from kmem_cache_prefill_sheaf() and
> kmem_cache_refill_sheaf() down to __prefill_sheaf_pfmemalloc(), and have
> it use the newly added refill_sheaf_min(), which returns success once
> the sheaf holds @min_size objects while still trying to fill it up to
> s->sheaf_capacity.
> 
> refill_sheaf() remains the full-capacity variant for
> __pcs_replace_empty_main() and kmem_cache_return_sheaf(), because sheaves
> on the barn's full list must be full.
>
> Signed-off-by: Qing Wang <wangqing7171@gmail.com>

-- 
Cheers,
Harry / Hyeonggon

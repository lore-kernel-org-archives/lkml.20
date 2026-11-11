Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360612;
	b=05WfhzuP8WPibwQ/1SFrUgMlWPraP2kTYfSAmz3R6hQKsoPtpf+yJmnjAM11r79bd7iD
	 hOzm+AU+U1v2gLUVFY17A1+evcqBFn63eVlGtsYpowowzWvaqBUuWlqlIGC+rw1cXDcz3
	 v6r45BI6dCjI/vmWXr4u4lioVq9ryCw3UxQnTlp6vOOT4ZAHafPXilZc3Wk1zDcTejGjB
	 bA+HeFAlAEVbyfpfoUxrGaF33kqR/Btfwa4NnkcpuVVT/F99S+r6p+qZEaZS89e+S0jRV
	 kv9ircSFDeOLVWOJSNqwCc+seW/Mpum5u2nQ0xPA+dO0Re2wCgOgguMZ4297fixLMzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360612;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=aGlSCsBqT00WxRPhug38CXPcNLm6Ex1XmxYgMp6Ugpg=;
	b=5XoJWiaoM7LoOdpxgqDZuqOzQ5Z7+Dt1j1UUHTJqlvckAu8CwHuFNEGMvuTdQfH9PbDq
	 Vr3BbKAJRda/0hQs1y6brY2YUulc2ZyUjld+x9bmceRKmU/yD9o3dLYErQrbDQWhcMcM/
	 CVlJGNqdGXPJFvqLlyarSv4i1eB4gF896VHd+Q5DfUoJjH1SQBcjh+567U5qYkCJkaWEl
	 ZgA1YzGajzreLT2B1AJdDhxUNQUSEGftjXbzbOWNH5OlbZ6Z7qDbBypdj2kPOLzuuEAVS
	 K7B5A3C1nnZ81+8AK+No3eiz0q68qLuuv8yTOfX9516BwvPSpVANDiu0qST0uD3SLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iTuO3NTL;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9E60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF9E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iTuO3NTL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aGlSCsBqT00WxRPhug38CXPcNLm6Ex1XmxYgMp6Ugpg=; b=iTuO3NTLniEKwOqFogBVymyw+f
	hC9z4aIQYBz+bQuf+3DOUcbj4QN0evwNuaU9REiLhEIGn4zKQ5rIp6UwzKTmMY1aLEvVngKt5IdTU
	ugzeVNBMQFm2DT6O7vMYGWP7AJsb/H1P/i7S69D7dRx96cwzNzAx7BFGawQMdJI2k9670bWUnLDcO
	asJe/8UR0GLO0rXhdzF2UCJ/azd9ubAMB/98EJ3QpZNNn0NKdemL9mHwaDWJ1WhlT0cNfxVteGw/l
	+w1gKd1fkeoCEPISipMQj3vBstrmjj2xp+zR4p81PP9D/fxPawWSxpspe9d9vbUncS+TD7k9+wVBj
	QhLiO6XQ==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxAA-00000005NdW-3Ngd;
	Wed, 11 Nov 2026 01:30:11 +0000
Date: Tue, 10 Nov 2026 20:30:08 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mm: convert WARN_ON_ONCE()'s to VM_WARN_ON_ONCE() in
 VMA lock code
Message-ID: <isz4p3yfc7dm346qwnjhl6zraspz3jsvwl6bcyn4kddqma27od@33qacw4zdsfq>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-3-be293ff499a7@kernel.org>
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
In-Reply-To: <20261110-tame-vma-asserts-v1-3-be293ff499a7@kernel.org>

On 26/11/10 04:57PM, Lorenzo Stoakes (ARM) wrote:
> Now that VMA assertions are predicated on CONFIG_DEBUG_VM, it makes sense
> to convert existing unconditional WARN_ON_ONCE()'s in VMA lock code to
> VM_WARN_ON_ONCE()'s.
> 
> These are asserting programmatic invariants which are in most other cases
> asserted using VM_WARN_ON_ONCE(), and there is simply no need for these to
> be unconditionally checked, so no longer do so.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

I assert that I have read the entire series at this point.

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  mm/mmap_lock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> index 834bbf86e004..073c5125b424 100644
> --- a/mm/mmap_lock.c
> +++ b/mm/mmap_lock.c
> @@ -146,7 +146,7 @@ int __vma_start_write(struct vm_area_struct *vma, int state)
>  
>  	err = __vma_start_exclude_readers(&ves);
>  	if (err) {
> -		WARN_ON_ONCE(ves.detached);
> +		VM_WARN_ON_ONCE(ves.detached);
>  		return err;
>  	}
>  
> @@ -161,7 +161,7 @@ int __vma_start_write(struct vm_area_struct *vma, int state)
>  	if (ves.exclusive) {
>  		__vma_end_exclude_readers(&ves);
>  		/* VMA should remain attached. */
> -		WARN_ON_ONCE(ves.detached);
> +		VM_WARN_ON_ONCE(ves.detached);
>  	}
>  
>  	return 0;
> @@ -193,7 +193,7 @@ void __vma_exclude_readers_for_detach(struct vm_area_struct *vma)
>  		__vma_end_exclude_readers(&ves);
>  	}
>  	/* If an error arose but we were detached anyway, we don't care. */
> -	WARN_ON_ONCE(!ves.detached);
> +	VM_WARN_ON_ONCE(!ves.detached);
>  }
>  
>  /* Do the VMA, mm seqcounts indicate the VMA is write locked? */
> 
> -- 
> 2.56.0
> 

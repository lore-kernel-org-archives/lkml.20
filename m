Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389933;
	b=LEVJVY5A+scrkr5THRGX9YCmrNQnQmIPZFTEfpPjUKsbW84dpJI39Xl7V5B3UMUiJsB+
	 8VH+FHs+1dVBLNaToVsKW+MJTuecBRriAGFAnUruyw1aeFd4p+pUb8TBVWo77ZjJ/entb
	 +ZyCM4J2IZABk2ZJk+IGy7yVEfYycL8NSOWNX3hPUSj5jWzjS8RakUlhECNMsvL5K9A8P
	 GFYl/rlRoABzRpIy5OcsBHzXBtE8j72DoZYDNdUYkZPLEA/vW/nrS4d6zTvtHPXoTEV7x
	 TnQoH1Za2xnBXdE1ChU9K/B9q6nGtr8oDXEjuzL5NgZ+XDEAsmtNFzd8zOlo+4tu4bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389933;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4fY7y3DvJR+ThhW1hxlai7deN/WqRZ83gAUMd110UE4=;
	b=459e/v2yEjtjcAQWSrga/tacjocAZdwjQHFHuiOR4li4ZNa+fW5gXXHlLcAtM6bTDmOE
	 NZ3uwOyz1aQpazz5xXl4HxwPow0ciF+MjDiXGDZSNmHMuBiXaVRkb30k67B9v1PE59Nr0
	 NcYDpFn8XCtdzo9fkgiwYTW5NHuOKfMFTEYiXgdZob1iahc9FAOnRrYqjDxuLZ2B1a6mu
	 XENQmRWrHiDvLpkXFkJ2XHxuHAGtmOht5JvkDF74on/dNgfflVM9clnYWMlXow2xpEqXV
	 XbeP31CLcbs/ffFCZ0kGoBvCyicInYhNRlBNVCukxJH5pMiBEr+bTR0orTxH4DhzO9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGrGSJZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E843606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGrGSJZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33C81F00A05;
	Wed, 11 Nov 2026 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389933;
	bh=4fY7y3DvJR+ThhW1hxlai7deN/WqRZ83gAUMd110UE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lGrGSJZM6doF9c4EAvbkk9cqMFO7Gn7ruLcFXqhlf4encNqTGsoqGX9buFQ0zRlpw
	 NnXtS2mxNbFa7hkwUwejUlJlZD5jjvirnlbAlBnX/ZISdFXT5eOtBruYRdFbD3JAN6
	 EcnSuekavKbwk6fW9eWdP114V4TdTQWBrfn9hW+dSDJwD2jCJNSERk+igooNZ2x/JE
	 PejkO/XZgVXQkrbGN2bxVkDWFlYoUsi1m1aBJ7s715aF1hh5ccGLlg3UQIx616sgGZ
	 U8W0nU7rElxqtvLPd6FFGG7DGeZzdcduNpYe5Q1Wh/5AW+f9LrSABNF5wJCjYlYyrY
	 u3di+tCaoeRTg==
Message-ID: <0069b6c6-a2d4-4a3b-b723-71c96509a3f2@kernel.org>
Date: Wed, 11 Nov 2026 10:38:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm: convert WARN_ON_ONCE()'s to VM_WARN_ON_ONCE() in
 VMA lock code
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-3-be293ff499a7@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261110-tame-vma-asserts-v1-3-be293ff499a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:57, Lorenzo Stoakes (ARM) wrote:
> Now that VMA assertions are predicated on CONFIG_DEBUG_VM, it makes sense
> to convert existing unconditional WARN_ON_ONCE()'s in VMA lock code to
> VM_WARN_ON_ONCE()'s.
> 
> These are asserting programmatic invariants which are in most other cases
> asserted using VM_WARN_ON_ONCE(), and there is simply no need for these to
> be unconditionally checked, so no longer do so.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

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


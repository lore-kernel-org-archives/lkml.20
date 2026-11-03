Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722534;
	b=FJ+rPC09uxCjUI1rB5sHxc8hcJ2BV4lJFjDWyHbVrth14UgQqRZc891pP0+XgqhnjVeL
	 OeyZqE1v7pHkrcWJRP23klVv0Vr39irTm5CUG2QWm5zp39TdOys+FrJbChveQWo8zdBX3
	 CJ0fZr3IgbB+lnlX46OGb0B+gSVdjALZ3TYqlicXgQJxoUI9DxwTxV9nkFayOxHvfPthi
	 MGnf5LnR1Tt889k+iug3J+W8yp1IsPgjQOOAJZ+96tx52Ls8uT1uJk54wm8A3bMwGTxlq
	 a06A7ZU4dgFOmIw4GPA0sARocOhL1K0XEiujDpiSYpN8ORNdorSJVaIIHRT76nO/PPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722534;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q8NpD8k/9WAc6vNVaSkHz5kodBio95Wiqomk8+JsUrs=;
	b=vKOEh0yPa+ezw7qp7NkgeGgij64rVpHpZ8FEy7FhV0HhOSR1wEKciGUklXlEHQA5J9oL
	 RA6kbrBz4nPIOdMkdLYvlz6ZzZXxxe8aDzVN2Jkrw4XVGElwl5HbWKunub0X9j8a9KoDd
	 w8TSxD2xEvzqMbR3U+OL+JA6QWVsJc0JjTFF0mwEbShBXsyr8MHsVNC+Qrkyv4OZT4EqW
	 iMm2TRRQCFvkj2veQByTtHFC14qC6NjfmEyQ9kl8go17T8RVGdADjicUM2xwsdYM3/YN1
	 v+YMj6MuJQOfeJmha0bJ1Lhwgx/teQDnyflHI5fe7Ks17QmwCvV7waVYA6l049B5uog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJDOSGrv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64BA606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJDOSGrv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4961F000C1;
	Tue,  3 Nov 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722533;
	bh=Q8NpD8k/9WAc6vNVaSkHz5kodBio95Wiqomk8+JsUrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oJDOSGrvzCc1+rWbOgTy5e+i1jHcwIL3bwsFqFsaeNRT2AeMbOjiMGmU2Zp9yZYD+
	 BB3Xg4+eY8aOy7I0aMRe5fsGeJJkPwOHUFCPUyn9xvYcGjhYSBKWtl2eayNstgQ62Y
	 SGhueBZmnf5RztTpF/FAXD58SI4QhZ879sJeq6nVA8eI2gnZxSLWONU4B6gZbrHeFF
	 MZReR1zKTML/5QWFVA2ELxwckl2cXDn2ltSzWE8DQDfpUKcnYl6zlGYEluXM+hRwpb
	 vnqM3E1TiCwqt/9ed28XSL/lm6F+gTJMRY2GLuUYop91BaL19zfbB5ZgxQsYu2gtZq
	 /nOW/h12ZY3JQ==
Message-ID: <61f8a583-5ea5-4fcc-bf30-ea9cafe94d65@kernel.org>
Date: Tue, 3 Nov 2026 17:15:27 +0100
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
Subject: Re: [PATCH v3] mm/memory: use pmdp_get_lockless() for the pmd read in
 do_fault_around()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20261103014749.96764-1-hui.zhu@linux.dev>
 <aumfvNWiemmuyooP@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aumfvNWiemmuyooP@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> +++ b/mm/memory.c
>> @@ -6017,7 +6017,8 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
>>  	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
>>  		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
>>
>> -	if (pmd_none(*vmf->pmd)) {
> 
> This pattern is definitely bad I think, we have it in many other places so
> should probably convert those to pmdp_get() at least?

Usama is working on this as part of separating HW and SW PMDs (he only sent out
the PTE part so far).

> 
>> +	/* pmd_install() rechecks pmd_none() under the pmd lock. */
>> +	if (pmd_none(pmdp_get_lockless(vmf->pmd))) {
> 
> It definitely seems right to use at least pmdp_get() here, but I wonder
> about the need for pmdp_get_lockless() here.

Whenever we're not holding the page table lock we should be using
pmdp_get_lockless().

Even if they are semantically equivalent for most cases, it serves as a good
reminder that there are no guarantees.

And that you have to look again under PT lock.

> 
> pmd_none() only checks the lower word, so a torn 64-bit word on 32-bit
> (i.e. the PAE style cases we are worried about) makes no difference:
> 
> From x86 pmd_none():
> 
> 	/* Only check low word on 32-bit platforms, since it might be
> 	   out of sync with upper half. */
> 
> And anyway I guess there is no valid PMD in such systems that would have
> the lower word cleared and upper word not cleared.
> 

I don't understand the discussion really.

No PT lock -> use the lockless variant.

Until we can remove the lockless variant.

Are we consistent with that? Likely not.

But that's all independent of this patch here.

-- 
Cheers,

David

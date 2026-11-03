Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735504;
	b=AHdHDMzfJzErocNbjj4SmtL5yvx5lCKEfWZxlqfKn6kieke9D++hMEiqxZ9M3WgnbuM0
	 fdKmLDDYVgG0qJxBWByaPQWjyZ+ZcglzbLWC2QWNf/TyQ1UEbZnJwjGJMkJrM4drqlGnF
	 rSZQJUN/xHg+Ksq+NsSXKnGRpqFje1WI0cSFFLctZgh5lNyoEa3U1obVBrnGZLVb3erL1
	 M/x4xWWkPq0KwnFJAgxKccrHV41ki+zmCJ5l9SbZLRt/zqMZfnFK0TpRSS2LoM5Ix/9aV
	 4lxFx6UfVStMrtQj3rl9dkYC+JyZ6fkTyGdacbbriPjbl5ezGf0BVharW+NShcdBOjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735504;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=n/PskOK3Y7Z0ycyR+laJWkqhqrbsZR+1MjVv+aAgnRs=;
	b=t7R4oXeV+9zNaP1eHqyLgrxsaBB0Y/cO43m2FU7IJzEDDJ5PwdudKulQUL6p+1QOwq/m
	 jewz9saEU+N0eIQZgR7Cgan/3hQ0thpOcvaq+0xmgbMWgkua+Cbxu1BL8GLzjjGDuWAtB
	 i1RJbMMdMTvlB2saJAkqTLmmK4ksbCkZtuGwjeig3qFpNLcGwrRhfxdpsDCTX6BFHF1gd
	 oSg1ehNpYk7nllM/93tn9B558gxD22TP72Hn6s6Z75m0ebmazRvDPs1ti4d6pYdjcOi3+
	 HX+/Rr5QJxUvfJYPUPeFRaNs62T8SUYqg9B0ZmQCKOX7bfRZQqtj0cKtuZ8hPZh6nBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAWhIOYQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2095606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAWhIOYQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1E01F000C1;
	Tue,  3 Nov 2026 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735503;
	bh=n/PskOK3Y7Z0ycyR+laJWkqhqrbsZR+1MjVv+aAgnRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HAWhIOYQspeIoWsCYj7aDYzrcrBssnG2n9TS3TvyWlXUOi4S+2f9m05ihQemddbiL
	 1vq+7Hg72EJhLloWSbVxrFpT0RBsfXIfkCEjxx5+ljJXJqTRA9GNoU3B91yaiQdsBa
	 G6EkK9NuLDXflo7vW+fBc7g6VJHl2k9B3mFxyeb41YfTsKg7aRGDrBO4vwM0NzKcWy
	 z05vVBw7S9JpXhWI/XRfbo4Iom2ajS0QHljgLqypcKyfMaOV+QHe3VdMnKs3n+m26F
	 FmE1j+4qkcxhjYNZC1RusBTY+VG+vSNJPlig/lcVLdn7ge7xq89lYG9J0ayRZIXVel
	 jKdHizrhlEODg==
Message-ID: <c0e648e2-aa1f-40f3-84f4-c4ca4123de9f@kernel.org>
Date: Tue, 3 Nov 2026 20:51:38 +0100
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
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20261103014749.96764-1-hui.zhu@linux.dev>
 <aumfvNWiemmuyooP@gremlin> <61f8a583-5ea5-4fcc-bf30-ea9cafe94d65@kernel.org>
 <auoXIdTpLO60mkEw@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <auoXIdTpLO60mkEw@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 19:24, Lorenzo Stoakes (ARM) wrote:
> On Tue, Nov 03, 2026 at 05:15:27PM +0100, David Hildenbrand (Arm) wrote:
>>
>>>
>>> This pattern is definitely bad I think, we have it in many other places so
>>> should probably convert those to pmdp_get() at least?
>>
>> Usama is working on this as part of separating HW and SW PMDs (he only sent out
>> the PTE part so far).
>>
>>>
>>>
>>> It definitely seems right to use at least pmdp_get() here, but I wonder
>>> about the need for pmdp_get_lockless() here.
>>
>> Whenever we're not holding the page table lock we should be using
>> pmdp_get_lockless().
>>
>> Even if they are semantically equivalent for most cases, it serves as a good
>> reminder that there are no guarantees.
>>
>> And that you have to look again under PT lock.
>>
>>>
>>> pmd_none() only checks the lower word, so a torn 64-bit word on 32-bit
>>> (i.e. the PAE style cases we are worried about) makes no difference:
>>>
>>> From x86 pmd_none():
>>>
>>> 	/* Only check low word on 32-bit platforms, since it might be
>>> 	   out of sync with upper half. */
>>>
>>> And anyway I guess there is no valid PMD in such systems that would have
>>> the lower word cleared and upper word not cleared.
>>>
>>
>> I don't understand the discussion really.
>>
>> No PT lock -> use the lockless variant.
>>
>> Until we can remove the lockless variant.
>>
>> Are we consistent with that? Likely not.
>>
>> But that's all independent of this patch here.
> 
> It turns out all of this is a complicated mess, I think I've nerd-sniped myself
> into sending a series at some point about this...
> 
> It turns out we're as wildly inconsistent on pmdp_get_lockless() as we are on
> pmdp_get(), so TL;DR my main concern is moot so:

Yeah, I know that we use it in some core places already properly, like in
GUP-fast, __handle_mm_fault() or our complicated __pte_offset_map().

> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> But for the non-TL;DR... (optional reading, will probably send something):
> 
> * Agreed that the semantics matter - and the 'use pXXp_get_lockless() if no
>   locks, otherwise pXXp_get()' is preferable.
> 

Ack.

> * But it turns out it's all a giant mess (of course)... for
>   CONFIG_GUP_GET_PXX_LOW_HIGH arches you really actually need to also do:
> 
> pmdp_get_lockless_start();
> pmd = pmdp_get_lockless(...);
> pmdp_get_lockless_end();
> 
> And that's because, as Hugh points out in commit 146b42e07494 ("mm/pgtable: add
> PAE safety to __pte_offset_map()")), you need IRQs disabled for these arches for
> it to be safe.

Yes, there is this pmdp_get_lockless_start() magic ....

> 
> The explanation is quite good:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=146b42e07494e45f7c7bcf2cbf7afd1424afd78e
> 
> And then of course there's also pmdp_get_lockless_sync() used by THP collapse
> which is some kind of 'true' lockless usage that needs to synchronise with TLB
> invalidation against GUP-fast and ugh.
> 
> * So I think what matters is whether you actually NEED the value un-torn or
>   whether it's an optimistic check that you can live with (rechecked under lock
>   as needed).
> 
> * So I wonder if we shouldn't just have e.g. pmdp_get_lockless_optimistic() or
>   something like that which is just a pmdp_get() in all cases with correct kdoc
>   description etc.
> 
> * Then we can convert ALL lockless users to using a lockless form without having
>   to do the IRQ stuff. Including a ton of the existing lockless users.
> 
> * I am not sure why I did this in bullets. :)

It's really a mess. I wonder if we can remove that somehow completely ...

arch/mips/Kconfig:      select GUP_GET_PXX_LOW_HIGH if CPU_MIPS32 &&
PHYS_ADDR_T_64BIT
arch/sh/Kconfig:        select GUP_GET_PXX_LOW_HIGH if X2TLB
arch/x86/Kconfig:       select GUP_GET_PXX_LOW_HIGH             if X86_PAE

-- 
Cheers,

David

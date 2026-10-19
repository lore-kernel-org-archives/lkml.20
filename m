Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594284F0525
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412614; cv=none; b=XV6dkLJAce9OXFG0Lpub8Icn0JZRmfeVwa65lSf3AZq1qPckxh6oaVXLGa2ibW5hbmReh6HrXi164CT5sInFcnbRAhC13HdTFsFEtJKyE7tMe+VUwnN6c0b/Rk0S3s6yohY1JEu4YE+IEa7Q6KD0QV4THe9gV7If1KAyZe1rm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412614; c=relaxed/simple;
	bh=D/K+gtDanH7LL1oVUnqBXGxW5Q4Nl7tGMlKqfoNYBV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfdkW+kxqw3Zh3Tun8x2REfvz9HuLoLpgavr5jBTwTawMYrZv2+4EbU9drIvkiSFsYBsz5bha88od/4WbKvhb5clxKa1VWdxJWqNuq0F7NI/AHcJRPFLGAetiq/Mxa5uXAItm4qrab+t5pTO8R7FvD4JBX3rC2/okxAFQZc4cG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq7f7u02; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq7f7u02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DAA1F000C4;
	Mon, 19 Oct 2026 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412609;
	bh=LuiCl+I2h452P2ySjY/aKFWNJcn4drc6seXyIqCSVY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Oq7f7u02z1MZMAwTdBQfCe7hZrRaN2XCtCDfk6Kmv9L+JzDLETnM+pXZ/QdKeAsCd
	 IpjIT35E4EWLub8zbfJYdEvr8sZ4ATo9B3YFfoBKHidQyqWtp4k/yGXOOfSAqWKM2t
	 QWLsVwUuEgK3krujErnkqv/z5CluTrRgy8Wb9rkHIc8/PFjdynqwnoEr0y171MeIWK
	 Oi1QRss8lATZaL/cdyQqfX0yX/tPIMhMufaemhnMMfIWtYuzBTRhc8ASlitX1iJdCU
	 Te16u5lGojfvFc7g8Sur8XSomaWBT9BS3Kd3isIO6Lwj9C2EWSGmMInLc1vQF14u1G
	 R0gIBW3J68SWg==
Message-ID: <ad34dd6d-f106-42b1-b8b6-a4487822285f@kernel.org>
Date: Mon, 19 Oct 2026 14:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
To: Pedro Falcato <pfalcato@suse.de>, Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Borislav Petkov <bp@alien8.de>, Ankur Arora <ankur.a.arora@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
 <tglx@kernel.org>, Bharata B Rao <bharata@amd.com>,
 Hrushikesh Salunke <hsalunke@amd.com>, Ingo Molnar <mingo@redhat.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 David Laight <david.laight.linux@gmail.com>,
 David Rientjes <rientjes@google.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Teja Vojjala <tejavojjala@google.com>, Huan Nguyen <nhuhuan@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com>
 <atX3lpXQBHH1JPhW@pedro-suse.tail5790ac.ts.net>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <atX3lpXQBHH1JPhW@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +}
>> +#else
>> +
>> +#define COPY_MC_PAGES_NON_PREEMPT_BATCH		1
> 
> I would suggest that perhaps this should be the fallback for non-preemptible
> models. But it gets a little weird with PREEMPT_DYNAMIC I think?

Why can't we just use PROCESS_PAGES_NON_PREEMPT_BATCH where we have similar
handling already?

> 
>> +
>> +static inline int copy_mc_highpages(struct page *to, struct page *from,
>> +		unsigned long nr_pages)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < nr_pages; i++)
>> +		if (copy_mc_highpage(to + i, from + i))
>> +			return -EHWPOISON;
>> +	return 0;
>> +}
>> +#endif
>> +
>>  static inline void memcpy_page(struct page *dst_page, size_t dst_off,
>>  			       struct page *src_page, size_t src_off,
>>  			       size_t len)
>> diff --git a/mm/util.c b/mm/util.c
>> index 7f374bb8bf36..5015cfdfeaa5 100644
>> --- a/mm/util.c
>> +++ b/mm/util.c
>> @@ -763,13 +763,23 @@ EXPORT_SYMBOL(folio_copy);
>>  
>>  int folio_mc_copy(struct folio *dst, struct folio *src)
>>  {
>> -	long nr = folio_nr_pages(src);
>> -	long i = 0;
>> +	const unsigned long nr_pages = folio_nr_pages(src);
>> +	/*
>> +	 * Copy the largest extent possible to allow for architecture specific
>> +	 * extent based optimizations. copy_mc_highpages() does not call
>> +	 * cond_resched(), so limit the unit size when running under
>> +	 * non-preemptible scheduling models.
>> +	 */
>> +	const unsigned long unit = preempt_model_preemptible() ?
>> +				   nr_pages : COPY_MC_PAGES_NON_PREEMPT_BATCH;
> 
> See? now mm is aware of preemption models! eww!

Yeah, we have that in clear_contig_highpages() already, which is getting
replicated here for copying instead of zeroing.

-- 
Cheers,

David

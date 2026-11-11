Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426188;
	b=njB45OvWDUyo1KQV//zOSafvc45Oxc3+aYnSZ+aBZgf6liRdnjk4hsEGx4yZpL1pzkYT
	 Q0GT2iyr/6GtWR5J+DWlZ03WvJvp5qPaBH++w5Wya/AkOz733AcjKVczpngChOY9/kJCL
	 kDD7mpfIjoa/XByLLcwM6aMwYng2YuhMdKn8j0GjbQVKToATzlucbmKEfXhbmQErc6O80
	 G4mAKvAFUzeg0qiS3R9wBdbeEVQCh5AvPQk+FXbrwJD4pMO2NckBIha5//y6au21166YQ
	 bHFhPJIrc3oMEw7gCeiHM79zbDSgA7BplvplrCGgfJ5CXlPXwQiEXTB59XXs7GOZvog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426188;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2vDqA8f48MzAhhukXlkIPSTxvdHyn7+6decpCKpqaQc=;
	b=RhyACJ2vgsSJHkzSTNsSk49QD5oH9Yr5vKOGxJguTolazeh+eHqulONVfuC2uvFumee0
	 owOdatYsRUO5gEKaOM+9+Dwc8c8+9uLf4KyBQvXqq4XYnqcNuua+dQNaGzDvu2rvckObe
	 a0EzrMgPJxkWQciN2Ib/KZY2sJpFgLvPKxfsjvEQPd/P+aN+F3faAr951FiTv2tvA4/Wc
	 dH7Bvn/9CkTJ16jUZikWmYEFJg9EbRXRZ6yyI335zu7Xt3yXRxGVbIX+ZGblwTp7CTphm
	 qp78pWCUVPk+wnFhFau6DvzsjWNC5XGfIMQ2cfwAjPHGhEfLlGlDNqwFj0cXuOy4Iow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUvLR+bo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUvLR+bo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E385B1F00A05;
	Wed, 11 Nov 2026 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426188;
	bh=2vDqA8f48MzAhhukXlkIPSTxvdHyn7+6decpCKpqaQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hUvLR+boOm7fyzYFTLLM1kzy4pOLyWEFNldRghZ8zaiKvBrfSb6yTLAKnBUkMRnYp
	 5ggVwKLQMqOqI1mocrWk6Jh2qnZU6eBZZpn+h4w4tlUdgZ52c2qhJ0YMVXploC3Ol6
	 CQF5+SgAO+hTNXHA4rK5wSzx65uWyviRO98d0ldSFXH7y1ihg62GiKzs8F23YucqPv
	 ebH00pOyx4rlo4SNj4Gb4voPbPC6/hrdVghLkHXnqoahMCNyY08Q6m2PU1KBa2beoz
	 GWYFbv3A2im8j6u88vRyIUaS2+wmR3NUPrqzKqelrBuGoJJqlHSkKX5Oe9/Qau8bfb
	 lrX3hLe6spCcA==
Message-ID: <71e24630-4c71-4518-a9b7-68cf3597ce80@kernel.org>
Date: Wed, 11 Nov 2026 20:43:00 +0100
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
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ljs@kernel.org" <ljs@kernel.org>, "ziy@nvidia.com" <ziy@nvidia.com>,
 Mike Rapoport <rppt@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>,
 "security@kernel.org" <security@kernel.org>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
 <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
 <avS5QcRj85yAm9ll@thinkstation>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <avS5QcRj85yAm9ll@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 19:53, Kiryl Shutsemau wrote:
> On Wed, Nov 11, 2026 at 08:29:50AM +0100, David Hildenbrand (Arm) wrote:
>> On 11/11/26 04:19, Tal Zussman wrote:
>>> So this issue was originally on my list and I had a fix for it... but it was
>>> REALLY ugly and a band-aid, so I dropped it.
>>
>> Yeah, RWP is a mess.
>>
>>>
>>> I think the real solution is to just add actual markers for RWP and solve
>>> all of these issues at once... but that should be a separate series from my
>>> batch of fixes (which I'll be sending shortly). Is there a reason RWP
>>> markers weren't done in the first place that I'm missing?
>>
>> Let's ask kiryl: why is it ok to drop RWP PTE bits during swapout, zap, collapse
>> etc?
>>
>> https://kernel.org/doc/html/latest/admin-guide/mm/userfaultfd.html?utm_source=chatgpt.com
>>
>> states "Unlike WP (which persists via PTE_MARKER_UFFD_WP), there is no
>> persistent RWP marker today. The user needs to re-arm the range with
>> UFFDIO_RWPROTECT after any operation that explicitly frees PTEs."
>>
>> But requiring the user to re-arm is rather questionable design if the kernel can
>> just zap these page table entries.
> 
> There is no need to re-arm. 
> 
> Once the PTE is zapped, the next access faults, and userfaultfd already
> has a mode for that fault: MINOR if the page is still in the page cache
> or in swap, MISSING if it is gone. Register the range with RWP|MINOR and
> the first access after collapse, shmem reclaim or MADV_DONTNEED arrives
> as a minor fault. The monitor counts it as an access and resolves it
> with UFFDIO_CONTINUE.
> 
> That is why there is no RWP marker: MINOR already covers it. WP needs a
> marker because MINOR would trap reads as well, and a WP user does not
> want those.
> 
> Anon has no MINOR mode, so there the bit stays wherever the page
> survives: it is carried on swap and migration entries, and anon
> collapse bails on uffd PTEs with SCAN_PTE_UFFD. MADV_DONTNEED frees the
> page, so the next access is a MISSING fault.
> 
> The report registers RWP alone. That is the only setup where the access
> after collapse goes unreported.

I have the faint recollection that we discussed that handling during early
(pre?) RWP handling.

I think that expectation and the implication is indeed not documented anywhere
for users that have no idea what markers are.

Even LLMs are confused.

Or is it documented already?

It would be a lot more consistent if we'd just add marker support. Or is there a
good reason why that is explicitly not wanted?

-- 
Cheers,

David

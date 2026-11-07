Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081962;
	b=r6M3LdguaiRUrfNh1Zj/F+DK8paxsZ4OYe/TFaBAVJD/Jxx84ohqNtFDVRbYcYkkWfB1
	 1TamLjewCvcYvnNWpUkMioOcny9JT4FmJUt4KjlSfIUjaLognNGEZGTkWlHVkTuUDCd9A
	 ArG1O/SiABDXc63RMGgWRYHiOPP8jKsP2RIuv8KwFo5aU0OjZNQA+u94snRb+YuQA7/O3
	 wK2JfXSLNjdxzhMNumeWb/vi6ldO7cgw2ARCq+Bcx5aMcNYD/uk+nRzAOZ52VDmSTymof
	 DVM+X7zSnb5NBYtr5UO8W9UTApxu6s3Y2qolNMo+goxinh950TNMCv7yE6D+tsq6zSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081962;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z3oDyqgDBVuce1eKczb2I46fcE48/Nsk2k7Al2XC6OM=;
	b=2W5jWZ8RaDHrRwA99NCz7BK1SeeJiQNOJcX1lb9m8wMNvLmsV9Hw5/prGyVKi5LfVU83
	 DNobqwbsiPcPsLiLs+Gr294Wt/S5Lm2lIzaglDL3Z4JhszkbBVlImoKJyPf6FVsOS01Da
	 jd6SA4MnKt4C7ZU/OnLOQMLVQYKg3whcOmbpgM+HfrFaUXdwWodvHR118j2SXN20aoVvz
	 fIW9YPJWUzFk62B7Uy2PHDn34l66sQ9kiVdwqEPqa7e83z8C9EDSlNAh04TvDwpZQYfa/
	 gGNdcytn51vpab0KwaMr2J2KP5vUE2srtdo4btXliiCyzxzhhvlwIv/DEYUNhzh5Syg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyMjq1S2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA33606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyMjq1S2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002ED1F0089F;
	Sat,  7 Nov 2026 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794081962;
	bh=z3oDyqgDBVuce1eKczb2I46fcE48/Nsk2k7Al2XC6OM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LyMjq1S2WAolYZd76EhbJB1FgqYDBs7DcZjYqeRiLVsq1170bDG7Y12zYDonsbPNT
	 lg0M7URG6heOwJqV+kuEm9hYbeN2fBqeRkbCsLDZJb+9Wshgzn0MD9yugElny91E7X
	 oniUOhMLu8+2yu/SGKlFq1RU5j2rwn+wrQSFKSk2Qqgm5Rul2aojLZkR0kPjBbu69b
	 w4vuHY9dS2CsVAcqOpQSRfizM2bkHxp3rhKfZCEU1yb/CL1O3hFEMnwbldf+j6J2IJ
	 bC4MhtCahSKTQugMI1U+suda+qb8+wMVnoYcMsBB8hSCjfIFajD72Drg9MwmxdrpWR
	 sgwUb4M7M2R4A==
Message-ID: <47fee2b0-091f-4c20-9496-eff844ab2f6f@kernel.org>
Date: Sat, 7 Nov 2026 21:05:52 +0100
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
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lance Yang <lance.yang@linux.dev>
Cc: baohua@kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <f06d2004-f3c5-46b0-b708-780ffd6727ce@linux.alibaba.com>
 <20261106023326.10838-1-lance.yang@linux.dev>
 <9916bea5-3b53-43a0-8f65-cc33995adb23@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <9916bea5-3b53-43a0-8f65-cc33995adb23@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 03:54, Baolin Wang wrote:
> 
> 
> On 11/6/26 10:33 AM, Lance Yang wrote:
>>
>> On Fri, Nov 06, 2026 at 09:57:47AM +0800, Baolin Wang wrote:
>>>
>>>
>>>
>>> Thanks.
>>
>> Cheers!
>>
> 
> .......
> 
>>>
>>> I'm afraid the memory barrier here is subtle. __folio_remove_rmap() is
>>> complex, and in the CONFIG_NO_PAGE_MAPCOUNT branch,
>>> folio_sub_return_large_mapcount() doesn't provide full ordering, so we
>>> may still need smp_wmb().
>>
>> Yeah, agreed for large folios. In the diff above, only order-0 folios
>> use smp_rmb().
>>
>> Note that order-0 folios take the fully ordered atomic_add_negative()
>> branch and skip the CONFIG_NO_PAGE_MAPCOUNT branch entirely.
> 
> Yes.
> 
>> static __always_inline void __folio_remove_rmap(struct folio *folio,
>> 		struct page *page, int nr_pages, struct vm_area_struct *vma,
>> 		enum pgtable_level level)
>> {
>> 	...
>> 	switch (level) {
>> 	case PGTABLE_LEVEL_PTE:
>> 		if (!folio_test_large(folio)) {
>> 			nr = atomic_add_negative(-1, &folio->_mapcount);
>> 			break;
>> 		}
>>
>> 		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
>> 			nr = folio_sub_return_large_mapcount(folio, nr_pages, vma);
>> 			...
>> 		}
>> 		...
>> 	}
>> 	...
>> }
>>
>> And large folios still take the PMD lock :D
> 
> IIUC, the memory barrier optimization targets all non-PMD-sized folios 
> (including large folios). That is, for PMD-sized large folios we still 
> use the original PMD lock, while for other non-PMD-sized folios we can 
> use memory barriers to sync.

It would be nice to prototype a patch and document the required memory barriers
and how it is expected to work.

-- 
Cheers,

David

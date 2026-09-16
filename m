Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BC3ACA46
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539147; cv=none; b=p5K0+mB8x2Co2ydRxOLoYNWrw7oPjXOQnCiQMeJMk0pN4cd28L7aE8/CRpWcWCba1L6i1StlyuA/bANSsgEuIuHdAJMHI639VZsOp3Xg576TEs6s4c8j+7d9ECgbSuK7vWt8hvrqWrDPRXwQE3c5gwunzI0N8uTxj+9IqYMuU4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539147; c=relaxed/simple;
	bh=QQfdtee+0fj/mxrJpRwYUPi85x36SFeorWl1kY9jW98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWRk+mpTMFjDe86wCk+wO9KmYZ8mewQbp15lmx5x5BDTdiF6Gpm6yaSw7rgFY2eN2K3MhqdavqQfMjEkWyV5yu2MRQuT+3/0QsLUrWb1T2XkLdO9wsE4/v2mL3f52prlWQp/sIhr6BhxK1LGrLKv6DqYZF+lR1Ji0ocQ+aggFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW2zjHlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW2zjHlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C831F000FF;
	Wed, 16 Sep 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789539145;
	bh=X6Pgd9VK8mpSZf4/s8Zo2FUO4nqPRKKV5sJgzNVBD/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GW2zjHlD5N61EWUI3NmTflCzPGuJkyU+QXmd1DP/4DgIkjqxgqZ4sCR/5QEY7yYJq
	 rNjrCiGXWYyMwg9/CPji+rkUKcj+x24AzZnnm5tCTC3qAAL9D0E6hlfcJaxkGRd4X9
	 0UH3/soKBy1M/oeP34Qd1GpXlEd5jqJKBwNYVHJ1lbpdEtHm+OidS3tEZ0CtclVGOG
	 amlInPBB3YWEb1dYe3KRTDxfjSvfqvHdoKcO+3ssKawblK2dziIJP52+HKLnRr8NWd
	 YfZJ9rCXJUWeOLuBHZghMUPnpLEpWzIjayA6aIjibgibDm4JwKeNOjWxGqph16JfoW
	 7mCy2kMRKOfzA==
Message-ID: <c7a5ff0c-126d-4762-8b04-5897da09b8b1@kernel.org>
Date: Wed, 16 Sep 2026 08:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] mm/hugetlb: use direct assignment instead of
 folio_change_private()
To: Zi Yan <ziy@nvidia.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
 <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
 <CC279633-6F0F-440C-BCDF-1D5362C4CB7B@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CC279633-6F0F-440C-BCDF-1D5362C4CB7B@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/26 03:56, Zi Yan wrote:
> On 13 Sep 2026, at 22:24, Zi Yan wrote:
> 
>> folio_change_private() should be used along with folio_attach_private() and
>> folio_detach_private(), where adding and remove ->private content requires
>> folio refcount change. add_hugetlb_folio() simply sets folio->private to
>> NULL without refcount manipulation. Change it to direct assignment to avoid
>> semantic confusion.
>>
>> It prepares for a future commit that remove PG_private.
>>
>> No functional change intended.
>>
>> Assisted-by: LLM
>> To: Muchun Song <muchun.song@linux.dev>
>> To: Oscar Salvador <osalvador@suse.de>
>> To: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  mm/hugetlb.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index d3a0650ff6905..8d551cdaef9db 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1446,11 +1446,8 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
>>  	}
>>
>>  	__folio_set_hugetlb(folio);
>> -	folio_change_private(folio, NULL);
>> -	/*
>> -	 * We have to set hugetlb_vmemmap_optimized again as above
>> -	 * folio_change_private(folio, NULL) cleared it.
>> -	 */
>> +	/* Clear all folio->private flags except hugetlb_vmemmap_optimized. */
>> +	folio->private = NULL;
>>  	folio_set_hugetlb_vmemmap_optimized(folio);
>>
> 
> Sashiko[1] said when a CMA hugetlb folio is freed but fails vmemmap restore,
> add_hugetlb_folio() clears HPG_cma. It either bypasses
> hugetlb_cma_free_frozen_folio() due to the missing HPG_cma flag, or
> skips cma_release() and causes a CMA memory leak if it is free directly
> to buddy allocator. Sashiko also asked if HPG_temporary should be preserved
> as well HPG_cma.
> 
> Answer:
> 
> Missing HPG_cma is a real issue. It can be fixed by checking
> folio_test_hugetlb_cma(folio) at the beginning of add_hugetlb_folio() and
> setting HPG_cma after folio->private is assigned to NULL.


Maybe we should just simply only clear flags we actually want to clear ...

-- 
Cheers,

David

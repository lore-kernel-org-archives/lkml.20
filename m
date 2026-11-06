Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933316;
	b=jj806UHgLbIuI52HnIJ0UAizQaag7G7grrYd+gAYJIC4FOSUFbdtRw+YgkME4L/pUUve
	 qVfQRZuXR5+2spRSgUKKD31oT44gOhwf2FIXYHqLkTYWXlcC8A3QH191J9Wz/rKoyaW/g
	 C9Vf1VUmbrT57XUx2euq9IiMLBqB9176HdJPfH+B9TmmLAqNPmVwWxDeQVoDrL/r7miUk
	 KVJDnepCHOeG710pbAtv1At4cmnP4fQJyFu3ZnmZQikep9SXWEh/vbTuOA9nowHqSIJ6P
	 vamVGdhFEacwaf8xXhpRMNn8uoEPUOso28CYsCU/c2W1OvsCCYE6fjm8qFNFOpLqT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Fxf58g0TgGhF1yT/rrtFZDRdTjLoj8v89GwaFQtO71M=;
	b=DdGdqXKKAQNFCNKtiN7LnHDyTY2CNzYR8hZuRrmmqB3rTt2LMtS+/a2geUCgJLLVqi6y
	 LgWkUWHjwpNyDtSv8Vw7zMkhO3t/BdmzSBviD3RrYijXcapKmo0vj7u8+R+/6a8316vHA
	 /YI523H1bNxA5Gz6BmQ61u44LHdiYUkcBvFy702TRTyFV2JFmI+L3twqzpLq3CyQf8Jr4
	 u77KUWYr98dzyc3t8H7TVVhREYYhDDDfxIqZO0uJAQnVxb86bXtfokMtuZkODGEcaTCba
	 BlE10LlWMxwpDb7wqhlKYqCO4MY9AhB8zhzZhh70GfeoEqF4ZJWnr7mLRQIwQ6Uys1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uvhHOEWv;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F87606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uvhHOEWv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SM3myxb12+rHgjUddvdUVXaCWkzw2vEprAopNzsf1mo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793933313; v=1; x=1794538113;
 b=uvhHOEWvqy6sAM+6/gXJCojsIjwPbYdBuRvyNSCuCZGq7nDWRPS2zgPwJ18brhhfnbADc8RN
 LQ9p6yaGheoLRIam3txDylQTEsCj6oZNCTcy2H1oYoJBjiVzpgY6RyQh3EfVITHKR5v7BeIuAlK
 IzmDph8NWpbTX+fWe7imLkQs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 63fa14448a3d1f35;
	Fri, 06 Nov 2026 02:48:32 +0000
X-Mizu-Trace-ID: 63fa14448a3d1f35
X-Migadu-Flow: FLOW_OUT
Message-ID: <39b7ecd4-e5a1-48d9-8d34-4bf8f8ad4ca2@linux.dev>
Date: Fri, 6 Nov 2026 10:48:28 +0800
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
Subject: Re: [PATCH v2 2/4] mm: gup: allow long-term pins of CMA-allocated
 HugeTLB folios
To: Muchun Song <muchun.song@linux.dev>
Cc: osalvador@suse.de, David Hildenbrand <david@kernel.org>,
 akpm@linux-foundation.org, azpijr@gmail.com,
 Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <818fb0b4bbb234e4a2bd0552d61634f1a8431616.1793850539.git.zhengqi.arch@bytedance.com>
 <8F5F930D-A05E-4255-8E70-2567921A92A0@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <8F5F930D-A05E-4255-8E70-2567921A92A0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 1:13 PM, Muchun Song wrote:
> 
> 
>> On Nov 5, 2026, at 12:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
>> unpinnable, causing unnecessary migration or pinning failures.
>>
>> These folios already own their CMA bitmap ranges, and memory blocks
>> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
>> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
>>
>> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
>> Cc: stable@vger.kernel.org
>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

> 
> But a nit bellow.
> 
>> ---
>> include/linux/mm.h | 29 +----------------------------
>> mm/gup.c           | 31 +++++++++++++++++++++++++++++++
>> 2 files changed, 32 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 2d0b8a4c9974f..75dd40265d3f4 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2975,35 +2975,8 @@ static inline bool is_zero_folio(const struct folio *folio)
>> 	return is_zero_page(&folio->page);
>> }
>>
>> -/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin folios */
>> #ifdef CONFIG_MIGRATION
>> -static inline bool folio_is_longterm_pinnable(struct folio *folio)
>> -{
>> -#ifdef CONFIG_CMA
>> -	int mt = folio_migratetype(folio);
>> -
>> -	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
>> -		return false;
>> -#endif
>> -	/* The zero page can be "pinned" but gets special handling. */
>> -	if (is_zero_folio(folio))
>> -		return true;
>> -
>> -	/* Coherent device memory must always allow eviction. */
>> -	if (folio_is_device_coherent(folio))
>> -		return false;
>> -
>> -	/*
>> -	 * Filesystems can only tolerate transient delays to truncate and
>> -	 * hole-punch operations
>> -	 */
>> -	if (folio_is_fsdax(folio))
>> -		return false;
>> -
>> -	/* Otherwise, non-movable zone folios can be pinned. */
>> -	return !folio_is_zone_movable(folio);
>> -
>> -}
>> +bool folio_is_longterm_pinnable(struct folio *folio);
>> #else
>> static inline bool folio_is_longterm_pinnable(struct folio *folio)
>> {
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 2b405cce2ca5c..e8503141bb275 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2216,6 +2216,37 @@ struct page *get_dump_page(unsigned long addr, int *locked)
>>
>> #ifdef CONFIG_MIGRATION
>>
>> +bool folio_is_longterm_pinnable(struct folio *folio)
>> +{
>> +#ifdef CONFIG_CMA
>> +	int mt = folio_migratetype(folio);
>> +
>> +	/* Explicit HugeTLB CMA allocations own their bitmap ranges. */
> 
> The description of "bitmap ranges" is weird, making me think what's the meaning of
> bitmap. Please use more generic description here.

How about this:

/* These HugeTLB folios own the CMA memory, so they can be long-term 
pinned. */

Thanks,
Qi

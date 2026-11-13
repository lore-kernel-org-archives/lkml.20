Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537136;
	b=FASNCS82Zk1YcsFqIwUH+QxLU60gZ02dNRhHFPwgg1tvWtWP5VMz2tRPD1uj8D/1xmjx
	 3udqQfcWa6X8uvnl9ZUGU5gRm8JJExAAjv3E1CBqU+CVCNYkc8DG/C52vZeNnubYlA0j6
	 au5MdWl17M3Ohd0KPd2O/xc/hNlrmH5FJnqHwJy69sNt2E0UIRaFp7PZ3uM8R1fakkNWn
	 aL2m3M2u7ZLCzty+lJ/mYMWhdbFvjs3com4t31BIGCvvXmmdQNF3diFyDQgx1qn6MiWIU
	 7a/kobDcT5q7AzEpeInVWM/+puZ037kwtDprby5KTpZCNN6rxpVkjBZ+XdLNNHNoSPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537136;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lbpLTpOGMpA+HgcOkuaLW9mLJLwh3XI+GukCg+jrEFM=;
	b=RA8FUhQhVgcFQYu46R8YemgduhwbHlTCUKDCXmw9j/ARccW+LTG5VIiqoWuNMv6JdIWz
	 dn5M3mFg8pbk2KHqoFqw+F2/H8zzP5W1LnhK746w4M17lTQL1EBKXL5lrdwrNipD5yOaS
	 MlUcoFn7X18ydm92Pl4UKl7/BrZp6tULbeGBSkxJaSKg8yQw4mVNb3wK3TtTd/nidwXTB
	 OWWoJ55q3vL3qh+AplQZ+1780vKB6Qjx48H56Sc8XDGNhSt1OUOIXPCiFZPCNPhIVVGMT
	 4TfqwqvWgwyHfz9PGiwS3w2WqAzFMn3k7FWf5JlUqndRTDr7CDMw5skvh24Tcl2wsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gfsdFogV;
	arc=none smtp.remote-ip=95.215.58.106
Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C8606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915C8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gfsdFogV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rPYNFO6YVUN4UZ9ePQsjHDKAQ5JmLGEIdbmrTTalDLg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794537133; v=1; x=1795141933;
 b=gfsdFogVEW4Zflj3Q2WrLFOcUfh9cxOqpK21xmbi3TyuovSp4b40nuUQyrxbpUrxs+bhPWMD
 rjQ/y9uM0/wVszDfyL6CFaK7OtbQQS8GEmIwVwFXqEO0N6J65TSU3btXekNOs11CndaTtnZ7Y9W
 oQLdbD0NMIghJrjwYVhjpKOY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92e45a4d795c9232;
	Fri, 13 Nov 2026 02:32:13 +0000
X-Mizu-Trace-ID: 92e45a4d795c9232
X-Migadu-Flow: FLOW_OUT
Message-ID: <1cd3c151-24c2-4fec-8356-99853f8d6971@linux.dev>
Date: Fri, 13 Nov 2026 10:30:46 +0800
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
Subject: Re: [PATCH v4 3/3] mm: hugetlb: fix GFP mask propagation to CMA
To: Kefeng Wang <wangkefeng.wang@huawei.com>, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 azpijr@gmail.com, lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 "Oscar Salvador (SUSE)" <osalvador@kernel.org>
References: <cover.1794379433.git.zhengqi.arch@bytedance.com>
 <1c5e8c4ae230dc238a16f2f42d65bffac6244ad3.1794379434.git.zhengqi.arch@bytedance.com>
 <7def88b4-cba5-4e8b-9e68-6069c492b582@huawei.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <7def88b4-cba5-4e8b-9e68-6069c492b582@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/26 7:27 PM, Kefeng Wang wrote:
> 
> 
> On 11/11/2026 2:46 PM, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
>> during the first MPOL_PREFERRED_MANY allocation attempt even though
>> the caller clears __GFP_DIRECT_RECLAIM.
> 
> MPOL_PREFERRED_MANY is only used for the partner allocator. Without your

It's doesn't seem so.

Gigantic surplus allocations already use MPOL_PREFERRED_MANY, following
eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages"),
which predates 9bda131c6093.

alloc_buddy_hugetlb_folio
--> MPOL_PREFERRED_MANY
     --> gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
         folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid, nodemask);
         --> alloc_fresh_hugetlb_folio
             --> only_alloc_fresh_hugetlb_folio
                 --> alloc_gigantic_frozen_folio
                     --> hugetlb_cma_alloc_frozen_folio
                         --> cma_alloc_frozen_compound

Before 9bda131c6093, cma_alloc_folio() forwarded the caller's GFP mask.
The conversion to cma_alloc_frozen_compound() replaced it with
GFP_KERNEL, re-enabling direct reclaim during the preferred-node
attempt.

Right?

Thanks,
Qi

> patches "mm: hugetlb: add CMA support for PMD-sized pages,"
> cma_alloc_frozen_compound() is only used for huge page allocations. In
> this case, I think we don't need the gfp flag, which is why I hardcoded
> it, so there's no need for the Fixes tag; this patch should be part of
> your new feature. Maybe I missed something?
> 
>>
>> Pass the caller's GFP mask through the helper so CMA respects its
>> reclaim constraints when trying the preferred nodes.
>>
>> Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Acked-by: Muchun Song <muchun.song@linux.dev>
>> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>
>> ---
>>   include/linux/cma.h |  2 +-
>>   mm/cma.c            | 10 ++++++++--
>>   mm/hugetlb_cma.c    |  4 ++--
>>   3 files changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/cma.h b/include/linux/cma.h
>> index 8555d38a97b1a..4539ea5f2c4e8 100644
>> --- a/include/linux/cma.h
>> +++ b/include/linux/cma.h
>> @@ -53,7 +53,7 @@ extern bool cma_release(struct cma *cma, const 
>> struct page *pages, unsigned long
>>   struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
>>           unsigned int align, bool no_warn);
>> -struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
>> order);
>> +struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
>> order, gfp_t gfp);
>>   bool cma_release_frozen(struct cma *cma, const struct page *pages,
>>           unsigned long count);
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 9ec1d1fd5dff5..a7c47c0e7d070 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -933,9 +933,15 @@ struct page *cma_alloc_frozen(struct cma *cma, 
>> unsigned long count,
>>       return __cma_alloc_frozen(cma, count, align, gfp);
>>   }
>> -struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
>> order)
>> +struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
>> order, gfp_t gfp)
>>   {
>> -    gfp_t gfp = GFP_KERNEL | __GFP_COMP | __GFP_NOWARN;
>> +    /*
>> +     * The only caller of cma_alloc_frozen_compound() is hugetlb, and
>> +     * hugetlb constructs its gfp mask via htlb_alloc_mask(), which 
>> already
>> +     * sets __GFP_COMP. Check here for usecases bypassing 
>> htlb_alloc_mask().
>> +     */
>> +    if (WARN_ON_ONCE(!(gfp & __GFP_COMP)))
>> +        return NULL;
>>       return __cma_alloc_frozen(cma, 1 << order, order, gfp);
>>   }
>> diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
>> index cd6a64986278a..3e5a30571524a 100644
>> --- a/mm/hugetlb_cma.c
>> +++ b/mm/hugetlb_cma.c
>> @@ -69,14 +69,14 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int 
>> order, gfp_t gfp_mask,
>>       }
>>       if (hugetlb_cma[nid] && node_isset(nid, *nmask))
>> -        page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
>> +        page = cma_alloc_frozen_compound(hugetlb_cma[nid], order, 
>> gfp_mask);
>>       if (!page && !(gfp_mask & __GFP_THISNODE)) {
>>           for_each_node_mask(node, *nmask) {
>>               if (node == nid || !hugetlb_cma[node])
>>                   continue;
>> -            page = cma_alloc_frozen_compound(hugetlb_cma[node], order);
>> +            page = cma_alloc_frozen_compound(hugetlb_cma[node], 
>> order, gfp_mask);
>>               if (page)
>>                   break;
>>           }
> 


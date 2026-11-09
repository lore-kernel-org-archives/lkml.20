Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193868;
	b=GyrkAVfRR5j/OfycaSxqY8HYX2sUCNRlAa9+86KB86gKqKRULRfcDTWEOli0LecdXp4Z
	 8Ul6pgss4UhdZ4SbjTedchPDGJNdhcyHlY1J6+OGw9r4Vgo9OKV4p9YAl7yllfzggpmfc
	 gNKcHBiSByVITVn84S75QRsXLxQQYw4N9fPVTeVjO2+Mc2iiuG4OFc5L4Xb49GLRHAsIC
	 DJkikN2alEqk3DDNeEg67cEvEleehnVB+BTUPeBK5g09EhyXH7MQKWVoFbUNC/rSsyPmW
	 LVe0qo//QxQALSaTCI2wBM70Mq7wOFzXN2H3c2iuLqs0uiyOJeb890dMBe60MGY9pnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193868;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iMGfPTTtDg5EzJ91P2PF2WwXNpU6yv+yBoe1TBxGD/c=;
	b=aaq5PFywJ2q50/QXC0siCaoHT0l6vi60FmEY+IQr7SdV3Y3ZKm8oTVaNrDcK8V5ekqbD
	 0GFaImHkqnbhcdleyngogrxmab9j26mvjtp4HPQjz12DZWcaf3u1olH4Gb94bM+urNTcZ
	 Bn2tD2gP4Xax6wI/4YMlWiPaWxLunsRWfVDZibafehpLoyMCzPcLg1+x69IdcmlujHo4R
	 mvbj7ojv2GGlm8fyPRwUCU9bbj8Ud7bZcjpwQQSfxXkIOt8Gz+oEuwlhiJ3fThdI9jo35
	 88ywp3t+Y/Mh5N5QJ94ITd98ppdJbC6gjflwMTiwIswsa9BnVKHaNpNg0bO2Hi4OF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OU7844Pu;
	arc=none smtp.remote-ip=95.215.58.82
Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8D606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OU7844Pu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=397/iKYYDV9/c98+8Zdk/ANop6jNsXxFQVhqLErzJm4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193865; v=1; x=1794798665;
 b=OU7844PuvsVN8vQIztiQ9rON4du1bLDFAfDyXgSS5uVLT+YX2SyGMUm2N/z5LpGw34RpEMLz
 tJ5e7k1UCBJPwNSeJPZd13yR3AXUqbnY0szt2ziU+Ldagp4nZ/knIHAOVaQTIt7/VhfilaW/XGa
 MPC4M1oP0OFNmoMq0UfBgSfU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8422819e0d5f8816;
	Mon, 09 Nov 2026 03:11:05 +0000
X-Mizu-Trace-ID: 8422819e0d5f8816
X-Migadu-Flow: FLOW_OUT
Message-ID: <c266ecbe-167e-4a99-9e40-ea4740eda7c8@linux.dev>
Date: Mon, 9 Nov 2026 11:10:56 +0800
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
Subject: Re: [PATCH v3 3/3] mm: hugetlb: fix GFP mask propagation to CMA
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 akpm@linux-foundation.org, azpijr@gmail.com, lance.yang@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <61ee04513d6cac32347ebec9b295025b8a1f07ca.1794046188.git.zhengqi.arch@bytedance.com>
 <au9ZvQObSY3y2s2c@localhost.localdomain>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <au9ZvQObSY3y2s2c@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/26 1:02 AM, Oscar Salvador (SUSE) wrote:
> On Sat, Nov 07, 2026 at 06:30:47PM +0800, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
>> during the first MPOL_PREFERRED_MANY allocation attempt even though
>> the caller clears __GFP_DIRECT_RECLAIM.
>>
>> Pass the caller's GFP mask through the helper so CMA respects its
>> reclaim constraints when trying the preferred nodes.
>>
>> Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Acked-by: Muchun Song <muchun.song@linux.dev>
>> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> 
> Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>
> 
> A comment below:
> 
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -933,9 +933,10 @@ struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
>>   	return __cma_alloc_frozen(cma, count, align, gfp);
>>   }
>>   
>> -struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order)
>> +struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order, gfp_t gfp)
>>   {
>> -	gfp_t gfp = GFP_KERNEL | __GFP_COMP | __GFP_NOWARN;
>> +	if (WARN_ON_ONCE(!(gfp & __GFP_COMP)))
>> +		return NULL;
> 
> I think this needs a comment explaining why we are checking for __GFP_COMP,
> because it might not be obvious to the casual reader.
> Something like:
> 
>   "The only caller of cma_alloc_frozen_compound() is hugetlb, and hugetlb
>    constructs its gfp mask via htlb_alloc_mask(), which already sets
>    __GFP_COMP. Check here for usecases bypassing htlb_alloc_mask()."

OK, will add this comment.

Thanks,
Qi

> 
> 
> Maybe in the future we do have some other users of this function which are outside
> of the hugetlb realm, but if we are propagating the gfp mask down the chain to this
> point, we do have to check that those users are also setting __GFP_COMP.
>    
>   
> 


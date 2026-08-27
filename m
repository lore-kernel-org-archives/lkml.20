Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809A3B47D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817828; cv=none; b=h3m3fVTGW7ENgcpjrJBIgORpl3Uisy9KfqhNhw9rE82Ubfu97aJE4wkfRtaall8cAvdvVg0kIVXTN0c659ICMgFBgBCakDhHVyIKxi4PP5FGYKuuGnjYLflYlHvvdySthNKmN43x3pdPtjXj5aAYU49bqvByead+e2BbvcKg750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817828; c=relaxed/simple;
	bh=aQDgKoxt5v1zKDC5kCoYZVjRSI8CWHJOrytC8u2e2YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pr0Woqjna/qMr1pEzUc9GLAoAdsQV1zlPL2SCuCZcttIrWjkZXZbfVF/bz0I4G5StZnbDieUfxF9zfyI/dbeJk3BgfiLSuZGGQ43/K/KzytKvsYsY/VscfgQHdYcCL0TjLWbosL0xjeqlxeyIUeHG46TtdSIWvCkLDd35jt1KI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrcCTXI+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrcCTXI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB5A1F00A3D;
	Thu, 27 Aug 2026 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787817827;
	bh=cNLnyWjL8DesrYLjnmrDKChGfbafqlwaKvit0A9aYBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BrcCTXI+b79Ps7jW4U9P8tYTSax/uesrCiFgIHl0hEXor8vyMSZyt72JUBlNLZY/z
	 tD3QOsg1AWjDXs+xXwqaJNoHjhj24PXvr/DA9HqEWFkTjZEHA5eHsMKJNn8D351Guc
	 OLG6IsqlWXAipfDO3+F9RYea9DR/O7AF3RRADIQtKnP7AsdhwA9Y7NkRjaZxppiFJB
	 82qzxp4Zz9w3/oZcc9M7zte4so8a+FD2vpWxbPhCwOvAWPoCt/eqYX4LaOvxOpks7Y
	 h4NCeRUVJz4zc534Fj9W/5hMbZcxBNI9bgMPMQsttAe7eAaGi3NC3+WaXqZCaeTbf1
	 wFqZgMj8O7tvQ==
Message-ID: <78561ffa-d075-4570-aaed-60744f11160f@kernel.org>
Date: Thu, 27 Aug 2026 10:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove out-dated document of __GFP_NOFAIL
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Baokun Li <libaokun1@huawei.com>
References: <20260827030548.16631-1-richard.weiyang@gmail.com>
 <cbc344a4-77b7-4282-9bdd-004822642ab5@kernel.org>
 <20260827074921.mracnqv2m2cugasb@master>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260827074921.mracnqv2m2cugasb@master>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 9:49 AM, Wei Yang wrote:
> On Thu, Aug 27, 2026 at 09:35:26AM +0200, Vlastimil Babka (SUSE) wrote:
>> On 8/27/26 5:05 AM, Wei Yang wrote:
>>> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
>>> with __GFP_NOFAIL") remove a warning on allocating large folio with
>>> __GFP_NOFAIL, which is adjusted by commit 903edea6c53f ("mm: warn about
>>> illegal __GFP_NOFAIL usage in a more appropriate location and manner").
>>
>> "which is adjusted by commit" sounds as 903edea6c53f came later than
>> ee040cbd6e48, but it's the opposite. Maybe say "which was placed there"?
>>
> 
> Got it.
> 
>>> While in that commit, it also documented this behavior which is
>>> out-dated now.
>>>
>>> Adjust the document to align to current code, and adjust the comment
>>> while at it.
>>>
>>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>>> Cc: Baokun Li <libaokun1@huawei.com>
>>> ---
>>>  include/linux/gfp_types.h | 2 --
>>>  mm/page_alloc.c           | 2 +-
>>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>>> index 190191411009..24fde8eb73df 100644
>>> --- a/include/linux/gfp_types.h
>>> +++ b/include/linux/gfp_types.h
>>> @@ -243,8 +243,6 @@ enum {
>>>   * used only when there is no reasonable failure policy) but it is
>>>   * definitely preferable to use the flag rather than opencode endless
>>>   * loop around allocator.
>>> - * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
>>> - * not supported. Please consider using kvmalloc() instead.
>>
>> I'm not sure if we want to simply remove the lines, or rather say it's
>> discouraged (instead of not supported) and still suggest kvmalloc() if
>> possible.
>>
> 
> Reasonable.
> 
> As mentioned in [1], kvmalloc() maybe not suitable for some cases, I would
> suggest below change.
> 
>  * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
>  * discouraged. Please consider using kvmalloc() instead if possible.

Yeah that's great! Thanks.

> Or, you prefer only s/supported/discouraged/ ?
> 
> [1]: https://lore.kernel.org/all/aQTHMI3t5mNXp0M1@casper.infradead.org
> 
>>>   */
>>>  #define __GFP_IO	((__force gfp_t)___GFP_IO)
>>>  #define __GFP_FS	((__force gfp_t)___GFP_FS)
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index ab385bc252cc..146f7e0a9462 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>>>  
>>>  	if (unlikely(nofail)) {
>>>  		/*
>>> -		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>>> +		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>>>  		 * otherwise, we may result in lockup.
>>>  		 */
>>>  		WARN_ON_ONCE(!can_direct_reclaim);
> 


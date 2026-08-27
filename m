Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD23F9A10
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846182; cv=none; b=GX6/1YIuO/IoyMbsAT9BNiS8WIUr8mDOJy5m5lZ2vya3cBSItkMru/GGJF7QrTvNP045YVzFXR+xGLNysJhAl9o14jg9Bds+plDhBp+4Xd8UoWEq+lIAsOx9mW8CE4Ie+8K+IRJ+Eo2aucfcz9hJBQrPd+RnVEH6QQj86DFp5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846182; c=relaxed/simple;
	bh=ehVPW6rnCFBXvFyEn0Swl8fpWo4ZcUiImOIeXUr+HiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzS3S/98TaVJeWZu3glTJRZJjfWtGfVK8WeZtoq4Kim7hekzm3Zn9Uurv6p6/jldPLjVf16UdvggG6AvOsbx0AjoxIb8IzivtR5I+jSbKI0lIw2jupYLutWK9JgBwZnMmBPp8Ct4D5laYQnfFZ6ORdJj3ASEL3q73W2wFSvu7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnBLMIbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnBLMIbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C921F00A3A;
	Thu, 27 Aug 2026 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846180;
	bh=CFZM7kipCqrjfRTX1FI+8Lmju/ujloZNsIaYeTnQJuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RnBLMIboNmK700droCbUYEK/N7su/5Jky1PqrEzotOBgEhcEDvs/aF6DyjsyZqUL8
	 GPmZCWEbSz+eL9ZubOaprfSPNPTu0UMBEIzCeizzPhq1NFgRP+FGe6lXVciYY0RdHJ
	 dIweo1AO72T2rBqQEZhXFyw7MuhadOnzas4g4US/2Wl4Jmg94z1cup8pHAOrz3bmGr
	 Py6ifCIyvB5+fc4Ea3FtX4+OA0RXwrJ3ytAV/L2q//D0NTfFK+qP0GojGxAM0Me3iS
	 g2Xm2gRl75KQqAYhVgHB5KTjh25bOzS+J+imxOEVGjleGsHSp1T53nvcCwNc+VxkGo
	 NBJAMZmPPAr2g==
Message-ID: <81085d1e-90b1-429e-9521-a0c7176c6d0d@kernel.org>
Date: Thu, 27 Aug 2026 17:56:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
To: Zi Yan <ziy@nvidia.com>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 ljs@kernel.org, hannes@cmpxchg.org, usama.arif@linux.dev,
 lance.yang@linux.dev, hughd@google.com, baolin.wang@linux.alibaba.com,
 baohua@kernel.org, liam@infradead.org, nico.pache@linux.dev,
 dev.jain@arm.com, ryan.roberts@arm.com, balbirs@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-2-kirill@shutemov.name>
 <c3f16d64-ffe3-46aa-9596-b233f9294fcb@kernel.org>
 <50FDE99F-3E71-47B8-BD88-05AD771C4BDF@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <50FDE99F-3E71-47B8-BD88-05AD771C4BDF@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 17:38, Zi Yan wrote:
> On 27 Aug 2026, at 11:23, David Hildenbrand (Arm) wrote:
> 
>> On 8/26/26 18:20, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> deferred_split_isolate() probes each queued folio with folio_try_get().
>>> folio_try_get() failure is treated as a lost race with folio_put(): clear
>>> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
>>> the folio off the queue.
>>>
>>> The folio_put() race is the most common case for !folio_try_get(), but
>>> it is not the only option. Another scenario is folio_ref_freeze().
>>>
>>> A zero refcount in such cases does not mean the folio is going away.  It
>>> means "don't touch me" and current deferred_split_isolate() doesn't
>>> respect it. It can lead to unqueueing folios from the deferred list for
>>> no reason:
>>
>> Yes.
>>
>>>
>>>     CPU 0                            CPU 1
>>>     ---------------------------      ------------------------------
>>>     freeze a mapped folio            deferred_split_scan()
>>>       folio_ref_freeze()               folio_try_get() fails
>>>                                        folio_clear_partially_mapped()
>>>                                        NR_ANON_PARTIALLY_MAPPED--
>>>                                        folio off the queue
>>>     give up, put it back
>>>       folio_ref_unfreeze()
>>>
>>> The folio is still partially mapped, but it is no longer a split candidate.
>>> Nothing queues it again until part of it is unmapped once more.
>>>
>>> Skip the folio instead: whoever freezes the folio, owns it and owner is
>>> responsible for its fate. It also covers the folio_put() case:
>>> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
>>>
>>> Reported-by: Lance Yang <lance.yang@linux.dev>
>>> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
>>
>> Fixes?
>>
>>> Assisted-by: Claude-Code:claude-opus-5
>>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>>> ---
>>>  mm/huge_memory.c | 19 ++++---------------
>>>  1 file changed, 4 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index ced400f72d43..6281ed993243 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(struct list_head *item,
>>>  	struct folio *folio = container_of(item, struct folio, _deferred_list);
>>>  	struct list_head *freeable = cb_arg;
>>>
>>> -	if (folio_try_get(folio)) {
>>> -		list_lru_isolate_move(lru, item, freeable);
>>> -		return LRU_REMOVED;
>>> -	}
>>> +	/* Lost race to folio_put() or the folio is under folio_ref_freeze() */
>>> +	if (!folio_try_get(folio))
>>> +		return LRU_SKIP;
>>>
>>> -	/*
>>> -	 * We lost race with folio_put(). Read folio state before the
>>> -	 * isolate: folio_unqueue_deferred_split() checks list_empty()
>>> -	 * locklessly, so once removed the folio can be freed any time.
>>> -	 */
>>> -	if (folio_test_partially_mapped(folio)) {
>>> -		folio_clear_partially_mapped(folio);
>>> -		mod_mthp_stat(folio_order(folio),
>>> -			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
>>> -	}
>>> -	list_lru_isolate(lru, item);
>>> +	list_lru_isolate_move(lru, item, freeable);
>>>  	return LRU_REMOVED;
>>>  }
>>>
>>
>> Who will clean up the stats that we used to clean up? That should be mentioned
>> in the commit log, otherwise it looks like some piece of the puzzle is missing.
> 
> It is kinda implied in the last paragraph in the commit log (copied below),
> but I agree that stating it explicitly is better.
> 
> |> Skip the folio instead: whoever freezes the folio, owns it and owner is
> |> responsible for its fate. It also covers the folio_put() case:
> |> __folio_put() unqueues the folio via folio_unqueue_deferred_split().

yes, I read that but was not convinced by it that all existing freezing code
would handle it correctly. So spelling that out more clearly would be best.

-- 
Cheers,

David

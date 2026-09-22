Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3C955C1A7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088530; cv=none; b=KfafzCyxynBaTXiy4Vnq///Ru1IyMpQme5Zf5sVH01FPquv1sZSvbUTK8YsgDaWcKbnQ2ZY3g2hRKk9T/TUOtkfdsDboz4ZcMWnUtlE9sKhaiK2Ly/zF19G595+xY3XTO8/CRLVzYWe8JZdgRMe7FnjY1RnC0jChWLzfPTM3QYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088530; c=relaxed/simple;
	bh=cUW7Lep4DhVG+1N/uF5trcKujEDTkiBzzMD6eXtyhfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ri4wfQOpLa/Nd7TDo72jrcIpTnMd81s9J8sJ7jV3FgXnezsrORQ3oRhS7itIP5OiHAwJHhS8bX9gmhwuerl2ge7PEUR8fjaw3cDs19K3IUku4qJI+NqpFdJAhFpXHiUdN5Gf6tv1dj5SGcqfT4qseVn4BwXGMLTg1VlhKozPP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlCNBB/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlCNBB/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEA11F000FF;
	Tue, 22 Sep 2026 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088529;
	bh=2nC+4Iujr6aKs/X6DmrJUSeJqe7aXLMr7UtX3jEw9Y8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KlCNBB/pRmBcWRkN5rgO1CAIPNCqGtKjNZQDWlNRIpflyWihuVVSoB1WuY85jHBg2
	 i254OvM/DNaWmjsj294C5s6McXHOL9dxgMgQE69ZbesKz3zHghquFjmsm10I3dy/+N
	 7vKwjWbUCFw3R9s9cjoIs4y0qbACZUKITuIXJJAoLimblf7Ss16+tLRkP+GHhix5EW
	 YjwKbEhfOIPrS8ipScASQxJ6qcNXHz7ocvy2CIVE7E3I93XSMtoSJ/unpOtRx2nMs3
	 KT41buPpA6i8lEwxzora/x71CKTIGHAUT8Le8f5TbuxfcNs9441IqxMFKA5JWsETXo
	 pxd8tftqpLGVA==
Message-ID: <f4d4c4d6-cebb-43d7-b5de-c4a94662f081@kernel.org>
Date: Tue, 22 Sep 2026 16:48:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 08/29] mm: recognize PMD swap entries in the softleaf
 layer
To: Usama Arif <usama.arif@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-9-usama.arif@linux.dev>
 <bb4f8cf3-afb4-4497-adc8-6d8fa8982090@kernel.org>
 <47ff450a-c2df-4520-8589-63dbb1746f80@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <47ff450a-c2df-4520-8589-63dbb1746f80@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 15:08, Usama Arif wrote:
> 
> 
> On 18/09/2026 22:56, David Hildenbrand (Arm) wrote:
>> On 9/14/26 14:27, Usama Arif wrote:
>>> Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
>>> before unmapping it, so an ordinary swap entry has never had to appear in a
>>> PMD. Later patches install one there instead, and the softleaf layer is
>>
>> "Prepare for ..."
>>
>>> where every consumer decodes non-present PMDs.
>>>
>>> Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
>>> A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
>>> return NULL rather than interpret a swap offset as a page frame number.
>>>
>>> Unlike migration and device-private entries, a PMD swap entry can also
>>> carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
>>> before decoding. Strip all three overlays unconditionally while we are
>>> here: each clear is a plain bit clear, so testing first only buys a branch.
>>>
>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>>> ---
>>
>>
>> [...]
>>
>>> +/**
>>> + * pmd_is_swap_entry() - Does this PMD entry encode an actual swap entry?
>>> + * @pmd: PMD entry.
>>> + *
>>> + * Returns: true if the PMD encodes a swap entry, otherwise false.
>>> + */
>>> +static inline bool pmd_is_swap_entry(pmd_t pmd)
>>> +{
>>> +	return softleaf_is_swap(softleaf_from_pmd(pmd));
>>>  }
>>
>> We don't have a pte_is_swap_entry(), I guess because we always want to handle
>> different softleaf types through softleaf_from_pte() first.
>>
>>>  
>>>  /**
>>>   * pmd_is_valid_softleaf() - Is this PMD entry a valid softleaf entry?
>>>   * @pmd: PMD entry.
>>>   *
>>> - * PMD leaf entries are valid only if they are device private or migration
>>> - * entries. This function asserts that a PMD leaf entry is valid in this
>>> - * respect.
>>> + * PMD leaf entries are valid only if they are device private, migration,
>>> + * or swap entries. This function asserts that a PMD leaf entry is valid
>>> + * in this respect.
>>>   *
>>>   * Returns: true if the PMD entry is a valid leaf entry, otherwise false.
>>>   */
>>> @@ -660,10 +670,12 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>>>   * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
>>>   * @pmd: PMD entry.
>>>   *
>>> - * The PMD entry is expected to be a valid PMD softleaf entry.
>>> + * The PMD entry is expected to be a valid PMD softleaf entry that references a
>>> + * PFN, that is a migration or device private entry. A PMD swap entry is a valid
>>> + * softleaf entry but encodes swap slots rather than a PFN, so it has no folio.
>>>   *
>>> - * Returns: the folio the softleaf entry references if this is a valid softleaf
>>> - * entry, otherwise NULL.
>>> + * Returns: the folio the softleaf entry references, or NULL if the entry is not
>>> + * a valid PMD softleaf entry or does not reference a PFN.
>>>   */
>>>  static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>>>  {
>>> @@ -673,6 +685,10 @@ static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>>>  		VM_WARN_ON_ONCE(true);
>>>  		return NULL;
>>>  	}
>>> +	if (!softleaf_has_pfn(entry)) {
>>> +		VM_WARN_ON_ONCE(true);
>>> +		return NULL;
>> softleaf_to_folio() does a
>>
>> 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
>>
>> Just curious: why is that not sufficient? Which could would we expect to call
>> into this fuction with nonesense? (same applies to the existing runtime check)
>>
> 
> Because softleaf_to_folio() warns after the damage:
> 
>   static inline struct folio *softleaf_to_folio(softleaf_t entry)
>   {
>           struct folio *folio = pfn_folio(softleaf_to_pfn(entry));
> 
>           VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
> 
> pfn_folio() is page_folio(pfn_to_page(pfn)), and page_folio() is
> _compound_head(), i.e. READ_ONCE(page->compound_info).  So a swap
> offset interpreted as a PFN is already dereferenced by the time the
> warning runs.


Heh, and in softleaf_to_pfn() we have another

	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));

So the one in softleaf_to_page() is rather useless already? :)

-- 
Cheers,

David

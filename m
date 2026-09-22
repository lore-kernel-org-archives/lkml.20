Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B13544D42
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082502; cv=none; b=tJA1moKBcsdLI7yQLgvz0UuVlbm7LryJNrX8BJk0yNOKYEVvS5fHeAN3mp13ndzHtzpv2BJlPqvNWfx+5ERITO7OOTRURcFPVkfIvuVmFnJrHr7apoAd8MaJ7yFAHtYjpK7rhMPvWP4qRMJRtxW00h55R1ZLd59soP5B0WFtcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082502; c=relaxed/simple;
	bh=0Alsyxotn/BT24NUFO3uaJEACOJcA+aK/asZoGhrk7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZJiMyP4R0uP7psp0xndKnoTxLSmvyFG/Bqqi+awXONVEVftL8qWoyXrVaryawASMo6DtpUkUxpsVcpXQ2CNYTuxQsS/zJi3UOjR1Z70jhe7DgatPI6bN6aujaX9V+M9BOG0jPc1rWA6+QWE7o+9ioozVROmaR1phWc8kxk3Dqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k4Ly927A; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k4Ly927A"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0Alsyxotn/BT24NUFO3uaJEACOJcA+aK/asZoGhrk7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790082498; v=1; x=1790687298;
 b=k4Ly927AxwTDx+IqTVAQvR41odXWaapkByxEgIXFyjeDAr+M5DXLHOkZwNzJGWeB3qExjh1U
 1VWZ3ac9kRstHDVAfgMjEjWuRRC6NdxAA6n2U8uXvLLwYgTFCPKB4bFpyiSmCeMoIIWD23leVwD
 OTz5WSDADRE92f0Vpc3ojt3Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 659ba7dc6cd41b5b;
	Tue, 22 Sep 2026 13:08:17 +0000
X-Mizu-Trace-ID: 659ba7dc6cd41b5b
X-Migadu-Flow: FLOW_OUT
Message-ID: <47ff450a-c2df-4520-8589-63dbb1746f80@linux.dev>
Date: Tue, 22 Sep 2026 14:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 08/29] mm: recognize PMD swap entries in the softleaf
 layer
To: "David Hildenbrand (Arm)" <david@kernel.org>,
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
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <bb4f8cf3-afb4-4497-adc8-6d8fa8982090@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 22:56, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:27, Usama Arif wrote:
>> Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
>> before unmapping it, so an ordinary swap entry has never had to appear in a
>> PMD. Later patches install one there instead, and the softleaf layer is
> 
> "Prepare for ..."
> 
>> where every consumer decodes non-present PMDs.
>>
>> Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
>> A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
>> return NULL rather than interpret a swap offset as a page frame number.
>>
>> Unlike migration and device-private entries, a PMD swap entry can also
>> carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
>> before decoding. Strip all three overlays unconditionally while we are
>> here: each clear is a plain bit clear, so testing first only buys a branch.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
> 
> 
> [...]
> 
>> +/**
>> + * pmd_is_swap_entry() - Does this PMD entry encode an actual swap entry?
>> + * @pmd: PMD entry.
>> + *
>> + * Returns: true if the PMD encodes a swap entry, otherwise false.
>> + */
>> +static inline bool pmd_is_swap_entry(pmd_t pmd)
>> +{
>> +	return softleaf_is_swap(softleaf_from_pmd(pmd));
>>  }
> 
> We don't have a pte_is_swap_entry(), I guess because we always want to handle
> different softleaf types through softleaf_from_pte() first.
> 
>>  
>>  /**
>>   * pmd_is_valid_softleaf() - Is this PMD entry a valid softleaf entry?
>>   * @pmd: PMD entry.
>>   *
>> - * PMD leaf entries are valid only if they are device private or migration
>> - * entries. This function asserts that a PMD leaf entry is valid in this
>> - * respect.
>> + * PMD leaf entries are valid only if they are device private, migration,
>> + * or swap entries. This function asserts that a PMD leaf entry is valid
>> + * in this respect.
>>   *
>>   * Returns: true if the PMD entry is a valid leaf entry, otherwise false.
>>   */
>> @@ -660,10 +670,12 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>>   * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
>>   * @pmd: PMD entry.
>>   *
>> - * The PMD entry is expected to be a valid PMD softleaf entry.
>> + * The PMD entry is expected to be a valid PMD softleaf entry that references a
>> + * PFN, that is a migration or device private entry. A PMD swap entry is a valid
>> + * softleaf entry but encodes swap slots rather than a PFN, so it has no folio.
>>   *
>> - * Returns: the folio the softleaf entry references if this is a valid softleaf
>> - * entry, otherwise NULL.
>> + * Returns: the folio the softleaf entry references, or NULL if the entry is not
>> + * a valid PMD softleaf entry or does not reference a PFN.
>>   */
>>  static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>>  {
>> @@ -673,6 +685,10 @@ static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>>  		VM_WARN_ON_ONCE(true);
>>  		return NULL;
>>  	}
>> +	if (!softleaf_has_pfn(entry)) {
>> +		VM_WARN_ON_ONCE(true);
>> +		return NULL;
> softleaf_to_folio() does a
> 
> 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
> 
> Just curious: why is that not sufficient? Which could would we expect to call
> into this fuction with nonesense? (same applies to the existing runtime check)
> 

Because softleaf_to_folio() warns after the damage:

  static inline struct folio *softleaf_to_folio(softleaf_t entry)
  {
          struct folio *folio = pfn_folio(softleaf_to_pfn(entry));

          VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));

pfn_folio() is page_folio(pfn_to_page(pfn)), and page_folio() is
_compound_head(), i.e. READ_ONCE(page->compound_info).  So a swap
offset interpreted as a PFN is already dereferenced by the time the
warning runs.

As for who would call it with nonsense: nobody today. zap_huge_pmd()
is the only path that reaches it with a non-present PMD and it takes
the pmd_is_swap_entry() branch first.


> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 


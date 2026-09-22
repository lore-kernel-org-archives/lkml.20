Received: from mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BE5476C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081485; cv=none; b=lxTyzXuOhpO2Ghg/K2Cu6yISYS3uCh0Eaiyf4cotT1Uf9QEeeP4aWYGG1jpuXnlwmj/jE3ZBsRUSyohkBr7LLYardPKlr6UvqZWQRI+KIsEjgt1ny8GCKne2jGEjeOlb/S8929Q689asS5TJtEZgASpoEC3s0WRlyEQfeiIlHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081485; c=relaxed/simple;
	bh=Rd7i7Ne1v4a3mXkwREpKYjo7sQ/rKatj8SZMtz3c+SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KplK68TPP/nEYq+U+6BuoDT16boMrwe09ablr4BVuHvhRN2ICgCBrPehSF6wf/y0fQbe0BZ/y6kxpbiCNlcFMiOgOvIjA90gSOp5He1qXPyE4HVNf8AOIMzMsudJOTthidmrg5GVZWSEkmQwpX2iSJkQHtTEt1crs8psCfdgcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XwVWEBeR; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XwVWEBeR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Rd7i7Ne1v4a3mXkwREpKYjo7sQ/rKatj8SZMtz3c+SY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790081480; v=1; x=1790686280;
 b=XwVWEBeRgAo1mNXe9AB/nvgTjlsiCgJUJZTEEiGwaWJcJ0+MojZMluaabEsTd93z5I0HN9xH
 d+jtgbZjWb4PCb/SN/4OSPSKoa0NXCF6bH+7K5CxbyqQY/D/vFX8E+Hrn7vLHIZb3dVgIBFD2XF
 dH7NKlSV9rg6ERmRUXoGAeqA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2bd109f32689452;
	Tue, 22 Sep 2026 12:51:19 +0000
X-Mizu-Trace-ID: e2bd109f32689452
X-Migadu-Flow: FLOW_OUT
Message-ID: <78f80b94-e0d4-47d0-8b1c-3fd5d850a875@linux.dev>
Date: Tue, 22 Sep 2026 13:51:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 06/29] s390: mm: add PMD swap-exclusive helpers
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
 luizcap@redhat.com, kernel-team@meta.com,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-7-usama.arif@linux.dev>
 <92d0078e-afdc-422a-b624-0a3ca9aa307c@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <92d0078e-afdc-422a-b624-0a3ca9aa307c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 22:41, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:27, Usama Arif wrote:
>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
>> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
>> not just in a swap PTE.
>>
>> s390 is the one architecture where a swap PMD is not a swap PTE in
>> disguise: it is an RSTE with its own layout, converted to a fake PTE swap
>> entry for the common code. Give it its own exclusive bit rather than
>> borrowing the PTE-format macro. The two happen to have the same value, but
>> that is a coincidence. Bit 52 was documented as unused; document what it
>> is now.
>>
>> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
>> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/s390/include/asm/pgtable.h | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>> index 2d5c2ab06de98..0790a0884cfab 100644
>> --- a/arch/s390/include/asm/pgtable.h
>> +++ b/arch/s390/include/asm/pgtable.h
>> @@ -333,6 +333,7 @@ void setup_protection_map(void);
>>  /* Common bits in region and segment table entries, for swap entries */
>>  #define _RST_ENTRY_COMM		0x0010	/* Common-Region/Segment, marks swap entry */
>>  #define _RST_ENTRY_INVALID	0x0020	/* invalid region/segment table entry */
>> +#define _RST_ENTRY_SWP_EXCLUSIVE 0x0800	/* SW exclusive swap bit, see mk_swap_rste() */
>>  
>>  #define _CRST_ENTRIES	2048	/* number of region/segment table entries */
>>  #define _PAGE_ENTRIES	256	/* number of page table entries	*/
>> @@ -859,6 +860,28 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>  	return clear_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
>>  }
>>  
>> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>> +/*
>> + * A PMD swap entry is an RSTE, not a PTE, so it needs its own exclusive bit
>> + * rather than the PTE-format _PAGE_SWP_EXCLUSIVE.  The two happen to have the
>> + * same value; see the RSTE swap layout above mk_swap_rste().
>> + */
> 
> I'm not sure the documentation here is warranted. It's all documented above
> above __SWP_OFFSET_MASK_RSTE, no? I'd just extend the documentation there and
> keep it away from these helpers that just use the bit.
> 
> The fact that they use the same bit doesn't really matter.

Ack, dropped for next revision.

> 
>> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
>> +{
>> +	return set_pmd_bit(pmd, __pgprot(_RST_ENTRY_SWP_EXCLUSIVE));
>> +}
>> +
>> +static inline bool pmd_swp_exclusive(pmd_t pmd)
>> +{
>> +	return pmd_val(pmd) & _RST_ENTRY_SWP_EXCLUSIVE;
>> +}
>> +
>> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
>> +{
>> +	return clear_pmd_bit(pmd, __pgprot(_RST_ENTRY_SWP_EXCLUSIVE));
>> +}
>> +#endif
> 
> I guess we could move it above the pmd_swp_soft_dirty() stuff in the same
> CONFIG_ARCH_HAS_PMD_SOFTLEAVES block.
> 

Done for the next revision.
>> +
>>  static inline int pte_soft_dirty(pte_t pte)
>>  {
>>  	return pte_val(pte) & _PAGE_SOFT_DIRTY;
>> @@ -1900,15 +1923,16 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
>>   * Bits 59 and 63 are used to indicate the swap entry. Bit 58 marks the rste
>>   * as invalid.
>>   * A swap entry is indicated by bit pattern (rste & 0x011) == 0x010
>> - * |			  offset			|Xtype |11TT|S0|
>> + * |			  offset			|Etype |11TT|S0|
>>   * |0000000000111111111122222222223333333333444444444455|555555|5566|66|
>>   * |0123456789012345678901234567890123456789012345678901|234567|8901|23|
>>   *
>>   * Bits 0-51 store the offset.
>> + * Bit 52 (E) is used to remember PG_anon_exclusive
>> + * (_RST_ENTRY_SWP_EXCLUSIVE), mirroring bit 52 of a swap pte.
>>   * Bits 53-57 store the type.
>>   * Bit 62 (S) is used for softdirty tracking.
>>   * Bits 60-61 (TT) indicate the table type: 0x01 for REGION3 and 0x00 for SEGMENT.
>> - * Bit 52 (X) is unused.
>>   */
>>  
>>  #define __SWP_OFFSET_MASK_RSTE	((1UL << 52) - 1)
> 
> IIRC, __pmd_to_swp_entry() and __swp_entry_to_pmd() will lose the flag, which is
> the right thing to do.
> 
> So conceptually LGTM.
> 

Thanks for all the reviews!

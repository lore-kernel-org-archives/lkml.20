Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8E544D5B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089450; cv=none; b=hLOPF3LUImXhUmZg8f1h4yl8PFDrBU9YSk+s7F2lrDvnu64HXCidOeD5hq5yk/smdDK0GqODFhIpZ5BtvZBqbZdQ4ds4TLHZjCAt999ZtucDpaDz8maQS0AaHYFPxKwn4ftJUSh0UUxml1k/VylSWeuAh0ZcsEdzZf9EHO5Qyr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089450; c=relaxed/simple;
	bh=y+LCUdEE09122n2Tb/Z0cY6K/0y14n1YrOrFxuwwzs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=st8t+Wmn29VvZZ0n3wWLmdAxHAtUpmZnOb+Y3tJJa5s2X+dJbfaZ3y792UM5g2IYhr9AYwVbJ+Pd5RWLPmru/vlpSQGXdnuW8TE2Xxy3dOzhb6+htghnQAFnYWnzxlrUo/xrchmjJl8Ddub/BghbIAIpGZiGGTO+gbbs/PBF6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Teu4L1D6; arc=none smtp.client-ip=91.218.175.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Teu4L1D6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y+LCUdEE09122n2Tb/Z0cY6K/0y14n1YrOrFxuwwzs4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790089443; v=1; x=1790694243;
 b=Teu4L1D6KPXdg4JlVg4TkEg0rMIvLZ70JP/YisX9QG+hn42tg+BkITgA3qqgnagTlPDoOyDg
 qf4ssTHcPGcEsbHWjrx74snP44XIbcjlm57sQhytZiAh3vkjZudYZ+os2D2zP7JrXo/rPKKvSiz
 WvKPGIvAOrdHPprQe6AJqvl8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56074787bb66b1d3;
	Tue, 22 Sep 2026 15:04:02 +0000
X-Mizu-Trace-ID: 56074787bb66b1d3
X-Migadu-Flow: FLOW_OUT
Message-ID: <1fe0f6d0-1d99-45f6-bc3b-7e78dc6047f8@linux.dev>
Date: Tue, 22 Sep 2026 16:03:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 02/29] arm64: mm: add PMD swap-exclusive helpers
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-3-usama.arif@linux.dev>
 <35e42ccc-df8f-4703-b10d-f7c96b263e98@kernel.org>
 <93e71e27-86d7-4853-bbd2-756ac137a925@linux.dev>
 <64b10ef4-428c-47dc-a97c-59ba178a9044@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <64b10ef4-428c-47dc-a97c-59ba178a9044@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/09/2026 15:45, David Hildenbrand (Arm) wrote:
> On 9/22/26 14:34, Usama Arif wrote:
>>
>>
>> On 18/09/2026 22:11, David Hildenbrand (Arm) wrote:
>>> On 9/14/26 14:27, Usama Arif wrote:
>>>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
>>>> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
>>>> not just in a swap PTE.
>>>>
>>>> arm64 encodes a swap PMD exactly like a swap PTE, so the new helpers wrap
>>>> the PTE ones and reuse PTE_SWP_EXCLUSIVE.
>>>>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Will Deacon <will@kernel.org>
>>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>>>> ---
>>>>  arch/arm64/include/asm/pgtable.h | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index e89ec5f4787b4..d3f53a601aed3 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -599,6 +599,12 @@ static inline int pmd_protnone(pmd_t pmd)
>>>>  #define pmd_swp_clear_uffd(pmd) \
>>>>  				pte_pmd(pte_swp_clear_uffd(pmd_pte(pmd)))
>>>>  #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>>>> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>>>> +#define pmd_swp_exclusive(pmd)	pte_swp_exclusive(pmd_pte(pmd))
>>>> +#define pmd_swp_mkexclusive(pmd)	pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
>>>> +#define pmd_swp_clear_exclusive(pmd) \
>>>> +				pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
>>>> +#endif
>>>
>>> Why do we #ifdef that here, but not the uffd-wp swp PMD helper?
>>>
>>
>> uffd-wp is gated on CONFIG_HAVE_ARCH_USERFAULTFD_WP.
>>
>> If I removed the CONFIG_ARCH_HAS_PMD_SOFTLEAVES guards above, when THP=n, arm64
>> will use the generic macro which is wrong.
>>
>> I tried building uffd-wp swp with just ARCH_HAS_PMD_SOFTLEAVES guard and I got
>> the build error 
>>
>>   mm/page_table_check.c:232:20: error: implicit declaration of
>>   function 'pmd_swp_uffd'
>>
>> we will probably need a separate patch like:
>>
>>   #ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>>   static inline bool pmd_softleaf_uffd(pmd_t pmd)
>>   {
>>           return pmd_swp_uffd(pmd);
>>   }
>>   #else
>>   static inline bool pmd_softleaf_uffd(pmd_t pmd)
>>   {
>>           return false;
>>   }
>>   #endif
>>
>>
>> to avoid the above build error.
> 
> Just to explain where I am coming from: for all these patches I took a look how
> the other pmd_swp_* functions where handled (and separated from the pte_swp_*
> variants). Nothing earth shattering, was mostly looking for keeping things
> consistent within these architecture codes.
> 

Makes sense, this is how I wrote the functions as well, just looking at the
existing functions.


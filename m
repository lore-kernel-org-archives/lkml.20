Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB0541458
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080515; cv=none; b=uXERnreipo25CdXeVDCE67C2W3kxZWiyCqIxIxgNWS+rLF8/9YgnpscGthLywVFC/eyQOquEAEKAA1M3wJruaHEY3dLv000JC0pEESWcmfe7J/+mw3sCwPNXqTpwxXE9dXDMSQ6VtfBeAxW6QH1jcgIz3JsV20nwPxVymzenGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080515; c=relaxed/simple;
	bh=Xwtckas4LnrLCXkCKb5n3gLZW22/ubZm4385L/A1/Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6m+6fhFgAKSwoCc6yrx66+ftYgfIMGpwKQfzNzCo80wcerdMfJqFF9WH9DRP8VctGNw2rBak7MVBKSeZB9aDzmlpbHA+vjoI409aBzru5tKonpMecRvbnBgERldMjtJ65e1l6QzI3dYMqPjleF2uu2puoE+xBhkO1vCx6zHKe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gQKt6PSC; arc=none smtp.client-ip=95.215.58.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gQKt6PSC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xwtckas4LnrLCXkCKb5n3gLZW22/ubZm4385L/A1/Us=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790080510; v=1; x=1790685310;
 b=gQKt6PSCQD6kVk6OBItvbcbDk3KxR8zTXesnt56fw22e8gMYUF+jbeBBjtGaxjhzHjjpF34b
 mM4mj2yRYDGKEqUjc3pE6rva2QQenHjlSI2/rsnFs1avwB+LsuMjpt/h07c6LTU4oVE/OtLCvFO
 sQPpLG9lri9o5EDz+mgw22E8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 887b51e9a353e5f0;
	Tue, 22 Sep 2026 12:35:06 +0000
X-Mizu-Trace-ID: 887b51e9a353e5f0
X-Migadu-Flow: FLOW_OUT
Message-ID: <93e71e27-86d7-4853-bbd2-756ac137a925@linux.dev>
Date: Tue, 22 Sep 2026 13:34:59 +0100
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
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <35e42ccc-df8f-4703-b10d-f7c96b263e98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 22:11, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:27, Usama Arif wrote:
>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
>> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
>> not just in a swap PTE.
>>
>> arm64 encodes a swap PMD exactly like a swap PTE, so the new helpers wrap
>> the PTE ones and reuse PTE_SWP_EXCLUSIVE.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index e89ec5f4787b4..d3f53a601aed3 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -599,6 +599,12 @@ static inline int pmd_protnone(pmd_t pmd)
>>  #define pmd_swp_clear_uffd(pmd) \
>>  				pte_pmd(pte_swp_clear_uffd(pmd_pte(pmd)))
>>  #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>> +#define pmd_swp_exclusive(pmd)	pte_swp_exclusive(pmd_pte(pmd))
>> +#define pmd_swp_mkexclusive(pmd)	pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
>> +#define pmd_swp_clear_exclusive(pmd) \
>> +				pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
>> +#endif
> 
> Why do we #ifdef that here, but not the uffd-wp swp PMD helper?
> 

uffd-wp is gated on CONFIG_HAVE_ARCH_USERFAULTFD_WP.

If I removed the CONFIG_ARCH_HAS_PMD_SOFTLEAVES guards above, when THP=n, arm64
will use the generic macro which is wrong.

I tried building uffd-wp swp with just ARCH_HAS_PMD_SOFTLEAVES guard and I got
the build error 

  mm/page_table_check.c:232:20: error: implicit declaration of
  function 'pmd_swp_uffd'

we will probably need a separate patch like:

  #ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
  static inline bool pmd_softleaf_uffd(pmd_t pmd)
  {
          return pmd_swp_uffd(pmd);
  }
  #else
  static inline bool pmd_softleaf_uffd(pmd_t pmd)
  {
          return false;
  }
  #endif


to avoid the above build error.

Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF33C43785C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081326; cv=none; b=U32oTo935vYSnFwch8adkpE4O1HR3t1BcuDuY5HspLPez7KOzdcjgO+ULHpzRj8ElTJooLi9HonDVHHHAZ55t4NmA7RB/qHiw5/OBg1zjWQboW4kx7hnMCODSH8RU71ZvI9zL+1Y6ZfSXBLJtJ4GGzu4TYxjTjDGNSqlQcIUXAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081326; c=relaxed/simple;
	bh=wzEk4sVRhnKEVhasilKpOv1uZCDcHlKB164cBBTlxVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ob6gBirfAXGh3/K92CxH1jK2VyKLL9NpmF7LYP4OgciTD/n4RihFfy3y6HX9b5Ez08Y5corF62762+gUIjJC9PonUCDbVR/IRNk77g/4KOMf+0jW3E2VVvQ8q2ImvaX0lhxHlRVQUZapM2+tYI9sdzcrg/QVwrOq6xWYKnx39Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ScIUg1yc; arc=none smtp.client-ip=95.215.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ScIUg1yc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wzEk4sVRhnKEVhasilKpOv1uZCDcHlKB164cBBTlxVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790081321; v=1; x=1790686121;
 b=ScIUg1ycfRo/nD9Kja2lpXBYOE6RWOnBn+P75dYa43XguSRz+XP4POoPKz98trp/QpBrVHe0
 zYBLxubVICiMqLMjFPjAd8/d0I2Q0/pPjmrpGpCzkFzVGKY3i+okkxseYrGdTH8OxuOdB74euNu
 ZMqgqTHrc4MUktsCQy/swjYU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ef79b9281d7277d;
	Tue, 22 Sep 2026 12:48:41 +0000
X-Mizu-Trace-ID: 5ef79b9281d7277d
X-Migadu-Flow: FLOW_OUT
Message-ID: <fada6164-9d84-48b6-b2f1-18f9a18c1590@linux.dev>
Date: Tue, 22 Sep 2026 13:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 04/29] powerpc: mm: add PMD swap-exclusive helpers
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
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-5-usama.arif@linux.dev>
 <47ccd5ce-2301-4ddd-881c-d57cb82b562c@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <47ccd5ce-2301-4ddd-881c-d57cb82b562c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 22:22, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:27, Usama Arif wrote:
>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
>> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
>> not just in a swap PTE.
>>
>> book3s64 builds a swap PMD by running the PTE encoding over pmd_pte(), so
>> the PMD helpers use the same _PAGE_SWP_EXCLUSIVE bit. It is also the only
>> powerpc variant that selects ARCH_HAS_PMD_SOFTLEAVES, via PPC_THP.
>>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index dff8790a047db..28943ef3c1c80 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -699,6 +699,23 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>  	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_SWP_EXCLUSIVE));
>>  }
>>  
>> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
>> +{
>> +	return __pmd_raw(pmd_raw(pmd) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
>> +}
>> +
>> +static inline bool pmd_swp_exclusive(pmd_t pmd)
>> +{
>> +	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
>> +}
>> +
>> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
>> +{
>> +	return __pmd_raw(pmd_raw(pmd) & cpu_to_be64(~_PAGE_SWP_EXCLUSIVE));
>> +}
>> +#endif
> 
> This should likely go below the pmd_swp_mksoft_dirty() handling block?
> 
> For softdirty it's e.g.,
> 
> #define pmd_swp_mksoft_dirty(pmd)	pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)))
> 
> 
> Why can't we follow a similar model here?
> 

I had just copied from pte_swp_mkexclusive()/pte_swp_exclusive()/pte_swp_clear_exclusive().


I will do this in the following revision for this patch:


diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047db..458c85cebfa65 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1060,6 +1060,12 @@ static inline pte_t *pmdp_ptep(pmd_t *pmd)
 #endif
 #endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */

+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+#define pmd_swp_mkexclusive(pmd)       pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
+#define pmd_swp_exclusive(pmd)         pte_swp_exclusive(pmd_pte(pmd))
+#define pmd_swp_clear_exclusive(pmd)   pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
+#endif
+
 #ifdef CONFIG_ARCH_HAS_PTE_PROTNONE
 static inline int pmd_protnone(pmd_t pmd)
 {


Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C035F170
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081576; cv=none; b=u6RdrYysLRvmQnG/ieFlya6m+e8qru0jbEUDuI2k3LXjzptC1QaXZPAYXwqK3XFu75eKFo+R6MN2b9GbbRHRdUaxN+j2s7S797tVamCs4FpmfxsHpl+rQ5mBWKJkhoOUc4O06a7G3M3Dsw/nA6mnjDLG8josxyttyXEPBcpBVeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081576; c=relaxed/simple;
	bh=Jae59hpYchWjFu5lmM2YnvXbv7hvGTzJEokKNdRbnnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXMwfKYYM3+r68K5CZ9zg8nz6b20Q3weilXLYkL1LBFbxy18QSCaRun0h2jJqlIVM7AVGTN7cMjMPZ+xlzHa/WnBHqwlk/UznkcH/yggjRFv/U5yFK9+UJ9gmMGskKlJ+NnTUt371K+wqdT+UwBdrYmQ6zByj0wkGCebKtV1SOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nxPbQTi7; arc=none smtp.client-ip=91.218.175.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nxPbQTi7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jae59hpYchWjFu5lmM2YnvXbv7hvGTzJEokKNdRbnnA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790081572; v=1; x=1790686372;
 b=nxPbQTi79vF9CUl8eezgYLh9Qdy4s+5kv/DBz2cICTmalmIeDKUvG2BEryNN6gi977Rncrqu
 nEljd/+ZzxjWRbYuUAbB96sHJ5aihuI9vrv8a/Ez0OUqO3HmKHeShOmA3tTINyauiwqBO7MeSU6
 77xt9COVa8rCdWe+OlJtl5s0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d19d6af701ceeb03;
	Tue, 22 Sep 2026 12:52:52 +0000
X-Mizu-Trace-ID: d19d6af701ceeb03
X-Migadu-Flow: FLOW_OUT
Message-ID: <fcadabef-4859-45f6-9612-a819599c0fdc@linux.dev>
Date: Tue, 22 Sep 2026 13:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 07/29] x86: mm: add PMD swap-exclusive helpers
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com,
 linux-mm@kvack.org, ying.huang@linux.alibaba.com,
 Baoquan He <baoquan.he@linux.dev>, willy@infradead.org,
 youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com,
 Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev,
 linux-kernel@vger.kernel.org, nphamcs@gmail.com, shikemeng@huaweicloud.com,
 yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com,
 kernel-team@meta.com, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-8-usama.arif@linux.dev>
 <aqqmClGl0lt5Qzee@thinkstation>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <aqqmClGl0lt5Qzee@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/09/2026 15:31, Kiryl Shutsemau wrote:
> On Mon, Sep 14, 2026 at 05:27:57AM -0700, Usama Arif wrote:
>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
>> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
>> not just in a swap PTE.
>>
>> x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reuse
>> _PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
>> for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
>> not select ARCH_HAS_PMD_SOFTLEAVES.
>>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: x86@kernel.org
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/x86/include/asm/pgtable.h | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
>> index d551120a7c889..a2d1cd03cba23 100644
>> --- a/arch/x86/include/asm/pgtable.h
>> +++ b/arch/x86/include/asm/pgtable.h
>> @@ -1525,6 +1525,23 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>  	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
>>  }
>>  
>> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
>> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
>> +{
>> +	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
>> +}
>> +
>> +static inline bool pmd_swp_exclusive(pmd_t pmd)
>> +{
>> +	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
>> +}
>> +
>> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
>> +{
>> +	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
>> +}
>> +#endif
>> +
> 
> I was about to comment that it is broken on 32-bit as
> _PAGE_SWP_EXCLUSIVE there is _PAGE_PSE which would make exclusive swap
> entries pmd_present(). But CONFIG_ARCH_HAS_PMD_SOFTLEAVES is only
> selected for X86_64.
> 
> Do we want some BUILD_BUG_ON() to catch if anyone would try to enable
> it for 32-bit machines?

I added static_assert(_PAGE_SWP_EXCLUSIVE != _PAGE_PSE);

Thanks for the review!

> 
> Otherwise:
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 
>>  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>>  static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>>  {
>> -- 
>> 2.53.0-Meta
>>
> 


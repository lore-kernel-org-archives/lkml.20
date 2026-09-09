Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCE93D524C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939891; cv=none; b=hSBQvr9RS//frEZyClUSTVt0H4WhVRFQ8pa9utOftUsWhABsiY8kg6pojM8ewb419LKSX/eEN/mEkv/Rx/tyyuMenX3HH2Z7HN54zVk+2HZdGpa61IpIPZHwcDezGmKJUhpQXWCQQkS2sifxwZbx25ulOS/Vitcgez5tafWglM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939891; c=relaxed/simple;
	bh=e0GeJfmPR3dEFuahjfyooZC9yXysPHFN3AqMe/t6B0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYrW2DsaIr9hJC/sbqGjMkX9m6oQJgF2bWHTB77B52l4+LWUmLU2Ri1z74dXX34zx5DImYsS82o/TtaUV0X+o5TC8SFXZZA4RPd2va4lXc/nBuk5Jm8VThp/BZ5lG7IzyjOnvo/wq4WA8oC84TBdWl64ligQzh1B32psjsu1ckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MviTY7+Z; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MviTY7+Z"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A55F91576;
	Wed,  9 Sep 2026 00:44:44 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D03233F7D8;
	Wed,  9 Sep 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788939888; bh=e0GeJfmPR3dEFuahjfyooZC9yXysPHFN3AqMe/t6B0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MviTY7+Zb3AHyiEuaB23vkmKxvrKArbkgIEqsKKk8ZshASCZPMVCi/N1ozgdgo60c
	 R28LyHubWCuXzanBwgpBPI41IkZIvnA95GHwUS7trb0oUwadfFU/RtfC7QsSfeYjIV
	 DzLy1DiPrGkxv4aj0jV2QZYZ4FiwDo1vpTJw2U7Y=
Message-ID: <f4edb66c-1891-4d7b-83c2-d8251715fadd@arm.com>
Date: Wed, 9 Sep 2026 13:14:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] mm/rmap: Add batched version of
 folio_try_share_anon_rmap_pte
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, baolin.wang@linux.alibaba.com,
 shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev,
 youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20260901054358.4049095-1-dev.jain@arm.com>
 <20260901054358.4049095-5-dev.jain@arm.com>
 <CAGsJ_4zWPXoJ5kiLoVcq1YHv6WcmjPEssTUs4OT15iNRob3_rQ@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4zWPXoJ5kiLoVcq1YHv6WcmjPEssTUs4OT15iNRob3_rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/26 2:49 am, Barry Song wrote:
> On Tue, Sep 1, 2026 at 1:44 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>> To enable batched unmapping of anonymous folios, we need to handle the
>> sharing of exclusive pages. Hence, a batched version of
>> folio_try_share_anon_rmap_pte is required.
>>
>> Currently, the sole purpose of nr_pages in __folio_try_share_anon_rmap is
>> to do some rmap sanity checks. Now, clear the PageAnonExclusive bit on a
>> batch of nr_pages. Refactor the function such that the clearing of the bit
>> can be done at one place without duplication.
>>
>> Note that __folio_try_share_anon_rmap can receive nr_pages == HPAGE_PMD_NR
>> from the PMD path, but currently we only clear the bit on the head page.
>> Retain this behaviour by setting nr_pages = 1 in case the caller is
>> folio_try_share_anon_rmap_pmd.
>>
>> While at it, convert nr_pages to unsigned long to future-proof from
>> overflow in case P4D-huge mappings etc get supported down the road.
>> I haven't made such a change in each function receiving nr_pages in
>> try_to_unmap_one - perhaps this can be done incrementally.
>>
>> Add two WARN's: check that the batch is entirely exclusive (for PMD
>> callers, need to check only head page), and that there are only
>> PTE/PMD paths converging into __folio_try_share_anon_rmap.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  include/linux/rmap.h | 56 ++++++++++++++++++++++++++++++--------------
>>  1 file changed, 39 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index 0b332770abeed..320f9f14f6020 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -706,17 +706,23 @@ static inline int folio_try_dup_anon_rmap_pmd(struct folio *folio,
>>  }
>>
>>  static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
>> -               struct page *page, int nr_pages, enum pgtable_level level)
>> +               struct page *page, unsigned long nr_pages, enum pgtable_level level)
>>  {
>> +       /* device private folios cannot get pinned via GUP. */
>> +       const bool pinnable = !folio_is_device_private(folio);
>> +
>>         VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
>>         VM_WARN_ON_FOLIO(!PageAnonExclusive(page), folio);
>> +
>>         __folio_rmap_sanity_checks(folio, page, nr_pages, level);
>>
>> -       /* device private folios cannot get pinned via GUP. */
>> -       if (unlikely(folio_is_device_private(folio))) {
>> -               ClearPageAnonExclusive(page);
>> -               return 0;
>> -       }
> 
> Somehow, I feel the early return for
> `folio_is_device_private(folio)` is more readable. Can we keep it?
> Then we can avoid many `if (pinnable)` checks later.
> 
>> +       VM_WARN_ON_ONCE(level > PGTABLE_LEVEL_PMD);
> 
> Maybe the below would be better, as it avoids depending on the
> exact value of `PGTABLE_LEVEL_PMD` and above.
> 
> VM_WARN_ON_ONCE(level != PGTABLE_LEVEL_PTE && level != PGTABLE_LEVEL_PMD);

Can do this.


> 
>> +
>> +       /* We only clear anon-exclusive from head page of PMD folio. */
>> +       if (level == PGTABLE_LEVEL_PMD)
>> +               nr_pages = 1;
>> +
>> +       VM_WARN_ON_FOLIO(page_anon_exclusive_batch(0, nr_pages, page, true) != nr_pages, folio);
>>
>>         /*
>>          * We have to make sure that when we clear PageAnonExclusive, that
>> @@ -760,29 +766,38 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
>>          * so we use explicit ones here.
>>          */
>>
>> -       /* Paired with the memory barrier in try_grab_folio(). */
>> -       if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
>> -               smp_mb();
>> +       if (likely(pinnable)) {
>> +               /* Paired with the memory barrier in try_grab_folio(). */
>> +               if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
>> +                       smp_mb();
> 
> If we return early for `!pinnable`, shouldn't we be able to avoid
> this? Is the reason you don't do the early return that you want to
> batch the `folio_is_device_private(folio)` case as well? If so,
> that seems sensible.

Yes.


> 
> Is this a real use case that you're supporting with your patchset?
> 
>>
>> -       if (unlikely(folio_maybe_dma_pinned(folio)))
>> -               return -EBUSY;
>> -       ClearPageAnonExclusive(page);
>> +               if (unlikely(folio_maybe_dma_pinned(folio)))
>> +                       return -EBUSY;
>> +       }
>> +
>> +       for (;;) {
>> +               ClearPageAnonExclusive(page);
>> +               if (--nr_pages == 0)
>> +                       break;
>> +               page++;
>> +       }
> 
> Maybe ?
> 
>      while (nr_pages--)
>          ClearPageAnonExclusive(page++);

Was following the pattern elsewhere ... I vaguely remember the
for (;;) being faster for some reason?

> 
> Best Regards
> Barry


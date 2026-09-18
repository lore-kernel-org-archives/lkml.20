Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7345396567
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711544; cv=none; b=kv97cmnY9dksRvattLVQrGaFhjN+QGmXKgB4mr1+KrUw03/TPJ63J4JJEocHPvuj2d5j8RcWFyiiGM7PVWUAftIpauLS3GB+lshPgQt8Du6i6Vp+rqg3TbEFWvKVcHspVgfpiYD78SfdIz/3GJo0zGIU15Ygjt257YjbN2bQJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711544; c=relaxed/simple;
	bh=1nFJDMrYdn3GbWtOumxhGy3vguq9cbshqr+iX+p9L/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YplJCbkl+APhgwiKgho4ES6mKeTtaZcgvpcNagwJLlXQFq0VIswrMR2gC33H9pxdepVFC6/Tn+MjJEaQpfMI6cw6wARJFqEbtcJQgTIMwXyyPuvc3pZXtcGbXsGdesImPP/Q9ui12JQIgGpcOrsNDTTdk2R0EYHPkbf2iWzKF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRYJtWuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRYJtWuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB971F000FF;
	Fri, 18 Sep 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789711542;
	bh=2iSN1j31Sw9qmqTYVp6Ry3mKQfg4lt3sT+FCrOQ8mF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HRYJtWuL74SbBnfcEwdWnfbXL/tQ2LS0eZcRDZCBlNLQXBydIBtYqkiENXlDagnbT
	 C2yEEFg2K7h5z+2opnb1JHsi/x+l+mdBVTLNqkvv/DpshLB82Svt8wnmGViSmp38iu
	 RqWJqCe9NjqFd7sIoVai7vkuR1L3g/ELqekIScdjqxdSM+2tF1sE2M5vUb+ybXhH2T
	 qeHd1/7ezHu35c25/Re5wk4kWvG7SMvYr71yv/QjO7HFaVvMkPqGp28tk2Tjav58QQ
	 8Q3/O3ocmaqrfak5BYTC5KAwevQhgl+fUqMCEBp14MV+FG3sEjD8+8xfzUSXElZXjR
	 UltrRtZcQGVSg==
Message-ID: <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
Date: Fri, 18 Sep 2026 08:05:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
 <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/09/2026 à 23:44, Barry Song a écrit :
> On Thu, Sep 17, 2026 at 10:41 PM Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>> On Thu, 17 Sept 2026 at 22:00, Christophe Leroy (CS GROUP)
>> <chleroy@kernel.org> wrote:
>>>
>>>
>>>
>>> Le 17/09/2026 à 07:29, Wen Jiang a écrit :
>>>> From: Wen Jiang <jiangwen6@xiaomi.com>
>>>>
>>>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>>>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>>>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>>>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>>>
>>>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>>>> pte_clear_huge(), add the generic fallbacks next to the existing
>>>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>>>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>>>> around the block-mapping paths are dropped, so PTE-level block mappings
>>>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>>>> longer includes <linux/hugetlb.h>.
>>>>
>>>> The fallbacks exist only to keep the build working on architectures
>>>> without PTE-level block mapping support. They are unreachable there:
>>>> the callers only run when arch_vmap_pte_range_map_size() or
>>>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>>>> which requires an arch implementation. WARN_ON_ONCE() makes that
>>>> explicit rather than silently doing nothing.
>>>>
>>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>>> ---
>>>>    include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>>>    mm/vmalloc.c            | 19 ++++++-------------
>>>>    2 files changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index cdd68ed3ae1a9..349ced999f959 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>>>    }
>>>>    #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>>>
>>>> +/*
>>>> + * PTE-level block mappings for vmap.
>>>> + *
>>>> + * pte_set_huge() only has to be implemented by architectures whose
>>>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
>>>> + */
>>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
>>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
>>>> +                             phys_addr_t phys, pgprot_t prot,
>>>> +                             unsigned long size)
>>>> +{
>>>> +     WARN_ON_ONCE(1);
>>>
>>> BUILD_BUG_ON() would be better here.
>>>
>>> It should be possible because fallback arch_vmap_pte_range_map_size()
>>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
>>>
>>
>> Agreed. These fallbacks exist only to keep the build working on
>> architectures with PTE-level block mappings and should never actually
>> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
>>
> 
> I am not quite sure. It won't be called at runtime because
> `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> reach this branch. But it will still be built.

The fallbacks are defined as:

#ifndef arch_vmap_pte_range_map_size
static inline unsigned long arch_vmap_pte_range_map_size(unsigned long 
addr, unsigned long end,
							 u64 pfn, unsigned int max_page_shift)
{
	return PAGE_SIZE;
}
#endif

#ifndef arch_vmap_pte_range_unmap_size
static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long 
addr,
							   pte_t *ptep)
{
	return PAGE_SIZE;
}
#endif

Therefore in:

                 size = arch_vmap_pte_range_unmap_size(addr, pte);
                 if (size != PAGE_SIZE) {

GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit 
the branch at all.

It is call constant folding, some explanation here: 
https://en.wikipedia.org/wiki/Constant_folding

> 
> So, would a `BUILD_BUG_ON()` trigger a build failure here?

It shouldn't, if it does it is a compiled bug or this is because someone 
has redefined arch_vmap_pte_range_map_size() and not pte_set_huge() 
which we'd better know at build time rather than at runtime.


> 
> Best Regards
> Barry
> 


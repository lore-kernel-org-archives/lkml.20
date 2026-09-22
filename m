Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351B55199A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083127; cv=none; b=gnsF9W4Q9wyHlmmSqpzohlR4TkcOYf+4blzXvpB9KSaBx02AlSFElT0t8xs5cTF44Da04nNXdMxiJPRYwsXmxGz0of7ypMVieTqlwWQwmzlLLjILnXmiK31IgRMiLeNFscSSm9ICOxTHEvXvr2Z6sJ+M+E3yawAEfio0eVcMt4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083127; c=relaxed/simple;
	bh=KnQFWOHI/uWFbK2yV+XgO5ozKy20KZ6FFsL/eg8FxkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjaoGexcyL9oz7VqQ7KR/08lyDJ4UrIp8GWcBBBhsnkkJq26eW5UkmilTZ8OKYJg4UWvS94deXAS2WyqgaxP4kPvBa1ZHIfFlBu9kFhMhR/G4eqvJBP6sJjNQ3L6tWPg99S5QmmTpuTtx8kTc/g6+kQ1yENuAYyZYYxOZI9HnAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=blm2aYEg; arc=none smtp.client-ip=95.215.58.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="blm2aYEg"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KnQFWOHI/uWFbK2yV+XgO5ozKy20KZ6FFsL/eg8FxkY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790083123; v=1; x=1790687923;
 b=blm2aYEgSSnRIIRmIgSJEqGAZggbaZPSy/vPCO5VeEIyNmgezy68bnnUfYrNHkX7eKAmJofp
 cLdJPyQ2S56Yc6ryQwqkebxqVem1Z2W6kwQ09UiVjooPS8Zl4AffRlRbBdR7BPTV48UdMjOIJBd
 32+4N2fBcrFySyLv4u0QRXBg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 855e594509f545e4;
	Tue, 22 Sep 2026 13:18:43 +0000
X-Mizu-Trace-ID: 855e594509f545e4
X-Migadu-Flow: FLOW_OUT
Message-ID: <17c88cf7-61d0-48f6-bc94-773b3662122c@linux.dev>
Date: Tue, 22 Sep 2026 14:18:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 11/29] mm: split PMD swap entries into PTE swap
 entries
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org,
 ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org,
 dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-12-usama.arif@linux.dev>
 <aqqwFOoPxqFnxclE@thinkstation>
 <4101d661-7b16-401c-aaef-b87e81fdaee3@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <4101d661-7b16-401c-aaef-b87e81fdaee3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/09/2026 12:46, David Hildenbrand (Arm) wrote:
> On 9/16/26 17:08, Kiryl Shutsemau wrote:
>> On Mon, Sep 14, 2026 at 05:28:01AM -0700, Usama Arif wrote:
>>> Once a PMD can hold a swap entry, everything that splits a PMD - mprotect()
>>> or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
>>> handler - has to be able to split that entry too, or the callers that rely
>>> on split_huge_pmd() to hand them a PTE table would find the PMD unchanged.
>>>
>>> No reference counting is needed: a swap entry pins no folio, and swap_map
>>> is already one per slot, so the PTEs simply take over what the PMD held.
>>>
>>> The migration-only entry point cannot reach the new branch, because
>>> page_vma_mapped_walk() never hands back a swap PMD for the folio being
>>> migrated. Warn if that ever changes, and force the regular split anyway,
>>> since the branch leaves folio and page uninitialised.
>>>
>>> Test the pre-split old_pmd rather than re-reading *pmd in the trailing
>>> folio_remove_rmap_pmd() gate, so every entry-type test in the function
>>> interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
>>> leaves the PMD present as far as software is concerned.
>>>
>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>>> ---
>>>  mm/huge_memory.c | 36 +++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 873887aed0bc2..0e347a545588c 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3304,6 +3304,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>  			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>>>  						 vma, haddr, rmap_flags);
>>>  		}
>>> +	} else if (pmd_is_swap_entry(*pmd)) {
>>> +		/*
>>> +		 * A PMD swap entry has no page, so it cannot be turned into
>>> +		 * PTE migration entries.  page_vma_mapped_walk() never hands
>>> +		 * one back for the folio being migrated, so this should not
>>> +		 * happen; warn, but also force the regular split so that a
>>> +		 * broken invariant cannot make the code below dereference the
>>> +		 * uninitialised folio and page.
>>> +		 */
>>
>> The comment can be shorter.
>>
>>> +		VM_WARN_ON_ONCE(use_migration_entries);
>>> +		use_migration_entries = false;
>>> +		old_pmd = *pmd;
>>> +		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>> +		uffd_wp = pmd_swp_uffd(old_pmd);
>>> +		anon_exclusive = pmd_swp_exclusive(old_pmd);
>>
>> The logic looks right to me, but __split_huge_pmd_locked() is getting
>> awkward. It is close to 300 lines with two if-else chains that have to
>> be kept in sync.
>>
>> Can we have a preparatory patch that moves the PTE-install loops into
>> per-type helpers?
>>
>> split_pmd_into_migration_ptes(), split_pmd_into_device_private_ptes(),
>> split_pmd_into_present_ptes().
> 
> There were recently patches about related cleanups:
> 
> https://lore.kernel.org/r/cover.1787941780.git.yintirui@gmail.com
> 
> I'm fine with cleaning this up later (I hope we can land this series in 7.4).
> 

Will follow Davids advice and cleanup later if no one has done it.

Too much cleanup already :)


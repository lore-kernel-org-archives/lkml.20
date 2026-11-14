Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639142;
	b=DgUhcCx9CrWENRl3fHZO+Vqtv36D8tbv9lQNjk+523aoJSC3OginFBF58XqR41gSOyKh
	 rWDsOUov374pKq8n2RNVeHRAtvl/p1ad+1lmc/EltIFPmtmIfM8dwB2+8adYuc0ag3iaq
	 TZ/xPIStT+4ILe1WgIFC+K+A0ih1hiniPAceGQ/aTa4sHtU1jbFerpW/Upr3JZD5HmSsA
	 ICOH+yyfwQ5UKehCTZAZIvfzh9OeTtxussfukOQhYGh33WEDKjTph/HuR4GAMkALGzdPs
	 7t/dUhJk7R2d/GXm4PIXIhQF+Yqv/dkt7b3MajlN1FqkBDxyhY4AHEj3zCo3SrVqsaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639142;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Kr6uumd8dZOWTXDkFndJlR1ttlboBxrC9NzsnPYAVyA=;
	b=MQjhCSXO1x1WtPpMsW2/KOB++xwBTMPkmymktOh6C+Stb8tfNLUoZsix97Awz5+/VG8x
	 lXrWk1SWdL7JStSi8VL353zFsuXQWTFjqNMGK5W2zYiOdNCbb65E3xfuoUtGyQAM2XRXj
	 5HbMiZ4CeZ/+6nX9pM4v4V9PGLHvNY+O1sujE3Ll/IwUddSPrWCrFADH0Fyku6tBBWa9A
	 RvXNt2Ihzt5tqDbtKdOup/xzi3xZHhPI1ioQp6EdyzGEAxfsV9NGccKvSp+dVp/WDs93t
	 Y6K2yjYXv9XIATfV4doA6doT9j1cd5dYYC657NR8TjouaLZQIo7GMUU/eVRvFrofZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="f/TuyCvz";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52613606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52613606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f/TuyCvz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81F191516;
	Fri, 13 Nov 2026 22:52:18 -0800 (PST)
Received: from [10.163.154.162] (unknown [10.163.154.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5D393F632;
	Fri, 13 Nov 2026 22:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794639141; bh=W8qZfT5oF3Z3OszzVIIAvjlZBFk4CgT7p0JvaMolklc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f/TuyCvzT91xJJ3zuUEj6cboGIJ/7A2DW7rRLO6fBDEGcmUdfQ6632WQyzFMupBSa
	 tezFVLM2HDABsgEG/fWc9VrLN4siR2Py8/m35sPeLrLSXjMQBYOWLnjeqJVTfpaWkD
	 uRgIYWMaRoVJXir/ypqZkK8h6sjV1cGLApguMz2w=
Message-ID: <91baeed5-c432-445b-a2db-7bc20c8921b0@arm.com>
Date: Sat, 14 Nov 2026 12:22:11 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] mm/vmalloc: clamp an unaligned range in
 vunmap_pte_range()
To: Hao Ge <hao.ge@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Uladzislau Rezki <urezki@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <20261026080329.140244-1-hao.ge@linux.dev>
 <20261026080329.140244-4-hao.ge@linux.dev>
 <99f529e8-06f7-4a20-a60b-0330c5d3d91c@arm.com>
 <5452d555-82f9-45a6-b443-ee732b1874ba@linux.dev>
 <e8a2a42d-e424-4366-8a68-e39167f62276@arm.com>
 <72d1b1d7-2fb6-402f-a557-0eaa767d6f86@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <72d1b1d7-2fb6-402f-a557-0eaa767d6f86@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/11/26 11:37 am, Hao Ge wrote:
> 
> 
> On 2026/10/30 22:20, Dev Jain wrote:
>>
>>
>> On 30/10/26 2:00 pm, Hao Ge wrote:
>>> Hi Dev
>>>
>>> Thanks for your review.
>>>
>>> On 2026/10/30 15:14, Dev Jain wrote:
>>>>
>>>>
>>>> On 26/10/26 1:33 pm, Hao Ge wrote:
>>>>> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
>>>>> PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
>>>>> size is not a multiple of PAGE_SIZE. That loop steps in page
>>>>
>>>> Why are we checking the alignment so late into vmap_pte_range? Why not
>>>> simply do
>>>>
>>>> if (!IS_ALIGNED(addr, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
>>>> 	return; (or return -EINVAL);
>>>>
>>>> at the start of vmap_range_noflush and vunmap_range_noflush?
>>>
>>> I think adding that check at the entry of vunmap_range_noflush()
>>> goes against its design intent. Its job is to tear down the mappings
>>> of the given VA range, so even when the caller passes a size that is
>>> not page-aligned, we still have to unmap whatever is mapped within
>>> that range.
>>>
>>> So the patch clamps end down to the last full page and keeps
>>> clearing. A buggy caller still gets its mapping torn down as far as
>>> it goes, and nothing is left behind. The check here is just for
>>> protection. 
>>>
>>> This is just my preliminary understanding; I may be mistaken.
>>
>> Hmm I get you, but this is very ugly. We are trying to tolerate
>> a blatant bug in the caller with not-so-nice code. But see below.
>>>
>>> Thanks
>>> Best Regards
>>> Hao
>>>
>>>
>>> But that's just my understanding, happy to be corrected.
>>>
>>>
>>>>
>>>>
>>>>> multiples and stops only at addr == end; with an unaligned size addr
>>>>> never lands on end, so the loop cannot terminate and walks off the
>>>>> end of the page table.
>>>>>
>>>>> vunmap_pte_range() has the same loop without any guard, so an
>>>>> unaligned range would clear PTEs past end without ever stopping,
>>>>> walking off the end of the page table.
>>>>>
>>>>> Add the check there too. The range is clamped down to the last full
>>>>> page rather than dropped, and the loop is skipped when nothing is
>>>>> left, so a buggy caller still gets its PTEs cleared as far as they
>>>>> go.
>>>>>
>>>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>>>>> ---
>>>>>  mm/vmalloc.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>>>> index 44e0eb32708f..7131f60d1a8e 100644
>>>>> --- a/mm/vmalloc.c
>>>>> +++ b/mm/vmalloc.c
>>>>> @@ -393,6 +393,11 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>>>>  	pte_t ptent;
>>>>>  	unsigned long size = PAGE_SIZE;
>>>>>  
>>>>> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>>>>> +		end = addr + PAGE_ALIGN_DOWN(end - addr);
>>
>> For simplicity assume PAGE_SIZE is 4, start is 3, end is 10.
>> With your code we will get
>>
>> addr = 3, end = 3 + ALIGN_DOWN(10 - 3) = 3 + 4 = 7.
>> So the range becomes [3, 7) clearing only two ptes, the one covering
>> [0, 3], the second covering [4, 7]. I feel we should rather make
>> the range from [3, 10] to [0, 11], clearing three ptes.
>>
> 
> Thanks for the example. Looks like I nearly introduced a new bug while
> guarding against the old one, good thing you caught it.
> 
>> So, at the start of vunmap_range_noflush we could basically
>> WARN_ON on non-alignment, and then clamp the start down, and clamp
>> the end up to PAGE_SIZE.
> 
> I'm wondering whether we should simply BUG_ON for non-aligned ranges here.
> Because the unmap could silently clear mappings at adjacent addresses, which
> may not even belong to the caller, and this kind of problem is really hard to
> track down afterwards. Say [0, 3) is in use by someone else, with PAGE_SIZE=4
> an unmap starting at 3 still begins with the pte covering [0, 4), since the loop
> clears page by page, so that owner loses his mapping without doing anything wrong,
> and only sees the damage much later when he touches it again.
> 
> WDYT?
> 
>>
>> And with this also throw in a patch to bring the -EINVAL bailout
>> in vmap_pte_range to the top, in vmap_range_noflush and check
>> both start and end alignment.
> 
> For the vmap_range_noflush() check, fully agreed.  The current check
> is indeed too late, the range is only found to be bad after part of
> it has already been mapped. 
> 
> Looking forward to your valuable comments.

I was on vacation, I'll review the next version soon.


> 
> Thanks
> Best Regards
> Hao
>>
>>>>> +	if (end == addr)
>>>>> +		return;
>>>>> +
>>>>>  	pte = pte_offset_kernel(pmd, addr);
>>>>>  	lazy_mmu_mode_enable();
>>>>>  
>>>>
>>


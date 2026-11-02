Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599561;
	b=0IDdyGEl3b0o+4zMii/HDbhQX+110NXTDCrFL55MtKfQG/ZSOVejeyHdVjP1XrZJViqP
	 pPnNhoIZ1qoRGUKFqKE+7shKvDhLLGttbrYk//Gm1xviSdeiTFaOLzsP7oH6qbYAwO2W2
	 037eU8ePRRaICvNP01/uf6VRI/E7rP8VvpkniCzj6gWga/G4AIgjweRyJGEWZ5wxUfdiz
	 p7x1tcCaSETcF9XiuVbKKaTlzQ85Rkg419i904y4u+rz8Bn+/ZhiDIcIZJpoXlKdNI2G0
	 VlO4hoWuk1sZn7TL2ltNldjBqqts8XpbDzXrj3+KzYaFF3DF8yIU2AxzN4Nh2famNdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599561;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=h1VSrMby2SX5eM2E4NxQctXhVt0Tc6AaUP5veYJ4paM=;
	b=pQxCKAp2Nl6u0mcNjGUfLMQ9djdLfHTep33yBqUklHow9aLVLjix4Qe+S7igNVqogosi
	 1bIUS+XE/fXd4RBnf3D+CCnWnspJvekjhNFrHvJ+Ne+wfaqzsASoYkuOid7K5LjZX+uEl
	 Wn081kHmqKEqktpewN+TI9mCWJiDDzHwbqw5Cb9n3bmr1AOhuWhyMiqeDkqKNmsfHfqSu
	 x5Qyv/xqQD8TrjIK16ayizffZv8S1eyGSo+jQ1uPV+/GkDMaU9vl/QAIIaYNtSVIwpi3/
	 oWpuJqY9QPnUIKpfzB8Z+0iqyg+Qkxlo61Pc6wEaXgTMTswTtEHoe8NxP7QXdgAUjVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=opLyUe7j;
	arc=none smtp.remote-ip=95.215.58.176
Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4A606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D4A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=opLyUe7j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m9NFSN0c8k/rqWtXM6UCsQER/s2DqAk40a8du6haVV4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793599558; v=1; x=1794204358;
 b=opLyUe7jGCNX/Ks2Wfw0GvCvGymVCVFY2l4AjF+DjnJkuDGtnq5w8qUxEBVGRbjNMihUgh2p
 N2WbiyMNueHHPSHUSGE/VxojS8kqzm1uSC+IpGtAVRaUN87GTq88H0oOGL1Su97yAdfj0UCXL5R
 lWXN8dhDPTy0Vq7auiEh+2BU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b978153f13cb2e16;
	Mon, 02 Nov 2026 06:05:58 +0000
X-Mizu-Trace-ID: b978153f13cb2e16
X-Migadu-Flow: FLOW_OUT
Message-ID: <72d1b1d7-2fb6-402f-a557-0eaa767d6f86@linux.dev>
Date: Mon, 2 Nov 2026 14:07:18 +0800
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
To: Dev Jain <dev.jain@arm.com>
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
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <e8a2a42d-e424-4366-8a68-e39167f62276@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/10/30 22:20, Dev Jain wrote:
> 
> 
> On 30/10/26 2:00 pm, Hao Ge wrote:
>> Hi Dev
>>
>> Thanks for your review.
>>
>> On 2026/10/30 15:14, Dev Jain wrote:
>>>
>>>
>>> On 26/10/26 1:33 pm, Hao Ge wrote:
>>>> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
>>>> PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
>>>> size is not a multiple of PAGE_SIZE. That loop steps in page
>>>
>>> Why are we checking the alignment so late into vmap_pte_range? Why not
>>> simply do
>>>
>>> if (!IS_ALIGNED(addr, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
>>> 	return; (or return -EINVAL);
>>>
>>> at the start of vmap_range_noflush and vunmap_range_noflush?
>>
>> I think adding that check at the entry of vunmap_range_noflush()
>> goes against its design intent. Its job is to tear down the mappings
>> of the given VA range, so even when the caller passes a size that is
>> not page-aligned, we still have to unmap whatever is mapped within
>> that range.
>>
>> So the patch clamps end down to the last full page and keeps
>> clearing. A buggy caller still gets its mapping torn down as far as
>> it goes, and nothing is left behind. The check here is just for
>> protection. 
>>
>> This is just my preliminary understanding; I may be mistaken.
> 
> Hmm I get you, but this is very ugly. We are trying to tolerate
> a blatant bug in the caller with not-so-nice code. But see below.
>>
>> Thanks
>> Best Regards
>> Hao
>>
>>
>> But that's just my understanding, happy to be corrected.
>>
>>
>>>
>>>
>>>> multiples and stops only at addr == end; with an unaligned size addr
>>>> never lands on end, so the loop cannot terminate and walks off the
>>>> end of the page table.
>>>>
>>>> vunmap_pte_range() has the same loop without any guard, so an
>>>> unaligned range would clear PTEs past end without ever stopping,
>>>> walking off the end of the page table.
>>>>
>>>> Add the check there too. The range is clamped down to the last full
>>>> page rather than dropped, and the loop is skipped when nothing is
>>>> left, so a buggy caller still gets its PTEs cleared as far as they
>>>> go.
>>>>
>>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>>>> ---
>>>>  mm/vmalloc.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>>> index 44e0eb32708f..7131f60d1a8e 100644
>>>> --- a/mm/vmalloc.c
>>>> +++ b/mm/vmalloc.c
>>>> @@ -393,6 +393,11 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>>>  	pte_t ptent;
>>>>  	unsigned long size = PAGE_SIZE;
>>>>  
>>>> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>>>> +		end = addr + PAGE_ALIGN_DOWN(end - addr);
> 
> For simplicity assume PAGE_SIZE is 4, start is 3, end is 10.
> With your code we will get
> 
> addr = 3, end = 3 + ALIGN_DOWN(10 - 3) = 3 + 4 = 7.
> So the range becomes [3, 7) clearing only two ptes, the one covering
> [0, 3], the second covering [4, 7]. I feel we should rather make
> the range from [3, 10] to [0, 11], clearing three ptes.
>

Thanks for the example. Looks like I nearly introduced a new bug while
guarding against the old one, good thing you caught it.

> So, at the start of vunmap_range_noflush we could basically
> WARN_ON on non-alignment, and then clamp the start down, and clamp
> the end up to PAGE_SIZE.

I'm wondering whether we should simply BUG_ON for non-aligned ranges here.
Because the unmap could silently clear mappings at adjacent addresses, which
may not even belong to the caller, and this kind of problem is really hard to
track down afterwards. Say [0, 3) is in use by someone else, with PAGE_SIZE=4
an unmap starting at 3 still begins with the pte covering [0, 4), since the loop
clears page by page, so that owner loses his mapping without doing anything wrong,
and only sees the damage much later when he touches it again.

WDYT?

> 
> And with this also throw in a patch to bring the -EINVAL bailout
> in vmap_pte_range to the top, in vmap_range_noflush and check
> both start and end alignment.

For the vmap_range_noflush() check, fully agreed.  The current check
is indeed too late, the range is only found to be bad after part of
it has already been mapped. 

Looking forward to your valuable comments.

Thanks
Best Regards
Hao
> 
>>>> +	if (end == addr)
>>>> +		return;
>>>> +
>>>>  	pte = pte_offset_kernel(pmd, addr);
>>>>  	lazy_mmu_mode_enable();
>>>>  
>>>
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348971;
	b=YRRMSBBzl4X+Wpfp6gQhmMH+rH2TZgB09DAxhPXgNIJq1zJIKnzhd4rQum3OiOyUeEFl
	 h9b22lwXyTiH4peXEYnSMZ/Wz9t22S70NeVgk1UWsRbU9xEnIWSkBC3UVh6M+vF/1jKIw
	 Acd2duaqh0ejhwkPM234Ck2jxGJcprNG66Iq0MEc1iizzDjriLPrQfmUtEJiR4T3KsV51
	 vXA9cpFK0W4fOajV1NLEOZMPYkEq4cVNUD2wozNIkqME2e8CbMd+O7UGPqd1pX6vL/Fwx
	 HqklBsezWk/W0eSJFnD2zx5ebyMMdewCc1Cv+sF45g4mqJ3XfYIy+HjDbGD6Qm7Nw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348971;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NUOdiWftstkdjD3ldYV9jARRTLumRPJOziIdFVy1jPA=;
	b=UX+iBl/AOGSq4RoOdWDZXEiTCmn9WdcoFjebs8Tr3zRK5zBwt4WIgtwQxPbdE48AXAfm
	 0TWX/wuRPuKPv875KJvtTxC7SUYjL90zCY92FgdLx7hBqMCclNwRekwSTdMvIXGcv9bDS
	 8MTncoIuVICiHeMe1xGlFjNzNdfVODWdRWJ6Bahfio7KWd1IgSsiUxQJ2OPGy4sacyPZf
	 NrK5BvE3mIKxIdTGJShc4AbpUYaGwJz4yYh36Cr/FouN1TY5Rq/wpnTuqDp65QmBQpzYy
	 TELsy6HHNQFFRWlFGH0PFChwa4JYXktHZsrVzuc7VNiJWBeWXkGBKR/XpXTWNkZ11Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="fqKiRN/U";
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0281C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0281C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fqKiRN/U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VKj6jsUT5uPNz0z5oNidKhqpMpX0J7TlgAePRZwWgdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793348967; v=1; x=1793953767;
 b=fqKiRN/UWK5/JcParJ41wz4YZ4Fe+A1Je8557uA4EXUOJ9X7fXcFcxGNnqjDKz8dWO8TPU7x
 veqV0xxp5FUsHNvLMgtE3+Lgy89WpZ8ofP2bdREG1OuTvGTOw+JOfvnqcXOAijgEgnDXIgzhsRo
 fKaokF2/fJvBs+rd0TujjgWI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6353d09bda43725;
	Fri, 30 Oct 2026 08:29:27 +0000
X-Mizu-Trace-ID: f6353d09bda43725
X-Migadu-Flow: FLOW_OUT
Message-ID: <5452d555-82f9-45a6-b443-ee732b1874ba@linux.dev>
Date: Fri, 30 Oct 2026 16:30:39 +0800
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
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <99f529e8-06f7-4a20-a60b-0330c5d3d91c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dev

Thanks for your review.

On 2026/10/30 15:14, Dev Jain wrote:
> 
> 
> On 26/10/26 1:33 pm, Hao Ge wrote:
>> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
>> PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
>> size is not a multiple of PAGE_SIZE. That loop steps in page
> 
> Why are we checking the alignment so late into vmap_pte_range? Why not
> simply do
> 
> if (!IS_ALIGNED(addr, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
> 	return; (or return -EINVAL);
> 
> at the start of vmap_range_noflush and vunmap_range_noflush?

I think adding that check at the entry of vunmap_range_noflush()
goes against its design intent. Its job is to tear down the mappings
of the given VA range, so even when the caller passes a size that is
not page-aligned, we still have to unmap whatever is mapped within
that range.

So the patch clamps end down to the last full page and keeps
clearing. A buggy caller still gets its mapping torn down as far as
it goes, and nothing is left behind. The check here is just for
protection. 

This is just my preliminary understanding; I may be mistaken.

Thanks
Best Regards
Hao


But that's just my understanding, happy to be corrected.


> 
> 
>> multiples and stops only at addr == end; with an unaligned size addr
>> never lands on end, so the loop cannot terminate and walks off the
>> end of the page table.
>>
>> vunmap_pte_range() has the same loop without any guard, so an
>> unaligned range would clear PTEs past end without ever stopping,
>> walking off the end of the page table.
>>
>> Add the check there too. The range is clamped down to the last full
>> page rather than dropped, and the loop is skipped when nothing is
>> left, so a buggy caller still gets its PTEs cleared as far as they
>> go.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 44e0eb32708f..7131f60d1a8e 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -393,6 +393,11 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  	pte_t ptent;
>>  	unsigned long size = PAGE_SIZE;
>>  
>> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>> +		end = addr + PAGE_ALIGN_DOWN(end - addr);
>> +	if (end == addr)
>> +		return;
>> +
>>  	pte = pte_offset_kernel(pmd, addr);
>>  	lazy_mmu_mode_enable();
>>  
> 

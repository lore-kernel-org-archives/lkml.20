Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802570;
	b=zCfmdgz55wGuHVGuDGVz/G8vWbdJokl3Y9OSRnUVrsAZbNEccV7zIJGjAvbQzdh8JE7N
	 hQJQfy8wNGUoVmR5mDXAn5bCXpVf8K7EAJjiUPmiyol+dksCpMGXh+lSDbfRzSpNfOLp/
	 oNjXIXVyavnJ4xZyFtFZLOIHmz4hZESyzS9894q7BYTm67np+/wdGmjPVGGw0QPLYusnM
	 CZiUanbu6PJ4Q0cDN/s44FyQkoB9GOEW8p7g7GS93BtMVVZlGb4EcgVHmCxfNhRz3ernF
	 JMMeE44nkNOPAgrt3xo3gWopNy8V/Us0fmkVhEHjFRX6pxTNl8eFfsI5Lm/DjlV5PEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802570;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7gT2JuiYFAN6v3dLuKfgKvKI5F6TdDS5679fODV4+m0=;
	b=3RkwIT4yv+C0SA+myMScaXFZ2Tw6iqr8V9LQj3BiQ8FVWElvbtRWG0IHFMPpxSDfdfgM
	 FIvzjx9nP1HHNe2G01rfPAJokuQx87rYUqZLiZnMEJ/oCElvZLF4v6q4b3HKYzAuQMX3m
	 zjBUPPH4lrK/SGzE19H8DsW418s47GTkMkj6XWGydixR/66f4bA/PoRj5BKDvlPVmOeQG
	 JvybTDXkato8QDH5oXSHz/rMGqkxwVn9W6gfIyXdUVRG8Ip1DIRoe7SN4Tfusk982gis4
	 De38komL04phUMulkOoax5Uhx/rdLEgvBGcNCFNC4sCDUO2AMkwydvNjh8upFN3tm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l5EctVU3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC7D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l5EctVU3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1CFC1476;
	Sun, 15 Nov 2026 20:16:04 -0800 (PST)
Received: from [10.163.155.94] (unknown [10.163.155.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A34E73F632;
	Sun, 15 Nov 2026 20:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794802567; bh=07M/qatRqX8GlvVNpZ3BxRX/Cpixfubu9N9NgYkUMYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l5EctVU3pqdnc7UTBpxl7faldAhr1+sj1M1TgRsDoWwuRaD2Ni+NCqfZXSPrBLEV9
	 nliJLVvf2ZoEHEcuVd2Fib4wJkUcAwjA1hb95cFt3SEwx8elzzBENTxWTjUGc1ZINv
	 yMczDVQGRVCg2Py6/j4qGFIHtEmai+BzkruYIMuQ=
Message-ID: <253a1587-0f76-4013-babc-f7c9c0295eee@arm.com>
Date: Mon, 16 Nov 2026 09:45:58 +0530
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
Subject: Re: [PATCH v4 5/9] mm/vmalloc: BUG_ON() on an unaligned range in
 __vunmap_range_noflush()
To: Hao Ge <hao.ge@linux.dev>, Uladzislau Rezki <urezki@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-6-hao.ge@linux.dev> <avWtxcH2mKw7dgbp@milan>
 <cea5d9af-435a-4708-a937-59c7cbcb169e@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <cea5d9af-435a-4708-a937-59c7cbcb169e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/26 8:51 am, Hao Ge wrote:
> 
> 
> On 2026/11/12 20:15, Uladzislau Rezki wrote:
>> On Tue, Nov 10, 2026 at 07:25:42PM +0800, Hao Ge wrote:
>>> The PTE loop of the unmap path stops only at addr == end.  With an
>>> unaligned end addr never lands on end, so the loop walks past the
>>> range and keeps clearing.  With an unaligned start the loop begins
>>> in the page containing start, which extends below the range.  Either
>>> way the unmap clears the mappings adjacent to the range, and that is
>>> nearly impossible to debug afterwards.
>>>
>>> vmap only installs page-aligned, page-granular mappings, so an
>>> unaligned unmap request is never a legitimate teardown, and there is
>>> no way to tell which pages the caller meant.  Check addr and end at
>>> the entry of __vunmap_range_noflush() and bug out before any PTE is
>>> cleared.
>>>
>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>>> ---
>>>  mm/vmalloc.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index 86fbb1d2b27a..0565cbfe325c 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -518,6 +518,8 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>>>  	pgtbl_mod_mask mask = 0;
>>>  
>>>  	BUG_ON(addr >= end);
>>> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
>>> +
>>>  	pgd = pgd_offset_k(addr);
>>>  	do {
>>>  		next = pgd_addr_end(addr, end);
>>> -- 
>>> 2.25.1
>>>
>> I am not sure this is good to stop machine at all. WARN_ON_ONCE()
>> and return?
> 
> Folks tend to dislike BUG_ON. Dev suggested switching to this when I sent out v3.
> That's fine. After all, nobody has hit this so far. I'll switch it to WARN_ON_ONCE
> for the next version.

To clarify I had suggested the actual check, not the BUG_ON, I thought it is a
well-known fact in mm now that BUG_ON is not to be used : )

> 
>>
>> --
>> Uladzislau Rezki


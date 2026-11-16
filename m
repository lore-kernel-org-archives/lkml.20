Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799276;
	b=AJwj8eP/ftqBW4h+NF+5/MUHFaWGdB4LV/Q3xd+KsoAV2g/LX0QdMBQ+M8wljpdXXvtn
	 5lDF8iEgiCcwyK/7YnQ/6Xm6jiWQX5ozLkBkSYkeoGqA9/NFO/YIeS50CZbGrQAszFwTb
	 GUMmRDx5WprvlWm8hb+OFBiluthBhg52Ku4myZ/f5u5qBfS959B3cYTEwXmUTtYVPLKC5
	 DU9S8YM4372qacEXnYW9mYadVrcAkFrQrdMUQuZlcq92hQeNgZ+0YH6bxPJ1nf1+l5jp4
	 6Pjf6n79MSoruRBYAidaUxFgsTAr0hd/Kl5FIAok2FtUBvqgA0sG8A1/jcwi45AD1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799276;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aAugIPzNpC7UMbhZOYH201v2ZVOiEbosgCIzwR+ppz8=;
	b=18ZmxrKPauH1qbtQXNVt5+Rd1d2R/V9nqp6ddGdhceHq3k282/LWpY3GtZsfn5e2B72u
	 HOFWZ4+4tvZ0vXs5Fj9rIf8JE1gE/OraX24Nogl9O/kbhWbnEC4ZbBs4rpJ1YyxkL6Fny
	 Ljdhv6xGM6eAu5pY4ggi9iCg4V1swKavRRhP8DakqOpZ2OEVXwXAkfG0b0c09H4thKRU1
	 VZqTZn0EJQGx7//zNsLlcVU6QC7Dlr1NWEO7AeHJIbaC8HSdavBxQEWj7OfXuidMbAKMR
	 pHZJ1uVnKcUts2RTlvj7srSB14OZ+ft9qne75c/F8GFNzEY5DsCCtCBx6FCQkQawFAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8mHgAyn;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C83B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8mHgAyn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eG80WsiqYoqypFBVkKs72E/ZaOBrPv9KsimpXVqkwp4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794799273; v=1; x=1795404073;
 b=M8mHgAynhyIaHwj8+XGfMzBIHc+IdQcIEk4IF4vG8ksew36D48bwjAuUJK/qF5gkGucmGLM+
 2puK2I/3h9gGZVbVjnOX1NfDYfND6eIZSIVNjvwhYewBZxBSj8SfCH+UvEU0tVKdM4G75tk5Wxt
 3zMtuRp5gYRvu7APFCx0QRoU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7d2cc37c894a39c5;
	Mon, 16 Nov 2026 03:21:12 +0000
X-Mizu-Trace-ID: 7d2cc37c894a39c5
X-Migadu-Flow: FLOW_OUT
Message-ID: <cea5d9af-435a-4708-a937-59c7cbcb169e@linux.dev>
Date: Mon, 16 Nov 2026 11:21:06 +0800
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
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, Suren Baghdasaryan <surenb@google.com>,
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
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <avWtxcH2mKw7dgbp@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/11/12 20:15, Uladzislau Rezki wrote:
> On Tue, Nov 10, 2026 at 07:25:42PM +0800, Hao Ge wrote:
>> The PTE loop of the unmap path stops only at addr == end.  With an
>> unaligned end addr never lands on end, so the loop walks past the
>> range and keeps clearing.  With an unaligned start the loop begins
>> in the page containing start, which extends below the range.  Either
>> way the unmap clears the mappings adjacent to the range, and that is
>> nearly impossible to debug afterwards.
>>
>> vmap only installs page-aligned, page-granular mappings, so an
>> unaligned unmap request is never a legitimate teardown, and there is
>> no way to tell which pages the caller meant.  Check addr and end at
>> the entry of __vunmap_range_noflush() and bug out before any PTE is
>> cleared.
>>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 86fbb1d2b27a..0565cbfe325c 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -518,6 +518,8 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>>  	pgtbl_mod_mask mask = 0;
>>  
>>  	BUG_ON(addr >= end);
>> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
>> +
>>  	pgd = pgd_offset_k(addr);
>>  	do {
>>  		next = pgd_addr_end(addr, end);
>> -- 
>> 2.25.1
>>
> I am not sure this is good to stop machine at all. WARN_ON_ONCE()
> and return?

Folks tend to dislike BUG_ON. Dev suggested switching to this when I sent out v3.
That's fine. After all, nobody has hit this so far. I'll switch it to WARN_ON_ONCE
for the next version.

> 
> --
> Uladzislau Rezki

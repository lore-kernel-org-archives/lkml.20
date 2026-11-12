Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468045;
	b=pEHpsT4L9XsUQJfLNH8obFTtcIvVimvSDB63CZlUzhHjVSazuGYlsuoO/zelHBnnEeGJ
	 VhdqQjhI0enPmGt4Rkw6ziiN2b8Bsb8X7Khi/ah960spHF2JJxThsUHb644vL1uS5NOfJ
	 Tw37QslHjW0yEOHi7EQ5sd+Ca9Zys/9xLzQLDjj7y5qRjaC45/sDavjmgjngghZ/wIsz+
	 N/g46VtgdVAVcg0Onn8G2Kg4nQgt2pKzDsVoxRZCUH/Dvvi6F3J0WW1SZcNrKxClzYWRX
	 16xzJdE9AQjGZcJ5Iz4ZNnaFSmFDwPGV8XyP5lCd7xtkIHc4EdwqNfwpHW2GxKvKABA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468045;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3GObAzVicUC769Ed2LFARvtfjPhGbRDsMG32aEyAYQQ=;
	b=JsABm5iaXoG2gKQEHyKWTgMHGdB8hm9XtrFoo20QGDNsJVBBEtl1E+C4pQUA2jJTlXMj
	 VC10eVEd0ous8riC3soYIW5mL91hJZ96+sVF0qXpHCSu7ajfiBkOcPdQCOJQUn4t7hzO8
	 z3N0KPVZkp51EkJfdoY3ma5VwYTyeiv9hgefaT+ocIQUqDuOZnh9C5zXB8nmS6p7eKBN6
	 Kh3UILpzdC79nZ+bhibEj3d/tyvvECIynuBX7f1mIF3l0nVME9ubwh2JlZdRJSlVwDBN6
	 94KQh+mRu9N635piszHSIi1hkc0G8+LZsBKObHFhcH8NJW2h/o5ONIAZ/zJlKKMlWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NDeNazzc;
	arc=none smtp.remote-ip=95.215.58.82
Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B8606A88D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749B8606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NDeNazzc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dkOG8X97iyUWtRioal1Da3kor1MkKGE54K5m2vTuMmA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794468042; v=1; x=1795072842;
 b=NDeNazzc2NYXl5wHgkaQxUQ8AjB919HVNYVIb4QbDNHsxv6amVa2cSA00BbntsYsk5cJpkhG
 OJ2C61F0wX2KXAmZL8ZoveY/bZJb47ZUEf0J457Blm9rK99LD3+KE5jdKJHOps6k3nxE7PEcVJ0
 y4tsagCneKvin0hJCa1mXR8M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 93c8f31eebf66027;
	Thu, 12 Nov 2026 07:20:37 +0000
X-Mizu-Trace-ID: 93c8f31eebf66027
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f5e05bc-fdde-45c0-9034-75ae576ebdc9@linux.dev>
Date: Thu, 12 Nov 2026 15:22:02 +0800
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
Subject: Re: [PATCH v4 4/9] mm/vmalloc: BUG_ON() on an unaligned range in
 vmap_pages_range_noflush_walk()
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-5-hao.ge@linux.dev>
 <CAJuCfpGMtHZSUhUra9rp5xGvD+L6reopCMb3qXgRSctQ7wnYFg@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpGMtHZSUhUra9rp5xGvD+L6reopCMb3qXgRSctQ7wnYFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren

On 2026/11/12 08:16, Suren Baghdasaryan wrote:
> On Tue, Nov 10, 2026 at 11:24 AM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> The pte loop of vmap_pages_pte_range() maps whole pages and stops
>> only when addr lands exactly on end.  An unaligned end lets addr
>> jump over it and the loop keeps mapping into whatever follows the
>> range.  An unaligned start maps the page below the range with its
>> first pte.  That corruption is impossible to debug afterwards, so
>> bug out on addr and end at the entry of
>> vmap_pages_range_noflush_walk().
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 27f2674a5556..86fbb1d2b27a 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -698,6 +698,8 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>         pgtbl_mod_mask mask = 0;
>>
>>         BUG_ON(addr >= end);
>> +       BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
> 
> Instead of BUG_ON() here can we error out early in this function's
> callers (with or without a warning)? This is a static function with
> only 2 callers. vmap_pages_range_batched() uses it in a loop but I
> believe if we check the original address alignment then consequent
> calls are guaranteed to have aligned addresses.
>

One thing that worries me about checking in the callers, a new caller
of the walk can simply forget. 

If we take the approach raised after my patch 3, handling the
unaligned range with WARN instead of BUG, I am happy to do the WARN
here. Even the BUG_ON(addr >= end) above it can become WARN, because
it only fails this mapping. If the module is not that important, we
can ignore it and let the system keep going.

Thanks
Best Regards
Hao

>> +
>>         pgd = pgd_offset_k(addr);
>>         do {
>>                 next = pgd_addr_end(addr, end);
>> --
>> 2.25.1
>>

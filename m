Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466839;
	b=I93x6YBS7ITAuQWkXVqACTEsggMoSd24kbB0ixaAL2UdNmMDVn1tKJL54u4m2by1kaor
	 FSXDnbjjWrJeHE0A1TX9i4tpY/dbRgdljZYUH4yz6WagWD1cDKxku1NRmDW2ai4T0yuRU
	 x+DjNPhkNoS0I7ICDBcJHWymWW0YubM/2xi8CN9dxXNZBYHcquME/89KVMV9Wju5/6Qvc
	 SMpBkxdcgER6LS+ucFY0CkrplTprsgKYTtOg26V4E5Gp7o2ZXcGtR1zZ7d/PsFHAUppJs
	 QgnrGFxH0KFIesHOysbww1ZqvZUbCATiNff3wjFI5gLISra0GpqO21ecFKgf3Mam31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J4xIggD0g8SlhhtdOwMFrAXrBVevW/MmjFyooXoSNeE=;
	b=18zXr9OUTRGyBbzNOHyHRgYImYP1D2C1JAzRjrG8W6PAM9uL5lD54PXE0O0GanLuw/sC
	 fvhMprhlvTrrFDI7Nn5YqBimcmZdwxVH28MaSNjCM67odpnx/xDcu0wZ/VJCc2g6aWMZd
	 V/sf6HmD67bzkBNAAzpp/6VVRpBsy96ebQxlfpaT7jro9WENSr0kXgoj6AH8JHEiB9OdT
	 ULlb2+DzwqWL8twTmgyHNf0RPkzD1mvKcAGJIMiUpIRqzpbcFmMrLKb555OSBnTb4f/ha
	 0tZo/cTMyfm3dCK8xsijOzUzRmalSrg15N7lCvP+rDMaAT3LSaqPl7lzKGfLN9wjltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=owLrm7cB;
	arc=none smtp.remote-ip=95.215.58.9
Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D79A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=owLrm7cB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IWVkZhORY9imY5FneS+keJKgSYCeTxoJHysJ7YNaF+Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794466836; v=1; x=1795071636;
 b=owLrm7cBfzN1UV7R16E1C54SoQ6uEbb9iF8oE9Q5nwcgoWHQirDw5gp7jkGwGjeLafzaGCP1
 Te46sEi7bhxP9cwDDRW2wHBKzqLnYx5iq1pmrfxW0YYJxKqEKpde6mzEEQo7PWPyTvt+znR0GhH
 xNDE2eDuB7safnAL4u5eo6JM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5f9d5e168c7f5611;
	Thu, 12 Nov 2026 07:00:23 +0000
X-Mizu-Trace-ID: 5f9d5e168c7f5611
X-Migadu-Flow: FLOW_OUT
Message-ID: <4ad546a2-66c5-4b74-a221-d9e8c1006c73@linux.dev>
Date: Thu, 12 Nov 2026 15:01:48 +0800
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
Subject: Re: [PATCH v4 6/9] mm/vmalloc: only flush the cache after the vmap
 succeeded
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
 <20261110112546.261415-7-hao.ge@linux.dev>
 <CAJuCfpHReBDoXj_U3Dy2hksj63KyHNBm4gS+wtR_ywidyJ8mfw@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpHReBDoXj_U3Dy2hksj63KyHNBm4gS+wtR_ywidyJ8mfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2026/11/12 08:30, Suren Baghdasaryan wrote:
> On Tue, Nov 10, 2026 at 11:25 AM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> vmap_page_range() and __vmap_pages_range() call flush_cache_vmap()
> 
> New vmap_pages_range_batched() function has the same issue, so needs fixing too.

Ack. will do next version.

> 
>> before they even look at the error code. A failed mapping is never
>> used, so the flush is pointless at best.
>>
>> According to the Sashiko review it is worse than pointless on UML:
>> flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
>> PTEs into the host OS. Flushing a half-installed mapping therefore
>> leaves host mappings behind for a range that was just freed again.
>>
>> Only flush when the mapping, and for vmap_page_range() also the KMSAN
>> metadata, is fully set up.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 0565cbfe325c..3f98056f8c7e 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -369,10 +369,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>>
>>         err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>>                                  ioremap_max_page_shift);
>> -       flush_cache_vmap(addr, end);
>>         if (!err)
>>                 err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>>                                                ioremap_max_page_shift);
>> +       if (!err)
>> +               flush_cache_vmap(addr, end);
>> +
>>         return err;
>>  }
>>
>> @@ -758,7 +760,9 @@ static int __vmap_pages_range(unsigned long addr, unsigned long end,
>>         int err;
>>
>>         err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift, gfp_mask);
>> -       flush_cache_vmap(addr, end);
>> +       if (!err)
>> +               flush_cache_vmap(addr, end);
>> +
>>         return err;
>>  }
>>
>> --
>> 2.25.1
>>

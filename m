Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCB37B41F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459773; cv=none; b=TbW/O0Rn6coJ/lFeOLDZ1LS2IAhtAjdPiBzqyHB7eCqvT0G56w4klBMv7jU2TSr8s+VKCBtX9J+jNJ6NTtnIYHC9RMbV44PEgwm1jpAH+Ct6xepOxF8CJT/zx8rmgGctziteDRnSMfaf1oe5eLqzbj+Ht3LfCMHXGy2/Bq9ZCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459773; c=relaxed/simple;
	bh=BkVd9U0H4Y6EudAIncziUfkCyRdScrX9nZaOR99Nz6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZG4RKyyFEUP/mShFV9vGwvt831wwNses2wi6Im0H0UrtRn23ErqyZWRV/GUB/NgffYiDVleZf6AZsMdM7KzalLb/B+ec67AwH0tF7Mhb4u4bY9Y4+OnTmFLPg6SMncItKluvQie0/Ts8RCVOmzOT/uh1wpJ30Ubt01rA/CcKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DfjZHrj6; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DfjZHrj6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BkVd9U0H4Y6EudAIncziUfkCyRdScrX9nZaOR99Nz6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789459768; v=1; x=1790064568;
 b=DfjZHrj6G1MyB2GA9MrphguV2Gfsts1XdFRNq7jjG2eg876c61r0OsxKdl5S4F3zZOuTIiHx
 BOAXgc/UY9WqGwgV1KcqduieSq611kIl3/N1bUxGGVo+tv3DzQZUgQzmVgihp/XYgPDj3dHj40m
 v8AzEWkseUq+Vb7ly85rjcL0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 84fb79607566e710;
	Tue, 15 Sep 2026 08:09:28 +0000
X-Mizu-Trace-ID: 84fb79607566e710
X-Migadu-Flow: FLOW_OUT
Message-ID: <ce56891d-8302-411b-a396-66f40760b3be@linux.dev>
Date: Tue, 15 Sep 2026 16:09:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove unused exact_nid parameter from memmap_alloc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20260914055130.44543-1-kaitao.cheng@linux.dev>
 <20260914212200.75878c86ab806c7e09b6c69e@linux-foundation.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <20260914212200.75878c86ab806c7e09b6c69e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/15 12:22, Andrew Morton 写道:
> On Mon, 14 Sep 2026 13:51:30 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> 
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
>> mechanism") removed sparse_buffer_init(), which was the only caller of
>> memmap_alloc() that passed true for exact_nid.
>>
>> All remaining callers pass false, leaving the exact-node allocation
>> branch unreachable. Remove the exact_nid parameter and unconditionally
>> use memblock_alloc_try_nid_raw().
>>
>> This has no functional impact.
>>
> 
> Latest development code has changed quite lot, but this was an easy reject
> to fix:

Thank you very much for helping me fix this issue!

> 
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -53,7 +53,7 @@ static void * __ref __earlyonly_bootmem_alloc(int node,
>>  				unsigned long align,
>>  				unsigned long goal)
>>  {
>> -	return memmap_alloc(size, align, goal, node, false);
>> +	return memmap_alloc(size, align, goal, node);
>>  }
>>  
>>  void * __meminit vmemmap_alloc_block(unsigned long size, int node)
> 
> 
> --- a/mm/sparse.c~mm-remove-unused-exact_nid-parameter-from-memmap_alloc
> +++ a/mm/sparse.c
> @@ -215,7 +215,7 @@ struct page __init *__populate_section_m
>  {
>  	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
>  
> -	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid, false);
> +	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid);
>  }
>  #endif /* !CONFIG_SPARSEMEM_VMEMMAP */
>  
> 

-- 
Thanks
Kaitao Cheng


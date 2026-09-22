Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274273EC82B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064417; cv=none; b=bLb44aI1H+eh0qvPd6/vqrie+JJS5PkDvHWtVoNWjaqtuVX5dkUPulWQcBY7AbPLtnw8CqxwBQb1YXDNaIuxuknFw5LltNXMd+uQP3vlw8WG1RjxWVuWfmZ7Mj8xaPHMCt+vu+t+4HLuKgKgyPoYSMG5ZiEOKOmELm1/mSkU4SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064417; c=relaxed/simple;
	bh=L3E1ABTsvQD+v6c+2rBUEff5SSrYDo8CA8Cr1zQwot4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdmpuBql9qGcsmmk13At0+ANfFt3+CMLuy5cKxu6eBQuhVGAa3582V+wHU2ZustuN54Jm44VsbZ+z9VA2g4gi32FbNRDZNWcuY/zohXvvfCwzHEjxNFRaKOHE6QVf+y1fszQvsz1gYf0SMH2xmipXOMqus5Eus8tUnlSTWKild4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pZWTZU4L; arc=none smtp.client-ip=95.215.58.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pZWTZU4L"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L3E1ABTsvQD+v6c+2rBUEff5SSrYDo8CA8Cr1zQwot4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064404; v=1; x=1790669204;
 b=pZWTZU4LUhgakPVLGPX5D3FFmTpz3l4NLv1Dxd8Hh3GY6WQ89/zEBlXWSy5IxOqeZKiwBf+I
 szl3QUQlqfANKxTdOHbhlH8HoCr7f/+XDZoOK/y8NyoC+YxoDfPuHfOsRIX8BFlcR76U/bkOlLw
 w+UG/W3InrzU8AMWSb8ChDwA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 69a7d16cab5036eb;
	Tue, 22 Sep 2026 08:06:44 +0000
X-Mizu-Trace-ID: 69a7d16cab5036eb
X-Migadu-Flow: FLOW_OUT
Message-ID: <8a135fee-1f75-4260-afa0-10f8b522809f@linux.dev>
Date: Tue, 22 Sep 2026 16:06:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mm/sparse-vmemmap: drop Device DAX-specific
 population path
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-4-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> The common vmemmap path selects the shared page for optimized mappings
> itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
> to find a shared tail page and pass its backing PFN through the generic
> population helpers.
> 
> Remove the Device DAX-specific population path and let section memmap
> population always use vmemmap_populate(). The powerpc retains an
> architecture-specific compound-page implementation, so select it directly
> from radix__vmemmap_populate() for optimizable sections.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c |  3 +
>   mm/mm_init.c                             |  2 +-
>   mm/sparse-vmemmap.c                      | 71 +-----------------------
>   3 files changed, 5 insertions(+), 71 deletions(-)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

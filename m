Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1993FF1AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064881; cv=none; b=fJle+mE5YXsoAqfJpirSAoYf2eNkuIMVGH/Hu1W9xUcL+oy3w85TkP2LPDekZX0X99F1jt6UQyovQDGWKnw9x2I5TBpVYLGdkNQQYypszHwgN6DhJCFp0tAmTcq1zGzMwXn2kgu/f+C2XBYQbuRFaO8sTs8Xb007stjXt15Vhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064881; c=relaxed/simple;
	bh=J2i5GvjJ+wUOBpbMeil8dkAVf6eHV4FfangEdsKlF5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e60Wjxb14NjA5UgpTpffaBlAI2bNQReAelPbF/YR22a+PIMqbU5PU68KhltZhIbE5+vwgxSglNx/FuCtQoDBE5tCq0O1QNRhrNm16LPnCfZ6e+mpLNkG+ZntImFLhM4trr94yYdtMIgtOHaIjF2ZfIpByrmNJe5k4PaJbBhbUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BdpNALhd; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BdpNALhd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J2i5GvjJ+wUOBpbMeil8dkAVf6eHV4FfangEdsKlF5o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064873; v=1; x=1790669673;
 b=BdpNALhd4Xq72H0U13xGDLE2o4tCZFTlNFxRZ0RV+Y3w6reTkOcOxBJcuW8xV5K/M7OfmtDj
 359+6dseT0n9OgrcsJtw3C7MUkz2TmJCJFIcWBdFPwSkadiw/q8BirBltj+HGJWDS3/usPc9RvN
 d+jh8sl+IQiz9S/FbFA0o+ow=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ac6469190cc15d1a;
	Tue, 22 Sep 2026 08:14:32 +0000
X-Mizu-Trace-ID: ac6469190cc15d1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <4f419e8d-de07-48be-a69c-7b7b9d4a1cb7@linux.dev>
Date: Tue, 22 Sep 2026 16:14:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] powerpc/mm: make vmemmap_populate_compound_pages()
 static
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
 <20260913083734.86802-6-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> vmemmap_populate_compound_pages() is no longer used outside
> radix_pgtable.c.
> 
> Make it static and drop the unused dev_pagemap argument from
> its only remaining caller to simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
>   arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
>   2 files changed, 7 insertions(+), 12 deletions(-)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


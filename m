Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA13C09EC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231939; cv=none; b=Da4Guf+bs0lWYCai04X/qvdgVNgV5hqr5cXpIAl1Ftyu+P0wqnip8C2Q5xSnePgJIYW8b1xwaFODV8h6SAh/yFHbcVFqrYntxpPUPP2qHSrSdHWyiEawwTphO38CSasmPucu3DxVzaF05B5uXZlr5Irm/ip8i3ESa53ZoFAFGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231939; c=relaxed/simple;
	bh=om/9bGBfkYvM+IJmkkqUPDFd/PD2WvlDipw0cZRTGNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cubhuOfPR5tovivtomtKXnTYtkDz0PmK2HamhJc2Y9z8jOp1fu/8w/iFZibhbIFSLrho/5DMPV4P4np2AIe/Ux8fw97E3cdY3HTicygwPXKbH9Fu1kCXOqLfV+MQV5qFXSJosemOAXbO9rWRNkFHvUFwXGDbfzJp1JIloT6VoW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RzCg2EyL; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RzCg2EyL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=om/9bGBfkYvM+IJmkkqUPDFd/PD2WvlDipw0cZRTGNE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788231935; v=1; x=1788836735;
 b=RzCg2EyLX+DLkWdT5WwAUtyG2TSekpBJmYi40rJg2sjLfJcqww9e3QBg8c5Cw8UhjU6CLPgO
 lwUTqHb3tHJPHRAzJKi7/uMXWZvcESuAZ0Fj2Mzkzgvg7xOHH3kOgikMZ6PfyRMGj8hB+4dSqhH
 Y3yyds94CFHfvZGaiiPNDRsU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83324dd7b0a9859a;
	Tue, 01 Sep 2026 03:05:35 +0000
X-Mizu-Trace-ID: 83324dd7b0a9859a
X-Migadu-Flow: FLOW_OUT
Message-ID: <b59449c6-d2b5-4b0b-ada4-7630e060ee7a@linux.dev>
Date: Tue, 1 Sep 2026 11:05:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] mm/sparse-vmemmap: factor out shared vmemmap tail
 page allocation
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-3-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 3:53 PM, Muchun Song wrote:
> HugeTLB and sparse-vmemmap each have their own helper to allocate the
> shared vmemmap tail page used by vmemmap optimization.
> 
> Factor that logic into a common vmemmap_shared_tail_page() helper. It
> allocates the page through vmemmap_alloc_block(), and uses cmpxchg()
> to install the per-zone shared page.
> 
> Expose zone->vmemmap_tails under CONFIG_SPARSEMEM_VMEMMAP to match the
> shared helper's build condition. This avoids a
> !CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION stub; when optimization is
> disabled, the array has no entries and the compiler folds away the unused
> paths, so no storage or runtime overhead is added.
> 
> This removes duplicate allocation logic while still handling both the
> early boot and runtime paths through the same helper.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   include/linux/mmzone.h |  2 +-
>   mm/hugetlb_vmemmap.c   | 28 +---------------
>   mm/sparse-vmemmap.c    | 74 +++++++++++++++++-------------------------
>   mm/sparse.h            |  1 +
>   4 files changed, 33 insertions(+), 72 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi



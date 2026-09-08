Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827738D006
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853592; cv=none; b=FCsuGvCP7wPCS6veWy9tXClgoN6W8xunIe9GEsJWi4FrY901UOwGi6WGM6brTOny7H6FoV+TqN4D1MJNUxeAtDs58rZar7G2XyidtbZv+WmSJqCZmuWkYqpB/6TrKAFEBXpXGCzOdkjuw0/ftK+J2ZpeeNY+cO6qJKfTJtFH0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853592; c=relaxed/simple;
	bh=ixBAYP3Du6CsKocLljvRGfCjKPRhF0PCatiq8iaNJ/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gr6EcK0scz52EJDxCrIYYM56lJmUktRMr4m2eL2dVvgHVnMCR9mhDS4CJGIt0CnZ7kmJSt82lzsNx1dtFey8Zdr2I+tnmCwcwCR9Uk7Bctv73+BOV057b+ao4NNLzFCLb+AVmviy5jAqAswUSzQBeObjHBDDYK1J4/o2UnJHdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TqNJeRfn; arc=none smtp.client-ip=91.218.175.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TqNJeRfn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ixBAYP3Du6CsKocLljvRGfCjKPRhF0PCatiq8iaNJ/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788853587; v=1; x=1789458387;
 b=TqNJeRfnlPGt5thwILWmaRYK8CK+vf+m//CuibP3MRNHd5H0PlyhI3O8jUpMHnmAmBK5/9yV
 35l41r+H7hf2qvrP0IJEhjF7O8US4lpcbNgsBYUezkwjfIbFonFA/PrdIN8FC7jLO1PT5LfGyaR
 DOBKDiFjjLdhdg3R9MZXdFpI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 539c04568d93ce89;
	Tue, 08 Sep 2026 07:46:17 +0000
X-Mizu-Trace-ID: 539c04568d93ce89
X-Migadu-Flow: FLOW_OUT
Message-ID: <1fc41803-a0b3-48ca-84a6-caf965fb11f9@linux.dev>
Date: Tue, 8 Sep 2026 15:46:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] mm/sparse-vmemmap: switch device DAX to shared
 tail vmemmap pages
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
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
> Device DAX has not been switched to that mechanism yet.
> 
> Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
> with HugeTLB by using the common per-zone shared tail vmemmap page.
> 
> The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
> which is assigned when a DEV-DAX device is initialized. Unlike FS-DAX,
> DEV-DAX does not modify tail struct pages, so sharing them is safe.

Got it — adding this description makes things significantly clearer.

> 
> Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
> initialize its entries with PG_reserved for device zones. Also skip
> poisoning vmemmap-optimizable sections while their struct pages may be
> shared.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Explain why sharing tail vmemmap pages is safe for DEV-DAX
>    (suggested by Qi Zheng)
> ---
>   include/linux/mmzone.h | 10 +++++++++
>   mm/memory_hotplug.c    |  5 +++--
>   mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
>   3 files changed, 28 insertions(+), 34 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3D3E5578
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597357; cv=none; b=Dot/N0S1ilCY/hgIOSlqRemg2yoa6GDFKlbU8ppmjM2wXpfJV+zB4SRLw75d7Mo31NKQY5hnF/X6ucB3oz73soodtDnRMlIaWZ6oBmnRyESyz3CEgxcoHxrfZ9HnrFaK17hnROT1tvMqXrL1n/kHmHM3y7A7KtKeU+9Cwl4BlC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597357; c=relaxed/simple;
	bh=LhEf2lmvz3lHfnrYNvIqdGOINaYOzsSsBbuAUaDK0d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0G20NksFZesL4TOtHmth1oXINWy46I/vIlWU5Jn/1tfWnvVnQsUAtccouUJWz3BfuyjLKc+Q7rYmEH31KMujy2cTpV63J3tmozgWqGj6CrkQ1sqfiuFO9AiSXyEUrudFXbknlXvdqE1ROUnyiEzRA/uXLSUbeZLYEQWRe62IKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LoAZgjW9; arc=none smtp.client-ip=91.218.175.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LoAZgjW9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LhEf2lmvz3lHfnrYNvIqdGOINaYOzsSsBbuAUaDK0d4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788597353; v=1; x=1789202153;
 b=LoAZgjW9eTsAU3sYux3iSDpm37PYZQJ9V9SZ8rpDaXIIEopob8BJCt5B+NVpxfZ/CTiLmU7I
 qX8hgUoDhJWrpj9uFblu4qZJPE2mY649obJhSiyiTdQT/BWIMiyvG3RTKfqzUioAu/4agaJppgi
 d6CVlIvUaJr88PD81EE5/DXE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 41100b57e1186b92;
	Sat, 05 Sep 2026 08:35:42 +0000
X-Mizu-Trace-ID: 41100b57e1186b92
X-Migadu-Flow: FLOW_OUT
Message-ID: <e3d0eaf8-a85f-48ff-96c2-dced4945b085@linux.dev>
Date: Sat, 5 Sep 2026 16:35:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] mm/sparse-vmemmap: switch device DAX to shared tail
 vmemmap pages
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
 <20260831075342.57563-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 3:53 PM, Muchun Song wrote:
> HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
> Device DAX has not been switched to that mechanism yet.
> 
> Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
> with HugeTLB by using the common per-zone shared tail vmemmap page.
> 
> Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,

Could you explain this in more detail?

As sashiko pointed out [1], it looks like this assumption is
problematic: dax_folio_reset_order() may end up modifying all shared
tail pages?

[1]. 
https://sashiko.dev/#/patchset/20260831075342.57563-1-songmuchun%40bytedance.com

> initialize its entries with PG_reserved for device zones. Also skip
> poisoning vmemmap-optimizable sections while their struct pages may be
> shared.
> 

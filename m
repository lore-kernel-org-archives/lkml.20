Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384758;
	b=Q2QhtdPrvy+fUVHI54DHl7ob/8naoKk9jTNvkutEPmq2wPslCoD/96y6paiHTqXWmARe
	 B5n5rle3Fv1zZ5S+wAlG4Qa5b8M2LMW9VfcjrSLeAfDWMVY8p2T+TqUBxses5E+n/uG96
	 fWbJjdJJmpuvGt9xscwx0Ed/A2VwKlgufjBmUCK5eiqtdCmY7XP6NQ4ETStCqUSo2zhMO
	 B8KBEcGRT7hH0TFTjfR72PGzTG4iQ45E92+6pRkwo1qV9jfQZj3W5vmXQOex9tq88b+DW
	 5aZewJAYJ1ryz3HqV8TmAuqaQgZeLtr5pmNAeKoAop6xNsXdpJgtwvl0dwYA9+kpvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384758;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MOpaFrA5WG6cRTCN6gZ0dyNSh1aJ9ayc3GdsVFIh8g8=;
	b=trd5hbDDI53X/vEf0DYRWyM0cGQE71QEWqm6ghYWJwUYB6OVDm1v1mwGFUt2Fi9X+POJ
	 tSYL/PHHWuOv7ia3tEQ6Pct4c4Uufd46fGoi6f3ufuUKhfFfAZsQ08lrEKRB/4wXWiodH
	 e4+nO3h6gf8t6zUwuiD1zxN8HjMlbGOm+vpuP8t1NRUoqL1COMCSSg6ZDdCHL6BZRm3S+
	 6Sry4X3yL6ERI4q7JRtnkwhd8OCWhC1a3AnW63+7iciDk+14ro6NK5mn9GU9a2Ll8i65F
	 zv5UGaP+J6jdRi7db/XrdBUd+Mb/M1hgB/LPo6sBRU8ADmVjLUTIAtIi4Fc/dg+EQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AT4Au7mV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09623606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AT4Au7mV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8125A1F00A05;
	Wed, 11 Nov 2026 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384757;
	bh=MOpaFrA5WG6cRTCN6gZ0dyNSh1aJ9ayc3GdsVFIh8g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AT4Au7mVz+nz+pxtKL2YwsNVaLoq55LneXErwbkRbtJk3ZmW2DUML7Xu9QZnlF9sq
	 YeJWnKorrTuaJCBmWnK4xzP+KEqeWO0czNM6mByfCApZAyjcQq9nqVWnE1Gis1KvIe
	 I8wSwpw7/YWwF1wwJ9juXoweNKt611pW/eCz6w4PdGcvq+4v99U1evfRqbPpfjKodN
	 G/gARu/Fmvi0tdVi/tBelpvztJsg7mC4nErNxAdJq2TrlyucS5oZyh1o3msHBObllv
	 Qpnq0UqK9Mbr33DZfb3Hhw5KwAsoqE4zZvkDsHHnjnwVapTC8wcXG8PvXfxj5hnYL9
	 GSux4VBNa5ktw==
Date: Wed, 11 Nov 2026 10:12:30 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, apopple@nvidia.com, balbirs@nvidia.com,
	david@kernel.org, muchun.song@linux.dev, osalvador@suse.de,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] mm: optimize HugeTLB bootmem hugepage init
Message-ID: <avQjbt-QUp-W3_9v@kernel.org>
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110114859.76343-1-lizhe.67@bytedance.com>

Hi,

On Tue, Nov 10, 2026 at 07:48:57PM +0800, Li Zhe wrote:
> This series speeds up the fallback initialization path for HugeTLB tail
> struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
> optimization (HVO) is unavailable or fails.
> 
> Patch 1 factors the existing ZONE_DEVICE template-copy operation into
> memmap_init_page_from_template().
> 
> Patch 2 reuses that helper in hugetlb_folio_init_tail_vmemmap():
> initialize the first tail page normally, copy it into a local template,
> then initialize the remaining tail pages by refreshing only PFN-dependent
> fields before copying the template.
> 
> In the earlier discussion, Mike asked whether the same kind of
> template-based initialization also helps the ordinary struct page
> initialization path:
> 
> https://lore.kernel.org/all/akfB6Qe-jKDEMUxz@kernel.org/
> 
> I tested that direction as well, but did not see a measurable benefit
> for ordinary struct page initialization. The measurable improvement I
> could find is in the HugeTLB bootmem hugepage tail path, where gigantic
> pages can require initializing a large number of tail struct pages when
> HVO does not cover the allocation.
> 
> Tested on an arm64 QEMU/KVM guest with 4K base pages and 64 boot-time 1G
> hugepages. HVO is unavailable on arm64 in v7.4-rc1, so the fallback tail
> initialization path is exercised.
> 
> Results averaged over five boots, measured with a temporary
> jiffies-based printk:
> 
>   base (v7.4-rc1):  318.4 ms
>   with this patch:  202.4 ms

Are there numbers for x86 without HVO as well?
We need to be sure this does not regress that use case.
 
> This is a 36.43% reduction in the measured fallback tail initialization
> time. The temporary measurement instrumentation is not part of this
> series.
> 
> Li Zhe (2):
>   mm/mm_init: factor out memmap_init_page_from_template()
>   mm/hugetlb: optimize bootmem hugepage tail vmemmap init
> 
>  mm/hugetlb.c | 20 +++++++++++++++-----
>  mm/mm_init.c | 34 ++++++++++++++++++++--------------
>  mm/mm_init.h |  2 ++
>  3 files changed, 37 insertions(+), 19 deletions(-)
> 
> ---
> v1: https://lore.kernel.org/all/20261105120615.16817-1-lizhe.67@bytedance.com/#t
> 
> Changes in v2:
> - Add a comment for the template-before-copy ordering, as suggested by
>   Muchun Song.
> - Drop the empty-range guard in hugetlb_folio_init_tail_vmemmap()
>   as suggested by Balbir Singh and Mike Rapoport; current callers are
>   expected to pass a non-empty range.
> 
> -- 
> 2.20.1

-- 
Sincerely yours,
Mike.

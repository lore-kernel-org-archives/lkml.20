Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501285;
	b=Ip5XQBoyptIn4GXiX3zsYpo06pfEgEYs4IpKlKq/O4NxQ7op8rTpAsR+FlbrW+n1nuGV
	 Qj2ZnEAi6ryWyz7AJgmrO8vX+rTuR/FN8sjolytDEin62M7nDPYX6D0ozqboX2eWfOSaB
	 xxbROuHrCVvg3Kyv0q3QqE/tOc2dn3nViWz/mrQmpReiNVIAwYq3YRYQrbGoSAeCivn21
	 Xu/b2Xe19WrE6oxPXGCFarmyne2H3ZIGQX/6PxHnZBUYAYqr8X/BmrVf4FIxranl2AJdC
	 VAnavLgQOfmJndi6zA3W2WxU0v4x1SGQXjrUQKPNKTXglZ9ZCe75zdwQjJRumo7oFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3fM6KLKOJO3YyJn3UQnE5Pf8Vkdal0xJx57r6jbj/dk=;
	b=lEBe8SM9btDIEx79oRE/asrjJIKjSWXxP0TtUVLwghl/bBSS56KTUNK0zq/GmwaDzdyx
	 ILmEh6hpkdkPyqj0emizO26Krq4giRQfr74nXMjDzKvkBX/hEgbb6RRnDH+MhyAx4Wa5C
	 PDomFU+6uSnfHp5XTTcK4q7eP70TLZRj50eykQv0d1PfYSlark08f9yib6JPWhHB1OUMp
	 CCRllIw1IVLxBccJHh+H2UaZUxqiyYai/Zust0h1yrOH+jtz3cxtTGtl1aymnCEzUlqY7
	 MszKTboHOoUZQpEZO1mwJutuE/e7zKxddaBtD0/By4dJgsVNIO5+qyZ61pcSokXQ/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ct/g+c2T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC34606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ct/g+c2T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483081F000C4;
	Thu, 12 Nov 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501285;
	bh=3fM6KLKOJO3YyJn3UQnE5Pf8Vkdal0xJx57r6jbj/dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ct/g+c2Tav6x0NHCaTpZEnj2FLRtf/WNxdWzWyAoIN3jDV8HceQCz4uJVhQvhMKZH
	 a1wGEhp69gapxoQ/mo582ztvpDrB9RM5HjVKAE9mnDVqKK6ZU3ROfLPkOjhrl7d9JC
	 igX4MeEEzW3Y03hNnIHyDmFRyYP5JMG5z7yK/GrwwNFyu9uGYK+Y4JyEJCbAuKFtVN
	 dMJ45hIGPWvSFbo1nA6/VWM0O9A4ayD1/1uaSumIo2n0EMc9cTU0mxejjUT7Xp+pMJ
	 hD0cu8eX9Aur0yDVWwqHo8kcHWguW8zBEsyHM5q+oIXHzTGigLF0QQcSVWo3Yocg/+
	 oBWFOeJDlEusQ==
Date: Thu, 12 Nov 2026 18:34:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, apopple@nvidia.com, balbirs@nvidia.com,
	david@kernel.org, muchun.song@linux.dev, osalvador@suse.de,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/2] mm: optimize HugeTLB bootmem hugepage init
Message-ID: <avXqoKO_5_tPRZ4g@kernel.org>
References: <20261112112816.55095-1-lizhe.67@bytedance.com>
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
In-Reply-To: <20261112112816.55095-1-lizhe.67@bytedance.com>

Hi,

On Thu, Nov 12, 2026 at 07:28:14PM +0800, Li Zhe wrote:
> This series speeds up the fallback initialization path for HugeTLB tail
> struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
> optimization (HVO) is unavailable or fails.
> 
> Patch 1 factors the PFN-dependent template refresh from the ZONE_DEVICE
> template-copy path into memmap_init_refresh_pfn_fields().  The
> ZONE_DEVICE path keeps its memcpy_nontemporal() copy primitive.
> 
> Patch 2 adds a HugeTLB-specific copy helper in
> hugetlb_folio_init_tail_vmemmap(): initialize the first tail page
> normally, then initialize the remaining tail pages by copying that page
> with memcpy() and refreshing only PFN-dependent fields in the destination
> page.
> 
> Tested on a v7.4-rc2 base with 4K base pages and 64 boot-time 1G
> hugepages, measured with a temporary jiffies-based printk.  HVO is
> unavailable on arm64; on x86-64, hugetlb_free_vmemmap=off was used to
> exercise the fallback path.
> 
>   arch    base      with this patch  reduction
>   arm64   360.8 ms  256.0 ms         29.05%
>   x86-64  171.0 ms  165.0 ms          3.51%

Thanks for the numbers!
 
The changes are fine, but since they are going to be merged into Muchun's
series, I'll wait for that for the detailed review.

> Li Zhe (2):
>   mm/mm_init: factor out memmap_init_refresh_pfn_fields()
>   mm/hugetlb: optimize bootmem hugepage tail vmemmap init
> 
>  mm/hugetlb.c | 23 ++++++++++++++++++-----
>  mm/mm_init.c | 11 ++++++-----
>  mm/mm_init.h | 11 +++++++++++
>  3 files changed, 35 insertions(+), 10 deletions(-)

-- 
Sincerely yours,
Mike.

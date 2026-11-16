Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825776;
	b=s3AAoMmOD2XmNLAdpoPZ8W4B2BkWmP0f4mNP/z0AG3A4tPwDcOC+PkzasKqUjEn7fcrW
	 NiFo3UPvLCxaFKjvBE8bBAiJmSPRZHiBAfqNVzW71PciGleIi6w+yIEGjKmlOMViAQPzz
	 RD5wrdN8p9Dfxuxwj6sPIe7hD7YvnIUMSOIfoJFBnkdWPi7cTrNT8znyaxlvhWiGfn7bS
	 8p2f/qiWPqlsz8uUY5GaJUcuxEtCJ1tAUcr9+ErRTcoxpxH/BntPGWn3jece72r20gZMv
	 VHlJiakYO9VAOkWBfj+8Urp7jBuCz5skgsryhdKh2kvoJdlezrrJFB/CKMaGFj64xgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825776;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=ptIJKF4G1UyjI76O74jlBN8l9/s941YkkxlNAdtuMu8=;
	b=CpWyYnrNeINHerVurqIoCPRX/ul5hOIEfJYAbJ8UeOydM7KRJIk0UaVDOlZJDMWhzrsw
	 duyAv3P/KHPPC0ZZjJbdljjEZyRdLdJN85r8vWq3qDXkiLNFheO7HW1klhiilxSGCtVeH
	 tcG3MnShu7ECeQ1EOkVQrktyqbNsTEmP7Aavc2a0G8Cbw8s7ntNPouDRXSF8TOhvGCIYs
	 I3yIG0cd116lvCr58VCZdUiwRWn8HJWCz0HkSTstwFI8QH1CW5LbSWWcLa8+0aJYnHgBu
	 suhek8/4UJx24J8zVT8/5RLLd5OOusgg2bK4ntIwYUY4C0MuOthYBVPmBsTisqqLYbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WWdam/AP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F1606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWdam/AP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0781F000C8;
	Mon, 16 Nov 2026 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825775;
	bh=ptIJKF4G1UyjI76O74jlBN8l9/s941YkkxlNAdtuMu8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WWdam/APL/qDE1ME0tpyATJX4h2N/NfqBMABhQRZsr4y9omZlBqCigBlE9sUqU7EK
	 cUkQMn1C1rLkvY4rUd9x8Z+HBw4XfjIMAyKZ2JcFGQq+tdwnJsxdedh81DVxU9rDSR
	 4j7fOmJPqL2Nst2xXzhMh8D7EDJ3ZPokdDlsWL1I0XjnMkUCfgdGKTU9nuJwa2Eb+F
	 6rfk9XwqeEvLKoNieOUsZVEvF6CBnMGeHNq619ngLJO+p7RUmjK/l3xY/y7kOoNdZ6
	 Ec9nBZCNL9sjHdB6XEWlor1cIK9jkhj/UbTQBrKFoZRoc+2mdMNLUZaJJLMSyhjBcr
	 NzHrMuPHYp55A==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/14] mm: Unify memmap initialization for compound
 pages
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
Date: Mon, 16 Nov 2026 12:42:48 +0200
Message-Id: <179482576829.2379196.3205677806966393313.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Hi,
> 
> This v2 is based on the mm-new branch at commit daed51c91051.
> 
> This series is split out from the earlier, larger series
> "mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
> generalized vmemmap optimization across HugeTLB and device DAX. One
> remaining piece is the separate compound struct page initialization used
> by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.
> 
> This v2 also folds in Li Zhe's two-patch series, using that series' v2
> as the integration point [2].
> 
> Li Zhe (2):
>   mm/mm_init: factor out memmap_init_page_from_template()
>   mm/hugetlb: optimize bootmem hugepage tail vmemmap init
> 
> Muchun Song (12):
>   mm/mm_init: verify zones for template-initialized pages
>   mm/mm_init: factor out common struct page initialization
>   mm/mm_init: simplify zone device page initialization
>   mm/mm_init: factor out frozen compound page initialization
>   mm/hugetlb: drop boot-time HVO handling for gigantic folios
>   mm/hugetlb: initialize all struct pages for bootmem hugepages
>   mm/hugetlb: use common compound page initialization helper
>   mm/mm_init: make __init_single_page() static
>   mm/mm_init: make memmap_init_page_from_template() static
>   mm/cma: centralize CMA pageblock initialization
>   mm/cma: localize init_cma_pageblock() to cma.c
>   mm/mm_init: move pageblock migratetype init to memmap helpers
>
>  include/linux/mm.h   |   8 --
>  mm/cma.c             |  24 +++--
>  mm/hugetlb.c         | 111 ++-----------------
>  mm/hugetlb_vmemmap.c |  17 +--
>  mm/mm_init.c         | 247 +++++++++++++++++--------------------------
>  mm/mm_init.h         |  13 +--
>  mm/sparse-vmemmap.c  |   7 +-
>  7 files changed, 129 insertions(+), 298 deletions(-)

That's nice :)

The series would be easier to review if Li Zhe's patches were integrated
rather than stacked in. I hoped that the changes for template
initialization would fit into the patches that rework other parts.

The way it's done now several patches in the beginning of the series
change code that the later patches remove or turn some of new functions
into static.

Another thing is that the numbers Li Zhe measured were for a different
implementation, so they would be stale for the state after these
changes.

I have some nits and naming comments in a few patches, other than that
the series LGTM.

-- 
Sincerely yours,
Mike.


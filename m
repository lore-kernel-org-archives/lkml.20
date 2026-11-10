Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319463;
	b=2MbSVD6bS70N/LpLvfDL2qe4rhzH61Ve+kWNtgVFi6oJ2bnYDpn950jxC3UiXuQ4serb
	 BiLt6zNnG5ujC3oIGJTHtxIYt+dZBns74NbPpS0XiUqWqhP1zBmsx/SdM2m1JnM3JHweb
	 geHtPwdLytwG5lI+99u7cTCQQpvixD4rYauZBerk6eiSPXi09lpSKyZ1C3YjrTN2rwPku
	 1Qid+hIr7cA2ZNXsJc7QilYn/1JBi0NGzMiaG3POsO8Y0IJC5FL1Zq1L1RUu00DrLsnje
	 OggfuQc4tmHmuafKC3czVqNApMAtiew+sXBER2I/hykrqJj3sBkp/3+sR7WBkncNjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319463;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+5IAnWVHADA41IJuShMaFvKjUoEC1wrcq61K/G7feow=;
	b=Q9AO7SqblC1JpC7uaEDSDNSL0jyNPKe1PCEW32m+2R9DVsJ2/5SUv6f2KD+XqvgvVKaY
	 KQJUUh8PVFmdmhapG+04r1924AsNMsDZ3pLZMWZQ6i/Pso9SrIi6/Edl/4UO5thZcW8k7
	 0F8pZJ6oO3GdT4FiLyTPalQ8mO+MS5UKlWAy7oiOaSNqGloLeeHN+a+zb82w4SYJSad3U
	 s3CODir5FmR/2we57QqclxCJ9elF5j+WOhovfB00lt2ENG6jgL+sjGre/Eydpq5kSzSvq
	 DDccpbyvakrHcIC6b2SbP1De8kamTxeMc7PbpHT3fugBKGJ4oLHZuA1hBwJHA6AjMVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h50fosA7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3742260A2621
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3742260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h50fosA7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4313B143D;
	Tue, 10 Nov 2026 06:04:19 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F10A73F632;
	Tue, 10 Nov 2026 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794319462; bh=+mA8U82Dmu9ftVLfB1lXmShJwdTcBL6ay0MsAqkBT58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h50fosA7PBG4YTWLL2nI17X7drceGdTlskyBQyQCe42PX4wOMVaPPoFfRqzRp7csX
	 0t5A4Y1a6CLZdWWA3+/e6tdAPTaOpEMvk9eM5mVMNqFXkYUeCzRFr57W9z6+S8wLmA
	 aYveBropJTBpgFFmbc+I6I855XbnB6DsFtCmhE88=
Date: Tue, 10 Nov 2026 14:04:17 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v3 6/6] mm: gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
Message-ID: <avMkYdbCetaQc_Jl@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-6-2aaef02df0e1@arm.com>
 <529b409d-748e-4f47-bb21-77b3237da39f@kernel.org>
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
In-Reply-To: <529b409d-748e-4f47-bb21-77b3237da39f@kernel.org>

On Tue, Nov 10, 2026 at 02:09:32PM +0100, David Hildenbrand (Arm) wrote:
> On 11/9/26 13:32, Yeoreum Yun wrote:
> > GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
> > costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
> > atomic, a full barrier and a node stat update for FOLL_PIN), a
> > gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
> > pays sixteen of each and a PTE-mapped 2 MB THP pays 512.
> > 
> > The users are the hot ones: iov_iter_extract_user_pages() pins every
> > O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
> > buffers through it, and so does RDMA memory registration.
> > With mTHP those buffers are PTE-mapped large folios.
> > 
> > After the head page has been grabbed and verified as before, extend the
> > run to the following PTEs that map the next pages of the same folio
> > with the same protection bits, take the remaining references for the
> > run with try_grab_folio(), and fill pages[] from the run.
> > The PTEs of the run are read while the reference on the folio is held,
> > so the folio can neither be collapsed, freed nor split underneath the scan.
> > A read-only run of an anonymous folio stops at the first page
> > that gup_must_unshare() rejects, so the per-page exclusivity guarantee for
> > FOLL_PIN is kept.
> > 
> > folio_pte_batch_flags() does the scan.  It reads the entries with
> > ptep_get(), which is not safe without the page table lock on
> > CONFIG_GUP_GET_PXX_LOW_HIGH (x86 PAE, mips32, sh) or with arm64 contpte,
> > and GUP-fast reads every PTE with ptep_get_lockless() for that reason.
> > Add FPB_LOCKLESS to make the helper do the same; it is inlined per call
> > site, so the other callers do not change.
> > 
> > The order-0 path keeps its instruction sequence.  The folio flags are
> > tested before folio_set_referenced() on purpose: a load of the flags
> > right after that locked instruction cost about 25% on order-0 pages in
> > the gup_test benchmark below, and reading them first brings that path
> > back to the baseline.
> > 
> > gup_test ioctl over a 256 MB anonymous region, FOLL_WRITE, 65536 pages
> > per call, median of 15 runs, two baseline boots / one patched boot, on
> > an x86-64 VM:
> > 
> >                        get_user_pages_fast()   pin_user_pages_fast()
> >                        before       after      before       after
> >   4 kB pages           849/789 us   783 us     1174/1138 us 1094 us
> >   64 kB mTHP           812/811 us   126 us     1215/1113 us  188 us
> >   1 MB mTHP            799/774 us    59 us     1185/1077 us   64 us
> >   2 MB THP, PTE-mapped 803/786 us    57 us     1159/1120 us   58 us
> >   2 MB THP, PMD-mapped  42/40 us     40 us       46/41 us     42 us
> > 
> > fio O_DIRECT randread of a null_blk device (CPU bound) with the I/O
> > buffer in 64 kB mTHP, median of 15 five-second runs:
> > 
> >   bs=1M psync                 126.2/125.6 GB/s  ->  220.6 GB/s
> >   bs=1M io_uring, iodepth 16   71.2/71.6 GB/s   ->  112.1 GB/s
> >   bs=64k io_uring, iodepth 16  50.2/50.7 GB/s   ->   60.1 GB/s
> > 
> > IORING_REGISTER_BUFFERS of 1 GB, median of 15:
> > 
> >   64 kB mTHP           6179/5998 us  ->  1599 us
> >   1 MB mTHP            5790/5801 us  ->   893 us
> >   4 kB pages           7173/6741 us  ->  6763 us
> > 
> > Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
> 
> There should likely be a co-developed-by? (also in the other one?)

Okay. I'll change.

> 
> LGTM, thanks.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun

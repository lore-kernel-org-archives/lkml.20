Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C34772A6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634555; cv=none; b=j7kpRaH20lPkvSJgvT4G0ib1MIv+pgA8nUSZF+Z3jyu5AbBtOom26WnDOVMLrjweNOTjmKIJcqaYxs6JGLkyeo3B29MwgYT8nkR8Rg7JV6YrTlgAmUYPzVHLOczctPHB3DTMtTAjRqZquY1Q7vTSe1tsSV4Wo2zCpY2/PvH76YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634555; c=relaxed/simple;
	bh=Tfmi36mRpCj6kQHIFuBvJmXvf3jhLdPG8xBzb//huEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhtpxXZayNltHEjnsvmA3YGOlpSwHhbozcSLqYs0RwFxJx7g0tc8HfjzU35V0VS26Kbi53Evs7ez8IwyQzhBrzBRlfnDd6gp7mTqCf/bYX23AFEl96FboTm+Thq/+TX/34G42WkDV3Sf5J6cFv3CUcdGIyqrfcazegFI1Dzrors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMg04wK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMg04wK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08591F000FF;
	Thu, 17 Sep 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789634544;
	bh=2vjVdEHW9kBktetbFrLAuLp8tP/fJwMsUdPrzrz9iTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VMg04wK9XgbrovCjHxg0w+TXe7CtSAOkA+NTfVubphgm5v0+sy00OPkVwFpB6FpHG
	 N+eJJqQDflKg+id2871cDmMUo9huI7Zg6+kxK8vxWFC8GzoKK3JbAhnZrTYnpXb2K3
	 b11PM7oyD5fFZlByIhu1pXyaqN5Nl0Fe5NJ/cHQO+7pJxQfHMCf8vYoWctNmP2Qnsv
	 5SbPHvLkG+jIB7007QsPOIuoc42a241sDKeqqJm+mNuWKAEcZT5bWSo9SN3Q2K1ixS
	 vSk6mOu1Kbcjg8Ewp198GbuSamVjpd03jQDi1vz5vq1H3S+flQcdtGksQ6VTi8aSTO
	 K6YOolI/QzrPA==
Message-ID: <f8f6d553-d818-4cc6-a1a1-a9c9149a17e9@kernel.org>
Date: Thu, 17 Sep 2026 10:42:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
To: Yuan-Hao Hsu <aa9736195201@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 Aristeu Rozanski <aris@ruivo.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260917083747.786-1-aa9736195201@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260917083747.786-1-aa9736195201@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:37, Yuan-Hao Hsu wrote:
> GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
> costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
> atomic, a full barrier and a node stat update for FOLL_PIN), a
> gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
> pays sixteen of each and a PTE-mapped 2 MB THP pays 512.  The PMD and
> PUD leaf paths already take the whole range with one
> try_grab_folio_fast() call, and the slow path is getting the same
> treatment for PTEs in Rik's follow_page_mask() series.
> 
> The users are the hot ones: iov_iter_extract_user_pages() pins every
> O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
> buffers through it, and so does RDMA memory registration.  With mTHP
> those buffers are PTE-mapped large folios.
> 
> After the head page has been grabbed and verified as before, extend the
> run to the following PTEs that map the next pages of the same folio
> with the same protection bits, take the remaining references for the
> run with try_grab_folio(), and fill pages[] from the run.  The PTEs of
> the run are read while the reference on the folio is held, so the folio
> can neither be freed nor split underneath the scan; a THP collapse can
> still detach the page table, so the pmd is checked again after the run
> is grabbed and the run is dropped if it changed, leaving the next
> iteration to hit the existing pmd check and bail out.  A read-only run
> of an anonymous folio stops at the first page that gup_must_unshare()
> rejects, so the per-page exclusivity guarantee for FOLL_PIN is kept.
> 
> folio_pte_batch_flags() does the scan.  It reads the entries with
> ptep_get(), which is not safe without the page table lock on
> CONFIG_GUP_GET_PXX_LOW_HIGH (x86 PAE, mips32, sh) or with arm64 contpte,
> and GUP-fast reads every PTE with ptep_get_lockless() for that reason.
> Add FPB_LOCKLESS to make the helper do the same; it is inlined per call
> site, so the other callers do not change.
> 
> The order-0 path keeps its instruction sequence.  The folio flags are
> tested before folio_set_referenced() on purpose: a load of the flags
> right after that locked instruction cost about 25% on order-0 pages in
> the gup_test benchmark below, and reading them first brings that path
> back to the baseline.
> 
> gup_test ioctl over a 256 MB anonymous region, FOLL_WRITE, 65536 pages
> per call, median of 15 runs, two baseline boots / one patched boot, on
> an x86-64 VM:
> 
>                        get_user_pages_fast()   pin_user_pages_fast()
>                        before       after      before       after
>   4 kB pages           849/789 us   783 us     1174/1138 us 1094 us
>   64 kB mTHP           812/811 us   126 us     1215/1113 us  188 us
>   1 MB mTHP            799/774 us    59 us     1185/1077 us   64 us
>   2 MB THP, PTE-mapped 803/786 us    57 us     1159/1120 us   58 us
>   2 MB THP, PMD-mapped  42/40 us     40 us       46/41 us     42 us
> 
> fio O_DIRECT randread of a null_blk device (CPU bound) with the I/O
> buffer in 64 kB mTHP, median of 15 five-second runs:
> 
>   bs=1M psync                 126.2/125.6 GB/s  ->  220.6 GB/s
>   bs=1M io_uring, iodepth 16   71.2/71.6 GB/s   ->  112.1 GB/s
>   bs=64k io_uring, iodepth 16  50.2/50.7 GB/s   ->   60.1 GB/s
> 
> IORING_REGISTER_BUFFERS of 1 GB, median of 15:
> 
>   64 kB mTHP           6179/5998 us  ->  1599 us
>   1 MB mTHP            5790/5801 us  ->   893 us
>   4 kB pages           7173/6741 us  ->  6763 us
> 

I think Rik was already working on this and sent some patches. Anyhow, there is
quite some GUP review backlog I have t go through, so this will have to wait.

-- 
Cheers,

David

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E63672B8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139228; cv=none; b=ksVD/0KZ9I/O7ZMhuM3BfpN83Y+x9PbgDBwiX770kDhZrI6TjTbbtvvMwdT6sNUllzgTzqOZRgH65ZyuGC+TKCZzXE/9TzHRyczqA+9CVY0rktxSKR0LNW2gMhuo4pKJRUMNZoTBfpdAZAiIhFUKSiFOPR+rnDYMhUEsoQjzNbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139228; c=relaxed/simple;
	bh=1e19q6TXl/oO3dvrf3LZMZWXyMGGVLr+unrpz8GmPAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDNBEasa72RSd+20Q7mtc0ZQlxnBw+q8EVisZmi4VNVde0nxFlwAmgRFnh9f3r3+1ZudbvYwiCfId4iqCYlPb0QL03zZrHi7ISbpqsa5wiUg3Kcl6uPFrfVNm5Z3XgTRWovSTyGwvQ7uGYktnWTf8orGUipkjK7C53lkfWmTyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDV8SFI7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDV8SFI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C9C1F00893;
	Fri, 11 Sep 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139226;
	bh=993TfVUqxah6p+9ru7SHYLSMQ1D9Z3b73DF2QhhB5to=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gDV8SFI7oNEqbwx1x4YqwzWsWDpq6fbK7G8af48m3PrQ+UhnjSF3yGpxcl7v45+iu
	 ExM1/F1IJd8qIBvc/k0n1LeRgzV2/Wb8stVD7qctVPf4JitLk/97CLOmuLtpM9j8qu
	 bK+30wRy8pHk9G/PCm9eedhXFrhHziF7LAxJapXLLxisW/w7dd31TMvcn4VwLadJ4y
	 iAzoBrIP0gM8E0iy8boxjPFiOR/AYPC2irWP5ZgGjmHQEXxmIA1mQc5s+RN9lLut9f
	 7MuFfuRPxulKQQox1Rln0vAZl171csJVOvAv/ouYk0Jxz0wbRYYzqmQB5ArIgLprW5
	 ATEz2eLsefDfw==
Message-ID: <8170ef17-0de3-45dc-8c8c-de15f088214d@kernel.org>
Date: Fri, 11 Sep 2026 17:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] mm/collapse: separate a collapse from its
 callers
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260910120238.2529819-1-kirill@shutemov.name>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 14:02, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> [ This is the first of the cleanups I said I would front-load ]
> 
> There is no line between the collapse engine and the callers that ask for
> a collapse.  khugepaged.c holds both, and they reach into each other.
> 
>  - Sixteen tests through the collapse path read cc->is_khugepaged to work
>    out what they are allowed to do, when every one of those decisions was
>    made by the caller before it asked.
> 
>  - collapse_single_pmd() does both halves of a collapse behind one call and
>    drops mmap_lock somewhere in the middle.  Which of its paths dropped it
>    is not something a caller can see, so it hands back a bool and the
>    caller keeps track.
> 
>  - MADV_COLLAPSE's implementation -- the walk over the user's range, the
>    per-PMD loop, the errno translation -- sits in khugepaged.c, which is
>    the daemon's file.
> 
> So: draw the line.  State what a caller allows in a policy, split the call
> in two with the lock as the boundary, and move the syscall to madvise.c.
> What the engine offers is then four calls, with the lock state written
> down against each, and a policy the caller fills for itself:
> 
>     collapse_control_init(cc)         once, before the first table
>     collapse_policy_*(&cc->policy)    what this caller allows
>     collapse_scan_pmd(vma, addr, ...) per table, under mmap_lock
>     collapse_run_pmd(mm, addr, cc)    when a scan found work, no mmap_lock
>     collapse_control_release(cc)      once, when done
> 
> The engine stays in khugepaged.c for now; what changes is that it has an
> interface, and that neither half has to ask about the other.  madvise.c
> gains the operation it should have had all along.
> 
> Changes since v1
> ================
> 
>   https://lore.kernel.org/all/cover.1788533997.git.kas@kernel.org/
> 
>  - Rebased onto mm-new with Vernon Yang's tracepoint fixes in it.  Patch 8
>    no longer merges the two calls to each scan tracepoint, since the base
>    already has one; its changelog now says what the status field reports.
> 
>  - Patch 3: nr_occupied_ptes is nr_eligible_ptes, and the mthp_collapse()
>    comment counts eligible PTEs too (Zi, Baolin).
> 
>  - Patch 4: no comments on the two constants (Baolin).
> 
>  - Patch 5: one line per policy field (Baolin).
> 
>  - Patch 8: the file side is split like the anonymous one (Zi).
>    collapse_scan_file() runs under mmap_lock in the scan and only judges;
>    collapse_file() runs in the run.  See Behaviour below.
> 
>  - Reviewed-by from Zi Yan and Baolin Wang on 1-4, 6 and 7.
> 

I'll hopefully get too look at this soon (after digging through older stuff in
my queue).

Skimming over some patches,  a note that we should not be undoing recent
cleanups without a very good reason.

E.g.,:

commit a155d945b73c5b0668e898df5495afe45bb261cd
Author: Nico Pache <nico.pache@linux.dev>
Date:   Wed Mar 25 05:40:22 2026 -0600

    mm/khugepaged: unify khugepaged and madv_collapse with collapse_single_pmd()

    The khugepaged daemon and madvise_collapse have two different
    implementations that do almost the same thing.  Create collapse_single_pmd
    to increase code reuse and create an entry point to these two users.

    Refactor madvise_collapse and collapse_scan_mm_slot to use the new
    collapse_single_pmd function.  To help reduce confusion around the
    mmap_locked variable, we rename mmap_locked to lock_dropped in the
    collapse_scan_mm_slot() function, and remove the redundant mmap_locked in
    madvise_collapse(); this further unifies the code readiblity.  the
    SCAN_PTE_MAPPED_HUGEPAGE enum is no longer reachable in the
    madvise_collapse() function, so we drop it from the list of "continuing"
    enums.

    This introduces a minor behavioral change that is most likely an
    undiscovered bug.  The current implementation of khugepaged tests
    collapse_test_exit_or_disable() before calling collapse_pte_mapped_thp,
    but we weren't doing it in the madvise_collapse case.  By unifying these
    two callers madvise_collapse now also performs this check.  We also modify
    the return value to be SCAN_ANY_PROCESS which properly indicates that this
    process is no longer valid to operate on.

-- 
Cheers,

David

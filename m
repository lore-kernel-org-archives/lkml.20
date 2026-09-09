Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F935C6A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976118; cv=none; b=qqSLJ/nayx2R7jObEV7DmuaW608H5vF55MZAcikdy8hh2DTo/jLMUwCke5KY9noKU1xxRQKqHyEhtUZlwgalf0wCLBvioDrAoAxgiDRFYogZqZ/5vvMB10qdQKHEFpWFpjBeYo1kTNuutlmXq/NaHLe/BoooVuthUz3nJl2x/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976118; c=relaxed/simple;
	bh=RglOq0TJLVFrlqKF5+4QxlYdXTYxmDBh0r5+m54Q5Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7Ut9/WyCodMWIT4NNDOlvMq8hEPApVwOZQc4FYnWoJDB8AJ8v/Gy+5l4XEC0y/nMGkG+22w6MFbl4V59ag8Yp0bWYdH3eCKAA1Yn9dpNwFZwbskQ1tmZ9bA9YvinM1EDvTMXO3Tl6gy66ZLcRCEnxHxJYl9ghoM00LIQXrXGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMIaA5Xz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMIaA5Xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584191F000FF;
	Wed,  9 Sep 2026 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788976117;
	bh=KriljTd17afm3LOBC3hK5znRaxV7ItVcfge8hBIqiMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FMIaA5Xz91YxejmDwDLpzttZWpqcmSE7rKb3dvPWM58iWfAO4HgZsUGfhudFQjfMS
	 ok48V8Bd+aaZcKBd8EoAVOuIJYqoEjVjHEDSIX86MgCy0STlvB2sNW3nwFbzlM0QbA
	 MpErlGCmldXlqbieiGMjZU7R9vDZl+mANgMp52GV7mT/eUDIRnmlGXf+NJyQgmiLD1
	 8gmQtS4yc3izE7kRWrFAyR+1NVpiuXN9tiHFgIXmmmIEemBVQk7UmdU/ehMwlZCEUD
	 nhPCF+LR/YeYIMcDNgwRR/8Tp+S61wtbNvOvOf2g3NTdYCQVScRYrOU166spTHDnS2
	 bBhl3xNdk82nw==
Date: Wed, 9 Sep 2026 18:48:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH] mm: implement and use vma_is_faulted(), silence KCSAN
Message-ID: <aqGaNT1M-csCCQk0@gremlin>
References: <20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org>
 <3a261c3e-4c26-41b3-b55f-5800ae1081f3@kernel.org>
 <aqGJx-uQjN8-DEBe@gremlin>
 <c1f21bf2-71e3-4537-a000-fd0e95257759@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f21bf2-71e3-4537-a000-fd0e95257759@kernel.org>

On Wed, Sep 09, 2026 at 07:32:57PM +0200, David Hildenbrand (Arm) wrote:
> On 9/9/26 18:36, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 09, 2026 at 06:24:52PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/9/26 18:14, Lorenzo Stoakes (ARM) wrote:
> >>> Provide a function to abstract the common task of checking whether
> >>> a VMA is faulted in or not.
> >>>
> >>> A VMA or mmap lock must be held when calling this function. For an attached
> >>> VMA the transitions between unfaulted/faulted state are:
> >>>
> >>>        Transition        |              VMA/mmap Lock state
> >>>  ------------------------|-----------------------------------------------
> >>>    unfaulted to faulted  | write lock OR read lock + mm->page_table_lock
> >>>    faulted to unfaulted  | write lock
> >>>
> >>> So vma_is_faulted() never provides a false positive (the lock precludes
> >>> it), but if only a read lock is held, a negative result must be re-checked
> >>> with mm->page_table_lock held.
> >>>
> >>> Detached VMAs cannot be concurrently manipulated as they are removed from
> >>> the maple tree so require no guarantees.
> >>>
> >>> Use data_race() to silence KCSAN about non-existent data races between
> >>> concurrent vma->anon_vma read/write on optimistic fault tests.
> >>>
> >>> Also while here, const-ify vma_is_attached(), vma_assert_stabilised() and
> >>> dependants.
> >>>
> >>> Finally, update the core VMA merge/split, rmap, mremap, KSM and fault
> >>> preparation callers which test vma->anon_vma directly to use
> >>> vma_is_faulted() instead.
> >>>
> >>> Note that the lockless read in reusable_anon_vma() is doing more than
> >>> checking whether the VMA is faulted - it is returning the anon_vma to be
> >>> used on fault, so this check is not altered.
> >>>
> >>> There is one odd one out - file_backed_vma_is_retractable() - which holds
> >>> neither a VMA nor mmap lock and is stabilised by the file rmap lock only.
> >>>
> >>> Therefore just add a comment to explain why the direct vma->anon_vma check
> >>> is required.
> >>>
> >>> Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> >>> Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
> >>> Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
> >>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> ---
> >>
> >>
> >> Is vma_is_faulted() really the right thing to use when wanting to say that we
> >> (likely) faulted in an anon page?
> >>
> >> I think that's highly confusing, considering just MAP_SHARED mappings where that
> >> will never be true.
> >
> > Hmm, yeah.
> >
> > I mean there's nowhere you'd do this check where you weren't checking something
> > that couldn't at least in theory be anon-faulted. But it's confusing vs. shared
> > you're right.
> >
> > vma_is_anon_faulted()?
>
> Hm, not sure.
>
> 	vma_had_anon_fault()
>
> Might sound better.

vma_anon_faulted()

>
> Alternatively:
>
> 	vma_has_anon_vma()
>
> is the obvious thing we're checking.

No, I want to abstract the mechanism (so later it can be replaced :)

>
> 	vma_might_have_anon_folios()
>
> would be the clearest (no anon_vma -> no anon folios). But semantically that's
> likely not what you want to check in the code?

That kind of implies you want to interact with those and generally you're asking
whether an anon fault has occurred.

Also a bit of a mouthful.

>
>
> The whole faulted/unfaulted terminology is a bit confusing ...

To me not really?

Actually how about:

vma_anon_rmap_tracked()?

Then it speaks to what anon_vma is actually for, the fact the VMA has an
anon_vma assigned like that means it is tracked by the anon_vma, and it
abstracts the actual mechanism?

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

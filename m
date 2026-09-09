Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB458123F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971806; cv=none; b=MOI/9Oo6pUf4HSJRhvDWfOQTQo8e58QeDLde6PPUL6p7ftAuTo/U6f6OR5SwG5Ib/TrnbLaJdfbpgVEJkWbUyXL7xgHZ+RhtF/6mHgyGLgw9LRDRCv+3fcCCPK7utTV30BtqS+rwsxEsJc/EwlYgYyJ/eF1tV3SjiRrbgcTc/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971806; c=relaxed/simple;
	bh=gzUNQn07qEf6tHgnalV7kcZShXzuwXfjXh+7ezu0Iws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elhJ5TP4mA/anXUSKy0m1lwml0SQm6AE6xL2+xCQf9SRqSbQS8jNRLONbBkYLZ5AAHkWS2HWyFcNfRSHp2cXPg5e77WGkHH8d+H0nStsUOJJryD2YXZnGJpkYRgGDxqfnAx0b0nHDGQvlujor96MMhS+2nHIOess8vdB0jfTDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBKesYFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBKesYFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3F31F000FF;
	Wed,  9 Sep 2026 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788971805;
	bh=VP//58Wn8k2qcOTJ9qxFhG0WtvAq1P5Aq/CZfspgCd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBKesYFnWiOL6rtCA1WvhldX565pHoDow6cst5O+yiMJV8riZzIgENxvieESVooHj
	 9uMYjfMx9fCGNW+BWfKgL3GFDiiKJbSTmDPwkfvB/kwVg+OII+EN7eKID2LqBJptbD
	 Ry5keUUsOTMZ4CUaw9ebSqpsZRULbOse7VVROGG2UZP2AGoKSvWDgoh6QKUb1MzGQI
	 Pg00ASMSf3TbwzPBbeGqpzKbY9lOurMrc9ZfoPdnkRwn71wsI2xaFsWejZQy3UDtdJ
	 5DUoLtwEVttzeKCuqBW5+mc0gP6U3G6Ok8ram3hl+LQhgAiMoex5zhuV8FZJVDFaop
	 NpDwRU0SpznOw==
Date: Wed, 9 Sep 2026 17:36:34 +0100
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
Message-ID: <aqGJx-uQjN8-DEBe@gremlin>
References: <20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org>
 <3a261c3e-4c26-41b3-b55f-5800ae1081f3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a261c3e-4c26-41b3-b55f-5800ae1081f3@kernel.org>

On Wed, Sep 09, 2026 at 06:24:52PM +0200, David Hildenbrand (Arm) wrote:
> On 9/9/26 18:14, Lorenzo Stoakes (ARM) wrote:
> > Provide a function to abstract the common task of checking whether
> > a VMA is faulted in or not.
> >
> > A VMA or mmap lock must be held when calling this function. For an attached
> > VMA the transitions between unfaulted/faulted state are:
> >
> >        Transition        |              VMA/mmap Lock state
> >  ------------------------|-----------------------------------------------
> >    unfaulted to faulted  | write lock OR read lock + mm->page_table_lock
> >    faulted to unfaulted  | write lock
> >
> > So vma_is_faulted() never provides a false positive (the lock precludes
> > it), but if only a read lock is held, a negative result must be re-checked
> > with mm->page_table_lock held.
> >
> > Detached VMAs cannot be concurrently manipulated as they are removed from
> > the maple tree so require no guarantees.
> >
> > Use data_race() to silence KCSAN about non-existent data races between
> > concurrent vma->anon_vma read/write on optimistic fault tests.
> >
> > Also while here, const-ify vma_is_attached(), vma_assert_stabilised() and
> > dependants.
> >
> > Finally, update the core VMA merge/split, rmap, mremap, KSM and fault
> > preparation callers which test vma->anon_vma directly to use
> > vma_is_faulted() instead.
> >
> > Note that the lockless read in reusable_anon_vma() is doing more than
> > checking whether the VMA is faulted - it is returning the anon_vma to be
> > used on fault, so this check is not altered.
> >
> > There is one odd one out - file_backed_vma_is_retractable() - which holds
> > neither a VMA nor mmap lock and is stabilised by the file rmap lock only.
> >
> > Therefore just add a comment to explain why the direct vma->anon_vma check
> > is required.
> >
> > Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> > Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
> > Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
>
>
> Is vma_is_faulted() really the right thing to use when wanting to say that we
> (likely) faulted in an anon page?
>
> I think that's highly confusing, considering just MAP_SHARED mappings where that
> will never be true.

Hmm, yeah.

I mean there's nowhere you'd do this check where you weren't checking something
that couldn't at least in theory be anon-faulted. But it's confusing vs. shared
you're right.

vma_is_anon_faulted()?

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

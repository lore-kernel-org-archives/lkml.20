Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E849482C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398582; cv=none; b=HR3+4+4ljnFplCkNkE7Owvg3s90o2QQa9R9qK/s2P9QVAhAlzclj8HJt6VQjg7W1J3cvDR6++vssyABLRU9kzgJE6WBw2+F8Y3v83jwDmOxpcHtZHAL/gy4yJGTQycpegaclz6IN7CRxyoBVK407ma+Ti14SizV2oeV2Ox+Xxwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398582; c=relaxed/simple;
	bh=h5eD1Irq6YzOfG2HRbwOK54UqLD3Mz80nj7cCYaJSyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYz8Zn1dpP9F7ZrVJXdZ7dHVkgYkeiWWx4c56uunXWhgmhaTuqLgWCjunEbJIZC4JZb9EFD7u1TeuDtFvqI7AhItUgEemoLMg6KsFGXcELrwIC0trgmLSqRrKrcy6hpU6YZ/1TnNIcIj/ULDEHhKNWZNF513Qjm7MjgCE8RJx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcXlyuz1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcXlyuz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977821F00893;
	Mon, 14 Sep 2026 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398578;
	bh=lqGx/g9iA8NHnrHaYC5eHMoZQvuNCtTEzYjoeYtI/wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WcXlyuz11wuqXhEOE712pccfVCodWo1JsYcoBXEU8WVlNcItPfa55fFiROejw8tRc
	 lnRyISQ+aGw/9Eu1iMx9m5Sz0OBNXExpG1C5jO4S7y9zwOZdc7/HTjiUQFuzxlCaOi
	 TjrBvGod2FRnfM5IPUQnh7vGEVUM0PZz9IfEAst+SEn3L+E3E+OseVETV7mzFUEz0s
	 PK0MKuMS7TkGj69J3pvFrRn044ZLSeww4P3RP2RtP7+iTHFGyKTkyb9OzU4Vsj4kDu
	 fUKabYFlTOaXP3yQ6jW7qe20XnUpy8gLuWo6PiffhTiPTbtvvQaW7wVUKEHL/PY5Bo
	 I5rCdMRmTRguQ==
Date: Mon, 14 Sep 2026 16:09:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH v2] mm: implement and use vma_anon_tracked(), silence
 KCSAN
Message-ID: <aqgMFnz6Y5rs_jig@gremlin>
References: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
 <aqgC9iVHtB1fMWS2@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqgC9iVHtB1fMWS2@pedro-suse.tail5790ac.ts.net>

On Mon, Sep 14, 2026 at 03:24:47PM +0100, Pedro Falcato wrote:
> On Thu, Sep 10, 2026 at 02:18:35PM +0100, Lorenzo Stoakes (ARM) wrote:
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
> > So vma_anon_tracked() never provides a false positive (the lock precludes
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
> > vma_anon_tracked() instead.
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
> > v2:
> > - Renamed vma_is_faulted() to vma_anon_tracked() as per David.
> >
> > v1:
> > https://lore.kernel.org/r/20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org
> > ---
> >  include/linux/mmap_lock.h         | 12 ++++++------
> >  mm/huge_memory.c                  |  4 ++--
> >  mm/internal.h                     |  2 +-
> >  mm/khugepaged.c                   |  3 +++
> >  mm/ksm.c                          | 10 +++++-----
> >  mm/madvise.c                      |  4 ++--
> >  mm/memory.c                       |  2 +-
> >  mm/mprotect.c                     |  2 +-
> >  mm/mremap.c                       |  4 ++--
> >  mm/rmap.c                         | 22 +++++++++++-----------
> >  mm/swapfile.c                     |  2 +-
> >  mm/userfaultfd.c                  |  2 +-
> >  mm/vma.c                          | 29 +++++++++++++++--------------
> >  mm/vma.h                          | 22 +++++++++++++++++++++-
> >  tools/testing/vma/include/dup.h   |  2 +-
> >  tools/testing/vma/include/stubs.h |  4 ++++
> >  16 files changed, 77 insertions(+), 49 deletions(-)
> >
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 00eae65b74bd..03e1eb136111 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -273,7 +273,7 @@ static inline void vma_end_read(struct vm_area_struct *vma)
> >  	vma_refcount_put(vma);
> >  }
> >
> > -static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
> > +static inline unsigned int __vma_raw_mm_seqnum(const struct vm_area_struct *vma)
> >  {
> >  	const struct mm_struct *mm = vma->vm_mm;
> >
> > @@ -288,7 +288,7 @@ static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
> >   *
> >   * Returns true if write-locked, otherwise false.
> >   */
> > -static inline bool __is_vma_write_locked(struct vm_area_struct *vma)
> > +static inline bool __is_vma_write_locked(const struct vm_area_struct *vma)
> >  {
> >  	/*
> >  	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> > @@ -344,7 +344,7 @@ int vma_start_write_killable(struct vm_area_struct *vma)
> >   * vma_assert_write_locked() - assert that @vma holds a VMA write lock.
> >   * @vma: The VMA to assert.
> >   */
> > -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > +static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
> >  {
> >  	if (!IS_ENABLED(CONFIG_MMU)) {
> >  		mmap_assert_write_locked(vma->vm_mm);
> > @@ -359,7 +359,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >   * lock and is not detached.
> >   * @vma: The VMA to assert.
> >   */
> > -static inline void vma_assert_locked(struct vm_area_struct *vma)
> > +static inline void vma_assert_locked(const struct vm_area_struct *vma)
> >  {
> >  	unsigned int refcnt;
> >
> > @@ -410,7 +410,7 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
> >   * With lockdep disabled we may sometimes race with other threads acquiring the
> >   * mmap read lock simultaneous with our VMA read lock.
> >   */
> > -static inline void vma_assert_stabilised(struct vm_area_struct *vma)
> > +static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
> >  {
> >  	/*
> >  	 * If another thread owns an mmap lock, it may go away at any time, and
> > @@ -445,7 +445,7 @@ static inline void vma_assert_stabilised(struct vm_area_struct *vma)
> >  	vma_assert_locked(vma);
> >  }
> >
> > -static inline bool vma_is_attached(struct vm_area_struct *vma)
> > +static inline bool vma_is_attached(const struct vm_area_struct *vma)
> >  {
> >  	return refcount_read(&vma->vm_refcnt);
> >  }
>
> nit: I would suggest you do all of this constification in a separate patch,
> otherwise it can become tricky for backports. Things can naturally start depending
> on const correctness, and you either need to manually adjust those future patches,
> or try to backport this one.

Ok will break out.

>
> The rest looks vaguely good to me. I admit I'm not a gigantic fan of the name,
> but I suspect it fits better with your future anon rmap ideas :)

Naming's hard and it's hard to make everybody happy, unfortunately :(

vma_has_anon_rmap() better?

>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

>
>
> --
> Pedro

--
Cheers, Lorenzo

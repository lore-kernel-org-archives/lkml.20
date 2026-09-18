Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145B4FB9A6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739381; cv=none; b=e9tL2KmwSHaiBY6ibCaaUYVDxQaqhYd7AzEjyBfjKOQZtnDcgbCEiGtS7aqjawZ7aEqfjD6yLFsz0QydlWy8+FZPOlKaUzsUYLmNDaDcM6aQyH2dvn/WefhPSuLW/m1W8dz66HhPnHECTyc6tBaCaklMOtKDaksLVDRhY9UJrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739381; c=relaxed/simple;
	bh=o5NqwCq8ienkIaH+dEEgC2eppUFioMpgezaDnwxClNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moITjQ+ZQAqtOx5w2JBEMpAJ7UBgL39cDDHxfn4aCwrzrLKRTp8KfcJq3aHf3dRXqL6RlCWSW0eFjovEt/RIXQ3wwSdibsCdTvbIs9kkBjmh4RFR6IZaYoLdgInLEvdySo4s+93mnPp6cA2dz6PEiDpzzq1hNTAsn9wJ34ClET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIFor4Si; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIFor4Si"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933411F000FF;
	Fri, 18 Sep 2026 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739380;
	bh=I56ArlD9g2uoL/lG5d7qnG9zNUL8ABoq7wmxn3lzZPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIFor4SiKeif9cZimu50LNcITC108q7tkLBa/wxMMSkNByvmlzjr1fysTSXy55uxc
	 lyghMl7Tqhy+pBmJx+LoEXHr1+1x1bbNqDDHDmz3eU/NYM5vViksoXXq0XUTgvPIZN
	 26oAYlwsjcbEb9IKzM7NosZVNlbFHp7VP8pcMKKdVAYB+AMTkl3dxj88Hc1ZtoSoAp
	 Y84WIzDzE8aUl1OYiAb9Rk6NFDh/jazWKgQMkQv3/za6ihVAfjD1iGZHX0NoLwjbO+
	 KbjlL2ZdqatfQCRpkAfRY/7Io/XCr7uCPwacvF+gmkbm8mg9LL9HduLzNUAGUZiPsb
	 s7RT0tx4X97SQ==
Date: Fri, 18 Sep 2026 14:49:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm: update comments to refer to anon rmap rather
 than anon_vma
Message-ID: <aq1BACGj3wkdL530@gremlin>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
 <DLHVTX80IKX4.GKQ7P0C8S5IK@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLHVTX80IKX4.GKQ7P0C8S5IK@nvidia.com>

On Thu, Sep 17, 2026 at 04:43:15PM -0400, Zi Yan wrote:
> On Thu Sep 17, 2026 at 3:47 PM EDT, Lorenzo Stoakes (ARM) wrote:
> > Now that vma_has_anon_rmap() abstracts whether a VMA has an anonymous
> > reverse mapping, remove references to anon_vma and instead reference the
> > anon rmap.
> >
> > The anon_vma is an implementation detail and should be treated as such.
> >
> > Do not update mm/rmap.c which implements the anon_vma mechanism as it is
> > reasonable to directly reference it there.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/huge_memory.c     | 17 +++++----
> >  mm/hugetlb.c         |  2 +-
> >  mm/khugepaged.c      | 12 +++----
> >  mm/ksm.c             |  6 ++--
> >  mm/madvise.c         |  6 ++--
> >  mm/memory.c          | 12 +++----
> >  mm/migrate.c         | 12 +++----
> >  mm/mmap.c            |  6 ++--
> >  mm/mprotect.c        |  4 +--
> >  mm/mremap.c          |  6 ++--
> >  mm/pgtable-generic.c |  2 +-
> >  mm/userfaultfd.c     | 10 +++---
> >  mm/vma.c             | 98 ++++++++++++++++++++++++++--------------------------
> >  13 files changed, 96 insertions(+), 97 deletions(-)
> >
> > @@ -4176,11 +4176,10 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> >  	if (is_anon) {
> >  		/*
> >  		 * The caller does not necessarily hold an mmap_lock that would
> > -		 * prevent the anon_vma disappearing so we first we take a
> > -		 * reference to it and then lock the anon_vma for write. This
> > -		 * is similar to folio_lock_anon_vma_read except the write lock
> > -		 * is taken to serialise against parallel split or collapse
> > -		 * operations.
> > +		 * prevent the anon rmap disappearing so we first we take a
>
> s/we first we/we first/

We first, we happy few, first we take a lock that we have on... ok
no. No. You're right :P

Andrew could you fix up?

>
> <snip>
>
> > @@ -1619,7 +1619,7 @@ static int try_to_merge_with_ksm_page(struct ksm_rmap_item *rmap_item,
> >
> >  	/*
> >  	 * We can consider the VMA only while still holding the mmap lock,
> > -	 * so lock, so reference the anon_vma and calculate the linear
> > +	 * so lock, so reference the anon rmap and calculate the linear
>
> s/so lock,//

>
> based on the code after this comment. Please double check it. And it is
> a pre-existing typo in the comment. Hmm, it sounds very Sashiko. ;)

So Zi was sashiko all along... interesting ;)

Andrew - could you fix this up too?

>
> >  	 * page index early, before stable_tree_append(). If anything goes
> >  	 * wrong that prevents the rmap_item from being added to the
> >  	 * stable_tree, break_cow() will clean it up.
>
>
> Otherwise, LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
>
> --
> Best Regards,
> Yan, Zi
>

--
Cheers, Lorenzo

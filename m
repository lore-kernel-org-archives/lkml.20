Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47647AF5F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399317; cv=none; b=SyvVTklO+USc02Xs/ufkpIW11W4sc/GqV1CCgbWbsfnne/8aoNeIHFpnfJHwZrTTQIHvh3yLzLxfN4CTmBP1Lo5D+kT31HzDTh+zQCRv6Rhunhnl6NW9+fshE2eIfrbU76UbWSF8lEOYXutomnYagzOgCN9YHjOxISoVOmDkzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399317; c=relaxed/simple;
	bh=hxUAw5zcbzsYTGG2pefa+mSRsYXnSpZroJj408y7rr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kx5/WhrqkSKsjD4cD1rHZQltaIroVGelu7UsXZfxjuOkTueEUDrjrqrp783UM47xXK2VU+Gvu/OkU+oBTYahejCfboxp5raFDbMcA61kWk3Cz7qSZkTb4XLnoYsFauZa41Ia6UIeB+ZpP43b2VMLIRvPOmnj30vy0/YECcdsN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXLwSMkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXLwSMkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504B41F000FF;
	Mon, 14 Sep 2026 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399315;
	bh=BbM/6KmbIwqEmYkcORDjoWrwHW3qkC0k639i+OR+Sr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HXLwSMkGUQJpjeB6H3k1gKeb4bQKtfUE3zfkdtxMdHq9prST9T7R7/v1Ujd8ovI0V
	 eCf2nffXt+2XbJScr13PvgAj/Z2DYBBz/fqVuCsPZIjFQqJo2M2oybxC/oiOMfJ9jH
	 /fmFZXd1qlne4zCEQrqK7ruv7BDqvXt5lHRzqkuPYGd3d2W365qPBWLBsrYKSNX4j1
	 DX7yT6W15irI9igbkNqy7AvA6APc3nXFkPzv/KpDjvcWf/lU9mfb3ci4l+X0ixBEW0
	 rrgrUZBXxrzHNG3AYJ5gH2nB/SsjBvhWBNGArrvQkDuFiq8QmaBgF69VSf0+6h4ip6
	 Pacmx3r5tv4xA==
Date: Mon, 14 Sep 2026 16:21:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH v2] mm: implement and use vma_anon_tracked(), silence
 KCSAN
Message-ID: <aqgQw6moAuJYCVw8@gremlin>
References: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
 <aqKzUTPbh1qcKs4a@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqKzUTPbh1qcKs4a@thinkstation>

On Thu, Sep 10, 2026 at 02:50:25PM +0100, Kiryl Shutsemau wrote:
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
>
> If you end up respinning anyway, this would be a natural separate
> prep patch.

Yup will do, Pedro also asked for this!

>
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
>
> I don't particularly like vma_anon_tracked(), but naming is hard...

Yeah it was a compromise because David and I disagreed on naming (again ;)

I think vma_has_anon_rmap() is a better compromise?

>
> From quick grep, it seems you missed two cases of direct readers:
>
>   hugepage_vma_revalidate():
>
>       if (expect_anon && (!(*vmap)->anon_vma || !vma_is_anonymous(*vmap)))
>
>   vma_needs_copy():
>
>       if (src_vma->anon_vma)
>
> Worth fixing? If it is intentional, add a comment why. I don't see it.

Ack will check.

>
> Anyways:
>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks!

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

--
Cheers, Lorenzo

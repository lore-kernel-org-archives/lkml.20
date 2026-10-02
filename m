Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B593AFCF3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935674; cv=none; b=abUqf3HIHOx62HstKkdFg4BrePnFuvOlOspJstuYOKWTJu6cP+BoppTjFUSUzQm55zI22mz3ZZK0KwU+WneOL+ntNwT77DbLVJKCkga8jj3zXp8SyXlaTad6xE1GOW06qQ0q3ODuCGNvNGqelj/sNwdpNkmozOaSnKfkH4xZfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935674; c=relaxed/simple;
	bh=B/znwCOEPvC/DxjdThSHuQlJw78EaUcApCE3oWRRdO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSDm/WHot+n25MEzq0SW55iogTKB5WAda9QqAMLjpr0TSeSTPxw5zRMniqSqyEzoMtkHn1GVpm6wZlYHfj8ptgNERGpBQH2O/qCHKEthKZRCu2Pv+QlSWoFcrt7JMsMtcUeG8h7URBa4fDKbKprvQPUHSGR5owlyb65Q+VmHKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3xND3jj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3xND3jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F521F000FF;
	Fri,  2 Oct 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935672;
	bh=TKehAfJY7QFR23A7GBU33pCZhJic0kmyKqO1gT4cscY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M3xND3jjGhCCzouEUAIW1Fd+p/k+1Y5VyzO7TBK5/AmP/Bcz/wCeF+2RVFQ+RH0+c
	 GbbBMHlQ1PPAObwulMxI241HlG/Q47n78GAM4JrJH5OREIos5QVwsSeoc7bE4O/TU+
	 yPaowDKkl1Zf/h9FUtXzKhawayFQF6JCVTjJxlOCTGbsOXOShwDuBL/mf/Ey4XWmwd
	 RtupXkxz1p0EY47kK2fpulAYCCHJzTumw6Ju9fR7FKzEpZFDEYNae9jddkQhRfsUL6
	 2+H0VWSTZ59iERwpOLgH5sph+7pwl1Zjo2jNx36Fn0KR8CSRC+4tAQFldcErBSHWyb
	 2XMcA5dahi2wA==
Date: Fri, 2 Oct 2026 11:07:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, peterx@redhat.com, dave.hansen@linux.intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: don't ioremap COWed anon pages in
 generic_access_phys()
Message-ID: <ar-BkhuJINKdNpYC@gremlin>
References: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
 <20261001152524.171115-1-ngocthang2710.1999@gmail.com>
 <32fe40e2-854a-47ec-9d95-93e23f9a7af4@kernel.org>
 <ar9omYD3HcTDBpGA@gremlin>
 <c6253814-0cf6-48f3-8f81-3285466dca45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6253814-0cf6-48f3-8f81-3285466dca45@kernel.org>

On Fri, Oct 02, 2026 at 12:02:15PM +0200, David Hildenbrand (Arm) wrote:
> On 10/2/26 10:38, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Oct 01, 2026 at 10:22:29PM +0200, David Hildenbrand (Arm) wrote:

> > So I'd say somebody from the core team should take over this if we want to
> > come up with a patch.
>
> Yes, I'll take care of it.

Thanks!

> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > This looks reasonable but I hate that we have 'special' CoW overrides like
> > this :)
>
> After sending this yesterday, I concluded that we can do this cleaner: just have
>
> bool normal_page;
>
> (naming suggestions?)
>
> that express that this is something refcounted with a struct page, like
> documented for vm_normal_page().
>
> Then we can just refuse all of these.

Yeah it's all a bit tricky.

Maybe is_vm_normal_page ?

Or do we want to default to referring to a folio... but then pfnmap not a
folio... ugh.

is_normal?

With a comment explaining in sense of vm_normal_page/folio()?

> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index c49ef99b4413..b90e547797a9 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h

> >>  				  unsigned long addr, pmd_t pmd);
> >>  struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
> >>  				pmd_t pmd);
> >> +struct folio *vm_normal_folio_pud(struct vm_area_struct *vma,
> >> +		unsigned long addr, pud_t pud);
> >
> > Hmm, if not defined before why would this need a new PUD handler? Do we
> > even have PUD-leaf PFN mappings?
>
> Yes we do. In any case, good for consistency.

In that case then we should definitely have it!

> > Since a folio being 'anon' is vague, because we stupidly made 'anon' vague
> > in general.
>
> For folios it's an established term :)

Yeah, fair enough, that is true.

And makes the anon folio -> tracked as such in my change consistent end-to-end.

I guess we have swapbacked for the shmem stuff as a clear delineation too.

>
> >
> > Anyway I was going to ask does this suffice for CoW but having an anon rmap
> > implies CoW so it does.
>
>
> The downside of using "bool normal_page;" is that we should check
> vm_normal_page() for any mapping, not just cow mappings. I suspect
> performance-wise we don't really care.

Yep, I'm sure it's fine!

--
Cheers, Lorenzo

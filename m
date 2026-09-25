Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4436E489
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325501; cv=none; b=P/KdRAeMTnLzHJUaMmDufbu6DG82YJGy6ouC6uU86I1J7UoLs2ObsfckiPXqdO42Bro1y72ysgUoDK06VrxpowSB+ySduTARzA1rTAap1Naj34yDc7/ugfZ+3cklD66Gq/cPmfhLIHeKDVoJFJOGVoYv+FMJ/M72JqATYXmvkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325501; c=relaxed/simple;
	bh=+V7hH7ticb2Z3xWST+H8Y7Bb9j5Pk6LZLczh/CwF34s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv0uK/X+DgOWID1gHYoVkr5rzRHgtnSn9M+wZYStAjD6ymIjVtdoH4J7k3tRUP25Ca+r8xni5ErjYfXD3TZGCwFScO/V5whP811rHNTcw5f9M8qps6sKPk9QfoaT4LBMYU+TxpA7mMPX67eibiJlbMv/sACcrC86EZjoKexAHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqff5ChK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqff5ChK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBD51F000FF;
	Fri, 25 Sep 2026 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790325499;
	bh=IB51gXtTDrNhNiCDiirEq139RmYgQaEQ6mwU888iF1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iqff5ChKCoK4N32x2WHuIvqlC7HkYdHN7CY++3i2g9vcheHBdS/+YAXTqEu5VhbjM
	 r1Wr00IXeihhHYFf0hZRcpPS8X73+jibzL97WBQMYYsLH+yJV2kDyy+iW962/Ep0/k
	 eDgJEl73dQQg+tW8x1DL5NS/ISDo795JI4MwOcErPy0kDRDt+bWKEOxGQEJPkINBp5
	 9w5uKoF90x3Xaxd93MCluxJKk96knryEtEU4vZK2Qww5CezMGxIMgH2mLvKv20rEez
	 trZ7rR50AwXsrlHVnyC8VGcNo0+pzzONAObRsFlPOMu/mxwLDt4K+HfYdSdwWXgIzO
	 VR1QNMJOpwGJQ==
Date: Fri, 25 Sep 2026 09:38:13 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>, syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Message-ID: <arYnXJHW-Rh4eNzt@gremlin>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
 <9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
 <20260924195826.70a87d6fb78d754bc73892cd@linux-foundation.org>
 <95e91b4a-ca16-49a3-9a1a-5b38afa6f08d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95e91b4a-ca16-49a3-9a1a-5b38afa6f08d@kernel.org>

On Fri, Sep 25, 2026 at 09:29:40AM +0200, David Hildenbrand (Arm) wrote:
> On 9/25/26 04:58, Andrew Morton wrote:
> > On Thu, 24 Sep 2026 17:37:29 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> >
> >> On 9/24/26 16:48, Lorenzo Stoakes (ARM) wrote:
> >>> Rather surprisingly, opening /dev/zero read-only then mmap()'ing it
> >>> MAP_SHARED gets you true anonymous memory (albeit in a VMA with
> >>> non-NULL vma->vm_file).
> >>>
> >>
> >> ...
> >>
> >>> --- a/drivers/char/mem.c
> >>> +++ b/drivers/char/mem.c
> >>> @@ -503,7 +503,7 @@ static int mmap_zero_prepare(struct vm_area_desc *desc)
> >>>  #ifndef CONFIG_MMU
> >>>  	return -ENOSYS;
> >>>  #endif
> >>> -	if (vma_desc_test(desc, VMA_SHARED_BIT))
> >>> +	if (vma_desc_test(desc, VMA_MAYSHARE_BIT))
> >>>  		return shmem_zero_setup_desc(desc);
> >>>
> >>
> >> So instead of shared zeropages we'd now get zero-filled shmem pages.
> >
> > "zeropage".  Singular.  Used to be!
>
> Hey, leave that German native speaker alone! :P
>
> Yes, you'd get the shared zeropage multiple times. (some architectures like
> s390x do have multiple ones .... likely you could even get the huge zero folio here)
>
> ... unless the MM has the shared zeropage disabled, and fallback to anonymous
> memory:
>
> -> mm_forbids_zeropage()
>
> ... we end up using THPs and the huge zero folio is disallowed, so we fallback
> to a anonymous THPs
>
> -> transparent_hugepage_use_zero_page()
>
> >
> > The accounting differences, possible changes in reclaim, memcg
> > charging, maybe swap behavior.  Switching to a different fault handler.
> > It's hard to foresee all the effects of this.
> >
> >> The alternative would be to just convert it to a proper read-only COW mapping in
> >> mmap code:
> >> * Not clearing VM_MAYWRITE, but keeping VM_WRITE clear
> >> * Clearing VMA_SHARED and VMA_MAYSHARE
> >>
> >> Sure, someone could then mprotect(PROT_WRITE that thing) or
> >> FOLL_FORCE|FOLL_WRITE to get anonymous memory. Just raising that as an alternative.
> >
> > I dunno, the whole thing feels imprudent.  To alter such longstanding
> > core(ish) behavior.  And why?  Because a shiny new assertion said "hey,
> > that isn't quite right".  Wouldn't it be better to squish the warning
> > somehow and to set about this change in a very careful way?
>
> We really shouldn't allow anonymous pages in non-cow mappings.

Yes agreed entirely.

It then becomes a question about how to get readonly memory.

>
> We can
>
> a) Disallow allocating an anon_vma and fail gracefully. So only a shared
>    zeropage could ever get mapped there. Might break the s390x
>    mm_forbids_zeropage(). But given that's only used in hypervisors like QEMU,
>    unlikely.

Something like:

	/* about to maybe prep anon_vma */

	if (!vma_cow_mapping(vma) && vma_test(vma, VMA_MAYSHARE_BIT)) {
		/* don't prep anon give zero page */
	}

?

I think though it's surely the only case (I hope!) where you can possibly be
both anon (as in missing vm_ops) and !CoW? I hope? :)

So it feels better to fix it at the source.

OTOH maybe it's worth special-casing so we don't allocate on read.

But that brings me to c)...


>
> b) Do what Lorenzo proposes. This will allocate real memory. Someone decided to
>    use MAP_SHARED, for unknown reasons, so I'd assume it's unlikely that
>    something breaks, but you have a point.

I would say this patch is the right fix for the moment to fix the assert, and we
can chase up with other approaches afterwards.

>
> c) Convert them to proper COW mappings. After all, having the file read-only is
>    absolutely irrelevant, because we will never ever use that file. It's
>    anonymous memory.
>

...My idea for the next step for /dev/zero is to remove the mmap handler and have
some specific code in the mmap logic for it solely.

Like we already have:

	if (map->vm_file)
		error = __mmap_new_file_vma(map, vma);
	else if (!is_anon)
		error = shmem_zero_setup(vma);

And there's already specific file_is_dev_zero() code, so there you could simply
decide:

            CoW /dev/zero -> R/W anon
shared readonly /dev/zero -> R/O CoW (i.e. with VMA_MAYWRITE_BIT set)

As a special case because somebody really probably does want that.

But for the purposes of a 7.3 fix I think let's go with b) [i.e. this patch] and
follow up if that makes sense to you?

> --
> Cheers,
>
> David

--
Cheers, Lorenzo

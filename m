Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA74FECC5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566115; cv=none; b=G6ordZoBYfc+3S6amD5Cy0djc8tUHJGonpNtG8Q81+sYiSLdpXWkUPZzZ90VSXSAaDtmKL+bLw2fysN7F+KvW6ymx5+H7zD00QUkRb2S9+sAbNtPuXqgHWujKt/HiAI76aFYv3MQHYJNnbbh9zVTByTnfgrFrvR0spFhlPMLAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566115; c=relaxed/simple;
	bh=jmiZDsEMtin8Q6Vja8ZPVi2Q6ClguZFx2NwKl2siMy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWnN70z4NC0mtTivyIp9FEpd1iNOns1sftxHvTkMEYsOhWBuzl/hQA1OqDQRJnKwrOamXb674J0jcFF3fF93yuoF3mrlX9rUrxkzriYW588bn/bJzufK9w69o+r9gNXRI2gJf4/qmAn+CX5KdEC5N3gUBJN4LoqwDN0NZ4zjD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlLD6yuF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlLD6yuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4001F000FF;
	Wed, 16 Sep 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566100;
	bh=a6kjCxP9yBKoDCDGJpxropE2U03Q16iuU4HbhIBJf+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlLD6yuFDosHEmd6JzFv/rPZm04Jd/L0IencJCYXxb65CisXMkNidUNhwaDOZsD5p
	 cM7KEQ8mbz1fxDWDQPDd02HLkioIVNmVIPX+9pme9NckO9RuD92oU52O33Y/0rLS5L
	 yp23VOHR8uJX3zOEqKf+Sst8wyQEgidw7WkMwhPW6M+bNXp8YU+/ztMXgqkpCIvvuv
	 +33wxUGO31GXBEGLK/j8nNTVK5CNaJsu61ffdl4mKBVty8Vv+K//kufvTaJ+E9+yfh
	 eFanxfBigamyNqn/1TCCvEiMOw4MINMe4k4fnxLc31nAxIeYFCX/Cb5czHSrTIsVzZ
	 hlJfasBj+UcZQ==
Date: Wed, 16 Sep 2026 14:41:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH V2 01/14] mm: Add read-write accessors for vm_page_prot
Message-ID: <aqqchzV9bgKYPPyn@gremlin>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-2-anshuman.khandual@arm.com>
 <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a7987f-15fb-4793-81b6-cc436525224e@kernel.org>

On Wed, Sep 16, 2026 at 03:23:13PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Currently vma->vm_page_prot is safely read from and written to, without any
> > locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
> > tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
> > be handled with READ_ONCE() and WRITE_ONCE().
> >
> > Add read and write accessors for vm_page_prot like pgprot_[read|write]()
> > which any platform can override when required, although still defaulting as
> > READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: linux-mm@kvack.org
> > Cc: linux-kernel@vger.kernel.org
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  include/linux/pgtable.h | 14 ++++++++++++++
> >  mm/huge_memory.c        |  4 ++--
> >  mm/memory.c             |  2 +-
> >  mm/migrate.c            |  2 +-
> >  mm/mmap.c               |  2 +-
> >  5 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index e3c8ab96941c..0df57a5c19ef 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -524,6 +524,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  }
> >  #endif
> >
> > +#ifndef pgprot_read
> > +static inline pgprot_t pgprot_read(pgprot_t *prot)
>
> Try passing "const pgprot_t *prot" instead.
>
> [...]
>
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 15b45832bcfa..579152cce502 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -387,7 +387,7 @@ static bool remove_migration_pte(struct folio *folio,
> >
> >  		folio_get(folio);
> >  		new = folio_page(folio, idx);
> > -		pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
> > +		pte = mk_pte(new, pgprot_read(&vma->vm_page_prot));
> I do wonder whether a
>
> ogprot_t vma_get_page_prot(const struct vm_area_struct *vma)
>
> where we hide the pgprot access would be a good complement for vma_set_page_prot().

Yes please! :)

>
> Just a thought.
>
>
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 4bf26b0f1e6e..729bc244b317 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -89,7 +89,7 @@ void vma_set_page_prot(struct vm_area_struct *vma)
> >  		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
> >  	}
> >  	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
> > -	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
> > +	pgprot_write(&vma->vm_page_prot, vm_page_prot);
> >  }
> >
> >  /*
>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

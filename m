Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5D22D0602
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617765; cv=none; b=PfhUAxQYZaQKFfiXPBC/a4w4Q0MOTgv2yjh4CkDtgdbK+sYHlLHiR+lGVnc13XesDI+QrDDeT52/V0S0pu2Ln9pwaoSvZ5nqtFhj3/mqxXAIZkvEWm8GgzrL5CDrPIOgpFeloIYXPDNHKUu3alieJr1lKMJV/HO2clr8yrTICeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617765; c=relaxed/simple;
	bh=pvRE23ivxd9BXCfxEuHJgM+rJ6GOZz+syS/Pgj8gpR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPg7uFrrsy7sF/Ibmwu/O2WpYdYUI43wKW0yCOiYWjCj6xwCsl9aoIhnHgO1u68mAXs2aaqx/93VTCfGMBPhdjdGxnQKZ2ojREmp+p9p30NzHl+b4TkIHrRI1Z9wZb2YB7jOXu/pEydzvzDrw69gOCHrEqr3+XZTAqDpa386LXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mBJ1WsLF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mBJ1WsLF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7ABF1476;
	Wed, 16 Sep 2026 21:02:36 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7FC83F7B4;
	Wed, 16 Sep 2026 21:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789617760; bh=pvRE23ivxd9BXCfxEuHJgM+rJ6GOZz+syS/Pgj8gpR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBJ1WsLFSDfD9zO4hIbZuImbAbY2/Ig1hMvMo3Wbk7+hngEkxgy28wy/ZxxPf5vI0
	 d+zOHmasm2jaRAfC67ZhqbOytBK3+dNgBBgQFSdXdQpx9G9kndvMqNwamAqXhQpcWs
	 b0yuJgaUEjzp51JEEt6yp3d8Spvn1PHwYnv9ZeVM=
Date: Thu, 17 Sep 2026 09:32:36 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH V2 01/14] mm: Add read-write accessors for vm_page_prot
Message-ID: <lhvfz6htwibeee2xgnp2sdfh474lmklooep3e6c6467kegtxu4@jejzhb4jlekh>
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

OK - will change.

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

Could you please elaborate ?

AFAICS both these helpers vma_get_page_prot()/vma_set_page_prot() are already present.
Are you suggesting to change vma_get_page_prot() instead ?

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

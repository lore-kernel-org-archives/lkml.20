Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D233E4506
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870065; cv=none; b=Rg7gqDhCUCV0Y8QXeDMeJ6DT0LKVNUB27Xi94L3GFzs1Wd2DDLg/olPzlj713y4WH+ZLqAsK8xypBkd7Su5SD8coAWZOztPfL1ge9rUPxHgz2BpPB1vS4sRtMGEe44J3RYBUymxESVamtSJDDgqQjZDaXtOdgLv7Pf/lI1NQ2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870065; c=relaxed/simple;
	bh=SOnZRMz6j7Qr1wT9s8CnQrmJR0FcjSPiDVMfG7eXp3Q=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsMSBkL7i8ctE3M27iSJQJL3JjbmwwE2JFCxQb5+7Wv2WT0QOfBkMqGcFyryaM8eDsqe2rJ32UPLvb81kIgiJN/hsduLMfHQXtiuDmfxDzBhlfTMjpGS9jZg/2Q2OK+BvMWtOQSGXtSCra/zl4HkjebUBTZEZJ4v4CMobdOPl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff5QnKFP; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff5QnKFP"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1d2d7dc9so134683566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870062; x=1791474862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/FSvKdD0Rw1UPKEmYKGjjwHZIO5Pn+E96++Oh5YfMs=;
        b=ff5QnKFPBMhV2vtbn0Zi6XGvF7IxUMfU00eEAwb6U45+OIYOy4gryv0h6w6GJnojyR
         RRSJWD1K/sK53+asl04YuaSL3Jcg/8OOqypcY6s3PI6ejq/VtQn51jfRrf4KqH8qBelc
         i6gUEiDfyKMAPMsBnMXho0LAUCmdIhI7B5FQciLUa2fSYqbRN0ydXLWRdJlpRfNvRhKe
         UbEsGo1/xZ5RepTvYR4u7CcG4dhoW+LKw0ahDHIFHCSPuypdji7miKtkHCexXi6EWgEo
         DZbrr7NwZTHUXMZBREjuKVkbRRdu+1B1ke3uAEGUJ31wPMObXMiEvcejH8tsdnMEZHNU
         5u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870062; x=1791474862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/FSvKdD0Rw1UPKEmYKGjjwHZIO5Pn+E96++Oh5YfMs=;
        b=C48KtKBp8PgJgFigeiNP7MeSqtnVcBsFtIL6w+9w2AMb2dPe2OEqRSih7V+KPybu2y
         GMN5NMvwDKZx+k8YLiX92mT+P0S+Fa1AbBcdUqbOlgjGHl/BZQLwx1vgl8UxbkVfzW/I
         27GSDYcqFxZ0ksW22oX5tOmEzsYR9pbL7FVGxFidagwfVm4t4cJwozrv71956TM+0o3R
         QYkpA1hAs+AzjiU96tuRUFBSBUeXhsTlO9I5+eE+ZkDWZfNEE3KphEeh61evQ+2GUL34
         kX9Ua/8pP3OpNSN+pYussD2GHbOf7tWIfvpyHKNTPWq4e0QeNv7RyD7LrtYgXS6b9QeD
         Dkhg==
X-Forwarded-Encrypted: i=1; AKwUvBw+UUBL/hXQJxUSh2WZxj4/nWY078eqxr0Y7DedKcjXbBgTXU/07w6VMaBgzH+YVdhyMlgrV0s9lhYve1g=@vger.kernel.org
X-Gm-Message-State: AFuF++kKZlw6cqm+pNfak6pKmYplWRLF6dEU31niPF200ys6F9NK8MVq
	ZWIIyZK+JhxLy6oxRXyMpoc3QHQRQZHsrSk9e6qf1OdH7UdUjCFLIfdG
X-Gm-Gg: AYBFou0DD9VrITQQf7Yd+07/M/FlPVFpwzHTz161NXZxTw4920UDCz8D0Mtrj8Jy4Nm
	APN/F/+UlIllavyqNnfKjTMcs1mhgDhz8Fdjuid74vcOGlAlnf0VX9oObvgb0eccDeRKKpuBfde
	nyBGjpgDSKIms4Dbl+gAK/Jr+FI27ogPIGQAjuahYhB0NEPe7Mbfn3FaWF8M8vCYKV/6WQ6osDR
	lLn3xxiab5ANQj2HbDO1rWqkmSAlaAF/QLRl7zXSw/GGhDlcV9xOXnTnSEZ+A0zSQQEm0EFgZGD
	e3MFc003R2TJ+Na+Dd85QoNX7YBuWXQD2flOQvEnXDhAAtuLEV2lNqmF3IhhOUwvhzcaEy0DgYv
	dOGUp1WTfwSmXSgzYAwsoI7APUuBZhWbBxlyzzmliKsY8yOLTO29Js7M+hiikIz5p7Gjcir8Vey
	y/KWDAMzP2MQY512UeLN49GeiWFSZCPukfNeE=
X-Received: by 2002:a17:907:d87:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c2e4aa6562dmr2262966b.6.1790870061590;
        Thu, 01 Oct 2026 08:54:21 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31cf0d6esm183317366b.37.2026.10.01.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:18 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:54:15 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	rppt@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <ar6CJ9pWSEB8fAcC@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-7-jiangwen6@xiaomi.com>
 <ar0fJcjNmGGV6uFu@milan>
 <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>

On Thu, Oct 01, 2026 at 03:58:21PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 22:39, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> > > Extract the common PTE mapping logic from vmap_pte_range() into a
> > > shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> > > PTE mappings in a single function, preparing for the next patch which
> > > will extend vmap_pages_pte_range() to also use this helper.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
> > >  1 file changed, 27 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index fb757d95bde25..d475e52110e4a 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -92,6 +92,29 @@ struct vfree_deferred {
> > >  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
> > >
> > >  /*** Page table manipulation functions ***/
> > > +
> > > +/*
> > > + * Try contiguous mappings at the PTE level for arches which support them, and if
> > > + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> > > + *
> > > + * Return: mapping size.
> > > + */
> > > +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> > > +             unsigned long addr, unsigned long end, u64 pfn,
> > > +             pgprot_t prot, unsigned int max_page_shift)
> > > +{
> > > +     unsigned long size;
> > > +
> > > +     size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > > +     if (size != PAGE_SIZE) {
> > > +             pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> > > +             return size;
> > > +     }
> > > +
> > > +     set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> > > +     return PAGE_SIZE;
> > > +}
> > > +
> > >  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >                       phys_addr_t phys_addr, pgprot_t prot,
> > >                       unsigned int max_page_shift, pgtbl_mod_mask *mask)
> > > @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >       u64 pfn;
> > >       struct page *page;
> > >       unsigned long size;
> > > +     unsigned int steps;
> > >
> > >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> > >               return -EINVAL;
> > > @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> > >                       BUG();
> > >               }
> > >
> > > -             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > > -             if (size != PAGE_SIZE) {
> > > -                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> > > -                     pfn += PFN_DOWN(size);
> > > -                     continue;
> > > -             }
> > > -             set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > > -             pfn++;
> > > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > > +             steps = PFN_DOWN(size);
> > > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
> > >
> > #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT) - how many pages covers the size.
> > Replace steps by nr_pages or nr_ptes?
> >
> 
> Agreed, I'll use nr_pages. Since vmap_pages_pte_range() in the next patch has
> the same "step = PFN_DOWN(size)" pattern, I'll rename it there too.
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

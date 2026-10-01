Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8E3AE6F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869973; cv=none; b=lG1i8WpMnzX6k3NEbK5AK9yvQDSTUmMNEOmlUwIKS/nThgg1W/PfbtFPegxd6R/A61aRH94mBV8rSpQbIMuWYSkaqheP+KxRVDiAN3623VCg1xedqU8tFCWmZ5/bbi66r76urLB8ncuPsjfXJu8KA0NJWFqL1eQInK8Z/pBFzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869973; c=relaxed/simple;
	bh=kaNu7z1TX0bwxEwyrraDkhe2s4wnQ6UHjmcotMdHGrU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCsd9IRFIYA+GYHtEOyr5pVreVQd9WeIigmPwzaq8KRDgPPnmKvMta0Jzxv/BMYBFl5HpkAKOC3fJ40q4qRqiaZmhmxP+WMZx1EYDbZC+lbxYq7NrYGd88VKVSYVLcQZnHvyKs3UBJw07zSHVPpU3Jr9LSMKsiXpmm1dUg+Plyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvkKpc5Y; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvkKpc5Y"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so1035687866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869970; x=1791474770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSlkzBUmp3M8NJ8QezoWTcsem1pj+Ihncq28ei+hc8U=;
        b=bvkKpc5Yxej9pxsjBZ7lvhaGi6Cul2XDvnZAcaE63k4OS+i3SSzk6ubwmbs/yfuQjF
         RbBHj7GLYVIWSohFvHbBh3hNs2aF0RCWACHFD+l32GLpdY7vLo2E+kmxzgyxSBNbkMqJ
         iHIH8pu7UGgepGADNOJvRVbXvrzFhdcvvkb95Odt0D3tRlkj+6YIHqTwVR8ei5ARPynW
         DMbmP4M673Z7NBqHTw4QQInILv10SOK0b2zIBIVCmDadOAF9rPPRSluSfsg8TgwL/UP/
         6kJz+FbArozzdQJBg/3BBfDD9FIWL20T0E8t7Fl4Bw0XKoNIkU7JVpKOHH7N/c+PB3fO
         bAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869970; x=1791474770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSlkzBUmp3M8NJ8QezoWTcsem1pj+Ihncq28ei+hc8U=;
        b=YeTanenUIgzNhk1J344EfyQ4h15vBe98dWMyTZb5SgYgkdkMex8CszvpJPe5U63Bll
         qwPnRMxo3txt3NutrBgNcqH2vSLSr+Y1KMN/gbcaca/UCKQ4qe/xDkTbauD4TdpvoWOB
         Sej6yJG8BeczyN4Ga/ItBo6RKpZQ+wNgHzoJJEcYqPa4eMw7pc2mUdTJyPCMAKVmLe5U
         hqdnIPctT97sE+gE6H/5ZJfr/VykOgCO0lo51lht+UTwfTCRPffg8Lav0yrV6/4Hb1UO
         eCC4ODujJ53z9H469w2d+prjr6Y+ZgpZA+eQMOS430eei0j3oA4ud6wALpia+jKAXXy7
         ybzA==
X-Forwarded-Encrypted: i=1; AKwUvBws6tLjy2th0MXGCtKGECBJMrd1BQPc/H0+1ManblaQ/Edm254bCcE/LWCz1NilxCq72jIJcTOkj6sqXu4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPaMTPJy/y3Ia+m15PNgezEMPznVe9IIPA/3XyIZRlqYyQDUkA
	dBMmvnsFMOebVMiXPxEwert/AVzcljS69fyEp9mUJVTqESgoW8mwKkQt
X-Gm-Gg: AYBFou0vduCVV0yLIBO272Zdue+0lQ/kdLuf0n6dBWddx4V0C/R8x6FvfCpFefRombp
	uo2ZqmYbto7RpPOfO0udW6Stlvx+VpSA7r1XT5+ex+zWPi83/VQLUjO73sJEcZ1Bt2tWRAF3XSP
	VuUzCuFTc1TSEmctYYQcrScwNtrh1QGkkm+jP7nMrE2xq9VOVUSovzexr+9IkNto/GWrtXXLqln
	GNtDdo9eQM0r00v7aMY7tWRVC+ANN11gTz/N8wAPdIsE/s6ggrpcVCSTYrpF8Xk6zNv3dH2mU7f
	/UFeVI4JK7gy//ckce6j8hZLIKcz9SLWp6MXPodPOs8iAxcfTjtAqigXiq/OKq5wt/Z8qyKb190
	sF9vqutaHUw65gAnsIOH1svx5e/6OeDxcjkDxLAzx+UKR/ItOTkp/iyB9lLeWKkZHLbJ2fkJ5OY
	OGAH9xciSwWxXyiYHZwHjjqlh0Vk0eXFKCzbTOfurQgWi+lw==
X-Received: by 2002:a17:907:9406:b0:c2d:23af:5fcd with SMTP id a640c23a62f3a-c2e23e1fcd8mr487499166b.44.1790869969629;
        Thu, 01 Oct 2026 08:52:49 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc7393sm179858266b.65.2026.10.01.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:52:49 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:52:46 +0200
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
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
Message-ID: <ar6BzubFrn46vuTu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-8-jiangwen6@xiaomi.com>
 <ar0nuJ7ocTMgbiMu@milan>
 <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>

> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index d475e52110e4a..6e0dec73107a7 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
> > >
> > >  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> > >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > > -             pgtbl_mod_mask *mask)
> > > +             pgtbl_mod_mask *mask, unsigned int shift)
> > >  {
> > > +     unsigned long pfn, size;
> > > +     unsigned int steps;
> > >       int err = 0;
> > >       pte_t *pte;
> > >
> > > @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> > >                       break;
> > >               }
> > >
> > > -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> > > -             (*nr)++;
> > > -     } while (pte++, addr += PAGE_SIZE, addr != end);
> > > +             pfn = page_to_pfn(page);
> > > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> > > +             steps = PFN_DOWN(size);
> > > +     } while (pte += steps, *nr += steps, addr += size, addr != end);
> > >
> > nr_mapped_pages?
> >
> 
> As noted in the patch 6 reply, I'll rename steps to nr_pages here as well.
> 
Thank you!

> > > +
> > > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> > > +                             *mask |= PGTBL_PMD_MODIFIED;
> > > +                             *nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
> > >
> > *nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
> > as it used to be?
> >
> 
> Agreed, I'll use 1U.
> 
Thank you. With noted modifications:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

> > >
> > This is not about this patch but probably on that WARN_ON we should bail out
> > early.
> >
> 
> I'll send a separate cleanup patch changing it to:
> 
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
> 
Sounds good.

--
Uladzislau Rezki

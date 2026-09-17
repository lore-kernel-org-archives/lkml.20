Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDC459B690
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656072; cv=pass; b=MKWW6z4M4fbIlFHWI+5O0CM1uQmWDw1XFetRq0+maOZUvNvTtDJy9P0LDgqMreTW1dPT2bopVXCLEzmBngzg+giyHwpUIVdXuCoPl0vWD8ONP88mxWZvWb2FppML8FDM5/9iaNwzB9pSpB6rK8bKIIwl26Ch70WSRhgcF0L9QEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656072; c=relaxed/simple;
	bh=Z5+KW6IM/u2XWsqVnGSlw3xSk2hRd1vadCxlUNJqr0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABhwoZ669hNOsTEoJn0OfAYHJdv2LPEJzE6St9iXxxl7lp/XVmAIGjDMm3dwTIVDY1/uFmGDGSowhmtwNHNLYt3Ey7WDHih6E6Q3itmddIRpqRqBj3Yyt5rd6GFH9Ca6A1VY373zXe3KTzETOdlXCm8C03XXusrcNywQCAD+/9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msTUwZog; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msTUwZog"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4990155e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789656057; cv=none;
        d=google.com; s=arc-20260327;
        b=boa97rvzB5R4e0XjvmFpYCzxLhg+JgY//mIicyHg1w2MYfz0/e/uYBIIHUYw7hda7u
         KC0Aw1CORCCvzXezR1k/4BFLsNYA18oBRv+0dGW6TwXzdjXuPQTN5bcp8bCmkfL2776E
         66XWzuuOwBJFeKyJzTVz4MfNnjeCN/hVfSHachmJ0C4rsdLa8+CF4nt0C4UuSVhTR4oT
         6ha7AHJy0zlkh+zdobCPBD/rPGTQOK4kuqeK8mFkoRX4zI/4xOMbOcWiuWnPuqH/XMpN
         WugSk350ZwTmhe2iBpepIWthAcZJS1gWdXPoFOJujszBPO9pRa6alEVQYYChVUS4YAXl
         ydDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        fh=qX6vGdsAU7SKB8Xmyhg2q43u/onCyN5hdR21cF6wGz8=;
        b=r87s0uJXi0LjMpZ4cDp7lQYaB2uZWLdCpeX6DIaumVVR1y4T8npP4BNF8h/yWVrDIq
         IHzqB+swqnPCURH3DKBBwgbGzRyDr9nm8JIx/fUyPSSn6fxfTvJz7AS3UF29Turb9Sko
         9djkyU7xLkg79Br4zK1vaSkOwHdi5RUb4UG3eH7PhYliDRV7F+S6j2S8bEpnibhhGNT0
         2k6f6hg7e89Sdw7eZfAfAMrMvcsDlnebMTVkzDSMDyCl0rXH+73NJVYmJ7jolW1QEyLt
         sOYwT17qAwcdUj1NBJ+/LaxqU+D+Kt+a6nAiCpSpoTdxCQgKFZobqojWpl9BJuRPApAZ
         GfBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656057; x=1790260857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        b=msTUwZogYcy4yEeL1JF8xGqrPSUCr7vYwvPNsRTlJBfVC7JmGsK8hidhUyb1f0dJK4
         lrEtHlxGaS1yvqcrqbQuLxw9CyrK3HpsESwNnuBF5+4xR26hlimul7FHvHgEx8iVOlBG
         Qof6emPU7y2MrAvXIbfIk18uib7BCrLZaT2rfVE6SPJqTTfIfa8sbkU1xFaflye2XMGh
         jCctEOm1O+7QeTeDKsK4bH05QyxqlYGwkmbdeh73ECC8P1aOZ+rdn5ff021IMAteIJ0D
         XEIzTkkYKmn3JLWpmpeoR8EbRSHb0rzpVi13IV1RnZr5OIXok8SMJZEkN18z9n4nyQl5
         /Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656057; x=1790260857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKlGaZ7QcAexG2kTHUATEVY4bTePWKI9i02YcMMarMU=;
        b=GBf+IjNBxaD7J19lgan1f3U64ah/IyDqmCL9C3ADoN4iAH9bcmHm6R5TUJLGTItjZ8
         4o5qWK2xD1XxXoxpavYBRysQ4iuYYDCy/1l5kT44a8U8AgRFUzUQRKJfqbVlSgDI+6Dq
         Jxf6O3Q6JXbrMv1jzLxZAW0mmX5m7Tq16ymnkUWmbfLgnekL/j4fTn7sQ0IRR3x7K1gL
         G4V1ea/PVYidncl8lJO1dpQg6OVs+zHXB/wOwTmodOI13TdKbhz78w+mAGAuYTswy5t9
         d/aUAXp62K+sjz2cRP2Ck7Xro0mPskF3rvWoCxBXvEoIdtgVp9YhJPThFcT/dREpjVnx
         9Fpw==
X-Forwarded-Encrypted: i=1; AKwUvBw1jmrXCkx7AkqPzMKt5b+g3PlQXwOmMYlWLDBpELeVPHzyjVHbHDD6grMxpvf0DKVvy0YVXTAc5XW7kco=@vger.kernel.org
X-Gm-Message-State: AFuF++nykzYuKSV1EzSquEzygr8whrRABuAGWHonroLyQehwAPuhnRvP
	OIYX8hO2e0eV0Nb5yYbcuLGZfweYDHRQYNKUcY7cBHq4sYoZggTLAjXyGX32Ub+bG7xhdrkmR67
	rt7+7yRnR+hXiVSHMng2XT4d7lbIB9Kc=
X-Gm-Gg: AYBFou2xDbLoK5MtmPU+KbRchFqhcph91krpyHtLte3rYY5ukfnCMGBdodtJXSPpGlz
	Xkg2CvGmYUUQWtiGLRmti2WrUgnk41lQOIGXjETOt1xd1qVDNNNHrbRuj9w9FteUk3gTAJZFuO8
	+duy+tu1GqQUM6kHtC2f1x7hpzcLXePykfJ/TFp08g7JuHg+snb7bspNEFDWlhyvWUFmxOPaTqR
	PSQWO9X/ux5Kfa7ayx1rnl4qU0b4kUSq0rderd/plkvtUVN6PHaGh3Gac9c1ARXFqtPGUWBnYEp
	2EJDK5xOjWEIdV4ogOeWcTyImK4c5MdM3kptiKulXyGNsdsoTHRgK7qS
X-Received: by 2002:a05:600c:c490:b0:49c:e37e:4389 with SMTP id
 5b1f17b1804b1-49fbd1b7e82mr50298125e9.4.1789656056433; Thu, 17 Sep 2026
 07:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
In-Reply-To: <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 17 Sep 2026 22:40:46 +0800
X-Gm-Features: AcwNN1Xe57v3xkT9n8VgdwgVRkLfN2sWNkgkjHSUvI4F8KcWXjC4skCrmqkDzZ4
Message-ID: <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sept 2026 at 22:00, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. WARN_ON_ONCE() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > ---
> >   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> >   mm/vmalloc.c            | 19 ++++++-------------
> >   2 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index cdd68ed3ae1a9..349ced999f959 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, =
unsigned long addr)
> >   }
> >   #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >
> > +/*
> > + * PTE-level block mappings for vmap.
> > + *
> > + * pte_set_huge() only has to be implemented by architectures whose
> > + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SI=
ZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> > +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> > +                             phys_addr_t phys, pgprot_t prot,
> > +                             unsigned long size)
> > +{
> > +     WARN_ON_ONCE(1);
>
> BUILD_BUG_ON() would be better here.
>
> It should be possible because fallback arch_vmap_pte_range_map_size()
> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
>

Agreed. These fallbacks exist only to keep the build working on
architectures with PTE-level block mappings and should never actually
be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.

Thanks,
Wen
> > +}
> > +#endif
> > +
> > +/*
> > + * Likewise, pte_clear_huge() only has to be implemented by architectu=
res
> > + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> > + * PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> > +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> > +                                unsigned long size)
> > +{
> > +     WARN_ON_ONCE(1);
> > +     return __pte(0);
>
> Same I guess.
>
> > +}
> > +#endif
> > +
> >   #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   /*

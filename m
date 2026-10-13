Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448C470444
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909547; cv=none; b=JITrz4Uu6IgAA3aHhd1i0Dk9/EBYN2cIuV5/FfxZ96L5clTcOfU9oCoN7MoKRsmfgOBtUghBdnj5OmKyvovvR80kOVIkmYUyasy96aWMHdpISoi3247gq8L6Kg/9WiQUUN5AbF6ZX2n95TM9RhKKq9pNkHJ9dG5joeAbogSM7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909547; c=relaxed/simple;
	bh=rBl+rxMZcSs+fUGFyRApnw+upqiGtKUQDUrx/oYZE8U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnFpHOcLvw4Qv+wLCtg6+62FXIPcRaHDhdIJrEOY9Yd2wi3hJlhLcwOhMSa2i9Li/oWeVwM2bteMvaLwc/jEUCFCSPts+5JVZggDFpu7gmL/tfQ+GvPvcD3H+qdQSC6sP5ipiG63tyBT++LuaIokk7GYo3hccGiSmpF/V3BOwO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pneKAJgu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pneKAJgu"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so137875e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909544; x=1792514344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMGgj7z4LL/41SC/RzPSs++jA5iS5B4RotyfALMsZXw=;
        b=pneKAJguL9Iu77hQ8LRMJ9A4p2Efx5VPzMuRxsg07Z/zaSuWOaxmYPTPvigXQFGp3y
         4f/KjxY2LSDuSpxYtmDoIZdWTTCAdvDn3JWd5jJyxRy29cedT6D314sLvARrof1O4bRY
         k5b2I5CA4PlGXiin89mzZpbSJnxL4zpGFhr6LeTTEoy3iL+gHnvlD2/eTR3NGlQ2VYh2
         QUFGaSaxsTOHguEHDW5hNhsU80FFo5I2pwZtVPx8BMNBHZ2+bJMgzgrkrC3uxEJS+soe
         +cIWX0rbxE8eLnWuh/EgoNtMjOO4hJa2BFNBovoTGmJ+oK9oID4WNmW5m0pFJNIrKFGY
         vkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909544; x=1792514344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hMGgj7z4LL/41SC/RzPSs++jA5iS5B4RotyfALMsZXw=;
        b=LjtnVhPGU2yWi22Y2yuj2zUwmLis1P36Y0A9TYYE/oh/25A+waj4amVAB5TJ/DZ0j2
         iXYvalm8BmFbspAL8aB5PLy0kxd3te8BzZg+ClJzDGxBBMpikxioCDsn4sTuVmDYGicD
         HJ9VmSwteV19P4hTEpA45tv0ek5OmrRD5t9LkwnkCH7GWUip/XieJhmFKUHlAGvcjoMy
         McOhlRo8OAT/0N9T4DL99C/pHk37XYyu0odNIzTL8eWGhftsPa9Uer3Lf9iuvWhI4s2X
         /riFRwGeZiwSTIeBa/3+VGsHXQXd2yau7icf/1x0jzm2X9m2y0Vxfstf7Cq0GqB8R7/X
         V0NA==
X-Forwarded-Encrypted: i=1; AKwUvBxwVPB4ZX5pph4SL5l0WHfTFn3z8bNgxVWUXdbZTYzwQOHl3+Z8XiRYwtt1RwuNvBq8zsCFift2XcOLeyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfC2QRSBmwsQQqBEjm8cPisBiztBW7VqpZo/EAK9LucR85IyXV
	NzdMlxa6ooXSaQVoxeupUTZtjmQkESuIKT9uJn1aDMUr3LiyLkAJheBc
X-Gm-Gg: AYBFou3LCag/n5eSRXwy9fqloUDbP0g1A6+/2AEl7l+KTsq51qbr3QsPTcwY+eYUkvG
	xcHCim0J8Uz/QNtvRejDaqMWigUgpZOj2fWBOjneD58U5AhoMEBG5sfPkuSHgVB16WxpSyiK+Ah
	DnSnuNBm7NJIuHwNdVcb/QIFXmv9RtwTV0IuJNbZVfDtAUkCqAU6gqaiXVb3vuuQrQPfvIOTnNH
	4HYTp0+b6mD943zgRylOKcA45BmliEpzsMGKKcG1tLOdC3SekRaXQTcUdbMLAy08a4VuGZ5qtux
	CFxPrsx2CBcBQ3cZhStvUnnw21PLoh8MeqFF3o22EOQUEzP6j9ELluSxUpBtgsxON+ZeKJ/HrBC
	W8PBpU+pKPqn5urLY0aOLuLjoxivDKrmT+ZHyMpCVADmTOngPsAQi1ehVh3KuNlDVCEzs/iVxKc
	2xXA2vcYxL0VceO4tX11g132KWVOeCCrSLWn2hNvhRYsyvcc1Fr9qZPnIOTKafuV1SzRbXmFzJj
	5m0tWihesoujft2ss5Ud5ZYPUSm5a+w0zE=
X-Received: by 2002:a05:6512:3d94:b0:5b4:af24:3612 with SMTP id 2adb3069b0e04-5bcdd509e2bmr4530333e87.20.1791909543917;
        Tue, 13 Oct 2026 09:39:03 -0700 (PDT)
Received: from pc636 (host-95-203-22-87.mobileonline.telia.com. [95.203.22.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d8a485sm45759e87.54.2026.10.13.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:39:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 13 Oct 2026 18:39:00 +0200
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>
Cc: Hao Ge <hao.ge@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [RFC PATCH 2/4] mm/vmalloc: undo partial mappings inside the
 mapping functions
Message-ID: <as5epHFQF4iE_VQK@pc636>
References: <20261009063619.112313-1-hao.ge@linux.dev>
 <20261009063619.112313-3-hao.ge@linux.dev>
 <CAJuCfpE9VfgTw2ZNMJTEVh41H_R+1RY_MtzeMuZNCD3BFm-Piw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpE9VfgTw2ZNMJTEVh41H_R+1RY_MtzeMuZNCD3BFm-Piw@mail.gmail.com>

On Tue, Oct 13, 2026 at 03:23:14PM +0400, Suren Baghdasaryan wrote:
> On Fri, Oct 9, 2026 at 10:36 AM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > __vmap_pages_range_noflush() and friends can install some PTEs before
> > failing and leave them mapped, and the kernel callers do not agree on
> > who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
> > roll back what they mapped before the failure, while
> > vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> > __vmalloc_area_node() rely on the mapping functions cleaning up and
> > do not call anything like vunmap_range() themselves. When the same
> > range is mapped again, the attempt hits the leftovers and fails, with
> > a BUG() in vmap_pte_range() for huge mappings and a warning on the
> > small-page path.
> >
> > After discussing with Suren and Ulad, we decided to put the rollback
> > into the entry points of the vmap API rather than into every low-level
> > helper. __vmap_pages_range_noflush() undoes the whole range it was
> > asked to map when it fails, and vmap_page_range() undoes its range
> > for the ioremap-style mappings.
> >
> > The rollback is __vunmap_range_noflush(), it only clears the PTEs,
> > no TLB flush, nothing has touched these mappings.
> > vmap_pages_range_noflush() drops the KMSAN metadata when the data
> > mapping fails, and an empty range bails out with -EINVAL now, which
> > used to BUG_ON() on the small-page path and map nothing at all on
> > the huge-page one.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Suggested-by: Uladyslau Rezki <urezki@gmail.com>
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 44 ++++++++++++++++++++++++++++++++------------
> >  1 file changed, 32 insertions(+), 12 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index db669103dc66..e1b376f57dd2 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
> >         if (!err)
> >                 err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> >                                                ioremap_max_page_shift);
> > +       if (err)
> > +               __vunmap_range_noflush(addr, end);
> > +
> >         return err;
> >  }
> >
> > @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> >  {
> >         unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> > +       unsigned long start = addr;
> > +       int err = 0;
> > +
> > +       if (WARN_ON_ONCE(addr >= end))
> > +               return -EINVAL;
> >
> >         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
> >                 return -EINVAL;
> >
> >         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                       page_shift == PAGE_SHIFT)
> > -               return vmap_small_pages_range_noflush(addr, end, prot, pages);
> > -
> > -       for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > -               int err;
> > -
> > -               err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > +                       page_shift == PAGE_SHIFT) {
> > +               err = vmap_small_pages_range_noflush(addr, end, prot, pages);
> > +       } else {
> > +               for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > +                       err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> >                                         page_to_phys(pages[i]), prot,
> >                                         page_shift);
> > -               if (err)
> > -                       return err;
> > +                       if (err)
> > +                               break;
> >
> > -               addr += 1UL << page_shift;
> > +                       addr += 1UL << page_shift;
> > +               }
> >         }
> >
> > -       return 0;
> > +       /* Undo the PTEs installed before the failure. */
> > +       if (err)
> > +               __vunmap_range_noflush(start, end);
> 
> Would it be too complicated to track how much was actually mapped and
> unmap only that portion?
> 
I think it is possible to vunmap the range which is already unmapped.
i.e. in this case it is better to no to track anything as soon as a
mapping failure is a corner case. Also it is more reliable without
extra track logic.

--
Uladzislau Rezki

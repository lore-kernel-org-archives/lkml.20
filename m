Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3946EF99
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135746; cv=pass; b=C8mINFO3doOuOlSZRHNP06OQSQjiIYD6vEpv/gQlFjBsWWdyMI+tvd0DKUtKeQXwXSNaJOrg58qjPA1yDMXSFd4UF35i2RMCWj2UlV+TiuQByNB24SI5OabHVdu4iWdDF9YszYOK1/A35OkHVQ1ERsP5DuKZYKOPJ/t3GC8D8Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135746; c=relaxed/simple;
	bh=0NIxRm9j8x70g9FR+y+hF4NZwYnxGeMUXTvlqQyCFpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0n0ifjdhxzjIj58cb7o0V4edQjr8fMzPpqr1C+rzen4v0Zd3ZVhg5Hd6HCtvnIU1BDha4ZxLgi1lG/WNDT7JxeBmJ6CUipSBOysMDqSwhDpB9LoeiUNrZXtpsL+xl+JdfIvRAt0PN7KEYvWKyjUthN4aBe/znBlzJ945LOqyi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILOiw9pf; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILOiw9pf"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5337c7b9937so261741cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791135743; cv=none;
        d=google.com; s=arc-20260327;
        b=DTaEEKvSx5j8d2pLiZDZsNBBz7gLTHE/eA5c15wHCbJoqN7cINvkZ0Ooyms0vNsAQr
         lVfoCoRKVNzXD/13N236tJxCEAp+QoT44xXNKJzuRAeQRuXXQM8n+OAb6ubmdHEPrVJi
         9/9PHVxN+VeqsSqC2xrEZ/PjJiijtKNKJvCGrZNLVX39xTwVfYI7ouytA2mm04zReOiv
         mI3Ti8lYgQi47LXeMTpWU3cRBx6dC76VyX5ulZWNMfnPyfElcMUUsOenLSeTDkRpqXy+
         SrvToG/GPqpKp4nvmiJmztqsmKB4YFOCTJhllH//ktcMEXIFv4dt2E14WkOmcuBQGF/v
         5+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lc5562D3mWi9zthF4OGWqkURt3JXx0LaNSqwCjnMAYk=;
        fh=kOQJj/mcnDgThgknM0Z+IOii9k8b/h4XVz0f/V157Vo=;
        b=JhhSCXkt1gbngYOj7DBv5kNWlQmsAj0d8GqXhjb+CHU0+ETJslVOCEu5NYdfQRs3hU
         So9mZdI8hvAiN0kVWga9FJHvgv14ik6OZKDykmyeqphmt4CyhTN2JsTALrTx8ldaJ51d
         QdEQ3IRvRRwWfZXTaClDILRTOv9WBcAqYt/FqmJVc1CEsZSgSm1V5X/kabsa26WlNRvW
         Rn3xkztKBjRC1EWNlG+MHg7xgPJK5NVp5FAk86+4lhDtRls9sSyvwVdpA0rJL9KWsisR
         vb8mpv7MlOx+G5NPe23+PfUq178JqzHvDk/Dm5zj7KUF2P8bAnYYIX7m20cjau2CyyzD
         n0Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791135743; x=1791740543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lc5562D3mWi9zthF4OGWqkURt3JXx0LaNSqwCjnMAYk=;
        b=ILOiw9pf6KdcSmEjiztckKpeDjPXye7B29Pkv2pXYu5MflCje1tmk02XjxPl/C7fC0
         TJQ2yC20mZ9Icj1b95YFcFAhU4h1h0E8WzA30HMHYDk0mwN/LCGpHXvsRJ5Wr9i/4EZ2
         NIvhrezs7hTROTSxkstIQhzJALL9gqyPYweOADFTihlJf54CmUMOQ99geRfCzazmYh5h
         yh68ECoeU7WNpOEdRQk/9DvX3wjy1dE3bDOmarfbZHqxWT/HIBJ1IRWX1CP/iz4tQnso
         mMviIlXJpawOWja+wqlHhNZSiHfqCTPZNf+swfDfGoZ45+BmZsi8eD0Oh53j1DgSiWYr
         +9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135743; x=1791740543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc5562D3mWi9zthF4OGWqkURt3JXx0LaNSqwCjnMAYk=;
        b=hDlV4PLiV2JN4ctbJpiKLN+X6WtB5xpKsKZkX4O6yJF/xGlLcCgRoQHjxcy6i8WsrL
         0L71u7F/AhqBL3P7F4LbfdGt0XtW3+/nJDeUMmzwzkvbjKT4aZIe9atd/nzhxzgaK2rq
         ASc+TtMYVPdCLPGTq0IVoGwqwgJdZvyL7IT7Xe5CQ9louPiHEZBpvZLpMPJjwcLnGRK8
         MdiYfRymJIZsXq50mGJEMPYb6ZXe8MOdVTUucC2lbkMqsKainjdEOcFc+EYaVpmq2zP1
         DO6hg61HfXEvpRYMzQnb9gNsW4ZRQAB9AnHjGLh7ZZPa73IEOTH8WlZc1pur6P1+fIJC
         m3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE0hlDH5CccLjgE2p8G/iVZlaX5+daXgfzU2pusqe8HRGjlQ93qhAl81fmuU7CNuu0OCQQIPKssZNwlX8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJvel7N4XagxqUCZfBwFgCEG6d+DemLwFsbMAC8Yj2sKwl9D/e
	3Sp6Xzis33bFBg0ImJ0cirTbaJGDZ2h1OjtZnQQ4puoE8X6yw3vG3jsmEITgiMSw3HzqDInDTQ2
	T4RdwHiUpLVjazB03kNFhdiwJ1OKTwPcF/vUVpsbq
X-Gm-Gg: AYBFou1i9P+1DiW9w6tIKEQ9pDcp2/I7PBNkdw2mrsDxUsrBwvhtI7mwQDKxci3Pscv
	F0nbgnJ7DLZJg83as18nSNVtUewnFkLCinNv/6odorajSFasTwLePr4IeKaUeuzMtNUwUp+PY4y
	oLEQkwc5L9vaDge2oWjrMKtm6oHSWoq6IC3iroLblyE1tcBYNBZU2bmjThBS3Cj2dkuC4o3Lt+w
	zXpJm1ysgr1yqrJr11fLDmvBE9oTCo+pXF0xj4RK4QdZdVz/FwXSNC0tcbhFsvuI1N+4bbKIrC9
	9Gjqi0436+fzy+aRJau4g3hb24AXNGv6A3l39QMD1wqquQiwtHYAL24W
X-Received: by 2002:a05:622a:606:b0:532:84d3:abb with SMTP id
 d75a77b69052e-535131b5a84mr14423871cf.7.1791135742728; Sun, 04 Oct 2026
 10:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929082014.160587-1-hao.ge@linux.dev> <20260929082014.160587-3-hao.ge@linux.dev>
 <arzgoe-bXAz1poAt@milan>
In-Reply-To: <arzgoe-bXAz1poAt@milan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 19:42:10 +0200
X-Gm-Features: AclHuK_ov-dYU8ZQ3hSK0lFHr-9gA3i8l8r8LsI_kBqLCittdU-KxegpDjovpwQ
Message-ID: <CAJuCfpHavrwaJ2T6daHnJc+r=9khBwrv_zOp8s3Cwi347SHXRw@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] mm/vmalloc: undo partial mappings inside the
 mapping functions
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>, "=Kent Overstreet" <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:12=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com=
> wrote:
>
> On Tue, Sep 29, 2026 at 04:20:09PM +0800, Hao Ge wrote:
> > __vmap_pages_range_noflush() and friends can install some PTEs before
> > failing and leave them mapped, and the kernel callers do not agree on
> > who cleans them up. For example, pcpu_map_pages() and
> > kmsan_ioremap_page_range() unmap the leftovers themselves, while
> > vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> > __vmalloc_area_node() relied on the mapping functions cleaning up and
> > did not call anything like vunmap_range() themselves. When the same
> > range is mapped again, the attempt hits the leftovers and fails, with
> > BUG() in vmap_pte_range() for huge mappings.
> >
> > After discussing with Suren and Ulad, we decided the cleanup belongs
> > to __vmap_pages_range_noflush() and friends, so the callers no longer
> > need to unmap the partial mappings themselves. Each function now
> > undoes the PTEs it installed itself.
> >
> > The rollback calls the low-level __vunmap_range_noflush(), it just
> > clears the PTEs of the range it is given, which is all a rollback
> > needs. It cannot use vunmap_range_noflush() because these mapping
> > functions also map the KMSAN shadow and origin, and for a metadata
> > range its hook would look up the metadata of the metadata, get 0
> > and BUG() on addr >=3D end. The failed mappings were never accessed,
> > no TLB flush needed.
> >
> > Fixes: 9376130c390a ("mm/vmalloc: add support for __GFP_NOFAIL")
> > Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as nee=
ded")

I don't think this fixes 0f9b685626da. I mean it fixes it but
indirectly. That patch expects vmap_pages_range() to undo the mappings
when it fails, which is a reasonable assumption. By fixing
vmap_pages_xxx we fix all its users, including
vm_module_tags_populate(). So, it indirectly fixes several callers but
when adding a Fixes tag we do not list all patches we indirectly fix.

> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/kmsan/shadow.c |  4 ++++
> >  mm/vmalloc.c      | 31 +++++++++++++++++++++++++++++--
> >  2 files changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> > index 0c88d89bf0d6..2166086d3dc3 100644
> > --- a/mm/kmsan/shadow.c
> > +++ b/mm/kmsan/shadow.c
> > @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long s=
tart, unsigned long end,
> >                                           o_pages, page_shift);
> >       kmsan_leave_runtime();
> >       if (mapped) {
> > +             /* Undo the shadow mapping set up above. */
> > +             kmsan_enter_runtime();
> > +             __vunmap_range_noflush(shadow_start, shadow_end);
> > +             kmsan_leave_runtime();
> >               err =3D mapped;
> >               goto ret;
> >       }
> >
> Can we just do that inside the vmalloc? For example in the
> __vmap_pages_range_noflush() as entry function for all(?) helpers?
> So we do not need do it manually?

Agree, that would be better.

>
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 859e6d2d57a3..9bbf75706627 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -349,6 +349,10 @@ static int vmap_range_noflush(unsigned long addr, =
unsigned long end,
> >       if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> >               arch_sync_kernel_mappings(start, end);
> >
> > +     /* Undo the PTEs installed before the failure. */
> > +     if (err)
> > +             __vunmap_range_noflush(start, end);
> > +
> >       return err;
> >  }
> >
> > @@ -363,6 +367,9 @@ int vmap_page_range(unsigned long addr, unsigned lo=
ng end,
> >       if (!err)
> >               err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
> >                                              ioremap_max_page_shift);
> > +     if (err)
> > +             __vunmap_range_noflush(addr, end);
> > +
> >       return err;
> >  }
> >
> > @@ -667,6 +674,10 @@ static int vmap_small_pages_range_noflush(unsigned=
 long addr, unsigned long end,
> >       if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> >               arch_sync_kernel_mappings(start, end);
> >
> > +     /* Undo the PTEs installed before the failure. */
> > +     if (err)
> > +             __vunmap_range_noflush(start, end);
> > +
> >       return err;
> >  }
> >
> The only one user of that function is __vmap_pages_range_noflush()
> so we can cover both cases there small and huge path.
>
> Is that enough just to do unroll in the below:
>
> __vmap_pages_range_noflush()
> vmap_page_range()
>
> functions? It will also fix NOFAIL case:
>
> <snip>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 89c327a6ce7d..fa1f357ecf3f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -359,10 +359,19 @@ int vmap_page_range(unsigned long addr, unsigned lo=
ng end,
>
>         err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>                                  ioremap_max_page_shift);
> +       if (err)
> +               goto error_cleanup_range;
> +
>         flush_cache_vmap(addr, end);
> -       if (!err)
> -               err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
> +       err =3D kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>                                                ioremap_max_page_shift);
> +       if (err)
> +               goto error_cleanup_range;
> +
> +       return 0;
> +
> +error_cleanup_range:
> +       __vunmap_range_noflush(addr, end);
>         return err;
>  }
>
> @@ -683,26 +692,35 @@ int __vmap_pages_range_noflush(unsigned long addr, =
unsigned long end,
>                 pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
>  {
>         unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
> +       unsigned long start =3D addr;
> +       int err;
>
> -       WARN_ON(page_shift < PAGE_SHIFT);
> -
> -       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -                       page_shift =3D=3D PAGE_SHIFT)
> -               return vmap_small_pages_range_noflush(addr, end, prot, pa=
ges);
> +       if (WARN_ON(addr >=3D end))
> +               return -EINVAL;
>
> -       for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHIFT)) {
> -               int err;
> +       if (WARN_ON(page_shift < PAGE_SHIFT))
> +               return -EINVAL;
>
> -               err =3D vmap_range_noflush(addr, addr + (1UL << page_shif=
t),
> +       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> +               page_shift =3D=3D PAGE_SHIFT) {
> +               err =3D vmap_small_pages_range_noflush(addr, end, prot, p=
ages);
> +       } else {
> +               for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHI=
FT)) {
> +                       err =3D vmap_range_noflush(addr, addr + (1UL << p=
age_shift),
>                                         page_to_phys(pages[i]), prot,
>                                         page_shift);
> -               if (err)
> -                       return err;
> +                       if (err)
> +                               break;
>
> -               addr +=3D 1UL << page_shift;
> +                       addr +=3D 1UL << page_shift;
> +               }
>         }
>
> -       return 0;
> +       if (err)
> +               __vunmap_range_noflush(start, end);
> +
> +       /* 0 on success. */
> +       return err;
>  }
>
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -714,7 +732,13 @@ int vmap_pages_range_noflush(unsigned long addr, uns=
igned long end,
>
>         if (ret)
>                 return ret;
> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift);
> +
> +       ret =3D __vmap_pages_range_noflush(addr, end, prot, pages, page_s=
hift);
> +       if (ret)
> +               /* Cleanup KMSAN metadata. */
> +               kmsan_vunmap_range_noflush(addr, end);
> +
> +       return ret;
>  }
>
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> <snip>
>
> --
> Uladzislau Rezki

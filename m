Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794446124;
	b=zxMPmQ3WiQkArMGSvqLZJ48yZBiDE3uUZOxIrxmFyZyFnNEDtwHgMiczK6uluLyQEU4m
	 DjsyjrTP8yrrW86xWtpqcyTr1lgkvpHBENR7jX5hv1HRj4oIppOnRao4X7alksBLuI9FU
	 eTHmzcH7QMnuLqbsjTR9l/h0ksuzfHJJg74kxJ+ZAkaByosw6mUHQwjLmVhaibuErVx2U
	 hTjYOxIioQnyMB6/YbCj5RVJ/bTMAq68+M1HICW1C0RljoozI+YeHT1w9H2dddXR51xSX
	 qVlCBwk1Qct5rtwdE+SPyblQGlu3S8yTw5vIU5Rp8O7hj2aMJiKywtjAPUCnPDRVD0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9a0zqbKXeobEqiLKUEeOvGBAydGpaXNxzwtSlXyYudU=;
	b=m2grxbaIsmyZRCzIl9dIvIqF//BRFjMLhSRpT5Mv50UH7zbkUbJEf8jFKJlHyfAaXfcH
	 9UNB+aubjT3uUXI1R/GB2YzWmT3ITesExc59NLICt4oU19XgAfeEEvvdUy36YnkEJ0SU8
	 25GF4QJUoMyb3HzHRwf6lVfRSUwbwg0rcDFmmLP6F7SHGFT/5le1Wod/T6iyrr45pVAn/
	 b1xBm4jPD0oPLvSiVHPapl5lIWr0H8w99kUy1pHiCNqAY46bLBzb+T298DE7Ej90iNKWQ
	 ZR0gmyijErLxDqaWur6++k0JQtdkERMbDq/BAA1hoPVfN+w5/F05ljv6dpOKz/j0gBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bd6/zxG3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bd6/zxG3
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-535f598d126so53491cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:15:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794446123; cv=none;
        d=google.com; s=arc-20260327;
        b=YDpSi6wWwgSbqRwf0K5IypcbNeRuEyiz7atjcoXaLtlsAXUUN5xEH4aRP+mSMQ+63r
         L/MYM/pp5GuGNA5Ba5rP/wPG6+g2bQKeqS3HYtx4TePSeF+WAsPxktM+Ylwzc4Kt2weF
         N4PrGoAmrwJda4YbaIg+gZ96ExEJeIoCAWzjjEruobh4iOZ22uUDGkkyQBnnNSS4AQAT
         uySYwtH/PwRCVOmRvP/WeQ7za4xIYXKfdTpMHtyKd4+UL5rZAb3K+kyhqg0kN+kcXgC2
         9hyqCg17zgopwG1giBND3HU1jVkXGioS8fk5NF/IaFb/e/GuN89hDnN5xOTyUPYyn0YK
         H2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9a0zqbKXeobEqiLKUEeOvGBAydGpaXNxzwtSlXyYudU=;
        fh=6yEPjJHz+QpNmH5Iyk2S5ieqhrYsWRMZUoEvegpkh0w=;
        b=cL+A385dPiIPF0hVX2mGaJY/Xrk7X7AltllmDhm9C1ALm+zz4k4rSOScJOCarg7Xed
         TbXCD+g9SbPZZC67eQwKnIsRLdK2cXTML3nlKQIKJxSuMBrNkEkfe0FknT4imHHO1+U/
         MwHYVZDks0rOUUe5wlXlfVQ8bpvr9KIoJV0iZbZ9UZiMON3zpwCuS0lWTCTcsmIEoVyr
         tLH2KLmUBxPOUojyXqWBCDbZVmZ50w9PyMwkbVkVZnHTPXQDtJbZ0r6eOT21EGdzhABB
         WNKa+0QQk95PgM2tznZSZPwkdwCrm9kCOmxtwXXtp9ECPKxm8q8v8kfPH4ybB3z6Oht8
         GPTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794446123; x=1795050923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9a0zqbKXeobEqiLKUEeOvGBAydGpaXNxzwtSlXyYudU=;
        b=Bd6/zxG3udy6lFyem6qXUmsQiLaD8t9RrboTjm0uxU6/8xhPT4yI4lJ2ZsCOr8B9qv
         OLjin7R19mBINVisAFTfMniyJYtIwoyBDlJxB/XDi28ZrA+aj7k2yfHNEb3PTB4JuzjU
         DFcbcbN2S17hV/QlYqlhASnu1yU0m7/5Drr7wj2H1aOfsJF09Hd/SO5oWpv+EXXRfhkB
         8YxwDx4D8dEw7gQTMdHhg1q3o/U5biGMzO4Bi8kaWBj3wBOWcCj485jsySYGhkFfrfsd
         wM8B2cVkVJ7CfjMf+OfvvUntNputy4y5gG+hS03ioMIQlnWcMCk7uTHJLdkdIveU+8OT
         N7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446123; x=1795050923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9a0zqbKXeobEqiLKUEeOvGBAydGpaXNxzwtSlXyYudU=;
        b=hHssPV6KMTMam7pd2+BCZpt8o3xh4sjetddTyKO7ARzx6/JB6POTVDqFzpGqtUEFYb
         c+CHP9HLHqeAgdcGoIAzQ0Og1fmiQ2j5lO/1scRAI+t+axSrwon9rNAlRQtTKCGnegEX
         PnRB6QNy/0RUSj1djw2hSh2mLJNxPwFRYBKhg94AioFr2dX2ucUVg71LbyjEAT+AdWUb
         0fyulYgti3nb4/QuYF3Ujam86DOT0G2MuYojzhDwcyNifxZiNlPFkMNhTL/AGOa8Xfxy
         5l3odh4IrXPDib88JfH7g8SDCa8erduZ/yzFUOwseKGM163fUBOe2PjNleB3s2zWIK4e
         AkCA==
X-Forwarded-Encrypted: i=1; AL+hErFqcPUNaDGH1Z73zbSfGniwTBlFS+/FkwnOedw5qgjXJ29SqpeJjfjapHwIBnuD4zg2YyvSNpUGV9G6910=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xqTvf8s58/F1X/7RPZ9OKPe4XRoH+H383LP9KXVlLW6MeSpUU
	DUgSPYECeT+SRStE5lVbtWFwbgLWxF2cYHRZ3/bitesiZGultYJjNlsIGqY5YtEkhRT0PHTscEG
	XDlxMASLCdf1+POkXN2awIOZut3+TFNv5/DRndaiE
X-Gm-Gg: AYBFou1y5Q+v1Z117MrBtKhWLOd8ARoINb89b+b6vHCUL6ZrgEjA5/SHD87+JumI7Ze
	RH6PBly35CaK4wZ9cfkADI0ZMkZ1ojiZfxwyemmxohaR6P/AHjGPyQcXk6CK7r2MooRiOKfRxmE
	HRRg8//fETIQ9B41W4tllgIN87RhEyOb3FLr8ULpzQD9XAGQaK2Srh0P+sA3ur/g/GELzQAU+iq
	13FkKSc6iqSo5Fzj9kcxQAiiQkA0xw37bQ4F+XwlZnsuwxs+yIn1RI6tfx0ThqgDQvQG/eMTI8b
	5UFJIJW5aO+6Dh+LeU0CbDlc+FlOaNELK5mhoSNHXj87D0Pnylye19dVHJyJhhRmHPBFPZru8kP
	Rv8Y8YUbFrTyuDQz9XAqVBNqOpMPBRCwanPuerONY2v99T6uaHaViaD5OptkGDQ+cUm1ww8vJ0q
	ilAA17YcFoMJ+jsReRQ1atAehZ
X-Received: by 2002:a05:622a:1e07:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-5596dbd7d56mr8576951cf.4.1794446121968; Wed, 11 Nov 2026
 17:15:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-8-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-8-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 01:15:09 +0000
X-Gm-Features: AclHuK-zAC-IeQ8aLVFiwYzq7tLi3yUNydZZveOqio07sklDAsvxkskKKL_OCWU
Message-ID: <CAJuCfpFHaahsCNkXCOn8ks65yj_bPy33cOLZ5BW=rtTOuedLqw@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] mm/vmalloc: undo partial mappings inside the
 mapping functions
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> The vmap entry points may install some PTEs and then fail, leaving a
> partial mapping behind.
>
> The callers do not agree on who cleans it up. pcpu_map_pages() and
> kmsan_ioremap_page_range() roll back what they mapped, while
> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> __vmalloc_area_node() expect a clean range from the mapping function.
> For them the leftovers stay mapped, and the next attempt to map the
> same range trips the WARN_ON(!pte_none()) in vmap_pages_pte_range().
> A leftover huge pmd is even worse. During the retry, vmap_try_huge_pmd()
> calls pmd_free_pte_page() on it, and the x86 implementation cannot
> tell a leaf entry from a page table and frees the mapped page.
>
> After discussing with Suren and Ulad, we decided to put the rollback
> into the entry points of the vmap API rather than into every
> low-level helper. __vmap_pages_range_noflush() undoes the whole range
> it was asked to map when it fails, and vmap_page_range() undoes its
> range for the ioremap-style mappings.
>
> The rollback is __vunmap_range_noflush(), which only clears the PTEs.
> No TLB flush is needed, nothing has touched the mapping yet.
> vmap_pages_range_noflush() also drops the KMSAN metadata of the
> failed mapping.
>
> The undo walk skips its cond_resched() when the caller's gfp mask
> cannot block. __vmalloc() with GFP_ATOMIC or GFP_NOWAIT can run in
> atomic context, where cond_resched() cannot schedule.
> __vunmap_range_noflush() takes a can_resched argument for that, which
> the sleepable callers pass as true.
>
> Suggested-by: Uladyslau Rezki <urezki@gmail.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  include/linux/kmsan.h |  8 ++++--
>  mm/kmsan/hooks.c      | 18 ++++++++-----
>  mm/kmsan/shadow.c     |  7 ++---
>  mm/vmalloc.c          | 61 +++++++++++++++++++++++++++++++++----------
>  mm/vmalloc.h          |  6 +++--
>  5 files changed, 72 insertions(+), 28 deletions(-)
>
> diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
> index 7da9fd506b39..0016c032d1e7 100644
> --- a/include/linux/kmsan.h
> +++ b/include/linux/kmsan.h
> @@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush(uns=
igned long start,
>   * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
>   * @start: start of vunmapped range.
>   * @end:   end of vunmapped range.
> + * @can_resched: whether the unmap walk may call cond_resched(); pass
> + * false from atomic context.
>   *
>   * KMSAN unmaps the contiguous metadata ranges created by
>   * kmsan_map_kernel_range_noflush().
>   */
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end);
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +                               bool can_resched);
>
>  /**
>   * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_range(=
) call.
> @@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_range=
_noflush(
>  }
>
>  static inline void kmsan_vunmap_range_noflush(unsigned long start,
> -                                             unsigned long end)
> +                                             unsigned long end,
> +                                             bool can_resched)
>  {
>  }
>
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index 107f66841274..0cd1edaa1120 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -136,13 +136,16 @@ static unsigned long vmalloc_origin(unsigned long a=
ddr)
>                                                  KMSAN_META_ORIGIN);
>  }
>
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +                               bool can_resched)
>  {
>         if (!kmsan_enabled)
>                 return;
>
> -       __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end)=
);
> -       __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end)=
);
> +       __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end)=
,
> +                              can_resched);
> +       __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end)=
,
> +                              can_resched);
>         flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
>         flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
>  }
> @@ -171,8 +174,9 @@ static void kmsan_iounmap_pages(unsigned long start, =
unsigned long end)
>                 if (origin)
>                         __free_pages(origin, KMSAN_IOREMAP_META_ORDER);
>         }
> -       __vunmap_range_noflush(shadow_start, shadow_end);
> -       __vunmap_range_noflush(origin_start, origin_end);
> +       /* ioremap metadata mappings are always GFP_KERNEL, so resched is=
 safe. */
> +       __vunmap_range_noflush(shadow_start, shadow_end, true);
> +       __vunmap_range_noflush(origin_start, origin_end, true);
>         flush_tlb_kernel_range(shadow_start, shadow_end);
>         flush_tlb_kernel_range(origin_start, origin_end);
>  }
> @@ -207,7 +211,7 @@ int kmsan_ioremap_page_range(unsigned long start, uns=
igned long end,
>                 mapped =3D __vmap_pages_range_noflush(
>                         vmalloc_shadow(start + off),
>                         vmalloc_shadow(start + off + PAGE_SIZE), prot, &s=
hadow,
> -                       PAGE_SHIFT);
> +                       PAGE_SHIFT, gfp_mask);
>                 if (mapped) {
>                         err =3D mapped;
>                         goto ret;
> @@ -217,7 +221,7 @@ int kmsan_ioremap_page_range(unsigned long start, uns=
igned long end,
>                 mapped =3D __vmap_pages_range_noflush(
>                         vmalloc_origin(start + off),
>                         vmalloc_origin(start + off + PAGE_SIZE), prot, &o=
rigin,
> -                       PAGE_SHIFT);
> +                       PAGE_SHIFT, gfp_mask);
>                 if (mapped) {
>                         err =3D mapped;
>                         goto ret;
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 2166086d3dc3..452760a333e4 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long star=
t, unsigned long end,
>         origin_end =3D vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
>         kmsan_enter_runtime();
>         mapped =3D __vmap_pages_range_noflush(shadow_start, shadow_end, p=
rot,
> -                                           s_pages, page_shift);
> +                                           s_pages, page_shift, gfp_mask=
);
>         kmsan_leave_runtime();
>         if (mapped) {
>                 err =3D mapped;
> @@ -255,12 +255,13 @@ int kmsan_vmap_pages_range_noflush(unsigned long st=
art, unsigned long end,
>         }
>         kmsan_enter_runtime();
>         mapped =3D __vmap_pages_range_noflush(origin_start, origin_end, p=
rot,
> -                                           o_pages, page_shift);
> +                                           o_pages, page_shift, gfp_mask=
);
>         kmsan_leave_runtime();
>         if (mapped) {
>                 /* Undo the shadow mapping set up above. */
>                 kmsan_enter_runtime();
> -               __vunmap_range_noflush(shadow_start, shadow_end);
> +               __vunmap_range_noflush(shadow_start, shadow_end,
> +                                      gfpflags_allow_blocking(gfp_mask))=
;
>                 kmsan_leave_runtime();
>                 err =3D mapped;
>                 goto ret;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3f98056f8c7e..d1986f68eab4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -372,8 +372,12 @@ int vmap_page_range(unsigned long addr, unsigned lon=
g end,
>         if (!err)
>                 err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
>                                                ioremap_max_page_shift);
> -       if (!err)
> +       if (err) {
> +               /* Callers are ioremap and arch setup code, always sleepa=
ble. */
> +               __vunmap_range_noflush(addr, end, true);
> +       } else {
>                 flush_cache_vmap(addr, end);
> +       }
>
>         return err;
>  }
> @@ -429,7 +433,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned lon=
g addr, unsigned long end,
>  }
>
>  static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned lo=
ng end,
> -                            pgtbl_mod_mask *mask)
> +                            pgtbl_mod_mask *mask, bool can_resched)
>  {
>         pmd_t *pmd;
>         unsigned long next;
> @@ -451,12 +455,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned l=
ong addr, unsigned long end,
>                         continue;
>                 vunmap_pte_range(pmd, addr, next, mask);
>
> -               cond_resched();
> +               /* The undo path may run in atomic context. */
> +               if (can_resched)
> +                       cond_resched();
>         } while (pmd++, addr =3D next, addr !=3D end);
>  }
>
>  static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned lo=
ng end,
> -                            pgtbl_mod_mask *mask)
> +                            pgtbl_mod_mask *mask, bool can_resched)
>  {
>         pud_t *pud;
>         unsigned long next;
> @@ -476,12 +482,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned l=
ong addr, unsigned long end,
>                 }
>                 if (pud_none_or_clear_bad(pud))
>                         continue;
> -               vunmap_pmd_range(pud, addr, next, mask);
> +               vunmap_pmd_range(pud, addr, next, mask, can_resched);
>         } while (pud++, addr =3D next, addr !=3D end);
>  }
>
>  static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned lo=
ng end,
> -                            pgtbl_mod_mask *mask)
> +                            pgtbl_mod_mask *mask, bool can_resched)
>  {
>         p4d_t *p4d;
>         unsigned long next;
> @@ -496,7 +502,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned lon=
g addr, unsigned long end,
>
>                 if (p4d_none_or_clear_bad(p4d))
>                         continue;
> -               vunmap_pud_range(p4d, addr, next, mask);
> +               vunmap_pud_range(p4d, addr, next, mask, can_resched);
>         } while (p4d++, addr =3D next, addr !=3D end);
>  }
>
> @@ -512,7 +518,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned lon=
g addr, unsigned long end,
>   *
>   * This is an internal function only. Do not use outside mm/.
>   */
> -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +                           bool can_resched)
>  {
>         unsigned long next;
>         pgd_t *pgd;
> @@ -529,7 +536,7 @@ void __vunmap_range_noflush(unsigned long start, unsi=
gned long end)
>                         mask |=3D PGTBL_PGD_MODIFIED;
>                 if (pgd_none_or_clear_bad(pgd))
>                         continue;
> -               vunmap_p4d_range(pgd, addr, next, &mask);
> +               vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
>         } while (pgd++, addr =3D next, addr !=3D end);
>
>         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> @@ -538,8 +545,9 @@ void __vunmap_range_noflush(unsigned long start, unsi=
gned long end)
>
>  void vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
> -       kmsan_vunmap_range_noflush(start, end);
> -       __vunmap_range_noflush(start, end);
> +       /* The unmap paths are sleepable, keep the resched point. */
> +       kmsan_vunmap_range_noflush(start, end, true);
> +       __vunmap_range_noflush(start, end, true);
>  }
>
>  /**
> @@ -727,18 +735,32 @@ static int vmap_pages_range_noflush_walk(unsigned l=
ong addr, unsigned long end,
>   * The caller is responsible for calling flush_cache_vmap() after this
>   * function returns successfully and before the addresses are accessed.
>   *
> + * On failure the mapping is torn down before returning, so a retry
> + * sees a clean range. When @gfp_mask cannot block, the teardown
> + * skips cond_resched(), it may run in atomic context.
> + *
>   * This is an internal function only. Do not use outside mm/.
>   */
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> -               pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
> +               pgprot_t prot, struct page **pages, unsigned int page_shi=
ft,
> +               gfp_t gfp_mask)
>  {
> +       int err;
> +
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
>
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>                 page_shift =3D PAGE_SHIFT;
>
> -       return vmap_pages_range_noflush_walk(addr, end, prot, pages, page=
_shift);
> +       err =3D vmap_pages_range_noflush_walk(addr, end, prot, pages, pag=
e_shift);
> +
> +       /* Undo the PTEs installed before the failure. */
> +       if (err)
> +               __vunmap_range_noflush(addr, end,
> +                                      gfpflags_allow_blocking(gfp_mask))=
;

I remember we discussed this before that __vunmap_range_noflush() will
be unmapping the entire range between addr and end instead of the
range vmap_pages_range_noflush_walk() actially mapped and your reply
was that this keeps things simple and avoids adding extra code in the
common path when we do not fail. This was bothering me, so I looked a
bit deeper and I think there is an issue with this approach.
vmap_pages_pte_range() fails with -EBUSY if it encounters an already
installed PTE. So, if this happens, we immediately bail out of mapping
the range and will be unmapping the entire range, including these
existing PTEs. I don't think that's ok.

A fix might be quite simple. vmap_pages_range_noflush_walk() already
counts how many pages we processed in nr variable. If we propagate
that one level up then we could unmap only the range we actually
mapped.

> +
> +       return err;
>  }
>
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -750,7 +772,18 @@ int vmap_pages_range_noflush(unsigned long addr, uns=
igned long end,
>
>         if (ret)
>                 return ret;
> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift);
> +
> +       ret =3D __vmap_pages_range_noflush(addr, end, prot, pages, page_s=
hift,
> +                                        gfp_mask);
> +       /*
> +        * The page tables undo themselves on failure. Tear down the
> +        * metadata that was fully set up before the mapping failed.
> +        */
> +       if (ret)
> +               kmsan_vunmap_range_noflush(addr, end,
> +                                          gfpflags_allow_blocking(gfp_ma=
sk));
> +
> +       return ret;
>  }
>
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index d8372a4f65c4..9ea28845f713 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -40,10 +40,12 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm=
);
>
>  int __must_check __vmap_pages_range_noflush(unsigned long addr,
>                 unsigned long end, pgprot_t prot,
> -               struct page **pages, unsigned int page_shift);
> +               struct page **pages, unsigned int page_shift,
> +               gfp_t gfp_mask);
>
>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>
> -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +                           bool can_resched);
>
>  #endif /* __MM_VMALLOC_H */
> --
> 2.25.1
>

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5594E5323
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890610; cv=pass; b=oLkuT1UROKy37jP3+WEBnnlqPjf1+RI32/ZEEgPukxMscyJ3eo/+wfk3uiwSMz3rvf9xR6CoaJNKyjaMMPkyqyxOlbyOKYnfPNvnK1jI1rWJTpyxBmED2QaM+T5GHnG3kLf3AHHIiQdZi7oy1kRikXYbLPvhhWiBwqKWltF5Zc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890610; c=relaxed/simple;
	bh=pNPj+pbrYUH0BBxlyCpjDN0gyqeh85+ZyJRf29I/KCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYA/VP/oxMHrzionwl5+s0WhGIv9yskX9+Bl/mtWr11ankf6AMlviJ0sAz94w0j9I8T9n8NtjQxBLt+pa0/nM+tIjvN4l/4I6RlPcsDB1VMbVDYd9QBzd5BCWmMi1EunTGiQW1BS5ygj+e6r0ZhRMxIBRoKy6L1yWilpj0nNfL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iFJ0ZKV9; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iFJ0ZKV9"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535f598d126so87301cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890607; cv=none;
        d=google.com; s=arc-20260327;
        b=qssEvMcD+8ehbu5UfDDuIZ163fHlpsJIq5aB3ytZhhJgE0YxFAXRmLU0jEP3m3kphd
         H7Sf5JfG1U0C65HIT/2uz8qWLrqM7FI35+hHvnY+TROHhetg+am6tpwHFvX9G2KzVbPZ
         19AIL3k+IH/9vrR5eIIBb3StJFufZ/1a0M8eNLv9P6nv7btureuvWDFkXvv2sRf6IqKb
         /gCr2umejRVWvXjc+x/la8RrodAnJerJWjo3GptoEO3QOp2sQrAqLHhPeT9OT+c8myEy
         8jH7H+tlaCL1J24eWZZ3TN/L9GUeW9sNBevOlx5vlWJ6vxsTYfs8udUEumwCmkrngqGO
         p0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lglLC9+yE+tZ+AHV0VONJs0/vCldZdYwmVgqh0e7e90=;
        fh=yMoHaapBKqhlt3vqrDULL6UsbgShsvOQLk6s5COAXc8=;
        b=AzXMg9nuPokt14WWs8Jc9GatIRVaahdwhnFRQ9/NehhFsUa2BU66B7K5Emgkg7qk2W
         AUyPLC9V3mIdL2iJZerDN3T9JlUkRb2nJrUQVK2fwnPtj1rHixAw+txivEoApbTd60Ij
         i+mMRBkKf+fqbEJsLJzTUchvajVcl1j2EnFyN8GG7B9/G92MpHvwviMj4jEuB2NnO2CC
         Gf0ynvoWpVOde+Idw9WKEsUWZO4blCemBVODZpCGM0aVxslA4KOx2MOx4pPjpSg8VzZk
         eDbPKbyH+JMtbkbVKUGa1nijPzqkxRKoASQHDwnEWlyG/MKJYJmq+ws0q1NrvIMJHXeF
         mgcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890607; x=1792495407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lglLC9+yE+tZ+AHV0VONJs0/vCldZdYwmVgqh0e7e90=;
        b=iFJ0ZKV9xOZUFxDXyb3Cqj5i6E8Swhd83W19vqo8qEXQGQoy+hFfZMwWioJ7Pnzp6l
         FIy4PbGifGNG3SlVxHPxz1jgZPvX6jos624SPk1b2YLWzyRnSiW2pIG1Ts4n9F6iCvr4
         1I7U+b5MO1QkGBErnpXVxRjnV5iMsxZ2xxlx47yQW9saaXesEitF4wnGG/xAnjYrJMRC
         fX2plalUFqsOim8w6L6AmLo/XbBmhxHkhUMimcBIFdTdOHdPy74L+y8T/f8RsD8bqEOf
         2yK2lokidmfp2qd/5Vp2veL495v2xhesKWJM8Xfg4Chq11B+aZ6DA/7JhCHP/mGolFl8
         +Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890607; x=1792495407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lglLC9+yE+tZ+AHV0VONJs0/vCldZdYwmVgqh0e7e90=;
        b=T2mdO1yUgbhZEqpCvxYZj95sJ38eUYx0ZNt562YqqEL/4qk0725UwPx+/PxL7AqJYD
         MyTsJe7Drtf2VJUeimtU+Qj9cGPJ9o+9dvaNplZbDRnNvFydzv0PWKnIfh5yslc9e5Z1
         62Wti5N/xloDdUQ3B+vDAM9m6m6txxj9S+K0oqOvmSDEIW+Ny4/C376uORLqWBxfxeGo
         F1gj7pIk5YYz/yuL3PZ7axkGlx/5vkRfaS1eD1l4qYjQrrWtE1bTrCKWAClDBrPan2tO
         /nMaYV+HwJ0nQ8CzstGuh1Asi4w3FlUYPIF1HQoyfMrU1ToR+9rNUswkQu8twWlwqrN0
         Lsbw==
X-Forwarded-Encrypted: i=1; AKwUvBzOUxWrd8YW61RoLNx32hWDEfkmGvaU06KdlflXz7XZwWW8iG8VYXKZ+NNG98q1d9J+BBlSMdLflnBxvPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDYEiKICTXRkBxXAMaeADE/3pqI4jlHAqsSn8j8gYPnf+PdxfA
	psr/ga1eAjkV/X//ljt8k/sTWPOxB3JDTu8Aab5Mu0eCoBF/7dCotevWJLrmeoL7yth9jpgR2oo
	dYs6mhL42zWMrtJJZWzxHny+Iyp8DKhmkalJg2R8F
X-Gm-Gg: AYBFou1aq3e5Jdh3nzYltdqJwLXdhn4wNnteRk0bw787T3Def9nhoe3WTQYXpnEPA1C
	j0qmvlp1EaXEp2KQFwPYFPFh65Y+YWL7emm8v5kLZa61tHeLowZ1UJvSQVqQOumujmObPx4ySOv
	yV5meudDOdKIsUBHJ738wC/MEkjVcglqRBw30ZFrJ/92M2ZIzRAAG52EqIRWKw+408kIpHqoVOy
	ldO7mkFFKy6p2OwaqiyvTd6aXCHKYircKwqMGReNgG0na0nU84CPdBPbzJByTYLpmb5cSlOku+l
	az3VEKp2wrbrYUDby5scKNyz8LnNhGv6Cus+5/7kGCbcOs2cUQ8Kpti4
X-Received: by 2002:a05:622a:180d:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-535b320372fmr48865141cf.4.1791890605760; Tue, 13 Oct 2026
 04:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009063619.112313-1-hao.ge@linux.dev> <20261009063619.112313-3-hao.ge@linux.dev>
In-Reply-To: <20261009063619.112313-3-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Oct 2026 15:23:14 +0400
X-Gm-Features: AclHuK-YS0X8RHvN1DiVTwo6aWWizXGsTLGePiTKV5Kwl9ajh5-w8CnH9PG_B2Y
Message-ID: <CAJuCfpE9VfgTw2ZNMJTEVh41H_R+1RY_MtzeMuZNCD3BFm-Piw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] mm/vmalloc: undo partial mappings inside the
 mapping functions
To: Hao Ge <hao.ge@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:36=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> __vmap_pages_range_noflush() and friends can install some PTEs before
> failing and leave them mapped, and the kernel callers do not agree on
> who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
> roll back what they mapped before the failure, while
> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> __vmalloc_area_node() rely on the mapping functions cleaning up and
> do not call anything like vunmap_range() themselves. When the same
> range is mapped again, the attempt hits the leftovers and fails, with
> a BUG() in vmap_pte_range() for huge mappings and a warning on the
> small-page path.
>
> After discussing with Suren and Ulad, we decided to put the rollback
> into the entry points of the vmap API rather than into every low-level
> helper. __vmap_pages_range_noflush() undoes the whole range it was
> asked to map when it fails, and vmap_page_range() undoes its range
> for the ioremap-style mappings.
>
> The rollback is __vunmap_range_noflush(), it only clears the PTEs,
> no TLB flush, nothing has touched these mappings.
> vmap_pages_range_noflush() drops the KMSAN metadata when the data
> mapping fails, and an empty range bails out with -EINVAL now, which
> used to BUG_ON() on the small-page path and map nothing at all on
> the huge-page one.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Suggested-by: Uladyslau Rezki <urezki@gmail.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 44 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index db669103dc66..e1b376f57dd2 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long=
 end,
>         if (!err)
>                 err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
>                                                ioremap_max_page_shift);
> +       if (err)
> +               __vunmap_range_noflush(addr, end);
> +
>         return err;
>  }
>
> @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, =
unsigned long end,
>                 pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
>  {
>         unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
> +       unsigned long start =3D addr;
> +       int err =3D 0;
> +
> +       if (WARN_ON_ONCE(addr >=3D end))
> +               return -EINVAL;
>
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
>
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -                       page_shift =3D=3D PAGE_SHIFT)
> -               return vmap_small_pages_range_noflush(addr, end, prot, pa=
ges);
> -
> -       for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHIFT)) {
> -               int err;
> -
> -               err =3D vmap_range_noflush(addr, addr + (1UL << page_shif=
t),
> +                       page_shift =3D=3D PAGE_SHIFT) {
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
> +       /* Undo the PTEs installed before the failure. */
> +       if (err)
> +               __vunmap_range_noflush(start, end);

Would it be too complicated to track how much was actually mapped and
unmap only that portion?


> +
> +       return err;
>  }
>
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -715,7 +726,16 @@ int vmap_pages_range_noflush(unsigned long addr, uns=
igned long end,
>
>         if (ret)
>                 return ret;
> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift);
> +
> +       ret =3D __vmap_pages_range_noflush(addr, end, prot, pages, page_s=
hift);
> +       /*
> +        * The page tables undo themselves on failure. Tear down the
> +        * metadata that was fully set up before the mapping failed.
> +        */
> +       if (ret)
> +               kmsan_vunmap_range_noflush(addr, end);
> +
> +       return ret;
>  }
>
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> --
> 2.25.1
>

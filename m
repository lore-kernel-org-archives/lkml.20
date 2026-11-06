Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794004252;
	b=r+ggnMXY7YpaGZE3V7ROJOIclb+bnndumiVyPonVKWqsQ1xE7EfqeNaB/OD1c0C8uYpF
	 QNMo0yAd4YbytE4j8bh7cMMSSLBl0TeeQ3JlNGhOgMYlbWwQ3TO3yeVv0sjd2kWgVc3fI
	 7jjtN9Gr4vq6kVJy7ncMkEG2kQX2598CDsH9MC1DUEzsSiOK3pMtCVbOgw7lYNn1oEKHa
	 so10WXNatj8SWym56ra2MDdz5rZkv3zgoNSyw9JXhvMWN+PdSt1Yh8ATzav09TwfLYBQ7
	 O1Kv/xVx4Sfucq2/6KlcSVwodrKLj/erBmXAdxopz9M7iHt16SzUDdT5kTQ+OuFSbqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7km9XbIZetC0r5re3sewHW/q1xGLE5OrcXCR5UGQTt8=;
	b=b44sbeOEH1hkw3k8iYB1EgsToeLm1j5JiN0RwO/lJh5lMGsIhPbsdbuRHRGnx1CB/2zu
	 2ypINLT5P3LjIAJgvAm2incc6brQwwgCztVZXP2qjLbhPhCZAcpO3nqa+nX9T+nFX2W3W
	 U2mtBZWIJd/HnGNSLhA02m7Od/6KLUSG4ErRfI+m8XG9iYW2X1x4wO3WqacZfTS+/g+Bs
	 gNNxSDFC9IpeB/ALGv+hXQYTFO8PMgB9v+QgTwu+njCuUDXhZvBsAll98OVJjsehpXrn5
	 jSxXJ8zZMr9hLgW5dmkbQ7xMUppE7nw4nuWfSUTmzeGVwcLI3TT+G9xH/JWhvgB6p5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S7v2uLeY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FC606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65FC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S7v2uLeY
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso8961cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794004251; cv=none;
        d=google.com; s=arc-20260327;
        b=ePp5kyoh1hllxHP87FVNzZNp+N3DKdPmkdkUpulfRUtHcoKSbfl0SPO+eLVtM58Ssn
         ocLxsl9txF9aqEYwwqps0v0f/XMK6LAEiR4icaS8gh3xtM4nMCTGNmfrISnEvJ0odZvs
         NFwDY+FCggImrbbbRK+GjGCEoqbvepCcV7bxSSFjM6tN9BaBsCLPbHMYmEnuRBuKJGFc
         8jbqzpCwl0hIgJI7KkfHvinP66QLh/f7AcGk2q6j7xTCOKIyfUphMj9uA9GsGf3/IAKv
         QhPFzkjKdSjRu7KKV851m5nFkzqFJfRbSKon7iny94H/Gc1HQrIQ8onucdV+ZJr73Xnn
         5+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7km9XbIZetC0r5re3sewHW/q1xGLE5OrcXCR5UGQTt8=;
        fh=R0H+XqRAPcdkJwRXAJ2WxVc2jpTKtSYJMktSMMpL1JY=;
        b=UteFensGv1IQT9Ptuqoued9PCa8rpGzpecsWq4E1X34TZmS2qXw+mi2kvzZKw5mMdA
         AjTpUWlOhsd6WVY2LiQ2KLPisCRNuL0cd15fKcu2eSlY0cEyP/+P+xzv53C4XMFwbPN1
         10MBnXFqadIifca70C5cNLvP2KnJ1DDjFueVnB9A+eq/+55rPQ9yIixghyvWqNrHgtX3
         FRCckzUfvwUXX9yA5HkEPDFq55nFJBswwyRSNPKGaT40Q6ue1K1+/B+Ye+M4JVmBWVoO
         v9O1/pu2pdVCzPLwFFDnUH6JZQ32wrLHiWOYlyAKdCDU+dMgPyhLd0FhmgOUMHHawTAa
         7SVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794004251; x=1794609051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7km9XbIZetC0r5re3sewHW/q1xGLE5OrcXCR5UGQTt8=;
        b=S7v2uLeY8qoo1MGvGRmmvMjmyEwvYnIG5e/7J5H0VGZRr7bgMVtrCtmR2JihZGSWTs
         RKTtBdnDLbLGHCIhvKP9+kbJgNfWtFhPiekQYdxEpyZhxgW0QvKJRbIm7SToG0Jy3Q7B
         HS5GQwnQWaHa50vns4uqx7IRJ0STL5KMWXv+2iFkz4mD55wGK2qPW8dyrfhuYDvk+0XY
         S/oy8Ew0lp5S8TfeOtjay6lfsCAjxREsIHRciU9KfkjteAo+MuOkAm2TN0HxHaXMOt19
         vfESz5UWc+NW8/snvAc2EkD8knjiaj4LCZqXx1C/WE4BBlzEfAiYj1L+I/wDibSAD3jy
         8dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004251; x=1794609051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7km9XbIZetC0r5re3sewHW/q1xGLE5OrcXCR5UGQTt8=;
        b=V1lYjU1Nv2WvnqNLUkDK5yAvrwx/E/wJ70l0YulrppDunp1mrtTzlnWyX4VmniJYmj
         25C65SX1QcUb/RqwtL++1zqTvgjeiH42MlMuYW1+scTespsuVpVQ6/mw1U/pXHoqNAL3
         5P6PgylrASypsQEbRVWrJqwMqgCfZTlxpmn+NJr9bOSB3MyQMWIlAQ7xl3MjFdrsWmD6
         DyIM5x2+9Rhb3lyMNv3QfyYj6hubs70oSMFX+0UB313d191lmx9lTmbnasREcOXjXtPE
         J2/CFxFlZPGakf/5WS6nTF2KKjOr94G/rnDE3zzum44U9ozifd/H7NSKLbDBK/3kt5B+
         tzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7JJeME3s2gmKz4HEsbo8zaCylKnp/VXvzN2ndCAFeyl9/wU5tv2QM3ruvinY7zqc4xQL93F6kQoLhf8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uiO4PT3s2/OV4TBuP/Kw3PX/ef6dYd7z9//orlkq4lfUnjAj3
	Lc9Kl1Sye+l84I9DT9AY8zErpIa79vqt7vc0mE3anbW3lGMQgY4lgUOt+Hw61mwoS/0eSUekWzi
	E6nA0PSIJSI8Q9+VbzDZNXYbv/trdBxvFTGf386s5
X-Gm-Gg: AYBFou1lLLGGTFT9dl/lv1JnHEYTa6AluSx9wKilP7syGjDLdRMHUkFzKRmYZmQ/9N2
	7iknabHax4oDOKeglEmEiP+/AaoTwiemzDlyUwUtmd85NrqUEeuWc6nL/95o/2NnbCSIi0rhGB9
	Y56TRrgeZ9oWahLLWVKLyhRrolpZPEHwsPOvP/lTbBfhFZrulphWuakNrxEarSBnw5zDZSbOdhQ
	PjuY8d/KPYhYTmT8n3biJwNWf0cFQG4AaX40zEJMjfRJheF6OVw/r8oxSDK2Xdk9J3w3LFkMDWU
	mB1SOZXBPPRrNDOBNQzv5rwcQUwFG/Wz/X18LXp5qd4kRvq4x9I7JreXVqv7EW5P1D9bTO0X+7x
	K6NGhSlK0Q2uAKo8oHbekxVWOXIdJtsJQaRDS
X-Received: by 2002:ac8:6f10:0:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-54f9ab01486mr4142751cf.0.1794004249631; Fri, 06 Nov 2026
 14:30:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
In-Reply-To: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 6 Nov 2026 14:30:38 -0800
X-Gm-Features: AclHuK90lFsqv1keBn7-ZLmlCrya18UgcO7zKAXShu8o4byRhpln0OSfr_V_EHM
Message-ID: <CAPTztWYzN1mkADOAJ3bskqpsv9c7qXNSMUdj_Ovg-aDQJDDmow@mail.gmail.com>
Subject: Re: [PATCH] mm/cma: simplify cma_declare_contiguous_multi()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:56=E2=80=AFAM Mike Rapoport (Microsoft)
<rppt@kernel.org> wrote:
>
> When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> largest free ranges above 4G, reserves them in memblock and adds them to
> cma->ranges.
>
> The list and subsequently cma->ranges are supposed to be sorted in the
> order of base addresses of the "allocated" ranges.
>
> This implementation has two bugs:
>
> * The allocation may fail even when there is enough free memory because
>   list_insert_sorted() sorts the list in the wrong order.
>
>   When the list is full, the largest range is evicted rather than the
>   smallest, the final list is not sorted by address, and the smallest
>   ranges are used first.
>
> * the function may report success while it reserved less memory than
>   requested because sizesum accounts for ranges that were skipped.
>
> And overall it is a lot of list management and open coded range
> selection for no real gain.
>
> Replace the current code with a loop that finds the largest free range
> above 4G, reserves as much of it as needed and repeats until the entire
> area is reserved or CMA_MAX_RANGES ranges are used.
>
> After successful alocation sort the cma->ranges by their base address.
>
> The new code scans free memory once for every range rather than once
> for all ranges, so it is slightly slower, but it is way simpler and more
> robust.
>
> Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if req=
uested")
> Reported-by: Ivy Lopez <skunkolee@gmail.com>
> Closes: https://lore.kernel.org/all/cover.1792032699.git.skunkolee@gmail.=
com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/cma.c | 265 +++++++++++++++++++--------------------------------------=
------
>  1 file changed, 77 insertions(+), 188 deletions(-)
>
> diff --git a/mm/cma.c b/mm/cma.c
> index f61d52796f4ef..ef0c49985067d 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -23,8 +23,8 @@
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> -#include <linux/string_choices.h>
>  #include <linux/log2.h>
> +#include <linux/sort.h>
>  #include <linux/cma.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> @@ -310,56 +310,6 @@ int __init cma_init_reserved_mem(phys_addr_t base, p=
hys_addr_t size,
>         return 0;
>  }
>
> -/*
> - * Structure used while walking physical memory ranges and finding out
> - * which one(s) to use for a CMA area.
> - */
> -struct cma_init_memrange {
> -       phys_addr_t base;
> -       phys_addr_t size;
> -       struct list_head list;
> -};
> -
> -/*
> - * Work array used during CMA initialization.
> - */
> -static struct cma_init_memrange memranges[CMA_MAX_RANGES] __initdata;
> -
> -static bool __init revsizecmp(struct cma_init_memrange *mlp,
> -                             struct cma_init_memrange *mrp)
> -{
> -       return mlp->size > mrp->size;
> -}
> -
> -static bool __init basecmp(struct cma_init_memrange *mlp,
> -                          struct cma_init_memrange *mrp)
> -{
> -       return mlp->base < mrp->base;
> -}
> -
> -/*
> - * Helper function to create sorted lists.
> - */
> -static void __init list_insert_sorted(
> -       struct list_head *ranges,
> -       struct cma_init_memrange *mrp,
> -       bool (*cmp)(struct cma_init_memrange *lh, struct cma_init_memrang=
e *rh))
> -{
> -       struct list_head *mp;
> -       struct cma_init_memrange *mlp;
> -
> -       if (list_empty(ranges))
> -               list_add(&mrp->list, ranges);
> -       else {
> -               list_for_each(mp, ranges) {
> -                       mlp =3D list_entry(mp, struct cma_init_memrange, =
list);
> -                       if (cmp(mlp, mrp))
> -                               break;
> -               }
> -               __list_add(&mrp->list, mlp->list.prev, &mlp->list);
> -       }
> -}
> -
>  static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
>  {
>         if (IS_ENABLED(CONFIG_HIGHMEM)) {
> @@ -524,37 +474,71 @@ static int __init __cma_declare_contiguous_nid(phys=
_addr_t *basep,
>         return 0;
>  }
>
> +/*
> + * Find the largest free range above 4G that can hold a part of a multi-=
range
> + * CMA area.
> + */
> +static phys_addr_t __init cma_find_free_range(phys_addr_t align,
> +               phys_addr_t size_align, int nid, phys_addr_t *basep)
> +{
> +       phys_addr_t start, end, size;
> +       phys_addr_t max =3D 0;
> +       u64 i;
> +
> +       for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL=
) {
> +               if (start < SZ_4G)
> +                       continue;
> +
> +               start =3D ALIGN(start, align);
> +               if (start >=3D end)
> +                       continue;
> +
> +               size =3D ALIGN_DOWN(end - start, size_align);
> +               if (size > max) {
> +                       max =3D size;
> +                       *basep =3D start;
> +               }
> +       }
> +
> +       return max;
> +}
> +
> +static int __init cma_range_cmp(const void *a, const void *b)
> +{
> +       const struct cma_memrange *cmr_a =3D a;
> +       const struct cma_memrange *cmr_b =3D b;
> +
> +       return cmp_int(cmr_a->base_pfn, cmr_b->base_pfn);
> +}
> +
>  /*
>   * Create CMA areas with a total size of @total_size. A normal allocatio=
n
> - * for one area is tried first. If that fails, the biggest memblock
> - * ranges above 4G are selected, and allocated bottom up.
> - *
> - * The complexity here is not great, but this function will only be
> - * called during boot, and the lists operated on have fewer than
> - * CMA_MAX_RANGES elements (default value: 8).
> + * for one area is tried first. If that fails, the area is assembled fro=
m
> + * up to CMA_MAX_RANGES of the biggest free memblock ranges above 4G.
>   */
>  int __init cma_declare_contiguous_multi(phys_addr_t total_size,
>                         phys_addr_t align, unsigned int order_per_bit,
>                         const char *name, struct cma **res_cma, int nid)
>  {
> -       phys_addr_t start =3D 0, end;
> -       phys_addr_t size, sizesum, sizeleft;
> -       struct cma_init_memrange *mrp, *mlp, *failed;
> +       unsigned long size_mb =3D (unsigned long)total_size / SZ_1M;
> +       phys_addr_t size, remaining, size_align;
>         struct cma_memrange *cmrp;
> -       LIST_HEAD(ranges);
> -       LIST_HEAD(final_ranges);
> -       struct list_head *mp, *next;
> -       int ret, nr =3D 1;
> -       u64 i;
> +       phys_addr_t start =3D 0;
>         struct cma *cma;
> +       int nr =3D 0;
> +       int ret;
>
>         /*
>          * First, try it the normal way, producing just one range.
>          */
>         ret =3D __cma_declare_contiguous_nid(&start, total_size, 0, align=
,
>                         order_per_bit, false, name, res_cma, nid);
> +       if (!ret) {
> +               pr_info("Reserved %lu MiB at %pa\n", size_mb, &start);
> +               return 0;
> +       }
>         if (ret !=3D -ENOMEM)
> -               goto out;
> +               goto err;
>
>         /*
>          * Couldn't find one range that fits our needs, so try multiple
> @@ -572,151 +556,56 @@ int __init cma_declare_contiguous_multi(phys_addr_=
t total_size,
>          * aligned to @align, and a size that is aligned to
>          * both @align and @order_to_bit, things will work out.
>          */
> -       nr =3D 0;
> -       sizesum =3D 0;
> -       failed =3D NULL;
> -
>         ret =3D cma_new_area(name, total_size, order_per_bit, &cma);
> -       if (ret !=3D 0)
> -               goto out;
> +       if (ret)
> +               goto err;
>
>         align =3D max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
> -       /*
> -        * Create a list of ranges above 4G, largest range first.
> -        */
> -       for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL=
) {
> -               if (upper_32_bits(start) =3D=3D 0)
> -                       continue;
> -
> -               start =3D ALIGN(start, align);
> -               if (start >=3D end)
> -                       continue;
> -
> -               end =3D ALIGN_DOWN(end, align);
> -               if (end <=3D start)
> -                       continue;
> +       size_align =3D max_t(phys_addr_t, align, PAGE_SIZE << order_per_b=
it);
>
> -               size =3D end - start;
> -               size =3D ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
> +       remaining =3D total_size;
> +       while (remaining && nr < CMA_MAX_RANGES) {
> +               size =3D cma_find_free_range(align, size_align, nid, &sta=
rt);
>                 if (!size)
> -                       continue;
> -               sizesum +=3D size;
> -
> -               pr_debug("consider %016llx - %016llx\n", (u64)start, (u64=
)end);
> -
> -               /*
> -                * If we don't yet have used the maximum number of
> -                * areas, grab a new one.
> -                *
> -                * If we can't use anymore, see if this range is not
> -                * smaller than the smallest one already recorded. If
> -                * not, re-use the smallest element.
> -                */
> -               if (nr < CMA_MAX_RANGES)
> -                       mrp =3D &memranges[nr++];
> -               else {
> -                       mrp =3D list_last_entry(&ranges,
> -                                             struct cma_init_memrange, l=
ist);
> -                       if (size < mrp->size)
> -                               continue;
> -                       list_del(&mrp->list);
> -                       sizesum -=3D mrp->size;
> -                       pr_debug("deleted %016llx - %016llx from the list=
\n",
> -                               (u64)mrp->base, (u64)mrp->base + size);
> -               }
> -               mrp->base =3D start;
> -               mrp->size =3D size;
> -
> -               /*
> -                * Now do a sorted insert.
> -                */
> -               list_insert_sorted(&ranges, mrp, revsizecmp);
> -               pr_debug("added %016llx - %016llx to the list\n",
> -                   (u64)mrp->base, (u64)mrp->base + size);
> -               pr_debug("total size now %llu\n", (u64)sizesum);
> -       }
> -
> -       /*
> -        * There is not enough room in the CMA_MAX_RANGES largest
> -        * ranges, so bail out.
> -        */
> -       if (sizesum < total_size) {
> -               cma_drop_area(cma);
> -               ret =3D -ENOMEM;
> -               goto out;
> -       }
> -
> -       /*
> -        * Found ranges that provide enough combined space.
> -        * Now, sorted them by address, smallest first, because we
> -        * want to mimic a bottom-up memblock allocation.
> -        */
> -       sizesum =3D 0;
> -       list_for_each_safe(mp, next, &ranges) {
> -               mlp =3D list_entry(mp, struct cma_init_memrange, list);
> -               list_del(mp);
> -               list_insert_sorted(&final_ranges, mlp, basecmp);
> -               sizesum +=3D mlp->size;
> -               if (sizesum >=3D total_size)
>                         break;
> -       }
>
> -       /*
> -        * Walk the final list, and add a CMA range for
> -        * each range, possibly not using the last one fully.
> -        */
> -       nr =3D 0;
> -       sizeleft =3D total_size;
> -       list_for_each(mp, &final_ranges) {
> -               mlp =3D list_entry(mp, struct cma_init_memrange, list);
> -               size =3D min(sizeleft, mlp->size);
> -               if (memblock_reserve(mlp->base, size)) {
> -                       /*
> -                        * Unexpected error. Could go on to
> -                        * the next one, but just abort to
> -                        * be safe.
> -                        */
> -                       failed =3D mlp;
> +               size =3D min(size, remaining);
> +               if (memblock_reserve(start, size))
>                         break;
> -               }
> -
> -               accept_memory(mlp->base, size);
> +               accept_memory(start, size);
>
>                 pr_debug("created region %d: %016llx - %016llx\n",
> -                   nr, (u64)mlp->base, (u64)mlp->base + size);
> +                   nr, (u64)start, (u64)start + size);
>                 cmrp =3D &cma->ranges[nr++];
> -               cmrp->base_pfn =3D PHYS_PFN(mlp->base);
> +               cmrp->base_pfn =3D PHYS_PFN(start);
>                 cmrp->early_pfn =3D cmrp->base_pfn;
>                 cmrp->count =3D size >> PAGE_SHIFT;
>
> -               sizeleft -=3D size;
> -               if (sizeleft =3D=3D 0)
> -                       break;
> +               remaining -=3D size;
>         }
>
> -       if (failed) {
> -               list_for_each(mp, &final_ranges) {
> -                       mlp =3D list_entry(mp, struct cma_init_memrange, =
list);
> -                       if (mlp =3D=3D failed)
> -                               break;
> -                       memblock_phys_free(mlp->base, mlp->size);
> -               }
> -               cma_drop_area(cma);
> +       if (remaining) {
>                 ret =3D -ENOMEM;
> -               goto out;
> +               goto err_free_ranges;
>         }
>
> +       /* allocate from lower addresses first */
> +       sort(cma->ranges, nr, sizeof(cma->ranges[0]), cma_range_cmp, NULL=
);
> +
>         cma->nranges =3D nr;
>         cma->nid =3D nid;
>         *res_cma =3D cma;
>
> -out:
> -       if (ret !=3D 0)
> -               pr_err("Failed to reserve %lu MiB\n",
> -                       (unsigned long)total_size / SZ_1M);
> -       else
> -               pr_info("Reserved %lu MiB in %d range%s\n",
> -                       (unsigned long)total_size / SZ_1M, nr, str_plural=
(nr));
> +       pr_info("Reserved %lu MiB in %d ranges\n", size_mb, nr);
> +       return 0;
> +
> +err_free_ranges:
> +       for (int i =3D 0; i < nr; i++)
> +               memblock_phys_free(PFN_PHYS(cma->ranges[i].base_pfn),
> +                                  PFN_PHYS(cma->ranges[i].count));
> +       cma_drop_area(cma);
> +err:
> +       pr_err("Failed to reserve %lu MiB\n", size_mb);
>         return ret;
>  }
>
>
> ---
> base-commit: b3710a1d0f145a4f6f1d44fdaff56a6af8cffe89
> change-id: 20261106-cma-multi-ff88e84bf599
>
> --
> Sincerely yours,
> Mike.
>

Thanks for cleaning this up. You're right, what I did with the list
sorting was too much, and it contained some bugs too.

Just one remark here: I don't think you need to sort the ranges by
base address at the end, I am not aware of anything relying on the CMA
ranges being sorted. The sorting was just there to mimic bottom-up
memblock allocations while acquiring the ranges, but the eventual
result doesn't need to be sorted. I'm not aware of any CMA code that
relies on this.

- Frank

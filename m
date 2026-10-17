Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0884CF47C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239558; cv=pass; b=HO8dET5FawCpB8ghS5SYiAj9wJG5dlGT67ce61aUa655qviTo6EdZ/+4ia7MbROPMnMsDyHHUi1krAWYsK2R4ai9RH35bVEES0w8ceU+Y9Bctirp+cmc0gkLGIXGCeHY2HuPWDHyM6OlddmWTgfrGtFKD5fHATU4o2OTxdS2YnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239558; c=relaxed/simple;
	bh=q/ORQJ8ws0wdXV3wRdd9DZ+pHlYs68ELvhmHl5u9R7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQecUJ0ifTq0yXEgbvdsIdLbQRFsczS/RX5SPHtXcgZx6QMyAIlfNjnKZE+VsiSbOWsr7U2YnisrHdRKxXnj/S1Ot2wqrXHQfmxCpjdafz7cC0d28S4nNNWGcXwzuR2oSW0iqwJuJBuwoR2BO2n1oZIZyDEVFYf63udjd/l059s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ThsNhBMH; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ThsNhBMH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-535f598d126so102281cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792239556; cv=none;
        d=google.com; s=arc-20260327;
        b=GL2d4MEo2DRqUBkVyztX4AOALuceUn6TpjPw/rFwpQOmLfQUNt38e9mGntmVhlzAht
         c3YeEw70Flkrip8c1ZcWNFgpT24fkj6wbaME6J9JYjBExAxbJFrmQIA7ezZckijtv33i
         4woLU6yuFtICduUS5ZOX/pXvWLVrCJ2RvCA5dpgX5uMPCz4Vst7B63EStohcLFmUD5ZC
         DdgonhJuLugov4nPjcTfHUCzw5q/xC99dY9kfQP4r9PSYUY4SwjXOymhy3k8eIY2FNBs
         b/KaVk/5Y6P8bN+NsPaQqSkrmrliE2Y3KVZNRgdEjc+sDn70k65vmtHGWynqOE6GoP3j
         Mhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzjdQ8KeLOKPpUHygxBJ7WOEjFu6Ph8LRE3nzk8raOA=;
        fh=AHB4lLlRDray8KelxHEaiOBwku0mcDh+LD61caSAvv4=;
        b=MklasEbLI71C9N1O6+lIwjzM6e2Z6J1p5E/T+WuwjlUa5AfG5ho4/GU+M/ifdCmrsm
         MIqbj8rcwZh+HJlWYKAtphLpLqJ0FTxythOPpDKsgoDTdJV59xLXGf9mw1ZVb/f+Y8X1
         30cUH0T7jYqGUdxP2gMxqrEdKVAL34ThtLO2oiXdBbtv1b9RObDB9LhF6YUXTW+f1ai/
         cGZeIKYumMXlDEQW4IupkY66NVfOAsmi4YaPHtT67y1eYvRa1y74HvEqOrGuZedOCkih
         n83myxaHkgPB6RaM5sXZ0Naw7FwekaGewl59Vk+OlWHtIvsr45j2ijBUIiszHxvUO7tq
         wqXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792239556; x=1792844356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzjdQ8KeLOKPpUHygxBJ7WOEjFu6Ph8LRE3nzk8raOA=;
        b=ThsNhBMHznLBJY9bCkTeMKrxL50nZfhe9fnCzeNBIYE71w57S0xMm6Q2rwTwY9NqI/
         XKVFu2LWSIoJHoor1epmPHZaHmGpLhwbXzUKNj2f3V6EvNxq0efQjcNk7/yLtYSI2QHk
         7pMyR+jJtOrJU2lxWtUOwn8fLvCgtUbSkFvSvgs2ykybuO6rVMGRfmR7DFkdRu55DTcP
         DVD3osSIu/ObbSHDFDtmCXqoT5DsYL+aNoWtXL5wepG3Rfx7SuQGlRSkrBggJ6uOmc5a
         FbyQkAlcDCM60cZVrvn1CgEZxO8fUU8CD5grYl7pNpmBbFhQhb372Nc571ex4evhPkh/
         4xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792239556; x=1792844356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzjdQ8KeLOKPpUHygxBJ7WOEjFu6Ph8LRE3nzk8raOA=;
        b=kGL3hKV58XJmNm/8+UDDzhsTGMbYBExIbfwzqpWta9OYQbXl2utg3Wa5e5QfdPu1JQ
         RVtS5eaIkhbSL98+eKVxeXh4uiLsw7Id3J65/cjPz8MaskyrD6BqqX9XV7swHI8hZF9H
         yuFazuvvRpQUCdNLjaDf0YheNGWEKmwwlbVypWvlFrAy1wG//8nUdktRp0ybH2HraCOW
         LslBUWGq1ZtvbdjKWnvPfRr+Tn1BEVUfwADDTWh2h7nma1e1iC1U0GE7y0a5HTVPep7Z
         IKZvRXrDQ3x5xSZbpOu33L7WWpEU4VH9BKdejloLKWLv23OlguCBs0ZdrR4FhEwIkI1f
         q8bg==
X-Forwarded-Encrypted: i=1; AKwUvBz3lext5SrlsahSdD32JZOsDH5BjBTsrHdaFw7V+IZETQJEqMIH5N6JacbGK2gEtfV9/hMZliJ5MQ0PotY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw0WQN+NfrWiVYcXeQ4Ur4Z4M3cNdOXQpsbQNkSXGs7kxGx6eB
	d/aYTvazYz1QMbRk+SiE7mXVJA3OnssXm/LDtm/mz/K9Ah/1eFZxw4CRFlFCIAC0vbxSELB1nPR
	D6tBcmc33MF2lv2EDLTqaXULutQ2UF/mDsFbvOy3A
X-Gm-Gg: AYBFou0nUmt+Gr5qzYxCgJ35eh0PDYYHJ5LRfFLJympqSK2KPZhKZTi8leanvCACUfS
	o8DmHD1SSXTAvppgCNhUWkLTRc/DojEdtzI0oZsb3ayi2svoaVaEfoJfDLbd7/CnIdv7f/tmDAO
	nxFxm8qKytGxnm4E/16QFtddXi8KYN+JY88R5fJVv2q9p7r1q0pKzwpc2+HxfTHdGghJ/pMvyZV
	Wg/aiQmN/vR7aYbWLnsvYY1IXuHdQ54KkKo6HDkdC8cX1HciuanmwAE3/JPYaEEzLZCHKY+suOI
	7vb2p/haKrUox/uj5vPyBGepeGR7SzLcj6PNMSXQuVX6dC1smds1XUrY
X-Received: by 2002:a05:622a:aad1:10b0:533:9746:9a86 with SMTP id
 d75a77b69052e-536499e8967mr8164001cf.5.1792239555029; Sat, 17 Oct 2026
 05:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009063619.112313-1-hao.ge@linux.dev> <20261009063619.112313-3-hao.ge@linux.dev>
 <CAJuCfpE9VfgTw2ZNMJTEVh41H_R+1RY_MtzeMuZNCD3BFm-Piw@mail.gmail.com>
 <as5epHFQF4iE_VQK@pc636> <bdcf2425-c0cf-48df-96a8-7ee1d23125d7@linux.dev>
In-Reply-To: <bdcf2425-c0cf-48df-96a8-7ee1d23125d7@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 17 Oct 2026 16:19:02 +0400
X-Gm-Features: AclHuK_ldkostR4vqZE29fcaoDnWO3b8rAtih31hbuFNFSoBo5VC0b-tINCA_80
Message-ID: <CAJuCfpFWbtBD5K5S49oCPQYTxv0ZvtBio04nNyV9Sj1KRCbiwg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] mm/vmalloc: undo partial mappings inside the
 mapping functions
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:28=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Uladzislau and Suren
>
> On 2026/10/14 00:39, Uladzislau Rezki wrote:
> > On Tue, Oct 13, 2026 at 03:23:14PM +0400, Suren Baghdasaryan wrote:
> >> On Fri, Oct 9, 2026 at 10:36=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrot=
e:
> >>>
> >>> __vmap_pages_range_noflush() and friends can install some PTEs before
> >>> failing and leave them mapped, and the kernel callers do not agree on
> >>> who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
> >>> roll back what they mapped before the failure, while
> >>> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> >>> __vmalloc_area_node() rely on the mapping functions cleaning up and
> >>> do not call anything like vunmap_range() themselves. When the same
> >>> range is mapped again, the attempt hits the leftovers and fails, with
> >>> a BUG() in vmap_pte_range() for huge mappings and a warning on the
> >>> small-page path.
> >>>
> >>> After discussing with Suren and Ulad, we decided to put the rollback
> >>> into the entry points of the vmap API rather than into every low-leve=
l
> >>> helper. __vmap_pages_range_noflush() undoes the whole range it was
> >>> asked to map when it fails, and vmap_page_range() undoes its range
> >>> for the ioremap-style mappings.
> >>>
> >>> The rollback is __vunmap_range_noflush(), it only clears the PTEs,
> >>> no TLB flush, nothing has touched these mappings.
> >>> vmap_pages_range_noflush() drops the KMSAN metadata when the data
> >>> mapping fails, and an empty range bails out with -EINVAL now, which
> >>> used to BUG_ON() on the small-page path and map nothing at all on
> >>> the huge-page one.
> >>>
> >>> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >>> Suggested-by: Uladyslau Rezki <urezki@gmail.com>
> >>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >>> ---
> >>>  mm/vmalloc.c | 44 ++++++++++++++++++++++++++++++++------------
> >>>  1 file changed, 32 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>> index db669103dc66..e1b376f57dd2 100644
> >>> --- a/mm/vmalloc.c
> >>> +++ b/mm/vmalloc.c
> >>> @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned =
long end,
> >>>         if (!err)
> >>>                 err =3D kmsan_ioremap_page_range(addr, end, phys_addr=
, prot,
> >>>                                                ioremap_max_page_shift=
);
> >>> +       if (err)
> >>> +               __vunmap_range_noflush(addr, end);
> >>> +
> >>>         return err;
> >>>  }
> >>>
> >>> @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long ad=
dr, unsigned long end,
> >>>                 pgprot_t prot, struct page **pages, unsigned int page=
_shift)
> >>>  {
> >>>         unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
> >>> +       unsigned long start =3D addr;
> >>> +       int err =3D 0;
> >>> +
> >>> +       if (WARN_ON_ONCE(addr >=3D end))
> >>> +               return -EINVAL;
> >>>
> >>>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
> >>>                 return -EINVAL;
> >>>
> >>>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> >>> -                       page_shift =3D=3D PAGE_SHIFT)
> >>> -               return vmap_small_pages_range_noflush(addr, end, prot=
, pages);
> >>> -
> >>> -       for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHIFT))=
 {
> >>> -               int err;
> >>> -
> >>> -               err =3D vmap_range_noflush(addr, addr + (1UL << page_=
shift),
> >>> +                       page_shift =3D=3D PAGE_SHIFT) {
> >>> +               err =3D vmap_small_pages_range_noflush(addr, end, pro=
t, pages);
> >>> +       } else {
> >>> +               for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE=
_SHIFT)) {
> >>> +                       err =3D vmap_range_noflush(addr, addr + (1UL =
<< page_shift),
> >>>                                         page_to_phys(pages[i]), prot,
> >>>                                         page_shift);
> >>> -               if (err)
> >>> -                       return err;
> >>> +                       if (err)
> >>> +                               break;
> >>>
> >>> -               addr +=3D 1UL << page_shift;
> >>> +                       addr +=3D 1UL << page_shift;
> >>> +               }
> >>>         }
> >>>
> >>> -       return 0;
> >>> +       /* Undo the PTEs installed before the failure. */
> >>> +       if (err)
> >>> +               __vunmap_range_noflush(start, end);
> >>
> >> Would it be too complicated to track how much was actually mapped and
> >> unmap only that portion?
> >>
> > I think it is possible to vunmap the range which is already unmapped.
> > i.e. in this case it is better to no to track anything as soon as a
> > mapping failure is a corner case. Also it is more reliable without
> > extra track logic.
>
> Thank you both.
> I take note of Suren's concerns. The worst case is a single PMD where onl=
y
> the first page was installed, __vunmap_range_noflush() then loops 512 tim=
es
> to undo one PTE, plus 511 empty ones.
>
> And tracking the exact progress would require vmap_pages_p4d/pud/pmd_rang=
e()
> to report how far they got. That also puts counting instructions on the s=
uccessful
> mapping path, while the saving only pays off on the failure one.
>
> So I agree with Ulad.

Got it. Makes sense.

>
> Thanks
> Best Regards
> Hao
>
> >
> > --
> > Uladzislau Rezki

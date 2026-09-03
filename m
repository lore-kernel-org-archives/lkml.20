Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FEA4A483D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439807; cv=pass; b=GGCzdYGJ/k0lv4A8ekpJwPW+TDEZ5VK/HnsxwG4lYKU/QAnbjoyq8Oqb312ownP5zgQeCeQ/QBHpofmKM6oJDX6Lb9OniU+XE9897rMSEnsx57Yy/FvRlCoua0KA6QQbrGJ62lL7r9tHBqYyUivpINcFTegrnc8d0hH6kAWFE5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439807; c=relaxed/simple;
	bh=nZAhi7JLs5DqmGCStoTBpNYdm2JT9uDBw6dn+Kg4UKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/9htkUnkBvlyDrDEFMM8D7LZIr1Kq61RWsvj1S7iARTmyMMPY9kqH4vhN/A1BAE7Ck1LjfLNt3kdqS9gz5/gYjjZFzdjcPmOOU7eOKHJqWgYJCrkNo6gLP0Iw0JSxxPDmWlg1k/amysf9mwrAalVw1UnRYrEa6pyaO94v4X1es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoPRb4B2; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoPRb4B2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995df974b3so1058135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788439803; cv=none;
        d=google.com; s=arc-20260327;
        b=PXeR7G2OC8fLYftiJgWvQyccPihqqdTyGenRSgbz7Y3zPxqiMbb2OJNbyaLMtRj/Is
         Q5ZgRPMmNTx+ApB6coYN2GWVs3AFjCiImaAk23NK+7Xda3fgJ9YrEOryzPoH+caMWL+o
         2fLeSf7ZaM5aRVldfYUl3c7AL2uEazuUjJ36n5nRGIfTwXo9TjufXsV8D2gQpc68kuw4
         APSjddHs9HrCok+ka2I7YrqwJUWglg283OJhhX9Tr6PtLEl4/d1yLY6OQlBzNfd1q8q0
         15m8z2lKRZw01CtLsjVk9LGM4Ftof1sU9Y/Q0wb/A27lO7oUI0ZDAOsUDhgrxwXZrTN7
         eFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        fh=YdWKNv3Sa6Nvf4g2jXDpmHLh+b09Y9Bbn71cQU3D5x4=;
        b=FBVlOlY4s8rlqGx4RWRYD/L8rM65syuwul7sP7271PJhHFGloC4TLDq5ohYLWR1q3d
         /6Tbe3F4U8VtE3fj0coDlMwqc0AJrKYLwaYBBfT3BuTy891hQhY7+e2J/S8Nrtorl3ON
         9R8cE0kzSyIfX7zo76D2lvdeMR6t5NhUE4HlFWd3H9p1k6swVAJLL7XzY+H10tfFDHTb
         8dx1ASYddrjq1yctSElIvdAfmZnyPGoFHJ7OuUh2+3sQuM/GdCpbOhgiDuMJ8WamVRZf
         Oy/aZBi05OJLAKezNhqXPt/Uj8wRbc+P8YS8sO4MBDiI8GgL9KEQTubREPqbQhzgSDFH
         A7ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439803; x=1789044603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        b=EoPRb4B2FShp7v5WToCJUg43cVi196hr5+vPH1YqhKnzgK+Nik+OwA7oWM6uDBRFqK
         fsHXjhHJDxgin5q3EqPbD9x+qIPl589W4bWElfGdRPG3l3srgQ/q7RvtubrxicDHxuQr
         gNY+QBMQpD2sUAqGSBDSrEa5TcXnm2272HvayK0EfJXs3//ipv2a8je5Wp17eFdAdSoI
         MeQosDn4oKhQiLrKdtKPaaYKSrRVLpw1nkwIv+2BidpOZ8QRa4FEdCpie92FjGosK1AK
         KtruDNe0WCtdGLPmoyVY6MoJex4vWasC8kvxl7gsVrUCnpousSBpVC7CzDTm+AjlY06w
         sUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439803; x=1789044603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        b=FYPHbz/aRCzQ/d/2mnw+pWFpxa2Qgre414JaWuoGxLhVWm/kygMcFzvkDfF7Pqnfkb
         j4XR919mWyMnA1WmlUJ4D3ou9S36+LWEdIZeVii505nIysApf53Bg+Vri8h4YaExWyrV
         cjrl5lPQBWMF4wUg3S9/MftOQ9Stf+d4K1tKg5TcHNjr3x3h48Sxq4olbCB/DNY89AEF
         YM+ZbP3srZURkQ7g0ytXbMvIUClfiRIaAZ9byBIrEXUQVkrv4t3QOx/OVm9mnVuiy6+b
         doGTl3zObojYHYnpFY1YDLMAiEH7N0M29MEd26R5tKPAdPhm7hNN35q8e4ljhGibsh+J
         IDqg==
X-Forwarded-Encrypted: i=1; AKwUvBxwjK+G8kJW5W+3YIS8xGy8h3YOHJZAnziYaFlSleJVP49rwzKqGIlsTz4SI1d+vZgIlfpbcpG8uOShpNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kPoVBPmGL0sL442NrHZ66iZhjeluwQglfnyy26A1uK/ncfhXI8
	aKgtl2Q3akokLKouia/9poQok0jBbH2MmY17o8iJe9n9OT5g1IU8FYodJBChIG0yxT/0UzKZiP1
	XFWrlxUZwrA5NSEaJu4qjiNvoIfZ80Mw=
X-Gm-Gg: AYBFou0JDPo5vzzd19kJKKxsszc6p7ye90SCYm8dmtrSCPFwjG1vq3Op+PEF9HO2sbV
	OlvtN+CHvfYmQ4DHC3S3oJwPcb9Wk+5DcqXApRKy+Mpa5ZVnJNForKXK64lfNuMUhkAar/YD+qu
	g6KxDbzshwqnAI3zUUpqBPPAVlynIrcZt+jDGxk+kdcCdEiInFdhDLRwufLQ5u98ba/T2az8rtS
	CrD+krGTVZAq5Ph4H3ldx9pzOoLG2u1zLVeycY/BRKH5P9j8P26qvsyDKIzqtuHQ/UhdF6+z+Ir
	KmjpvidO4GKYyLWn5fj5kx0lsYBkCPjylMRm60wNCs0xkBkRVYBs6idGBcEHwkxhJ1PZxuEw74x
	4/OYfuORDX69pjV43II3akDUmgLqt
X-Received: by 2002:a05:600c:530c:b0:499:cef6:104c with SMTP id
 5b1f17b1804b1-49ce58369f4mr98184805e9.1.1788439802952; Thu, 03 Sep 2026
 05:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
In-Reply-To: <apk8ZRr6do_YAlzf@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 3 Sep 2026 20:49:52 +0800
X-Gm-Features: AcwNN1UgFTYq7ea9-qGswA9Jf4fWjx8u_UTgGqrDxE_25OvzBaj7okOUxHJIdeg
Message-ID: <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:22=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> > The persistent huge zero folio is shared globally and should stay zero
> > after initialization. As Jann Horn pointed out [1], kernel bugs have
> > ended up writing to pages that were meant to be read-only, including in
> > security-sensitive cases. Making the folio read-only in the direct map
> > turns such writes into faults instead of silent zero-page corruption.
> >
> > Add a page-based helper consistent with the existing direct-map interfa=
ces.
> > Handle TLB invalidation in the architecture implementation; unsupported
> > architectures retain their current behavior.
> >
> > Protect the folio after initialization. Skip highmem folios, which have=
 no
> > permanent direct-map mapping.
> >
> > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > discussion [3] with Yang Shi.
> >
> > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@=
google.com [1]
> > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@ke=
rnel.org [2]
> > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9E6dL=
OULohnhBguvi9A@mail.gmail.com [3]
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  include/linux/set_memory.h | 17 +++++++++++++++++
> >  mm/huge_memory.c           | 13 ++++++++++---
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index 3fe293cfed8c..ed9ce04b18a1 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> >  #endif
> >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >
> > +#ifndef set_direct_map_ro
> > +/**
> > + * set_direct_map_ro - make a direct-map range read-only
> > + * @page: first page in the direct-map range
> > + * @nr: number of pages in the range
> > + *
> > + * Make the direct-map range starting at @page read-only and invalidat=
e stale
> > + * writable translations before returning.
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +static inline int set_direct_map_ro(struct page *page, unsigned int nr=
)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_X86_64
> >  int set_mce_nospec(unsigned long pfn);
> >  int clear_mce_nospec(unsigned long pfn);
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 54494c3fa983..742283b36d74 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/pgalloc_tag.h>
> >  #include <linux/pagewalk.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/set_memory.h>
> >
> >  #include <asm/tlb.h>
> >  #include "internal.h"
> > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> >       huge_zero_folio =3D alloc_huge_zero_folio();
> >       if (!huge_zero_folio) {
> >               pr_warn("Allocating persistent huge zero folio failed\n")=
;
> > -     } else {
> > -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +             return 0;
> >       }
> > +
> > +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +
> > +     /* Highmem folios have no permanent direct-map mapping to protect=
. */
> > +     if (!folio_test_highmem(huge_zero_folio))
> > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_P=
MD_NR);
>
> Sorry, I don't remember if it was discussed previously, but why can't we
> use the existing set_memory_ro() here?

Hi Mike,

We want to change the linear map here, but arm64 set_memory_ro() only
works on vmalloc addresses.
So a new helper is needed on arm64, and x86 implements the same
helper to keep the two architectures consistent. On x86 it is
basically set_memory_ro() minus the alias check.

Thanks,
Xueyuan

>
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.47.3
> >
>
> --
> Sincerely yours,
> Mike.

Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D8D5C613
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743490; cv=pass; b=NUgk9lyttjNwhcpzlImln5jooWqgKAnVD1hoODhKWFzTJWzj05FCfrK7LlNM+2mk9SfvpF12GBWxtStj2oCitq7toluTZvtZHMUInXdGCJEsAo0M2O5mfLUs/0ulxOI5+OVagmdBCFdvw/L+eFsKeFGj3QvHbZr4px133zSWaJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743490; c=relaxed/simple;
	bh=h6MNKbgswLZ5hyZ8o0+ggwcsd0vkDt7KmpIS3uIGh+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opB3GDKsK1dv57Un9TXZZwnZgnDf4BB9CrYW80e7W1YLuL/R+aJL+fwqUi0bXGDNQTRL0winahY8BRAZQniN+sAXfdVYmr46avuRGGdqRjSCIrGNc3iV5PeRcOdVeASfvizWiXTYBbHMjgBbAisrw5UrqDyTUe+2O/bFwZX4vek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+NBQz6U; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+NBQz6U"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so240773f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743486; cv=none;
        d=google.com; s=arc-20260327;
        b=NGGTJth9XELoq6iiaaSKKUXRD4vujs/EACUJJqxLEFKsdmz75xH0eswEAAS3fTZjwj
         C834xfzzT76I/n334wT0qTtS5Bx1n+5Visis75ofqh4gOqc9ceLXYhbkaP82FCNoThnB
         osmdxtW4aaj28CTju1JZzK1ECHFIYF/usdQ092wQw4bG3cMXQd8356hXHEBqyYGGUP0Y
         UBleDgOHkbnTEPpGEdU0VvfUUS+p8H+BxGLGMIpdd6rthrmAa2/gw7WpMc/4/lzhR/LG
         LyjpKpqtNmaRjfweENrzY6HX6VaqlRtd7rKZU06r7E60/7XegkUvqz4v5jndDcpiPV0R
         qATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        fh=ow4UucPHGTXL8VAUjdtict//6/ivGhfohibSEDOYDtk=;
        b=siL/lr5MDXxNmAxVKBP547lI9LniQI5lh+b1eWspotUkyycyrhKOMyrGVr2f0r78Yt
         AmbtFTFJNHTyyQrnBzCoyFMxe2rFShx+RToPgTsa2Co0Xz41LgddvCAoK8rVi+HxX38x
         DOcXxnl6mAntqP9Hq/PlWsbZqUF5Ph59LB0Nk+Uqz+7CjAQUWVmT69pifqKDGt76Z0fu
         AofMWzma0L/x7PPy1jXAs9cSTYyOmkrKUKMlyuFzMWLznFF/zmSDyp3qsC7JiClEh1tH
         wC56WlqTJFW7Vqy34vAg1vTKKiCV9U0hCN2NY1IsD5AwlPAdZDf5ZG45R32GWI//eHse
         3erA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743486; x=1789348286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        b=R+NBQz6UW6Kr0OrkyRMc4DA7JAU255Y+gRYsDytgQaomj4zwK9Ij23ue3B0Mj3TZTY
         wrvj8dEkEb1K00sDtEKI8q6/L7TjvV70dzYCJBzUXa+3tcMimMLWIqt9Bm+SS/NBWab6
         MlIdYhC0/6Lc8DVXj0pTzwgkKq0NpKbf5VmBgU/2j3unYnrM/LmW0bxj3t6vQ3y7U3PH
         I8iOoGgWqDOlRiaGximyORyFMMshxSR0KE40NjA5ZYS9B+mlyoUbpCH12bkv0Yze12/0
         IM+sqDlvCrt/HhXAIv/CP6XSe7ZHTOcN4K6+ubn/Li6daJxhsl0Uf2d/Mh/FDt6uhq3D
         6R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743486; x=1789348286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        b=kkEpkAvyOV/jKf7UTk19qQJtET73gWCpkoVB0KRkSVG9g/Q5epKtD8x0kUgOJ/TI6+
         XyRn6AdlBfw/TtG01V/lPuboBv3XLxO7RqY3aj/ykYK5BZxaBVCw8U1VCtwHJiDQY8PH
         5KiXVM9Oz3HfxjY7dsUS7qiQqLcMHnygRl0SxmlXD5FwUNVVBhZR5OM9I11P+QYxFJdo
         YDKD1DRQu8xknl+Lw8rzdX/j1QHe2dkRLuw+WPmo9+IFCUy4Afu8MbTgI+PQcCW9ji1j
         gv+XXGtYDm3/wVKgfv4tvMuvDvkcq1vYuUJFC7I9rBPWA27OfvfQu16kljf8yFLb8iKo
         k9zA==
X-Forwarded-Encrypted: i=1; AKwUvBwrIbShrWj7MmqjrDSXJQVnvEm7pqW4/lkL7E7IMHlGScldc41v7my6jslfaO9vqL4K9rYMN558+SgHciY=@vger.kernel.org
X-Gm-Message-State: AFuF++nVn1l2LWRKM451dqEVghsRiCERdcJl1zryNaMX89GJ7zEmWBhY
	3pODGyXIs7De3dcZtnDMQuMB/29Gw5Dy5yekAouHZ90UTD1JVgJ0B242+OdlCtAr260/EMnfR6n
	+FTx7szWw5xmr1RdYbwG2EMkU+99Ryhc=
X-Gm-Gg: AYBFou1x879HEO6vyotrCHkGhje7tBHnBHDz3OuLeWdYleVQBmvTovAZeqD+KCrvO/o
	v6ETkmHy/8whRFXHmPYid7epp7jLazSDZ8lz6vQ+mO2GgPNIp4INWWCcSm1p7VsVM5sEByrTbib
	fnZ7tJhel9Qf8oY/V4ztwNlpXlV0whlffEFmfq7nG88P7BAvfc+H+Z8zu2yAGDxT/2lVCRfz1zO
	cp7Hpvxl4Qu1YkZSyidStdyLW1eg/jYCt17lv6kRkvBuzqS/CuxV3aGbIy9ELsa1062HSLN9Pk/
	JTxf+FoS8GvVNl7ILVTnb7wYqA/IDy/UTrpMPPx6D3yYBR0PZOHjFssjXdQGL/zsPAOoJbVKypU
	lMY4PEkYSkicyQGvxjJkiybwbvgwqKA==
X-Received: by 2002:a05:6000:2089:b0:484:3313:4a04 with SMTP id
 ffacd0b85a97d-48590807e07mr10355875f8f.6.1788743486138; Sun, 06 Sep 2026
 18:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com> <ap05ue1pq3TgHOS6@kernel.org>
In-Reply-To: <ap05ue1pq3TgHOS6@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Mon, 7 Sep 2026 09:11:14 +0800
X-Gm-Features: AcwNN1WufdM6tUiTu-c39ZQdufSwNkBnDu9lho31Iod0EgTEfjYNFPqnmJIZUMA
Message-ID: <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
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

On Sun, Sep 6, 2026 at 6:00=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 08:49:52PM +0800, Xueyuan Chen wrote:
> > On Thu, Sep 3, 2026 at 5:22=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> > > > The persistent huge zero folio is shared globally and should stay z=
ero
> > > > after initialization. As Jann Horn pointed out [1], kernel bugs hav=
e
> > > > ended up writing to pages that were meant to be read-only, includin=
g in
> > > > security-sensitive cases. Making the folio read-only in the direct =
map
> > > > turns such writes into faults instead of silent zero-page corruptio=
n.
> > > >
> > > > Add a page-based helper consistent with the existing direct-map int=
erfaces.
> > > > Handle TLB invalidation in the architecture implementation; unsuppo=
rted
> > > > architectures retain their current behavior.
> > > >
> > > > Protect the folio after initialization. Skip highmem folios, which =
have no
> > > > permanent direct-map mapping.
> > > >
> > > > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > > > discussion [3] with Yang Shi.
> > > >
> > > > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20=
b49@google.com [1]
> > > > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc299=
1@kernel.org [2]
> > > > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9=
E6dLOULohnhBguvi9A@mail.gmail.com [3]
> > > >
> > > > Suggested-by: David Hildenbrand <david@kernel.org>
> > > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > > ---
> > > >  include/linux/set_memory.h | 17 +++++++++++++++++
> > > >  mm/huge_memory.c           | 13 ++++++++++---
> > > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.=
h
> > > > index 3fe293cfed8c..ed9ce04b18a1 100644
> > > > --- a/include/linux/set_memory.h
> > > > +++ b/include/linux/set_memory.h
> > > > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> > > >  #endif
> > > >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > > >
> > > > +#ifndef set_direct_map_ro
> > > > +/**
> > > > + * set_direct_map_ro - make a direct-map range read-only
> > > > + * @page: first page in the direct-map range
> > > > + * @nr: number of pages in the range
> > > > + *
> > > > + * Make the direct-map range starting at @page read-only and inval=
idate stale
> > > > + * writable translations before returning.
> > > > + *
> > > > + * Return: 0 on success, or a negative error code on failure.
> > > > + */
> > > > +static inline int set_direct_map_ro(struct page *page, unsigned in=
t nr)
> > > > +{
> > > > +     return 0;
> > > > +}
> > > > +#endif
> > > > +
> > > >  #ifdef CONFIG_X86_64
> > > >  int set_mce_nospec(unsigned long pfn);
> > > >  int clear_mce_nospec(unsigned long pfn);
> > > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > > index 54494c3fa983..742283b36d74 100644
> > > > --- a/mm/huge_memory.c
> > > > +++ b/mm/huge_memory.c
> > > > @@ -42,6 +42,7 @@
> > > >  #include <linux/pgalloc_tag.h>
> > > >  #include <linux/pagewalk.h>
> > > >  #include <linux/cleanup.h>
> > > > +#include <linux/set_memory.h>
> > > >
> > > >  #include <asm/tlb.h>
> > > >  #include "internal.h"
> > > > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> > > >       huge_zero_folio =3D alloc_huge_zero_folio();
> > > >       if (!huge_zero_folio) {
> > > >               pr_warn("Allocating persistent huge zero folio failed=
\n");
> > > > -     } else {
> > > > -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > > > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > > +             return 0;
> > > >       }
> > > > +
> > > > +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > > > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > > +
> > > > +     /* Highmem folios have no permanent direct-map mapping to pro=
tect. */
> > > > +     if (!folio_test_highmem(huge_zero_folio))
> > > > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPA=
GE_PMD_NR);
> > >
> > > Sorry, I don't remember if it was discussed previously, but why can't=
 we
> > > use the existing set_memory_ro() here?
> >
> > Hi Mike,
> >
> > We want to change the linear map here, but arm64 set_memory_ro() only
> > works on vmalloc addresses.
>
> I believe this is an historical artifact. change_memory_common() already
> updates the linear map when a vmalloc mapping switches to RO and the syst=
em
> supports it.

On x86, set_memory_ro() does work on direct-map addresses.

>
> I believe arm64::set_memory_ro() can change the linear map in the general
> case as well as long as can_set_direct_map() is true.
>

On arm64, I'm reading arch/arm64/mm/pageattr.c, and the linear-map
update in change_memory_common() is only reachable for vmalloc
addresses:

  set_memory_ro
    change_memory_common
       area =3D find_vm_area((void *)addr);
       if (!area || ...)
          return -EINVAL;

So set_memory_ro() on a linear-map address returns -EINVAL on arm64.

Am I missing something here?

> > So a new helper is needed on arm64, and x86 implements the same
> > helper to keep the two architectures consistent. On x86 it is
> > basically set_memory_ro() minus the alias check.
> >
> > Thanks,
> > Xueyuan
> >
> > >
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > --
> > > > 2.47.3
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
> --
> Sincerely yours,
> Mike.

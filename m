Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E73CAE84
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720669; cv=pass; b=Y0f1CW+OjrhQuJVAJB0y73Pcb1uKAURPt8NvLAKt1ED6uAw7OqhEuNYTl/B+iaNOak20Qg+4tYkswBGrA4v7Lj16B3c5KIdHHFGPY1g6BQWow63TgUjjBNG4PSIz+evrFlWsxp+3W+IDPjN+cc+Q6Q1M6ABkavpIBc4J5mcxW/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720669; c=relaxed/simple;
	bh=w1AmNlLbi1RI4grSq9dPIHdj7G4/aF/zTEozuQKjztg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7iux6DcJHAHvuBu92Aa6rPfJHRIGa51PgpcFuGBZMJg9Mgoj18efGkH/Jyol4e2XqTvuHRpk1akCzqNyZm5ftDbRja9sGRuXSzIPdBHIb+raYwls52RC2xtbnVDuG9NH9xpmJjSehvqXnclgeBRDrBAFpsIo6Alg65FHMVSSp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzMgVj8u; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzMgVj8u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so212005f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789720665; cv=none;
        d=google.com; s=arc-20260327;
        b=W4JDp5Y5dRxRC4bDx6SvWhS6pcrZYHhsdEwF0C2BJ44DWiCudSL6bO+eORVUJ0bYPN
         qXlFHaXu/epoky0jV7FQPM51h7IVTUGLIJ7Z1y8JnphMZkH/OFOR3u/OWwswchfFD63Y
         KdaDWda9vuvChoWXzpifogdKFZUY6mCZoQqN3RnpeZWM7ijzPh5/BUJBNfdZoxNZRWvZ
         PwziPzyBPXkzxCwt3kZK2A4pOWgce6JpwXitBVxgLaJ4xnkr/r5wm1pvXE6WZxgRbDum
         DvhSJQsT/y2khtn1lTzN49i8k5ngYhiQfAe2sVsd4MAG0PbwB1uOGTMhXH8Xu0opbn5c
         CyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        fh=9R0pqsWjzlm0350vqqmDKGilE+SE6DgL24KkP4qmKGA=;
        b=HIEjs1rogfJnJYMes/6WOdQBWvectXZMF9TbVQHQn2sWY7/Yk3QIFLyK7j2Rh9dw4e
         MiI1QmvRL4Kyis0AjM1uiKT85u53R5o+Cs5955nztpFg62HPLAu2EO/cT5RWkZ9TMYCS
         X4D020tiiWDshj7VBW4UT+zidhyVqE7wGrWsiPvHBDlZYxBzLgkPNY0ycs4i/+W0q+vm
         zwwRs8LwBVSGFoz/wdsSiZ0IXiX32sK8qSWFLwabm6Sj+Zu0hsnWZf5mCXbIldjJYHIO
         QLVeE8DiCX448uQ6vPi+bG8MvsToa0z+vx7oG8g1/ct2Qjg+8upd7unpFSUVeJfrBTAA
         Tzog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720665; x=1790325465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        b=DzMgVj8u7qaoOhuYMB7OvcjVsCXyu0UuKOZCGTp/zAdxlSEBntk7iG4qZv6sG9UysM
         v49CB1oLBgR+ZMq+Pks3wBzUZh+t2tQSSfL5Tc9gH2/0/8+2T0VE8AgMoNoCVa5pyThT
         GUn6s/2rIfXpTWY6AdETLQeUMN5GvaWFHsjgQr2sJrNk5T+zwGP8bwXuYUXzFUn/Yc1+
         KzVhYMQ2eLkFFfYzDbP2zM8HbVhoDmriE118Peg/syzG0Ka7E3bYl1NoKQS3+yfKLBRE
         YnOpXeaRo9n12IqUG4J9k/PH+oRw/wlqm9cudOXGPYGi9wSzxTMqe0OtQRzIfecbHWRE
         yYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720665; x=1790325465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        b=g/4rT+wslJom7+ACoF4yTMY+zIFgqikE/k0pReKTrfX/FZxSwpUhpbm+/+77PgWkKY
         YovAQgZq3QuBvTwAFFhN359EFHdSs2l5G9Yi+vHLfOEnJuIp7ItVokJ/0kTtqm9ZrjEg
         ZDv1a4izYq3efcqklcSaGABukKFgV/Ekk4T5x/KD1L5/XVfvQ1ZjcB2fab1+WORzmNTM
         ektmbJc6u63mtJ0JWtOHsNKRxOAOYIPVBm7pTbnNNwf64jtOuMFsjQMTQcuHiN8VkbKY
         NMoU8Tn+XeBJvWZhsE1NnpSaAKvFhPsu2TAOfam6tJQ2dlilczSv/IbXxTIRd06NwZUG
         mWDg==
X-Forwarded-Encrypted: i=1; AKwUvByXlCRrVeqnJOEfCVAlgTbFC4VpghUbuCkZdLpjl4jwbyVYjM09y9xy57JVCRMhIrI5CVMIdXlCJFSe+jk=@vger.kernel.org
X-Gm-Message-State: AFuF++lNTuV426idzTaxoUftLmXvB7MCHvyI6pRO47BLqJkbVoteCrks
	RBHcPkIy88UVF2w7zEGMj2fDe9QOeSMY6yZS3uRm/M+Xtpl+SKtjLhWHTC40sm86YnHSoayAkJ9
	uiQym7S2TtBR8I8md9Hr5WzdH+46HvL0=
X-Gm-Gg: AYBFou1oFQk+/H9LHK8N7njCZWerZW/kJQa9utGoHVRLvZyHj03laIIqZiKYwgyH3md
	CJ/yxMi5Z0nHDUFLa+3m5Njg5Zf0+FVf/DXoJIhzys07JHSBKu/7XU+P9Ia3o3reyY865TQfrK2
	VOvTBg1eYx6QZCG11j76cqPsEeMlWsFBfD6AvOyD2ARwJ876+uAQvMGbhVDCVjblFFiI1tWdvR9
	O/JlO1h9PTeiLJZrxysG6VsNwKQ0PB5vR9L2UzN5YN12Ss8dwXjeN4U0tDUoZYSN1cwkfXIONXn
	zKQj99rMbDuSViZ0XXsDHBsjrqiMGPC/QFxzr3oS5vEG+uY2QtbypdNi
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id
 ffacd0b85a97d-4871e2131a7mr2297716f8f.1.1789720665326; Fri, 18 Sep 2026
 01:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
 <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org> <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
 <24aedc8c-a5c6-418b-a37e-051f0d6d9fa7@kernel.org>
In-Reply-To: <24aedc8c-a5c6-418b-a37e-051f0d6d9fa7@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 16:37:34 +0800
X-Gm-Features: AcwNN1XBh3Wey2x3l7KbPhov9h79lwYf3qMIq1ZNnS7cqxD6HqWXu6Gr_vbTLnA
Message-ID: <CAHKocdEmb-Hsxu8FCxvzhz3XdzmrPddGo4wv6GqjeHvAYfxVrQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, urezki@gmail.com, will@kernel.org, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sept 2026 at 15:04, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 18/09/2026 =C3=A0 08:14, Barry Song a =C3=A9crit :
> > On Fri, Sep 18, 2026 at 2:05=E2=80=AFPM Christophe Leroy (CS GROUP)
> > <chleroy@kernel.org> wrote:
> >>
> >>
> >>
> >> Le 17/09/2026 =C3=A0 23:44, Barry Song a =C3=A9crit :
> >>> On Thu, Sep 17, 2026 at 10:41=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gm=
ail.com> wrote:
> > [...]
> >
> >>>>>>
> >>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>>>> index cdd68ed3ae1a9..349ced999f959 100644
> >>>>>> --- a/include/linux/pgtable.h
> >>>>>> +++ b/include/linux/pgtable.h
> >>>>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *=
pmd, unsigned long addr)
> >>>>>>     }
> >>>>>>     #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >>>>>>
> >>>>>> +/*
> >>>>>> + * PTE-level block mappings for vmap.
> >>>>>> + *
> >>>>>> + * pte_set_huge() only has to be implemented by architectures who=
se
> >>>>>> + * arch_vmap_pte_range_map_size() can return a size other than PA=
GE_SIZE.
> >>>>>> + */
> >>>>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> >>>>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> >>>>>> +                             phys_addr_t phys, pgprot_t prot,
> >>>>>> +                             unsigned long size)
> >>>>>> +{
> >>>>>> +     WARN_ON_ONCE(1);
> >>>>>
> >>>>> BUILD_BUG_ON() would be better here.
> >>>>>
> >>>>> It should be possible because fallback arch_vmap_pte_range_map_size=
()
> >>>>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called=
.
> >>>>>
> >>>>
> >>>> Agreed. These fallbacks exist only to keep the build working on
> >>>> architectures with PTE-level block mappings and should never actuall=
y
> >>>> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
> >>>>
> >>>
> >>> I am not quite sure. It won't be called at runtime because
> >>> `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> >>> reach this branch. But it will still be built.
> >>
> >> The fallbacks are defined as:
> >>
> >> #ifndef arch_vmap_pte_range_map_size
> >> static inline unsigned long arch_vmap_pte_range_map_size(unsigned long
> >> addr, unsigned long end,
> >>                                                           u64 pfn, uns=
igned int max_page_shift)
> >> {
> >>          return PAGE_SIZE;
> >> }
> >> #endif
> >>
> >> #ifndef arch_vmap_pte_range_unmap_size
> >> static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned lo=
ng
> >> addr,
> >>                                                             pte_t *pte=
p)
> >> {
> >>          return PAGE_SIZE;
> >> }
> >> #endif
> >>
> >> Therefore in:
> >>
> >>                   size =3D arch_vmap_pte_range_unmap_size(addr, pte);
> >>                   if (size !=3D PAGE_SIZE) {
> >>
> >> GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit
> >> the branch at all.
> >>
> >> It is call constant folding, some explanation here:
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fen=
.wikipedia.org%2Fwiki%2FConstant_folding&data=3D05%7C02%7Cchristophe.leroy%=
40csgroup.eu%7C869dac21f28d45988a3d08df154c225a%7C8b87af7d86474dc78df45f69a=
2011bb5%7C0%7C0%7C639253088878897551%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG=
kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D=
%3D%7C0%7C%7C%7C&sdata=3DDvtz1%2FAHvAbVYO%2BRaHTOizcD%2FclJ9FqTcWXKMhIFVyw%=
3D&reserved=3D0
> >>
> >>>
> >>> So, would a `BUILD_BUG_ON()` trigger a build failure here?
> >>
> >> It shouldn't, if it does it is a compiled bug or this is because someo=
ne
> >> has redefined arch_vmap_pte_range_map_size() and not pte_set_huge()
> >> which we'd better know at build time rather than at runtime.
> >
> > Thanks, Christophe. I was also thinking about compiler optimization. I
> > was just a bit worried that we're touching the common MM code, which
> > affects almost all architectures, so I'm not quite sure whether this is
> > supported by all GCC versions used by those architectures.
> >
> > If it is supported by all of them, I agree that `BUILD_BUG_ON()` is a
> > perfect approach.
>
> AFAIU this is the assumption made by the kernel, see
> https://docs.kernel.org/process/coding-style.html#conditional-compilation
>
> This is the same compiler, I see no reason why ability to constant-fold
> would be dependant on architecture.
>
> Christophe

Hi Barry and Christophe,

pgtable.h already does this in a few places, the !THP fallback of
pmdp_clear_flush_young() is just BUILD_BUG(), and its caller in mm/rmap.c,
a file that is built unconditionally, is guarded by
IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) rather than #ifdef. So on every
THP=3Dn build, on every architecture, that call has to be eliminated by
the compiler or the build breaks.

I built it with BUILD_BUG() on x86_64, arm64 and powerpc (8xx) to be sure,
and all three are clean.

It will be BUILD_BUG() rather than BUILD_BUG_ON(1): BUILD_BUG_ON() expects =
a
condition the compiler should know is false, while BUILD_BUG() is documente=
d
as the way to flag code that is expected to be eliminated at build time.

Thanks,
Wen

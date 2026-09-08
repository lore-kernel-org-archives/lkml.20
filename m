Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B5C550DD8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878916; cv=pass; b=EWLiDEjDYR1H7kZ4ROAPktNPJSMgHk0WrKeGqHwTUvJyk4XwkxMkXwRq8aRLJVggojiRa6NX+yzkO4pISNl6nJzvG1cF+UfJRLJ9m/Jkz9nipPk/mM8rFrHBaVfk2rVvbj2+EOPKUaJWyL110uu1TS81Dmy8AOH/SrQnv93B41k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878916; c=relaxed/simple;
	bh=EjEW2kUESRx+FlqmPNXRHTzoTzrwE2ifQQLqdnN8eXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwXegwBODzGIVodHyssd44UWYi8ay6KbWaR5gcF32p1ZAdQ0TMDjh/Du+RM4PCoNjNM7IyrPGiXopxAbjp2mkVnhVN6vF+Li9cAwPCoi2Q6jgDFnNRtqofrJLN0pilNDbcZxaopiNrvSWOQtL6+6b3xoNdO2zys9zGclCLWyl24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4xvgDvs; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4xvgDvs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b30c94so300782f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788878904; cv=none;
        d=google.com; s=arc-20260327;
        b=Dezt5QLlPoZlF2rw5/4Is4wY5unE3zbh10TCGX0/0UzlJih9+/f5/z5e+/fC8trpeG
         KEkIVhizyU8bvEoQnfuXsGZ1KCPvDkRzwz+ODTgbtGAuCdDlpzlUoDsTD/PGAyg1Sact
         EVlxd8dFr6tz6jICI+qhRcQCCrG/ZVPDkRJvOAbrYACztBjkW6J1hs+4zz5IALc2AbQW
         La65oqUsVxwPYToQ7B7cwarAWiI7AwEjQUhXJ2SvitdX4XI60uHN23nTjXWrGiU1LUv8
         KFZMaool+tuSTay2R8EcNNRwP+UUthDvHxC6QuuQyTZ2OPcPCSCFhYx/4MAp69RLVB7k
         9JnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        fh=eEkSqE2+ICSe/0OGIUi1vQsIZ68z7VrofHre+kyfTrE=;
        b=I4BlLEUJmkoSIhfGYq/183q0iDxEwK19WndJfSQSBp28ba4jfyT3uf4VO7SCuHvJka
         nJQ0Umgxe5GEN4cHWcaGyHI5YGGnvkSyd07df1foKiqgpCtv+QbvEmK3s/w3wgLFMZz7
         WU/HAc3rFvaK0wkIOm3kEb/OxGrGefWEZ/zFr7XO+UzEbfZ1giSvp+IkCkzVBSgbs3YB
         SMwqDnhYowxGtmojPTTbe7lgsu71ZhbszaBQblo/bspd2xAYudi1X4lLo6ydJ+PtgI82
         SVBKZXf1Rd3GpO3hddzt89LRnP+A4D5Krz7Prds/zBczMxxkeyVDZBUHGNl6YELBKZ4B
         1OPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878904; x=1789483704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        b=V4xvgDvsrO1ubBwHZxQog/mAIe5KyjUDn7uWl1NL2XOq7GaWFW99l8lIZkScXmIfe4
         TUdzONpkLZPRHiK+cwN2Dlwt2Xbh4Cl8dj2g14ct+kPpY9muhsozJWj2+9BkBPHlaos6
         EXhFVetoJPESV3DYAntYsoho95oSdoEQhV+4pA8RmN4LF1GjKXA3Cs6yJ5F3YbsFMrkr
         Xkid5TS/xWWkXR07eQ1cmdRNdnqfw1/W5mdBlOVMIxR5uRC1Seer8KhxTknOA19Ij6Dl
         JjYLh8IVuw/KyJ3ga+4dniOpGKGEY9cRZsx6C7f71KOXryITar0FcNMlFGIKWBh4xer1
         +aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878904; x=1789483704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        b=tE1Mt03g2q3AF8QXfSUnjBPWgQlVKboTO7OPXin84OLDCiMb1fck2WKApHnrJVIN2F
         E+UUvm0SoI+34UBFpVephAuVhcDika2AMpCupLS7bmP3qZmJJcIDW+aZxJowQdqg3MiY
         9ThXvLea2MTetyuaXJGm7KbxdhuAgqDjU4gLG9mwBF1qTDjL2fLz7IHm+pNjsgyZP2vH
         bKnfBBMyp7cucKODiKNAeMGiE8lLiXXDJsylt+ScNaQT0ADd3W9oIbEUzniL2hxt6rSa
         fzn0KDT7LSppZEzXznGaeCoaszXPEFDBnXhqDICjDYNIgMQP8V5YIBKzxcrVaUEsDHC5
         lzYg==
X-Forwarded-Encrypted: i=1; AKwUvBw2RsxZINx6TUkRb8UL0LSk3p09D1aoF61TJ1IEOBYpJzHQvVLQxTwsCOPdFowZSM3/i2VfzqtHVxaTRvo=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1KQ6d5Osokz+/7YMKrIESuNgqgXwgAoqXBthlTwFa3pNwdlM
	fIRyTyPI80d4e3CgzybCdDUJ8zi8wA059h5380fX0lfxyeYAgZhiUSX2ny0zCLjxzMtYTl2DwYR
	Scqa/hwid9yKe8gbHl+LYkqtbaNNPyjE=
X-Gm-Gg: AYBFou26nfneJasWIafYCK1gDuJfciSyv6lE0lLsiG2PYFno31lYIm59xDbSzrT607C
	z3AfIMl99LFM4EwNqlAANVuwfjq0uNmQo3zjA3ixNpTdaGwQrVcbzCG1gqIVTy7omOlRTnQ7o2E
	FvOTrAfQ/aPSkZ06m0G8yvWh8FYohjG1C24qG8i47cRE1KAKeQTGDQ/K8NHdEMcdcqGCne0KYD4
	8z9qBN0tpI8p31Aal9Il7MPoVd25jSU7glQ7FvlHqJt17DRFw4x1Kc0sVN5/BHeUTj5buVAHdxY
	u/7IyT3Wze7W0KbihGbXSjdBkzJ9p2e3IM2tAViBhP49IoRjquZWcvJJbmHSdLh8BE7KYt0cDRf
	Sm5YZkON/4I3vWzjllG25kzkDejmMjHA=
X-Received: by 2002:a5d:5e0a:0:b0:484:3200:b7a6 with SMTP id
 ffacd0b85a97d-485907ec2c3mr20932696f8f.4.1788878903312; Tue, 08 Sep 2026
 07:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
In-Reply-To: <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 8 Sep 2026 22:48:11 +0800
X-Gm-Features: AcwNN1W4h4jJ4-flD89PVNlVIy_4xMFWj1BYld6srQf6ZceGKY-mFk9Pv3akMZI
Message-ID: <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, usama.arif@linux.dev, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, rppt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:30=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/1/26 17:18, Xueyuan Chen wrote:
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
> Assuming we keep the page-based approach, can't we just move the highmem =
test in
> there?

Hi David,

We can move the check into set_direct_map_ro(). However, on x86,
set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
also expect callers to exclude highmem pages.

Would it make sense to make highmem a documented no-op for those
helpers as well, so the direct-map APIs handle it consistently?

Thanks,
Xueyuan
>
> --
> Cheers,
>
> David

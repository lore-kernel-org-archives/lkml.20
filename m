Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4973B0587
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021363; cv=pass; b=CzAUi7MKUJ0b6mh2goX8z+QF7xgK79Cs897rWZSuLfxdDBsAz27YRAf2VaK2P+fUvKELvIR6hYIhqRjhLHbdE7EYxwl8XjDneZ5E+qtU70uwyd8qgSKW0x6RzIP2X5XjrNDGqu91q1GUHq9DApImX6lvGUxQS/6KuDfSPuC4Zd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021363; c=relaxed/simple;
	bh=u7YSM2yYmhfX9rcD/8EkJwNBQeACUZpqsYZvaO8VYJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrtfS9EE68lfQEQ0A+M/rvHLQoZsIwKS2gjm/6slZt2leS2iFKKpBEsWT+vCqQK+EBtV0oaO6DLvBXv1dLws0offvSxR3hZORMHnZwVK8TcmohlFMNMqUasulEXtOk2/ZIn7MyxB3bNus9FugC8xMMTwyCOHxdsJadmDCVAo5LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaE1zHq9; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaE1zHq9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso1802405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021359; cv=none;
        d=google.com; s=arc-20260327;
        b=dAjGB5y2UWgt58cjE/dEykl0Qm6Kg5OzZeIXZlFeakn90PlAPL/ZJgiZhye6PKtbof
         RnZimLfHVeSFmjep0HYdC+SSmgMc9qVonH6lJFU4A8EarUEpsZQivobuE5W+sz0V0DUp
         AsMBHb9NQtBjK0V44PK0+JMOVMjFaEdmnKTSPm+ZvU43b/GWuNqq0G5yfifd+6Jsm7wf
         fJR6bM8xwRCBGqjxsshx/UAwXZti8Ccbc1ahIG8GU58C7Bwoq5LQrwIG01s6Dd8PCCgc
         5kr5iFwk1HjKhNTXZRCtOOwziYhDw9isINi8P2Lg8xiDAuM/3+Z/Vhe8An262to8YPoG
         i1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        fh=fhR9tf3UsyLZ1fCB1BReVW42a6JiL/Gu5w3ett1FKG8=;
        b=C+n0y8JuwUxV9vBz+SsysMDN8tamjqBD2f0xHuIrkYWF8GuKgr3Bl5z9Q+4ihCB0Bg
         i39QZZ99lUwbYEQBoRBmF5mJVl6gkvMYhK0k9H/OkeLZUsjKmgwDlXb3IwS2YBVp8Twp
         Dkf85VjyL9/SURhmcyj7zL2QSYXgIt9McXCT25CkQfXGJD/Vg5HtCtcelSnbSKToY175
         tu28965ajYLzXYHcITdoDPPcuUx6Wv2PyaytmH1f0Ud0JXw7w/SHkYYE9HhPQ17pzG4S
         ofiX0MDZo6Xiix3rAweToIA1mlB4AdTkj0fel5oIdd7rfVHaz19Vp2nXaRrlzGaLK+6y
         bndA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021359; x=1789626159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        b=OaE1zHq9IWhVZ+cN8BtkX3TasOvP9KLyydOCSFCv+CUtRirgBdTIXoECERwrKWrm7N
         AqnC+/OE4a1sfvf6I/Nw28OP/a00dpgYQB6phHC9aSTg5TE+MyjyijIwETHEmIKCm7DR
         F03cys1j1egJwmH3kkQA0/iGP3dXdQ+xIqPYdbEwnSQtmsR1svC4bkqhu9cMO47ldDmh
         lm48kFAXnyWwMx7AVkeAXZunJrnazcYuGAnn0rrXp/MT37lZE/eYX0qPgdkdaDFbCfUZ
         GAJ1HdWl3Uj6BftR3fOLjH9Ao+lMQHoXixTpD8ipxCsBhJ806XUNl+3KVfCDYub8laz9
         T25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021359; x=1789626159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        b=IyreRzTxauT8jKNiDK1TvJG5GtQIK1XJlU0p6wlKG5SpoKy4iUpImKoDXrUaDDfmIA
         wb2l5aGFkTt1p9JeZpVrPsyUbPmb284UBTsnRypsSq1WbdpQkNyXIdNq8WvmOqvdg1CC
         BU1Sv5XoezxzEBZsFfUWXr4BDtOL0A3fvXvgLuaAHndEGquW4FTFavVaSTPB+OJCMQ/V
         FGb7xitB3v4TBwgBNSqDN2i5QQiHWWyvstsCJIcuBVyRjCI9OcALwjiHqmhDbdNLZ5Yx
         IeWhex6IsHH+I/9iEZWjo4OFK91NWpncDbUWtK1PD7LlEWVYbPEWNZ1eJwHodDOiv/Aw
         PnSw==
X-Forwarded-Encrypted: i=1; AKwUvBzhXri+u73Llm/IGZVx1y0IywHZvsdzFf3NrreTTBLxsZ3FDdSJx2EDbLBKBvPezf49pWtGqAGXaQeU0xc=@vger.kernel.org
X-Gm-Message-State: AFuF++kcN73YxziCnZOaqqVXrLVqabn+4Uund4RFx3ru9arqpLRl2nNY
	ng7e4/3M5lNRtk79/WoTafdsokbXmAY2R488pjCzk8BbzhSx3Lz6VJwM1edeLcDIch3LHxLYnEY
	ymN1/GiD5uGwgik8PJyv5IwM/QVhD2mk=
X-Gm-Gg: AYBFou3IJiORM/IDV80k4vV4AEmbfmZDX/1vsrvKZJR/mKNi1fK0rbeCWBXyY09BZ3T
	kfdWUkbNYOK1aNEFzEcOqX8LePc491hyScHqnHp3AD6Js1ymNQxTzzV1yMCcmP/86KQaRHEFYz/
	cxNEhq0tLvAo6mxxmJLpWWgKae69NJ/UOq+qQ5URPTv2y7B1PgPipoagYIGMDWhgw5252bGY+5K
	KchxVINPVW8Nz9baIxNkVL8IJ/u6jwa5blW88yQpgdpx03ZtfKICkLUxZ1+Dy+MWJ5d122BGidY
	/DMx2uLVHa3f+7QM3kM2YBF7ZfjrBt7G/zuLjkO+eV20X1+S7iNvZDQ9jCSHSQLEHTkIsYFyNQm
	HA0PX+DOHSY2XVQzTNU9+JVY07887eYwlPTNJrf5h
X-Received: by 2002:a05:600c:c48f:b0:49b:9241:7ff0 with SMTP id
 5b1f17b1804b1-49d010c4f64mr283813775e9.0.1789021358682; Wed, 09 Sep 2026
 23:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com> <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
In-Reply-To: <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 10 Sep 2026 14:22:25 +0800
X-Gm-Features: AcwNN1UCOqtjDA1IEA-_iwUx-h9ia6X61kVWP5KJZ4OCo5OwMJqwEZfSFHyzJMA
Message-ID: <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
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

On Wed, Sep 9, 2026 at 11:18=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/8/26 16:48, Xueyuan Chen wrote:
> > On Tue, Sep 8, 2026 at 4:30=E2=80=AFPM David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> >>
> >> On 9/1/26 17:18, Xueyuan Chen wrote:
> >>> The persistent huge zero folio is shared globally and should stay zer=
o
> >>> after initialization. As Jann Horn pointed out [1], kernel bugs have
> >>> ended up writing to pages that were meant to be read-only, including =
in
> >>> security-sensitive cases. Making the folio read-only in the direct ma=
p
> >>> turns such writes into faults instead of silent zero-page corruption.
> >>>
> >>> Add a page-based helper consistent with the existing direct-map inter=
faces.
> >>> Handle TLB invalidation in the architecture implementation; unsupport=
ed
> >>> architectures retain their current behavior.
> >>>
> >>> Protect the folio after initialization. Skip highmem folios, which ha=
ve no
> >>> permanent direct-map mapping.
> >>>
> >>> Inspired by Jann Horn's read-only zero page work [1] and follow-up
> >>> discussion [3] with Yang Shi.
> >>>
> >>> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b4=
9@google.com [1]
> >>> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@=
kernel.org [2]
> >>> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9E6=
dLOULohnhBguvi9A@mail.gmail.com [3]
> >>>
> >>> Suggested-by: David Hildenbrand <david@kernel.org>
> >>> Suggested-by: Usama Arif <usama.arif@linux.dev>
> >>> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> >>> ---
> >>>  include/linux/set_memory.h | 17 +++++++++++++++++
> >>>  mm/huge_memory.c           | 13 ++++++++++---
> >>>  2 files changed, 27 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> >>> index 3fe293cfed8c..ed9ce04b18a1 100644
> >>> --- a/include/linux/set_memory.h
> >>> +++ b/include/linux/set_memory.h
> >>> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> >>>  #endif
> >>>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >>>
> >>> +#ifndef set_direct_map_ro
> >>> +/**
> >>> + * set_direct_map_ro - make a direct-map range read-only
> >>> + * @page: first page in the direct-map range
> >>> + * @nr: number of pages in the range
> >>> + *
> >>> + * Make the direct-map range starting at @page read-only and invalid=
ate stale
> >>> + * writable translations before returning.
> >>> + *
> >>> + * Return: 0 on success, or a negative error code on failure.
> >>> + */
> >>> +static inline int set_direct_map_ro(struct page *page, unsigned int =
nr)
> >>> +{
> >>> +     return 0;
> >>> +}
> >>> +#endif
> >>> +
> >>>  #ifdef CONFIG_X86_64
> >>>  int set_mce_nospec(unsigned long pfn);
> >>>  int clear_mce_nospec(unsigned long pfn);
> >>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>> index 54494c3fa983..742283b36d74 100644
> >>> --- a/mm/huge_memory.c
> >>> +++ b/mm/huge_memory.c
> >>> @@ -42,6 +42,7 @@
> >>>  #include <linux/pgalloc_tag.h>
> >>>  #include <linux/pagewalk.h>
> >>>  #include <linux/cleanup.h>
> >>> +#include <linux/set_memory.h>
> >>>
> >>>  #include <asm/tlb.h>
> >>>  #include "internal.h"
> >>> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> >>>       huge_zero_folio =3D alloc_huge_zero_folio();
> >>>       if (!huge_zero_folio) {
> >>>               pr_warn("Allocating persistent huge zero folio failed\n=
");
> >>> -     } else {
> >>> -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> >>> -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> >>> +             return 0;
> >>>       }
> >>> +
> >>> +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> >>> +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> >>> +
> >>> +     /* Highmem folios have no permanent direct-map mapping to prote=
ct. */
> >>> +     if (!folio_test_highmem(huge_zero_folio))
> >>> +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE=
_PMD_NR);
> >>
> >> Assuming we keep the page-based approach, can't we just move the highm=
em test in
> >> there?
> >
> > Hi David,
> >
> > We can move the check into set_direct_map_ro(). However, on x86,
> > set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> > also expect callers to exclude highmem pages.
> >
> > Would it make sense to make highmem a documented no-op for those
> > helpers as well, so the direct-map APIs handle it consistently?
>
> I think getting something consistent for now is the most important thing.=
 :)
>
Hi David,

OK, I'll move the highmem check into set_direct_map_ro().

Should I also update the x86 set_direct_map_invalid_noflush() and
set_direct_map_default_noflush() helpers in this series to skip
highmem pages?

Thanks,
Xueyuan
> --
> Cheers,
>
> David

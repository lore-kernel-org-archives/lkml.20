Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794348382;
	b=MbiqbwO8RK+zxCBDthMiNc2agKeAdRv73qVFjFfraVRh6JxSnKFcBUoZNQYh5jx3QV9l
	 nfOqlQWRrO/nMzzX3WG04RVjNJbkvhIZiSnM5ajXAGue61cv5oYWcQa8rpHF2cbs3ffZJ
	 fL0aGaLuqybcDgxptvxXR+OKDOR1qYRQwlzWqhPIO3NVkZeC68ihhwCkiJrIqdbFczr60
	 E9PWjc2pBsg3SXusVyIehVvHuC1+dSqvq6UV/9IituXxn49l21IJwJMKNAUJLCDgs9Xu0
	 LNmeuGofHMcU7f4w1iUcqH1g8sak7C3NGqmANs84+Ic129wh0kHRjDa1vKxG30W/hBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
	b=3eBWO6EeyOA+J14aC3a1FG6vyJXu5hoJhSNZr8tDCwtoOVb/o5clzfQJZ2a/R99lwZz7
	 +7N5EivMwvW5VuV86Rw3h4AR37thR3eGa1LvPcOGLKzluMC1buXfZAIfcladdGX9gNVib
	 d8PJHm1CDYBqU8EMTuP/ot9Ie9XDp9dZ5GJvZ3gBHoV2AXFmRnSYw+d02sscnWGAf0dKl
	 ArtryRN/gVHpKNnDN9kewcIGMX0dICBgWk6CJ9T6+BKdEG3nJZnPXmQinD00afqCptQO/
	 R0WtiwfJWRmfE6yH7Wwa1y9TOh8RKjiGyPlxcb0y5EBTJGBZE8KU8YIe6h4pR3Kq49A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GMD1jEBZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E87A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GMD1jEBZ
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c43373ae89aso215607966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348380; cv=none;
        d=google.com; s=arc-20260327;
        b=B0+Ad2oGrWEipwaGVXxukSt1i4J6X8KoFpBBI9MdT5jQugsL6dGLFzCkOUqi7j54vD
         dPidQ6Ce/MV6Ax6uZxVLionaGKPBrEEAu7ZvZxiC42CPm04xoDSmB3PgTAbdqHaZy4jx
         6Q8QPbKiWjLQJz1gc2D2Im+YsUg37z50H0CHoA7r/faUlL5w6m3wmmJbk64xKIFWi8Kc
         kkfTJ2CtdTq5EdSjFCNeEFd5ls9sqWONvnizimJ9uWnaXvTPyDXIJdl8grpgFg0LwAgS
         /O06Uf9tl3jWS/lvLyXuIWRJ19bTmoLRxbifnF7YJw83p02f3Kz7Xk0u7HrJFj/7qpIs
         9+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        fh=82pPmCYNgjdrcOTZ+Lhap4av6oHYeHiXOCm11xfHLo4=;
        b=V+GggrY4hhBx3+yAU2h2h5SdlsScw/KRkKfjMyNCyqfF3TohHOxT55K7etEoP26JPs
         jkTzlODXihxA0Jg5vljLjPqwlcN+B7vwnBIJk8/IkE9UOq1EGmjcTJJeTt/q3mto6XSz
         OfwEGb/Q7BFGMCqZT/ngtiIApB7ea9NODlJ3vywU28e9aDTELLeWy4tTAszzkiShAChW
         Vp8AxtPli1DhQ4K3J8/90zg19mJWNr7kkps2AX0Y1TWSlkPk2/BitnDwAmGnXVAsI+v4
         jZkGs13FL0Pn0serki/Vrh5HS8KpSBESbNdFbrwje3alUZF50+7QIh4XXxuQOJ+w3BMO
         fx7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348380; x=1794953180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        b=GMD1jEBZL+Z5iJw7/Xsnf+cOJA/6zRwxZLMvpfZTROyD1mjZbTC1TmbDVTJ/MKCaV8
         ixhmJ18T/RZm+FGKRcRs2v1h5D2Jss8etEoNiyFTx13HA5zN4ge9X4Y8onPauXESuOWl
         r4QQerxkW463yeRqaEjAfgk7yGkQxmdGOYmX6BzRFlktJYZPqVIiMkAjjp19c5QovLVZ
         RGEy5lYyqX5gcBa0jqSri+eyXD6KmKkKxh3WrNvdbjE1d2kQBn2cp0ddCZFMhCZGpzla
         a8Jm9ZE4978SSTzw3uwH0fcOfxxqgntd8qqOusacyAVdgXh3n+yXQvBZfLA+4UqkLuta
         s3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348380; x=1794953180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        b=r1uBXRxVm6271VuKf1IV6+jCrid4JTqAzlgVXMeLazhjXINK1fPT5pINrMb9szxZ5a
         YazXXUAfAF+8DdB9JpDmimTnWfFkQ3piaHN3MqAlZy30yGRiD5rrrptLdPsxkifvr2uJ
         9QWmGHydECmRIWRxDHVVf3KzjEpO1+4qPkBKKnExzmgIf5chos9VznPFqILXusKoIqn8
         kGzSjNXuzbChquNTB1HUbgBFpbdp7mz1ahR5NxfwHCKj6FO+chMVUnOlkjWZkOdncCsv
         fV+LdPaWkV8tiymes29S/m2z9PZsM8zrysPJm7QuilM3owlRqc1x6+bfA/m82sbwLFMj
         2aiQ==
X-Forwarded-Encrypted: i=1; AL+hErEX5nxiiOPaM3GGLVaHKFxjlRPBC/1jAoPYjVTXBNoEl1D5063ryHR70JYl3jqBpshF6mcmjg21tG8JksE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GxWc5ne3kOvjayjK2trrLgt/MHfURMc4y1rJIY4CzuaQaCVQk
	AaIbrHtZP+d9EhG/IWlRK4eQvUAwYRxsfQMJ9T0MnUr/CtoYuk61TNYqWhkNujhBgkt7zBymDnJ
	/7WVpKSr5C7uUdOMcbD/N3nRQWppZEmrDcr8KPA+F
X-Gm-Gg: AYBFou2mHI72H7c6gSVTZE/NQSAH+qSnLclIOUwYG/y3m1ARP/w6GxJoLg7v3IpCFzI
	K4BIhzPYG74Am2GgTQ9RtFkvGkB0VjXylREvbmqj8U8Zrh9pcndUjOHkmqovEgEqQ0lztOvJgB1
	fvJ7UAFWJvPPk9rGG5Bi5S657YMDfgt07Sb1iSkQjN8AMjwOckxqSf20v21DZwNx/B0sex2colh
	2w1DqTVhwFVehtPSu4Ne7TgqBF5KUdieljcWs1pFxouvkSIu9nv3APP4qMH7A8/XhdVE4HvQdht
	WpWy5pMI+v54MgEPkR6aK/65tT+3TAG7AepPpPnx/wbVjX/QAu1+1KiI0qsOncmHJrpA+i5JBiq
	hTRK0NM98CvB46gHbaV1NIx774nuz0OnEFnGA7IsiwbxgK5H6qu+VEuJnvo5jGneIPCYmnLt529
	mBU/am6CqA/Ef5YtlWgCDBOAQ50D4wYRgIdcLK64YaPtGChRsFu41rdG6fAd60LudTiCYU3FGzm
	6i23km1
X-Received: by 2002:a17:906:794c:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c5066b6baa7mr35192566b.29.1794348379456; Tue, 10 Nov 2026
 14:06:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-7-jthoughton@google.com> <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
In-Reply-To: <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:05:42 -0800
X-Gm-Features: AclHuK9DP4E2SNlLaTNdiTkQr6q6QZ9Qonb4QaVlevADmVOep5O3eB7CHyRgUcM
Message-ID: <CADrL8HWepp70MNhsBgAhJsLbOW=ZqEWbKSuc9CUA7oLEpPT5sA@mail.gmail.com>
Subject: Re: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:44=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > For arm64, only some platforms support HVO. Add an arch hook to prevent
> > HVO from taking affect if the architecture lacks support.
> >
> > It may be the case that arch_supports_hugetlb_vmemmap_optimization()
> > returns false at first but eventually returns true. This is the case on
> > arm64. When this happens, bootmem hugepages won't be immediately HVOed,
> > but they will be optimized in prep_and_add_bootmem_folios().
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/asm-generic/hugetlb.h |  7 +++++++
> > mm/hugetlb_vmemmap.c          | 12 ++++++++++++
> > 2 files changed, 19 insertions(+)
> >
> > diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetl=
b.h
> > index 635c41cc3479..8d24075d53d4 100644
> > --- a/include/asm-generic/hugetlb.h
> > +++ b/include/asm-generic/hugetlb.h
> > @@ -128,4 +128,11 @@ static inline bool gigantic_page_runtime_supported=
(void)
> > }
> > #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
> >
> > +#ifndef __HAVE_ARCH_HVO_SUPPORTED
> > +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
>
> I suggest using arch_support_vmemmap_remap (see [1]), which can also be
> applied to FS-DAX.
>
> [1] https://lore.kernel.org/all/20260903122128.12264-2-songmuchun@bytedan=
ce.com/
>
> > +{
> > +     return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
> > +}
> > +#endif /* __HAVE_ARCH_HVO_SUPPORTED */
> > +
> > #endif /* _ASM_GENERIC_HUGETLB_H */
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 3fdb1e4ce1a1..8596a462fee6 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -16,6 +16,7 @@
> > #include <linux/pagewalk.h>
> > #include <linux/pgalloc.h>
> > #include <linux/vmemmap-optimization.h>
> > +#include <linux/hugetlb.h>
> >
> > #include <asm/tlbflush.h>
> > #include "hugetlb_vmemmap.h"
> > @@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const str=
uct hstate *h, struct folio *
> >       if (!READ_ONCE(vmemmap_optimize_enabled))
> >               return false;
> >
> > +     if (!arch_hugetlb_vmemmap_optimization_supported())
> > +             return false;
> > +
> >       if (!hugetlb_vmemmap_optimizable(h))
> >               return false;
> >
> > @@ -731,6 +735,14 @@ void __init hugetlb_vmemmap_optimize_bootmem_page(=
unsigned long pfn, unsigned in
> >       if (!READ_ONCE(vmemmap_optimize_enabled))
> >               return;
> >
> > +     /*
> > +      * Architectures may return false here but true by the time
> > +      * hugetlb_init() is called. In this case, although the folios wi=
ll
> > +      * not be pre-HVOed, they will be optimized in hugetlb_init().
> > +      */
> > +     if (!arch_hugetlb_vmemmap_optimization_supported())
> > +             return;
>
> I plan to add a new helper, section_vmemmap_optimization_disable() [2],
> intended to disable vmemmap optimization in the architectural vmemmap
> population path. Since arm64 does not support section-based vmemmap
> optimization, section_vmemmap_optimization_disable() should be used there=
.
>
> [2] https://lore.kernel.org/all/20261107043122.25650-3-songmuchun@bytedan=
ce.com/

Thanks! I'll integrate both of these into v3.

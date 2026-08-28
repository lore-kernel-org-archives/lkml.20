Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98C3D6CC9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952272; cv=pass; b=Yqp10JlydC6oP6tb7iO2MOy29pbMQtpM218g93Ts+FVDL5rCxJNxx4OGeQWLJ1bFdvPj6MGMIHLshISaa5rZQbWC0wkOKbbvDxnYf9lg48bTKp79VWnn5nsX8ctphDjP16vXINsXy7hK6WSm7vjz7cRHJaBMTTkMTgl94kN5Rpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952272; c=relaxed/simple;
	bh=Ffm7RVhrdDVlNhzoQ5woLWmbwnD9sMc+g/XWethDSkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/+1BMW/STu7S/qN/zwofKI5whfeqT2gb8LYYXvEMtZ81RWBF4GE4D+b6b/2Fus+WWIlf36jNxcdNHeHlgYY3ZU1QEkPWhOKccy0gNEg9Jl8x3MV+9sNSiolTCOB01X4JAZAu7rrI6WZ2MmPFP5krmlMJhspEyMZccOB/dEPQrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aml4Mys8; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aml4Mys8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52faa58bff5so65311cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787952269; cv=none;
        d=google.com; s=arc-20260327;
        b=fGPjFuAK9hsGSLkhcbxtVl/3oV4PwYFqh2YGDuPBw8twN0ipbPEoZZ/C4O5yGX2h+S
         QFRGbpCOBARRxBow9tsFwT4YFDYtFLupHw/ymwyt030OKtyUMg5fVYy3ZXuiRMtdpySB
         RqEFROl1wC9NQ4OwOi+1xqcqXJJWPBw+1T18EgjlebcgoSRClwmRw0JjIcd7vJvOo2m2
         RFCxKK0rHQOnO7CbNxDWblEfEpj23R0hI5dTlAa+zxrrP2IwIunALKCR8aq/Uf0aNbpZ
         gCZLL8q01m+QGYKr6iX/SIZjQ3qlX0qpH+S6A5O8Fo7hX1wJfxV+SWUUMT1ysE6wCgjE
         /q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5bRhAW4BZGTRB4QS3OBjmnWX2zYNUF8sCy1+AA5KEE=;
        fh=jcW4DGMaA7gbyun2HLcWXEnCvPG3CrXlsvEsvCLNXlc=;
        b=szyGQv12tDazO9QDlmpaKtyz6Vpgvl6JG5rHBso5SVAmPlhJ2dmr0zUmmJidP2Yu+z
         wyaIHpkzPmbZ0lFzb0UDW4c8qFTUrluuCfW9T/LjXLHW48ix/FFqDxBsbyTxVs5dhTFL
         uCAvrA43WHqcnOSQ8XppmQV54QPuovW2SaG96BMHnP9dSjgGsrHa60+YMZFM2z3GVjAk
         AeBSdrrx+7sGfs+xm3c8NuUPXfNm66BDIRLyaXY12kYMH6lBpOZTtaeDHNJMWLUQZlaw
         /6MHrkBjJOmgMVfNma/tu1EB1jvU0qlWyBs0RUYqHe8wMyC+URnNaVmBxiLdqNRFhVxS
         W3QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787952269; x=1788557069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5bRhAW4BZGTRB4QS3OBjmnWX2zYNUF8sCy1+AA5KEE=;
        b=aml4Mys8UCFomYkGul/Swq6fcz/YzQNh2lYmmyaUZNlvpfg6tMaW+ruBcwq3MCiwM9
         R1B+nDGFw/V4806ppbms5mhWz4I/x7m5IhlOMuYgCFr2Jda9XKarq5DAuQlspQjiI1W1
         7t18n0c7Fj4yM9WiiELVSLrHqT6U4VWprn20U1xehNLrxbqX3bFBzpDev/IsMjMuUYAP
         sDZzz72wAL8CWTJdA/0pejFWoEzxaskdbg3fJOV8rboJ4hUeOJvgRM1o9AnSdH9E6hZF
         SN+VVHAMAa0jEys4sLrMpwPLqnENB7broZ+r3Jc2dpZMbkb4JfrICjjt6yK6MGlt/gqn
         zljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952269; x=1788557069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5bRhAW4BZGTRB4QS3OBjmnWX2zYNUF8sCy1+AA5KEE=;
        b=egnkWeTnIXPscMOq8bHHQqAMia6gp8HewTMQ88YFaNh0mnBDVwDqKE3dIISY9aGPt4
         pe2LziEHASC70zLV3NFmriMMknfhOqKBERdkto1+jw/SS/Z87sFjUbByLLtXk4eqHyQk
         OC+dwlnoz8Reimo5DmBqHnkUJvTeqbs2u1p2ENrDdGqHAzy6joGjJwGm6K9FJQ3ZGf+D
         /1uGiKRx4HTWnApdz5LwNr3eU6Y3qQRuqYFMOhZDQSXG5qDXL0gROL0lCVhpRMgLVPpR
         qpW3Vky6wL9+oY9SQhbX6/GO/ixm/GxJPSgV7NKczwBApJOadijdlIKQ5DXFXxrI6vZp
         uUUQ==
X-Gm-Message-State: AFuF++nw4ZHPVD32lgHLK85QIkhmQTwaxvUU//Jo8pH8VqRnKxphBkwk
	EapqcoV583Rk8jTLHF+htCvLtUk+RAlvYZTAiwzQ4S12KKmFJhnNO1eDN+NrPodkcBS1vHOXouP
	Br/fy5DqqNi2uoBYg86LxBUZBXkseQWPLCIiIog5j
X-Gm-Gg: AR+sD124VUMRIMAGDnAelIFa0NHf5A7zWVc987sT0OXPTapAziaY5obz0FIPWH+NBYm
	QPyKYAlM0K+oP0SmA6cKwzHYz6Ffhg92KzeriujAPFcVTVDhiNCMHJpK26knINzRsTIn/1Nd6bG
	iP4wN2Y+73bhGAuViSKg3O5g6gGNkhBC2VwE2eqlMiix5meB4Xyh6M2YNs9nJOyhafLxaFWatge
	4QkaHiY5Zj7AxsHO254g9PsFF91aHszEJWQATogCOHOsOXlV4FLBDLnDPZxQeF5vVfXvlOmw2fp
	4xXi9qU8Vt83weuRFv7nwXDYN7K093V5pvSt/+JdAZo=
X-Received: by 2002:ac8:58c5:0:b0:52d:9d62:6163 with SMTP id
 d75a77b69052e-52ff715f2cemr3483601cf.9.1787952267794; Fri, 28 Aug 2026
 14:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-2-riel@surriel.com>
In-Reply-To: <20260811025157.1632867-2-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 28 Aug 2026 14:24:15 -0700
X-Gm-Features: AcwNN1WD4nMWnH_vAAvC-6nH870HRFxLAtQC4csfA8OjXMF11JErzAmHFOM2MwE
Message-ID: <CAJuCfpHwPj9DtcsiaN43ofWgur0_ATGEhqQBqzezYZRen6TC+A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/8] mm/gup: break out gup_fill_pages() helper
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 7:53=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> __get_user_pages() fills pages[] and flushes each page's caches in an
> open-coded loop.
>
> Move it into a gup_fill_pages() helper, which the follow_page_mask()
> call chain can then use to fill its own pages[] slots.
>
> No functional changes intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Rik van Riel <riel@surriel.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/gup.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 0692119b7904..7bb40be89529 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -633,6 +633,23 @@ static struct page *no_page_table(struct vm_area_str=
uct *vma,
>         return NULL;
>  }
>
> +static void gup_fill_pages(struct vm_area_struct *vma, unsigned long add=
ress,
> +               struct page *page, unsigned long nr, struct page **pages)
> +{
> +       unsigned long i;
> +
> +       if (!pages)
> +               return;
> +
> +       for (i =3D 0; i < nr; i++) {
> +               struct page *subpage =3D page + i;
> +
> +               pages[i] =3D subpage;
> +               flush_anon_page(vma, subpage, address + i * PAGE_SIZE);
> +               flush_dcache_page(subpage);
> +       }
> +}
> +
>  #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
>  /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
>  static inline bool can_follow_write_pud(pud_t pud, struct page *page,
> @@ -1461,9 +1478,6 @@ static long __get_user_pages(struct mm_struct *mm,
>                         page_increm =3D nr_pages;
>
>                 if (pages) {
> -                       struct page *subpage;
> -                       unsigned int j;
> -
>                         /*
>                          * This must be a large folio (and doesn't need t=
o
>                          * be the whole folio; it can be part of it), do
> @@ -1493,12 +1507,7 @@ static long __get_user_pages(struct mm_struct *mm,
>                                 }
>                         }
>
> -                       for (j =3D 0; j < page_increm; j++) {
> -                               subpage =3D page + j;
> -                               pages[i + j] =3D subpage;
> -                               flush_anon_page(vma, subpage, start + j *=
 PAGE_SIZE);
> -                               flush_dcache_page(subpage);
> -                       }
> +                       gup_fill_pages(vma, start, page, page_increm, pag=
es + i);
>                 }
>
>                 i +=3D page_increm;
> --
> 2.55.0
>
>

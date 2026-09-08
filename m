Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3F46D096
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902405; cv=none; b=ibjiyi0lz/sapbcho3D8wZZ/FRsi0xKedYphCYqFXELyPwM8NtrnPILSTbcAuqyEwrCxAFP1sSYL0/DRuV9sqWfMVxDrd1rtUX2vXgzSmQi+5GfNqFDYhzWi3YCjriGUrM6eiSdWgtUpmzAsRYTXwx5fk8K/bj6BNKiU3RG8gX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902405; c=relaxed/simple;
	bh=WNx7grUyrXd/Qf7H6U0NuiaaHE3LCw+XrbMY2e1QIl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArI1N+IrrMKQ2YIWUVQqCAvMsE7f4e6iXgaAkfrgYPJo8mc5EIWOeJ6YSlk51GrNoL5mIHmi1gNwOvIl4DItexlnWSSh+mgvLcMN24a0eh7gABwb/bN2+oE4VPzCTzwdtHiLCRuG+DNp2x5TQHaC7JpRNEzSrkWR5tkRDzbfzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJV3Qpn6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJV3Qpn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AA31F00A3A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788902403;
	bh=e+kWUX1exzkxU//WAYyZ6ixFfPsQgajcokXyzTZtSKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HJV3Qpn6gdUCh1+ByAQcOfeoH+K/kD1W6Tq5KIBHvbNDc4SO4VeKwjD02Lp9cH+vj
	 hY7ZCFfjcSFjpFaTp3Iht/6EMXA8GJuhJ5FMG1PeDO4ISaTDR3m/Mj5pv7++tNWeV3
	 jQXJV9hvbfCs5aIUO6xZ5ZZVpD3FuGGcBao3/1Uev9xYOfuO/oU3WpcvjRQrzzsXu1
	 oM+Rpo27tny17tUlSb9c9s7aMepSo9GwH2kpBRdTSpkCxl7jAQJiTKfFipLyyWAtst
	 PzchR6cTDYatzFaBRIIJXr08LlJGr34YxKfNL2wVJs3+6mQcf/f3DxqnXdvSSVFT43
	 3zlB7gkEBamiw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92ed3993c1eso300082285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqEa78M44faXPxiB6Np7GiuWIJIWIfx9JVLsxx36ZkkrGknULoSXfbGPtOLgbNqaMTVWLib2FsoGG8BKc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6noo9CNDycYn3jugIw1PSoj6zkOLSdgyURZMrvvPkSsigjQNE
	oqEjiwWhOa4pRT5TvhNLn8+L6c7YO1hpr1oEp84e8ifP64n1FJW7ZtaBgRGgsfMazmnKo4rPLzg
	LfBRo4C4qKadp5sDZSNIVzLXQpjyg3g4=
X-Received: by 2002:a05:620a:4447:b0:939:6de7:8765 with SMTP id
 af79cd13be357-9398053e226mr3476135085a.44.1788902402551; Tue, 08 Sep 2026
 14:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-5-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-5-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 9 Sep 2026 05:19:51 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zWPXoJ5kiLoVcq1YHv6WcmjPEssTUs4OT15iNRob3_rQ@mail.gmail.com>
X-Gm-Features: AcwNN1XMlHQ4kIf4w3yU6YWkeL6zZI7VtvME4bhHsSyU0Aq462ay2o5j9LBnGs0
Message-ID: <CAGsJ_4zWPXoJ5kiLoVcq1YHv6WcmjPEssTUs4OT15iNRob3_rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] mm/rmap: Add batched version of folio_try_share_anon_rmap_pte
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:44=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> To enable batched unmapping of anonymous folios, we need to handle the
> sharing of exclusive pages. Hence, a batched version of
> folio_try_share_anon_rmap_pte is required.
>
> Currently, the sole purpose of nr_pages in __folio_try_share_anon_rmap is
> to do some rmap sanity checks. Now, clear the PageAnonExclusive bit on a
> batch of nr_pages. Refactor the function such that the clearing of the bi=
t
> can be done at one place without duplication.
>
> Note that __folio_try_share_anon_rmap can receive nr_pages =3D=3D HPAGE_P=
MD_NR
> from the PMD path, but currently we only clear the bit on the head page.
> Retain this behaviour by setting nr_pages =3D 1 in case the caller is
> folio_try_share_anon_rmap_pmd.
>
> While at it, convert nr_pages to unsigned long to future-proof from
> overflow in case P4D-huge mappings etc get supported down the road.
> I haven't made such a change in each function receiving nr_pages in
> try_to_unmap_one - perhaps this can be done incrementally.
>
> Add two WARN's: check that the batch is entirely exclusive (for PMD
> callers, need to check only head page), and that there are only
> PTE/PMD paths converging into __folio_try_share_anon_rmap.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/rmap.h | 56 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 39 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 0b332770abeed..320f9f14f6020 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -706,17 +706,23 @@ static inline int folio_try_dup_anon_rmap_pmd(struc=
t folio *folio,
>  }
>
>  static __always_inline int __folio_try_share_anon_rmap(struct folio *fol=
io,
> -               struct page *page, int nr_pages, enum pgtable_level level=
)
> +               struct page *page, unsigned long nr_pages, enum pgtable_l=
evel level)
>  {
> +       /* device private folios cannot get pinned via GUP. */
> +       const bool pinnable =3D !folio_is_device_private(folio);
> +
>         VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
>         VM_WARN_ON_FOLIO(!PageAnonExclusive(page), folio);
> +
>         __folio_rmap_sanity_checks(folio, page, nr_pages, level);
>
> -       /* device private folios cannot get pinned via GUP. */
> -       if (unlikely(folio_is_device_private(folio))) {
> -               ClearPageAnonExclusive(page);
> -               return 0;
> -       }

Somehow, I feel the early return for
`folio_is_device_private(folio)` is more readable. Can we keep it?
Then we can avoid many `if (pinnable)` checks later.

> +       VM_WARN_ON_ONCE(level > PGTABLE_LEVEL_PMD);

Maybe the below would be better, as it avoids depending on the
exact value of `PGTABLE_LEVEL_PMD` and above.

VM_WARN_ON_ONCE(level !=3D PGTABLE_LEVEL_PTE && level !=3D PGTABLE_LEVEL_PM=
D);

> +
> +       /* We only clear anon-exclusive from head page of PMD folio. */
> +       if (level =3D=3D PGTABLE_LEVEL_PMD)
> +               nr_pages =3D 1;
> +
> +       VM_WARN_ON_FOLIO(page_anon_exclusive_batch(0, nr_pages, page, tru=
e) !=3D nr_pages, folio);
>
>         /*
>          * We have to make sure that when we clear PageAnonExclusive, tha=
t
> @@ -760,29 +766,38 @@ static __always_inline int __folio_try_share_anon_r=
map(struct folio *folio,
>          * so we use explicit ones here.
>          */
>
> -       /* Paired with the memory barrier in try_grab_folio(). */
> -       if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
> -               smp_mb();
> +       if (likely(pinnable)) {
> +               /* Paired with the memory barrier in try_grab_folio(). */
> +               if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
> +                       smp_mb();

If we return early for `!pinnable`, shouldn't we be able to avoid
this? Is the reason you don't do the early return that you want to
batch the `folio_is_device_private(folio)` case as well? If so,
that seems sensible.

Is this a real use case that you're supporting with your patchset?

>
> -       if (unlikely(folio_maybe_dma_pinned(folio)))
> -               return -EBUSY;
> -       ClearPageAnonExclusive(page);
> +               if (unlikely(folio_maybe_dma_pinned(folio)))
> +                       return -EBUSY;
> +       }
> +
> +       for (;;) {
> +               ClearPageAnonExclusive(page);
> +               if (--nr_pages =3D=3D 0)
> +                       break;
> +               page++;
> +       }

Maybe ?

     while (nr_pages--)
         ClearPageAnonExclusive(page++);

Best Regards
Barry

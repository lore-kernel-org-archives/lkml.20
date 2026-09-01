Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9544CCDE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241783; cv=none; b=SkIHgcGWNsI31ED5bzV2wBd2g8hcYP1jMkKKZ0w8Fc485ksnr5dPFFER2g4NOHGUHmVhHEYrMbOOfuxTDnvic57H9idbsnjJpE64sAhp69wTT6RhJM5zwz7aQOI2+zMOoh6cYkdDhS3N6n2LmI6s6v9vDYl7gq3r1pQDFVP9Vw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241783; c=relaxed/simple;
	bh=cR2/nBrr7QTguM02vZZVJbvN1iPD2t17brzz5CV+DJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=no5yT5q6/9bClWckLLqGIK1BFkpS1vc4nPnHNEljzuKFqgoyUW2F3Uwx+LEbVSD5RV1W+cAqOkqrexFTFxlE/4cMyhJUozvUsbGYQU1QPUa1E50qjHr+rsv+wpcISK8WEB/2JtCiynvGt4r1UQ/fvStwzpIJyi4xl2lJusNoGKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOm5pX/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOm5pX/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44B91F00ACF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788241781;
	bh=uYLfDNhDWWaiAca3YsvDlwUL0hP6uL2nUvfLd7YMwqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iOm5pX/1JGT6og1tC01LvrFRUmLHS7UcCU2wNRh7rtdA1z6kBAI35mPLBXTVnvbwz
	 QWJ9MMaiWFzlxIF8ATKVzHRFvJuk/Nx+3qXfaFTyrN4tXTmQr74moa68szFvMvP0hx
	 IKGR2NpY00zyXCUXlgtcaV5BXFY7pCG95YWIK6IhV3gO+FXbGnYNkIE4CSfAAFEvqO
	 Es5U/sJfI5Hyn8bmoFseqphvnlEEdxgPFd1VtKi8kTHuNKRAp+twjL2mqWhtqwqkQq
	 fy78I6TyxUtPefMB0H0NUXjPiIfk6bvKx3Cw9kQz80iYenhGULtMt/6f/90a61Bp7z
	 XWm+Fx0FDf7dg==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9371bcf1f8fso309460485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpbuKJM8i9deI3yrbssGlo1i1nIUqSEsBgSG629/HZ2X3pkoLXSBfFVfLzYNaejxtGSym/6ygoqKa4jR8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m5z4HPxcZcJYZ6JeK14sc3uzBesMFhFc7CPCRZK5KkFg3Xh6Ml
	gTtYB1uA+ozjx5vNPoILWyT8S+WDcOBVYKd9zYmhtTvNfnSI4WnDfXY7RlCjE5JjxHSCQGX86C7
	kJeKpB012oslukVAAUwLR27bSbZsfes0=
X-Received: by 2002:a05:620a:72c1:20b0:939:124c:b7d8 with SMTP id
 af79cd13be357-93913799c53mr2764427185a.18.1788241780772; Mon, 31 Aug 2026
 22:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-4-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-4-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 1 Sep 2026 13:49:29 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yGFBRv-C3UV-G1tB0HUmhVvJL6ac5x_Dtu9NSGk9BGzw@mail.gmail.com>
X-Gm-Features: AcwNN1WUPeFIq5gB7k0X198Ne-gqn5RAagtInfIzkUUme2aYxDr3aJIXcRpjR3o
Message-ID: <CAGsJ_4yGFBRv-C3UV-G1tB0HUmhVvJL6ac5x_Dtu9NSGk9BGzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mm: move anon-exclusive batch helper to mm.h
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
> In preparation for optimizing large folio unmapping, we need to reuse
> the page_anon_exclusive_batch helper in rmap.c and rmap.h and obey the
> existing use in mprotect.c .
>
> Therefore, move it from mprotect.c to mm.h. Gate with CONFIG_MMU since
> both rmap and mprotect users are built only for CONFIG_MMU.
>
> While at it, change start_idx and max_len to unsigned long type for
> future proofing against THP support at >=3D PUD level. Also shorten
> expected_anon_exclusive -> anon_exclusive.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/mm.h | 19 +++++++++++++++++++
>  mm/mprotect.c      | 17 -----------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dd09c438fa23e..63da8813bc5df 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -244,6 +244,25 @@ static inline unsigned long folio_page_idx(const str=
uct folio *folio,
>         return page - &folio->page;
>  }
>
> +#ifdef CONFIG_MMU
> +/*
> + * Get max length of consecutive PTEs pointing to PageAnonExclusive() pa=
ges or
> + * !PageAnonExclusive() pages, starting from start_idx. Caller must enfo=
rce
> + * that the PTEs point to consecutive pages of the same anon large folio=
.
> + */
> +static __always_inline int page_anon_exclusive_batch(unsigned long start=
_idx,
> +               unsigned long max_len, struct page *first_page, bool anon=
_exclusive)
> +{
> +       int idx;
> +
> +       for (idx =3D start_idx + 1; idx < start_idx + max_len; ++idx) {
> +               if (anon_exclusive !=3D PageAnonExclusive(first_page + id=
x))
> +                       break;
> +       }
> +       return idx - start_idx;
> +}
> +#endif
> +

Hi Dev,

I really don't want everything to become a top-level header
file. If these are only mm-internal things, could we move them
to mm/internal.h or another more appropriate header?

Best Regards
Barry

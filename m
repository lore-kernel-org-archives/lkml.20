Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD662BDC28
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972469; cv=pass; b=o2DHxDMKquK/yH83ke/AcGnVQFbU1nI2qFHzLk7t7ti78VwB964liCGMHFcpSVmQStJtHDp6Od8LikfZkFUdkwdJO70UybqHsV3VFQTGyexU0f8gTH8VwQt0TemG7hmvJrYeumtnVicXnhBWa9IC9n+NMCO+CdOsTKPE5G0AYao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972469; c=relaxed/simple;
	bh=N5OxGUQJMm/E5s6WX0aF7cckFy16MT61uNYp6MaFGo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8iYuz0z09LWgw2aN86mMbQuVZpyvoxXkKTtFbP20jrHA+jExTAT6VT0BUrO4MWpIQcNZms4R/PDOCLkZhFGTaspXKX9phajlZFNB8hgRgcFCPym8sMftyidP49Bmga9JWpVvLrtnkJ6sWuzOq6PZQKfyHloHL0dozGg29KhDn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tpU7E7sB; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tpU7E7sB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c01c79467so116151cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787972466; cv=none;
        d=google.com; s=arc-20260327;
        b=HCZNnzud7rFzVJB2J4s2OzVQM84dPTxYPqiqBrWZFgN+jizGinDgNNbqpDskX7SL9F
         hk5gAHuHKc4v9s2GueHpVyLzckX0LLIB/FPZc0REBZlkHSR7ePjfZUnWf4MGoX0mx660
         F0XIUCOX/8Cy64vQwuB1H2N+skKS1EAyvyD31IhnaQ2klBZXNR0W/+FpNj7tstuX6MoW
         sXh/ZG/2jYt6cakosg8cd8XpXSLbzyns9o5mDfXlKHKQQtWR1CYwgAbi99wncuLIaTB1
         oSRJoMEuSWJaAaoXH5LiN8lRZk058vE8fPAvi6A4vpc0ntBmwSYgfVBmnIPeN/Cdig4N
         jbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nLUy3j7XIC3MuF9b+5vRoq7wyMMTL5+219ycTFp+SUE=;
        fh=jcW4DGMaA7gbyun2HLcWXEnCvPG3CrXlsvEsvCLNXlc=;
        b=qcPsmcAaUus3p8q8PUt8sGvcJpgEtALiRqZUeO0IcizHNFAjW1GkJwmFDiWBK/ezpJ
         GL2tFjEZxHnMQB7rG9UnDd/XhtjHTpYityk7R2z67RQ+VQZmgCUqS9Mun03zEHyp+bJY
         tw73YPSTOjJNzven3mPwyceguhr7FwhZy4uLx3vZqSBN/2tpZ2AYy8LfZjkPXtN96M2K
         nkfZ+VIZDmfE+1UcFtuKDgeFqXzba1KM5JpxWc0Y5mHxNVi1YS4d8Yin6WaKpOZfcEsw
         vEmExZSPK0Z96UUu01Rg/EMdY8kJMbXtnGRWp602mj696VXe+EJ6cFXV507V2EzAfZI8
         nU0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787972466; x=1788577266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLUy3j7XIC3MuF9b+5vRoq7wyMMTL5+219ycTFp+SUE=;
        b=tpU7E7sB5RwDlNsYN753LRkInquFMtJTMhRZ51DbpiqbI/Kz2y9g/eVOJJQkgxsD/3
         zY+g71DxUSUfn7UUzctx4YtblAGM50zO6FhAzC/VoDn7mI2PKVodJe4sIqUOA+786yC1
         5jqBu+l+zt3wv5xfsLsVccJC6XAUSU5HV8lrCdSRqB3czarUhYgq1uZlI4QoBj0cCis/
         Ow1nNZhB5cOsiL/jYQIuQZ+lAVpcgaQIczpCfU5xBF1ZK7drBjtYjpoO9Xw+ItxEtQHL
         WS9m4pDDx0yYpITiLDHB+13TEBv5Q9+6OGhjlHoi5YqDdyik57tKrw+7rBQBjjZLkldY
         uqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787972466; x=1788577266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLUy3j7XIC3MuF9b+5vRoq7wyMMTL5+219ycTFp+SUE=;
        b=cLJ2X8KNRceGaxMTb5yn7yBaIBCxwGzTqWouz7bwn7ot6IoXie00+7s05IcXT2KeSU
         iEvyNtzcLIVpZaPZsfqFEwLa6SMBTwSzMTvAg9nuou5gdCf1CbMwIOiGhMqZ0EVojJe0
         DnZkEw3RCsPCOYg3a32vj+zztJDktRGjojj3OMC5XpTfMSmXEYmWRRSuWx+fHuBA7Ei/
         KYuxAilz+EI8NNw03ht54UWJjJMDbC0cZzS9piDp8cpPZEIDLO7rMF1eD+WwsnwCKFm/
         syF9gwtQZzz5kZ0WAd7cAZbMvPH1QHBLxQ0fa6NSCIbYekwnUO92JvfqjrOo3D5mRCji
         E3Ng==
X-Gm-Message-State: AFuF++lA3fhjYrprIbYkFhUqvdFB48nHhvfTUPpvgLbaMiA/oF0mVcf7
	hULNXskNm+ftTiqe82p5mRtjrY9wN7+TQi6YWWulqVdfLxJcj/CEfYiAWZ937TbWBQQL3MhGUea
	W6ZAMeulj6CH8DyiuKXDBQ0gqmR5vORC0qqaqIlmq
X-Gm-Gg: AR+sD13+J0q0bAEoWpzNmVwWPAeKv1cqpmQM8htH8O+cM3ChpcMAouuVt/1N4fhcJB5
	TLDlmiqoEPGRfE0S9OGq351rCzI29FxeWtYGAy7ADhbFbUNjwK7e4bQtzc6V5/w7LfO6jfVbywE
	kfVu0US57hqzVdS3EY0qCRE0rz4gBUXc8bQDiGd1Fo9PfMx/vZv6Y9b7uz7z1jAnoniucKbLrHi
	HyjOvRs8WfRtavXQevN0znqjfSrHp+id/S2NuwuVrS6Qh3eFI2rKiGEEgjGLSZg6Prn7PWIO//I
	qEPlW6bkVPkehV5hMMrjdttLOt54tgMHII+vy+4fwSI=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr8619941cf.2.1787972465651; Fri, 28 Aug 2026
 20:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-6-riel@surriel.com>
In-Reply-To: <20260811025157.1632867-6-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 28 Aug 2026 20:00:54 -0700
X-Gm-Features: AcwNN1Vj4z8Ya-qEYZ3MpBVI7mTdOXWm950pMK1qBQFZM9vP_MY4EVjBkzToltE
Message-ID: <CAJuCfpE+BWwX1t7bO+TQq5njSNOMcewewMzSukO69G9vDiydMA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/8] mm/gup: fill the pages array outside the
 pud/pmd lock
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:07=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> follow_huge_pud() and follow_huge_pmd() fill pages[] and flush the page's
> caches while still holding the pud or pmd lock. Neither flush_anon_page()
> nor flush_dcache_page() needs that lock.
>
> Have the huge paths store the page and let follow_pud_mask() and
> follow_pmd_mask() do the fill after they unlock, so the flushes happen
> outside the critical section.
>
> This should be safe because try_grab_folio() has already taken a folio
> reference before the unlock, so nothing can free the page while the fill
> runs, and the fill itself touches neither the page tables nor the pud or
> pmd entry it was reached through.
>
> No functional changes intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Rik van Riel <riel@surriel.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/gup.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 5af6a23285de..4036d3dc27df 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -695,7 +695,8 @@ static long follow_huge_pud(struct vm_area_struct *vm=
a,
>
>         *page_mask =3D HPAGE_PUD_NR - 1;
>
> -       gup_fill_pages(vma, addr, page, 1, pages);
> +       if (pages)
> +               pages[0] =3D page;
>
>         return 1;
>  }
> @@ -760,7 +761,8 @@ static long follow_huge_pmd(struct vm_area_struct *vm=
a,
>         page +=3D (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
>         *page_mask =3D HPAGE_PMD_NR - 1;
>
> -       gup_fill_pages(vma, addr, page, 1, pages);
> +       if (pages)
> +               pages[0] =3D page;
>
>         return 1;
>  }
> @@ -991,6 +993,14 @@ static long follow_pmd_mask(struct vm_area_struct *v=
ma,
>         }
>         ret =3D follow_huge_pmd(vma, address, pmd, flags, page_mask, page=
s);
>         spin_unlock(ptl);
> +
> +       /*
> +        * The ref is already held, so the page cannot go away: fill the
> +        * array and flush caches without the pmd lock.
> +        */
> +       if (ret > 0 && pages)
> +               gup_fill_pages(vma, address, pages[0], ret, pages);
> +
>         return ret;
>  }
>
> @@ -1012,6 +1022,12 @@ static long follow_pud_mask(struct vm_area_struct =
*vma,
>                 ptl =3D pud_lock(mm, pudp);
>                 ret =3D follow_huge_pud(vma, address, pudp, flags, page_m=
ask, pages);
>                 spin_unlock(ptl);
> +               /*
> +                * The ref is already held, so the page cannot go away: f=
ill
> +                * the array and flush caches without the lock.
> +                */
> +               if (ret > 0 && pages)
> +                       gup_fill_pages(vma, address, pages[0], ret, pages=
);
>                 if (ret)
>                         return ret;
>                 return no_page_table(vma, flags, address);
> --
> 2.55.0
>
>

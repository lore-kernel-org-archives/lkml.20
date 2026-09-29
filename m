Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96FB4E5347
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673690; cv=pass; b=nf5fRXjAYw53dr2cu2OTNzf14olTVvJz0+HDmwqGyzN7oSEEaXp0b3/hmLVp06yz6gjI6xd9DE3Us0GzFnp9ISi9fAuJ/AqDcWFJrPq6rrfQRAKjnLjWS2j1h8wcnDf8nd75wjSFUc4REPxm2/pNPeENUH/xVHqdWBvoUT1xf9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673690; c=relaxed/simple;
	bh=KffUdrW4MIDYYjKmdfFtDkcgVtt4B2IrR74wnM1cZv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFtNfMJZscTTbleAP7SJxthN0w77GS2u0UWlaG5UGJNAARXTavCwCTsJsLoiVjlSw+dk7iKhNvBaelltG9CGVTSrloVbu7RG7/iCAOIDlKJfQoJ32YTvvAbero1lW+DSpLqxPBZwGoP3EFa93mOQBr+eEjxUGY69GlJgbcckkYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc/rbEYJ; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc/rbEYJ"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570a3030so354574566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790673677; cv=none;
        d=google.com; s=arc-20260327;
        b=aCAhHQ2arFGv20mfQLdiXMkINDmsdKxVmi2+jhmtXmnV4trY2fig3wiPQKwJWMsDy5
         pc43eLCtrhGacx0+4flnekDcqXh4bGM/VgywEcLf4imASA6WrD4VDvpgjmW6ibejxZuY
         c1vDAJl+QvplJ1zvlVP9uHI0u9ERmPGkYHdY801zFe/3i8LEhcbPDAAl6MkKu2EUOe/T
         uJiLGjypD523vVogyjvRu+H/8+2PJKF06JgKjzGmwsfw1pG8GSpsWy4Eu1O/HEap+pFp
         s/GrrjAgM+zcDqyM2LqCqmr2ESrT82vi1qjkdIBE3czNsjMyk00DqlwVCIwhXXeenxjb
         BSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhqndOhozIw40kNwzku+lND3i27hg00jPoEVizKt1rI=;
        fh=o1wFFo79+VrhDovAI3ZMHzjumppNjfQHTBUW5VolqkA=;
        b=YNKDoYx+bnEw+PCBiel0uET7u8PxMkonqkZi5GpSZ2SFnqGfJvKA7YE9nSKsrO9nFs
         azZxV2cRwfvzSKlHPgPi4385CtJz7kbqgOyEYSd9MR9dvLCeXVkMfRpvlQEF5UdVAWLo
         t3oWskF6k+8Bl6fKms8Yx75i48bBnPd7nxowc5ZM3ZGgf1TK6OwSVdIcKQLY6wydT0/R
         K9c9eeFzpSkjlThsrNLvEdVl4h/ZWkpWKHqR6nn2GonXF0cYX8mdV8DpYsIZqUiWxFP3
         uR4q8Wz2tg1AAzqY95NdFXvGYJ4H8kw8q2ylWtAWGrZUHtzx6ScJ968WmlwGvW001WzK
         qD0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673677; x=1791278477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhqndOhozIw40kNwzku+lND3i27hg00jPoEVizKt1rI=;
        b=Vc/rbEYJqggb9tipRL+iGmi/EIB3v1070TxrtvWbfv2EZFiaogLFhx/ZjB1SSTABt/
         YyrD5hrzKGHnqbJflBqFJIqE0KSpGoTfHBvUk1oeV+a2855trkS1X2Ltgs8RQazbclPP
         SYGiBWSWsEy8deoSdpnp+d20h0NebvDKmGlWaRomxnviV9LW9eVawEq9+Bl8OOgtA14p
         GpohE2A8au1UNWqmbxbE6Jw4JBBbU+JNxDh/XhbHjzD0Y5vhbdXcCQiC9/8Xt2PA/Jn7
         c2c8xAi7bp1MlWjXVBDfL4w1WU66ZrB3NYz1LGyobzLgLCGhtaAO35N3EbKbx/ZiFiji
         4Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673677; x=1791278477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhqndOhozIw40kNwzku+lND3i27hg00jPoEVizKt1rI=;
        b=llsYoyTlMHTNk4fPDUyeWW/0mG+ehltB1RsBR7JzsyonMeEHsvwPdNwpLaBR3AZizj
         EV1zOSX4VMqKN6rB2CXrpLlXepjJqfCgYDShN6+WP2WG1T9qWgaOGBt1hLYMf39eca+U
         iJank4kZGDvIFlnJI+OeKovjsGENO8sTsK4BuhRRlFrTbOhXlYqU1KsFp1G8d6Qp5Lh/
         /x0efB9jibS/2lvq1O5M7CWNOCCJNpiNXFj09ir+1rzYDRBdiJxNB//Y0qG7+IqpxDpB
         rRw9/Z0qcYa1KSyMXBd6jQlSUjnbqStou1qll+ZCsy1n+hLFLn80Db1xCHQa4T+vuQqx
         KPmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTUFtTfTByTaWWZGZuZ52J4Bfddba3Q4wKPujTB1QQQ5fUGBlw2cLv9R0fEvFVWoT6P9sxIKlpzUeNvxo=@vger.kernel.org
X-Gm-Message-State: AFuF++mD3Jb9HNKuuEah7ycB2selb7AJIEoyG9o1z87KL38snzMbc02R
	C84l5SXQZMKYalhyOLsaR6blB2XCOYjl7UfsIxTJuKX4o1Lj25++h1/HmFAUrII/+YYH2g2TQMX
	qbjrEkqfUMQsFltbeUUDgTQRP8OwLDxM=
X-Gm-Gg: AYBFou1l4AGm0AZSlmHGKtG7fler+3mv49OQcP1H6LXRlbvhOmwhBOcYresVja3g7mO
	JZAI/YpYC2dbddrLvaiQq1Tv2VsW92HNitF0IyV3Ib8hYTOrDW19RBsr1onb7HWaC6AM5Zli/HW
	aqR2cz6rxgB94HO6VGnDUkx3+OrMg2t50YgziYdJcdBZbOwGLtMQpEutwx31MmvtRvHnE3RVbeP
	AVlzEnqUwFvBtBcFTBqhEWRPnD3ufCiPh1d1TtuTcD3NyEpz/kSuQIoEn8rLPW5/s0sYZ/6OiwB
	1iqbx5E6cFnENGv8QKSiJ48zAD/b494Nc5zvkNKiTfkkvFLrEaKG7vV2SUQB37vn7Gq0DlhCuAX
	J41k9BaeZ/pw=
X-Received: by 2002:a17:907:c80d:b0:c2b:f3d5:2090 with SMTP id
 a640c23a62f3a-c2bf3d52cd4mr701192866b.27.1790673677038; Tue, 29 Sep 2026
 02:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924131106.1730494-1-dev.jain@arm.com> <20260924131106.1730494-2-dev.jain@arm.com>
In-Reply-To: <20260924131106.1730494-2-dev.jain@arm.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 29 Sep 2026 17:20:40 +0800
X-Gm-Features: AclHuK9lxCbTSA0mjXTjQjkfbiHSsXqGwiLHzR329M81OQsBZnsP4Ya5LuEJfD8
Message-ID: <CAMgjq7CWom3pwZa5j=gmtb57Y+1+QfAkmkLVcgKnJVsZi+Fi3w@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] mm/swapfile: add batched version of folio_dup_swap
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, davem@davemloft.net, andreas@gaisler.com, 
	riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org, 
	jannh@google.com, lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, pfalcato@suse.de, jgg@ziepe.ca, thuth@redhat.com, 
	sparclinux@vger.kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 9:15=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Add folio_dup_swap_pages to handle a batch of consecutive pages. Note
> that folio_dup_swap already can handle a subset of this: nr_pages =3D=3D =
1 and
> nr_pages =3D=3D folio_nr_pages(folio). Generalize this to any nr_pages.
>
> Currently we have a not-so-nice logic of passing in subpage =3D=3D NULL i=
f
> we mean to exercise the logic on the entire folio, and subpage !=3D NULL =
if
> we want to exercise the logic on only that subpage. Remove this
> indirection: the caller invokes folio_dup_swap_pages() if it wants to
> operate on a range of pages in the folio (i.e nr_pages may be anything
> between 1 and folio_nr_pages()), and invokes folio_dup_swap() if it
> wants to operate on the entire folio.
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/rmap.c     |  2 +-
>  mm/shmem.c    |  2 +-
>  mm/swap.h     | 18 ++++++++++++++++--
>  mm/swapfile.c | 18 ++++++++----------
>  4 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 6661bc11ce658..a70dbc8d544e1 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2150,7 +2150,7 @@ static bool ttu_anon_swapbacked_folio(struct vm_are=
a_struct *vma,
>         swp_entry_t entry =3D folio_page_swap_entry(folio, page);
>         struct mm_struct *mm =3D vma->vm_mm;
>
> -       if (folio_dup_swap(folio, page) < 0)
> +       if (folio_dup_swap_pages(folio, page, 1) < 0)
>                 return false;
>
>         /*
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b572c60f2af85..d5bd9506ce500 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1914,7 +1914,7 @@ int shmem_writeout(struct swap_io_ctx *ctx, struct =
folio *folio,
>                         spin_unlock(&shmem_swaplist_lock);
>                 }
>
> -               folio_dup_swap(folio, NULL);
> +               folio_dup_swap(folio);
>                 shmem_delete_from_page_cache(folio, swp_to_radix_entry(fo=
lio->swap));
>
>                 BUG_ON(folio_mapped(folio));
> diff --git a/mm/swap.h b/mm/swap.h
> index b3b54c28929a1..47290510de264 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -244,7 +244,8 @@ extern int swap_retry_table_alloc(swp_entry_t entry, =
gfp_t gfp);
>   * folio_put_swap(): does the opposite thing of folio_dup_swap().
>   */
>  int folio_alloc_swap(struct folio *folio);
> -int folio_dup_swap(struct folio *folio, struct page *page);
> +int folio_dup_swap_pages(struct folio *folio, struct page *page,
> +               unsigned long nr_pages);
>  void folio_put_swap(struct folio *folio, struct page *page);
>
>  /* For internal use */
> @@ -368,7 +369,8 @@ static inline int folio_alloc_swap(struct folio *foli=
o)
>         return -EINVAL;
>  }
>
> -static inline int folio_dup_swap(struct folio *folio, struct page *page)
> +static inline int folio_dup_swap_pages(struct folio *folio, struct page =
*page,
> +               unsigned long nr_pages)
>  {
>         return -EINVAL;
>  }
> @@ -464,6 +466,18 @@ static inline void __swap_cache_replace_folio(struct=
 swap_cluster_info *ci,
>  }
>  #endif /* CONFIG_SWAP */
>
> +/**
> + * folio_dup_swap() - Increase swap count of all swap entries of a folio=
.
> + * @folio: folio with swap entries bound.
> + *
> + * See folio_dup_swap_pages() for more information.
> + */
> +static inline int folio_dup_swap(struct folio *folio)
> +{
> +       return folio_dup_swap_pages(folio, folio_page(folio, 0),
> +                                   folio_nr_pages(folio));
> +}
> +
>  extern const struct swap_ops swap_bdev_ops;
>
>  int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c1c5fbb3c909d..75167b8580cc0 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1799,9 +1799,10 @@ int folio_alloc_swap(struct folio *folio)
>  }
>
>  /**
> - * folio_dup_swap() - Increase swap count of swap entries of a folio.
> + * folio_dup_swap_pages() - Increase swap count of swap entries of a fol=
io.
>   * @folio: folio with swap entries bounded.
> - * @page: if not NULL, only increase the swap count of this page.
> + * @page: the first page in the folio to increase the swap count for.
> + * @nr_pages: the number of pages in the folio to increase the swap coun=
t for.
>   *
>   * Typically called when the folio is unmapped and have its swap entry t=
o
>   * take its place: Swap entries allocated to a folio has count =3D=3D 0 =
and pinned
> @@ -1815,18 +1816,15 @@ int folio_alloc_swap(struct folio *folio)
>   * swap_put_entries_direct on its swap entry before this helper returns,=
 or
>   * the swap count may underflow.
>   */
> -int folio_dup_swap(struct folio *folio, struct page *page)
> +int folio_dup_swap_pages(struct folio *folio, struct page *page,
> +               unsigned long nr_pages)
>  {
> -       swp_entry_t entry =3D folio->swap;
> -       unsigned long nr_pages =3D folio_nr_pages(folio);
> +       swp_entry_t entry =3D folio_page_swap_entry(folio, page);
> +       unsigned long idx =3D folio_page_idx(folio, page);
>
>         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
>         VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
> -
> -       if (page) {
> -               entry =3D folio_page_swap_entry(folio, page);
> -               nr_pages =3D 1;
> -       }
> +       VM_WARN_ON_FOLIO(idx + nr_pages > folio_nr_pages(folio), folio);
>
>         return swap_dup_entries_cluster(swap_entry_to_info(entry),
>                                         swp_offset(entry), nr_pages);
> --
> 2.43.0

Looks good to me.

Reviewed-by: Kairui Song <kasong@tencent.com>

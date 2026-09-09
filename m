Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440F931F986
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978585; cv=pass; b=jP+KQxTBbEEQ5INSjQOwhgWgJalXhWywo6yooNkfPuaFyiAwVFvUI0skmyvMleudLYk37yCOHpaxbEWsREDwEBFRRTbpmp/hGqiAd79jVzVxAaSdjWRyci3wannIlAavKPnLMORlwZzxrQHob6SVHlFghofkFoPNPBV/p4rRLxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978585; c=relaxed/simple;
	bh=1h+MbuXnlDkDSbFNPppmAWiVvWo8OZAfdxWaMBL7Kfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5xRKG970koRn6KRuy0CML3WtXFpeQ4fFl4rGhzgERA1yoSJT/LqTZ9tc4l3v9jPKODyrt7b6FHk8+QjwlSVCK1zGPLkFva8eedsj+wRmHVzIUWvYCpcAi1H9s1ydvAsjNbBrXiPhhJR+3kAzCaJjJtIv0EUeNhzh0eNiqNB7Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnwOekBO; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnwOekBO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so48914165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788978581; cv=none;
        d=google.com; s=arc-20260327;
        b=bozwkj5SbeKl2U+kwQG3/quANpYuCLucOpeCaYeIkCWSjRi30DJv+fEAMAlvpeb9kF
         KdwNhq0HfQPQuq2GEvGT15TGtTmWpPm2VpFtMBzA9+W0DNWxeGFJtiwS3tsnfck7My2W
         n/a/cJxjQVxlFzEdYm0/4qiBk0bXpA3wEe24VmwiTfxoZbp0I4uxVkRjMy+AIqslDel/
         1ZcOQm0tcf4WqYBuuiuHDjL3AsJ4q0R+6nf5qUQAIhfQCd5/0u8Fqog60GU+y23ff2WR
         8qsQpJ3b8tPyN+dps6vNFuWt0Orx2OQOOWLQQ/OxDN+exPVbTWHINaXuGBRF7U2xrDYg
         4wRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EYvnoKTXNW2Ak9107qs0mK9Mwah+zy+/JNGH680rE8=;
        fh=CSO27dqsSC2tmxe2pDkpQQjbI1S+gppOMTYMCWCyHEE=;
        b=fZIEcHj/PvXgi23iGu6WQX/p8r2q8AHR1KBFR3R/m822DmsrfcHmqSbFSXg+00Ax1d
         IB2bnYTr5Z2pqowuQW3VZdP02OTPwgkhSHpxEIcf8tasgDh68DJUr17LtapQkcUZ5JPC
         20kYtMl4nPMYNrNzD6FblU5OoEW9Oa9gK/a4xcm1yOnbEZ0blU0BqLTRfp20j18UpDHn
         0savTOmznOB2+JoMrCGMD3+x7BGLglQzOhkv5gKJl9ptPRnr7sfAPydCzVOgj9Wdcnwy
         Qv/YJqSzMt0rEw0d4QcGPt2oYKwt/vIK+9kYyJPoztYoUErEkPVKGhFzkWfUYl7BTyQk
         Qo1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978581; x=1789583381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1EYvnoKTXNW2Ak9107qs0mK9Mwah+zy+/JNGH680rE8=;
        b=BnwOekBOFHh6UdTQ7hcnvHGQ4YUlQiyVJIiCu0pajoqGPSl2V+FvTI5o2I44pVIwe9
         S40GxFCghk/u8iS1jS4c8wviZ5gAF/ySTOSVknPnvSNakA/gvyipvTOagssfZuHNDSTC
         md14eyQU+DySA1gRKMm506XyEgkvRJR5emEEsiMQyI8+2+o+DUByrD1OXRpHkozw+G9E
         k/p2nk4hWmXu8EAMBMXygHRJehmNrRVlZy9W4h7KljMGgmmxJaLJpSWK3bYCJXNiQaMS
         iWTlTADzKlGc+tUyLgfx64dq2bgf28eptWd/QB96KQo/Dlv9k2RoHyCJ0ajRGLVDaLci
         Y6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978581; x=1789583381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EYvnoKTXNW2Ak9107qs0mK9Mwah+zy+/JNGH680rE8=;
        b=gRlLNEkPxggXPgoeErkaT6iOu0ghp+7rcUOeZN94UnSAqv5dVYfiuoanELX5ZT3zFE
         Tg8YzmZkNB0ztw2JKArm/cS0dBtyn9/x2sYUTTaEFECkfnKFA56SESZ6ybxsmld9kmt4
         SgevZiW5+8n6FQV6UrqJ9tAg7N1kyoD+kbGDOQ7O3pi3GeVMq5hg+i123aJNBCfk+01W
         QQ3v30wH7nYecdy2Bh0O7rsmuSgzCMTWdvUh55CClm/6nNlk1XgUz4vNXfbA9xIPTJz+
         L8JokAkCClqHrYoIWRbNuI1tu5GONoAheeQbNU0KM6MzSC3zFfd2v0SvJkIPrWl5dcPm
         DoFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbo4aHoL8TIWXpjfUhpt1I0erzXMK8XVsOHGxUs3JhgkvpmB4ZkPbOEZ0dH5dGo7SrsdryffRkTCZcfQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++naSmZXPve/9WuzywePtHwfwKT5v0Qg3WbR2s8eusTYdyeOmGcf
	chLkC+rDZGSigojgP03hGsj6iVB0oeAK2k6j/hAUh0A8qv1wx4u8QupFYK3CJgq+D0IbTRuF3Wc
	Uc2FDOZsN0wE/IB2CXq+JD0+uf1FgO1xewqTU
X-Gm-Gg: AYBFou2Q47S2p1cN+02AcJczo7tNXj7O6N76G+/6DI6Wnn6v+drpQvGWshmNZK6A/Nz
	I7RxeJ5zTLvx5lbSpnOyE8LvHJ9pSDWQwvWLFX2AuFDCJzv4AlVzphGnu0Q/pSHx5C31hwzkGUK
	lSmk/og3FFqqlNN/Zg+44P/RznkwvVgzish7ptuFT1PbztNBSi1/Z6nmFQDQS9J6omxX8kD2FaT
	8bmmhEz64WHmyOK4BPrR/dE1XFJvHyQ3eunA/6UFqJdf/oWcu3OHV/IOKihnr0+CDlIsTed63qz
	dN76Ij3DpoKERplx1BXcT4KQSl8yeJWA4fF8ColSIX/Q7tRkvRetpNnfbm9FPSNb9PqxEVBkEiN
	4bvU8AuiBTLTuV79sysGRtlraESFmI5h9kBs/vA==
X-Received: by 2002:a05:600c:698c:b0:49c:fc6e:a3df with SMTP id
 5b1f17b1804b1-49cfc6ea7camr362786445e9.30.1788978581207; Wed, 09 Sep 2026
 11:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909062339.473816-1-yi.zhang@huaweicloud.com>
In-Reply-To: <20260909062339.473816-1-yi.zhang@huaweicloud.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 9 Sep 2026 11:29:28 -0700
X-Gm-Features: AcwNN1UIVH_MQZA8U5aal0eSLqYQFca_vZkAxhuM9xhibUtiO7HkDUg0iOU3ikY
Message-ID: <CAJnrk1b8fWpp-yBRxFaBbFzA8852N53SB6j3Zi9Qnp+JBFuNbA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/truncate: fix data loss when truncating straddling
 large folios
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hughd@google.com, baolin.wang@linux.alibaba.com, 
	willy@infradead.org, jack@suse.cz, ziy@nvidia.com, bfoster@redhat.com, 
	djwong@kernel.org, yi.zhang@huawei.com, yizhang089@gmail.com, 
	yangerkun@huawei.com, chengzhihao1@huawei.com, wangkefeng.wang@huawei.com, 
	yukuai@fnnas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:31=E2=80=AFPM Zhang Yi <yi.zhang@huaweicloud.com>=
 wrote:
>
> From: Zhang Yi <yi.zhang@huawei.com>
>
> truncate_inode_partial_folio() splits a large folio so that the caller's
> truncate loop can drop the in-range sub-folios while keeping the
> out-of-range tail. The first split at the punch start edge is
> non-uniform, which leaves the sub-folio at the truncation end edge as
> large as possible, this means it may still straddle the range, holding
> both zeroed in-range and valid out-of-range data. The function then
> attempts a second split at offset + length to isolate that tail.
>
> If the second split fails the straddling sub-folio stays merged. The
> function returned true unconditionally on all exit paths of the success
> block, telling the caller it was fully handled. The caller kept its
> default end and the truncate loop truncated every sub-folio below it,
> including the merged straddler, discarding the valid out-of-range tail.
>
> For example, a 4-page order-2 folio punched from offset 0 to the middle
> of the last page:
>
>   truncate_inode_pages_range()
>     truncate_inode_partial_folio()      # same_folio =3D=3D true
>       1st split at page0 -> [p0, p1, p2-3]   # non-uniform, success
>       folio2 =3D p2-3 # straddles: p2 zeroed, p3 tail valid
>       2nd split of folio2 fails / cannot lock
>       return true                       # BUG: caller keeps default end
>     end =3D 3
>     loop truncates p0, p1, p2-3        # p3's valid tail is lost
>
> This became reachable after commit 7460b470a131 ("mm/truncate: use
> folio_split() in truncate operation") replaced the atomic split_folio()
> with folio_split(), whose non-uniform split can partially split a folio
> and leave the end edge merged.
>
> It has gone unnoticed because a dirty large folio normally carries the
> filesystem's private data, for example buffer_head, so
> filemap_release_folio() -> iomap_release_folio() returns false on a
> dirty folio and folio_split() aborts with -EBUSY before any split,
> leaving the straddler safely unsplit. The bug is only reachable on paths
> that produce dirty large folios without filesystem private data, and it
> was caught on the upcoming ext4 iomap buffered I/O path when no ifs is
> attached.
>
> In addition, even when both splits succeed, data can still be lost when
> the mapping's minimum folio order (min_order) is non-zero. folio_split()
> stops at min_order instead of order 0, so the sub-folio containing a
> split point stays aligned to 1 << min_order rather than to a page. The
> original success path left start at the page-aligned head of the range
> and set end to the exact page index of the end edge, neither of which is
> a folio boundary in general. Either one could land inside the large
> folio at its edge, and the truncate loop would drop that straddling
> folio together with its valid out-of-range tail.
>
> For example, a 64K (order-4) folio with min_order =3D 2 punched from
> offset 0 to 36K:
>
>   truncate_inode_pages_range()
>     truncate_inode_partial_folio()        # same_folio =3D=3D true
>       1st split at p0 -> [p0-p3, p4-p7, p8-p15]  # non-uniform, min_order
>       folio2 =3D p8-p15 # straddles: p8 in range, p9-p15 tail valid
>       2nd split of folio2 -> [p8-p11, p12-p15]   # success
>       end =3D p9                           # BUG: p9 inside [p8-p11]
>     loop truncates ... p8-p11           # p9-p11's valid tail is lost
>
> Rework the contract so the caller is told the page range to discard:
>
>   - Return true only when a split occurred, false otherwise. This
>     clarifies the existing confusing return value semantics.
>
>   - Add pgoff_t *pstart and *pend out-parameters that receive the page
>     range fully covered by [lstart, lend] after any split (or none),
>     i.e. the pages wholly within the range and safe to discard. They are
>     aligned up (pstart) and down (pend) to the mapping's minimum folio
>     order so they always fall on a folio boundary.
>
>   - Rename the byte-range parameters start/end to lstart/lend to avoid
>     clashing with the new outputs and to separate byte offsets from
>     folio indices.
>
> Callers in truncate_inode_pages_range() and shmem_undo_range() pass
> &pstart for the folio at the start edge and &pend for the folio at the
> end edge, so the truncate loop drops exactly the fully covered pages and
> never touches a straddling folio that still holds valid out-of-range
> data.
>
> Suggested-by: Brian Foster <bfoster@redhat.com>
> Link: https://lore.kernel.org/linux-fsdevel/anH-WKA1coW6wtfG@bfoster/
> Fixes: 7460b470a131 ("mm/truncate: use folio_split() in truncate operatio=
n")
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
> v1->v2:
>  - Export pstart as a new parameter so that the generic and shmem
>    truncate paths don't need to recompute the start value from the
>    return value. (Brian)
>  - When min_order is nonzero, align [pstart, pend] to the inner
>    boundaries of the folio to ensure they do not point into the middle
>    of a large folio, which could otherwise cause valid data within the
>    folio to be incorrectly cleared. (Joanne)
>
> v1: https://lore.kernel.org/linux-mm/20260903115018.2034541-1-yi.zhang@hu=
aweicloud.com/
>
>  mm/internal.h |  4 +--
>  mm/shmem.c    | 13 +++-----
>  mm/truncate.c | 88 +++++++++++++++++++++++++++++++++++----------------
>  3 files changed, 67 insertions(+), 38 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 68db5abd0a4c..6e6ad3187378 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -627,8 +627,8 @@ unsigned find_lock_entries(struct address_space *mapp=
ing, pgoff_t *start,
>  unsigned find_get_entries(struct address_space *mapping, pgoff_t *start,
>                 pgoff_t end, struct folio_batch *fbatch, pgoff_t *indices=
);
>  int truncate_inode_folio(struct address_space *mapping, struct folio *fo=
lio);
> -bool truncate_inode_partial_folio(struct folio *folio, loff_t start,
> -               loff_t end);
> +bool truncate_inode_partial_folio(struct folio *folio, loff_t lstart,
> +               loff_t lend, pgoff_t *pstart, pgoff_t *pend);
>  long mapping_evict_folio(struct address_space *mapping, struct folio *fo=
lio);
>  unsigned long mapping_try_invalidate(struct address_space *mapping,
>                 pgoff_t start, pgoff_t end, unsigned long *nr_failed);
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 89a1495e55f7..4efbbbba5da5 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1175,11 +1175,8 @@ static void shmem_undo_range(struct inode *inode, =
loff_t lstart, uoff_t lend,
>         if (folio) {
>                 same_folio =3D lend < folio_next_pos(folio);
>                 folio_mark_dirty(folio);
> -               if (!truncate_inode_partial_folio(folio, lstart, lend)) {
> -                       start =3D folio_next_index(folio);
> -                       if (same_folio)
> -                               end =3D folio->index;
> -               }
> +               truncate_inode_partial_folio(folio, lstart, lend, &start,
> +                                            same_folio ? &end : NULL);
>                 folio_unlock(folio);
>                 folio_put(folio);
>                 folio =3D NULL;
> @@ -1189,8 +1186,7 @@ static void shmem_undo_range(struct inode *inode, l=
off_t lstart, uoff_t lend,
>                 folio =3D shmem_get_partial_folio(inode, lend >> PAGE_SHI=
FT);
>         if (folio) {
>                 folio_mark_dirty(folio);
> -               if (!truncate_inode_partial_folio(folio, lstart, lend))
> -                       end =3D folio->index;
> +               truncate_inode_partial_folio(folio, lstart, lend, NULL, &=
end);
>                 folio_unlock(folio);
>                 folio_put(folio);
>         }
> @@ -1258,7 +1254,8 @@ static void shmem_undo_range(struct inode *inode, l=
off_t lstart, uoff_t lend,
>
>                                 if (!folio_test_large(folio)) {
>                                         truncate_inode_folio(mapping, fol=
io);
> -                               } else if (truncate_inode_partial_folio(f=
olio, lstart, lend)) {
> +                               } else if (truncate_inode_partial_folio(f=
olio,
> +                                                       lstart, lend, NUL=
L, NULL)) {
>                                         /*
>                                          * If we split a page, reset the =
loop so
>                                          * that we pick up the new sub pa=
ges.
> diff --git a/mm/truncate.c b/mm/truncate.c
> index b58ba940be47..d88a1b159084 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -206,35 +206,41 @@ static int folio_split_or_unmap(struct folio *folio=
, struct page *split_at,
>  /*
>   * Handle partial folios.  The folio may be entirely within the
>   * range if a split has raced with us.  If not, we zero the part of the
> - * folio that's within the [start, end] range, and then split the folio =
if
> + * folio that's within the [lstart, lend] range, and then split the foli=
o if
>   * it's large.  split_page_range() will discard pages which now lie beyo=
nd
>   * i_size, and we rely on the caller to discard pages which lie within a
>   * newly created hole.
>   *
> - * Returns false if splitting failed so the caller can avoid
> - * discarding the entire folio which is stubbornly unsplit.
> + * When @pstart and/or @pend are non-NULL they receive the indexes of th=
e
> + * page range fully covered by [lstart, lend] after any split (or none),
> + * i.e. the range of pages that are wholly within [lstart, lend] and so =
safe
> + * to discard.

I think with themin_order > 0 case, pages wholly within [lstart, lend]
can still be excluded, so maybe worth editing this to reflect that.

Thanks,
Joanne

> + *
> + * Return %true if the folio was split, %false otherwise.
>   */
> -bool truncate_inode_partial_folio(struct folio *folio, loff_t start, lof=
f_t end)
> +bool truncate_inode_partial_folio(struct folio *folio, loff_t lstart,
> +                                 loff_t lend, pgoff_t *pstart, pgoff_t *=
pend)
>  {
>         loff_t pos =3D folio_pos(folio);
>         size_t size =3D folio_size(folio);

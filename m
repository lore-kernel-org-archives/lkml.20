Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E613859EC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849215; cv=pass; b=nxp5MEUGSSGIfHvagX0aZSCkb2wMkwgM0qfqJ2VWKtLYQJPFN0iEPTqrfDGIlDk3rXYUccdGynR1DIKjMxbQ0p09xF5TZPu0huHsJyQLP6u+QdnyLDUkNYxECm7Rf/Wso1r98srJV67i99bBiMmYol7ilIdV35gnUaA4qaxLfHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849215; c=relaxed/simple;
	bh=hFm18mMdgGbAfxlw0Bd9/ezTRHPsudaw8lTymD48Puo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHqgZJ+0Pjk8lwuIce6mr4XwOdaOPDh0a/O625DQVxggFliyDXZJo0Pz+r3XHoJ31isEeHIdElxQjSGn7oyTcETG9ssgYbK9WIokr7LoZ0SzS28ij6vgG0cGAlN8MCxJq1KHAvKmGjSpxtzDJGRf1X3l0/bb/mrGT/HrVMWdRPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKSUO/Fq; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKSUO/Fq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c255c58156bso843346266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788849212; cv=none;
        d=google.com; s=arc-20260327;
        b=K6Ka1VTufjlK51ros6sDRIVhrQkgzorRnSLD9k+VgS7o5gXqFQeWo4kdoYXYqgTClU
         cdXBPIHCWmUdxDcEUS5cDS5mVd0zttzAALqbZnTyqpodHjmEruQZLluIqUkwJaDxRgcR
         MqrLY3IgWqhmUQLGFENhfcTIMwyKzxzMCa3NCNKp/r76y0qHrFOyGCl7leNmmphVUtbT
         tnc0wbVZaSHNAYLDtecB3M5atGo5Kzy1WTck4QfL5djKqUptdLlVGnUtPOyt6v2i0ZKH
         IPlLV2ST2EVeFpYVTRxhDOw+BcvDBnMp+0hKuwARkaGg2ZPC2Kb1d2OEPu5oy3gqKlrk
         tU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KahS5bRLriJtyNOdhgL7SyjjlJxTSa5+53aCYRqdY+o=;
        fh=/DzE37fgOivv1uywFWgtNPKWO0KL/OueMHEU3ITuYQs=;
        b=Sb3BTr5QY59GG5TfYQhDrxXutcj18n2qTiBqA6WNY6cy4xFUF1jnoon/Q2FTJOMG7u
         HWtjjKA2WKFuU295GkQWUSSCP2hle7VtvhoqccrTuvuZtffq1PJ24H296m6ojoQY/DVx
         Z8RUC/n0JTRiz1YDNcsyJ7zI1BUgXm246zF9uia/PnYEDR05/sFLO3gwI30FAdjE4bc7
         7c2n3WeYj7OP7eNBprBDXC+C3qy5XPtjWMfN3jF1n3um6gF28suh+qjCAUzNkZ6Kn3N4
         mOmROHUe0BFpjEeD/w39mAFR8Vkc8b7HOQDh5DGO894/y9j3GKrM49j3yn1q9DX4Uqd8
         s3kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849212; x=1789454012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KahS5bRLriJtyNOdhgL7SyjjlJxTSa5+53aCYRqdY+o=;
        b=YKSUO/FqN8D2ItVNi27+DwITH9GR1y+2aWIsBGVrvwIzXMFBfdsI46l4OYnqVNeMG5
         6eJuO1YaJng6iJPhWbNwLUtLFMsxwRB7aAYutd6PKW4OE34rqjO7W3ywAC+iBABfrFqa
         2cKUrBjfhU0Wi7D3ZEY6Fz8WpoGSAftlb4biiaiNExCQiUxRJCk0puiUn3Tm4xUmAhzr
         6WdEgA7zHxmJ5hJ+KfFHv0MuJDv01DyZkKCtr9/W6l1JG2F7pwQJ1sSBj7/a6cZSAPlR
         Lg54CyCivDt4bgFSMOhfNyZxqbVHpJeb060fmPP7gF5MZOTAGs8y88OkQr76AJevWOID
         DGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849212; x=1789454012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KahS5bRLriJtyNOdhgL7SyjjlJxTSa5+53aCYRqdY+o=;
        b=czSGXloRzfuWZOegh8cXkBaXFdyy0lEoGMU3bVSM4UGU5cxI8TIgEuSrDVqc6eWmjP
         uOluXbbzvO0kpPKnIpRJr5dwpP3A5f3YdPbu+QsUTb77U6IS7OhYrboU3Ep0zZXO34DC
         Am303IhYGgYzxgteX1cCwTOV2LF1iPmmEZtAU4QqyjhA+Rco/MGz3BliqqVOOjAn8OS5
         9aKhhefZ9njrcm5lH02pNbbn+u6eH5tKhIvlogxaDQOzjILA998fyKkrK3icHCcgTwvo
         WcO2kikpGtuRbWkY2mFQfftLpcS01RXjbo7roKQ5J7aM2ddunm5e6Cm5GXeKAMriC9hj
         UqgA==
X-Forwarded-Encrypted: i=1; AKwUvBwz6zsyql8WVIBPz6jHB1T81aDRk1hv2BN+uYuzrEO/a8F94SRpl0E6wJyOewqtgtvDO66D+/oG+bdev2k=@vger.kernel.org
X-Gm-Message-State: AFuF++l2dOCmJpblxM0pyqVi787pFna1JgJb2tfq9nGemEXgfdLL3wMO
	+k9rHAqQzijEttBwrQL3goALgCWJ8xuiBz98ha+mNtaZd58MAa6Aial4jS5P3ABjXXanH8rHkmN
	At6FcpZFU/cjSYlVGwDCygQOKJD4R8zk=
X-Gm-Gg: AYBFou04YeiyQn2Utd7eD83k9Lq13Pekc9IEzB5Bh32aOIqijsn5XtCOjawVzHgUGVx
	yzuNzx+h+POvsRVGQeIlnCDm2vnRh1sdN4tJXJ37laT6aGhfdZQCYy/CqyZbUKqwMKCSmAq08+a
	emY5sTcwPbAJxCx0rkZM3Gi1h0KyhlgE2jU0MwWkNCuU+07VaaR4Xzfj/iM3OCJiE7a02UkaURD
	6YiGIZqgpIPziMTnHpA7uUpkfsVowfRAIXLLR+wia/VAu6lqVuJn2FsdyvwN6ZwU10sw9qri/MZ
	k0E8a2fgvAJyU9/X9X+druRvqS5QyZ+GN8JhG+uruXg3VKmyZwSe2j7lxRly8z7TiuUK5XQRBIY
	nwpg=
X-Received: by 2002:a17:906:478f:b0:c26:19de:9ad5 with SMTP id
 a640c23a62f3a-c2619dea727mr969630366b.45.1788849211595; Mon, 07 Sep 2026
 23:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-12-b532a3f20e71@tencent.com> <DL9DHWXVU0YR.2LTES896PBMJO@nvidia.com>
In-Reply-To: <DL9DHWXVU0YR.2LTES896PBMJO@nvidia.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 8 Sep 2026 14:32:55 +0800
X-Gm-Features: AcwNN1WYNxaoAsw5NBSqsq02qN2vugN0LXLlxY0rzTzuTDZjXyZe74gvaxoUv5M
Message-ID: <CAMgjq7Db_0eDyddHp8zxHoCkauh_OL0WsKOdTfF8ZvV93MQ9pA@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] mm/huge_memory: move anon_vma handling into the
 anon split helper
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:40=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On Mon Sep 7, 2026 at 2:12 PM EDT, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Only anon split needs the anon_vma, and it only needs it to unmap and
> > remap.  Move the folio_get_anon_vma()/anon_vma_lock_write() pair out of
> > __folio_split() into the anon helper next to the folio_mapped()
> > check that already gates unmap_folio().
> >
> > This makes the anon_vma conditional on folio_mapped(), which is a
> > behaviour change but should be fine.  folio_get_anon_vma() returns
> > NULL whenever !folio_mapped(), so an anon folio with
> > folio_mapcount() =3D=3D 0 used to get -EBUSY from split_huge_page() and=
 is
> > now split instead.  The realistic case is a THP that has been fully
> > swapped out and is still in the swap cache: swap PTEs do not contribute
> > mapcount, so it is !folio_mapped() but still alive.
> >
> > That should be safe and right to have because:
> >
> > - folio_ref_freeze() below still rejects a folio that picked up any
> >   reference, a mapping or a GUP pin, in the meantime.
> >
> > - A parallel split is excluded by the folio lock.  The anon_vma
> >   write lock was added to serialize split in commit 062f1af2170a
> >   ("mm: thp: acquire the anon_vma rwsem for write during split"), when
> >   split_huge_page() did not hold the folio lock throughout. commit
> >   e9b61f19858a ("thp: reintroduce split_huge_page()") later made the
> >   folio lock a caller requirement and added the folio_ref_freeze()
> >   scheme, so that has been covered ever since.
> >
> > - Unmapped path is already exercised by folio_split_unmapped(),
> >   and the swap cache split already runs well for a partially
> >   swapped-out mapped THP.
> >
> > - folio_get_anon_vma() and folio_lock_anon_vma_read() both bail out
>
> You mean folio_lock_anon_vma_read() called by others? Since there is no
> folio_lock_anon_vma_read() in folio split functions.

Oh, the original comment mentioned it, so I also looked into that.

>
> >   on !folio_mapped() before taking the anon_vma lock, so there is
> >   nothing to lock against.
> >
> > For mapped folios the anon_vma write lock is now released before
> > __folio_split() unlocks the after-split sub-folios, where previously it
> > was held across that loop, that window is harmless as the sub-folios
> > stay folio-locked and ref pinned.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 51 ++++++++++++++++++++++++------------------------=
---
> >  1 file changed, 24 insertions(+), 27 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index c4910c0b6018..53614b875794 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -4005,16 +4005,31 @@ static int __folio_freeze_split_anon(struct fol=
io *folio,
> >       struct swap_cluster_info *ci =3D NULL;
> >       struct folio *new_folio, *next;
> >       int old_order =3D folio_order(folio);
> > +     struct anon_vma *anon_vma =3D NULL;
> >       enum ttu_flags ttu_flags =3D 0;
> >       struct lruvec *lruvec;
> > -     bool need_remap =3D false;
> >       int ret =3D 0;
> >
> > +     /*
> > +      * Unmap/remap needs the anon_vma. The caller does not necessaril=
y
> > +      * hold an mmap_lock that would prevent the anon_vma from
> > +      * disappearing, so we first take a reference and lock it.
> > +      *
> > +      * An unmapped folio needs none of this: folio_get_anon_vma() and
>
> I guess you mean an unmapped folio does not need a ref or a lock on
> anon_vma. It is better to be explicit about them.
>
> > +      * folio_lock_anon_vma_read() both bail out on !folio_mapped()
>
> Mentioning folio_lock_anon_vma_read() is confusing since folio split
> does not call it.

Right, I actually just copied the original comment, and I'm a little
bit confused about it too, I can try to improve it while I'm at it.

> > +      * before taking the lock, and folio_ref_freeze() below still
> > +      * rejects a folio that picked up a reference meanwhile. Note
> > +      * a swapped-out THP counts as unmapped here as swap PTEs do
> > +      * not contribute mapcount, and they are splittable.
> > +      */

So how about rewrite this comment chunk as follows:

      /*
       * Unmap/remap needs the anon_vma. The caller does not necessarily
       * hold an mmap_lock that would prevent the anon_vma from
       * disappearing, so we first take a reference on it and then lock
       * it for write, letting unmap_folio() walk the rmap with
       * TTU_RMAP_LOCKED.
       *
       * An unmapped folio needs neither the reference nor the lock:
       * no unmap walk happens for a folio without mappings, so there
       * is no anon_vma to pin and nobody to lock against, and the
       * folio_ref_freeze() below still rejects any reference picked
       * up meanwhile. Note that a fully swapped-out THP still in
       * the swap cache counts as unmapped here, as swap PTEs do not
       * contribute to the mapcount, it is splittable just fine.
       */

> >       if (folio_mapped(folio)) {
> > -             need_remap =3D true;
> > +             anon_vma =3D folio_get_anon_vma(folio);
> > +             if (!anon_vma)
> > +                     return -EBUSY;
> > +             anon_vma_lock_write(anon_vma);
> >               ret =3D unmap_folio(folio);
> >               if (ret)
> > -                     return ret;
> > +                     goto out_unlock;
> >       }
> >
> >       local_irq_disable();
>
> Otherwise, LGTM. With the comit message and comments addressed, feel
> free to add
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks for the review!

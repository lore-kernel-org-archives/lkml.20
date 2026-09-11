Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966C5678D3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156096; cv=pass; b=E8CQFlsWMxoTbIlQKVDI3PCxrGCHWoRO76BC0Kc6A99aoHuvfzpu1ghv6P/2HvdQDVehYTMnvG8LQZscn/JhcJtBivStTSDivkNefP5+Zenw2Uf/4Xi+cZm0/1ThMUHVDu+oiEMEdlgfRg8PI2m6Pt1P3yNMN4P6SUeO/neP6go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156096; c=relaxed/simple;
	bh=wAIi5p+WM3xE4xReewx/Myw5rsTFIcQhwdeVujOwHtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sv/ztR2kCiuZ1q+Sxyc6svERpklnmxJ3L2nIg5OBB7MqU9YsUmPhzISfyo9aaGHoSrAYRuBmy1Np0xSsp7lUC48ZK4hH0U0ieRSL1a9TEJd93NkrnUQY7pp1cVqNQj2w1/zYt6JUarS84VstYNr2OhpUVONoRLDYzxUCHx9bbYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UhhkyG/6; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UhhkyG/6"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so102781cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789156076; cv=none;
        d=google.com; s=arc-20260327;
        b=GuA3brf93CnMBZwX0+8AiBInY4hd0HkK23rnyXIgVlpn7gtL6/XnDHL6f979DEy586
         yXWL1rHDlcJ6mePLQt7hLPBMoovSzCnM9Oy7t6OMx3iTmeUH6uDy5rnqyNBzVWpR65Bt
         n8GQU2Yt8FBbfnxjAw+/ug1CEh9lcM7f3x4UG2Nizwk8KAfI/rtrspQLyfTJdUwEI01o
         SMlWrDE6Q2282QgJHiJaV5LPnViUxgvPsmndfAoJlr5i6kZa2qFytYQnoP1g/oFLYzrd
         A9XamuwyJc1ngq1Tw2XpFxBpjt/17b9BctrS6oGtknbMrTJtkAt5IqTdYO6+OrpyDws9
         naQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrYQ8fif4AyPdCzj9gAZ4OwR6V4iYcgiDS5Z8k+S3YA=;
        fh=xMl9BO/62XI7Ubjt0qDeg3tcePj5cKghSXfXYS/bdSc=;
        b=cDM9AydudLHvw8PURyiI8ATowmEVB0lOaZ463e+RBr4zzPXZJ+dpqqtYAd1em1kOPl
         VtyJiY3t0/ayH+PJ5EGV/r9cn6hVSnbZFby4obFv5HDR5GSwoLTk/0VdFFP/34c0mmOJ
         51doNyF8GaHDIHO9m0EAVvRXJOm5xhAYK8ybo8UcaB5sOGOCDQK5BqaIb1r+wrIS4FbI
         HT4q8ZVg9IR3Wif2QYkWAbxdzzTdBPTpnJIMvMDyvzaCSpEIaTXWS9YklgM39kYU0z3d
         367AzZc/KBjH9IQmTZgZWpRo91nEinUmjtIC1cUA8fXfGKo2vapgMcajE2ogfVf4gAlS
         HALg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789156076; x=1789760876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrYQ8fif4AyPdCzj9gAZ4OwR6V4iYcgiDS5Z8k+S3YA=;
        b=UhhkyG/6/c3T4VMN6mxiuSHO8aJKnAncc6fkX89KS5cA0lRaAqVEsJbYsRFlTCk7De
         bne+M1b4Au4tO/Ca2cl0W5YgnTWN4e/gcruhpDqpZzVIQzdjYBICE6d1iMIVoBWyXGnf
         fIvf2amFkgvYPd90ap/mtJxB96eVv/B0cVS8LGXs76QCaALGCfQSLfUmho++5YN4ras3
         YCV19jSrLujWo/hJgLozef28Ws9/zTAS+hWSkmB6Qt5FPtgYNtluK0jzTiEW5onkBJYO
         +8uAQjfXbWbBLZh7ha1o/OsNGBA2ozPtHSSD8TeMAPzzzkfAYvfS03cQW431SBz276q6
         zdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156076; x=1789760876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrYQ8fif4AyPdCzj9gAZ4OwR6V4iYcgiDS5Z8k+S3YA=;
        b=OxEX8ebk+g/atTUGnIppMm4yM1bNFjKBgVHwUnen4M7InFuYFKuYaQ+qFOxErTDgAF
         qUnS+HERSD9y4Q3Q8wmDk6qixcBIZeU1X9/CPO5PvfAg0rSaJ03uH9mXhMelXznBg6Ju
         8a/Tmmg5qy6UbA85cuZe8zPYmxHt/teQu6PyVF7bs4AxTrBOc5Cr012GjgilUQnEJOOd
         KJ48s1E0Mgz7KevuCtyw4mtfQvybS6UWWTT6Sj09PYXSx4vRACTiNRoFFr/wwQFS/U8l
         Hyj02pdBCheC55wLvh4CsBiu9pmuRR1fLm3tRdl2qBhBLT8nsCeY6bQ8TN9DKZPWkEcs
         R8UQ==
X-Forwarded-Encrypted: i=1; AKwUvByzoOTb2F90kBR1PjqvXZ/DdAUIt/yRHI5Q5Oi/pItrSY7mHsxmHlGSIK6EyhMPPQ/nHKZehN5a5aSVKkA=@vger.kernel.org
X-Gm-Message-State: AFuF++lNu2AGBH1LEGPjV6eK5+bwysfyqQKM3INcv6znTXD1r7Vhka9X
	H/6f0WP9Xzy1SvaWvCWaJuiNt9NfPT2RnDkHXtSCzyZLRlzK3awo2m6vtcGR8OuuvdcfMNORKaP
	RH6Y/k/MH5oFdCCxd8W51e+lde4yhdPUnXZxTZNql
X-Gm-Gg: AYBFou0wRfVxzL9lJcvAmUDNNkoH5Qoq2S3mO4kg2l6sTQSzzbBOXVlgUpOpskPAxGv
	ZM62XlhTfE2QECl1AvHmO7bsSHKbF3mEQn79C4/2wFF42aSZ37E+OcYIUzQNtP3rR/Dc9GA3Ejv
	UQ4mcmVnUIjNyVawRE760l5q27caYyrkDbULeRekMN6EyKUzQJ7vU4ezJLQU+dJ4oqO/uRGHvoe
	TLAMoVFqO+2hnOrTStX3DI+kJP+wZzu9Yk1fgdDiYP9A4PuODUGC+SWBGF9VBuMiZjJU9tWTdfr
	gbt09lxNNCnETxEmbSwhACgFxKCUBoVSKJVHfiMld4cIAxz7XUcH/jjmD7lPRY9wFlImWPUbtP2
	tBnoghlaFUg==
X-Received: by 2002:ac8:5749:0:b0:530:39d7:ef48 with SMTP id
 d75a77b69052e-530e612de23mr89771cf.3.1789156074760; Fri, 11 Sep 2026 12:47:54
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911194145.1781926-1-surenb@google.com> <20260911194145.1781926-5-surenb@google.com>
 <aqRaONEiklcnblwQ@gremlin>
In-Reply-To: <aqRaONEiklcnblwQ@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 12:47:43 -0700
X-Gm-Features: AcwNN1XsaY36agWBMGEWlskBvCYjftnblVqAHV0x5LuDyqQXoH6GyBmbsL07NFo
Message-ID: <CAJuCfpFRmDJ=hu8et-M+tZtTmYoNcebaHgDqMz1V03eM7WL0LQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:45=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Fri, Sep 11, 2026 at 12:41:42PM -0700, Suren Baghdasaryan wrote:
> > smap_gather_stats() interprets its start parameter to mean vma->vm_star=
t
> > when it's set to 0. Eliminate this special interpretation and provide t=
wo
> > separate functions for a partial and complete VMA walk.
> >
> > Since smap_gather_stats() operates within a single VMA, we can replace
> > walk_page_vma()/walk_page_range() calls with walk_page_range_vma()
> > which is simpler and also can be called while holding per-VMA lock.
> >
> > No functional change intended.
> >
> > Suggested by: Lorenzo Stoakes <ljs@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> LGTM so:
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

>
> > ---
> >  fs/proc/task_mmu.c | 52 +++++++++++++++++++++++++++++++---------------
> >  1 file changed, 35 insertions(+), 17 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 0e53eb065a3e..a6026ffd07f1 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1246,20 +1246,26 @@ get_smaps_shmem_walk_ops(struct proc_maps_priva=
te *priv)
> >       return &smaps_shmem_walk_vma_lock_ops;
> >  }
> >
> > -/*
> > - * Gather mem stats from @vma with the indicated beginning
> > - * address @start, and keep them in @mss.
> > +/**
> > + * smap_gather_stats_range() - Gather mem stats from a portion of the =
@vma.
> > + * @priv: proc maps private state.
> > + * @vma: The VMA to gather stats for.
> > + * @mss: The accumulated stats.
> > + * @start: The address from which to start.
> >   *
> > - * Use vm_start of @vma as the beginning address if @start is 0.
> > + * This gathers stats for the portion of the VMA starting at the @star=
t
> > + * address.
> >   */
> > -static void smap_gather_stats(struct proc_maps_private *priv,
> > -                           struct vm_area_struct *vma,
> > -                           struct mem_size_stats *mss, unsigned long s=
tart)
> > +static void smap_gather_stats_range(struct proc_maps_private *priv,
> > +             struct vm_area_struct *vma,
> > +             struct mem_size_stats *mss,
> > +             unsigned long start)
> >  {
> >       const struct mm_walk_ops *ops =3D get_smaps_walk_ops(priv);
> > +     const bool is_partial =3D start > vma->vm_start;
> >
> >       /* Invalid start */
> > -     if (start >=3D vma->vm_end)
> > +     if (start < vma->vm_start || start >=3D vma->vm_end)
> >               return;
> >
> >       if (vma =3D=3D get_gate_vma(priv->lock_ctx.mm))
> > @@ -1278,20 +1284,31 @@ static void smap_gather_stats(struct proc_maps_=
private *priv,
> >               const unsigned long shmem_swapped =3D shmem_swap_usage(vm=
a);
> >               const bool is_cow =3D vma_is_cow_mapping(vma);
> >
> > -             if (start || (shmem_swapped && is_cow))
> > +             if (is_partial || (shmem_swapped && is_cow))
> >                       ops =3D get_smaps_shmem_walk_ops(priv);
> >               else
> >                       mss->swap +=3D shmem_swapped;
> >       }
> >
> > -     if (!start)
> > -             walk_page_vma(vma, ops, mss);
> > -     else
> > -             walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss)=
;
> > +     walk_page_range_vma(vma, start, vma->vm_end, ops, mss);
> >
> >       reacquire_rcu(priv);
> >  }
> >
> > +/**
> > + * smap_gather_stats() - Gather mem stats from the entire @vma.
> > + * @priv: proc maps private state.
> > + * @vma: The VMA to gather stats for.
> > + * @mss: The accumulated stats.
> > + *
> > + * This gathers stats for the whole of the VMA.
> > + */
> > +static void smap_gather_stats(struct proc_maps_private *priv,
> > +             struct vm_area_struct *vma, struct mem_size_stats *mss)
> > +{
> > +     smap_gather_stats_range(priv, vma, mss, vma->vm_start);
> > +}
> > +
> >  #define SEQ_PUT_DEC(str, val) \
> >               seq_put_decimal_ull_width(m, str, (val) >> 10, 8)
> >
> > @@ -1342,7 +1359,7 @@ static int show_smap(struct seq_file *m, void *v)
> >       struct vm_area_struct *vma =3D v;
> >       struct mem_size_stats mss =3D {};
> >
> > -     smap_gather_stats(priv, vma, &mss, 0);
> > +     smap_gather_stats(priv, vma, &mss);
> >
> >       show_map_vma(m, vma);
> >
> > @@ -1395,7 +1412,7 @@ static int show_smaps_rollup(struct seq_file *m, =
void *v)
> >
> >       vma_start =3D vma->vm_start;
> >       do {
> > -             smap_gather_stats(priv, vma, &mss, 0);
> > +             smap_gather_stats(priv, vma, &mss);
> >               last_vma_end =3D vma->vm_end;
> >
> >               /*
> > @@ -1454,14 +1471,15 @@ static int show_smaps_rollup(struct seq_file *m=
, void *v)
> >
> >                       /* Case 1 and 2 above */
> >                       if (vma->vm_start >=3D last_vma_end) {
> > -                             smap_gather_stats(priv, vma, &mss, 0);
> > +                             smap_gather_stats(priv, vma, &mss);
> >                               last_vma_end =3D vma->vm_end;
> >                               continue;
> >                       }
> >
> >                       /* Case 4 above */
> >                       if (vma->vm_end > last_vma_end) {
> > -                             smap_gather_stats(priv, vma, &mss, last_v=
ma_end);
> > +                             smap_gather_stats_range(priv, vma, &mss,
> > +                                                     last_vma_end);
> >                               last_vma_end =3D vma->vm_end;
> >                       }
> >               }
> > --
> > 2.55.0.1007.g17ff1f9808-goog
> >
>
> --
> Cheers, Lorenzo

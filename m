Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6339AD3A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083018; cv=pass; b=r2O88h4Pl16FtXD/La1qK5FgFUVwgnfEXAvT7yTtXo7C6VEdt6SqLQVJV8qnhToJsWhc6V+Fn78TIAJSgSxOQGYOnubAIegbihPB+8EBtk1pp5zibf6AIReH320qVxxcH62S/tYRPrrKKSnND0eU6wIcJDD5b2vPg8ymN4P027k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083018; c=relaxed/simple;
	bh=U617IjwK/DTXXMWR/2jdA00pv95iK+IC+ENWc5RiNb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFnNR5osqh09kDmU6B89jpV7jlETIrNh0CchLg5TS2g5uEeP82uCh6x66eRYyxZmwJzO5xjZYap1QLf9Edur/nwHNiPMNzvfkJFaS4d1txfKp8HsJ7XuIGuLsXYznaNGSOSLt8700FITgjZUhtCwSpzqKktMNy9eFZR+ORNTFng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmpcVaIe; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmpcVaIe"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso61851cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789083016; cv=none;
        d=google.com; s=arc-20260327;
        b=CBsK09xg8FyxA+F1oLAvCJ/9ktatSICG+F2c7Vx3IaMbxZE1RP/M52Gnlz8ftM7fP8
         N56PIl3PcWAGkD2GV54K8vTbSqZIlNVinIot7l5cTkujibRw9sVmkjppvPjR1T16U49y
         U0OCzaVtWeAKWjhI1Q3xuvLXmcc++EgPlhsGHnebzT6bdtYXP7CCmbxx3Whx6tVbM8wa
         13yieEfU0jiSU/Vv+A3k/WM3tbpYuVyj5V/ezFrUAdo7TEArNXL68RBVq42M8sYuhNoh
         +ONIkzQC4Wgdi5Q1PvAXnmzwDLON+ekzVHVhqCKOg0VCF1dMhnqYT13yg520QKkByEvY
         c9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KfEFjV7pufys+8nogVzTsTnHyxO087XXXuxAAwRJqeE=;
        fh=YUVFSuixDBf2ZaQXAI1fjon+1MhWZg9yy/hNNNGI0iw=;
        b=kIe1Mbyf2V8T3QukuNZti8kKJ6kJLYrpLvpjPPbH8Od7spFNEpiDnWr0RxPFqaftYw
         /cxaaU8YT/8i4qkxPl4mDBlmNAHo12SreG6RA5UFMPQcAkRFRJQwGJpJn+fCNJoai+2x
         xKPDMoNo54h2ws1kyAsEri+CrSToHOkD4lQjqO+qeAVj9pNS5j7QPCOdnW1l2VQqkLbS
         yFsIYGp7DT6iBwd2bfC926Spa8bUqEV8S1pQj66QjMuhXzuvMikCukBTe9spBrqg6Uq7
         DLIne7Xl3MBU1myuK2aDU4tP7IbDNcDmiT/buOW3QzLc0WMdObYfUQivpxh8npZ9GR3m
         v1hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789083016; x=1789687816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfEFjV7pufys+8nogVzTsTnHyxO087XXXuxAAwRJqeE=;
        b=rmpcVaIet+AL8IXdQSepdNWCApYHLTzudUh3G7Hwxhn8ADgShwtCk21QWODBx1S24p
         5BdvfkV1dyttqeG0CVkXOlhK91DS6Tmt3IBtg8mGlqOwNCyzZ7UBv4YSnWkJBH2O4UwC
         R1uZ4reguszY0CiI4GB1u/Tcp4Rap6+9LOj/9GHKUkIYJSdAwlfRu+aad/mWV58mOZb7
         dODnUbjYQlXc2J7Y9eNTGGNWCsjIJx32xN0k5Fm/SgyI3CXl7nRp7cDOQzUmyWslThmW
         joNIurFYF5k+jwjdnaNGNkqXr+9ZFccI2NQZGWVP3CdnJKnc/5GAFuSNIvfHhgU+p4kV
         +wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083016; x=1789687816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfEFjV7pufys+8nogVzTsTnHyxO087XXXuxAAwRJqeE=;
        b=VtuHGrxr7RSY+pA+2vobwTAcpIwsD5eYgF+wIZywZUGYpZwj4V8PLT5eR/tH4ZtE+1
         j35sh1CQTiYf/F/tuuz8C43LA9gYzgrFDVjV6B7Gr1RbhMmyyhJ/2GRUfrMbpQwyKUxC
         jgicpFYIyIetkgFRsNpR/VMMI0a2mchIjv4oyzGvMt8EcBT9PO86QK6HLn7L77JE+J/+
         KHOw2rAI6kuj9sUsz7aDpTO9tnjpaiP4Y2bwhoz4shq6DxJ17dBAjS2bJhe/SEdPSc2f
         +5zLSo0CkAEucB8IOvBxhW/72kSlpFG3SxvKoCoOMVwOwZo90uvS3v+goIcWTzPM466J
         PE6A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ9cjXrx9+TDnzAXz0Q89+UPcJEqTwd7sAQ99JZuYs4Y1RyvAUScjDd7HjaIqP04m2hFwuJ81VZmp1hjE=@vger.kernel.org
X-Gm-Message-State: AFuF++nhwWSkVjnyS4T/lBH18tD9yAPdzlOxzZrgE0eonTOGp6rq+7vV
	HUUrZvK5nlN9/4yt5Vrj3l9QGLj6sgrLcPDauP62zlHAgKE/MLdtCD86mMu2BJ8Sv40pQMIbR03
	DOScMiUbFP5p9zjCPQv6L1f4apMxgYyjyB0RBb9sk
X-Gm-Gg: AYBFou2UOK7Ky1z6NugOstbBbMSjJcEU1Kt9TsjOf1avMUDU95lmdlKpGR/GyXV6gl4
	RYmJgd3doADwM41/jxI29Fsz1qkIZPNQluZRFb3NWSOs4n/a7ko+PugoGMQ4vjCqBceZq+zVpwS
	KLg9EH7XIZuKiKxYvIayUMLA8fscC1/Iu+dqgXYtlXjHFDq1cOXYxGMabVmgT+QtvJY3fr9vNbw
	9NVcYePq6E+re/bROxUn3ALUD+1sR0ETgvVrEHmjdU1AGpm/HCWnT4i+/AN5taBW2pdURD57wtK
	jruJ2lvnRQcTjeIVAj/PdLP7nPoREmSaqn1itC7ytSE7nEgZwhit090JIqYlkHbaf+ShjeCTaE/
	G/MZKkoqwnCY=
X-Received: by 2002:a05:622a:17c5:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-530cb488208mr4688201cf.3.1789083014965; Thu, 10 Sep 2026
 16:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org> <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
 <8e643f51-a47f-428e-9443-678326288fa6@kernel.org> <aqLUqsoMDfVtjRuN@gremlin>
In-Reply-To: <aqLUqsoMDfVtjRuN@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 16:30:03 -0700
X-Gm-Features: AcwNN1W4yJUYStTy2CGNJdnxaH7FRdF38u1M6kpzgz8yoKPhhVSmpMzOaXNoWCY
Message-ID: <CAJuCfpH_t5xOm_=QkKJs+GWH92ThKwifC7Ruo8xx5LKRp6gjaQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, liam@infradead.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:27=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Wed, Sep 09, 2026 at 09:16:23PM +0200, David Hildenbrand (Arm) wrote:
> > On 9/9/26 20:28, Suren Baghdasaryan wrote:
> > > On Wed, Sep 9, 2026 at 10:16=E2=80=AFAM David Hildenbrand (Arm)
> > > <david@kernel.org> wrote:
> > >>
> > >> On 9/7/26 08:39, Suren Baghdasaryan wrote:
> > >>> smap_gather_stats() interprets its start parameter to mean vma->vm_=
start
> > >>> when it's set to 0. Eliminate this special interpretation and pass
> > >>> vma->vm_start explicitly when needed.
> > >>>
> > >>> Since smap_gather_stats() operates within a single VMA, we can repl=
ace
> > >>> walk_page_vma()/walk_page_range() calls with walk_page_range_vma()
> > >>> which is simpler and also can be called while holding per-VMA lock.
> > >>>
> > >>> No functional change intended.
> > >>>
> > >>> Suggested by: Lorenzo Stoakes <ljs@kernel.org>
> > >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > >>> ---
> > >>>  fs/proc/task_mmu.c | 40 ++++++++++++++++++++++------------------
> > >>>  1 file changed, 22 insertions(+), 18 deletions(-)
> > >>>
> > >>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > >>> index 9908ba32f180..3351decd1172 100644
> > >>> --- a/fs/proc/task_mmu.c
> > >>> +++ b/fs/proc/task_mmu.c
> > >>> @@ -1246,20 +1246,27 @@ get_smaps_shmem_walk_ops(struct proc_maps_p=
rivate *priv)
> > >>>       return &smaps_shmem_walk_vma_lock_ops;
> > >>>  }
> > >>>
> > >>> -/*
> > >>> - * Gather mem stats from @vma with the indicated beginning
> > >>> - * address @start, and keep them in @mss.
> > >>> +/**
> > >>> + * smap_gather_stats() - Gather mem stats from @vma.
> > >>> + * @priv: proc maps private state.
> > >>> + * @vma: The VMA to gather stats for.
> > >>> + * @mss: The accumulated stats.
> > >>> + * @start: The address from which to start.
> > >>>   *
> > >>> - * Use vm_start of @vma as the beginning address if @start is 0.
> > >>> + * This gathers stats for the whole of the VMA unless the lock was=
 dropped
> > >>> + * and VMA grew or got merged and we found it again, in which case=
 we only
> > >>> + * gather stats for the remainder of the VMA range.
> > >>>   */
> > >>>  static void smap_gather_stats(struct proc_maps_private *priv,
> > >>>                             struct vm_area_struct *vma,
> > >>> -                           struct mem_size_stats *mss, unsigned lo=
ng start)
> > >>> +                           struct mem_size_stats *mss,
> > >>> +                           unsigned long start)
> > >>>  {
> > >>>       const struct mm_walk_ops *ops =3D get_smaps_walk_ops(priv);
> > >>> +     const bool is_partial =3D start > vma->vm_start;
> > >>>
> > >>>       /* Invalid start */
> > >>> -     if (start >=3D vma->vm_end)
> > >>> +     if (start < vma->vm_start || start >=3D vma->vm_end)
> > >>>               return;
> > >>>
> > >>>       if (vma =3D=3D get_gate_vma(priv->lock_ctx.mm))
> > >>> @@ -1279,20 +1286,17 @@ static void smap_gather_stats(struct proc_m=
aps_private *priv,
> > >>>                * Unless we know that the shmem object (or the part =
mapped by
> > >>>                * our VMA) has no swapped out pages at all.
> > >>>                */
> > >>> -             unsigned long shmem_swapped =3D shmem_swap_usage(vma)=
;
> > >>> +             const unsigned long shmem_swapped =3D shmem_swap_usag=
e(vma);
> > >>> +             const bool shared_or_ro =3D vma_test(vma, VMA_SHARED_=
BIT) ||
> > >>> +                                       !vma_test(vma, VMA_WRITE_BI=
T);
> > >>>
> > >>> -             if (!start && (!shmem_swapped || (vma->vm_flags & VM_=
SHARED) ||
> > >>> -                                     !(vma->vm_flags & VM_WRITE)))=
 {
> > >>> +             if (!is_partial && (!shmem_swapped || shared_or_ro))
> > >>>                       mss->swap +=3D shmem_swapped;
> > >>> -             } else {
> > >>> +             else
> > >>>                       ops =3D get_smaps_shmem_walk_ops(priv);
> > >>> -             }
> > >>
> > >> Horrible, horrible code, really. But not your fault :)
> > >>
> > >> I think we can just make the shared_or_ro less odd by just checking =
for cow
> > >> mappings (as described in the comment).
> > >>
> > >>         const bool is_cow =3D vma_is_cow_mapping(vma);
> > >>
> > >> ...
> > >>
> > >>         if (is_partial || (shmem_swapped && is_cow))
> > >>                 ops =3D get_smaps_shmem_walk_ops(priv);
> > >>         else
> > >>                 mss->swap +=3D shmem_swapped;
> > >>
> > >> That's almost in a form that I could understand what's happening.
> > >
> > > Hmm. So, are you saying that !is_cow always implies shared_or_ro? Or
> > > maybe you are stating that vma_is_cow_mapping() was the actual intent
> > > here?
> >
> > So the comment says:
> >
> > "For private writable mappings, we might have COW pages that  .."
> >
> > Which translates to:
> >
> >       private writable =3D=3D vma_is_cow_mapping()
> >
> > >
> > > shared_or_ro =3D VMA_SHARED_BIT || !VMA_WRITE_BIT
> > >
> > > is_cow =3D !VMA_SHARED_BIT && VMA_MAYWRITE_BIT
> > > !is_cow =3D VMA_SHARED_BIT || !VMA_MAYWRITE_BIT
> > >
> > > so, !is_cow would impy shared_or_ro only if !VMA_MAYWRITE_BIT always
> > > implies !VMA_WRITE_BIT. But I think it's possible to have a VMA that
> > > has VMA_WRITE_BIT but not VMA_MAYWRITE_BIT, right?
> >
> > VMA_WRITE should imply VMA_MAYWRITE
>
> Yup it's illegal to set VMA_WRITE_BIT without VMA_MAYWRITE_BIT.
>
> >
> > (in sanitize_fault_flags() we even disallow write faults entirely if VM=
_MAYWRITE
> > is missing)
> >
> > For example, a
> > > driver can create such a VMA to allow writing to the VMA but to lock
> > > its content once mprotect(PROT_READ) gets called.
>
> I'm not even sure how a driver would achieve that but drivers in general =
are not
> permitted to alter VMA flags after map time.
>
> >
> > I don't think that would be valid for a driver to do. But it wouldn't m=
atter
> > here because
> >
> >       shmem_mapping(vma->vm_file->f_mapping)
>
> Yup :)
>
> >
> >
> > I think we could simplify the comment as well to:
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index e671b4fd8dedd..4b7e7089cafa7 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1303,12 +1303,10 @@ static void smap_gather_stats(struct proc_maps_=
private
> > *priv,
> >
> >         if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
> >                 /*
> > -                * For shared or readonly shmem mappings we know that a=
ll
> > -                * swapped out pages belong to the shmem object, and we=
 can
> > -                * obtain the swap value much more efficiently. For pri=
vate
> > -                * writable mappings, we might have COW pages that are
> > -                * not affected by the parent swapped out pages of the =
shmem
> > -                * object, so we have to distinguish them during the pa=
ge walk.
> > +                * In CoW mappings, we might have anon folios that are
> > +                * independent of the shmem object. So fallback to the =
less
> > +                * efficient mechanism in such mappings.
> > +                *
>
> Maybe tweak to 'CoW mappings might map anon folios that do not belong to =
shmem,
> so perform a less efficient page table walk in this situation' or somethi=
ng like
> that?

I ended up with this:

/*
 * CoW mappings might map anon folios that do not belong to
 * shmem. Perform a less efficient page table walk in this
 * situation, unless we know that the shmem object (or the
 * part mapped by our VMA) has no swapped out pages at all.
 */

Hope this explains the condition clearly.

>
>
> >                  * Unless we know that the shmem object (or the part ma=
pped by
> >                  * our VMA) has no swapped out pages at all.
> >                  */
>
>
>
> >
> > --
> > Cheers,
> >
> > David
>
> --
> Cheers, Lorenzo

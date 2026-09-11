Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7B4A5EC5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145945; cv=pass; b=D6joa1ISXB5M/eEl0ajUa/90XT06p5FBEcJg1NJsA0gfFvltLDoIfJYaGmahbgLvH6ZNEV+6b+Qn768xQWxIeVKVFmB5OMC2eUrXCDDxpFMmYGZbCSzDNylybidYi6olMxQOAFgIZ5vNh426AFvOLCLvmTHSg7uk8oJF4Uo1Xpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145945; c=relaxed/simple;
	bh=BFv2xCJ+gchh9ZLmDgz/PXCvLanZdyXlYRvc/vrR/E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxESqJ2bQcCAC/pHvhZ/65r+ylA5MH3ZxXXABItPr62yu5QlXHsQdlFANcv9HIr/O+XDoO9+QbtK5rFxG3atYMOpMMmiRLzWyfeW/7RK2X6CkgjHN8eZAZ89xeFJYkftsnAnScCoCXDm28bkO8ea4W0072gKzRy954JQn731Ak0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOzcDimH; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOzcDimH"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a26ce21aso1618a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789145935; cv=none;
        d=google.com; s=arc-20260327;
        b=TZqc3RMjg4UDyY3NM5GBC7yg32ANGkpy9gDk22XLge7wkLIeVPZS/gtkDLwR0SL2qE
         mkQAMqUurKSE6Zhs9IGU43FmsY2bdg7ErMEsNJ8XZa3oCpEGH3bxEm7ZrU5xvjkpyQad
         Me0U3b/YBEP6RrWDdslj2BfxlItE0vMOK24yESWeToPMYpIAZSKw1ZfZZxWm0v+qpVaw
         ylHRzoo5pQDsCQ11rpKtArRhbKeIl8j9nQNU1ebhlzpyZUJB7oA56wES8mEJYb/lfGm0
         +zwNSqbmg5Fm77lbX1ivzbi99gZEnUWt6k7KNOrghgO2o2cUIEUeztX/ytrgITGWr3k0
         FF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UFVJB/t1wJIF2zJn+12TmI80iSD7jjCRXFUeDSVhp0=;
        fh=B+WDxgI3bVMf79ZMUYlxTQg7iGiE95aY1OsCc9YuO34=;
        b=Bx7GJ6XG8d+0pifaU8DO4YU0fs+86zwTfwDGq7UF6LiJEttGkXzXRWGqiajdm+YFKx
         DC1Z/RemfizcNma/m0Z6RKvEDuVFNAK9lCUDol9Hlku6PTzQQhKsXyRSquQe0wIUnaPR
         5EjRFgphUikI/rX80d9mtbyLdnB8L7ATz0hv42U9mTinRUXvAaayHsXz4Ta2QDdf0wSI
         iFNS3AOxjgcXS6yCvrTG2pQN3048GFoq3lkszQ4K1tSDBYXbt23cLS8r7ePucDK5cAuL
         r2R7/NYOYiBa+wvD2DYF5gdGdBCgJdPypJg19oO3VQdIdH6VeQ5aerPMna7bhgaC3hLB
         pWmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789145935; x=1789750735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UFVJB/t1wJIF2zJn+12TmI80iSD7jjCRXFUeDSVhp0=;
        b=hOzcDimHsKyuhZtOdgjlqF0Qy8Iv4eao12tpCN9RFY9VA8WELBgMoX1ibNsrgSYbQd
         U1YdZ2VR6UVwCpt9GgRDMrS+BhcyA7saNpM6AQSNxwH+xdBF8mxwhcGk4PvMjO3Xj/Dx
         IkOCz54UvVWvXCMjwt03UvZPstYOTBk0AXoAeqPUMjtqfxqgtHLilMoteDew8Vj0ndlv
         vH/Mnf4jY+bAbNk+rr8d0IlXPnsFj4Zq0R4ojkNU4izDE3+4oHRTW2yOIBukeR67CUgL
         i+7217GotpYaZhiC68Zq3l/R3vyP9b7V7sMp8Ji/xoi+sCTtGWvNAj5nWu1N/vviw/pf
         OIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145935; x=1789750735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UFVJB/t1wJIF2zJn+12TmI80iSD7jjCRXFUeDSVhp0=;
        b=hp8FFWs4ceDXUtR6rldpAIuN4FwcbIF4a9tKk0utd/SAKA+CaxQcSAINOelalK2tmL
         YdtJNNpmSaubxjJlCuyOOV50HoOWaZVfFP13TuGt9qY98VPbfSNQeRM4RsoJA/Ez9iLa
         9mTYRX47pt1uKKSpQ5XeBNgITAU8a8OM5Xfx/CyW7oxgLHgnqTWuz+q524HLFAVTFyPV
         BsTuat8KFm5g6jS8bPAinyulkOHgWJXUOnVeUaoIXp1ClL1wVy3qyi/7IrMAbtOnFEfE
         fy6/jVPXP2pb/+flfpoKPSgURn9HdFDBfDB0AhiRvUtMaXyQmZ0qqVCfayRd8p1bnvQ8
         D1rg==
X-Forwarded-Encrypted: i=1; AKwUvBw/sOjvi9D9H0z7R+Bgl0NnhYveRuZcOgoZ+dA7q06tkFUiASHsxnJIzGHI3rPPsfcSDZ3QgAQV8LKAo0I=@vger.kernel.org
X-Gm-Message-State: AFuF++lYEQRIExOdstwolJj+0vhMdEOoNhmx4zgVTjLWAg9HJOzAgJsE
	RqxR/sxiqEAaUAQp4+wwTS1YdNooccCiRVrqM8PRdnjJBKTFw54hd7m08lJfXs75HGYBAyJji2z
	15hhVUWyOLnYTGU+n30wHtMy7JZ/eQwelNIPfwIG2
X-Gm-Gg: AYBFou1Hxz1HR7mqSByvdfuihsCXqAbXiM1s1+DcxHlAX+eS7crCgsE5nBgSRu17T+v
	+SuYpC2sxQz2Emd5I/CBkuvW5oSJUv/CYRCENlEH9I6SiClAt4xIU5de1R2dZorXcLhaT2dOoZM
	B0aLAdYsuzWnufisCXnQ39groZGsauOH2dtMDsydQXfAOkQmnC9Q6MIMkOOOt4CQlmWKOA8uV6j
	ExCmu+daB9ZVD5502Ft7xHnL0X99BdZdfIA90YjvOW6SgGbkPjL/YfP9VRdzN+GePnOh7FUjreJ
	QbCvXrD8hXbE6n/Mjg2Bfen21wfTihFa2S0bpjX0v1rLPPxaOS6ped84msfGKzK+ePYKT4Xnf3c
	dQtKlwjo=
X-Received: by 2002:aa7:c9ce:0:b0:6a6:b2b7:d95e with SMTP id
 4fb4d7f45d1cf-6a9b7ed5ba3mr47814a12.1.1789145934186; Fri, 11 Sep 2026
 09:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-4-surenb@google.com>
 <aqQoPTTUC9M5HkYb@gremlin>
In-Reply-To: <aqQoPTTUC9M5HkYb@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 16:58:40 +0000
X-Gm-Features: AcwNN1UM3yjxwMG1RFJX8uA8kFkwwpULaawjPeyZpB3-W8R99XvZA0blXusxpXQ
Message-ID: <CAJuCfpEHeFSMamNhf=FLvFjh9D8DBwZtbKwL0zi=x-2g8B+ENw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] proc/task_mmu: clarify shmem mapping walk
 conditions in smap_gather_stats()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 4:28=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 04:47:33PM -0700, Suren Baghdasaryan wrote:
> > smap_gather_stats() optimizes stats gathering by skipping the walk for
> > shmem mappings in certain conditions. Update the comment to clarify
> > these conditions and use vma_is_cow_mapping() for COW identification
> > instead of open-coding it.
> > Instead of using (start !=3D 0) condition to identify partial walks, us=
e
> > more semantically correct (start > vma->vm_start) check.
>
> I don't agree what you're doing is semantically correct, it's a hack real=
ly.
>
> Callers are passing start=3D0 to indicate that the entire VMA should be
> processed and that happens to fulfil your criteria but in a surprising wa=
y.
>
> And the start in these cases is corrupted.

Well, the "other" Lorenzo does not agree with you and suggested this
approach in [1]. Specifically, see the comment:
```
I also don't love that 0 is taken to be 'start from vma->vm_start' and I
also don't love that the code in smap_gather_stats() actually special cases
this...

How about passing last_vma_end and making smap_gather_stats() more sane? In
the other invocation of smap_gather_stats() we could pass vma->vm_start
here.
```

[1] https://lore.kernel.org/all/aifO_rCurVhFRTcl@lucifer/

>
> >
> > No functional change intended.
> >
> > Suggested by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  fs/proc/task_mmu.c | 24 ++++++++++--------------
> >  1 file changed, 10 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index cfc7af1b551d..3c40c9cbb9c9 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1257,6 +1257,7 @@ static void smap_gather_stats(struct proc_maps_pr=
ivate *priv,
> >                             struct mem_size_stats *mss, unsigned long s=
tart)
> >  {
> >       const struct mm_walk_ops *ops =3D get_smaps_walk_ops(priv);
> > +     const bool is_partial =3D start > vma->vm_start;
>
> Yeah not in love with this, without changing how it's called.

See [1]. This is exactly how you wrote it at the end of that reply.

>
> If you're reworking it all already, the actually semantically correct thi=
ng
> I think would be to do something like:
>
> static void smap_gather_stats_range(struct proc_maps_private *priv,
>                 struct vm_area_struct *vma, struct mem_size_stats *mss,
>                 unsigned long start)
> {
>         ...
> }
>
> Then to drop a parameter in smap_gather_stats() like:
>
> static void smap_gather_stats_range(struct proc_maps_private *priv,
>                 struct vm_area_struct *vma, struct mem_size_stats *mss)
> {
>         smap_gather_stats_range(priv, vma, mss, vma->vm_start);
> }
>
> And then you remove the hack and make is_partial not be accidentally true=
 for an
> invalid start parameter.
>
> >
> >       /* Invalid start */
> >       if (start >=3D vma->vm_end)
> > @@ -1270,23 +1271,18 @@ static void smap_gather_stats(struct proc_maps_=
private *priv,
> >
> >       if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
> >               /*
> > -              * For shared or readonly shmem mappings we know that all
> > -              * swapped out pages belong to the shmem object, and we c=
an
> > -              * obtain the swap value much more efficiently. For priva=
te
> > -              * writable mappings, we might have COW pages that are
> > -              * not affected by the parent swapped out pages of the sh=
mem
> > -              * object, so we have to distinguish them during the page=
 walk.
> > -              * Unless we know that the shmem object (or the part mapp=
ed by
> > -              * our VMA) has no swapped out pages at all.
> > +              * CoW mappings might map anon folios that do not belong =
to
> > +              * shmem. Perform a less efficient page table walk in thi=
s
> > +              * situation, unless we know that the shmem object (or th=
e
> > +              * part mapped by our VMA) has no swapped out pages at al=
l.
> >                */
> > -             unsigned long shmem_swapped =3D shmem_swap_usage(vma);
> > +             const unsigned long shmem_swapped =3D shmem_swap_usage(vm=
a);
> > +             const bool is_cow =3D vma_is_cow_mapping(vma);
>
> Nice to see this helper naturally slot in to new stuff :)
>
> >
> > -             if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHAR=
ED) ||
> > -                                     !(vma->vm_flags & VM_WRITE))) {
> > -                     mss->swap +=3D shmem_swapped;
> > -             } else {
> > +             if (is_partial || (shmem_swapped && is_cow))
> >                       ops =3D get_smaps_shmem_walk_ops(priv);
> > -             }
> > +             else
> > +                     mss->swap +=3D shmem_swapped;
> >       }
> >
> >       if (!start)
>
> Also not absolutely in love with the fact you only use is_partial above a=
nd
> leave:
>
>         if (!start)
>                 walk_page_vma(vma, ops, mss);
>         else
>                 walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss)=
;
>
> As-is.
>
> Should be:
>
>         if (is_partial)
>                 walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss)=
;
>         else
>                 walk_page_vma(vma, ops, mss);

True, that can be changed here too. This whole block is replaced in
the next patch though.

>
> But I also wonder whether, with start not being corrupted (!) you could
> just replace this with:
>
>         walk_page_range_vma(vma, start, vma->vm_end, ops, mss);

Yep, that's done in the very next patch.

>
> Looking at the pagewalk.c implementations I don't know why
> walk_page_range_vma() doesn't just forward [vma->vm_start, vma->vm_end) t=
o
> walk_page_range_vma()... but that's another thing :)
>
> > --
> > 2.55.0.1007.g17ff1f9808-goog
> >
>
> --
> Cheers, Lorenzo

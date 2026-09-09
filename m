Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF639BFFE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978524; cv=pass; b=PwJC9zSgmB0qT0HwRoyLdSvpqVGuhuIFXaIpg8DgvpmsdlPhqmdLj3YoXuWEYPH6TYSAON0EJnsaPHfqYSQk7Itga+afv7mnIW5W8mVSoPOYbSMQnC8c6G3bd13LZhUBGFd3Ip/4gp0D5yqpg0y/mxecUdBiPKWdHaizCISQyGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978524; c=relaxed/simple;
	bh=jOYWbqbGjEZ74DbR/7Sly5b/bgYTeI+rrk8WcUJjSkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQGv6h7hbyxu4ifYYzeoNIt52e9VtKtTuNqSrxeCDGtfA65HaWduTYL7xLF/h4gD/rpcN1IdQg/MVLfw5l+3LvDRpQ+29ytN/K4NHBxulaloazMHOPILzx4+jSxWzoBIvJPYTcSnIbKO5aN8oJzcEK+kv3ItMg8TPf+QESODp6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4/q/isB; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4/q/isB"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso332931cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788978521; cv=none;
        d=google.com; s=arc-20260327;
        b=GFvlAZLRq3aUl/+CDov5DWX2Q2LQ9Etp4XSF7c16SBlQjd5mgFy7+ixMUrRdm/lDUr
         buR+nHHXTysQIhc2fCOTd+DBGCFIU4fJGslVFuL0M1RSWMD2ihLU+5JEuIoSomK/1uhM
         FU8VzR9mhlqVDgo8ymVqAlRiQfqT2+zJtg5C+xGbWdfUirCdjZalSgUWyPEhUtOs5eN3
         aQySmlHqdVsFSRGHFfW0VyuYPDRy0bWwlTp2xdu/tmfXU97LGYOEOkW9Fu7DhWXplLhE
         qMGcbMIpCMJlBEUmnH2FCFsE7uWKQInflzGAg8T9mpirFgQpbpfXPa2kYsu9vK87zPpb
         KnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJDbFOIPiBEjqRCw5Yx9h+UnhUPff8j+dBiof+7K4sg=;
        fh=CuTNRoTDJAMDoEpTKkRmKUyV9FNWv5uJJyOMmKucV6w=;
        b=fu5+5BEr4lhgbi22hl3Ox1imOeZSeQuxSci/C7MGWTvdU87uY5HCtnjrRYhaxM3shc
         IZWGv2byjsTP9pou1Q4bbzhqCjzjI32PzntVSpkkfRkt6TPunLGs6evVlcKfUcdHCaQ1
         tv/048VE+szgVWdkORAm+G84K48r7m+66d9JYE8ygLj4VpFRgiu5bFXzyLZuP8XzWuRP
         3ZcazrX8IFBnSVO1/8v3DClSZ7npdItYKMGORvT7QkRcwRKvZqf0p3JshXJO9Zs2E2YJ
         11MfZiexMBVoBsfZHkD48UKDcAUwrJJ8EGdsN8q0O9foSL6oyaybq4tKXozlTCz6JDur
         dEnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788978521; x=1789583321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cJDbFOIPiBEjqRCw5Yx9h+UnhUPff8j+dBiof+7K4sg=;
        b=p4/q/isBk5lROf1RGTUomRWvG2hT/11iSCXoMxc4ZseD3B9E00yHQ51ywEJTRyYC2w
         orMHTe6UMqsXAJVvLeG0GleJaXTMiMfMb/fCvEt+db3j98vBnPZwofjsT7942JflPOws
         6xTrqPN/5e7r14p9DyLFnSFAaeCTqzeOtM+30sbMv5SpDKFTDWfzzbqrfGqCqgKXvvdM
         tw2f4WPyeJxbS9SAPvBUNpNigMI82RLxYizDPIv9cNulFFd77R4a11/Gu0hNy/s0bD/Q
         04DUS1qU1CroHAwbUfiNibYf6cTzQw2InAA8SR5MHoluS5w2UTLXBltz0Q2aZi6H6fIR
         v/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978521; x=1789583321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJDbFOIPiBEjqRCw5Yx9h+UnhUPff8j+dBiof+7K4sg=;
        b=Nxb7IqQFTNXQH2NlcDZ7sszAxcJWbfjncz3wbcVRf0VNdtBdHYPwQJjKPKPaX+BuaM
         pxWPhErZ/CQiNzkK9wW2sltjfjLtyk3USHR5tYXzCxUn6Dq/knT4uYmXLqdKgUC458p6
         6qXXDoPTrmIdwrScNhf1MRD0u+4FupExTB2mPZ3gpo5E+7xyB/4i1ysPW2Adcpe5SZq3
         WqYsh2ZCmjnzku2iWu3N7ommIz57fJGVfaKHEj22bzn4QwkODqikhGIRZiopbSmEhRRY
         lp7/j6zfy6RrbChGQB33Bh/o7tHd3AbidnJA0O2JjVRu2D8Vbn0ZTN7PQRQeNImWgaHV
         qpaA==
X-Forwarded-Encrypted: i=1; AKwUvBy1rh/JnIn+VCAkhfKXCw/7apghv0VXZ8HSCSLCxexWpP6383vTDxAZu5xcdP3EE2kIoL54EAFT6GZAIB4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQCmI41ovL4jlGm+58whazFpHUJLCbUxJrteWFFyL8VLIZyqnw
	jKaIeu7wk+l1qRNtqD083dJN9DoRbXlykhus5OukocSuxYCpD/lLScSKByNdDihJOb60VDuZ35e
	eKy5lFlVWZlID0Z/3oVfYHgxrcfr/usbuDbZCd6pf
X-Gm-Gg: AYBFou224dYjb2Z4DOOD0J3iBSBhLPt4xGxqkT5G+StG0RtUC7nrAe9zjptcC3udtrw
	N0pe97hgpBtYRmMla8u4C7nfdm8fczd23rQ76Ybijob6/5anFpxoNcQ0LpBUG3vERPMkPGZ83x+
	Fu2hfbNHL72k4Vbt1jlD/sdi9OKaqzkNAdltcwYWHq8wPEl7uPSZbscFn7J+F8CWC2w0hA5EFXP
	w5Aial3Yw4wV7xk0+lpsUD6YtYmddCo7v3SlQXAbQThZJ1UqmcHiJCG1MMUn7MyxX3Vx1+kXtd9
	GdmW96tn+oWxobJFmiUlwhJ49OpgndLXocA/8c3bA8YgqFfqyK9lwc6+WQ==
X-Received: by 2002:a05:622a:4a8f:b0:530:4381:e745 with SMTP id
 d75a77b69052e-530b48fe16amr625971cf.10.1788978520364; Wed, 09 Sep 2026
 11:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org>
In-Reply-To: <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Sep 2026 11:28:29 -0700
X-Gm-Features: AcwNN1UhCxMjsN-ZvXY1SXXIlCU2WXXFiLWmPzRsbEUiUvDAd79GPKH9ucEAeVU
Message-ID: <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:16=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/7/26 08:39, Suren Baghdasaryan wrote:
> > smap_gather_stats() interprets its start parameter to mean vma->vm_star=
t
> > when it's set to 0. Eliminate this special interpretation and pass
> > vma->vm_start explicitly when needed.
> >
> > Since smap_gather_stats() operates within a single VMA, we can replace
> > walk_page_vma()/walk_page_range() calls with walk_page_range_vma()
> > which is simpler and also can be called while holding per-VMA lock.
> >
> > No functional change intended.
> >
> > Suggested by: Lorenzo Stoakes <ljs@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  fs/proc/task_mmu.c | 40 ++++++++++++++++++++++------------------
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 9908ba32f180..3351decd1172 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1246,20 +1246,27 @@ get_smaps_shmem_walk_ops(struct proc_maps_priva=
te *priv)
> >       return &smaps_shmem_walk_vma_lock_ops;
> >  }
> >
> > -/*
> > - * Gather mem stats from @vma with the indicated beginning
> > - * address @start, and keep them in @mss.
> > +/**
> > + * smap_gather_stats() - Gather mem stats from @vma.
> > + * @priv: proc maps private state.
> > + * @vma: The VMA to gather stats for.
> > + * @mss: The accumulated stats.
> > + * @start: The address from which to start.
> >   *
> > - * Use vm_start of @vma as the beginning address if @start is 0.
> > + * This gathers stats for the whole of the VMA unless the lock was dro=
pped
> > + * and VMA grew or got merged and we found it again, in which case we =
only
> > + * gather stats for the remainder of the VMA range.
> >   */
> >  static void smap_gather_stats(struct proc_maps_private *priv,
> >                             struct vm_area_struct *vma,
> > -                           struct mem_size_stats *mss, unsigned long s=
tart)
> > +                           struct mem_size_stats *mss,
> > +                           unsigned long start)
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
> > @@ -1279,20 +1286,17 @@ static void smap_gather_stats(struct proc_maps_=
private *priv,
> >                * Unless we know that the shmem object (or the part mapp=
ed by
> >                * our VMA) has no swapped out pages at all.
> >                */
> > -             unsigned long shmem_swapped =3D shmem_swap_usage(vma);
> > +             const unsigned long shmem_swapped =3D shmem_swap_usage(vm=
a);
> > +             const bool shared_or_ro =3D vma_test(vma, VMA_SHARED_BIT)=
 ||
> > +                                       !vma_test(vma, VMA_WRITE_BIT);
> >
> > -             if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHAR=
ED) ||
> > -                                     !(vma->vm_flags & VM_WRITE))) {
> > +             if (!is_partial && (!shmem_swapped || shared_or_ro))
> >                       mss->swap +=3D shmem_swapped;
> > -             } else {
> > +             else
> >                       ops =3D get_smaps_shmem_walk_ops(priv);
> > -             }
>
> Horrible, horrible code, really. But not your fault :)
>
> I think we can just make the shared_or_ro less odd by just checking for c=
ow
> mappings (as described in the comment).
>
>         const bool is_cow =3D vma_is_cow_mapping(vma);
>
> ...
>
>         if (is_partial || (shmem_swapped && is_cow))
>                 ops =3D get_smaps_shmem_walk_ops(priv);
>         else
>                 mss->swap +=3D shmem_swapped;
>
> That's almost in a form that I could understand what's happening.

Hmm. So, are you saying that !is_cow always implies shared_or_ro? Or
maybe you are stating that vma_is_cow_mapping() was the actual intent
here?

shared_or_ro =3D VMA_SHARED_BIT || !VMA_WRITE_BIT

is_cow =3D !VMA_SHARED_BIT && VMA_MAYWRITE_BIT
!is_cow =3D VMA_SHARED_BIT || !VMA_MAYWRITE_BIT

so, !is_cow would impy shared_or_ro only if !VMA_MAYWRITE_BIT always
implies !VMA_WRITE_BIT. But I think it's possible to have a VMA that
has VMA_WRITE_BIT but not VMA_MAYWRITE_BIT, right? For example, a
driver can create such a VMA to allow writing to the VMA but to lock
its content once mprotect(PROT_READ) gets called.

>
> --
> Cheers,
>
> David
>

Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC61C3BFC
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788011655; cv=pass; b=E863Z7Q8DQnn6EyG9mnJj5Xyo49TcXndwT1dY34i/YBAFSQU4iz9cmX/+XgsiMDxb0KNjDjL7Un6htLr5eIyQOsoO03XQaT2+a4WJ9l4sDIMw5/n5nz46C5zYTyfXCwq8y81anhZjlszaatzbUvZQK/wXQOKZ3XnhPi33vMG3Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788011655; c=relaxed/simple;
	bh=iOP5fOJL9Ek9Yn/KTy+IzSt971mig7iJQaYeF+uIs7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tudJAU9CjQ0sC7D7Bk+QX009/pllcMqErjPXrDUqI9msUqLqPql7+CfGILzWKQRLw1AGHd4iqi9TlWNvDDsXVHWhlbb9cU7D0oq1zvMuTJlpxIqpHTQqBWiPjwBWPy2rUS4aHEsrpDLmJTddVyE1Z+Ux9QhX0XSOVib/hw9lLYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTUbKzNe; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTUbKzNe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so13415065e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788011652; cv=none;
        d=google.com; s=arc-20260327;
        b=d+FJSuJI+eUx3kNq5aJblAF17PQU01RUzG45PDy8dJzaib3+ELBZlTGP9CEhseDBwj
         bF7A1vBtq2rJC4H4EjA1XRIMy9gDLba5E+wvilDt0NEwo9lALdZULIMvcCtVEY/M0THJ
         VujHUF6ufUdxEXgNzKBzjGUVe8pwHgp8lX0VLG8F8kHiNogRHWI9Tkeduk0osx420xY3
         nTuRBa5ZgQKX8oFOAEOD3Ns3I8DFMqlojahEFI8CF2x+a78Y20OYJazxp3QIPP6UUNgr
         DN39oZUzP4sVGWsZiIKv2PyWPQ1lYz3I43dJTlql8LIZel2Q2f1Cdg6RMQykAINYqcZL
         PkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eOJDD5tWPDHOsVb80QoaWRjR16NkDSsX//qgGD2tc1A=;
        fh=nIQomP3iFyWsMO75J2g+g5hHpaJCF6lZTK7B+KNYme8=;
        b=XWiFC4cEhkJvJAiPV+/rJR55I3BaAPLHWJ7Gt3D4ii64X3qQmHnkKacd2oVocqhxMv
         /uV53FFDGcVE+ULXZfCRNwu2HIyPde7TwY6r4l8A+T1KVk67oCiL2d8HNZLIYDGnLR+B
         ySfrR8hrE4rTQYwnJVvqFrJgDQiQOlYzxeKPqzHodn2BPwjCRZ/urMoA5FyNSYbt0j+h
         hjDbuI+kbpYm8+OXWrJK0k9A1zmcotQwHGUf6xFaPdPnkkwgamQX0by108n42GDNFloU
         pWFiUvTniTZQNGoKVqoj4DpQofFl3nc180QwoLMw5C3cOtUOZ4YUTLXl90zr9pS3uOH1
         lJvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788011652; x=1788616452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eOJDD5tWPDHOsVb80QoaWRjR16NkDSsX//qgGD2tc1A=;
        b=BTUbKzNeqIDyccNO6RCxkB2rtO1UxSmrJ0lXAQnmCE0VHp8ysz9AW8/Sz2gK0Bv3of
         s0XeaQShi8l74tzFklHlANbTZw0o/etbvB2rAmykVcUyMHzUPVxiuYnywPYYJaXThchm
         lVCsgTvGvJuYvmtl+xdBAIa2af+Jk9eIDbiujL2iwO55dJcguXFh745eaJdfFeS3FPiY
         cl3RGdvlcM08w04GBJ3D1p162oWYSvNnLuNU0HtrG+9ogsoHNX9u3GDGNgM+TNVia0vl
         dkWf5efdSp988UVOTcfyV4/d9mCFw8+G/3t6CKzAjBmg6TRw0kyjOfGeDViRHalvl7Ww
         GuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788011652; x=1788616452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOJDD5tWPDHOsVb80QoaWRjR16NkDSsX//qgGD2tc1A=;
        b=olyW5LljT9GcekAhXgxXGpWLThokw+DzsO0CZRKIVnXmFJ+VEMh7BgtfXJ5Fn8dHKJ
         LKN/vA8u+X1W2H186HSXZNInjsaHc8KsO9CCp7O0Ji4F53uBrpX8r1kbZ/KV4ZpXwyq4
         eJeptcd+4dif3wYJ+kfnR8NRyAMEa0ShzZ2qHaQ8+aKXpScsWSjS17pK1Va8ZgchGwFA
         tFLSsPMzpHog2eYX9bla03OLGfDPlFnPllzYEK+yFIW51NrssBBee/+ddrl8oxfFz0Qj
         K2pq3aGAegzVbmngfbQXSX7AWtwtXyLHItcTZRgkBjQUUPVDxTDEE1d5Hrn+50j/12p3
         DtKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr70iMSqmKZG2l9aLZ+81g3qUPeQuVrQIx0vnbnG8ng/rebhEwyuMtNmD3YrHPQEdMsZO+kMT3zQQ1JlL8=@vger.kernel.org
X-Gm-Message-State: AFuF++lphtIGm2P3mG+ccu6qlyOStXe92yMHjainjWIm7zvjkYfE0VSM
	3UnYpQyGDQNpOa3gc+OD9sofrbya+TJCLFvHaxrRz1j4HcXA87PDc9WuUbeEWh0kIkwMWlU4xJQ
	A9YO7ftxBtAePK6oeFzG3flxVtF00bTE=
X-Gm-Gg: AR+sD10ZzmeD7cLaEWn8kIlkup4ZQVVeum3JmZU2K591fW7/tfoFOBlgEnFE9+tzXl/
	4OTu4F8U/tMINkP1E/pATZNYT80sEhTfOzG1PshXbRV0gOyzX4/Z3loli4tUyBsuaqchkczqPBl
	5KfEu0gpMf5jmc2bd3MTWtx8f/Fft//E2B6QHwwl04I5n0HoVL1MBkrg/UFk8xnP9yEsvSCa5mt
	gmRpY+kKPWS/ju9RWAbaiJMHPBR2ClxFyRmk01wA8pyDcaS4xcNNuthRcgytXkiwU7agrDZYYYk
	U5YpplyGu6lA5Dxg+SJG3Yl9wPWssr0jpGLVBPomcFCKuA==
X-Received: by 2002:a05:600c:c08a:b0:49b:9657:e32e with SMTP id
 5b1f17b1804b1-49b9657e6e7mr157154755e9.8.1788011651185; Sat, 29 Aug 2026
 06:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828094823.594279-1-kunwu.chan@linux.dev> <apFa2eTBzBP0RPeb@gremlin>
In-Reply-To: <apFa2eTBzBP0RPeb@gremlin>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 29 Aug 2026 21:53:59 +0800
X-Gm-Features: AcwNN1XmZSbM2-97nIs-gSLFNho3Z-KBB8yuqP6_zOcjt3RwXj_so8lSUfJ91HA
Message-ID: <CAN_Opa9BxKiSY5Xui1q7_9LFLCodRps+dQQG2-2kx+5+OP0j=g@mail.gmail.com>
Subject: Re: [PATCH] mm/mremap: fix locked_vm accounting for MREMAP_DONTUNMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:16=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Fri, Aug 28, 2026 at 05:48:22PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > When mremap() is called with MREMAP_DONTUNMAP on a locked VMA,
> > vrm_stat_account() increments mm->locked_vm for the new VMA while the
> > source VMA is still marked VM_LOCKED.
> >
> > For a normal mremap(), the source VMA is subsequently unmapped and the
> > munmap path decrements mm->locked_vm, balancing this accounting.
> >
> > With MREMAP_DONTUNMAP, the source VMA is left in place and
> > dontunmap_complete() clears VMA_LOCKED_MASK.  When the source VMA is
> > subsequently unmapped, VMA_LOCKED_BIT is already clear, so the munmap
> > path does not undo the increment from vrm_stat_account().  This leaves
> > mm->locked_vm over-accounted.
> >
> > Undo the locked_vm increment in dontunmap_complete() before clearing
> > VMA_LOCKED_MASK.  MREMAP_DONTUNMAP requires old_len =3D=3D new_len, and
> > only VMA_LOCKED_BIT is checked to match the accounting performed by
> > vrm_stat_account().
>

Hi Lorenzo,
Thanks for the detailed reply and your fix patch.

> Hmm I don't love this approach.
>

I agree that explicitly undoing the accounting in dontunmap_complete() is n=
ot
the cleanest way to fix this. And your patch is a much cleaner solution: mo=
ve
vrm_stat_account after the if statement for MREMAP_DONTUNMAP to
keep the behavior unchanged.

> >
> > Fixes: b714ccb02a76 ("mm/mremap: complete refactor of move_vma()")
>
> Are you certain that my rework patch was what introduced it?
>

Yes. I compared the MREMAP_DONTUNMAP path before and after
b714ccb02a76 and traced the ordering of the relevant operations.

Before the rework, the DONTUNMAP path cleared VMA_LOCKED_BIT before
vrm_stat_account() was called [1], so the new VMA was not counted towards
mm->locked_vm.
[1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/tree/mm/mre=
map.c?id=3Dd5c8aec0542e2d79b64de9089b88fabdebe05c1e#n1016

After b714ccb02a76, move_vma() calls vrm_stat_account() first [2], while th=
e
source VMA is still VM_LOCKED, incrementing mm->locked_vm. The
DONTUNMAP path then calls dontunmap_complete(), which clears
VMA_LOCKED_MASK but leaves the source VMA in place. Thus, when the source
VMA is later unmapped, the corresponding decrement is skipped.
[2] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/tree/mm/mre=
map.c?id=3Db714ccb02a76e170f3e6475749ed0812ee25f777#n1161

This before/after ordering difference is what led me to identify
b714ccb02a76 as the regression commit.

> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> In general while the patch doesn't seem super AI-y I do see a sudden upsw=
ing in
> patches from you in 2026 so I do have to ask whether LLMs were used? If s=
o
> please follow https://docs.kernel.org/process/coding-assistants.html
>
> (I hate having to say these things but hey, it's 2026, so.)
>

Regarding the increase in my mm patches, I have been focusing more
on mm since this year, and had already been doing quite a bit of mm-related
work with some friends before that. Like [3] [4].
[3]  https://lore.kernel.org/linux-mm/20260430040427.4672-2-baohua@kernel.o=
rg/
[4] https://lore.kernel.org/all/20260422021842.78495-1-baohua@kernel.org/

I was also away from community activity for a period due to wedding leave
and later leave to accompany my wife for the birth of our child. During tha=
t
time, I continued working on some of the mm/DAMON work I had planned but ha=
d
not yet finished. After returning, I had several pieces ready to send
upstream, which is why a number of patches appeared within a relatively
short period. Many thanks as well to my wife for her support and efforts.

Thanks for the reminder. I'll follow the kernel's coding-assistant
disclosure requirements
for any LLM-assisted work.

> I'm kind of inclined to do a fix myself a different way here.
>
> Given it's going to be a backported patch and you're relatively new to mm=
, I
> feel like this is the safer route, sorry about that.
>
> Happy to add a Reported-by/Closes for this however.

Thanks for the fix and for adding the Reported-by and Closes tags. I'll
keep learning and working on mm, and hopefully grow out of the newbie
stage soon.

>
> > ---
> >  mm/mremap.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index e8df5cdb0ac..37ea5ee1986 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -1334,6 +1334,14 @@ static void dontunmap_complete(struct vma_remap_=
struct *vrm,
> >       unsigned long old_start =3D vrm->vma->vm_start;
> >       unsigned long old_end =3D vrm->vma->vm_end;
> >
> > +     /*
> > +      * vrm_stat_account() accounted the new VMA while the source VMA
> > +      * was still locked.  Since DONTUNMAP leaves the source VMA in
> > +      * place after clearing VMA_LOCKED_MASK, undo that accounting her=
e.
> > +      */
> > +     if (vma_test(vrm->vma, VMA_LOCKED_BIT))
> > +             vrm->vma->vm_mm->locked_vm -=3D vrm->old_len >> PAGE_SHIF=
T;
> > +
>
> I don't love this as an approach in general.
>
> As above, I think I will address this slightly differently.
>

I saw your patch =E2=80=94 it's a very elegant solution and, I think, the b=
est way
to fix this. I was a bit too eager to fix the symptom and didn't think
deeply enough about fixing it at the source.

The fix looks clean to me from the code review. I'll test it as well.

Thanks again!
KunWu

> >       /* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
> >       vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
> >
> > @@ -1343,8 +1351,6 @@ static void dontunmap_complete(struct vma_remap_s=
truct *vrm,
> >        */
> >       if (new_vma !=3D vrm->vma && start =3D=3D old_start && end =3D=3D=
 old_end)
> >               unlink_anon_vmas(vrm->vma);
> > -
> > -     /* Because we won't unmap we don't need to touch locked_vm. */
> >  }
> >
> >  static unsigned long move_vma(struct vma_remap_struct *vrm)
> > --
> > 2.43.0
> >
>
> --
> Cheers, Lorenzo

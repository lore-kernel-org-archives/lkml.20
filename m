Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B74B44D4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608594; cv=pass; b=EE8cPy8bITWbJxE+mJ4H5WvQdfBUxElPQDSEgWAyFPnEPd+J2EcrFfIWbls8KOjHzNa/Y3s1POZHd9uS7JeoMjlvtVrLxysI61YpQjJLPcZbOjK3O3cU6wp4mY04b5tyNRa9ZBr7joiQqx/4h1JrcD6cxyriYz2wFDv9z4XJHvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608594; c=relaxed/simple;
	bh=3DVe5BrR2l3G/O15T8bRjXmao3k/JWb+7PgpGY5xaYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gK5ZXsP9dqk6PdmIX6DuQND5S37kYLESLzqNlmkMcVQoV94lwGk/EeiPT46kqcPaKwPoY3sQT0SQNzIFwTxWp/iVcIWTw9EDOffMt8bAnFeQmIhmwdJtZPvhfesS+XrqGa2RlmVEJiyyZf8ndfxsEQyFGNM5XX9LURN4nsKWBTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=frBfrrka; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="frBfrrka"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5333401e359so303191cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608592; cv=none;
        d=google.com; s=arc-20260327;
        b=TDOl+qbitRaYjUbXxqk7dyBsfom0+v3djiEbeMCgDKc5SLAFT4Y3I/7GTK0JSwLs2Q
         pCfoNEf572HPcuEZOpOYE4WZCmLw+rhv42oN5yWbTRxohqr1lDxyunXPkzOnwBxWhPqg
         xYsa+5+EOGiV1Y04G/NSfTURapnEz2liqp1WE5BViLuL/NLkXRbaXf8DJj+N83r1IKUR
         /80RbL8+QW8vX/GAEBSQVZcr8DLBurRFyH0pFf6Z5X29fw0x9mjoufFrRknQ21y6BI5d
         e4NwexBpJZcsKUW3xZEqphqFd3RGhYmaIdg5ULK1jW8bITywAGHiHoxsyM4cmW/rLkLk
         7SCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqIv1Sn/rDlr9SusC1OyVWgmKaxOZca4hJRLhV2M9zg=;
        fh=u0OJ3L5l9xzABWuIvwm1lou6lvkihBAB0G43Zpu5cOY=;
        b=KMVMRn8rUOp7xUqKpR/ScSnmZ2zkasUfueqi8dUXwx4uR/3jmPIXifaRXIyFbxOFIo
         vmjiwBFjqc8Nn58nRroLAbFjVMAfl7DZ6rKDTnsWIFlCny3NWjI+Go9dz5VNktMvKDAI
         ww18BarRRMf3jonCBmZljcuhMdN0B5oTdT2Ysl62bPUxnW8Ol3QyuuF+tEijJqjKeAIX
         1n519prLUAye088K5rdBzYWHoJ18Gj5F0q3GKEp3vnu70HxbfJhELVlDNKgg+TmgN26y
         G/WUz62dEJJLH9rDoTs/OtuLRpLAoBnonD7wFrjO6XpjXULUgxZZ2ydnc74/I1+mnNju
         XVcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790608592; x=1791213392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqIv1Sn/rDlr9SusC1OyVWgmKaxOZca4hJRLhV2M9zg=;
        b=frBfrrka+PwJQz89N0YRlTujJAp46boHkDmIIcBNZ/QL2+QyYH7BS/YsGVXtFvvUPz
         FMoleEx4ftUnN/n8ywYBD9QANsHuT71WWvS2oL9sPiM+6ZY3amKaGp9yJpUWuimJMGmu
         88aJ1kGVMfaJlfSj/F4NBEC5eiBZMXcf7a8Rv5s/+MwD8Z7PxDeivfnoaBC6kDLAG3rP
         5tM90pqCNoGQDZ3H26zzUy3dUike0sz20hzhfi8H93cn+lzWen05+XoTfhIFWCkecMGT
         kdm9Myqrqc1xSEr67gdjC3Pcjl/zi1RC1kQXQygON59N6p9aOSWQZCww2R1NG8HdYUZH
         O9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608592; x=1791213392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqIv1Sn/rDlr9SusC1OyVWgmKaxOZca4hJRLhV2M9zg=;
        b=gQtB6YRQ77lsVU/Dr3d6kpX/FmySaSBydwVzZaRutBshsQBTpivgPbMJ1nO9UVFbUZ
         IHSizctk7dPzIUgUKL8MMTH2x+weQ/uLsErfY8gJ/NVD5W+T9rG3suwLWc1POP2q2dHJ
         NL7oRQMgN5GqmO0jEME+Sgt20LvlwPrgync6DIGuRaiUpJcwy3pEVfbWbYdSir3hxNv5
         bNPPZn7LwK4WgIrrobuyUpHsJ5OWEJAiRzIv4tYYpkO6N3C2fQdKpo0p9ZLG+JHATVfi
         j7BfR1Zl9aOxPPPjpPuO4EqhbSNnZrRmUQaQBp6br8LP+vs4cvI6wJlpj/MqbkdMDzCs
         047A==
X-Forwarded-Encrypted: i=1; AKwUvBzsyxJWorObgTta63GZQ//uj7Oiu2e/UtL0Yd4RpaYuLEY/JzAlMJln3PFOr9HDImtzR1A61F8ZGQ6lcvY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYGgTQvoQYM8rsD+w8g+6NFeYbszZoddGhTiYRP61KVHNNKNdG
	sENZY1vh8qrTGw5k0ivp69DLz9Nj0s1qIG7VjSnAWN6myqvnR5MbDrWu+WbCYDUMunWKJPUGp6D
	OI6cjiNxPG/B7DUJHvFBnZr5XvfBV9/l6c9Lq2FFx
X-Gm-Gg: AYBFou1VuHSaJ0cTqpii+b/rWnvZFDmdNurjGXEUrotDwc3Lld3qnXu0qjlZtjXi3ai
	u9Vritdi/YXWYXTK1H1LKd+w+jsLggeyCbilCHG3Xb6dfxAvWnxu1BJUShxboixWX81bWiPq7/L
	vhBDHULvP500P6HJlYjonoZI8+IBwT5iYmgd7SzyMH32nHBemwyGwNihfMKIufV7qwr1+a5hHZ5
	AGLYJhz+Y5GKo8NttQ9Pcv01K5RtJf8+ReUIV4+VHvwq8QmqkiSua14B8u01nDit+pV1LaeGLUx
	WhOIpnicpjnvvrKJJqeQ/X+mfBnKIhmAtxfzOj1VaAx9V7t5b34P4IU=
X-Received: by 2002:a05:622a:1a8f:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-533226f9f89mr30441681cf.11.1790608590801; Mon, 28 Sep 2026
 08:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-3-hao.ge@linux.dev>
 <CAJuCfpHJSwNhgotMVpmjVvdv=m52_7Kvzpztf0WcN0AaoSeGGw@mail.gmail.com>
 <60642a7f-2949-428a-8290-40d69c989a77@linux.dev> <CAJuCfpG3d7n=z5WnUQYZsqvrt1pemF8TFvGiGyZGLO7ykVvqAQ@mail.gmail.com>
 <CAJuCfpGeRdFY6UPF-vXxwHvP2+tN=BKgRkmLR3PMLuWhxgzPRA@mail.gmail.com>
 <1dff448c-9cbe-4276-bca1-d91283b0c7b4@linux.dev> <b8005c24-ecac-45c4-840a-fd282f9693b5@linux.dev>
 <arpK2bQrrUMvEvTP@milan> <arqDHnBFGKQZm7VU@milan>
In-Reply-To: <arqDHnBFGKQZm7VU@milan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Sep 2026 08:16:18 -0700
X-Gm-Features: AclHuK8H_rn91yL5MjXERW3wss1aaZb7EVDlHwDTppCbnSE6x5WvHEULyhM7Qvg
Message-ID: <CAJuCfpHuTzFBUm2uAbkFsKF85GxcqFATmKgT50AQgWkLjf7NMw@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] alloc_tag: clean up the populate failure path
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:09=E2=80=AFAM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
>
> On Mon, Sep 28, 2026 at 01:09:13PM +0200, Uladzislau Rezki wrote:
> > On Thu, Sep 17, 2026 at 10:32:48AM +0800, Hao Ge wrote:
> > > Hi Suren=E3=80=81David=E3=80=81Lorenzo
> > >
> > > On 2026/9/17 09:12, Hao Ge wrote:
> > > > Hi Suren
> > > >
> > > > On 2026/9/17 03:07, Suren Baghdasaryan wrote:
> > > >> On Wed, Sep 16, 2026 at 9:31=E2=80=AFAM Suren Baghdasaryan <surenb=
@google.com> wrote:
> > > >>>
> > > >>> On Tue, Sep 15, 2026 at 11:00=E2=80=AFPM Hao Ge <hao.ge@linux.dev=
> wrote:
> > > >>>>
> > > >>>> Hi Suren
> > > >>>>
> > > >>>> Thanks for you review.
> > > >>>>
> > > >>>> On 2026/9/16 05:09, Suren Baghdasaryan wrote:
> > > >>>>> On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.d=
ev> wrote:
> > > >>>>>>
> > > >>>>>> The reservation is already stored in the maple tree when
> > > >>>>>> vm_module_tags_populate() fails. A failed load never unloads t=
he
> > > >>>>>> module, so nothing releases the entry. Release it and roll
> > > >>>>>> module_tags.size back. Without the rollback a concurrent load =
that
> > > >>>>>> already passed needs_section_mem() can reuse the freed gap, sk=
ip
> > > >>>>>> vm_module_tags_populate() and write to unmapped memory.
> > > >>>>>>
> > > >>>>>> vmap_pages_range() may have installed some PTEs before failing=
. A
> > > >>>>>> retry to populate the same range would BUG on them, so undo th=
em,
> > > >>>>>> but only if vmap actually ran.
> > > >>>>>>
> > > >>>>>> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation t=
ag compression")
> > > >>>>>> Fixes: 0f9b685626da ("alloc_tag: populate memory for module ta=
gs as needed")
> > > >>>>>
> > > >>>>> If a patch fixes two other patches, it likely needs to be split=
 so
> > > >>>>> that each part fixes one patch only. But read on please. I'm no=
t sure
> > > >>>>> if one of the fixes is correct.
> > > >>>>>
> > > >>>>
> > > >>>> Kept them in one patch because they only make sense together.
> > > >>>>
> > > >>>> After a failed populate the reservation is released and the
> > > >>>> size rolled back, so the next load takes the same gap and calls
> > > >>>> vm_module_tags_populate() again, and that retry would trip over
> > > >>>> the PTEs the failed vmap left behind.
> > > >>>>
> > > >>>> Without the rollback a load that already passed needs_section_me=
m()
> > > >>>> just reuses the gap, skips populate and writes to unmapped memor=
y.
> > > >>>> So splitting them leaves each half broken.
> > > >>>
> > > >>> Yeah, that's why I think vmap_pages_range() cleanup should be a
> > > >>> completely separate patch with vmap_pages_range() doing cleanup
> > > >>> itself.
> > > >>>
> > > >
> > > > I think I get where you're coming from now.
> > > > Thanks for taking the time to explain.
> > > >
> > > >>>>
> > > >>>>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > >>>>>> Cc: stable@vger.kernel.org
> > > >>>>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > > >>>>>> ---
> > > >>>>>>  mm/alloc_tag.c | 10 ++++++++++
> > > >>>>>>  1 file changed, 10 insertions(+)
> > > >>>>>>
> > > >>>>>> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > > >>>>>> index 2070e682fe10..95ddf5b743d0 100644
> > > >>>>>> --- a/mm/alloc_tag.c
> > > >>>>>> +++ b/mm/alloc_tag.c
> > > >>>>>> @@ -804,6 +804,13 @@ static int vm_module_tags_populate(void)
> > > >>>>>>                                      next_page, PAGE_SHIFT) < =
0) {
> > > >>>>>>                         release_pages_arg arg =3D { .pages =3D=
 next_page };
> > > >>>>>>
> > > >>>>>> +                       /*
> > > >>>>>> +                        * vmap_pages_range() only runs once a=
ll pages were
> > > >>>>>> +                        * allocated, and it may have installe=
d some mappings
> > > >>>>>> +                        * before failing. Undo them.
> > > >>>>>
> > > >>>>> If vmap_pages_range() failed to map the range, why should we ne=
ed to
> > > >>>>> undo it? If it indeed leaves some partial mapping when failing =
then I
> > > >>>>> would argue that vmap_pages_range() should be undoing these par=
tial
> > > >>>>> mappings itself before returning the error.
> > > >>>>>
> > > >>>> Yeah it does - none of the paths under vmap_pages_range() undo t=
hemselves on error.
> > > >>>
> > > >>> Hmm. I wonder if this behavior is intentional or requires a fix. =
The
> > > >>> only possible reason I can think of is performance but I can't im=
agine
> > > >>> a failure to map is a performance-critical case.
> > > >>>
> > > >>> +David Hildenbrand (Red Hat), +Lorenzo Stoakes (Oracle) what do y=
ou
> > > >>
> > > >> Huh, my gmail thinks you are still at your previous companies :)
> > > >>
> > > >
> > > > I manually fixed it on the mailing list for this thread.
> > > >
> > > >>> guys think? Shouldn't vmap_pages_range() undo its possible partia=
l
> > > >>> mapping when it fails?
> > > >>>
> > > >>>
> > > >>>> pcpu_map_pages does perform cleanup on its own as well. There ma=
y be other similar sites.
> > > >>>> https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/percpu-vm.c#=
L255
> > > >>>> so I did the same here.
> > > >>>>
> > > >>>> If we really want vmap_pages_range() to handle this cleanup inte=
rnally, I believe that would
> > > >>>> be a relatively large change, and we would need to consider many=
 more cases. So I think we keep
> > > >>>> the current behaviour for now.
> > > >>>
> > > >>> Yeah, I understand it would require a deeper cut but if that's th=
e
> > > >>> right way to handle this we might as well do that. Let's see what=
 MM
> > > >>> folks think.
> > > >>>
> > > >
> > > > Sounds good to me. Let's wait and hear what the MM folks say.
> > > >
> > >
> > > I just looked into the call sites for __vmap_pages_range.
> > > And I found there's a bug in one vmalloc caller [1].
> > > When gfp_mask has __GFP_NOFAIL, the code keeps retrying
> > > __vmap_pages_range. If there are leftover PTE mappings,
> > > this can trigger a BUG(); [2]
> > > https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/vmalloc.c#L3946 [=
1]
> > > https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/vmalloc.c#L121  [=
2]
> > >
> > Indeed the below code is incomplete:
> >
> > <snip>
> >       /*
> >        * page tables allocations ignore external gfp mask, enforce it
> >        * by the scope API
> >        */
> >       flags =3D memalloc_apply_gfp_scope(gfp_mask);
> >       do {
> >               ret =3D __vmap_pages_range(addr, addr + size, prot, area-=
>pages,
> >                               page_shift, nested_gfp);
> >               if (nofail && (ret < 0))
> >                       schedule_timeout_uninterruptible(1);
> >       } while (nofail && (ret < 0));
> >       memalloc_restore_scope(flags);
> > <snip>
> >
> > and it should be fixed. As the __vmap_pages_range() can actually fail
> > and leave some installed mappings, we have to perform some cleanups
> > on failure or on repeat(if nofail is true).
> >
> > Below code:
> >
> > +                     /*
> > +                      * vmap_pages_range() only runs once all pages we=
re
> > +                      * allocated, and it may have installed some mapp=
ings
> > +                      * before failing. Undo them.
> > +                      */
> > +                     if (nr =3D=3D more_pages)
> > +                             vunmap_range(phys_end, phys_end + (nr << =
PAGE_SHIFT));
> >
> > we can use but we need to check if partially mapped space is not an
> > issue for the vunmap_range(). And it looks like it is not.
> >
> > <snip>
> > @@ -3953,8 +3990,15 @@ static void *__vmalloc_area_node(struct vm_struc=
t *area, gfp_t gfp_mask,
> >         do {
> >                 ret =3D __vmap_pages_range(addr, addr + size, prot, are=
a->pages,
> >                                 page_shift, nested_gfp);
> > -               if (nofail && (ret < 0))
> > -                       schedule_timeout_uninterruptible(1);
> > +               if (ret < 0) {
> > +                       /*
> > +                        * __vmap_pages_range() may have installed some=
 mappings
> > +                        * before failing. Undo them before returning o=
r retrying.
> > +                        */
> > +                       vunmap_range(addr, addr + size);
> > +                       if (nofail)
> > +                               schedule_timeout_uninterruptible(1);
> > +               }
> >         } while (nofail && (ret < 0));
> >         memalloc_restore_scope(flags);
> > <snip>
> >
> And looking further. If the __vmap_pages_range()/__vmap_pages_range_noflu=
sh()
> and friends fail, a proper cleanups should be done inside, IMO.

Sounds like we are in agreement.

>
> But i am checking callers and see that some do some not:
>
> <snip hooks.c>
>         __vunmap_range_noflush(
>                 vmalloc_shadow(start),
>                 vmalloc_shadow(start + clean * PAGE_SIZE));
>         __vunmap_range_noflush(
>                 vmalloc_origin(start),
>                 vmalloc_origin(start + clean * PAGE_SIZE));
> <snip hooks.c>
>
> kmsan_ioremap_page_range() it does clean ups;
> kmsan_vmap_pages_range_noflush() looks like does not care in shadow.c;
> __vmalloc_area_node() as noted, it is broken as there is a BUG() on next =
try if nofail;
> pcpu_map_pages() it does cleanups.
> ...
>
> and so on.

Yeah, the callers that do the cleanup should stop doing that once the
vmap functions handle it themselves. I expect an overall reduction in
code size.

>
> --
> Uladzislau Rezki

Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B841A508
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618078; cv=pass; b=oIVmGh/W1Zi6EVDffc6a6SmC8gJUGtBRgDjdus75Y9xV6bXwnFL9X7KS7qyBjHnEPSXkqf1TOiypxLZzP8j7isXiF5mZhuWCDTMgJGBws3zZrC131sXv5zqW8Ub/EwD27au0xlPDMthfCWOZJ00OS4AZm46S/c15AdfNwX5lMJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618078; c=relaxed/simple;
	bh=K+27UmTYdajHBVicoULlP3rEo42SwJ36sQiPyGsh2rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT4ybvXG0dfWN31hIM7m/ldOv+jUs64DWz7EPhS6oYq4WcCsKn2d+W/MLDKMpnTy61EODdLHBlNr8CNKWUZnIizmaiP+t4CO70gTI+l8bjg9aD4PpURPxuNYmKkuYZ2ZNpa04mjC4p3DvMep5/jX86fkKd0W0Xj2hne090OOGKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k3LO2Jem; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k3LO2Jem"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so32431cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618075; cv=none;
        d=google.com; s=arc-20260327;
        b=WyJh0gl9lrPY2d0NLiWI9atBLLSQEUVH7Z12AlRuVCZI6ekNTlbsvpH331L03ur8u7
         4ZP3+ywVY2htTkLQPL0JDFMYp9oKwbYP6oT0itGwsuL+ou7OFN3L6QvoH5M8yB/fwvSO
         gQTCuk2hfEFvKt9AsuYQjrYLFlBRRHf2j81N/hWAezhlFzpYLgN31mxYm5Yc5owU6TW7
         VHKCdJxdWBJdYd/Y6Rd+O4NwveITi4AdBo9Yav3KTt7osjXbQhf6AiBaCQWMUXQTNSxy
         Cwlb1RIBHS88/cZboeGt0GboXE4X3eN54JBZLyI4+92xVaB7J1WztRJBxIx2u0d8ygGu
         lEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+DHK8X7Eh0ZP6ILe/dSKNORYLgHg/uYsEc/MlUEQt0=;
        fh=3uG1IG1651mfRstMnnRhZtbLTi8EoG9YaPX5LRlD7ao=;
        b=fUXhBRyz7AKCw6pYnwyWGOxXk9G+W0zgey1lz7L4AtC+yVE70vRF8nFof00xEbX6Z9
         ilccygdC+yTzoO8yRL/rcdnjDr6C8TaFda3kIwKawysO6MaN+eOWw7LCkeuwhdxA1p1i
         NVxgacTqeSdQw88Wc9UheiSYeqhuUrREo9DXFhzHCTL88jOKPESQ8ZneZ1wZ8rDsW3/L
         zBKXTLJGtvu4y96vYh18NnL7DYJgaiOMfDlX3cwVgV9KtEzGR5xl5K4VK5lZu8JNlada
         xN4yEnYEJiN/0sB6hEF0M9UBFq57hf4jDe523alifnEggTdAquJESzqmitRtiX3sCB1K
         Be+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790618075; x=1791222875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+DHK8X7Eh0ZP6ILe/dSKNORYLgHg/uYsEc/MlUEQt0=;
        b=k3LO2JemsGAG01UK/ey0HBN0HqZ9HkPWh3Nng+EhE5IVMZhL/3yJPqi0mmXEo39ZjM
         lpINPMw7CqBjMfLB3oL5orOobodDZ4+YT0dJzipFZPCvMgGTyo8NRMVxxrZIyjsItcA1
         aEXc9vTTTQ9cdHBfMO/BRf/CGempYQgk+5aIdt1LzAtLbuXSiH5P7uPEfCJFXOW/7u0D
         8eZZp227tIFy/7+sgZ2PBOGtw8WRNuRv+ishQ43WYeCaXtrfICbswSrxVhLSIsiDFCG2
         rpZWRfi6W8vTabvnApbLH/ERMmN9CbgrePhGS231ay7mHs2n/kW1mvA7M6uigW3OxR3J
         n16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618075; x=1791222875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+DHK8X7Eh0ZP6ILe/dSKNORYLgHg/uYsEc/MlUEQt0=;
        b=2I5OxijKkGSsGFSJiRSMhkacJBvr7wRVSs69/xl781yRZ+rkUuLWnKeQ0LqsoSJuZD
         3xC8hu6cOGssNNDAer6dGUmmhAPc4caGNuJgF6ti6Y5SavfpIYgKky90qyZOuNvNaocx
         aAqxjmQ89k/UlBMQjBjZEeGApWNKJExNJc5Ki8hA4o46aCCrfhkRZnvQFUDEhnEcwHMH
         6Mi1Q41LV/Ri40+ElKxQyyKMNkbVeoglgtqbLkPr9Y/wBslaV4/2IEseltR74EMA0wSp
         W3HI1w3DyLm19Sve563izfnGqmHjje9qrWt8MuAfDks0lnuprPHInUMr2OalaXMFJwyW
         US9A==
X-Forwarded-Encrypted: i=1; AKwUvBxvrjv+b9WPk7pKvJYr0g+N02cp7iGYf9a1dgVDodi3Y+aWA4zFMqQm0qvCCFK276Ep2hIIIci9j8arr/E=@vger.kernel.org
X-Gm-Message-State: AFuF++l7B66cYNuP5vA4cruawUNzlTzE11ve78CKFb9mkXe/YBwcHwxV
	0U4ZJJ3ymLMngWCtJaskO2XGiXUcj0GXU4CdGBsXStBgA4MntOEhAr9G9pbS81P8eAb5M581zx3
	VOWr0toaV3qFGTucXoYPHdfPiFDRNsrqhq1hpf7u7
X-Gm-Gg: AYBFou0h85mWdQ/jvOzAGR9+8mF+GEgILOIWxUlMXMdMIezZpqi2oh1KDPcCGqn4rjE
	s6PyvLk3jNx2+zpQNxZPGwoKJuDVJo+FpcMzOOn8yq/DDQjoZxUyYU2yHJckbhkH5mmFvm++3pj
	apMk05ocFGuG3C1rdv+D31A1Fa3O/E3Z7oZRT8E35/LjEERGmgqLliJK5JisGR1QYmDuwkmi7Ny
	slttPb2wvYVpoImffqrs+hbSX7kZRFU++DeROsddvNaw9TKXH+Q97M8l3x2kyAuE3fgdJZLSfPF
	8PFMltDtkA1Z73muIYw6C9K07o2XQcxmEWWpQ+5AW070abbbjKueOA==
X-Received: by 2002:ac8:5c82:0:b0:532:d72d:3e9c with SMTP id
 d75a77b69052e-53320155bd4mr36219771cf.6.1790618074487; Mon, 28 Sep 2026
 10:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-3-hao.ge@linux.dev> <CAJuCfpHJSwNhgotMVpmjVvdv=m52_7Kvzpztf0WcN0AaoSeGGw@mail.gmail.com>
 <60642a7f-2949-428a-8290-40d69c989a77@linux.dev> <CAJuCfpG3d7n=z5WnUQYZsqvrt1pemF8TFvGiGyZGLO7ykVvqAQ@mail.gmail.com>
 <CAJuCfpGeRdFY6UPF-vXxwHvP2+tN=BKgRkmLR3PMLuWhxgzPRA@mail.gmail.com>
 <1dff448c-9cbe-4276-bca1-d91283b0c7b4@linux.dev> <b8005c24-ecac-45c4-840a-fd282f9693b5@linux.dev>
 <arpK2bQrrUMvEvTP@milan> <arqDHnBFGKQZm7VU@milan> <CAJuCfpHuTzFBUm2uAbkFsKF85GxcqFATmKgT50AQgWkLjf7NMw@mail.gmail.com>
 <arqoPs4ZplfcGmLo@milan>
In-Reply-To: <arqoPs4ZplfcGmLo@milan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Sep 2026 10:54:23 -0700
X-Gm-Features: AclHuK__aKkipvuCxqs46ykw_GUVX8SYwupmrIMIoqCWPlzVc6V7pkill3lm8U8
Message-ID: <CAJuCfpFT=QKy_5G6GYQ1OHhvjXt807jn0pUq-eF9QonNKhx=aQ@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 10:47=E2=80=AFAM Uladzislau Rezki <urezki@gmail.com=
> wrote:
>
> On Mon, Sep 28, 2026 at 08:16:18AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Sep 28, 2026 at 8:09=E2=80=AFAM Uladzislau Rezki <urezki@gmail.=
com> wrote:
> > >
> > > On Mon, Sep 28, 2026 at 01:09:13PM +0200, Uladzislau Rezki wrote:
> > > > On Thu, Sep 17, 2026 at 10:32:48AM +0800, Hao Ge wrote:
> > > > > Hi Suren=E3=80=81David=E3=80=81Lorenzo
> > > > >
> > > > > On 2026/9/17 09:12, Hao Ge wrote:
> > > > > > Hi Suren
> > > > > >
> > > > > > On 2026/9/17 03:07, Suren Baghdasaryan wrote:
> > > > > >> On Wed, Sep 16, 2026 at 9:31=E2=80=AFAM Suren Baghdasaryan <su=
renb@google.com> wrote:
> > > > > >>>
> > > > > >>> On Tue, Sep 15, 2026 at 11:00=E2=80=AFPM Hao Ge <hao.ge@linux=
.dev> wrote:
> > > > > >>>>
> > > > > >>>> Hi Suren
> > > > > >>>>
> > > > > >>>> Thanks for you review.
> > > > > >>>>
> > > > > >>>> On 2026/9/16 05:09, Suren Baghdasaryan wrote:
> > > > > >>>>> On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@lin=
ux.dev> wrote:
> > > > > >>>>>>
> > > > > >>>>>> The reservation is already stored in the maple tree when
> > > > > >>>>>> vm_module_tags_populate() fails. A failed load never unloa=
ds the
> > > > > >>>>>> module, so nothing releases the entry. Release it and roll
> > > > > >>>>>> module_tags.size back. Without the rollback a concurrent l=
oad that
> > > > > >>>>>> already passed needs_section_mem() can reuse the freed gap=
, skip
> > > > > >>>>>> vm_module_tags_populate() and write to unmapped memory.
> > > > > >>>>>>
> > > > > >>>>>> vmap_pages_range() may have installed some PTEs before fai=
ling. A
> > > > > >>>>>> retry to populate the same range would BUG on them, so und=
o them,
> > > > > >>>>>> but only if vmap actually ran.
> > > > > >>>>>>
> > > > > >>>>>> Fixes: 4835f747d3ed ("alloc_tag: support for page allocati=
on tag compression")
> > > > > >>>>>> Fixes: 0f9b685626da ("alloc_tag: populate memory for modul=
e tags as needed")
> > > > > >>>>>
> > > > > >>>>> If a patch fixes two other patches, it likely needs to be s=
plit so
> > > > > >>>>> that each part fixes one patch only. But read on please. I'=
m not sure
> > > > > >>>>> if one of the fixes is correct.
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> Kept them in one patch because they only make sense together=
.
> > > > > >>>>
> > > > > >>>> After a failed populate the reservation is released and the
> > > > > >>>> size rolled back, so the next load takes the same gap and ca=
lls
> > > > > >>>> vm_module_tags_populate() again, and that retry would trip o=
ver
> > > > > >>>> the PTEs the failed vmap left behind.
> > > > > >>>>
> > > > > >>>> Without the rollback a load that already passed needs_sectio=
n_mem()
> > > > > >>>> just reuses the gap, skips populate and writes to unmapped m=
emory.
> > > > > >>>> So splitting them leaves each half broken.
> > > > > >>>
> > > > > >>> Yeah, that's why I think vmap_pages_range() cleanup should be=
 a
> > > > > >>> completely separate patch with vmap_pages_range() doing clean=
up
> > > > > >>> itself.
> > > > > >>>
> > > > > >
> > > > > > I think I get where you're coming from now.
> > > > > > Thanks for taking the time to explain.
> > > > > >
> > > > > >>>>
> > > > > >>>>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > > > >>>>>> Cc: stable@vger.kernel.org
> > > > > >>>>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > > > > >>>>>> ---
> > > > > >>>>>>  mm/alloc_tag.c | 10 ++++++++++
> > > > > >>>>>>  1 file changed, 10 insertions(+)
> > > > > >>>>>>
> > > > > >>>>>> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > > > > >>>>>> index 2070e682fe10..95ddf5b743d0 100644
> > > > > >>>>>> --- a/mm/alloc_tag.c
> > > > > >>>>>> +++ b/mm/alloc_tag.c
> > > > > >>>>>> @@ -804,6 +804,13 @@ static int vm_module_tags_populate(vo=
id)
> > > > > >>>>>>                                      next_page, PAGE_SHIFT=
) < 0) {
> > > > > >>>>>>                         release_pages_arg arg =3D { .pages=
 =3D next_page };
> > > > > >>>>>>
> > > > > >>>>>> +                       /*
> > > > > >>>>>> +                        * vmap_pages_range() only runs on=
ce all pages were
> > > > > >>>>>> +                        * allocated, and it may have inst=
alled some mappings
> > > > > >>>>>> +                        * before failing. Undo them.
> > > > > >>>>>
> > > > > >>>>> If vmap_pages_range() failed to map the range, why should w=
e need to
> > > > > >>>>> undo it? If it indeed leaves some partial mapping when fail=
ing then I
> > > > > >>>>> would argue that vmap_pages_range() should be undoing these=
 partial
> > > > > >>>>> mappings itself before returning the error.
> > > > > >>>>>
> > > > > >>>> Yeah it does - none of the paths under vmap_pages_range() un=
do themselves on error.
> > > > > >>>
> > > > > >>> Hmm. I wonder if this behavior is intentional or requires a f=
ix. The
> > > > > >>> only possible reason I can think of is performance but I can'=
t imagine
> > > > > >>> a failure to map is a performance-critical case.
> > > > > >>>
> > > > > >>> +David Hildenbrand (Red Hat), +Lorenzo Stoakes (Oracle) what =
do you
> > > > > >>
> > > > > >> Huh, my gmail thinks you are still at your previous companies =
:)
> > > > > >>
> > > > > >
> > > > > > I manually fixed it on the mailing list for this thread.
> > > > > >
> > > > > >>> guys think? Shouldn't vmap_pages_range() undo its possible pa=
rtial
> > > > > >>> mapping when it fails?
> > > > > >>>
> > > > > >>>
> > > > > >>>> pcpu_map_pages does perform cleanup on its own as well. Ther=
e may be other similar sites.
> > > > > >>>> https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/percpu-v=
m.c#L255
> > > > > >>>> so I did the same here.
> > > > > >>>>
> > > > > >>>> If we really want vmap_pages_range() to handle this cleanup =
internally, I believe that would
> > > > > >>>> be a relatively large change, and we would need to consider =
many more cases. So I think we keep
> > > > > >>>> the current behaviour for now.
> > > > > >>>
> > > > > >>> Yeah, I understand it would require a deeper cut but if that'=
s the
> > > > > >>> right way to handle this we might as well do that. Let's see =
what MM
> > > > > >>> folks think.
> > > > > >>>
> > > > > >
> > > > > > Sounds good to me. Let's wait and hear what the MM folks say.
> > > > > >
> > > > >
> > > > > I just looked into the call sites for __vmap_pages_range.
> > > > > And I found there's a bug in one vmalloc caller [1].
> > > > > When gfp_mask has __GFP_NOFAIL, the code keeps retrying
> > > > > __vmap_pages_range. If there are leftover PTE mappings,
> > > > > this can trigger a BUG(); [2]
> > > > > https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/vmalloc.c#L39=
46 [1]
> > > > > https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/vmalloc.c#L12=
1  [2]
> > > > >
> > > > Indeed the below code is incomplete:
> > > >
> > > > <snip>
> > > >       /*
> > > >        * page tables allocations ignore external gfp mask, enforce =
it
> > > >        * by the scope API
> > > >        */
> > > >       flags =3D memalloc_apply_gfp_scope(gfp_mask);
> > > >       do {
> > > >               ret =3D __vmap_pages_range(addr, addr + size, prot, a=
rea->pages,
> > > >                               page_shift, nested_gfp);
> > > >               if (nofail && (ret < 0))
> > > >                       schedule_timeout_uninterruptible(1);
> > > >       } while (nofail && (ret < 0));
> > > >       memalloc_restore_scope(flags);
> > > > <snip>
> > > >
> > > > and it should be fixed. As the __vmap_pages_range() can actually fa=
il
> > > > and leave some installed mappings, we have to perform some cleanups
> > > > on failure or on repeat(if nofail is true).
> > > >
> > > > Below code:
> > > >
> > > > +                     /*
> > > > +                      * vmap_pages_range() only runs once all page=
s were
> > > > +                      * allocated, and it may have installed some =
mappings
> > > > +                      * before failing. Undo them.
> > > > +                      */
> > > > +                     if (nr =3D=3D more_pages)
> > > > +                             vunmap_range(phys_end, phys_end + (nr=
 << PAGE_SHIFT));
> > > >
> > > > we can use but we need to check if partially mapped space is not an
> > > > issue for the vunmap_range(). And it looks like it is not.
> > > >
> > > > <snip>
> > > > @@ -3953,8 +3990,15 @@ static void *__vmalloc_area_node(struct vm_s=
truct *area, gfp_t gfp_mask,
> > > >         do {
> > > >                 ret =3D __vmap_pages_range(addr, addr + size, prot,=
 area->pages,
> > > >                                 page_shift, nested_gfp);
> > > > -               if (nofail && (ret < 0))
> > > > -                       schedule_timeout_uninterruptible(1);
> > > > +               if (ret < 0) {
> > > > +                       /*
> > > > +                        * __vmap_pages_range() may have installed =
some mappings
> > > > +                        * before failing. Undo them before returni=
ng or retrying.
> > > > +                        */
> > > > +                       vunmap_range(addr, addr + size);
> > > > +                       if (nofail)
> > > > +                               schedule_timeout_uninterruptible(1)=
;
> > > > +               }
> > > >         } while (nofail && (ret < 0));
> > > >         memalloc_restore_scope(flags);
> > > > <snip>
> > > >
> > > And looking further. If the __vmap_pages_range()/__vmap_pages_range_n=
oflush()
> > > and friends fail, a proper cleanups should be done inside, IMO.
> >
> > Sounds like we are in agreement.
> >
> > >
> > > But i am checking callers and see that some do some not:
> > >
> > > <snip hooks.c>
> > >         __vunmap_range_noflush(
> > >                 vmalloc_shadow(start),
> > >                 vmalloc_shadow(start + clean * PAGE_SIZE));
> > >         __vunmap_range_noflush(
> > >                 vmalloc_origin(start),
> > >                 vmalloc_origin(start + clean * PAGE_SIZE));
> > > <snip hooks.c>
> > >
> > > kmsan_ioremap_page_range() it does clean ups;
> > > kmsan_vmap_pages_range_noflush() looks like does not care in shadow.c=
;
> > > __vmalloc_area_node() as noted, it is broken as there is a BUG() on n=
ext try if nofail;
> > > pcpu_map_pages() it does cleanups.
> > > ...
> > >
> > > and so on.
> >
> > Yeah, the callers that do the cleanup should stop doing that once the
> > vmap functions handle it themselves. I expect an overall reduction in
> > code size.
> >
> Agree. If mapping API is called and it fails the caller should expect
> the state as it was before calling that API function, IMO.

Thanks for confirmation!

Hao, do you need help with making the change in vmap functions to
cleanup upon a failure?

>
> --
> Uladzislau Rezki

Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53C4BF93E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585662; cv=pass; b=u7xKTkavIt1sg+4B2JICurup4RcRjgBb6pP2ZlEmFApFruxTqKlShyGeDiUYh+5L2/INdIw240yN07HdlaPpqwNoEEJZPkBoDC6l4glqnJUos3lz0hbx4XZchGrfVJbNi7AIaD+XM19gUkShunnqczPzjB4XZv1Sf+aGxL+/ZQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585662; c=relaxed/simple;
	bh=KPU7IzR69Ng/j6m8YHFvvjb5SqAkfnaH0qbM64QKGw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYIfFxgh4J4ZZ7oLJEtQYZQ3EW9QCzfXOKTtBZoxrwAvc9BMkuEhZzW8uEsKo18Y8QtKCcHR+kDSn9DCNmbuNwjgf16p0XCjlTmW5rFRM9A8E3sw6XBwZ/lA839PwEs4wysO1L7VRYBoGjIXg1ozsB5jQoiVB549ZDjjwivDxtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CMnwcelI; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CMnwcelI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so16831cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789585635; cv=none;
        d=google.com; s=arc-20260327;
        b=dOGEcj+7q8FhUcoJ36/WqoFptB8+vYoRyIyD3WgU0wek2JXUndr3f8sUfgzCQ22Pnw
         bnBH58PfEWmBXYutLF9tdvQsvDWBCwvB0K1K0o5INWVPE3mm4EAOaTG3s1lAoUSCIDVk
         FvEIznPQcux7FcLePaWK4qO+qwM1baN6KIVoh9eBXK/CyKrpa0Y5gLVhHulKCzM2mNFf
         MySNkEp436vQFxpv0lHkUHfH75lO6ZCb61qANYGA+/biJSslryD9ncd7gbKFvyvRcR0O
         3RjrRj4K3U5PeRQCMb3ZwYirADYrgQ5V69hZZYeEIBYf2shtILzzXS/3AUB0sKcBH8Cp
         Wr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yHbOQrPgVkpK3KZeBIodImpdgvuoykZQvSNB9/nSIAA=;
        fh=/GYWh75b+plcBqPvUFoxwB1Al1Fsgyc340xuPH2S5OA=;
        b=aLMzJocOai8z5X9jPVNwz2PsLtDD5PthjMW6g9z4PyUO/QVrJth/2+VsLEmfwziof9
         caSMJWRDkU0TgHmigea7eyS5ZnJOlDTHUAr1TP1guFCJfu2TQAEtaGYYjvm1u0PQk5Rm
         5BHL6sI/YU5dHK67B1YsmMuXeNrR19hm8ie0aLTgDioXI+yQVX1iTO4WfXv0qFtY9qOn
         +wogIgk54jKKalfsxX3WDcIQB/7xzZeA7A43jltrUuy4wbrVs98YKW7Hy51FhuKpTb3Q
         2vD7un5FqlIokEI2LX2q/CBlB+JeaLXe0CNTpwFb1W+mmFp7RnexayWxloDcRtaHyZJe
         kLlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789585635; x=1790190435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHbOQrPgVkpK3KZeBIodImpdgvuoykZQvSNB9/nSIAA=;
        b=CMnwcelIDyTuiaLuMFiKWIa46IsxWJ4KWE9fsZXIAQSidAShgdI/KaW/IVr7HtoC2S
         0vZDyOvkUTEsb+tvmR6ABoA7KdFaUhVVSJGcQNs4asTkCGd6EG02plpR32tBIT+kHQmk
         SSFEsgciRvORBxi1Rn2bSrxwANGb/aFprTORpICWh0L0M41AUYVeFTxSVeEHjLi8CQrI
         azO40xSF15FI6YZJyksiuxIKWRnWY4Tm69IKkbGZjfofxlDCLxAoLNlBj5HxVN166FKB
         w7juyQjYBlR8Bn546PFYQa4wAEY96rjQHZYe+51sl+pyEfpamHPuqtYdPZOnWnkJgNQ8
         ODjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789585635; x=1790190435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHbOQrPgVkpK3KZeBIodImpdgvuoykZQvSNB9/nSIAA=;
        b=Ii+AgRZX0QO6ucRReP4REg7ihUH+wN9DJBwAyEW5wALiYFNGOLRkhVb1hzH+HPB2OJ
         bGiYTapAHoixM31HcYzPDbAKtmopQMJXJ7Lj65fox6D0D4UktVV80sesEN30/4dhDLRU
         1HCQSuGpRfdqlcudmK0SyVGbXNdz+ouvbsTa8TCPVX/MAkwiqJiCIsvf/mTXfCfd/AJq
         wnCZBXb4shPxX8YRSlwiNYQeaoDZew2IQ5ZGbDGjXO2Yxv55+6K0r/mjHT/Jn45s6akV
         jrWC2PwCSoMZ9vs+EHXLDoUQgmCNc47BAcWGe54/FhYOFIMdKiOawrbn8D23nBiM2tPJ
         b+hg==
X-Forwarded-Encrypted: i=1; AKwUvBzPDKf3Nv4DZ5mXla48cYehSLs/628egJeOpA4J+oWxDFoErjzpK4LiMXR1Xps+ykBY2fvLbzBDsBEvA2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lTOQBpUAt11Eu1ev2DvhglpQ0kR3XhYS+Yjw+CFONTWK8F1KXK
	0SDvCmduSzQeHrwUj+KubekVyQ6UL6JUnDKYIQZbuXcmFAberT69ekwYPesrEchu5N5o4vljEZl
	NDm1BnQjtwUhpkYP5st8m59JjvO0Q2RtuTaucr3JE
X-Gm-Gg: AYBFou39aUTl2ZvnnhNQgy5OA4xiMut0vsmBwLW2eRmR2SiEPIXYdfTY6oDFhVknzNt
	iEpMvWlM+4LTn1vb6gsyHzIXqnkOpu6PRRZ2iBapkC7Gy/RBEYGKJzV1mtG+cXbc7jQeBZTJFXn
	6Ctgs6mEl7NzXzLv9WYf6LFXYp0MoAEOJVhljKr02fcYJJmFMd0i76OLdMotLP+gZGgZKW7jOK9
	JD4xlQugAqe6keF/pe4ARffCIbg71etWtwaW/VVmmyNoq0jY3IxT/tnl8L/pPQdG8IpiczuX0Of
	w4N2ydXrr2Hp2HIQUHQCbriqWIrMzmm8L4Tc8HAWQHGz4bJl8eoN8l/5bd2hH2NErCiBK53S4Cd
	1qkvWpN5kBw==
X-Received: by 2002:ac8:5d10:0:b0:532:858d:e791 with SMTP id
 d75a77b69052e-5328dc0bc4fmr2243931cf.8.1789585634800; Wed, 16 Sep 2026
 12:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-3-hao.ge@linux.dev>
 <CAJuCfpHJSwNhgotMVpmjVvdv=m52_7Kvzpztf0WcN0AaoSeGGw@mail.gmail.com>
 <60642a7f-2949-428a-8290-40d69c989a77@linux.dev> <CAJuCfpG3d7n=z5WnUQYZsqvrt1pemF8TFvGiGyZGLO7ykVvqAQ@mail.gmail.com>
In-Reply-To: <CAJuCfpG3d7n=z5WnUQYZsqvrt1pemF8TFvGiGyZGLO7ykVvqAQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Sep 2026 12:07:03 -0700
X-Gm-Features: AcwNN1U77eJFNHkPfe6Ppe6tyXfOBb0DKmw4ydlFrQQ2j_8G2MzMCljaOX2F-Do
Message-ID: <CAJuCfpGeRdFY6UPF-vXxwHvP2+tN=BKgRkmLR3PMLuWhxgzPRA@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] alloc_tag: clean up the populate failure path
To: Hao Ge <hao.ge@linux.dev>, "David Hildenbrand (Red Hat)" <david@kernel.org>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 9:31=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Sep 15, 2026 at 11:00=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Suren
> >
> > Thanks for you review.
> >
> > On 2026/9/16 05:09, Suren Baghdasaryan wrote:
> > > On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wr=
ote:
> > >>
> > >> The reservation is already stored in the maple tree when
> > >> vm_module_tags_populate() fails. A failed load never unloads the
> > >> module, so nothing releases the entry. Release it and roll
> > >> module_tags.size back. Without the rollback a concurrent load that
> > >> already passed needs_section_mem() can reuse the freed gap, skip
> > >> vm_module_tags_populate() and write to unmapped memory.
> > >>
> > >> vmap_pages_range() may have installed some PTEs before failing. A
> > >> retry to populate the same range would BUG on them, so undo them,
> > >> but only if vmap actually ran.
> > >>
> > >> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag com=
pression")
> > >> Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as =
needed")
> > >
> > > If a patch fixes two other patches, it likely needs to be split so
> > > that each part fixes one patch only. But read on please. I'm not sure
> > > if one of the fixes is correct.
> > >
> >
> > Kept them in one patch because they only make sense together.
> >
> > After a failed populate the reservation is released and the
> > size rolled back, so the next load takes the same gap and calls
> > vm_module_tags_populate() again, and that retry would trip over
> > the PTEs the failed vmap left behind.
> >
> > Without the rollback a load that already passed needs_section_mem()
> > just reuses the gap, skips populate and writes to unmapped memory.
> > So splitting them leaves each half broken.
>
> Yeah, that's why I think vmap_pages_range() cleanup should be a
> completely separate patch with vmap_pages_range() doing cleanup
> itself.
>
> >
> > >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> > >> Cc: stable@vger.kernel.org
> > >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > >> ---
> > >>  mm/alloc_tag.c | 10 ++++++++++
> > >>  1 file changed, 10 insertions(+)
> > >>
> > >> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > >> index 2070e682fe10..95ddf5b743d0 100644
> > >> --- a/mm/alloc_tag.c
> > >> +++ b/mm/alloc_tag.c
> > >> @@ -804,6 +804,13 @@ static int vm_module_tags_populate(void)
> > >>                                      next_page, PAGE_SHIFT) < 0) {
> > >>                         release_pages_arg arg =3D { .pages =3D next_=
page };
> > >>
> > >> +                       /*
> > >> +                        * vmap_pages_range() only runs once all pag=
es were
> > >> +                        * allocated, and it may have installed some=
 mappings
> > >> +                        * before failing. Undo them.
> > >
> > > If vmap_pages_range() failed to map the range, why should we need to
> > > undo it? If it indeed leaves some partial mapping when failing then I
> > > would argue that vmap_pages_range() should be undoing these partial
> > > mappings itself before returning the error.
> > >
> > Yeah it does - none of the paths under vmap_pages_range() undo themselv=
es on error.
>
> Hmm. I wonder if this behavior is intentional or requires a fix. The
> only possible reason I can think of is performance but I can't imagine
> a failure to map is a performance-critical case.
>
> +David Hildenbrand (Red Hat), +Lorenzo Stoakes (Oracle) what do you

Huh, my gmail thinks you are still at your previous companies :)

> guys think? Shouldn't vmap_pages_range() undo its possible partial
> mapping when it fails?
>
>
> > pcpu_map_pages does perform cleanup on its own as well. There may be ot=
her similar sites.
> > https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/percpu-vm.c#L255
> > so I did the same here.
> >
> > If we really want vmap_pages_range() to handle this cleanup internally,=
 I believe that would
> > be a relatively large change, and we would need to consider many more c=
ases. So I think we keep
> > the current behaviour for now.
>
> Yeah, I understand it would require a deeper cut but if that's the
> right way to handle this we might as well do that. Let's see what MM
> folks think.
>
> >
> > Thanks
> > Best Regards
> > Hao
> >
> > >> +                        */
> > >> +                       if (nr =3D=3D more_pages)
> > >> +                               vunmap_range(phys_end, phys_end + (n=
r << PAGE_SHIFT));
> > >>                         /* Clean up and error out */
> > >>                         release_pages(arg, nr);
> > >>                         return -ENOMEM;
> > >> @@ -947,6 +954,7 @@ static void *reserve_module_tags(struct module *=
mod, unsigned long size,
> > >>                 return ret;
> > >>
> > >>         if (module_tags.size < offset + size) {
> > >> +               unsigned long prev_size =3D module_tags.size;
> > >>                 int grow_res;
> > >>
> > >>                 module_tags.size =3D offset + size;
> > >> @@ -961,6 +969,8 @@ static void *reserve_module_tags(struct module *=
mod, unsigned long size,
> > >>                         shutdown_mem_profiling(true);
> > >>                         pr_err("Failed to allocate memory for alloca=
tion tags in the module %s. Memory allocation profiling is disabled!\n",
> > >>                                mod->name);
> > >> +                       release_module_tags(mod, false);
> > >> +                       module_tags.size =3D prev_size;
> > >
> > > Yes, this one is a valid fix. It fixes 0f9b685626da commit.
> > >
> > >>                         return ERR_PTR(grow_res);
> > >>                 }
> > >>         }
> > >> --
> > >> 2.25.1
> > >>

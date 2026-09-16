Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510B599A21
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576340; cv=pass; b=aMqyvweQPfs607bQGIejX5beIkYFaIpa+sElGXkKSNaAGzOHL50aLWBVZYHAiJrEathCZ5XgJEAkakhJ4Dn8l0LKbjStUCB/TQ8lqJdsnn3wxqVOlTI1jFN3a5mCMDa3qnhCNHh8tAj1QbbcHTHx2pj7WIsHki7/xHQvXT4wB4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576340; c=relaxed/simple;
	bh=jzI0/3psf3wVtPf9Shhf21d5CPCoSmdvQs1bzsuLWKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANME4zg5XbY/pgLIFSdDSxR59oDdSGX8B7ByIhQS1em4JQcHk6lUROxbI0lFkDk7LppeTCY8EVpX3AcmynecmFU0pwB8iSp53EUCadxmaxsgt/dwn0aCBDVDivxydD8D8vnbu+dzCSXRr+CzZiAWtWYrBeDqaZybMAXKx2mEm70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mZrociJ5; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mZrociJ5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso323871cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789576331; cv=none;
        d=google.com; s=arc-20260327;
        b=AhhMpVDnoneZuIsyo06W7p5Rsafc9Ge/KyK+sGH2LQvXeIlR9klOEhi6CfeJFcNWrl
         rJtimeGaG86XLssVLbM7uSq+b2/rkrySGXzb9oz9LfI9XYgyZgcxfZrOxtCXwLnxcM1N
         tlYfiQAlkY+bb/oeomPhqWH9Oha3cZzYkxAbrNjR1SxDRBx+VDSNXO/IjjD/Aq4BBztr
         pC4sduQa6Dm0FZMdOD5257wc7XC8voJyc4fXR0p7erTORuPXDtwGuSxiW4tOEUO0v0ak
         KemQCP1jsJe8N5U8KXmsIhA92KNuEpMaZiH4By652YfuZ662zhIQdsdHl3Lrh8MQufIH
         MlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUDhjbftqgjAL9HivD9mk/nQ9a+7BLYF9Ygx6CAW0uc=;
        fh=o6snRHqLcpBihviXpTis7SiPoeU+z1S+iMAM0JARz4Q=;
        b=IPuCNqllKsQVwqekOucTf7UkZ3j0cJ8uRhXSn3FPq6R9bI7rxWZMDRpJrCyobVNDc/
         ay5DeEk2I48V7DkFhZ8vBlLJid/SyQptMwmevCX53Ok4r5Xm0Or8AWQGlp48iM2iodZw
         zMYbSnLQm8bF7erFhKHl8YTC3W74Ziua6Gql6qKm0a9tX9F38pLPh6peq+/J9wh11QZJ
         uxKt8m/92ZtRuO1UTXSUwP3y6Y6w/weczWmgx/raz+Cxqz2BvNvZJxpMyJ9CzetwJWL2
         G+NYjOO9pCKJmJVw9vNDESjtwUatxCI8rkYiNt2RL1iJ/4NnADweiT/OUzmxkbemKULF
         EJfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789576331; x=1790181131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUDhjbftqgjAL9HivD9mk/nQ9a+7BLYF9Ygx6CAW0uc=;
        b=mZrociJ5yOgIJGyleAhdomFHPF1EsxO1gF3/88LipOCvVhQ5ujBvKVaa3NIjp6Q13e
         Le+8wWTvC4OSAtZH01ZXnU0hl8929uHy9HJZCWgFrbiucbIhCMmJSQ22golOh0AbSagt
         382UDRE+53EKdYIUdFr4RvjNirtOA1n9uxDcfwu9YAlW3eHcPo1xiu/FxZIXQvsh8rYb
         qsVukY8i02hZTP9uHDnlsHqn/A6gllUbYT0p7BPQbhiJkzcmUsDCIs3CtWGXEwAnAvDm
         oytwPTig9wYsfDe2Ger9yx7slATE5QwP1kTJEcWPrIdi/Aj7yfIIHj3UsfqLWnOU9Pnq
         8BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576331; x=1790181131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUDhjbftqgjAL9HivD9mk/nQ9a+7BLYF9Ygx6CAW0uc=;
        b=EU+lBwOe8I7R6XD4t3w6SC+Eez14vKmYWkIb/fxBYesjeIZ0CXD4Cx7vWpTYz8H7Jp
         pEv1l9TpLLdLvuW58V6aeySWdJYZnqc9dP8fhJ4oDbSWhMA2RGjQ40Zw3zGrgJUuHzWd
         9AeFV7uXFZdb2hCm6m0xLzNPzHYHgrhzO+DpfgA49AlaPZsf6N57kVGEap8c7aNVTJPP
         KB8jr6cFbMeTocgdJXqhtzG/Z1lMEL9+/uYkjavpovhjxEK60zJCoyJAtWfoV0pDLuMO
         vmGZQeSNH6jrx73IWfkZ99RKvgL62kVNIlyRSSMGxOkl0DbMxa4iKBHayM511LkVqoU2
         JPvg==
X-Forwarded-Encrypted: i=1; AKwUvBwoEdVebf68maADXjQeYZqPFaW+efqI4q+jeZNME+YwpmP1+FXu7rf8GPqfTitwrx/XKY7qJ+umOJ3+oGs=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Z3+gLwz5MCWH9nWKTCzZ6dWYFMcRZOaOHLLeqZheRkj1AxXV
	ySnbB+H7rF3DmXMbG+2IQz3fElvWdbcw/a2J+xHm9jCppb5kebejWq0YGVswKQtKJRf0jWm6/pd
	kusZPW/7+odkeMsFgA14qr/L4YcWt21liAvzhQvsb
X-Gm-Gg: AYBFou00xOBi6yQ7RcMH1lbdGxHV3XocsQroIthV2x6wHvYwvdx23nxvljBgaXkIigB
	1za+vIMjlQV7uz1t5Tzwzkap2nBECwy7NDlx3niRRhp56ZU6bGw66p2SxiH8xs7MJkCD7v9DgIP
	E2QexAuzhrFclnOsYNaB22hbFPCXiyY9xM2ik59umSE/3fBjY+yo8Bg+jqb7ndj5OYf1iuq7jk8
	pZis/PvNdIt3lPlVVq7UQxOhEDD7XA0neLn/kHXy5B8/MMhaPYyJ5hvX9UxDG5IOWV2kbBtGDz+
	Ggkz3tuDfXF3dbKwXOJt23jhU5bpHz4BNITSZ53/VXfrSrhOByNRGhUNi+fBadJy3RkP49lkELq
	Yo0nkvtUUFg==
X-Received: by 2002:ac8:594d:0:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-5327eb6f730mr14653271cf.0.1789576329678; Wed, 16 Sep 2026
 09:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-3-hao.ge@linux.dev>
 <CAJuCfpHJSwNhgotMVpmjVvdv=m52_7Kvzpztf0WcN0AaoSeGGw@mail.gmail.com> <60642a7f-2949-428a-8290-40d69c989a77@linux.dev>
In-Reply-To: <60642a7f-2949-428a-8290-40d69c989a77@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Sep 2026 09:31:57 -0700
X-Gm-Features: AcwNN1Ui51wqsB_O4pl6c8tWHX6Ce9XwML9-1bQ7rL4qQiN8F18j46JxhZ3BkmQ
Message-ID: <CAJuCfpG3d7n=z5WnUQYZsqvrt1pemF8TFvGiGyZGLO7ykVvqAQ@mail.gmail.com>
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

On Tue, Sep 15, 2026 at 11:00=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren
>
> Thanks for you review.
>
> On 2026/9/16 05:09, Suren Baghdasaryan wrote:
> > On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrot=
e:
> >>
> >> The reservation is already stored in the maple tree when
> >> vm_module_tags_populate() fails. A failed load never unloads the
> >> module, so nothing releases the entry. Release it and roll
> >> module_tags.size back. Without the rollback a concurrent load that
> >> already passed needs_section_mem() can reuse the freed gap, skip
> >> vm_module_tags_populate() and write to unmapped memory.
> >>
> >> vmap_pages_range() may have installed some PTEs before failing. A
> >> retry to populate the same range would BUG on them, so undo them,
> >> but only if vmap actually ran.
> >>
> >> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compr=
ession")
> >> Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as ne=
eded")
> >
> > If a patch fixes two other patches, it likely needs to be split so
> > that each part fixes one patch only. But read on please. I'm not sure
> > if one of the fixes is correct.
> >
>
> Kept them in one patch because they only make sense together.
>
> After a failed populate the reservation is released and the
> size rolled back, so the next load takes the same gap and calls
> vm_module_tags_populate() again, and that retry would trip over
> the PTEs the failed vmap left behind.
>
> Without the rollback a load that already passed needs_section_mem()
> just reuses the gap, skips populate and writes to unmapped memory.
> So splitting them leaves each half broken.

Yeah, that's why I think vmap_pages_range() cleanup should be a
completely separate patch with vmap_pages_range() doing cleanup
itself.

>
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >> ---
> >>  mm/alloc_tag.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> >> index 2070e682fe10..95ddf5b743d0 100644
> >> --- a/mm/alloc_tag.c
> >> +++ b/mm/alloc_tag.c
> >> @@ -804,6 +804,13 @@ static int vm_module_tags_populate(void)
> >>                                      next_page, PAGE_SHIFT) < 0) {
> >>                         release_pages_arg arg =3D { .pages =3D next_pa=
ge };
> >>
> >> +                       /*
> >> +                        * vmap_pages_range() only runs once all pages=
 were
> >> +                        * allocated, and it may have installed some m=
appings
> >> +                        * before failing. Undo them.
> >
> > If vmap_pages_range() failed to map the range, why should we need to
> > undo it? If it indeed leaves some partial mapping when failing then I
> > would argue that vmap_pages_range() should be undoing these partial
> > mappings itself before returning the error.
> >
> Yeah it does - none of the paths under vmap_pages_range() undo themselves=
 on error.

Hmm. I wonder if this behavior is intentional or requires a fix. The
only possible reason I can think of is performance but I can't imagine
a failure to map is a performance-critical case.

+David Hildenbrand (Red Hat), +Lorenzo Stoakes (Oracle) what do you
guys think? Shouldn't vmap_pages_range() undo its possible partial
mapping when it fails?


> pcpu_map_pages does perform cleanup on its own as well. There may be othe=
r similar sites.
> https://elixir.bootlin.com/linux/v7.3-rc3/source/mm/percpu-vm.c#L255
> so I did the same here.
>
> If we really want vmap_pages_range() to handle this cleanup internally, I=
 believe that would
> be a relatively large change, and we would need to consider many more cas=
es. So I think we keep
> the current behaviour for now.

Yeah, I understand it would require a deeper cut but if that's the
right way to handle this we might as well do that. Let's see what MM
folks think.

>
> Thanks
> Best Regards
> Hao
>
> >> +                        */
> >> +                       if (nr =3D=3D more_pages)
> >> +                               vunmap_range(phys_end, phys_end + (nr =
<< PAGE_SHIFT));
> >>                         /* Clean up and error out */
> >>                         release_pages(arg, nr);
> >>                         return -ENOMEM;
> >> @@ -947,6 +954,7 @@ static void *reserve_module_tags(struct module *mo=
d, unsigned long size,
> >>                 return ret;
> >>
> >>         if (module_tags.size < offset + size) {
> >> +               unsigned long prev_size =3D module_tags.size;
> >>                 int grow_res;
> >>
> >>                 module_tags.size =3D offset + size;
> >> @@ -961,6 +969,8 @@ static void *reserve_module_tags(struct module *mo=
d, unsigned long size,
> >>                         shutdown_mem_profiling(true);
> >>                         pr_err("Failed to allocate memory for allocati=
on tags in the module %s. Memory allocation profiling is disabled!\n",
> >>                                mod->name);
> >> +                       release_module_tags(mod, false);
> >> +                       module_tags.size =3D prev_size;
> >
> > Yes, this one is a valid fix. It fixes 0f9b685626da commit.
> >
> >>                         return ERR_PTR(grow_res);
> >>                 }
> >>         }
> >> --
> >> 2.25.1
> >>

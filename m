Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793133222;
	b=y5HEhpT+u/hPpyEOmMPQnbzl+miJWtFkxSfLzYYQqtmPHJOLcT1nbXJnfgbvtoWhlhws
	 fUNK1oYhF4+CUjIykxxJZ9CuBZihUyacPov4Z1PqbG6QNVOaBQAOTy7jxJNFF8O5hw+Ij
	 nvskWvQw58rdbWYicgbNUbtnmafKJuYDoRKoT1H9lWhMzDX7JRg9blON/6EoNkhtGKX5Y
	 UYhYqhOFzN1LjFhizSBh/liAU+k76YNJFa+37V8Ejy9F790Quv9ei9ujMStn8tsLozsXU
	 jt8uIibqJ8macDMGddzm7Al5V2ttHecmAqKMZ969R5My4E12zx76ylGFOIhJdOYTJ5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nGVzZSBgakxWmcqzfl+9A2MiYwXiZAI9axGmW3aBX1Q=;
	b=bUrUnoD+rBSone3zLv/Ew/v/2oPKk+W9Rh/6vaQq17atSSqPU2IIdz3kZUMppPsVv3vQ
	 HUYCdBUQ9EXGcItdQ/vlByRoQjhp4KljuyXwYR4oBMAwPYsFPIU/ORnM6OPZ5CfKVyzmZ
	 SkWZQwCcYW8giB5I2ZkaeUznxymDnXwgZMsyBWyv0ITFAgfSxet3HWwnTuFd66mqqanGB
	 /1564Li5yP6pRqkDshSb66AkoMe8zVmljFZGNJZNlii/Z3I6MyVhLhMpzrFr9wuB4QtJO
	 tCDPhKPq8ISFsfIz1NqHSdCKpatrwTKZ9eSmug/R5FTsbRob6x/jdoa5x7dIk+NQrmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AazctrpI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D239606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D239606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AazctrpI
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so89951cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793133220; cv=none;
        d=google.com; s=arc-20260327;
        b=Q5IBmg9SScGEEh3dhNPzODIugZ9hUcWYx90UhOwGN+zQzeETyx6Dx7dxhaXjGwCIlZ
         rLto+I4jbu+cqedkL8NBhgxUEeqaTBILnB2DkybdF1v0EH2ydUshlkpBFn6yqxNU8jnC
         WOlebSPe78dYTh8CC8R4gYnqQguFF3SOvOD2Bgc3ODdgnUqv4v01jiAsYZGVuQitz6Mv
         wO4PgOI61IQYHdPXAmOCrLglgBpunn1J//7RIT5Z5Q4BOpjK22GJ0fLiqQfubro0P1ns
         g5fqDr7mFEqoYq6Ie4zzfNsXaWFB1yuZMId6eNVYg8tmh+/PKmTfrN+vIeRCzMIrriXm
         OLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGVzZSBgakxWmcqzfl+9A2MiYwXiZAI9axGmW3aBX1Q=;
        fh=czXePuAGtNyyKMrnu56pfJStwN6YrBP6YWLS9sUXaKw=;
        b=FJ4FL71zgpcBQgNFmJMO8QD8SQhSzrM/Xos25sRweFn69JOT/YKHgv3IvE4V6+rhge
         OM2FrA/cqggDmtys4euJ12fhJ2/J+OmYBEdJFD0IYGV093eUBTtA8q0NO5HmIq5G4kq/
         femwKPP8eRcwyS/LoM68gc0hPH6BshAsMlRaXsjni6SFIV6FUEWQyN4Hr33uYyQF76lx
         xwuqZvJTIZaHdIQ59I7IgQZ6dyigExUgBPeh113UpkN66yx4mhmTdntPKhngLEspRj2x
         2eLIIbQhbylBeFSZrlHWN7QwPiiAH2Ns1ECU2m909l/yqK7fpvdB0LE56fc/qU7iK3bp
         kY9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793133220; x=1793738020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGVzZSBgakxWmcqzfl+9A2MiYwXiZAI9axGmW3aBX1Q=;
        b=AazctrpICW2zMwn0pJv0V+ui8SqH0lZFUAOxjdI7vsy6kYFFQI6dtBz5CmM8lOufyv
         gDxsWdUn29S6BhIsbBRpMahWK3QnYEztvVM5gmq0am4j9py6bk5eM08HKknhgB+m6nzJ
         EMvU43G3qILhj6zvDZNAk2VeUs9ApIO8MFBLjMWfJ6A5u9iQFxR8KwycA0gJtP6FMQvr
         +MJdmHLjPV70IFNji12TDt3qigbuF2RdiWXGuBtiNZwdu9i4LAzz52Kw8E++SQWPIydD
         vYs+XGpd2QUuVzrmYWBzibq71mxpMCmt6AggXhAVKHAank2z6JSbC4Sq2KRqyA7JxPjd
         Ic2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133220; x=1793738020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGVzZSBgakxWmcqzfl+9A2MiYwXiZAI9axGmW3aBX1Q=;
        b=SDqE1p8Wh4ZMWu2c5Z2QvZv/kmkeV3gO1SJes2sM227s7WxBB3LSo/66a20JP3NLk1
         b3zjs/4+chS2D8ulSNXo5ULuWXR2DHUqhjfgT9iOVrCk0kgfYq2wCtPONGGHba3Z91hr
         B537bDdT4Q7DoyMxHQvvfukrX9ExS+6zXvDxH+JybUzEfBToHFs+hnowo+C/Ps1r+els
         jIa08cigowuhUuZmO9WKtQKckFK9pjtakAuaoWl9Gt2CQ+A9hrLOxPhC6hy7CNnY4NFm
         IDGq/FcOibrZ3K0sTs4A0jae4PPAoaNZrZHVLxjJWBMiS3W2EYRiCQaVa/rpJA8La6d1
         1j5w==
X-Forwarded-Encrypted: i=1; AKwUvBxIY/J8U1AfwSFz0Cz9b/UTzbq3be3FpZf8vy9EBUKF+k5zSrFPBQHVWqFkZ37BW7Szv9orGosa/koj+RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnAKmwgf0R/jw0i1+/D+xn/L5DEgOb4O42KJflpqcI2zT1eNx3
	nTeu5mOMOh8APaTW5aACybebem9lqHySb5ErT2+Xljo4bl3uZ+7XA/G0LPGWqSRtuRvWzn2L7II
	Z8F130BrgAm8M8kUnWnp5CazUK5FIwJsCXGd7GD/o
X-Gm-Gg: AYBFou0q5zv8NHvyzM+Z9RMptSuAroPUind4S3TDZSP4rNclvpElbwO1A7C4ZLvU3HO
	jsIyWrp+jHQCAhh746rbingaYgsQ+zyTEs/YEyhQnGLU+onkNOhqeDWkSNMXT8dHKRuipZl4S5Z
	eY2X28KZAQXz/fPCpwyEG4UK/C6X9hvRG1OfnYzjG7h/I3eWqs1NAiTmq7E0Y5HGiqlyxt+brnt
	M31aGcKgSxRvw4AET2t43NDvzBlt3u5jWyMoK8PYhrmm5R7KEzzCw7vJdmnSoNDxWz/bMe8ZhKb
	LF5mnC/KFuN16vkvuC3SaPnUWWUALJ4aiP1tyjQa08z2yQRMMfHg3Pof7Sahgh0hhkslU26xqLm
	9vT6OOridPkCaAdQFcH58b/8OuhzCcOzYbFCTDXO8Ds8OpeXjA91uv9CgEYcEhHcba2c=
X-Received: by 2002:a05:622a:2488:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53fe2554767mr1314101cf.8.1793133219456; Tue, 27 Oct 2026
 13:33:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fix-proc-pid-maps-missing-vmas-v2-1-2791cc9fc95f@kernel.org>
 <CAJuCfpELhxhyVQANspX14OBLbghiAqndYcfv1hnmh4Nvo=1vAQ@mail.gmail.com> <auDEn8GmB0H7zj99@gremlin>
In-Reply-To: <auDEn8GmB0H7zj99@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Oct 2026 13:33:28 -0700
X-Gm-Features: AclHuK9xIitY88h9-xQmFSg95vDMG0XSmM9H59NNZztoY7Pi5T1zymOIAg7NNiM
Message-ID: <CAJuCfpFqYcbw4rOhd+Q4PGryXjzTxYXpwmS7Ag_cbtPOYBW0Aw@mail.gmail.com>
Subject: Re: [PATCH v2] fs/proc/task_mmu: fix missed VMAs when reading
 /proc/PID/maps and friends
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Shakeel Butt <shakeel.butt@linux.dev>, SJ Park <sj@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:49=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Tue, Oct 27, 2026 at 08:34:10AM -0700, Suren Baghdasaryan wrote:
> > Overall the code looks correct bit I have a couple of questions below.
>
> Thanks!

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> >
> > > ---
> > > Note that I decided it's best to defer any VMA iterator stuff to a
> > > follow-up - with the abstractions added it's clear what's going on an=
d
> > > easier for backporting.
> >
> > Ok. But once we get VMA iterator validation routine implemented, we
> > won't need vma_rcu_iter and its helpers, I think. Are you ok with the
> > fact that most of this change will have to be removed later?
>
> No, I don't think this is correct.
>
> The iterator can't validate itself - the failure case is invisible to it,
> something changed in the tree and it has no way of knowing, it has to be
> prompted to re-init etc.
>
> I tried a version of the code with vma_iter_next_before() and it really d=
idn't
> provide much delta.
>
> So I think any version of this has to have the rvmi stuff.

Hmm. I though the fact that we store from_addr and can compare it with
mas->last could help us detect VMA skips but I'll have to think some
more about this.

>
> In any case, I am happy to replace all this with whatever makes most sens=
e
> going forwards.
>
> Key here is to fix the bug + get it backported :) [ before moving on to t=
he
> N other AI-reported bugs ;) ]

Understood. Yeah, I'm not going to nitpick here as you have your hands
full. If we find a better way we can improve it later.

>
> > > +static inline void vma_rcu_iter_init(struct vma_rcu_iter *rvmi,
> > > +               struct mm_struct *mm, struct vma_iterator *vmi,
> > > +               unsigned long addr)
> > > +{
> > > +       vma_iter_init(vmi, mm, addr);
> > > +       rvmi->mm =3D mm;
> > > +       rvmi->vmi =3D vmi;
> > > +       rvmi->mm_wr_seq =3D UINT_MAX; /* Start odd so changed by defa=
ult. */
> >
> > Why not initialize mm_wr_seq correctly using
> > mmap_lock_speculate_try_begin(mm, &rvmi->mm_wr_seq)? That way on the
> > first call to lock_next_vma() you won't be resetting vmi
> > unnecessarily.
>
> It doesn't really save anything, the init already sets you up in start st=
ate
> where you need to do a traversal anyway, and vma_next() will trigger a wa=
lk
> either way.

You might end up with an extra vma_iter_set() call but it's not critical at=
 all.

>
> What's useful about it is it makes it such that only lock_next_vma() does=
 the
> speculation (and thus sampling of mm_wr_seq).

OTOH you won't be exposing these odd/even seqcount details. Anyway,
I'm fine with what you have.

>
> > > @@ -471,14 +505,9 @@ struct vm_area_struct *lock_next_vma(struct mm_s=
truct *mm,
> > >          * installed ahead of it. Otherwise we might observe a gap th=
at should
> > >          * not be there.
> > >          */
> > > -       if (from_addr < vma->vm_start) {
> > > -               /* Verify only if the address space might have change=
d since vma lookup. */
> > > -               if (!mmap_unlocked || mmap_lock_speculate_retry(mm, m=
m_wr_seq)) {
> > > -                       vma_iter_set(vmi, from_addr);
> > > -                       if (vma !=3D vma_next(vmi))
> > > -                               goto fallback_unlock;
> > > -               }
> > > -       }
> > > +       if (from_addr < vma->vm_start &&
> > > +           vma_rcu_iter_may_have_skipped(rvmi, from_addr, vma->vm_st=
art - 1))
> > > +               goto fallback_unlock;
> >
> > Before this change we fell back only if the new search yielded a
> > different VMA (the vma !=3D vma_next(vmi) condition) while now we
> > fallback unconditionally. Note that the VMA that we are rechecking is
> > already locked, so it can't change. Was the previous logic invalid?
>
> It's not unconditional - it requires that we have progressed and we may h=
ave
> skipped a VMA change.
>
> The 'we have progressed' bit was there before (from_addr < vma->vm_start)=
, and
> vma_rcu_iter_may_have_skipped() wraps the previous check plus actually wa=
lks to
> check if something is there to traverse,

Ok, I see. vma_rcu_iter_may_have_skipped() effectively replaces (vma
!=3D vma_next(vmi)).

>
> So this is strictly an improvement.
>
> And yes the previous logic was invalid - the issue is with an unlocked VM=
A
> in the range [from_addr, vma->vm_start - 1].
>
> It's really the gap that's the problem AND a race against node replacemen=
t,
> which means that 'X' is skipped by vma_next().
>
> vma_next() is a walk to from_addr, then runs mas_next_slot() which advanc=
es
> to the next entry. If a gap, then the walk assigns mas->last to the end o=
f
> the gap, and if a node is killed before that happens, due to a VMA
> expanding _backwards_ like:
>
> vma_iter_set(vmi, from_addr), then mas_walk() from mas_find():
>
>         from_addr
>            |
>            v
>  |---------|      |-----|   |---------|
>  |    A    |      |  X  |   |    B    |
>  |---------|      |-----|   |---------|
>            ^     ^
>            |     |
>      mas->index  mas->last
>
> The walk lands in the gap. mas_next_slot() saves mas->last as its
> rewalk point.
>
> X expands backwards, the node containing the gap is replaced:
>
>         from_addr
>            |
>            v
>  |---------|  |---------|   |---------|
>  |    A    |  |    X    |   |    B    |
>  |---------|  |---------|   |---------|
>                  ^
>                  |
>              mas->last
>
> mas_next_slot() finds the node dead and calls mas_rewalk(mas->last),
> which now lands inside X:
>
>         from_addr
>            |
>            v
>  |---------|  |---------|   |---------|
>  |    A    |  |    X    |   |    B    |
>  |---------|  |---------|   |---------|
>                ^        ^
>                |        |
>          mas->index  mas->last
>
> mas_next_slot() then advances past the entry it is on, which is X:
>
>         from_addr           vmi
>            |                |
>            v                v
>  |---------|  |---------|   |---------|
>  |    A    |  |    X    |   |    B    |
>  |---------|  |---------|   |---------|
>
> So vma_next() returns B, having stepped over X. We lock B:
>
>         from_addr           vmi
>            |                |
>            v                v
>  |---------|  |---------|   |---------|
>  |    A    |  |    X    |   |    B    |
>  |---------|  |---------|   |---------|
>                               locked

Ok, so here we hit this "if (from_addr < vma->vm_start)" condition and
have to verify that we did not skip a VMA.

>
> Then if you get (really) unlucky, the same race happens again for the
> existing code:
>
> vma_iter_set(vmi, from_addr);
> if (vma !=3D vma_next(vmi))
>     goto fallback_unlock;
>
> The walk lands in the gap before X, something else is merged into X from
> below, the rewalk lands inside X and the advance steps over it again:
>
>         from_addr           vmi
>            |                |
>            v                v
>  |---------| |----------|   |---------|
>  |    A    | |     X    |   |    B    |
>  |---------| |----------|   |---------|
>                               locked
>
> And suddenly vma =3D=3D vma_next(vmi), no fallback, and X is never report=
ed.

Got it. The same skip must happen the first time and then during our
verification. Thanks for the detailed explanation.

>
> With the new approach you simply can't miss it, as
> vma_rcu_iter_maybe_changed() will see a change could have happened, and
> vma_range_is_empty() tells you explicitly, with a brand new separate walk=
,
> whether e.g. X is there.

Yep, that function name is indeed very clear.

>
> It's finnicky, finnicky stuff, which is probably why AI found it :))
>
> --
> Cheers, Lorenzo

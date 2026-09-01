Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E549DBB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287822; cv=pass; b=uPxnj8JCosXVmdy8lCTRIYfAyjUVpWY/8ETxy0ohPvUCkfLW5ioFq8/b7NbFHmT6e0QMZHxiLA62l6l64qu+Rug4N4uaFLJYGuvACIvk/eQwtXpzyRxml+0GqG5J77cO+RMtJdDr5+E/1p9orPNBlZqadi7xM1t4ipw0ScUmtD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287822; c=relaxed/simple;
	bh=i7l3f/T9kKF5TN4Wa1LIlLBpN3SB+N4kLu22MC4+OoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOcuSgUS6gpUZx0LjT9V2tTpljPRtMtJ+l/u+0u2dFqayvT5z1wkNw3SAQh6lz2q+5DD9+pzxxUg7vfZo1zfie4feLiJHuH7ILXZlndvkhlhZWxMDUH7OOB66bwodrs5cUJRfDLVqIY+jzZbmBcQys3xXGYtkicK2RH0HUnFEOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahYFmD3x; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahYFmD3x"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52fac937235so32281cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788287819; cv=none;
        d=google.com; s=arc-20260327;
        b=OHlMBmtNy8Q1IN3MVTErSMIIR9ETyoqVNqSv0w3e5mqix4YOcnbEdPKoAFe1TfW+ox
         l3JQh5ByP3vcCPRKzbVHD3240Oc/5shX9gV7q8vdOMAudgAD4k7KJ6zy/u3oqx6I/B9S
         g52CzEzQZLe56ntCoC7kc1O9SxOINubf483kCg+YYzOuclBSeAsRfKoc3R9Oy7iIEySN
         hkB3YMKFKwWjcd1if5/yD2GNQVFm07X0I/6zHDKZOYAgYiIfaVGOJ/RspKzNA9NEhxXJ
         eI55h2cHYLi8A4SDCJS2blXmixFh6cGp7k0sFpd6fmTN+ywJBVgjPbtb7Vjh/xeCinmP
         JITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=deSloNnROwXtYwAsI/oPSWN8BS0rUlZqZlnebW2ETcc=;
        fh=BqjstGp5yAemb8GDClq8Of7D1dyiF4Wkx0o5X1WoOAs=;
        b=BXc9xzdj4S8AnVeceBeiIRdeYdi2afUybAuJvdMiPw4aMhkZ43PsP4lmhej/voTihe
         sac3g14pRzlgmXVe1KpgDdJOfxYH8sg2ReO7Qp+6DBbNHVJxHrK0KsFQiQKeJ8sJmPHF
         vnpuziV/AJDNSmrhtaO4fYPJAY3muU461dXXHEWUKQ2Uo6sTN82i5jl+OSIUz36ooV6Q
         4IxkHIKrOMZkDyPF5OUXIZnDatct66CpdoTJ5+L6pDssENLY1Wd/VCD1595JtpPDWmVF
         BWgi48+p9d/m6LZ12e33l1iI1SvVDzwdVHM5VbjPtowxrUQvxzpsWuV+TuxJexwP8URU
         eceA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788287819; x=1788892619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=deSloNnROwXtYwAsI/oPSWN8BS0rUlZqZlnebW2ETcc=;
        b=ahYFmD3xble2mWEyqbcVOtJ6gwbyKcI2zvpInilhUNTDPpw1qnc3UBtNyYK1OvZHOD
         e+0kdKpq//C10O/3QW8dy07Wtmwi4HifP+rhZqq7SCR8F/ZbMd4u2xRGvDV5Pu1LfFP1
         OLxrNX2HjMdGpqHdk0OUT1TBbEibPpGJLF6hZzabRyqdic6AAMyXzF9Bf9GmHsqyM9vO
         ygCQWbvbpy1S9ZGGisUFCdtefft4eJIVk2lS4tLDDoy6XG3db7bufLHpSdFVh7AGuUKj
         8YEYCQf37zY5UFmu4ET7M8s27OJZf7HHDI2dcjmfMNwcs8173uXUpPzVobWYGrbCqV7X
         gJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287819; x=1788892619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deSloNnROwXtYwAsI/oPSWN8BS0rUlZqZlnebW2ETcc=;
        b=BwcvftafkQg6yMp5l2CSdBvj2/ceLPJyI3PJlpZGYju8bFE7OT94UYv3pujyxjgkyu
         10Q3su3K3v9/A+laVA+oPNiTivhhyxGMAVo4e1ywxe8YcvHZ77dXPzVnvBdM+a9+PTqv
         cJj2l2eNOp4pYrbuyOOqbxsZs0YmnD6pUpvGVUlXK22lmltUaZzAeVtVYbMYu5o1of/G
         PyorPHcHUh9R1EKDF+92jTo6By48nQkhoL9ULqN+YBTtBt2cxHpch+iZNBempAI1Rx7v
         bklhW8zcz7Lr02BlUofl+BD/CVyNZRYPcFehUjaiqnfor4QDVIgRLN4XZKsomI5Tf3tR
         c8TQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrkd9QofF71nRIuboEOki6SYdhUA9u9oEJZzBA9ojII3gNrGsLBtc3faIrw8H9861TankPeFEU/E24XREo=@vger.kernel.org
X-Gm-Message-State: AFuF++lX042tqCZE6YTqrYXzcbi1mL5WdaOcZmjVKYHbsQ2TmK8RqkHp
	FmtmplDL7x4HE6TipEKejuRz+CffVrANga4zua1AmF93u71+ApZ3VrpxzeX/dabV5JjzQb299K2
	mW/8BXwxm5oC6qO+eDK0mQE2UqEgo/r9EIaK87WmL
X-Gm-Gg: AR+sD12cuCdDnKZjVu0TWFEpv6uN8wbuFbp5dDxyHtPSc2BeZt2ehCc8tMk6WwZ+UWj
	TGEhAwOADucHhTAUTKoUwirs2wVfOz/hE6LH91Q5RHzDFdGC/I1Il6+vLddKTOcu6Ggg2ZvvR7A
	4F5XGwoyqpnGo3bvB8+5T3Fdm1T7oopIlUFLVCMzivyZTgKMujYGAR5xHNI7Ib1McEKMncd7vvp
	xowgvLrvir725Y5AwLp+BsiDGEIO4QyKSRRJkPPAW8cxkWkaR8En62Vq1eyXT/4yFwBq1PZ6ZED
	T+aYIA++kfilt8qoqiZ5Lb3OZwjDExzl7WcaIP8wmJBfxK/vV9QOd4S9HUPhShSv+bYGt/orgdc
	=
X-Received: by 2002:a05:622a:4d08:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-53033af32b6mr1814531cf.8.1788287818532; Tue, 01 Sep 2026
 11:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831072104.120197-1-hao.ge@linux.dev> <20260831072104.120197-3-hao.ge@linux.dev>
 <37eb07db-332c-4da1-a671-6ef1cb753cb3@suse.com>
In-Reply-To: <37eb07db-332c-4da1-a671-6ef1cb753cb3@suse.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 1 Sep 2026 11:36:46 -0700
X-Gm-Features: AcwNN1WbKynZXiNJyf1x2DIabxhn9qVzOBQ2684ipzpY8wSQGNsJHC44kdS54cE
Message-ID: <CAJuCfpHdevUVms+WPHXET0M912hxRo_+QiV2zh2+O5ZCNTy+mA@mail.gmail.com>
Subject: Re: [RFC PATCH v6 2/2] module: allocate codetag sections before the
 regular module layout
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Hao Ge <hao.ge@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 8:04=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 8/31/26 9:21 AM, Hao Ge wrote:
> > Whether a codetag section goes to the codetag region is decided by
> > layout_sections() and asked again in move_module(). A concurrent
> > load can shut profiling down in between, and move_module() then
> > copies the section to offset 0 of its regular destination,
> > overwriting whatever is there.
> >
> > Decide and allocate in one pass, before the layout. Allocation
> > errors fail the load. On a tag area overflow profiling is already
> > disabled, so -EAGAIN makes the section fall back to regular module
> > data and the module still loads.
> >
> > The overflow and populate failure paths of reserve_module_tags() now
> > release their reservation instead of leaking the maple tree entry.
> > When profiling was toggled off, the overflow check did not run, a
> > module could load with more tags than the page flags can address,
> > and re-enabling profiling then silently corrupted /proc/allocinfo.
> > The check no longer depends on mem_alloc_profiling_enabled().
> >
> > Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compre=
ssion")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Based-on-a-patch-by: Petr Pavlu <petr.pavlu@suse.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> > Changes against Petr's prototype:
> > - allocate_codetag_sections() returns an error instead of void, and
> >   only -EAGAIN falls back to a regular section. Any other error now
> >   fails the load. The prototype fell back on everything, which can
> >   leave live tags in module memory.
> > - reserve_module_tags() releases its reservation when populate fails
> >   too, that path used to leak the maple tree entry.
> > - codetag_free_module_sections() on the move_module() error path uses
> >   info->mod, the local mod is assigned only after a successful move.
> > - The percpu section is marked only when index.pcpu !=3D 0, otherwise
> >   sechdrs[0] gets marked.
> > - Dropped the SHF_ALLOC check, .codetag.* sections always have it.
> > ---
> >  include/linux/module.h   |   2 +
> >  kernel/module/internal.h |   4 ++
> >  kernel/module/main.c     | 120 ++++++++++++++++++++-------------------
> >  mm/alloc_tag.c           |   9 ++-
> >  4 files changed, 75 insertions(+), 60 deletions(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 7566815fabbe..33548daa31a3 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -325,6 +325,8 @@ enum mod_mem_type {
> >       MOD_INIT_RODATA,
> >
> >       MOD_MEM_NUM_TYPES,
> > +
> > +     MOD_STANDALONE =3D -2,
> >       MOD_INVALID =3D -1,
> >  };
> >
>
> It might be better to split this patch into two: the first to introduce
> MOD_STANDALONE and use it only for the percpu section, and the second
> with all the codetag-related changes.
>
> The introduction of SH_ENTSIZE_STANDALONE should also allow us to clean
> up the current resetting of SHF_ALLOC for the percpu section, and now
> also for codetag sections. The problem is that find_sec(".data..percpu")
> can currently return different results depending on whether it is called
> before layout_and_allocate() or later. In addition, apply_relocations()
> needs a special case for SH_ENTSIZE_STANDALONE, where it could otherwise
> just test SHF_ALLOC.
>
> Instead of resetting SHF_ALLOC for percpu/codetag sections, both
> __layout_sections() and move_module() can check for
> SH_ENTSIZE_STANDALONE to determine whether a section is handled
> specially and should be skipped.
>
> I think it would be useful to include this change in the first patch
> introducing MOD_STANDALONE, but I'm also ok with the current version.
> I can send a separate patch later to make more use of
> SH_ENTSIZE_STANDALONE in this way.

I ran some tests on my side and nothing blew up.

Petr's suggestion to split the patch sounds good to me and
release_module_tags() change in alloc_tag.c could also be done in a
separate patch. It's the cleanup after we do shutdown_mem_profiling(),
so I think it would be correct on its own.
Thanks,
Suren.

>
> > @@ -2966,18 +2967,23 @@ static struct module *layout_and_allocate(struc=
t load_info *info, int flags)
> >        */
> >       module_mark_ro_after_init(info->hdr, info->sechdrs, info->secstri=
ngs);
> >
> > -     /*
> > -      * Determine total sizes, and put offsets in sh_entsize.  For now
> > -      * this is done generically; there doesn't appear to be any
> > -      * special cases for the architectures.
> > -      */
> > +     /* Allow codetag sections to be allocated separately first. */
> > +     err =3D allocate_codetag_sections(info);
> > +     if (err) {
> > +             codetag_free_module_sections(info->mod);
>
> The usual convention is that functions clean up after themselves on
> error. That means this codetag_free_module_sections() call should be
> done ideally by allocate_codetag_sections().
>
> --
> Thanks,
> Petr

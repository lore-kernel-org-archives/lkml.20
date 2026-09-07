Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31251D7E5C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770993; cv=none; b=Q6sceQiKInXYwusKk5N4re5DPna2RyJxDAsnZL+9/SeMg/MxlzWxRp7Lii9fqJg1Mju/dH0f0eijm3/eb3YE9M8c24QIRrwxGQ9IHJ9fP4JTg/CCUN+cY51LPkEWPK9tTlKejrAWNPsojAAUHOJ/K7oO757HygCtMhN9JPcAicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770993; c=relaxed/simple;
	bh=Jh21Wpd+rpLNO/BE/cldLKqSeLqvq5uIKuAiki/BHGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxord1qrjViBZypQdsVv4LjBoeM5a1Ynim4129swcatMcVoN3MekbGvVSbgcDyYU/7zPWDQKLhFBn0FxZTtu9Us1cb5BKgvwybIXJWzSjF66lEYmySIFbGFYm0VI7G0nR3V3t/vqb/sva1LwVkTYwJLwiw5IdZw+8cz+POxOhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSKohq6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSKohq6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8A11F00AC4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770991;
	bh=kKgJ49C47SmCceaSKnyRvbwxPYyWkP7guI7246QP9D0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cSKohq6KLTUqDc4/QivFhks0smK6aqb1q8vcXcCLg8XEfhBhGByoY5GDnt8rWakEw
	 HgJdReiol/vttE3r1w4pWsCtV+F56vGeaH8qEzlyu0WkNBmne2chdeutLiPEfHwsn9
	 9AcM2iG8tVFY8B1+6Qlpdu011ZxcX5X3Jl0mEsdd1ilHgF4uXjrL742fxRRuZRLYSh
	 mFxQt8rZRnhtKCl8GlosCSltqLCXirgkQRDlVyQCBR0+bPGyHdVHfqtoLbEzPkWMkE
	 pqfDJ9HaLB/aos5QCX2LCN/TcTPRujcSa7/bd+1ynBVFGS5CdKVCKAFPbAiXLUm38b
	 KzeDKpo5le4ug==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2055573c8cso395776066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVQWAvH5K/upSiJ+YoQb+6rIuO+tEuW2EPDkB8YMbqagdWeRXl9yiwIaibGG0E1KhQQUS1FJm5sHlP0CQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6p/KOs5CwlAqKShkybPKFQH05ZqQaktn+3bUQ2mU/VaEc5yJX
	otrhPh52O90Ehr8liMP0CRntc448bf2eiy/LewWXjA2o2Kt5yvtB3tgCOBeT8Y9vLtkPhEshyOl
	oc7k0GnNrCI1oi7f7m9l/rK3X2XxpJhg=
X-Received: by 2002:a17:907:970b:b0:c26:1649:47a9 with SMTP id
 a640c23a62f3a-c26164956c6mr640895966b.31.1788770990740; Mon, 07 Sep 2026
 01:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com> <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
 <apqppFukssaAQz3w@tiehlicka> <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
 <aprxXHSh-LyqaFCW@tiehlicka> <CAO9r8zO93CMjJHLO1ZqHY0Tr2kDfvpMHfH3MLkR37vV0YROf_g@mail.gmail.com>
 <ap5nJm1mH-4nfLaY@tiehlicka>
In-Reply-To: <ap5nJm1mH-4nfLaY@tiehlicka>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 7 Sep 2026 01:49:39 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOaAGHXK6FZ0PM9sJL2zH4fQe5kh+W2TBNL90YZV2detQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xa3QoSN2YWlMq10SWa69-3_5olJKFYqC41i2JxEfQV3MbKhUFRG6jO7dk
Message-ID: <CAO9r8zOaAGHXK6FZ0PM9sJL2zH4fQe5kh+W2TBNL90YZV2detQ@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net, david@redhat.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, quic_pkondeti@quicinc.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:26=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Fri 04-09-26 09:35:55, Yosry Ahmed wrote:
> > On Fri, Sep 4, 2026 at 9:27=E2=80=AFAM Michal Hocko <mhocko@suse.com> w=
rote:
> [...]
> > > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > > index 8d79f76cdd0e1..98e9079240ad5 100644
> > > > --- a/mm/page_alloc.c
> > > > +++ b/mm/page_alloc.c
> > > > @@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask=
,
> > > > unsigned int order,
> > > >         psi_memstall_enter(&pflags);
> > > >         *did_some_progress =3D __perform_reclaim(gfp_mask, order, a=
c);
> > > >         if (unlikely(!(*did_some_progress)))
> > > > -               goto out;
> > > > +               goto drain;
> > > >
> > > >  retry:
> > > >         page =3D get_page_from_freelist(gfp_mask, order, alloc_flag=
s, ac);
> > > >
> > > > +drain:
> > > >         /*
> > > >          * If an allocation failed after direct reclaim, it could b=
e because
> > > >          * pages are pinned on the per-cpu lists or in high alloc r=
eserves.
> > > > @@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> > > > unsigned int order,
> > > >                 drained =3D true;
> > > >                 goto retry;
> > > >         }
> > > > -out:
> > > >         psi_memstall_leave(&pflags);
> > >
> > > Ideally if we can make the function call less hairy. Maybe we want to
> > > make draining part of the reclaim as the last resort when normal recl=
aim
> > > fails.
> >
> > Do you mean do the draining in __perform_reclaim(), or deeper into the
> > reclaim stack?
> >
> > The thing is that __alloc_pages_direct_reclaim() currently drains when
> > __perform_reclaim() fails to make any progress and we still cannot
> > allocate. The change above makes it drain if it cannot allocate after
> > __perform_reclaim(), regardless of progress. So if you want to move it
> > into __perform_reclaim(), we'll have it in both places.
> >
> > Or maybe I just don't understand what you meant :)
>
> Sorry for not being clear enough. I meant to pull draining out of
> __alloc_pages_direct_reclaim and instead have it somewhere in the
> reclaim path. It is not entirely clear to me  where at the moment but we
> do not need to have the same behavior as now. The idea behind the code
> is to not drain way too much. Maybe we want to drain when dropping the
> priority down to 0.

If we want to maintain the current behavior of only doing this for
direct reclaim (not kswapd, cgroup reclaim, or proactive reclaim),
then I was going to suggest adding it to do_try_to_free_pages().
However, we bail before priority reaches 0 if we are able to make
progress or compaction is ready.

Also, I think in do_try_to_free_pages() we don't have enough context
to decide if we need to drain the pcplists. Looking at the comment in
__alloc_pages_direct_reclaim(), we specifically drain the pcplists if
the allocation fails after reclaim makes progress to make sure all
reclaimed pages (e.g. in other CPUs' pcplists) are made available to
the allocation. So I think it fits better in the allocation path, so
that we only drain if we cannot allocate after direct reclaim.

I think the main issue is that we only drain today if we know direct
reclaim made progress, so it potentially freed some pages to pcplists.
However, it is possible that reclaim did not make progress but there
were already pages on the pcplists (e.g. freed concurrently or were
already there). I don't think the right place to do this is reclaim
path.

I personally think either Charan's original patch (draining in
should_reclaim_retry()), or the diff I proposed upthread (draining in
__alloc_pages_direct_reclaim()) are probably the best places. Please
let me know if you still disagree.

>
> --
> Michal Hocko
> SUSE Labs

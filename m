Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F763CB547
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024876; cv=none; b=KPeBK8wQr1Wuzfnyg1QVqsbW1fXQq9i9gKu74MAuO5EBqSh6hIlRJeNLEpMonzqSJCdfhLd5iWKFGCpDBhDVFYdtKyfgbnAvaKpPg30LU1fozJ0ElADIXumtEGi8TcsDWarg6VNUCbKTaz6Jy4Nx8J/dOwUnOMOGEMisqddzH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024876; c=relaxed/simple;
	bh=GGxdEGy0hoGDtYHL5P0OwSapH7BCgoEa+ws5PXqvqYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz+Do4T9kFOnN9CO4ukB6HkrO7bRMCfq9VTMiT3tt0s3p/rxaX4XdvWbYU207m8hrNKnIcpFULS7b+kGbXvU223uXiDgiDa80svns6dBrOS4V3I/kbVYO+0uNkO8wSmPRNjbRjy8Q3xFUkJV7HbQaOZo5Oxy9MUZPUexaKaPqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJxcTEHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJxcTEHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633BC1F0089C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789024874;
	bh=/dFIba0UKBKJ4gn1LNPP82s6h59rJBwzWCWOyhLQY4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QJxcTEHKFLozghTdiaMO+BwMGEDdIMoJyyY7FyJCPHK/r5++gbW0KN+cYt4OJGlim
	 5mwLFdwQLr9ttzut6GhAAMmICmQWwQL+Op1hb/bDakuJyMrgtvxRyyopjUnla691xC
	 cYod3ZkAhxML2oDkVPbBTV5azU/wYVoqia8rpd7xMbGVHkill2GNYWaV4VtukHHCps
	 bXU8w48cBTO3zTLZ6Py0ORGOhcib/d5dP9qGT/OL01xhI580ixM6eGnpzqo2HudbNG
	 TlXOLwxbOekgLOtB/kR+vcY2uPZajPdp+afsn9Hkmt1eb6FwFLWnXZG1tPa5DfktnE
	 XlKytfz8HlUSA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so217402466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:21:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzILJPVBWBqh+ILROLbkdXGhjvnddTvozVaERiz2cocBvBuWDrYY0QSONkSFS3KaZGwUqsrEzHntFRu5NM=@vger.kernel.org
X-Gm-Message-State: AFuF++lifRzHu+SIBrWBjBt0BVVdwFruf6NKc2giQSfnVYQ28QPUztoI
	SiybkT9h5w56rSj66J3o9wdZASS9dYOFvctut04InBRDQIw/+sR/kdwWFs1snkfTU/Kmdy1pDOv
	Zpdta071+tlSrltcmElUunI90cNDpzrY=
X-Received: by 2002:a17:907:398f:b0:c29:8d4:7c03 with SMTP id
 a640c23a62f3a-c2941ae802dmr260263266b.26.1789024873258; Thu, 10 Sep 2026
 00:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com> <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
 <apqppFukssaAQz3w@tiehlicka> <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
 <aprxXHSh-LyqaFCW@tiehlicka> <CAO9r8zO93CMjJHLO1ZqHY0Tr2kDfvpMHfH3MLkR37vV0YROf_g@mail.gmail.com>
 <ap5nJm1mH-4nfLaY@tiehlicka> <CAO9r8zOaAGHXK6FZ0PM9sJL2zH4fQe5kh+W2TBNL90YZV2detQ@mail.gmail.com>
 <aqEMagbMGPlkuP2P@tiehlicka>
In-Reply-To: <aqEMagbMGPlkuP2P@tiehlicka>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 10 Sep 2026 00:21:01 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOzmYcovBBu_nXWJ8KPJGSDt9m6c-hxrZh_RQQGjsH8-g@mail.gmail.com>
X-Gm-Features: AcwNN1X0EJVzF0_77D2TNUNM6pwnCOqj1KrbslWUtbIqpVum1N7ZVyfgG1B1rEg
Message-ID: <CAO9r8zOzmYcovBBu_nXWJ8KPJGSDt9m6c-hxrZh_RQQGjsH8-g@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net, david@redhat.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, quic_pkondeti@quicinc.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:36=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 07-09-26 01:49:39, Yosry Ahmed wrote:
> > On Mon, Sep 7, 2026 at 12:26=E2=80=AFAM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Fri 04-09-26 09:35:55, Yosry Ahmed wrote:
> > > > On Fri, Sep 4, 2026 at 9:27=E2=80=AFAM Michal Hocko <mhocko@suse.co=
m> wrote:
> > > [...]
> > > > > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > > > > index 8d79f76cdd0e1..98e9079240ad5 100644
> > > > > > --- a/mm/page_alloc.c
> > > > > > +++ b/mm/page_alloc.c
> > > > > > @@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_=
mask,
> > > > > > unsigned int order,
> > > > > >         psi_memstall_enter(&pflags);
> > > > > >         *did_some_progress =3D __perform_reclaim(gfp_mask, orde=
r, ac);
> > > > > >         if (unlikely(!(*did_some_progress)))
> > > > > > -               goto out;
> > > > > > +               goto drain;
> > > > > >
> > > > > >  retry:
> > > > > >         page =3D get_page_from_freelist(gfp_mask, order, alloc_=
flags, ac);
> > > > > >
> > > > > > +drain:
> > > > > >         /*
> > > > > >          * If an allocation failed after direct reclaim, it cou=
ld be because
> > > > > >          * pages are pinned on the per-cpu lists or in high all=
oc reserves.
> > > > > > @@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_ma=
sk,
> > > > > > unsigned int order,
> > > > > >                 drained =3D true;
> > > > > >                 goto retry;
> > > > > >         }
> > > > > > -out:
> > > > > >         psi_memstall_leave(&pflags);
> > > > >
> > > > > Ideally if we can make the function call less hairy. Maybe we wan=
t to
> > > > > make draining part of the reclaim as the last resort when normal =
reclaim
> > > > > fails.
> > > >
> > > > Do you mean do the draining in __perform_reclaim(), or deeper into =
the
> > > > reclaim stack?
> > > >
> > > > The thing is that __alloc_pages_direct_reclaim() currently drains w=
hen
> > > > __perform_reclaim() fails to make any progress and we still cannot
> > > > allocate. The change above makes it drain if it cannot allocate aft=
er
> > > > __perform_reclaim(), regardless of progress. So if you want to move=
 it
> > > > into __perform_reclaim(), we'll have it in both places.
> > > >
> > > > Or maybe I just don't understand what you meant :)
> > >
> > > Sorry for not being clear enough. I meant to pull draining out of
> > > __alloc_pages_direct_reclaim and instead have it somewhere in the
> > > reclaim path. It is not entirely clear to me  where at the moment but=
 we
> > > do not need to have the same behavior as now. The idea behind the cod=
e
> > > is to not drain way too much. Maybe we want to drain when dropping th=
e
> > > priority down to 0.
> >
> > If we want to maintain the current behavior of only doing this for
> > direct reclaim (not kswapd, cgroup reclaim, or proactive reclaim),
> > then I was going to suggest adding it to do_try_to_free_pages().
> > However, we bail before priority reaches 0 if we are able to make
> > progress or compaction is ready.
> >
> > Also, I think in do_try_to_free_pages() we don't have enough context
> > to decide if we need to drain the pcplists. Looking at the comment in
> > __alloc_pages_direct_reclaim(), we specifically drain the pcplists if
> > the allocation fails after reclaim makes progress to make sure all
> > reclaimed pages (e.g. in other CPUs' pcplists) are made available to
> > the allocation. So I think it fits better in the allocation path, so
> > that we only drain if we cannot allocate after direct reclaim.
> >
> > I think the main issue is that we only drain today if we know direct
> > reclaim made progress, so it potentially freed some pages to pcplists.
> > However, it is possible that reclaim did not make progress but there
> > were already pages on the pcplists (e.g. freed concurrently or were
> > already there). I don't think the right place to do this is reclaim
> > path.
> >
> > I personally think either Charan's original patch (draining in
> > should_reclaim_retry()), or the diff I proposed upthread (draining in
> > __alloc_pages_direct_reclaim()) are probably the best places. Please
> > let me know if you still disagree.
>
> In that case should_reclaim_retry seems a better fitting fix.
> Thanks!

Thanks. I will rebase and resend Charan's patch.

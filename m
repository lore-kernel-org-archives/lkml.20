Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA429D27D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939375; cv=none; b=kZLyq5Nya5CjKaQIcdpFzXPWNDwo1Nhw5TL6hx7ehsfJGpVGVunp4VV0/WRQGjpI6rdpIAtPooYvqeQHg6lF4UDy3T2vbj4fpHVHheTbMfwwGvl8Ufpi8iIRw+1++cabl2O5Z0FLtwKuhrZ8PjYK17W+v8bY05WZa6KH/VdhEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939375; c=relaxed/simple;
	bh=IRKWIkhJwafZxW1vv88MkUTkA4ugbZD+XzwQyVo4/xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHSrzfxXDiWCoDa9p4numxxhZSjkeLIUwknOHDChNJCLe5uLa2bPJiGMNJPJ7wQHUvd00jf7WKh8/cUa+SRcHUk6sd9cC2atlemuCSwGdiXNMFkcmUPsb/FMHL8QUdb5cz20lbiEVup2C+Uqpp7howed4FKJqZxJy4jroYEarZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DFRISFlF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DFRISFlF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so30919205e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788939372; x=1789544172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3OoG3DjDJcclfZFhjtGj32TTpN8ta/8kYvfy2cZ0Ak=;
        b=DFRISFlFLDzd3Aco6dFxkmsc496/okSOq2NeMt74IdYp5S9fRnaxrxrxIsz0Y/YgMu
         OMNC+0b4mTWubSyikeqrRXuBflvIsCZVB971S779RoNtgzpyyEHLO5actM0DgD3as+bE
         p6+vfBhA+3pMcn0KaFCQIwwlmyXgKRV/10207/sXoEu3R/0yjw7essDXIsdtrKRi8vf0
         4h0uA4Hs++4B5zrbDw1tOeGm/Y17OZHtrtfgEFWtsT9MDwarem8k8BFhkIL64RsLDmei
         mbKPgYqQuQCL4m0rRdwi+GtuIlYGAU4F0VBK09Fah5bl7JXyZm3Lp4mto10+y+uZN7+L
         X/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939372; x=1789544172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V3OoG3DjDJcclfZFhjtGj32TTpN8ta/8kYvfy2cZ0Ak=;
        b=gBbQ44+JfAAp+9pe/kb7xU74nFYbShtVd0DxZMyOlCWqVO3RTrquxfyMdxii/7lgP2
         RjiNMscqw00iSyXArRGwyQwjtF8pT58/nNRUnU3zsmyD3qfkRe5QdtdULiYbZBM3qyuP
         szIdJPtYU8hADwZTG9IlBVDDuoaM/xqouZamQH7JRynD/kmE7SBcSkB9OqEDmd+pfjGI
         H+JU6CMB7/YyRP0waQ782xnUWI3NVgwR6g2SJ7ikFTEZ7dg4juuCueXngTRIPHG0J+Xq
         qhdo6eM561jtdDYG7oaKexi7vuw1+j1D++fdd9aJRHoYytTzat8vHyejAGr8b1bNyVwc
         MPWA==
X-Forwarded-Encrypted: i=1; AKwUvBzV2X6gR8FF28PKZb2RaJoeaPe5Sq1+J9A8xr/HsSBRwTEfPw7UZxSAdxVJJSblJkA0j+oNHMtqvB6Tirw=@vger.kernel.org
X-Gm-Message-State: AFuF++ng30jZ0c4xGEdR/xf58xq4WRUjF7j2h9k7OKVTKAVNqBBsYFwb
	NviMaSGnctl5TG+1mFOcwoKeXbTwlXzob8pCTdAYnWWyVMrA1PBY9c2SmvnLNMr7f6Tc0UFDIK/
	VqFsbUZ4=
X-Gm-Gg: AYBFou0G1KZFiNHCnl/Stezz6Iat4lSJ4Ya0ryu6cmiMmDMG4DbCYKDOeGa23CC/0Ho
	3Dm8kVeAHTQTQOj2KT7COQQFr7hSEaDdC9PvldB19ADhJBBiI6jhcxV34CiW6HkLqW2QHvPua4T
	OEB/7ttZjKo+e5XNyInSvowBIsCafKu87k+Q8XiE2VLZOQwoed6a4aPP11EvQexe6C4JrKmEgeI
	ZnaFzEW+E5Jv4Qv8YDGh09neZG7zWy2svcnzG1VKjEElite58ZedjcAb95JWFmg/J5uBDXVATrZ
	3U7GU9FYJdWxv2AL1nfVkRUUv2TdpwTPl4LUqJfB9irCDMnE7vigOdVn0LFLNIGxCRKkOHCMZ8q
	l8/CblIvDrLzqHEnbznxwoLPCeeWQguKPcn61ILsFiTBJY4ndtyGOzbwcZLZJljIelebnMOt8y7
	utyXQypRO3T+icXfMLcsVNEPeBy5wde7ZhpySByqaheQmRQek9P+PIYKzIg0J5BAcYgrcajM4Fh
	o4bXpA=
X-Received: by 2002:a05:600c:600b:b0:49b:90bc:d4f3 with SMTP id 5b1f17b1804b1-49cee5d6287mr321995535e9.4.1788939371754;
        Wed, 09 Sep 2026 00:36:11 -0700 (PDT)
Received: from localhost (109-81-20-2.rct.o2.cz. [109.81.20.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm39983209f8f.8.2026.09.09.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:36:11 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:36:10 +0200
From: Michal Hocko <mhocko@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net,
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org,
	quic_pkondeti@quicinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <aqEMagbMGPlkuP2P@tiehlicka>
References: <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
 <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
 <apqppFukssaAQz3w@tiehlicka>
 <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
 <aprxXHSh-LyqaFCW@tiehlicka>
 <CAO9r8zO93CMjJHLO1ZqHY0Tr2kDfvpMHfH3MLkR37vV0YROf_g@mail.gmail.com>
 <ap5nJm1mH-4nfLaY@tiehlicka>
 <CAO9r8zOaAGHXK6FZ0PM9sJL2zH4fQe5kh+W2TBNL90YZV2detQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zOaAGHXK6FZ0PM9sJL2zH4fQe5kh+W2TBNL90YZV2detQ@mail.gmail.com>

On Mon 07-09-26 01:49:39, Yosry Ahmed wrote:
> On Mon, Sep 7, 2026 at 12:26 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Fri 04-09-26 09:35:55, Yosry Ahmed wrote:
> > > On Fri, Sep 4, 2026 at 9:27 AM Michal Hocko <mhocko@suse.com> wrote:
> > [...]
> > > > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > > > index 8d79f76cdd0e1..98e9079240ad5 100644
> > > > > --- a/mm/page_alloc.c
> > > > > +++ b/mm/page_alloc.c
> > > > > @@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> > > > > unsigned int order,
> > > > >         psi_memstall_enter(&pflags);
> > > > >         *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> > > > >         if (unlikely(!(*did_some_progress)))
> > > > > -               goto out;
> > > > > +               goto drain;
> > > > >
> > > > >  retry:
> > > > >         page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
> > > > >
> > > > > +drain:
> > > > >         /*
> > > > >          * If an allocation failed after direct reclaim, it could be because
> > > > >          * pages are pinned on the per-cpu lists or in high alloc reserves.
> > > > > @@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> > > > > unsigned int order,
> > > > >                 drained = true;
> > > > >                 goto retry;
> > > > >         }
> > > > > -out:
> > > > >         psi_memstall_leave(&pflags);
> > > >
> > > > Ideally if we can make the function call less hairy. Maybe we want to
> > > > make draining part of the reclaim as the last resort when normal reclaim
> > > > fails.
> > >
> > > Do you mean do the draining in __perform_reclaim(), or deeper into the
> > > reclaim stack?
> > >
> > > The thing is that __alloc_pages_direct_reclaim() currently drains when
> > > __perform_reclaim() fails to make any progress and we still cannot
> > > allocate. The change above makes it drain if it cannot allocate after
> > > __perform_reclaim(), regardless of progress. So if you want to move it
> > > into __perform_reclaim(), we'll have it in both places.
> > >
> > > Or maybe I just don't understand what you meant :)
> >
> > Sorry for not being clear enough. I meant to pull draining out of
> > __alloc_pages_direct_reclaim and instead have it somewhere in the
> > reclaim path. It is not entirely clear to me  where at the moment but we
> > do not need to have the same behavior as now. The idea behind the code
> > is to not drain way too much. Maybe we want to drain when dropping the
> > priority down to 0.
> 
> If we want to maintain the current behavior of only doing this for
> direct reclaim (not kswapd, cgroup reclaim, or proactive reclaim),
> then I was going to suggest adding it to do_try_to_free_pages().
> However, we bail before priority reaches 0 if we are able to make
> progress or compaction is ready.
> 
> Also, I think in do_try_to_free_pages() we don't have enough context
> to decide if we need to drain the pcplists. Looking at the comment in
> __alloc_pages_direct_reclaim(), we specifically drain the pcplists if
> the allocation fails after reclaim makes progress to make sure all
> reclaimed pages (e.g. in other CPUs' pcplists) are made available to
> the allocation. So I think it fits better in the allocation path, so
> that we only drain if we cannot allocate after direct reclaim.
> 
> I think the main issue is that we only drain today if we know direct
> reclaim made progress, so it potentially freed some pages to pcplists.
> However, it is possible that reclaim did not make progress but there
> were already pages on the pcplists (e.g. freed concurrently or were
> already there). I don't think the right place to do this is reclaim
> path.
> 
> I personally think either Charan's original patch (draining in
> should_reclaim_retry()), or the diff I proposed upthread (draining in
> __alloc_pages_direct_reclaim()) are probably the best places. Please
> let me know if you still disagree.

In that case should_reclaim_retry seems a better fitting fix. 
Thanks!
-- 
Michal Hocko
SUSE Labs

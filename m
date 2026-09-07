Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91B4028E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765995; cv=none; b=okFZNCQROsQaJhUFKCz3CXa01sN7pt0Q9FeXQJkUB6dv4BgP/ArRfWm8lClS7k4065ZmT752UwDrSEEHPBbejvpuqayvP1EGF6ZDKEd7heIkK5C2V4zsshQ6Fgq86paPT4GazFPNXwTPAWy9hJrfJR+G30fHwPO5WeJJGe7YzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765995; c=relaxed/simple;
	bh=ulwrcUG6Dx6/9YQYXSl3LGqe6Ct3xQ3MxLiv9kXIEqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKyA1CY0pFt9Ebzh5P/oavThvMqphDvLcQ3czMzrRHJZzKyPxC/bYRwwSfxRvH6rRQyMdG5loXKRxa+Z8muwUyz6UyW+xsL0RYrjUXCdeId+Hzubv9cQMUvNntnpgbWHTg35y9RyJq2Hf1U3lK+kp3KEr9XXd3y4p/wlqaEc2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eI0I6k1K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eI0I6k1K"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso29994655e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788765992; x=1789370792; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGo4YFKM9biZdQ6+wYj7CRnf1DHFyHvKdOV4NarY9xc=;
        b=eI0I6k1KmA47TfJEOh7770OFLdr8Yss8bRxG8tmBWOUBcsJ47gPYDs/qL+XhZMJkgN
         lcey3eooq5mW87CCJOGJiy1sAZhCZ4zG/tFaTrqmxXJDNhOgHm2tp6GN2UHLwPxypjM2
         OEBbA+LfTC8CwmQ2l5PNlRAcosIiXPgJAgKxRuytT7EeDgQGgX37vrWKNFpfCfrgEVwF
         gk/ocSzr7a2BJOLq/CoUmT1gEswdDDbnEGmkDy6CeFdbf3DQJvBcqBVZnpsAxjc2GHfL
         4zD65rDMq6+421KnBKdOe/YUWLaSNJlfsoDMcCb+Onx6PBXrPjqW/L8EhzuIPlEk5jMS
         UUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765992; x=1789370792;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nGo4YFKM9biZdQ6+wYj7CRnf1DHFyHvKdOV4NarY9xc=;
        b=Z6IaEFOfjUQTKWdttP9oLtbaljSqF0dQUY0y6ij/m0VnnXJcNks31OS0b28pDRtKPp
         cdrWdJXIjSl9ldsMa1UtQFcciv/zqoyhmzNQVxJdEjmQjonB44JNK1tyTMUKxads1Hxb
         fctvlivNYlH5KG2rXzG4RaqUDsxc6EZCl7kzT/4t27iO59sbzITtu8dA8T8/0i2Cih5r
         GJWugdpcohSwhAQcnsmeMos2e/thKv6zQbkQ8qwk40G0BxWfYpnbKf2GGpXNXiF5OUSo
         NyRhEffCHVMOrJ/YPbsTQfJy1jtsTipz0EzU5XN6K1dC96jkh/aTPx/pvWR6ibmOe58M
         ECEA==
X-Forwarded-Encrypted: i=1; AKwUvBxLLYFxoR7VJZxC00nTmQ8NKynKvqXfiT6B6eBYzaqEcixlwKsH4uFWkHCMdAqIlEA8Q/jYb7scp2WKDGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mkBsWRDWcTbsO3ZGVtJ2Z80wEaETNmZyzCE5ykh26Skf2p1x2e
	Wb1kgdLUOD/7/6f+cEcMRDVyduhKcie38sjO6wr8EwVZDXmHc8wi03joNj2ylCiJa8E=
X-Gm-Gg: AYBFou0n1ufwpasAkVIOKbwsF/nr0FsbcGRAlyqxjFgwaLzO02bbvFRzPkzlBv/QqQ6
	9Txht8n+NE6MPYXBscLxpWgC4SQWRZjAvT9hBSD34OCuKZE2GH6pKmm2vIgbqEb/fOgYBgGdWa5
	LvaLbfJivQmbMsF713yCb4Mz6P2B1SK+7Q/lTp8G04HDEwyu+1BhUAS7uajQsYA8Z4alU/9sNT0
	aqxsLMZq8MgdmkNxVjY+gqdck6rE7HlmFx3Zgpr8PG7RQ/8fgqO+3jdph1vtYlekPS4PVIfBrXb
	HNQ5ipidSEDScCokJOu6tX8Yran/HnMqj+YAlL7VwfVng2I2L0z63saVb0NQ6lYkatqHyf73mH+
	cej2gmCZQ/UfWQhGKSbaoxB/74C9tSWQl2C09itBZXXbLQ3hX2xXO45LlDSPfvFk7mV3I3AdtKQ
	QPWE7Mm3j8TwHqsFhHJWrpbzEenS4xX9udCokIku4G2luX9UQ2WUzpTasQV6+LaGHH/CCj8IvKj
	Q==
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr199881165e9.16.1788765992092;
        Mon, 07 Sep 2026 00:26:32 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm186708135e9.9.2026.09.07.00.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:26:31 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:26:30 +0200
From: Michal Hocko <mhocko@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>,
	akpm@linux-foundation.org, mgorman@techsingularity.net,
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org,
	quic_pkondeti@quicinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <ap5nJm1mH-4nfLaY@tiehlicka>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
 <apkhSHr3by5Bf8jW@tiehlicka>
 <CAO9r8zPCYNmJbkQEA62z75AB=ziWqGb38_E-ee_6o40Sz=zHXA@mail.gmail.com>
 <apqppFukssaAQz3w@tiehlicka>
 <CAO9r8zMBBhhqepbLR9buOOu7bpyLW+UTu55DjbCYrbBp56rkCw@mail.gmail.com>
 <aprxXHSh-LyqaFCW@tiehlicka>
 <CAO9r8zO93CMjJHLO1ZqHY0Tr2kDfvpMHfH3MLkR37vV0YROf_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zO93CMjJHLO1ZqHY0Tr2kDfvpMHfH3MLkR37vV0YROf_g@mail.gmail.com>

On Fri 04-09-26 09:35:55, Yosry Ahmed wrote:
> On Fri, Sep 4, 2026 at 9:27 AM Michal Hocko <mhocko@suse.com> wrote:
[...]
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 8d79f76cdd0e1..98e9079240ad5 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -4592,11 +4592,12 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> > > unsigned int order,
> > >         psi_memstall_enter(&pflags);
> > >         *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> > >         if (unlikely(!(*did_some_progress)))
> > > -               goto out;
> > > +               goto drain;
> > >
> > >  retry:
> > >         page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
> > >
> > > +drain:
> > >         /*
> > >          * If an allocation failed after direct reclaim, it could be because
> > >          * pages are pinned on the per-cpu lists or in high alloc reserves.
> > > @@ -4608,7 +4609,6 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask,
> > > unsigned int order,
> > >                 drained = true;
> > >                 goto retry;
> > >         }
> > > -out:
> > >         psi_memstall_leave(&pflags);
> >
> > Ideally if we can make the function call less hairy. Maybe we want to
> > make draining part of the reclaim as the last resort when normal reclaim
> > fails.
> 
> Do you mean do the draining in __perform_reclaim(), or deeper into the
> reclaim stack?
> 
> The thing is that __alloc_pages_direct_reclaim() currently drains when
> __perform_reclaim() fails to make any progress and we still cannot
> allocate. The change above makes it drain if it cannot allocate after
> __perform_reclaim(), regardless of progress. So if you want to move it
> into __perform_reclaim(), we'll have it in both places.
> 
> Or maybe I just don't understand what you meant :)

Sorry for not being clear enough. I meant to pull draining out of
__alloc_pages_direct_reclaim and instead have it somewhere in the
reclaim path. It is not entirely clear to me  where at the moment but we
do not need to have the same behavior as now. The idea behind the code
is to not drain way too much. Maybe we want to drain when dropping the
priority down to 0.

-- 
Michal Hocko
SUSE Labs

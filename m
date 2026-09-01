Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C083B14B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272761; cv=none; b=MqZI0aNm2uB9TqcKBJN1zl4RCv5t/dmfuFF6YGss7ochxXfUqRaWsuACzdmJ4Nba7XmiplHbmtc6eK+avtFPfuZCHpgjTYcYphVhJtdzL2vhModznP7EYY+xcxFCjuby4mhUP0XDXtcMv6ROsyLXxiDpWcMNSLMITwVSQQw174c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272761; c=relaxed/simple;
	bh=MmFoOapeEcD+F5LezzyHUgFm6Fe9hraEDdFCntGtNkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW8DCUVC2m4O4dFoxkiQw6e3ltGNE/DrwuZAu4yCJESCh6wVMJiBlJgKoKma0U/dUG13hYUG5xvjn6hRiIx9xlAEt1QAgtgZGy1K9FDEvG1/NpQ2+IU5T2AT528kLzTu727r4vr1AY7teV/C4hP7XomXu8k/ohw6n72997r9ksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=r0aNNtRh; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="r0aNNtRh"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8588583a7c3so12110107b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788272757; x=1788877557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObgpNp4xsh/An8XTcvl4h2cgfsJnES05kTjlUzeTPjo=;
        b=r0aNNtRhATXto7Y6PsAXlPZcePGUKaaB1oQP0a4waq7LEj3BOm1adNFqbAP+lZUZwz
         +t9H5E8MzweIfwjrHPdM+Zf+w3pRTpEUW1IugcsqdkDi5GoQK5GSWvkjTIDYFFuc2PAI
         NhPviayUfQB0Cwx6NEs/q+QHNvlorGBvOZgjOZs8R3dqKJIk5029WzsyMTJklga7xWu2
         L2JqRvgH/iz50Worq41OIIBx21RGB8xXh+TmuH53V5Dvb6mTYwmiOzbrz37T/fePMdOq
         YIUT6HBcxxEBei7XgIPUOFqsZxj9r8bwjcl5he+cTVSUU5jBBMKPBtGl/2HJwx8z5mz0
         2j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272757; x=1788877557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ObgpNp4xsh/An8XTcvl4h2cgfsJnES05kTjlUzeTPjo=;
        b=TvADQ+SNaIA4p5wYivgy2agM8BOLa2HOz+rIet8O0bl/YE+Z4/0aj+lX7w2NStwlFn
         SRBBgBB21uZU0Xz9ODDshHPFELu4loOe6WTWEUkegqd9gxeT2IG5Pdq54TmHOF2gI5lZ
         KP8XUbgbX2ZFuwQIcZtUKr4UMyTJCCKfs+OCp+WkV95bOxisbR9cGUf4eJ4A9js3AoMT
         6Gl+h45FXyVHC6iTHYmxB1Ax/9zaJgLJf96pQYZoe4PuSJ4h/uWY9hJIGR1mITp0PtZw
         dRluJMFKYcdG8I3J5YkuBfDNhQb3+VeVL6MszHFa19D2yvG50Rj+pe8dx3AfamEPAB2C
         +prw==
X-Forwarded-Encrypted: i=1; AKwUvBxK4w6bUIg8S9dyxauA4uDRMl0DFqxBV3rqv1/0jTIMtj7i54K3iw88uOKFPVJehqLzNCHrbRwbjPf+M7I=@vger.kernel.org
X-Gm-Message-State: AFuF++k6jSXKsL/3hnn+iu8VSfdVmOrDa1F/raf6gd43cHW02ZSduyb7
	6bqdUMpTVaXDztdkgZgM6unWu1bZZtanxAOyxeBoxjEY5HVt3FETnJEMlDkFoofkxe9mIqI17jw
	AXzCG
X-Gm-Gg: AYBFou0pfCwEXXB2qaGBe669yH34qdJcgENvM0R1/xGa6/AvvB13CFitE/oR+SBjv7k
	JHd3uSL3B17bJWeZAhIwH59qwnk0B8UPEdbOoY3uT2ZDyjIe720U+sosPC2q9typ68s8dfe7L57
	s4NwGXEQXTDUD2eKCx94ZAfVdYrAkLp6FgS3TNLrLV95r+WYhWLnQDq8rezOQrFkStCafTF15mK
	b/HsPOUEi+4wnjwh1NjleAk2NXI7tbgHxoloHlZTdDnijMbWyrWP8HaMXjp4niUb63IEuggW6uS
	8WsIncYZfFRWsHlvaOFAwWt99r4qAzWP6BGRTaASu8IDlUHKIx1yjlMmCCom/bIh65xJp8JDSz5
	0aYNvT3PPPF7GateEVHAGPOuZULKzZ6a2A8mSfxG0Bys6eop7D5o4gksW3kolBF8VqXh8LZywiK
	ZRQHDHQybsDRjCO8N4zsAQSZkaS2g0j5wBkabHzWg1qdcMLbWBfmHy3U38tn6amT2X4gs4NcQ=
X-Received: by 2002:a05:690c:c619:b0:854:d9d0:467b with SMTP id 00721157ae682-85d6cfc160fmr112291277b3.22.1788272757290;
        Tue, 01 Sep 2026 07:25:57 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146dcsm75394907b3.23.2026.09.01.07.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:25:56 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:25:52 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Stevens <stevensd@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <20260901142552.GG3004@cmpxchg.org>
References: <20260831234339.280376-1-stevensd@google.com>
 <apYXCL_GJs9Ovu0v@linux.dev>
 <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com>

On Mon, Aug 31, 2026 at 06:04:57PM -0700, David Stevens wrote:
> On Mon, Aug 31, 2026 at 5:10 PM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> >
> > On Mon, Aug 31, 2026 at 04:43:39PM -0700, David Stevens wrote:
> > > Memcg charging can be done from any context, but calling schedule_work()
> > > isn't safe from an NMI. If memory.high is breached from a context where
> > > spinning isn't allowed, use irq_work to schedule the reclaim work.
> > >
> > > Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> > > Signed-off-by: David Stevens <stevensd@google.com>
> >
> > Did you hit this issue or just code inspection? I assume this is the
> > done_restock code path.
> 
> I just found this via code inspection. I spent a little bit trying to
> trigger it for real, but the only way I managed was by writing a hacky
> driver absuing alloc_pages_nolock().
> 
> > > ---
> > >  include/linux/memcontrol.h |  1 +
> > >  mm/memcontrol.c            | 12 +++++++++++-
> > >  2 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > > index 8170bb8066a2..036d973ceca6 100644
> > > --- a/include/linux/memcontrol.h
> > > +++ b/include/linux/memcontrol.h
> > > @@ -219,6 +219,7 @@ struct mem_cgroup {
> > >       spinlock_t       peaks_lock;
> > >
> > >       /* Range enforcement for interrupt charges */
> > > +     struct irq_work high_irq_work;
> >
> > Instead of adding more complexity, let's just return if we can not spin on
> > done_restock path.
> >
> 
> There would be no guarantee that memcg reclaim would ever be
> triggered, which also would also stop MEMCG_HIGH events from being
> generated. Overall that seems a more serious than just dropping
> userspace notifications like is done for MEMCG_MAX.

I'm leaning that way too. It's an indefinite error, and it's a freely
programmable surface.

IMO, a few lines of relatively straight-forward, self-explanatory code
is better than code that needs a comment and leaves a problem that
somebody in the future might run into.

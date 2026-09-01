Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F633ADAF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250698; cv=none; b=QWd7ueQ4xhaXFWCTCjU/+TTepyscbYU5pUvtRcQXrHF4TGsOyu5Q877Rt4L8L16uj3Mc6LOhPhf0BA7o0hKYHl+GW67U3142JDi8FEuKHKnOt6rqPyEGJt54N8z5mmCAoBWiYWnsNn1ojBJWy1TqAp5rYWARxSWFi9RZnT/gxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250698; c=relaxed/simple;
	bh=wEjPROeoqJjbpa8XphJ+4TWgnWq71S6YvEfWhUnfu9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCDAbnsHxm8OHm6vCglT21A1DmPDEwcs/VQLyW5hjNIzu4l/uwG3E1AhM+Y0nE+0TK4EkpAPp0WV/UaFzyhO3UR3Luo37LrpYvFht8zGyyegGFYXZ76QrCY0ZZ3TqggIwkD7SC0aMsJ1ODC3wG9EgT3mlkieP7idlD9kaH6o/DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KPRhuM81; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KPRhuM81"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso25996465e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788250695; x=1788855495; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDg7iEVSu1Ou77o1BepraIOCR0zi9VqjbIQOkb7jb2Q=;
        b=KPRhuM817rcmMDYfDrdOmXcCKc2w8z+9oVzLV0WvS2pysL43YLfkemWJaOIxbogszX
         z9LfjAt9S5FFYlEfriYGdOmnwq7A+qYAaoXLxZS3SsX4TTHSy3bYiRWhf2sRU5aqOGzG
         8nAXWjDjeCnMoQzbg4AVog6P8LIN95w4z0mtn42bQSGBDQZ4H0oIthjZfUxheGE8ts3f
         W2TkvITy1Ddlysj+qi/Dm8TgsoJCpESNgBTtqHVU/ORzS005TnU+A9y2i8Nj88blg9k9
         mwlF6nIKp4Uv4QLC1DTsqp9ijIK8/6PAhdt9X/Cx/rSEm+mNVM7rX5QhyMGpf67gPoJA
         Zfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250695; x=1788855495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDg7iEVSu1Ou77o1BepraIOCR0zi9VqjbIQOkb7jb2Q=;
        b=HRIUO/1Ox7lbfant2gtFVmAX8D4EC7kcrR99EH1SlL86xzea0cSS8Sa/7OFX6ljOLa
         Ik1dHHw0gDHaztcNDmRvCb9YAdGjHypc6gvYmEudiMqDKeLeHArhsPxBPOAICSnAFDxr
         Ji3Zp148Kj828/GzZT1VzxfdZ4yj9t1HyrRamHrrZ8g+VV0khoxkKDnEE8Igdoxap0Nf
         zCpM5EIR7UnRldF+AjsxF9r4p8J7adTJInGFhFsedVPvniSdXcKTqL1DUQd7yexpBSQN
         kiQUEVbU8v6Aj2AF6k/1tKvSgZVdRxFqBbmVjbcN5zUtbZ21fAA/3lPQEIOKXmMCtSHm
         fZhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqruYUfb6rLSIIp1EfrJ8kjD85ieo0TFg4KE3i2ywBDYNN/c8YAkHBcNgDbzxS3tlJ9frlB6UZvHP4TpZg=@vger.kernel.org
X-Gm-Message-State: AFuF++ld8rQJDgRh2dPr/qiP4uhiDzxjssLajtjg8f0obGxKsutxRdaZ
	15Zo+YR00ARqT4DrHwSr1c1lcXz7gQrO5XWU/9P4s8Wfq6jc0DiMXaLdGdHA8ty7Nhk=
X-Gm-Gg: AR+sD12HicM5QhVL58mlr9diJmMPHL9NMiAruJ8WIj03u8O/TPEvdvAf3VzRXpyUxQP
	1eiOnSZZqililW3bort17x0psZKqngaswGemuZv7DF30DzUvPHA5OwlEwq6euOSUPuY87RTQGDZ
	+mIZTMUKbAqE8Y7/bBT3V00hxZMq1NxhUl3IVygwlO2QF2rJEQLzZ428PpmUGQOqEeLBKLC/2bC
	p7yHbcmulVKFa3BQs/qqpi8ncAysQ1gavS+lN2bfT3e+HZNgymDMKC64frvLV5Sg6iW7yE8tx2g
	DpYun2P7kj5IduUtwdVtnbpUxlJl1HIA3+VTHnHfN/CrX6kJLU5AT+tH1oBlmsz5B5cYNaiTRZK
	wQk3oeBTOTewqfRWwdUF3rimYtLoy//9rktS+R0UcwNEsvL/5Ema0/G2d2mEtE2LGZ01jf3znah
	U6ZulCp8R9BmC5mmyFuvBFkU20Hlg5ljPn5gPgRQzV8KihTrnUleyv0lsKSD3qhZ/pcl2e7lQ=
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr296600475e9.16.1788250695555;
        Tue, 01 Sep 2026 01:18:15 -0700 (PDT)
Received: from localhost (109-81-87-32.rct.o2.cz. [109.81.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42593sm3530650f8f.2.2026.09.01.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:18:15 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:18:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Stevens <stevensd@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <apaKRS7TYhlGRRW3@tiehlicka>
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

On Mon 31-08-26 18:04:57, David Stevens wrote:
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

Then this is not really a fix but rather a new feature.

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
> 
> That said, it is very much an edge case. I can send a patch with the
> simpler fix if dropping the events is preferred.

Yes, let's go simpler before making this more complex without any actual
user.

-- 
Michal Hocko
SUSE Labs

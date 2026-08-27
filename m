Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFCB43E09D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831137; cv=pass; b=DE6hDiwkFGl4nR5xwjiFIsIxcQ++72BNY3IQyqfZrY4BBRT/Pp8EYs2okLOxrkSJgmKgihipayJtY9tke+vfN1/Pd8IEzQidiw3t5J9s9AiVszSECAgmtdIoa6bFYuBR/LpHutG7hZyztbtayKWxVHFTXKNE29S6IsB9YqrnI+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831137; c=relaxed/simple;
	bh=VA/u3r0a5SY8d1ZmAj2N6Z5ASI3VjJtN2zQVZAZqdrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eexWTXvc1oWhcuGhD6t2O/FewEj0qydcgchrQ8MRGnSGDYQy1XuIDugzXMwsDbevJOZ+M1bX+KvZOtRlWT4zyFeyYsrwhyGuKtiY/6cTrM45G3Ra6Jj3sFlcvibz5CeoUPSMiOmxHXlVIaKPWcVI5sWHA95kPf9zdukkganZkmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baVmNv/z; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baVmNv/z"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74a9ac9cda6so1404122137.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831134; cv=none;
        d=google.com; s=arc-20260327;
        b=iBZ1vsueWmfV4OKxkx2hYdawQGf5iGBLUihD+Rm3jSwr7Cy771b9CkeIoJclx6EPlL
         qlvkzgH85w5Gk2Ou5uCFPQGeD/wZQKOQCxSWllI1NWtHMIQPQftvRlPIXiAtyHMrYusT
         fG6qeDzKpXIBosZjs61s90UHziMWzmnawUkrVvPtwsUd9sHFBlSS/e/sgU9gGTTLM9Y2
         M5COubGyLfa2BN24tM6hHayYAOVc2srh6P6OqV1nhKjWI6U1oFeH13yB8QhP80M/lOsS
         sHZJ16+GNIe0+ZnQzh3p2mWkLTvU5qKflip5fOJ0Xx05TUP1o0OJgXQy3bnyxEv9Qq3j
         tKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vw/xwG5EhNUSyVJanB7DL+6LJ9tzB6hvrnbHnYadSKU=;
        fh=pY39PhnD9M6YluATUcAi7vaNQQLzX/6ZxdqDJH92qB8=;
        b=BSro+FhWvgrZwf91Fb0JiUJNphz2vnbGVrsbfacYYy5FqrTLVqUkm/BC8Xv5NQn+8O
         zv+1I9JH8xNVWrDB7O+OKXF5VupEDP4NHN8BM56UsniT5x9qP/fT/KAjpJS68YQXIBYj
         1N2bCPyPcpmkmXOO2MfcVHjpKE+BCmad6wwwhe4MeVf2OOp+IGiB7JVle4ldDEq8SJTv
         qLp7RijgmJvvNOwZLLjPmwuFPfHFVsIeAbWFzKxpO0JT+j83yV7w2o2mdJrMQ1QCahcc
         bUf/9WNgADZGb/ZrBOBJMC3xV65xnlCnnRubD+IQrmwJvTiJp9G0yKaRwui+gmKfgxhw
         VU3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831134; x=1788435934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vw/xwG5EhNUSyVJanB7DL+6LJ9tzB6hvrnbHnYadSKU=;
        b=baVmNv/zcXclm9vrEZdAUilQZC5cu9Qs6yWsToh95tE9mYugdq/0rX/he5s92BhPOf
         CTlT/FKKtLKShlmxgo60wlr/zyYv6cW/TOCw0xrSqXMR+NWtYVUcWsdlh9z1Uf/dGckN
         GAt4RXYREcGIGMzdUjnteWJNZSFzmfaknOxL0Epaw06aDeePeDwU77eDEci5PwLjdTl+
         QbelL/gWrrQgP1Gx4wZfntNnPTwi/i/hnXl35pIJsbPpLYTM/7RoFOylY/PlfbRckXRv
         dKlEPvoZ9Ey5P+yj7NT4ogS4oUc+OJx+KWeWXtP5Po/JaNOZK7kaynfjOAywMMyA+wpH
         7uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831134; x=1788435934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vw/xwG5EhNUSyVJanB7DL+6LJ9tzB6hvrnbHnYadSKU=;
        b=NRcL3M/tM5D3QGldkiNKedHftUPL4QYr3ObIp147n/JEf788KzUoZvyet5WPXF2utd
         hfa2Kwz7ef4ae4zvE50thv7VcNFs/9L/B1lMSXuE9RABBg1+3ekD1ewfGOkAzAl5NvtD
         QVBtAQXa6FxedxqIQ6YD7qNBXhiF3mo/IP9qigZwkprEU0u6HA7sE/uBITHlIKURu7um
         ocfosnSUwOyEoKnOaiBytfXkLEziVTxIsGpxh2K1rVBPEVRraVWJS6HaqMyWmKHub0x/
         HU7LfTbgZPXPz8AAqxaYBH05Ihh7xR1nc1xbRXzSMqnc7sJkLremjciyB8U0jhssy72D
         uj1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+6C/i/Xr9unfG+qM/Tj9/UnlWEUH80X9uxEAgh53kdJZbXug9RA6Pgew8/SGPTFXFOjf3oSmwza4+oK4=@vger.kernel.org
X-Gm-Message-State: AFuF++mUY464MKgRQwLg+GeWm2eRFRUBHlQdc55/R//uxMTgbKcbHqAq
	dmvgtObCjwTT2NDyout4BtUnJVVjpzrrTnLqAyScOvcAX3RX16jvOGMXdFdVkRVwBDke+VlZlLD
	ki0lzDxO3RNJ9NOTwHeFYH0Fe0WrGLKg=
X-Gm-Gg: AR+sD11p0fm1b+6mkBX9Uu5YjsJnE7Z5xeotaQTt5eM2SqiXbDxJLR/+qrrVquRRlSr
	lHL2j+rbam4pZmhxwlqGRVd8uMJCTz4GN1aqGN4WZE8UAefuYeQt0x0icvhWtLIaIiQz/xQX4N7
	gzrHhxQgqqh8uW4mRoVNvW7wdGbRTYQ283XeS6LsmmdcVaq4lI7+9h1I0OcW4A+iwrFbP7bV8G8
	/e/aGCLGP5GJ7V/zYqv4h7uM+g1O/xj8vIVUFV4R0bSHgcbj7aziGdjCk6RnKbWlh1nvUUyTZJl
	4lsg6aaBKmtMmFbsxV2b7p4w66YbDAAM5TBB6fvAP0VjzQ==
X-Received: by 2002:a05:6102:41a4:b0:778:5579:c661 with SMTP id
 ada2fe7eead31-782c0dfe6a6mr5324176137.7.1787831134122; Thu, 27 Aug 2026
 04:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-warn_instead_bug-v1-1-b515c0f74b89@gmail.com> <20260827114229.GK687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260827114229.GK687043@noisy.programming.kicks-ass.net>
From: Amin <amin.gattout@gmail.com>
Date: Thu, 27 Aug 2026 13:45:22 +0200
X-Gm-Features: AcwNN1UllEtgS-YWyDNOJz4hGkKApGe64r4QuxBpsaO8N92Q5bl_0XeOP2yd9Pg
Message-ID: <CAHfa7xU19+uqN-DSfW4LAAoMpcLzv0vLMvNpAazOFoLykw00tw@mail.gmail.com>
Subject: Re: [PATCH] sched/core: Convert remaining BUG_ON() instances to WARN_ON_ONCE()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fair enough, thanks for the quick feedback.

Le jeu. 27 ao=C3=BBt 2026 =C3=A0 13:42, Peter Zijlstra <peterz@infradead.or=
g> a =C3=A9crit :
>
> On Thu, Aug 27, 2026 at 01:40:14PM +0200, Amin Gattout wrote:
> > Commit 09348d75a6ce ("sched/all: Change all BUG_ON() instances in the
> > scheduler to WARN_ON_ONCE()") left a few BUG_ON() behind in core.c.
> > Convert them as well.
> >
> > As described in Documentation/process/deprecated.rst, BUG_ON() crashes
> > the system, which makes the failure harder to report and to debug, as
> > the message often never reaches the console or the syslog. With
> > WARN_ON_ONCE() the user gets a chance to see and report the problem
> > instead, and system owners who do not want to keep running after an
> > "impossible" condition can still set panic_on_warn.
> >
> > Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> > ---
> > Follow-up to commit 09348d75a6ce which converted the scheduler BUG_ON()
> > instances to WARN_ON_ONCE() but left a few behind in core.c.
> >
> > Build tested on arm64 with CONFIG_NO_HZ_FULL and CONFIG_SCHED_CLASS_EXT
> > enabled so that every converted site is compiled.
> > ---
> >  kernel/sched/core.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index f78275192036..bab74b4f0dd6 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -5949,7 +5949,7 @@ static void sched_tick_stop(int cpu)
> >  int __init sched_tick_offload_init(void)
> >  {
> >       tick_work_cpu =3D alloc_percpu(struct tick_work);
> > -     BUG_ON(!tick_work_cpu);
> > +     WARN_ON_ONCE(!tick_work_cpu);
> >       return 0;
> >  }
> >
>
> > @@ -8954,13 +8954,13 @@ void __init sched_init(void)
> >       int i;
> >
> >       /* Make sure the linker didn't screw up */
> > -     BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
> > -     BUG_ON(!sched_class_above(&dl_sched_class, &rt_sched_class));
> > -     BUG_ON(!sched_class_above(&rt_sched_class, &fair_sched_class));
> > -     BUG_ON(!sched_class_above(&fair_sched_class, &idle_sched_class));
> > +     WARN_ON_ONCE(!sched_class_above(&stop_sched_class, &dl_sched_clas=
s));
> > +     WARN_ON_ONCE(!sched_class_above(&dl_sched_class, &rt_sched_class)=
);
> > +     WARN_ON_ONCE(!sched_class_above(&rt_sched_class, &fair_sched_clas=
s));
> > +     WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &idle_sched_cl=
ass));
> >  #ifdef CONFIG_SCHED_CLASS_EXT
> > -     BUG_ON(!sched_class_above(&fair_sched_class, &ext_sched_class));
> > -     BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
> > +     WARN_ON_ONCE(!sched_class_above(&fair_sched_class, &ext_sched_cla=
ss));
> > +     WARN_ON_ONCE(!sched_class_above(&ext_sched_class, &idle_sched_cla=
ss));
> >  #endif
> >
>
> These all really should be BUG_ON(), there is absolutely no point in
> tying to complete the boot if they fail.
>
>

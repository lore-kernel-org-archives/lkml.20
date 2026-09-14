Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800D4570E1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392254; cv=none; b=Po48HD4gVsckTbDRDhVW6tLnFo5751M5kRGVpi4ry+MYkUUr3Rm8f73mULAsReMcysaRcZPPMjTNlxOGe3uhmBt9cSJB2E4N8yfqacuPzRguYhVvtV5qfiIq80b/Ae453VZ+Wm0xIjPr/SZhrGPhSNpx3Ld11xaTyexIGKvkiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392254; c=relaxed/simple;
	bh=P0mZQNHSkk0xSxSOt2VlrarE2pxLqu0OKAvcOKR40Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OdgP6oPTTP1hBE173xA2evFYoY6JsUotBj67qBcYQ7/KA4z9bLq1wNSQJoP9kcDdpfrjjA8a7XJ3yGQfdBwQKt2gIEuahvVDLabb6aMx6l2tNqlijb29sWfzoZoTEeth8GlsQULFLtG/kc1AQ7xH+V9C4+YeHCtWzafMC3MtZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsWY3tfL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsWY3tfL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso24387095e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392250; x=1789997050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9L9tcLbdL4KYyum5sr/h04eDCLoRB4iSwMc6XYJwMYo=;
        b=fsWY3tfLsNhw0qMCJrGxmvWlKzv6s4MWVVxC/jSzW1ZbS4gdUpWNrYeJj1OJKsB1/U
         hNrtM3j7g/ljf2p+TTRiNIh+rcj9DOA9O3UbZx/0gKOJxyGpy4lyToN2JYgFuIpcsz/I
         ybjt4K/OHX6UG6iva12xy8qVVl5A5jEkndq8OImRlDu5fAzW/CBrszHoxYafrzTkNKjG
         MAO8Kg2GW36MM0afN3WvQOc8+Kf+GBtO4+5flqH7yKCkpydPUyfOUXInH9ydYQvbk/Jd
         FesRmjlzO+WkL6PfAVGKZ1tSFN784LyuQ2jp46Mh+oFFP9vpPnsPAiw4l7qSUKF+YH3+
         RDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392250; x=1789997050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L9tcLbdL4KYyum5sr/h04eDCLoRB4iSwMc6XYJwMYo=;
        b=HP35VrBUen2uxCyGU/f/+QCxlFB3+DAEucXc17g67XiVZqCexMj+HsMdWKFiG9wDoR
         wtapB4D182wFMF/j7GnRAzpOly7CPHHVi4PFtdUMybJD1yUda3zEiNDvAGCaAH0K+Rue
         kBoGHcxT3O4s9MgOjADRM9RolG+2EAwTAZ7fkmvL8aZRPaQUsV2v+BXok6i+bvp4S1yz
         BPqofC0A2Uw4m3qdpinNaOlMDy5OSvUb3g5iy1w17yTgvkbcveWN3G4Le6ZD8PZcIKOI
         ARmmrrRUqOd/EvvZ6Ukx37ZG83PuCNoHiqvUaCB2tnYsqoPaJuiUnCaypnd/OAEomq5y
         3Drw==
X-Forwarded-Encrypted: i=1; AKwUvBwSLafhtVnh7T5QigAFZBch1Y3s54SAntP5YMDftAPfP9wN30GBtoCq1sXcmLAl1XyyTmTVoQEobKDcf5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m67HCJiz6UsugFMwLPsiKBNDXxjuew98fWw1d6BdaXp5i+UKp2
	YwCs0TvLDMVz5m9+UeqRt6OuvXkwK/Psslf25xB41GFWYeWqVb+FYLMv
X-Gm-Gg: AYBFou0ClecqJ5zvkETAXI240NyFMdlIMk9yy5kCKbN8GEOdBlpfxfOPI5sIwTupBQc
	OafWqU6DNTyp3Tz5n8IiSeslvhbGDErgF8nR+yJv+lB4hlp+5E00sPBGhXtFBNTlcsshE4qLy1F
	lnvJudN7XRnJcM6Nw30XS6XRRWWlsJ1FOvADDVjPUN2fCC2OAPIV9Z0WlBhtfuTQgJbIuhkOtvD
	N1q2Yk02OejdrMlp8PGShlRHT5RBCJR859831b2TOCbkMcgBrAR7B8o3q+RwqXRb8blPVHK+imq
	HjPg8fl0R6g85BzvBTYSz0brcsvVwYUIfNrZejcj5AWNuVTMwhvzOXtDSyU51IJfFHlmymnaFZC
	EBMeWfDgM4Eu51ZSNcWLTXUGhzUxKCieIjAfxFGXgOMtCZdLz0LlUJFk306pHuvkSzX7e3G/3eJ
	pzFtthSmxmbO8mX/MZIw8KqQzsyN5Pkstq/zOq5lqnRWcwFgKrVCKAHv7PtKbQWka2jraLK6jRn
	g/Lryvli1oxA/moch0KqBsXh6TUpnDwyoum
X-Received: by 2002:a05:600c:3585:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49e7a638783mr70394705e9.1.1789392250149;
        Mon, 14 Sep 2026 06:24:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm216807325e9.12.2026.09.14.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:24:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:24:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Waiman Long <longman@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260914142408.7bdf2cb4@pumpkin>
In-Reply-To: <AE2D42C1-9B5A-4F5E-91FC-C84423ADE7AD@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
	<44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
	<dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
	<0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
	<20260910120016.04ba8ae1@pumpkin>
	<C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
	<20260910130557.74e1ae45@pumpkin>
	<E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
	<20260911181516.313a8a2f@pumpkin>
	<AE2D42C1-9B5A-4F5E-91FC-C84423ADE7AD@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2026 11:46:02 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

> > On 11 Sep 2026, at 19:15, David Laight <david.laight.linux@gmail.com> w=
rote:
> > On Thu, 10 Sep 2026 15:30:03 +0000
> > Haakon Bugge <haakon.bugge@oracle.com> wrote: =20
>=20
> [snip]
>=20
> > > I did it in another way. I just added an "atomic_xchg" test to my
> > > mutual exclusion framework.
> > >=20
> > > Lock acquire:
> > >                 while (atomic_xchg_acquire(&el->mx_atomic_xchg.lock, =
1) !=3D 0)
> > >                         cpu_relax();
> > >=20
> > > Lock release:
> > >                 atomic_set_release(&el->mx_atomic_xchg.lock, 0);
> > >=20
> > > This passes. It also (obviously) passes with atomic_xchg() in the lock
> > > acquire. But the _release _is_ required in the lock release. =20
> >=20
> > Isn't that accessing another branch of the 'big union'? =20
>=20
> Not sure I quite understand. During the run of one particular test, it
> is _only_ the corresponding struct in the union that is
> accessed.=20

I misunderstood what you'd done.
I thought you were adding an extra barrier to the osq_lock test.
One of the possibilities is that it is speculating all the way through
into the osq_unlock() code and the first read there is being done
before the read of node->locked in smp_cond_load_relaxed().
If adding smp_rmb() between osq_lock() and osq_unlock() doesn't fix
it then that isn't the problem.

This code really wants the cpu to speculate around the loop in
smp_cond_load_xxx() so that it doesn't load any other cache lines.
(I've not looked at the object code (any architecture) to try to guess
what happens.)

David

>=20
> > So will be overlaying some other field - possibly the count itself? =20
>=20
> pahole gives:
>=20
> struct {
> 	atomic_t           lock __attribute__((__aligned__(4))); /*     0     4 =
*/
> 	/* XXX 4 bytes hole, try to pack */
> 	long int           counter;            /*     8     8 */
> } __attribute__((__aligned__(8))) mx_atomic_xchg __attribute__((__aligned=
__(8)));  /*     0    16 */
>=20
> > It seems unlikely that adding a barrier between the lock and unlock
> > (or unlock and lock) will have any effect.
> > In any case I think it is enough to use smp_rmb(), smp_wmb() or smp_mb(=
). =20
>=20
> That might well be, but the intent here was only to mimic
> the sequence atomic_xchg() in osq_lock() and corresponding
> atomic_try_cmpxchg_release() in osq_unlock().
>=20
>=20
> Thxs, H=C3=A5kon
>=20


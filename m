Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792486578;
	b=Ja43azodj8DJA+WNJnBO/K0DuqP+TKnZN/U7GGl/c6RM3CJEGvx3QjC9mHViV5FXlM5h
	 sHhfrBUdU8Wzf5v5XeGiq3FQI+6BCxZ5ho6Qnap/sgWebdVQGf8KvYTX7Oa5UqicF9noW
	 GvhAqs7G6PVISfhpHMltTYLwH2r4YJpKVPcpFEIkXQyEXsH0rRmeLqWoy1InPqXVN8kFf
	 k1RWlsm06b712psj1ajywDLpyxX5FP4MqBLzclAJVKKcX+BGY/rwQlB2F0x8tiseAl/Yc
	 9c8uGXZhxt7lcRuVBIlua10z8eLnwV8pwBuJ6XCgzzFvb+7LjYyY4hxL0AsiC3D4QuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486578;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=EO/Hx3wmjK2qfxxzLF6nASGr8bhB9j7KtckXSt/vRFM=;
	b=QvO5n+5gfNK0ER/4HBA8cqS+eBZNDfiLVqz084Kq7dkvowJXztuaDfib6FmPwRORCRBA
	 TUBviqu201NZMlHZW1enCy/RjFB3eusQ6SQq6Mi1MCJRwjRkPN+Cl7eUdvTOpYMIjyagG
	 FVD0Np4zEDM7VD+e/JicnGNTgZJ5Ktpssvuo49T9JNcQkpDhpupfWF818FcL9FykgHkYL
	 u0Bq/rL27xdNv8CcboskzbszHCY9Vy7OfkcWXJV4WADAyAu/KJUF97ai7VAVAa5Y8FXVA
	 YvoQQXqN3APcv7E6hicz8MuM5M7B87nTjDLW0xVE2QEFESRvul4gEM8RQIsvGibsdBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KsMMoIBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FF606A319;
	Tue, 20 Oct 2026 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KsMMoIBE
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 147202021BD;
	Tue, 20 Oct 2026 10:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792486575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EO/Hx3wmjK2qfxxzLF6nASGr8bhB9j7KtckXSt/vRFM=;
	b=KsMMoIBESSINtwlHfBGS7PTKPR4GJHMBS0bLT+mBSSOYVTd0JpMAhYbIJ8DRjJOL6BBKtz
	QfeGYwGPFtcn5AwpxD8Ka7yICYW0gy4fGdJEEuQv9ib2RbSHugudVptsB585PIDCb3onZ9
	5m5CbiCupGv1CkrmCtuam29zi7A4WqdaSibyuSHLMwEhjwTrmpwx11/YAvh+UzmKaNjQK6
	GQTs6NS9KMK0jlz8/CjbZ6ldXEDJVyyHywVwe+aHtjmkBxRF8uGxPxg+1nJi7rbOMGSrxF
	4Wm/D6NypOUfdcCDkCIOM4ZUOl7tBwZ0N9BU/FLSR7fR5lYRmWS2Y3oNw1Qu/Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792486575; a=rsa-sha256;
	cv=none;
	b=JXfW+AyeOKpXBKbOZIzqZhZMgxidE7qDWPqPeV1Yy8z4pO9P43LRf8s7dV5hfnnbsX2dnP
	vVeUZHqn2P1Q5kWfXUg6uIgoHzhocC0i+Ol2X+f8SSiXmTo28NmyaKy8vQ3PkhiuH2y1Vv
	PRLNbGX1LDGjrPRAVHhWYc4G5bFkmZs1abQOQafQD+vdReAn6FXaGIeLvBeZNT4OWi+c0q
	ax7ZWuLkcp2ebhbbEW94N8XlZWilQcb2m9MnqGwv36nu3xeM9IFgzllNak3WKrc01IELZO
	1cx8AlbLH7G59MDn4OqK5R2tRnwvKeBZhDPCCtulXEqNBa3aAq/jv6t8B9/XLA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792486575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EO/Hx3wmjK2qfxxzLF6nASGr8bhB9j7KtckXSt/vRFM=;
	b=YucF7it935v1ola3F0WLa0qGdkxEfB9rswmg+8t5EKhXIQHzwxZwSqdbPBrA0GP3NkxIE3
	fdrnGpDfgeLxh7YmyKDswzO4+P00LmIteJgzqznL87Vfc8hA0hBHEcwKwtK+V5voHsdl/Q
	t/ElEwFu/gmwksOdBD6gfJU/c2lg22IL8qVul00JhRledXtDSjwAelWYE3mEQh4Y/pB4Te
	H6ZHXhO8H8PYPFvou7BEreEGESfzTvRRkuMe3+2IT73bq7DRBVQJRGFcWYNG3ycOzba2Xa
	0ymdongaNl0u35Z0KRDL9hhnvDygrvKKygwSfMyGLCbCFCBAOqLEvYIyduPvXw==
Message-ID: <cda25e6b8be6887da0da859b748662238025c60c.camel@pengutronix.de>
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>, Shengjiu Wang
	 <shengjiu.wang@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, hansg@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org
Date: Tue, 20 Oct 2026 10:56:14 +0200
In-Reply-To: <atcf1PFVcn5pdsVO@analog.com>
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
	 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
	 <atcf1PFVcn5pdsVO@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-10-20 at 10:29 +0200, Alvin =C5=A0ipraga wrote:
> On Tue, Oct 20, 2026 at 03:17:40PM +0800, Shengjiu Wang wrote:
> > Hi Philipp
> >=20
> > On Mon, Oct 19, 2026 at 1:52=E2=80=AFPM <shengjiu.wang@oss.nxp.com> wro=
te:
> > >=20
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >=20
> > > reset_control_deassert() and reset_control_reset() guarantee that the
> > > reset line is deasserted / a reset pulse has been issued once they re=
turn.
> > > For a shared reset only the first caller runs the hardware op; others=
 just
> > > bump the refcount and return early, so a concurrent caller can return
> > > before the first caller's (possibly sleeping) op has finished.
> > >=20
> > > Serialize the shared refcount update and the hardware op under the
> > > existing per-control rstc->lock, taken before the SRCU section to mat=
ch
> > > reset_control_acquire()'s mutex->srcu order. The lock is taken only o=
n the
> > > shared path and only for may-sleep callers (reset_control_reset() and
> > > reset_control_deassert()); the exclusive path stays lockless. Callers=
 in
> > > atomic context must use the new lockless reset_control_reset_atomic()=
 and
> > > reset_control_deassert_atomic() variants, which skip the mutex and so
> > > carry no completion guarantee.
> > >=20
> > > The op is now called with rstc->lock held on the shared path, so it m=
ust
> > > not re-enter reset_control_reset()/deassert()/acquire() on the same
> > > control; a lockdep_assert_not_held() at each lock site catches that.
> > >=20
> > > reset_control_assert() is unchanged: a shared assert makes no guarant=
ee
> > > about the line state, so there is nothing to serialize.
> > >=20
> > > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > > Assisted-by: Anthropic:claude-opus-4-8
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Serialize only the shared may-sleep path under rstc->lock (taken be=
fore
> > >   SRCU to match reset_control_acquire()'s order); exclusive path stay=
s
> > >   lockless, and reset_control_assert() is left unchanged.
> > > - Add lockless reset_control_reset_atomic()/reset_control_deassert_at=
omic()
> > >   for atomic callers; gate the mutex on can_sleep so no shared consum=
er is
> > >   regressed and so it works on all configs.
> > > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> > >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> > >   controller op re-entering the API on the same control.
> > > - Declare the new variants and stubs in reset.h, and document the sle=
eping
> > >   vs atomic variants in the kerneldoc and reset.rst.
> > >=20
> > >  Documentation/driver-api/reset.rst |  10 ++
> > >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-----=
--
> > >  include/linux/reset.h              |  12 ++
> > >  3 files changed, 177 insertions(+), 49 deletions(-)
> > >=20
> > > diff --git a/Documentation/driver-api/reset.rst b/Documentation/drive=
r-api/reset.rst
> > > index 932699c57d1e..0fbc1ba92dd8 100644
> > > --- a/Documentation/driver-api/reset.rst
> > > +++ b/Documentation/driver-api/reset.rst
> > > @@ -185,13 +185,23 @@ Given the reset control, consumers can call res=
et_control_assert() and
> > >  reset_control_deassert(), trigger a reset pulse using reset_control_=
reset(), or
> > >  query the reset line status using reset_control_status().
> > >=20
> > > +For shared reset controls, reset_control_reset() and reset_control_d=
eassert()
> > > +may sleep and must be called from process context. Consumers that ne=
ed to
> > > +operate a reset line from atomic context can use reset_control_reset=
_atomic()
> > > +or reset_control_deassert_atomic(); these never sleep, but do not se=
rialize
> > > +concurrent shared callers and so do not provide the completion guara=
ntee of
> > > +their sleeping counterparts. The underlying reset controller's ops m=
ust not
> > > +sleep when the atomic variants are used.
> >=20
> > On second thought, this change lets reset_control_deassert() sleep, so
> > any driver
> > that currently calls it from atomic context would now block. The new
> > _atomic() variants
> > let those callers opt out, but I can't tell how many drivers would
> > need updating, and any
> > one we miss is a silent risk.
> >=20
> > Do you have another idea to fix the concurrent deassert() problem on
> > shared resets
> > without this risk?  Or should we go back to the original proposal?
> > https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/#m66615477929=
b38f788d6d22a2c0bb9ca62173e89
>=20
> The reset core could borrow a trick from the regmap library, where it
> uses either a mutex or spinlock depending on whether the underlying
> reset controller's ops can sleep or not. Check the struct
> regmap_bus::fast_io member and how it's used in __regmap_init().
>=20
> It would also allow the problem to be fixed for atomic users. Right now
> you still have the race even if the underlying reset controller's ops
> don't sleep and the _atomic() API is being used. But if you know that
> the reset controller ops don't sleep, you can serialize shared reset
> control operations using a spinlock.

Yes, that sounds like it could work.

> With the above design you can leave the consumers alone and drop the
> _atomic() variant of the API functions. (I'll also point out that adding
> sleepy/atomic-awareness to the core would open the door for consumers to
> report their requirements, e.g. that the reset control musn't sleep, and
> for the core to validate this with the properties of the consumer.)

Adding _atomic() variant at the very least would require correctly
setting can_sleep/fast_io for all reset controller implementations and
making sure that the sleeping controllers throw an error in the
_atomic() API.

> But... it requires an audit of all reset controller providers in the
> tree, to see if they are atomic-safe or not, and report some kind of
> .can_sleep property to the core (like regmap's .fast_io). I have a
> feeling this is still more straightforward and less error-prone than
> auditing all the consumers.

Seconded. I'd really like to move to an API that visibly separates
exclusive and shared resets, as well as sleeping / non-sleeping API,
but I'm afraid that would be a lot of churn.

> The other downside is that it's not a simple patch which can be
> backported, which might be what you are looking for.
>=20
> Any thoughts? I can also help out if the idea seems good.

How about adding the can_sleep property, setting it for reset-gpio, and
adding the mutex first, and only then adding the other reset
controllers and the spinlock. That could allow to backport a relatively
constrained subset of the change.

regards
Philipp

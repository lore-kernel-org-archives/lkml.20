Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485848;
	b=jKnLxG6l5rtvBF9ueaMaSnUPvXy9DcjlnlhH8R8WbRgdY1X65eHrJIvpYCZ4eVY1EizT
	 CC3236QvMtkN1xEKxySDSJCkfHeTuUCiQInVDsFOPiqyGAx6BPQsMz23LbvymwRKXJblD
	 0i5AAP8XEbgPbUPj92f7sxtEvjZqqK3D6tAhNIAaW7yxRE24rdBA/k4lLezapLjjGfoCc
	 O72ffrZ1iokvzJp1z4861WRlrNyX4ZL4W5fLq8pya9T2NyQIN7vC8ZGxLCzWRlz6QGPMp
	 T37Kf64UVwrGdGgYG7wuYkWeOKpKhQLklrlhbTaqqJxr+Gmoi9101HfXWHNnAB7NjQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485848;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=/lJGUA18HbUtZxXfx75uV4qk19XsF10AReTRSQISs/k=;
	b=VXetuFkE/tF9JAXrdfdoP7g7ae3iPk81VwCG0/18YG+Z9v7L0BvZAfve17fIS4wz16S5
	 OZ/Mbl4KY0NEt2ICTOyVqaBwO5A0cQKwtrIRAhuaUDhbgNiKowf3y4n+gfWo/M1MDLNp/
	 t8ar1BeTsHXekogk0WZFiunk0lMXE11zRGLfv7c7604cx6ywFRGt+kFD23YBekw1P7Y+u
	 DSTPomx11TqUqONY5wsVQa24RtvNx/2rQoBg4o8/t6hK+jU3tFdsWXM2TX9uXvhIzKneh
	 2NzDCg/pSbErpbjEnSVSkvzDkitbO3SrRRAHqi5s2fqWPvc0rx4y814uOoXD9eIUEFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E3ZqzL9p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B9606A319;
	Tue, 20 Oct 2026 08:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598B9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E3ZqzL9p
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C97E720227A;
	Tue, 20 Oct 2026 10:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792485845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lJGUA18HbUtZxXfx75uV4qk19XsF10AReTRSQISs/k=;
	b=E3ZqzL9p5WXYEn7o941n7h5M8zBlDhVpRILDzt6fUyvYsrtXtaDMsNVvln4cmAshub9PDh
	12BgTHUAClw3hxGmHN9Dl2p0uBKMCziFhdj78+jxatP7i/fKhU16hWWyJ+Qg7p3G9wEqQA
	pTTDXnUkrN5RzexzMI7pPvHln8UN5Nyj699Q8+16TNAvYhaB+XYF04ErAEb63cEYS5ShlS
	+F593j8wQUpS490QCXqOxOFZPTRlKon2fG0GmjmM/OI+B5y01C8gzJPhVYMcUyOPNLNsuw
	2Fq3ddUDeC00AjFg0sbgh1L0A1vjsSSdLAAsY2IQVonLgQ0b3KLvYMd1bfKcYg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792485845; a=rsa-sha256;
	cv=none;
	b=Yz9ioxfVD+aMA/vBEl8HjuHvPHid+7cTb3s3wBQVfp2H5DcQPbYPBJvpjl2CtVHQEqQMgN
	hKGCyBAQrV+9Q4MchZqBdEedal2UVqIImbeRksLJGQX6OxeIZHfh/wdZS5uBBB5xVxe0f7
	1oAzMADv7X+6WUFT79z5bm/T9uSCOyDqwhbrGnD6Qbk6Fpx8sqcLf59Aen16Nb+TzhET4E
	JYLIf7CFn5a1HYi9/TcwLi1MMnjUpX+rXFAJqKEUccH1pzrkNmE0b18uaOKi1lOnUtjsBz
	yowexc1cmyz0EO8ijsVe511QU1C1Uln4hzFDte2MkyIsVTv8gbCmWlqz081iZA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792485845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lJGUA18HbUtZxXfx75uV4qk19XsF10AReTRSQISs/k=;
	b=G7nb3SpcFg7aaaM0ecltcKNbuzwjzDjuYMrjOAGrG9CtVzU/lEDzL7e58txY//01q/Taqn
	0G0cBrh6UdGuOQPehcqLQxwBGh7yMiiC1N8IuiKIdMISOdqVMf1ah6SkqBfgZK7yIXBvbI
	WhFNr/32BY4ttTVDxYDdoKm8Owy/yaUprfMK5Ppm9vJ6m2mT/j+kQ+VRBU6Z1SBjiXq++3
	U6GeV1ea+wMjr+rNAyYxpEjbYqoMK0NtRlbIir2/B7btDXNCaK9OVpZ11A+vH/Ncr+a7pG
	pBw/c0+1U20vIwHnLXnmFqCqOlNccnCZlrI+LrYuY0eE73LPKCzPSApakPwwMA==
Message-ID: <7d8f29d96aa8c9bde28e832796d024b82dfdab9c.camel@pengutronix.de>
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, shengjiu.wang@oss.nxp.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	hansg@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	broonie@kernel.org, alvin.sipraga@analog.com
Date: Tue, 20 Oct 2026 10:44:05 +0200
In-Reply-To: <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
	 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
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

On Di, 2026-10-20 at 15:17 +0800, Shengjiu Wang wrote:
> Hi Philipp
>=20
> On Mon, Oct 19, 2026 at 1:52=E2=80=AFPM <shengjiu.wang@oss.nxp.com> wrote=
:
> >=20
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >=20
> > reset_control_deassert() and reset_control_reset() guarantee that the
> > reset line is deasserted / a reset pulse has been issued once they retu=
rn.
> > For a shared reset only the first caller runs the hardware op; others j=
ust
> > bump the refcount and return early, so a concurrent caller can return
> > before the first caller's (possibly sleeping) op has finished.
> >=20
> > Serialize the shared refcount update and the hardware op under the
> > existing per-control rstc->lock, taken before the SRCU section to match
> > reset_control_acquire()'s mutex->srcu order. The lock is taken only on =
the
> > shared path and only for may-sleep callers (reset_control_reset() and
> > reset_control_deassert()); the exclusive path stays lockless. Callers i=
n
> > atomic context must use the new lockless reset_control_reset_atomic() a=
nd
> > reset_control_deassert_atomic() variants, which skip the mutex and so
> > carry no completion guarantee.
> >=20
> > The op is now called with rstc->lock held on the shared path, so it mus=
t
> > not re-enter reset_control_reset()/deassert()/acquire() on the same
> > control; a lockdep_assert_not_held() at each lock site catches that.
> >=20
> > reset_control_assert() is unchanged: a shared assert makes no guarantee
> > about the line state, so there is nothing to serialize.
> >=20
> > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > Assisted-by: Anthropic:claude-opus-4-8
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > Changes in v2:
> > - Serialize only the shared may-sleep path under rstc->lock (taken befo=
re
> >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> >   lockless, and reset_control_assert() is left unchanged.
> > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atom=
ic()
> >   for atomic callers; gate the mutex on can_sleep so no shared consumer=
 is
> >   regressed and so it works on all configs.
> > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> >   controller op re-entering the API on the same control.
> > - Declare the new variants and stubs in reset.h, and document the sleep=
ing
> >   vs atomic variants in the kerneldoc and reset.rst.
> >=20
> >  Documentation/driver-api/reset.rst |  10 ++
> >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
> >  include/linux/reset.h              |  12 ++
> >  3 files changed, 177 insertions(+), 49 deletions(-)
> >=20
> > diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-=
api/reset.rst
> > index 932699c57d1e..0fbc1ba92dd8 100644
> > --- a/Documentation/driver-api/reset.rst
> > +++ b/Documentation/driver-api/reset.rst
> > @@ -185,13 +185,23 @@ Given the reset control, consumers can call reset=
_control_assert() and
> >  reset_control_deassert(), trigger a reset pulse using reset_control_re=
set(), or
> >  query the reset line status using reset_control_status().
> >=20
> > +For shared reset controls, reset_control_reset() and reset_control_dea=
ssert()
> > +may sleep and must be called from process context. Consumers that need=
 to
> > +operate a reset line from atomic context can use reset_control_reset_a=
tomic()
> > +or reset_control_deassert_atomic(); these never sleep, but do not seri=
alize
> > +concurrent shared callers and so do not provide the completion guarant=
ee of
> > +their sleeping counterparts. The underlying reset controller's ops mus=
t not
> > +sleep when the atomic variants are used.
>=20
> On second thought, this change lets reset_control_deassert() sleep, so
> any driver
> that currently calls it from atomic context would now block. The new
> _atomic() variants
> let those callers opt out, but I can't tell how many drivers would
> need updating, and any
> one we miss is a silent risk.
>
> Do you have another idea to fix the concurrent deassert() problem on
> shared resets
> without this risk?

Maybe add a bool can_sleep field to struct reset_controller_dev, set it
for the reset-gpio driver (which uses gpiod_set_value_cansleep), and
only take a mutex if can_sleep is set? That would have to be a new
lock, taken only inside the SRCU critical section.

regards
Philipp

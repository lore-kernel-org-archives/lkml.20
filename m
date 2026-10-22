Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792674009;
	b=Qewn4MsjYO8habILlc4XMJG0aJEPkLCQSq39ikbikoLZQ36A76ecw+QzEzJinfg7gKSk
	 8NXNYYubidJgqb5Us2Tamp3Xn14ldrtfw5slDzJdRvhOj3sD4WslW+7cTgchcp9c1RHVT
	 BehCLizK/2nKIcLCr8u7pd5XUSqOrKa7DVGZhRSA4tE6/XB1Y8QXLqiVszv3Ymfm/aIZz
	 R9OfzhPgfCbU04PHpKI1LRQpw/FtpIIn5xC1mztiuu8b5dB8cLNMV6sg97Fm6j6U8gMhV
	 6mb+lKqjCBkwkopgglUBBQSs05ftpJZeVczD/vl7OPesFMnzcAvHH6wnx77uuBMRd5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674009;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=RXCv4sVD4Tx5Jzhs+MZ1BaqE1VtPVzZvOh8QY0liXeQ=;
	b=VT6I0ga+vTkD2bUHvhXuy+Lx2Vy20L4YiHGJaPkd7Xkcz2iyLVGAGHSavpBzki4VWKHj
	 zIE8TTTf3mkLd3eW27lPQFw779qzzKM4k5ePmCcqVI0G43Z0P0KRGkhM//gB0U+Q4GUFL
	 YbAGOpQFnymkA1x5m8AzBsCwbNASUlcwwGbI6B3L2mUd1d2ZBWEPppqnVklYOX/Ud8X95
	 3wmU/IGqUQs7OVLD1MiGT+ZCnn+KGu0kaOTQ6hT6CYNo4pYxF425N8HjFT79wvdkLhgSa
	 45nmAEKBVSafRD9xbEVMMOd9zmceknJcEZOep+BumK0pMlG+Q6a0oJXAI6ZLRxbu8rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EnRCaes5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EnRCaes5
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 501B3200073;
	Thu, 22 Oct 2026 15:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792674006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXCv4sVD4Tx5Jzhs+MZ1BaqE1VtPVzZvOh8QY0liXeQ=;
	b=EnRCaes5SD6ozdWxzHS6YJsI+Ifj+89CNGUjbNsQ0bEIANADnBkegFfJ37IIHXqrj3Y8uS
	dyIx0Lrgcwz1+GUenyBmkhMQd1b9RGBQwLRzwqf0qU6qmUad4nUP2ut1qxc1peattHurTF
	aYzidiMnsWRz15VGAMigKw7NPTWnDvRolFhpwojiGiQmSZrVz67hqTYCfPYmjKHuGRKs1d
	8kTlPrc8Uynp15ua5avXbgRwZoKzbe9SG05tsNEiOw6hohJn7ifINcXP5JVllTmKZW3thZ
	woMfJozNDgPduqjfRjZ7boxlCC5YPZSzWIwcJjPsRyUGOjO0iinEFM75lsa/8g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792674006; a=rsa-sha256;
	cv=none;
	b=GCK6ydfEmoF9vQOb3fCfUE1bTvnDEsqc9zn4wDLH0wMmCYO+VTJh7cwBK0maAELfcci0cg
	KVH/RFEHy+1DB+3kbq/oBvLDVS88JstC5vNhx+2TRw6KnjztBsbNAHz0ZzzaeBDkiFSSJP
	2m3Qr7dEkGq6QeWPi1VBxH/u6iOAmK1ITjEAo/VbvTnklYt4Ubzf3Zm5x67qvhvGokCpsZ
	Ax6DN/ESLqURIOoRcaz4/SxpDWBo+iDK2fWza9aCjBlbFoQL4SfZG7CMf0NRNAAqqcRjR3
	7CLPgimt0uk2BFgkEm6kW93iDBL5yTJ0xCs73vOhElUzCghUy5+Wi/oP6Aykhw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792674006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXCv4sVD4Tx5Jzhs+MZ1BaqE1VtPVzZvOh8QY0liXeQ=;
	b=akrmZtRbcQ0sQL5iu97OS0MXz0xLBEkv77MXbN8xKl9ezlgsizuQwOo3e2yONHbkBZqoDT
	pMqwSzCAS6G72rru2TlMrlykrlzg11Pch//pPkCM1fkEqJBs+tn7qyFJtQWkGEFSThiWaL
	mZ0tfBnW/GT6/nwJqTTSrf5daNp0VelHAL0YgKBd+c8FxxL+EIXUjH4y4iZLtnhkrl8DOC
	17TSQvvxRqoYmRT1UfKH81owLwuKXEK+GB+haFZ4gJ9v5Pp7KdYNHvT70p8A7XddYR6Bm5
	1c5Nm734ueJQLAc5b2aS//Hmzua1ZUyWd0UmTk/gr0hosshILWE2uFth/iNk6g==
Message-ID: <945dd21b3f5d286a4821af078de7751df6b4cec2.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org
Date: Thu, 22 Oct 2026 15:00:06 +0200
In-Reply-To: <atnZWUA9bc1btCix@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
	 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
	 <atjA6l3H5kdrC6SN@analog.com>
	 <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
	 <atnZWUA9bc1btCix@analog.com>
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

On Do, 2026-10-22 at 12:17 +0200, Alvin =C5=A0ipraga wrote:
> On Thu, Oct 22, 2026 at 10:43:35AM +0200, Philipp Zabel wrote:
> > On Mi, 2026-10-21 at 16:16 +0200, Alvin =C5=A0ipraga wrote:
> > [...]
> > > Looking forward a bit to the second phase where we have everything
> > > serialized, maybe it will make sense to also lock around the call to =
the
> > > .status driver op too? Not suggesting we do it here (as this is just =
a
> > > bugfix), but in general I like when subsystems offer a guarantee that
> > > driver ops can't be called concurrently. Also the status is kind of
> > > undefined if you're currently in the process of manipulating the rese=
t
> > > line.
> >=20
> > That doesn't change with locking if you can't act on the result of the
> > status return value under the lock.
> >=20
> > A concurrent assert/deassert may lose the race against status and
> > toggle the reset line right after status unlocks, before it returns.
>=20
> True, it doesn't make any material difference from a consumer point of
> view.
>=20
> I was mostly thinking about the provider side though. Such serialization
> guarantees from the core allow reset controller driver authors to use
> fewer locks in their own code if they know that the ops can't get called
> concurrently.

Do you have any specific examples?

Most drivers that need locking do so to protect register read-modify-
writes. Usually a register is shared by multiple reset controls, so a
per-reset-control lock in the core doesn't help.

Many drivers that use regmap already get their locking at the regmap
level.

> On top of that it makes things consistent (all ops called
> under the same locks).

Consistency is nice, but so far it seems to boil down to aesthetics.

To me it still looks like the status lock would be unnecessary
overhead. That being said, the cases where reset_control_status() is
called in a loop are usually exclusive controls.

> Still think it's not worth serializing .status?

Yes.

> Just want to know if you expressly don't want it in the patches I will
> send after Shengjiu is done.
> >=20
> > > What I had in mind later on was to rename what Shengjiu has called
> > > shared_lock to ops_lock instead.
> >=20
> > We could also combine this with the exclusive reset control's acquire
> > "lock" if we move that inside the SRCU section.
>=20
> I had the same thought. But I kept bumping into the fact that the
> rcdev->lock mutex is taken in reset_control_acquire() while we are
> holding rstc->lock. If rstc->lock becomes a spinlock

Why would it? shared_lock is a mutex, too.

> then that's not OK. And converting rcdev->lock into a spinlock doesn't
> seem feasible.

Correct.

> But on closer inspection I noticed a couple of things. Look at the functi=
on:
>=20
> int reset_control_acquire(struct reset_control *rstc)
> {
> 	struct reset_controller_dev *rcdev;
> 	struct reset_control *rc;
>=20
> 	if (!rstc)
> 		return 0;
>=20
> 	if (WARN_ON(IS_ERR(rstc)))
> 		return -EINVAL;
>=20
> 	if (reset_control_is_array(rstc))
> 		return reset_control_array_acquire(rstc_to_array(rstc));
>=20
> (A)	guard(mutex)(&rstc->lock);
>=20
> 	if (rstc->acquired)
> 		return 0;
>=20
> 	guard(srcu)(&rstc->srcu);
>=20
> 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> 	if (!rcdev)
> 		return -ENODEV;
>=20
> (B)	scoped_guard(mutex, &rcdev->lock) {
> 		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
> 			if (rstc !=3D rc && rstc->id =3D=3D rc->id) {
> 				if (rc->acquired)
> 					return -EBUSY;
> 			}
> 		}
> 	}
> (C)
> (D)	rstc->acquired =3D true;
>=20
> 	return 0;
> }
>=20
> 1. (A) is the only place where rstc->lock is actually taken. Ostensibly
> it should be serializing acquire/release logic, but from an API point of
> view it doesn't make much sense.
> Just like the remark [*] in my last email (see below), you also shouldn't
> be trying to acquire the same exclusive reset control from two places at
> once.

release() doesn't have to be serialized. Only a single rstc per
rcdev+id should be possible to be acquired at the same time.

Racing acquire() on the same rstc is API misuse, but also shouldn't
hurt in itself. The concurrent reset ops that are expected to follow
would likely break things though.

> And it doesn't offer any synchronization with other exclusive reset
> controls for the same controller line.

Acquire between two different rstc for the same rcdev+id was serialized
via reset_list_mutex, before we apparently broke it with 8c91302a29bc
("reset: protect struct reset_control with its own mutex").

> 2. The synchronization with other reset controls is done with
> rcdev->lock at (B). But actually there is a narrow race here. Two tasks
> could try to acquire their own exclusive control of the same
> line. Assuming the line is currently released, task 1 could reach (C),
> get preempted by task 2, which reaches (D) before task 1 is run
> again. Then you end up with two controls having acquired exclusive
> control.
>=20
> The obvious fix for (2) is to put (D) inside the scoped guard block.

I agree.

> But then you achieve everything that rstc->lock is supposed to
> achieve. So I think we can get rid of that lock altogether?

I think so too, yes.

regards
Philipp
>=20

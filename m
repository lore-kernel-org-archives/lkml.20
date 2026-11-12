Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501875;
	b=ejd7AV1SUmjEeE3DzSwVXfDulzm37ZfMnkH9wnTInxFM6ekEmzai6Qc3Agr3JSiDIzgV
	 fjNKmXojpJVMwWKOBtydptaCl9QJFSG7Ee6xvHD3NYbcWW/vgAk+gT+xSyCESoUFmOdI4
	 4aRA5eRltd0ck50U2NzU1ER39PQ4FA6G9EzeVFxMgz+3GSZexgb3o6BNAhomcDIEyv1OB
	 ePknHrAjboasQIAHio9eva/BT8JTzD61gSrUUN9fVSpyKO1y3BtAlPuM53pEoz3HasgZy
	 0K/NLYaJG8u+8x6oTrT2NKatF8d8ViyoSeEN1mUI6yeCx+/o944c2nEUumtfOMWyNGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501875;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z3ViWfJ9W+khV6jKvNxkFVN2vN2++OeGsa5sOa2jAVQ=;
	b=2foLb5pilY95CMG/w3CwxwktQtsLtXxd5VoOJ1LhVdgA84SgKAEVS0Wl29tX1fIsjM/v
	 3GSz6rU85z4G6E7lX5SdeVGb7KrUQ/UVsy0nD6aWXknnAUDbcmbaUaR5q0t38ScRxTy3O
	 6v5poIaSBYt41F2DESsMjgWzsqwLGXOoFUOlFAWk8Oe6rF896tqTEYpTHUIVUHeIrvcB2
	 oPi5RxiOsPR3w5Riy3BMAOFF+wBxXmf+VjAQmomDcXM1QPh8DCEzaUY91R9yjAVLiRaBC
	 FAXxqpYf/gp3ytwZONriiQWaUMjWAsk9v63Yzth6uTaFrP/2FNKg/gE2SEaHGxj5uEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZSr+Xzy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43B606A32E;
	Thu, 12 Nov 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZSr+Xzy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154421F000C8;
	Thu, 12 Nov 2026 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501874;
	bh=z3ViWfJ9W+khV6jKvNxkFVN2vN2++OeGsa5sOa2jAVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZSr+XzyEtwhvDw3MrhY+Ck11MPK+xpKHGFqub+SieyaGcwHTo0cxeO/xn1ijmMWQ
	 4L+2lxL1x1uE51enm/D0/sLf3MTn/SjVKdGKiK4nIF44oczOzjzkv1PMxT+ewuOEB2
	 QNtHipzl7S59V2X4V4d6tl59HAaY441SCchQ7PivDpXq6ryIB9B+ArXkkFozrlddMy
	 9Yprwgk2b0yZ/qlbTN2K6j6MAGAB+CdbJA3SAQTSo89sOtVPjnq42NCFdeWV8d0lVh
	 FSttW9QRRjDH3brY2JnjumOeXYbjgIX4/5q8dbR03/sVcyI5w/1DBLAhOzPfLHr/MS
	 1y7fNFL1yz6lA==
Date: Thu, 12 Nov 2026 17:44:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
Message-ID: <avXrRoIt0slXyaWs@houat>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>
 <avMM6a6xcDHT-zCR@houat>
 <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org>
 <avMgJ7MFks0sKD7T@houat>
 <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="phinazzthwazdk47"
Content-Disposition: inline
In-Reply-To: <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>


--phinazzthwazdk47
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 03:43:59PM +0100, Hans Verkuil wrote:
> On 10/11/2026 15:17, Maxime Ripard wrote:
> > On Tue, Nov 10, 2026 at 02:30:51PM +0100, Hans Verkuil wrote:
> >> On 10/11/2026 13:33, Maxime Ripard wrote:
> >>> Hi Hans,
> >>>
> >>> On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
> >>>> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@ke=
rnel.org> wrote:
> >>>>>
> >>>>>> On media-centric camera pipelines, every entity is known at boot t=
ime
> >>>>>> and described statically (for example via device-tree).
> >>>>>>
> >>>>>> The V4L2 framework assumes that every entity of the camera
> >>>>>> pipeline is always present. This is a reasonable assumption for
> >>>>>> integrated cameras in laptops or phones. However, in automotive sy=
stems,
> >>>>>> cameras (e.g. rear-view or surround-view) can be damaged or discon=
nected.
> >>>>>> When the framework assumes all sensors are present, a single missi=
ng
> >>>>>> camera can prevent the entire pipeline from operating.
> >>>>>
> >>>>> This series has been discussed at the Camera & ISP "unconference" in
> >>>>> Pragues (during Linux Plumbers)
> >>>>>
> >>>>> The notes can be found here:
> >>>>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killara=
us.ideasonboard.com/T/#u
> >>>>
> >>>> What is missing in this discussion is how userspace can indicate tha=
t it
> >>>> actually can handle partially instantiated pipelines.
> >>>>
> >>>> Today if one or more parts do not come up, the devices nodes are als=
o not
> >>>> created. This is typically exactly what you want.
> >>>
> >>> That's very arguable? We have plenty of other examples where we allow=
 to
> >>> show a software representation of something that isn't available in
> >>> hardware, starting with virtually any memory buffer allocation, but a=
lso
> >>> disabled CPUs, swapped pages, etc.
> >>>
> >>> For things a bit more related to drivers, things like USB root hubs a=
re
> >>> also pretty analogous. The "root" device will always be created, even=
 if
> >>> devices connected to it are non-functional, missing or whatever. It's
> >>> the primary interface that these devices might or might not attach to.
> >>>
> >>> So it's a bit hard to understand why the device nodes not showing up =
is
> >>> exactly what we always want.
> >>
> >> It's simply how V4L2 works today: video devices do not appear until
> >> all components are instantiated.
> >=20
> > Sure but that's exactly what we're trying to change.
> >=20
> >> Most video devices consist of multiple devices (bridges, i2c devices,
> >> etc.) and unless all are found and initialized, you can't capture. So
> >> bridge drivers postpone creating the video/media devices until
> >> everything is there.
> >>
> >> That also means that applications can safely assume that if a video de=
vice appears,
> >> it is functioning.
> >=20
> > Ish. The only safe assumption you can make about this is that it was
> > functional at probe time. Anything after that is very much up in the
> > air. If the device broken after probe for example, or if we have no way
> > to tell if it's functional to begin with, that assumption is no longer
> > true. So sure, that's what applications have been doing so far because
> > there was no better way to do it, but I wouldn't qualify it as a "safe"
> > assumption.
> >=20
> >> If we add fault tolerance, and you allow video devices to appear even =
if they are
> >> not functioning (or partially functioning), then that contract breaks.
> >>
> >>>
> >>>> But here you allow partial instantiation, and how does userspace
> >>>> signal that? It must be an 'opt-in' mechanism, but how is that done?
> >>>> There are no devices yet, so that can't be used, so what alternatives
> >>>> are there?
> >>>>
> >>>> We've been discussion Fault Tolerant V4L2 for many years now, and ev=
ery time
> >>>> I raise this issue, but I never received any proposals.
> >>>>
> >>>> This must be solved.
> >>>
> >>> Is there any way to? You're saying at the same time that we must not
> >>> create the device, but that an application would need to signal to th=
at
> >>> device that it can indeed be created. It's a circular dependency that
> >>> cannot be solved on a per-device basis.
> >>>
> >>> During the meeting, we had a discussion that the media device should =
be
> >>> created as a "skeleton", and then as other devices probe they would f=
ill
> >>> in the blanks. How would that not work? Also what is your main concern
> >>> exactly that makes you ask to not do that in the first place (or make=
 it
> >>> opt-in)?
> >>
> >> Applications today assume that everything works when the device nodes =
appear.
> >>
> >> If you change the behavior, then they just see a skeleton driver and h=
ow
> >> would they know that they need to wait until all components are found =
and
> >> it is ready for use? Or what to do if some parts are faulty?
> >=20
> > I really think that this discussion is not solely about probe. It's
> > something we discussed during the meeting, but I think we should try to
> > handle "my device was broken at probe" and "my device became broken
> > while the system was up" exactly the same way.
>=20
> If the HW breaks after probe, then you get EIO etc. errors. It's very rar=
e and
> the only requirement in that case is that you return an error and don't c=
rash
> the kernel. It's accepted that if the HW breaks, the application breaks a=
s well.
> And you have to replace your hardware.

It's very rare, but it's also because v4l2 has largely side-stepped
entire use-cases. It's incredibly rare for a sensor to stop working but
not the CPU on a phone. It's very likely to happen on a car. The only
difference is that v4l2 is marginally used on cars.

> It's been working like that for >23 years (that's when I started working =
with
> V4L). This also means that for >23 years applications have exactly this e=
xpectation
> of how video devices behave. It's really part of the uAPI even though I d=
on't
> think it is ever explicitly stated.
>=20
> To be clear: I really want to see Fault Tolerant V4L2 happening. It's cle=
arly
> very useful for a specific type of use-case.

It's not clear what you take out of that discussion though then. If
you're stating that we shouldn't reevaluate ever the fact that a driver
should only probe if it's functional at probe, and then report EIO, that
means we can't handle the "it was broken before boot" and "it became
broken after boot" after the same way. So do you disagree with that
design goal and would prefer something else? ..

> But first we need a solution for this specific uAPI issue. Note that this=
 is
> now to opt-in to Fault Tolerance, but in the future we might have other o=
pt-ins
> as well that modify the behavior.

=2E.. Or are you open to letting device probe even if we don't know
whether they are functional or not, but only with an opt-in toggle?

Maxime

--phinazzthwazdk47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavXs7wAKCRAnX84Zoj2+
dn4fAYC/JDY8AKZhObf7Q/W8WYJ0pGQR7XXN3SzC8C3F9ASAmRP/hWn7/fA4OyjS
2icHROQBgKG3AffCWtHNQ601Yqp9DYljm2AnooBU76FpG/JHBRc1O1XMwXpTPdgS
qfkAl/Wqpw==
=Kltg
-----END PGP SIGNATURE-----

--phinazzthwazdk47--

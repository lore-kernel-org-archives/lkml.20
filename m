Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320230;
	b=4bchJD0AX4jqVXS9OYZsWeZJRd+KclE9dZcaGEIWTkvz5ZrXqZAyqxuXfJ2TqpWKmZzm
	 XJSBoTvZkUphnjvnxYfpvr/2WCY86FsVHfrE12T1aDVgi2YePq8PZe3dmA/DRr25Jpf8L
	 8atibqihDAqYcKFs901OZ0Tc/KObgs+kqbvDsLLU4yXnqXW+COhRNwNkFygSpV0Lkfihv
	 bh7/2nAvBWLmHO0M+cHLuckbeYHIQx7kKelofXLCpnIRCuSDr6j5RXvmM+v7psXX3245Y
	 PgA43SIPrPltJiLVDTAYmhwyHP6AjyOngi2i00TIidOpSVCc0fXh65SXOq3dI8vR0JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Q1JlDUJI5Cr+wvZH4apGh3ldcaH5uiMtQ5yIrEgM70I=;
	b=PCwA3SDFV43cbT38prdBEv0Jg1KOsbCuxuVVpVNpnp2XYkt1LqgPaLo5EMqF5P+ZKDBR
	 03Ia/s6SuDHuY3nxbUlgkeDp2AccYqYr1A7Stbpv+U2ssC0TWNn3rLCIjcWISAI0UP4Zt
	 XxE+oTaoqlpMIlm+whLhclRGeOV6m9W80lTHqbXEDUkAmgiIGMk0qeUinA7XKvbZavZ0+
	 5Lp8A14V/rUIPSmRQjjRwVqBTIqM0j0sWhllvy+G4SV1u+b27FM66zquI/rjPKZtPocmc
	 KVTkm82BuRv5kQeLzUDqMCxs2dSsWhTMZxS2IFFGkk1G/EAH9JnHql21/FAaximlkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XN/0197K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F01A606A33A;
	Tue, 10 Nov 2026 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN/0197K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EA01F008A2;
	Tue, 10 Nov 2026 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320229;
	bh=Q1JlDUJI5Cr+wvZH4apGh3ldcaH5uiMtQ5yIrEgM70I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XN/0197Kbsl3bS0d4loNWvHP3zFSp4ZM+NesLngQAu3Tf0XyEWT9bbZBbBKLQHrlT
	 t2O2roTpnMpeo4GFk0Ikw65l8JrCR4+VTpA6NWTtEK0ISh8APYigKmqDEYs4H79Fmu
	 T1DFqaf20aZh5BbmHJFwAgh1wL27zQA23TLP//PkeEHtVK4JZ4ZXwuf2c9LrijAmIk
	 uSshncFp0VAgTGMupdw7xFgJNYZxnlKgLGVSjaH1sgvtHCe/wIvUVBmiCJwNZCiQje
	 UWBFy1JJ4A8t60U0AJQf2EPZ/6YFnvapyODV6t1sfMG01SEUZv7Lm2kewkGb8Q4rKe
	 7h/RW5ykxAAgw==
Date: Tue, 10 Nov 2026 15:17:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
Message-ID: <avMgJ7MFks0sKD7T@houat>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>
 <avMM6a6xcDHT-zCR@houat>
 <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org>
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
	protocol="application/pgp-signature"; boundary="f4gycnlj27uzbn3m"
Content-Disposition: inline
In-Reply-To: <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org>


--f4gycnlj27uzbn3m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 02:30:51PM +0100, Hans Verkuil wrote:
> On 10/11/2026 13:33, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
> >> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
> >>> Hi everyone,
> >>>
> >>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kern=
el.org> wrote:
> >>>
> >>>> On media-centric camera pipelines, every entity is known at boot time
> >>>> and described statically (for example via device-tree).
> >>>>
> >>>> The V4L2 framework assumes that every entity of the camera
> >>>> pipeline is always present. This is a reasonable assumption for
> >>>> integrated cameras in laptops or phones. However, in automotive syst=
ems,
> >>>> cameras (e.g. rear-view or surround-view) can be damaged or disconne=
cted.
> >>>> When the framework assumes all sensors are present, a single missing
> >>>> camera can prevent the entire pipeline from operating.
> >>>
> >>> This series has been discussed at the Camera & ISP "unconference" in
> >>> Pragues (during Linux Plumbers)
> >>>
> >>> The notes can be found here:
> >>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus=
=2Eideasonboard.com/T/#u
> >>
> >> What is missing in this discussion is how userspace can indicate that =
it
> >> actually can handle partially instantiated pipelines.
> >>
> >> Today if one or more parts do not come up, the devices nodes are also =
not
> >> created. This is typically exactly what you want.
> >=20
> > That's very arguable? We have plenty of other examples where we allow to
> > show a software representation of something that isn't available in
> > hardware, starting with virtually any memory buffer allocation, but also
> > disabled CPUs, swapped pages, etc.
> >=20
> > For things a bit more related to drivers, things like USB root hubs are
> > also pretty analogous. The "root" device will always be created, even if
> > devices connected to it are non-functional, missing or whatever. It's
> > the primary interface that these devices might or might not attach to.
> >=20
> > So it's a bit hard to understand why the device nodes not showing up is
> > exactly what we always want.
>=20
> It's simply how V4L2 works today: video devices do not appear until
> all components are instantiated.

Sure but that's exactly what we're trying to change.

> Most video devices consist of multiple devices (bridges, i2c devices,
> etc.) and unless all are found and initialized, you can't capture. So
> bridge drivers postpone creating the video/media devices until
> everything is there.
>=20
> That also means that applications can safely assume that if a video devic=
e appears,
> it is functioning.

Ish. The only safe assumption you can make about this is that it was
functional at probe time. Anything after that is very much up in the
air. If the device broken after probe for example, or if we have no way
to tell if it's functional to begin with, that assumption is no longer
true. So sure, that's what applications have been doing so far because
there was no better way to do it, but I wouldn't qualify it as a "safe"
assumption.

> If we add fault tolerance, and you allow video devices to appear even if =
they are
> not functioning (or partially functioning), then that contract breaks.
>
> >=20
> >> But here you allow partial instantiation, and how does userspace
> >> signal that? It must be an 'opt-in' mechanism, but how is that done?
> >> There are no devices yet, so that can't be used, so what alternatives
> >> are there?
> >>
> >> We've been discussion Fault Tolerant V4L2 for many years now, and ever=
y time
> >> I raise this issue, but I never received any proposals.
> >>
> >> This must be solved.
> >=20
> > Is there any way to? You're saying at the same time that we must not
> > create the device, but that an application would need to signal to that
> > device that it can indeed be created. It's a circular dependency that
> > cannot be solved on a per-device basis.
> >=20
> > During the meeting, we had a discussion that the media device should be
> > created as a "skeleton", and then as other devices probe they would fill
> > in the blanks. How would that not work? Also what is your main concern
> > exactly that makes you ask to not do that in the first place (or make it
> > opt-in)?
>=20
> Applications today assume that everything works when the device nodes app=
ear.
>=20
> If you change the behavior, then they just see a skeleton driver and how
> would they know that they need to wait until all components are found and
> it is ready for use? Or what to do if some parts are faulty?

I really think that this discussion is not solely about probe. It's
something we discussed during the meeting, but I think we should try to
handle "my device was broken at probe" and "my device became broken
while the system was up" exactly the same way.

And while it's true that our assumptions currently deal with the former
fine, we just don't deal at all with the second, and everything you're
saying here could still happen.

So, to answer your questions, I think it's entirely application
specific. A video-conferencing application would error out or might want
to wait forever for its only relevant sensor to show up. A multi-stream
dashboard in a car would just show a blank screen and show the other
streams. I'm not sure we should (or can) come up with a policy at the
kernel level.

> One solution might be that bridge drivers capable of fault tolerant behav=
ior would
> create a /sys entry called 'v4l-fault-tolerance' (just an example) somewh=
ere.
>=20
> Applications that can handle this can find that entry and write '1' to it.
> After that the driver will start creating devices even if not everything =
is
> available. Without it it will just block (the current behavior).
>
> It's also tied to your use-case: for the same hardware your use-case migh=
t be
> fine with the current situation (non-fault-tolerant), or you want to enab=
le it.
>=20
> There might be other ways to implement this: e.g. a module option or a Kc=
onfig
> option.

Yeah, I guess that could work

> Also note that systemd opens video nodes as they are created. It used to =
use
> v4lctl for that, but that might be integrated now.
>=20
> So that should keep working. I think it just calls QUERYCAP, so that is l=
ikely
> to just work.
>=20
> Regardless, I want to see an RFC for this, demonstrating that someone has
> thought about it. If you think this can be done safely without an opt-in =
mechanism,
> then explain so in the RFC.

ACK. Thanks!
Maxime

--f4gycnlj27uzbn3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavMnWwAKCRAnX84Zoj2+
dpVIAX9KNwBIEvTOWb3p1/iAU8ZDpB0gmxXB42LjS75W+ClqR0PN8Bz2yzNOLLqA
gERdl28BgKA/oqA2cjLXGI53OZybUy76PRIpJeY4hYEU1q/1h7hewApkLKlexzTb
aphzOQRV5w==
=BM8y
-----END PGP SIGNATURE-----

--f4gycnlj27uzbn3m--

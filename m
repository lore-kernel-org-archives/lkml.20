Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314029;
	b=W6uFYaA9Tw7iScXeloWgl5YWjhZKp54w8+tE9uWVpvduAYUMRM1LIvqjPzUPAYtfMiK2
	 TBvTQzSe1ChCLTyu3JwGk8WM0VNHOjQPY6klR+K47iWC93ulApeVAjFVI2ZiUPmvdaEmM
	 gcsMaO6nujDMKBo2RxNKbWhggcLKXB/6L4U6i3KO4paH7WfwC+alHafsE+QFM+lK2iUco
	 cQAjEtF1YbI6CKT+wmHN7Vf8QJTgbRakU2i1tjhSwf391Z2Cy7SFZ2Tmrl5q4MGeLM3Lu
	 GrTkHMuw4z9yEJ392QHVc6l5rIvGMv8eKR+Wa9x/Tqs7O4UdpwJcpqrNw/WM1nxMSXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314029;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WmNL4QV81W2Gs6tb+uy5hZucWk1Z9LLXbxNQQWW5roE=;
	b=PoxbKBMaSA9ZotqBv3YmT9BrChMvNIkQBV/aWijnDcB5tEx+r3dgU5qpJLdSkQjfU4GH
	 ycaSnhFb1VEHfEBAGGfX1nVAEo4/dSl4jKtz1JnEgFh1F2uTgV5Mhg22iz6KkyMnrdmOn
	 YidxLQrD/AY5N8rLaAk1kgIi62u/CpEuIrLc7OoOHhjKooXP4K3tmEqfmSzJNqWqkIkji
	 0BHAXd8i/8EcQQAFx80+prJjDhrqxH00rMsbdRcG3OAUKSV5iXnSDHMtZq9z7vaRBpIBe
	 3lPqG89D0GKsED/rOVaYDRvjusV/e9ClbTm9rXvkqrZXwTvSWUZJM9fTNWY1NT0VS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0jkZzeZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088FD606A32A;
	Tue, 10 Nov 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0jkZzeZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298351F0089F;
	Tue, 10 Nov 2026 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314028;
	bh=WmNL4QV81W2Gs6tb+uy5hZucWk1Z9LLXbxNQQWW5roE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c0jkZzeZ2tdIGFOcBuMzQx/U8l94SJANJIx7o0FbnKb8C5HndG8OD+Z3/6E/OycCJ
	 zSHoq29PBhRXGI0ArbrnCe8Ey2zPLv/JUQXp2f32QLmwqXBsaMxIn+9AxqADAEwZnN
	 4dSBGngaLHBov5m4f3UObd1kPZ+IYjBOxWih+TnqrvRNTCIa0HMCKD9KPLPVJjANBu
	 hNK/+KcKAeWd3kLu7FG03vkcrGrDTkmm1DA+8BkAmBqit0/G1X3lkAj2NXBPqPwNrL
	 GtFQfqylVyUEtXX+lNBqV44S5ctFY1++9z05jV5y/C3skmczFTaTpkukprfxnfw95/
	 Y2GQ4UMsxy3jA==
Date: Tue, 10 Nov 2026 13:33:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
Message-ID: <avMM6a6xcDHT-zCR@houat>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>
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
	protocol="application/pgp-signature"; boundary="semxoinsofhficet"
Content-Disposition: inline
In-Reply-To: <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>


--semxoinsofhficet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
MIME-Version: 1.0

Hi Hans,

On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
> > Hi everyone,
> >=20
> > On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel=
=2Eorg> wrote:
> >=20
> >> On media-centric camera pipelines, every entity is known at boot time
> >> and described statically (for example via device-tree).
> >>
> >> The V4L2 framework assumes that every entity of the camera
> >> pipeline is always present. This is a reasonable assumption for
> >> integrated cameras in laptops or phones. However, in automotive system=
s,
> >> cameras (e.g. rear-view or surround-view) can be damaged or disconnect=
ed.
> >> When the framework assumes all sensors are present, a single missing
> >> camera can prevent the entire pipeline from operating.
> >=20
> > This series has been discussed at the Camera & ISP "unconference" in
> > Pragues (during Linux Plumbers)
> >=20
> > The notes can be found here:
> > https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.i=
deasonboard.com/T/#u
>=20
> What is missing in this discussion is how userspace can indicate that it
> actually can handle partially instantiated pipelines.
>=20
> Today if one or more parts do not come up, the devices nodes are also not
> created. This is typically exactly what you want.

That's very arguable? We have plenty of other examples where we allow to
show a software representation of something that isn't available in
hardware, starting with virtually any memory buffer allocation, but also
disabled CPUs, swapped pages, etc.

For things a bit more related to drivers, things like USB root hubs are
also pretty analogous. The "root" device will always be created, even if
devices connected to it are non-functional, missing or whatever. It's
the primary interface that these devices might or might not attach to.

So it's a bit hard to understand why the device nodes not showing up is
exactly what we always want.

> But here you allow partial instantiation, and how does userspace
> signal that? It must be an 'opt-in' mechanism, but how is that done?
> There are no devices yet, so that can't be used, so what alternatives
> are there?
>=20
> We've been discussion Fault Tolerant V4L2 for many years now, and every t=
ime
> I raise this issue, but I never received any proposals.
>=20
> This must be solved.

Is there any way to? You're saying at the same time that we must not
create the device, but that an application would need to signal to that
device that it can indeed be created. It's a circular dependency that
cannot be solved on a per-device basis.

During the meeting, we had a discussion that the media device should be
created as a "skeleton", and then as other devices probe they would fill
in the blanks. How would that not work? Also what is your main concern
exactly that makes you ask to not do that in the first place (or make it
opt-in)?

Maxime

--semxoinsofhficet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavMPIgAKCRAnX84Zoj2+
djwcAX0ZvcbRSsQN3knRt36MIbY4UOc24lmcGqFxhjnG7RoXUbNedVhfOspIfmCs
/SmnGs0BgI+/2NYQzYYtr886OgD4bvxVPrkx3SnX3+3vJOXc89gRB0j4xUElEJLC
XdkNCW5gpQ==
=/nZO
-----END PGP SIGNATURE-----

--semxoinsofhficet--

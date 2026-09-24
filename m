Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7019433A9FE;
	Thu, 24 Sep 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273367; cv=none; b=Pt3Zs6n16G9UrB9OuV+QM43kR0Ci7r27acTPiNLvvxftuALRzTE7LLbLP3Beb/gkPX9op8xiimQis6Y6k9Q+8CzQfXDLUe2Epr8RK5oavlqGqEbO0+9xnLQHNdETW1BqXz/K+21mmeyvi1rJiWKjrf/knZliUPbmlWwLC8vc0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273367; c=relaxed/simple;
	bh=DVbq6piq7V6+Q/cQjhHZNalbSD7sLko8WTH7pDEBt3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIrndBh6AT4Fprth0JmQm85Ugf2d94aWoOn+yuzgJweFBwHmz2Dqvr98AW5LSYjTLurwLAm5YeXtOqVp796cDdnJFCx4EiD+E6ZmRZVEKGcBPQY0ibDLikm4KpElYhbGSyHulwHrfOTYxz6+GK4WjpsK2imrda1HCbL0m/Q8ewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 06A4C3700EDB;
	Thu, 24 Sep 2026 18:09:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id F0D92B64BC9; Thu, 24 Sep 2026 18:09:09 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6C623B64BC9;
	Thu, 24 Sep 2026 18:09:08 +0000 (UTC)
Date: Thu, 24 Sep 2026 20:09:06 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	devicetree <devicetree@vger.kernel.org>,
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-media <linux-media@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E
 support
Message-ID: <arVnQmik-CveaAkY@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins>
 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CZn6uW8WXhqK4f0/"
Content-Disposition: inline
In-Reply-To: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>

--CZn6uW8WXhqK4f0/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> I have added your patch to gstreamer
>=20
> v4l2codecs: add the stateless H.264 and VP8 encoder elements
>=20
> Backport of the encoder work from the branch v4l2codecs/h264enc of
> https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
> on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> uses.

Yes this is the right gstreamer branch to use here.

> Generate the right element and encode stream:
>=20
> gst-launch-1.0 videotestsrc num-buffers=3D100 !
> video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> matroskamux ! filesink location=3D/tmp/t2.mkv
>=20
> And playback over Wayland.
>=20
> Solve some problem. I have implemented:
>=20
> const struct hantro_variant px30_vpu_variant =3D {
>         .enc_offset =3D 0x0,
>         .enc_fmts =3D rockchip_vpu_enc_fmts,
>         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
>         .dec_offset =3D 0x400,
>         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
>         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
>         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
>                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>                  HANTRO_H264_DECODER,
>         .codec_ops =3D px30_vpu_codec_ops,
>         .irqs =3D rockchip_vpu2_irqs,
>         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
>         .init =3D rk3036_vpu_hw_init,
>         .clk_names =3D rockchip_vpu_clk_names,
>         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> };
>=20
> I have advertised the:
>=20
>        {
>                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>                 .codec_mode =3D HANTRO_MODE_H264_ENC,
>                 .max_depth =3D 2,
>                 .header_size =3D H264_ENC_HEADER_SIZE,
>                 .frmsize =3D {
>                         .min_width =3D FMT_MIN_WIDTH,
>                         .max_width =3D FMT_FHD_WIDTH,
>                         .step_width =3D MB_DIM,
>                         .min_height =3D FMT_MIN_HEIGHT,
>                         .max_height =3D FMT_FHD_HEIGHT,
>                         .step_height =3D MB_DIM,
>                 },
>         },
>=20
> Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

Then I guess this is using register configuration from the earlier H.264
encoding work that I've done at Bootlin, adapted for the new stateless
encode helpers? That part is probably not quite trivial, which is why I
was a bit surprised.

> I have a small change only in the common part. Hope that it's a bit clear.

Yes in comparison to the register configuration code, the platform
changes are rather small indeed.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--CZn6uW8WXhqK4f0/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmq1Z0IACgkQhP3B6o/u
lQyEpQ/+IyLXFwk9YODr0WJI5I/wgdBuKj8S2gQmK7H45sYlvZfEDYQ+j4AV9wyl
cOncZklhJzTNhVkAUthAjhHyJTl0PDAwk/Smf/zc6dd72xWf77NAK0QlvBRFDQqS
kATP5MQfhKYXxnmPe5Aqbkb3xRSrxqjgnm8JbA7d/mh0R0ms8D07ekMxVHTSNJqe
Kad2GX8HvnJDM+ETEQYFm4wr4PUVMW/LMEB9yE6sFjw4wdvFw0AQaJn9GIOenIJL
S5OklJjNSg/FwO9qyLdYP+hoWn3DIxW3fHBotVZqlttgJSkCjG0SnCZbhKRhKyAu
mmRjQhQ1m1LjvPxcNsIdgP4kUoSgP6239nLbapUvYnnbl1lNh0jDQYNuWBIKs1FU
cn80fGsJxqYO3spl3pw1rCm5u+5mfAOz4rTquUfqVSWn44N5uSyjMMAHkddTUh1U
JisiR3msNZLvStkbK0syAbQnhGXpyQC8grMremDf+jGXuYYySRv3vkPK7i/S+HfT
zD3PCw3oriPh7b13A/d2CT1lW51sqkwKQacPEuKFqLm++hRJX4t65byE3OhhNpaI
NXggjvgwk1c9EZ31GVuK/fyGoQvnWk0eUuRVCMs04gVpPX0G54tEG/DQtqyjjD4Q
hCgzC339OPU4ma6H13w94ODFw4iNvUgBRZpffBAAOPyYpuzDujA=
=YnXV
-----END PGP SIGNATURE-----

--CZn6uW8WXhqK4f0/--

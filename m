Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAEA361949;
	Wed, 26 Aug 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761111; cv=none; b=OC8jd6nG5z0dngc0Kxv2rU1wJBOVGP0jZKqeJ4zbL25FlmvVwqS5hZIjXBA+rB2X02i2OBYSj90KyJ3ORBHSdN61uCsJhKyxg4xlPI+9hPC78w3vDzPF3CqNfiw98ymxnZUqhC6jpxtF8o6VdLOsphiOTzj1miMwLI4CewL7zJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761111; c=relaxed/simple;
	bh=JgCmNmmEdknMixBAGzqfFbseRYn3Sgy2kyIz7jMT1cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQz78iwh2F5RKhcqbhKkdFzHlJRuOmE0w/Waj8f4y1hUsE4CSnAdQw4erPn8ExPkCQzQ6jMSGXhC7AHVlKQWd7eNyAa8l+DlU/18G1z+eK3GPTbnRUQ/A2j/nX/lFYQXwFA2R7ML0tZb2lve/PA4busCKTrYwDC7h+1dBr1c0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jz/0/H0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz/0/H0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389F71F000E9;
	Wed, 26 Aug 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787761107;
	bh=TeZaduVBoWJpFnE0cLOMjmAhuCR7ZmaFxmj807ebBEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jz/0/H0PsmNhBHeE2PMFfKMXNUrMSuW1LQgYn1GLuoD2NqhIN8OR/ZEb72pAtR4vI
	 xSJNCATWSqkBzLOc6zp7s0g9zYWI2BKEgbzYAbKEWcATVHv1jvdmKqlDIOcTvIo1Dg
	 RSJ4c4xdGI45S/qd3NQjnbmdrInNyafc2Q10Coypu/ePQDnAsI0lm/cDou7OELyRhG
	 4MLT4g1SR2xWMSYbos+bCMmZUUBPouFFxAX/X4scmiSGoJuimto7Q11n5F5K+cKPZW
	 r7D8TYD+Q90ASuVksE/anFT36eFIKm+NT3g3qDV1lWbYROikZA3biu72LaRy5ATnl/
	 rf6kxhrBOUBsA==
Date: Wed, 26 Aug 2026 17:18:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <20260826-maverick-economy-3727a959a776@spud>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-4-cbfaaa3f0000@oss.nxp.com>
 <ao8PoOqPX7gwlm3L@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLXwz6jAJ9Z240OI"
Content-Disposition: inline
In-Reply-To: <ao8PoOqPX7gwlm3L@SMW015318>

--lLXwz6jAJ9Z240OI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:09:04AM -0500, Frank Li wrote:
> On Wed, Aug 26, 2026 at 12:55:45PM +0800, Guoniu Zhou wrote:
> > The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> > revision. It can process up to 8 image sources simultaneously and
> > obtain image data from up to 4 pixel link sources.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 14 ++++++++++++++
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index c1c16dbc1539..5b19b581b38e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -392,6 +392,19 @@ static const struct mxc_isi_plat_data mxc_imx95_da=
ta =3D {
> >  	.has_36bit_dma		=3D true,
> >  };
> >
> > +static const struct mxc_isi_plat_data mxc_imx952_data =3D {
> > +	.model			=3D MXC_ISI_IMX952,
> > +	.num_ports		=3D 4,
> > +	.num_channels		=3D 8,
> > +	.num_vc			=3D 8,
> > +	.reg_offset		=3D 0x10000,
> > +	.ier_reg		=3D &mxc_imx8_isi_ier_v2,
> > +	.set_thd		=3D &mxc_imx8_isi_thd_v1,
> > +	.format_mask		=3D GENMASK(30, 24),
> > +	.buf_active_reverse	=3D true,
> > +	.has_36bit_dma		=3D true,
> > +};
> > +
> >  /* -------------------------------------------------------------------=
----------
> >   * Power management
> >   */
> > @@ -582,6 +595,7 @@ static const struct of_device_id mxc_isi_of_match[]=
 =3D {
> >  	{ .compatible =3D "fsl,imx91-isi", .data =3D &mxc_imx91_data },
> >  	{ .compatible =3D "fsl,imx93-isi", .data =3D &mxc_imx93_data },
> >  	{ .compatible =3D "fsl,imx95-isi", .data =3D &mxc_imx95_data },
> > +	{ .compatible =3D "fsl,imx952-isi", .data =3D &mxc_imx952_data },
>=20
> It is the almost same as imx95 except model, I am not sure if model is
> used in code.
>=20
> why not fallback to fsl,imx95-isi.
>=20
> compatible =3D "fsl,imx952-isi", "fsl,imx952-isi";

Typo here, but I agree - fallback to imx95-isi would be nice.

--lLXwz6jAJ9Z240OI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8RzgAKCRB4tDGHoIJi
0hZmAQDIhGvqiGWzfAZlp7K0I6uuR31QzcGxd8YiqNs+dGB07AD49UEqj2Wt2UNU
8Lg+xrgS/YYcnJjXmm0q4ywsQ9pwBQ==
=JtDY
-----END PGP SIGNATURE-----

--lLXwz6jAJ9Z240OI--

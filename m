Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731913;
	b=cIgm548zAaDN96hwgVxMeyT7oABHMddL5xKJ0lMedtE+MhtsD9IbsV+pMf7Gq05nyabm
	 iPbGrJ27lUgTF9EPCAXBtlhk/CGgbY+Wi1LjF40sCzeIfU7PAG9zqx5dqUvcTi6331uHL
	 vcPawGPJlY0kseBEryDAQSN1olzsjWr/gMP3pU9YuYaqON4EjEnr6r88IsOpZ5f4L2sgy
	 dQCXSq4aCqsJQU4zElWmwsQu7lMfsolEwHFzVwcyU9z2F0bLpkkARGGzlI9l8AMWY0PVL
	 GJ69z2kW5r/3RcQf0qGbGZ3dlYLfFLe7n8yxWtV3VswG5xHlBhTyC0JK+b9qc8J3i1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731913;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=midAk/DARCqHylN7ToGJq8rif/JIOF4akNHrI/YCiYw=;
	b=5kyyzziWYXO+oDlJCgYL3QrqodjQ415T3UA2hPq1YIfzp/GFOWyse+M9ay0gAtxz+I6o
	 WqLbCwBl9JG/EhOBJ9wzUzY7uErF56JyXmsUNuLZgBKn8b6Hdvc5+UUug2GCVk3lTn3M2
	 JX9jAF+EjHoJAGiB62/CFweocr2tIvqTucxf51M4YjhN4SzUvuYoPKdiqMlUpwIMmRwJn
	 YvGh0sh22kVqRFhfT/xrB7cEAX63SSXy/i+V2zNFjQHR/592WmUXdQdipYxfAsOBnJPRk
	 nGCwRtbdY3A8FuTKzdLZWvmEp25gwDRwJS+FWKLJdC7JudxexWcprVeuMZOD1H/5SXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="QIRj7/NH";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEB606A324;
	Tue,  3 Nov 2026 18:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EEB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QIRj7/NH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793731910;
	bh=g4IxkDEMxXRUA4XtODSZ0Gcq9LsGsoHyYZFXVG5uJag=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QIRj7/NHxK/vLoeGe2exa22vbbxWSBeVnGgcH7Qe+chnEpEwaNHIshSim+WxBieGf
	 7dPiTxREdIbv8GkitvCEb3jf7ky2jZ9pJFhuJ9wOrdj6OIbkyCkhU1guqZsC4T2MFx
	 iEy5/80FmlGwXQ9xqrcb8lYmhhRwdXVksdh3xFDkjFG0zMpg880KyVhaOF3GS5fEBE
	 1lZYE6cByeQTjXF4QxXVzvTDVdwq400NmxMraB16ZIrPJAlkJ+/ayHpeQx3c6yMR+0
	 VZqJ6oDoTX8AAaRkMjFPr56P8KUM3ZIeoRcjzCHl5CAEm+tsnNkNqG2meY5yfoEtcy
	 TK66beyRslKFA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51BEE17E0CE8;
	Tue, 03 Nov 2026 19:51:49 +0100 (CET)
Message-ID: <5520799bbd58327a2fd3926e989735e02af64602.camel@collabora.com>
Subject: Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field
 height for field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 13:51:47 -0500
In-Reply-To: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
	 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
	 <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AZu15zRcZ1tXd1TZOkqW"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-AZu15zRcZ1tXd1TZOkqW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 19:12 +0100, Jernej =C5=A0krabec a =C3=A9c=
rit=C2=A0:
> Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =
=C4=8Das je Nicolas Dufresne napisal(a):
> > Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9cr=
it :
> > > A field picture covers only half of the macroblock rows of a frame, b=
ut
> > > the driver programs the coded and the boundary size of the whole fram=
e
> > > for it, as for a frame picture.
> > >=20
> > > Program the height of a field for field pictures, like the vendor
> > > library does.
> > >=20
> > > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver"=
)
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driv=
ers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > > index 10e98f08aafc..ca66a3c6b830 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ct=
x, struct cedrus_run *run)
> > >  	struct vb2_queue *vq;
> > >  	const u8 *matrix;
> > >  	unsigned int i;
> > > +	bool field;
> > >  	u32 reg;
> > > =20
> > >  	seq =3D run->mpeg2.sequence;
> > > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx=
 *ctx, struct cedrus_run *run)
> > > =20
> > >  	/* Set frame dimensions. */
> > > =20
> > > +	/*
> > > +	 * Field pictures cover half of the frame's macroblock rows; the
> > > +	 * vendor library halves both the coded and the boundary height.
> > > +	 */
> > > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > > +
> > >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > > =20
> > >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > > =20
> > >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.heigh=
t / 2 :
> > > +						   ctx->src_fmt.height);
> >=20
> > I'm not entirely sure, but I see:
> >=20
> > 	fsize->stepwise.step_height =3D 1;
>=20
> Where? I don't see this in Cedrus.

In the framesize enumeration, it returns a contiguous dimension set, with a=
 step
of 1, which then requires no special treatment. Other drivers uses:

  struct v4l2_frmsize_stepwise frmsize

in a static per PIX_FMT configuration and helpers in try_fmt. Perhaps worth
reminding the following:

https://docs.kernel.org/userspace-api/media/v4l/dev-stateless-decoder.html#=
initialization
width, height
    *coded* width and height parsed from the stream.

Since the dimension is coded, its quite unlikely Cedrus is correct. Most de=
coder
don't have postprocessor or croper, this is why stateless is like this. The
display dimension would be something set through S_SELECTION if this was ne=
eded
to crop (e.g. Hantro could support that, but currently don't, and the PP ne=
eds
16 pixels alignment both directions).

>=20
> >=20
> > But I don't think interlaced video can have odd height in the first pla=
ce. But
> > it also have an implication here as you are not rounding up to a multip=
le of 2.
> > Not sure what is the proper fix, but I have this impression something i=
s
> > missing.
>=20
> Odd height shouldn't exist in practice, but I'll use
> DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

I guess it makes it "safe", but perhaps feed the todo?

>=20
> Best regards,
> Jernej
>=20
> >=20
> > Nicolas
> >=20
> > > =20
> > >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > > =20
> >=20
>=20
>=20
>=20
>=20

--=-AZu15zRcZ1tXd1TZOkqW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauotQwAKCRDZQZRRKWBy
9DtXAP9zZmyQzLA4WCwgH+H/kjPGtrs4F0y7kvIl/xaSrjBk1AEAnNNR7aCDg7FQ
0h9lvSCzxwmrCo2kVaoTgcAWp0Hm3gw=
=ZWdk
-----END PGP SIGNATURE-----

--=-AZu15zRcZ1tXd1TZOkqW--

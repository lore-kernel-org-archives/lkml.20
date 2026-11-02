Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646286;
	b=gcCkcRHqW4cspFsjO9W+LaMnuc7vH4wfXhQJm3q5yv6B4cAaRffn2EpiHv40RgJ8xoO5
	 6iEkKx41JasBZJOjfUAx10CJMvmGAPBG40SrbjwVFb3UjBVtuo91PU1wZT6sHLV+oEFH3
	 sEkEpQ4MJf5aGQZN1FKy2HbhUoInd0mci0CGi3KwowWE+GIko207T5yV8qywvyUTRxyC4
	 ce5TTM2J2wasd6xZMMchcVVGSF8VasEjrRGM6Xr5C3AlWqXZIasqlG0viEGDDXyML0OGb
	 INOjCWCNcP3ulr8VBO8VyxFJRm9dOW+RGk0hkkGbxMv+aDrvFpQsHNG3vkq7zz9RlaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646286;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=7OJaoJHgx2GzzDd0wBdvqi7D9JZvRZGfZ3cOJLVNOIg=;
	b=IFUglmIIAqW90rmsMJw+CxvNcE3lXY39L+FWBKZAjKKde2k0G+wTgf0XbyZwvpo+MoxI
	 yGalcPkUiSzrn6kkeX7vIy/QkmROQ2L9X6jIxQ0/oiRk/vXIMcJfWl20VOy7phS/zKGeC
	 BJTxDBGy+UrH91eU8IyS3joPyjVgP9lBCwNwMAfwB3YAuYOHui/0/yCXmChQpG3w19dbJ
	 rkDRYy+ty8neTD5zR+JRQWKmSZ0+bTnaRMU7ib9wL7N57VP6MjdP4riYYfYNW13ymGvtQ
	 jsDOuxfCWGV4IyqzaEyfXiNrqu9Nw9Ki5jj3W6amA5UhjU1fwdsgg56It2WB1n7kI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QiJwjxGK;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF625606A326;
	Mon,  2 Nov 2026 19:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF625606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QiJwjxGK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646284;
	bh=C+N3AeR5hg2ytjeyH4W6gOYQhyf8r2d4UKcvMhRy1z4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QiJwjxGKiuzRahVoyMzU5SyIhQaK8mgHGJu3C1WdCwm9GTmEjx6So+w7wBCRKBN+9
	 lZ5oarghRG3A9D9I/0VZtBk+W6xJTh0ComdhBFcFHOdsNGwJ9vx71mGgeZH5WFTKO1
	 wFqUbjdOxvi9IUt1VBqlYwT5jK1s6oAe+SU9A/cnB1tXr2TxRM+yv7gUOUINaLHMkK
	 vneYBGKrGY0GntHBndGRK4xGcOkW4YeM7yO8s38sSNGrwMVlRdBVVc/57+kBhcSP4m
	 Rj8w9ZbHE0hD6UYGhWS/DsEj1KYDuP2h+0wMHeASXsAMYUHhvZr/J8ZBpW8Nb4Jl5S
	 g6r8muUOb6FbQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75A9E17E07EF;
	Mon, 02 Nov 2026 20:04:42 +0100 (CET)
Message-ID: <3aea33aba09e7696137df25d621b9f1f61263405.camel@collabora.com>
Subject: Re: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:04:41 -0500
In-Reply-To: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-8-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-kzIlL7zZnNiNzYsIj0Ze"
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


--=-kzIlL7zZnNiNzYsIj0Ze
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A VP8 key frame can change the frame size. If userspace doesn't
> reallocate the capture buffers, the hardware writes and reads past the
> buffers, which shows up as IOMMU page faults and decode timeouts.
>=20
> Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 45deebddb630..756243795de8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
>  					  height))
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_VP8_FRAME) {
> +		const struct v4l2_ctrl_vp8_frame *frame =3D ctrl->p_new.p_vp8_frame;
> +
> +		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
> +			return -EINVAL;

This is affected by my previous comment, let's discuss over the other repor=
t
first.

Nicolas

>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		unsigned int bit_depth, max_depth;
> @@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] =
=3D {
>  	{
>  		.cfg =3D {
>  			.id	=3D V4L2_CID_STATELESS_VP8_FRAME,
> +			.ops	=3D &cedrus_ctrl_ops,
>  		},
>  		.capabilities	=3D CEDRUS_CAPABILITY_VP8_DEC,
>  	},

--=-kzIlL7zZnNiNzYsIj0Ze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujeyQAKCRDZQZRRKWBy
9IqGAPoC6fM1L/1ZfNyQBC83a/SNL7rGLwLzEEGJT9Zo48jjkgEA8jwnSm2jXDOH
YkBEh/HriQ/7ez5trmMvNeCBdwMaKwE=
=hacm
-----END PGP SIGNATURE-----

--=-kzIlL7zZnNiNzYsIj0Ze--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=WaNDjdZ1BZX72DF244sekho0XSlMprNIre0vUvKDuniVrMeclxGqPIdPgX3S0BlBwGLL
	 Ajmjj7y4wBtOFJ/qrm5V1yzVhs2bzuX/gmyozYadf8Dj5mc6pRBW8iSG3FbXuqAV+bctu
	 9/vQoFgmeGp7ZbWnAtDYti1S8YKW1NFa0wYU5fUVX5u0MZiVPqyGwGl2BwfXtC0TuMos/
	 O0IGKD8tpLRBpwkRRlhSzdt2zIdur2M6bAgdg3rPPDKsguS9baYiDwyyKNrLxRZ77JiCF
	 9DCwrx3p20a3dueStXhXy4bOR2yM7KYJjoKiEVZhcLFvhkpEXajMxbiN6qROcsHLuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=IpJrp3N4n3cXTcMWGiDBwAKw8MhlspUrUrRVTsA/62c=;
	b=Yhlaiz2hc80VL39J+XUvosaA/33jAcXTB2raJoL1IbY4h9bdaC0+zZcjGXeN5nKkyU8f
	 G3B0iz/WWXolqj/Rnutx56G+vMh9TnvxULCMzzrU2Xg6STFLHx4g5pW9Jpol/ZU+iFm0o
	 EmXI9hEz1VBvCcQjjdKtkr7fUhe0bfLb6sSzBb37dEmyHZ3audPDKSZKRanXTPo7YrbBq
	 5CxsYWMqtoMv9stcwvIlaoUK+A3Ui2vRT6wPMcCstoGXpuRTofi1Q/h91MDDWtXjGZYcW
	 NQ/kHWmwRKzF4qkHY3ff3NgHArLocar7YwNc5X2JvKfkbfcgtkka4EU7bVrVktH7f+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AT8Tz8je;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0C606A33A;
	Mon,  2 Nov 2026 19:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A0C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AT8Tz8je
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646024;
	bh=7+cVgQKAwNDl4tvndFXaFuD+9S20VGeyFcozWWAl4/8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AT8Tz8je60MbshoZd0M6PPDwIC3OIL0QoKhsTdkYU2mblDuoMqkdO0UsSzymVYs8y
	 vYRRgg5hAHEsF/59SuSizZ36ZvQUWgxMHJ3i5I0h+3Ap10TIISaCnmfMEMomDGyHXI
	 rnFVEYOb9LudeS/0jtN0yJ4A75F3HOlZntZ/OGiIEVVjU+yzUxUhV7CN7GKlQYlX8Q
	 WIId5QEu02g9zzP0DAwyf+9hNXguNJSTGknY6jqP74PzHJgAr/F0ZsR1St3ayDiM75
	 6ox6d1XwXDs5VcRkrfYXCl4GhpNtvgdMth4gaQq2w+hOohg3AEGz6/MmN5DzP7XkpH
	 ap4moRcGUxzaA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31C8617E038E;
	Mon, 02 Nov 2026 20:00:22 +0100 (CET)
Message-ID: <dd7046d1ca454fa53b51d0cd122f96ad05c7a2c2.camel@collabora.com>
Subject: Re: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field
 order of field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:00:20 -0500
In-Reply-To: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-6-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-WApOxz+sTMoS9JafJBm/"
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


--=-WApOxz+sTMoS9JafJBm/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The hardware uses the top field first bit of the picture header to tell
> the first field of a frame from the second one. However,
> top_field_first is always 0 in field pictures, so userspace passes
> V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
> every top field first pair is predicted from the wrong reference.
>=20
> Detect the second field in the driver instead: it has the opposite
> parity of the previous field and is decoded into the same capture
> buffer. This works with unmodified userspace.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Its quite likely other MPEG-2 decoder are affected. Would have been nice to=
 pass
the picture structure explicitly in the decode params in the first place. N=
ot
your fault.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index 54f867949fba..a523b56a9b8c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -144,6 +144,11 @@ struct cedrus_ctx {
>  			void		*entry_points_buf;
>  			dma_addr_t	entry_points_buf_addr;
>  		} h265;
> +		struct {
> +			bool		pair_pending;
> +			unsigned int	pair_dst;
> +			u8		pair_structure;
> +		} mpeg2;
>  		struct {
>  			unsigned int	last_frame_p_type;
>  			unsigned int	last_filter_type;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index ca66a3c6b830..4c8accee5389 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  	struct vb2_queue *vq;
>  	const u8 *matrix;
>  	unsigned int i;
> -	bool field;
> +	bool field, tff;
>  	u32 reg;
> =20
>  	seq =3D run->mpeg2.sequence;
> @@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
>  	}
> =20
> +	/*
> +	 * top_field_first is always 0 in field pictures, but the hardware
> +	 * uses this bit to tell the first field of a frame from the second.
> +	 * A field is the second one when it has the opposite parity of the
> +	 * previous field and is decoded into the same capture buffer.
> +	 */
> +	if (pic->picture_structure =3D=3D V4L2_MPEG2_PIC_FRAME) {
> +		tff =3D !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
> +		ctx->codec.mpeg2.pair_pending =3D false;
> +	} else {
> +		bool second =3D ctx->codec.mpeg2.pair_pending &&
> +			      ctx->codec.mpeg2.pair_structure !=3D pic->picture_structure &&
> +			      ctx->codec.mpeg2.pair_dst =3D=3D run->dst->vb2_buf.index;
> +
> +		tff =3D (pic->picture_structure =3D=3D V4L2_MPEG2_PIC_TOP_FIELD) !=3D =
second;
> +		ctx->codec.mpeg2.pair_pending =3D !second;
> +		ctx->codec.mpeg2.pair_structure =3D pic->picture_structure;
> +		ctx->codec.mpeg2.pair_dst =3D run->dst->vb2_buf.index;
> +	}
> +
>  	/* Set MPEG picture header. */
> =20
>  	reg =3D VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
> @@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	reg |=3D VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision=
);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_struc=
ture);
> -	reg |=3D VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PI=
C_FLAG_TOP_FIELD_FIRST);
> +	reg |=3D VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPE=
G2_PIC_FLAG_FRAME_PRED_DCT);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4=
L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
>  	reg |=3D VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_F=
LAG_Q_SCALE_TYPE);
> @@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx=
, struct cedrus_run *run)
>  	return 0;
>  }
> =20
> +static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
> +{
> +	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
> +
> +	return 0;
> +}
> +
>  static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> @@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 =3D {
>  	.irq_disable	=3D cedrus_mpeg2_irq_disable,
>  	.irq_status	=3D cedrus_mpeg2_irq_status,
>  	.setup		=3D cedrus_mpeg2_setup,
> +	.start		=3D cedrus_mpeg2_start,
>  	.trigger	=3D cedrus_mpeg2_trigger,
>  };

--=-WApOxz+sTMoS9JafJBm/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujdxAAKCRDZQZRRKWBy
9FEyAQC8/q6Nd1DoHPrJt6RmqNj59GInV2qqqrnhS3ndvJGV7gEAs9tcUUCE4igf
xOK38RK8vM8z6QMV9E8zb/YjVh7zLAs=
=xRX+
-----END PGP SIGNATURE-----

--=-WApOxz+sTMoS9JafJBm/--

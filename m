Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646939;
	b=zS0clcaLstSKCv+q5HHmvSaeFznbEgTNlCQDmoXZlBkKQoeIb+IrkqQzw7bd6p76Pt5I
	 yvH16oK7Az7lmhMWqLo2gAlmqY07xnwslEvALSLA5TfTP6JNXzieHKmQRREH+HbI/Ip8z
	 DIVAEgjuzg4ApF8qF5KN2dSfwRpBx3IbBV1ZmP8m5n++MPai4h3fxogOGkfdO/fWcm2Fx
	 kT/zaJPR/6fDiene0v1ZHcPrALUav5FYA/caMugHCuX3cn62ObPlozn6vRgqephyAZqEt
	 jlsCsEa0xhR2kNBVQV3bT01AzTB1qGm3oes/GRTCSUqRmnd6ogH6Hi4Jn3zaEB6sr+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646939;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=DIPqP7gi47CnCUVbaUeSaa4AKRfzLYhpSnAXGZmxHTE=;
	b=yrdAo+8W1KFWy1Sd5sA1JbxXODX/w2LkcRSYcae7DHQxFNTwfkeEwadTg1pzfKCJA63U
	 Ju5NeHsc1qmsdFk+aXMC5P0oDnJ+WtQG2xK5VQ86G6tmflmvS6Kwc4tX2TrZ8+zKorMBg
	 Po/lrDeZVYmoyrWgjHeyKkscjtySOTJ236OwEbeEmV6kY2pOCFP+p9gdKXP+gVp3M8eft
	 BQKWtJSkATSxdkztFLPLtEjtde/gQ2VXBT5vXp43OriK7MtWvPQMSiNPThlZf3J9UidHJ
	 YTp/VoM+jCwOJY4cdnGxfgbVKgWkpe4qcDX1NPf7R2ww8oWLAUVZKazMYJV35wRWaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NAR7jFb0;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A2606A337;
	Mon,  2 Nov 2026 19:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5A2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NAR7jFb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646936;
	bh=Nbbszuc4cqTH/2OVCKA2NFWpdZdIw/mf+sQeosPEgAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NAR7jFb0YSYZB3cRjXDhpxMO1Q2KD/+YsrtGxk/8lKcWYbYESKuPGuCpYe0fUBPxt
	 gdSC9Mp74jAp0pb5tGFBkmaMD3DhwCpHdlN75ZLQrq+9lL4vTGYbfzTXFL+L2Ystq7
	 SYxKYD1hShaNNcjR0iQJlZjSj/MTk1VI2qzo3J/g4lyalFdrWVl4/idLW4gSsvdaxi
	 3ds7OeZhMZ8DssMy+OvpL+oR7Jm7p9yTMpb/wHtYatjO85fLSEXlsIWoS/UkmPH0kK
	 EoVEmpBDO3xcUj6w7QYjP/vESDKt+HjxUOX2kS/Nvp5LRfWANkOSbrQxze6AV6BoO7
	 IazNtMY6BV9XQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD33E17E003A;
	Mon, 02 Nov 2026 20:15:34 +0100 (CET)
Message-ID: <a52aacb2e0475d5d4a248acb0d385e8d7f5ef019.camel@collabora.com>
Subject: Re: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider
 than 2048 pixels
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:15:33 -0500
In-Reply-To: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-11-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-al3UBxtaGnl/gweWbDkj"
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


--=-al3UBxtaGnl/gweWbDkj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> Above 2048 pixels, the deblocking and intra prediction row buffers don't
> fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
> The vendor library sizes the deblocking buffer as 24 bytes per column.
>=20
> Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
> bit-exact with the FFmpeg software decoder.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index d28fe91562d1..ca4efa9302fc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -156,6 +156,13 @@ struct cedrus_ctx {
> =20
>  			u8		*entropy_probs_buf;
>  			dma_addr_t	entropy_probs_buf_dma;
> +
> +			void		*deblk_buf;
> +			dma_addr_t	deblk_buf_dma;
> +			ssize_t		deblk_buf_size;
> +			void		*intra_pred_buf;
> +			dma_addr_t	intra_pred_buf_dma;
> +			ssize_t		intra_pred_buf_size;
>  		} vp8;
>  	} codec;
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 6b00efa77c22..954c0ceb98ed 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
> =20
>  	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
> =20
> +	if (ctx->codec.vp8.deblk_buf_size) {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
> +			     VE_BUF_CTRL_DBLK_MIXED_RAM);
> +		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
> +			     ctx->codec.vp8.deblk_buf_dma);
> +		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
> +			     ctx->codec.vp8.intra_pred_buf_dma);
> +	} else {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
> +			     VE_BUF_CTRL_DBLK_INT_SRAM);
> +	}
> +
>  	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
> =20
>  	reg =3D slice->first_part_size * 8;
> @@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
>  	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
>  	       prob_table_init, sizeof(prob_table_init));
> =20
> +	/*
> +	 * Above 2048 pixels the deblocking and intra prediction row buffers
> +	 * no longer fit into the internal SRAM. The vendor library sizes the
> +	 * deblocking buffer as 24 bytes per (32 aligned) column.
> +	 */
> +	if (ctx->src_fmt.width > 2048) {
> +		ctx->codec.vp8.deblk_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 32) * 24;
> +		ctx->codec.vp8.deblk_buf =3D
> +			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +					&ctx->codec.vp8.deblk_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.deblk_buf)
> +			goto err_probs;
> +
> +		ctx->codec.vp8.intra_pred_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
> +		ctx->codec.vp8.intra_pred_buf =3D
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.vp8.intra_pred_buf_size,
> +					&ctx->codec.vp8.intra_pred_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.intra_pred_buf)
> +			goto err_deblk;
> +	}
> +
>  	return 0;
> +
> +err_deblk:
> +	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	ctx->codec.vp8.deblk_buf_size =3D 0;
> +err_probs:
> +	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
> +			  ctx->codec.vp8.entropy_probs_buf,
> +			  ctx->codec.vp8.entropy_probs_buf_dma);
> +	return -ENOMEM;
>  }
> =20
>  static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
> @@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
> +
> +	if (ctx->codec.vp8.deblk_buf_size) {
> +		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +			       ctx->codec.vp8.deblk_buf,
> +			       ctx->codec.vp8.deblk_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
> +			       ctx->codec.vp8.intra_pred_buf,
> +			       ctx->codec.vp8.intra_pred_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		ctx->codec.vp8.deblk_buf_size =3D 0;
> +		ctx->codec.vp8.intra_pred_buf_size =3D 0;
> +	}
>  }
> =20
>  static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)

--=-al3UBxtaGnl/gweWbDkj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujhVQAKCRDZQZRRKWBy
9KdyAQDZU0e4+bmf99HvWpWSNByerV75EjcL3AWAST8ccZA4JwD7B9t/sUhUPZM7
rf9dHqLu6L2gtkyaySdnQ7Cn2ljdzwc=
=fR3M
-----END PGP SIGNATURE-----

--=-al3UBxtaGnl/gweWbDkj--

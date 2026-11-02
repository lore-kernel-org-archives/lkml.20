Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646199;
	b=xoOBq9vDcfkmjViWWSe3bqBS1DxmRz642ruHBuu4GVUWQBOqWQqVp1lM3tsSWUTIRBBh
	 FQgC8eMOgoynPmJf2BFo4fZ7KaxuO2x3YTXJ8HMdk9YDl7QNVDClxHGeXDmH8E4vSrAs0
	 8+mCIXaUdhrTLxq8x7ISXiDx06a/5fq8+MY/NdArG/GlvwJtC1IvLbkteQsEhf5XMBkeB
	 Ced8O5MJ2fgd5Di6e6H6pCC8Iik2NwkoGli9/7RY+oMyqAK0qj3AwkiYKIk+77TlrxuSc
	 pVGQUEEnSOJzG8k5ccGGlHeRYA2ec6weQIgmXnBDV+vheJEVPAv1npSkM8ObSN5m9BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646199;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=CX4y91oCS4X6RsvbXPen90jyyXJyF7CCD61h0ekNQwc=;
	b=ACuV/aBkkmngYIaI9z/TtOKiw8UEpekiR76SY/UMGuSiKeQiQ4hXw6VG+z9ZCCl38a5G
	 Vvs2xP5jk5ZFVKFf/DGKNPqvSJYHriygq9ONOMERMss8kszSaSbtVWffU3oDXatLATgk9
	 JWlJ5RRS+AzsN7YDi0wZpQqaND/SD5V1knUaphPD/r6+r+7TQCopc0rxlVtBm1Z4u3jmy
	 rW9s6c3Wt+jWVXuMHlwJpOFDyVOq/uH6ShN4Znw6HZHnC9U3RAgiYcSVYJGfPj2rWrMPq
	 LcBPQyC0iBzxJ5dq9fQMGSw2Uf/SR/t9tjma1UUykDyZcMS/Sga9UGL8HAgmqobOw5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VyGtwxG0;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC9606A327;
	Mon,  2 Nov 2026 19:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CC9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VyGtwxG0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646197;
	bh=IWtvRXFF6VmkuKKK6g4FsEq+PzfJvMm8gmMONaMJar8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VyGtwxG0sSBNmwsEpkBWQ30njRSws7Fj7ubr5g5gfpduPk2j2lBW4Bg1cX0AFyZdu
	 TNGDBaob+zAaq9lgfzLk+3IOUJBvn2iLZMOtbeVlwArfIgjArp7xmLBu5pOZhus/fP
	 fGqA/TcPjSbQimcydcTPfQI7ORbqbGL6djGYAW5GR4dXRI19y7eZppStJ9qsVWQ35o
	 8V6ARHAsmVx1PjyFwvvRdJIqO0OYY6O0XJm3hly0LyX3O7/fK0AAaLza7Sa3m8GpXt
	 bCuCixnyJSKWHRdLh38y28KXTVp80L2y7232Al6srBgpcBmiQwvizpPI7xUvjejrep
	 kVO3dTsIPIyhw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A0E0817E07F6;
	Mon, 02 Nov 2026 20:03:15 +0100 (CET)
Message-ID: <feee5706d6a1e66dc50c21614fdf0469342befc2.camel@collabora.com>
Subject: Re: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references
 of field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:03:14 -0500
In-Reply-To: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-7-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-YZXbPAR+wWFJqah0WQvL"
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


--=-YZXbPAR+wWFJqah0WQvL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The second field of an I or P frame can be predicted from the first
> field of the same frame, which the hardware takes from the backward
> reference. The driver programs the backward reference passed by
> userspace instead, which doesn't point to the frame being decoded, so
> the second field is predicted from the wrong picture.
>=20
> Use the current frame as the backward reference of I and P pictures,
> like the vendor library does. Also fall back to the current frame
> instead of address 0 when a reference buffer is missing, so the
> hardware never reads from an invalid address.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
>  1 file changed, 22 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 4c8accee5389..0a2f8e77fb29 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
>  	struct cedrus_dev *dev =3D ctx->dev;
>  	struct vb2_queue *vq;
> +	struct vb2_buffer *fwd, *bwd;
>  	const u8 *matrix;
>  	unsigned int i;
>  	bool field, tff;
> @@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ct=
x, struct cedrus_run *run)
> =20
>  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> =20
> -	/* Forward and backward prediction reference buffers. */
> +	/*
> +	 * Forward and backward prediction reference buffers. As the vendor
> +	 * library does, I and P pictures use the current frame as backward
> +	 * reference: the second field of a frame predicts from the first one.
> +	 * Missing references also fall back to the current frame.
> +	 */
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> =20
> -	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
> -				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
> -				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
> -	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
> -				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
> -				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
> +	fwd =3D vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
> +	if (pic->picture_coding_type =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_B)
> +		bwd =3D vb2_find_buffer(vq, pic->backward_ref_ts) ?:
> +		      &run->dst->vb2_buf;
> +	else
> +		bwd =3D &run->dst->vb2_buf;
> +
> +	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
> +		     cedrus_dst_buf_addr(ctx, fwd, 0));
> +	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
> +		     cedrus_dst_buf_addr(ctx, fwd, 1));
> +	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
> +		     cedrus_dst_buf_addr(ctx, bwd, 0));
> +	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
> +		     cedrus_dst_buf_addr(ctx, bwd, 1));
> =20
>  	/* Destination luma and chroma buffers. */
> =20

--=-YZXbPAR+wWFJqah0WQvL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujecgAKCRDZQZRRKWBy
9BK+AQCDH54gcF4YDMxujVSz7o9opPm5JnaiHGLjqlcvafVZ2QD9HTyF0xiado/u
5TvCWrlgd1mFralXkVMfG9vP8ymhNAQ=
=ftEY
-----END PGP SIGNATURE-----

--=-YZXbPAR+wWFJqah0WQvL--

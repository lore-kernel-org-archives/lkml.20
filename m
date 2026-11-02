Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645084;
	b=kfjf0rfzD3F9eLkKJWpBdxnx4XCv6Z9KnWzaYE2JY3LMdQu5Bf2ezja00/PukfynHVRL
	 2n7VQmul6GCbVGVVLB+PMk4n17X/epabGNLR3iemXKYznK/ehh6bxXCqSyes2iP+OSWL7
	 anATqQLTYcVSQANS3QpUHxaUyF21U4zGTzsv1ohf4oQj15REyPzEF9ZSrWhL/f3il7z4E
	 JN0WpiR3fUG5aDeX/PdGBzSh680wJV3UMWqnX2CyWk6B0YOk8N06rPRgYYxAKJswVVXdf
	 Coca2Iq32QpJKb16pQUS8Mx57WgCQQgrG5psLWMDu3JZwSv0zN3Dk9x533Inp4OjlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645084;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=x6A8HN508TRpSqR/G7vD7jQ2gadLqTKijxxngFC1xs0=;
	b=0/QTtXA6GkUWo7ax2PCaBeqHYG4WI02rnrdz7RUxGldSftWVuypK/vJryowZ49aljH3o
	 N7chg2z3Hq/T4I1pIhJNi380aowC8VlYZcu3O+mbzAH5tjECfekPEdUVVbMR4JjWKA72r
	 Qu83nmLBCz9iN/EYLgmHPcsNTFsXpwNCQDFIB17LK+IE7SkpaZWPTWddCcYqt4Vzb1i2g
	 mzYeHsFNdccwCQfhYOst11eqrnltm6qBWhzQ+Nm9iZse5E8bcbMl1SHXqoekUQa/fG3TH
	 3u+3WIdOqnAfAeKHGve3PWG4x7T4xqcsAUIYGkgyDZaz1b4h6+sQq1Rr+ysbcXyfDNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YgRUXJxT;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11519606A326;
	Mon,  2 Nov 2026 18:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11519606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YgRUXJxT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793645081;
	bh=dE/dxAGf/5dlo74VuH1qHMlbasoG0e92NggE0JMisVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YgRUXJxTv3VdB2I+rSQZQXq8gviYr5gZq5dOYl+L+oJhaIhWYz2f07KwCk5bgyudu
	 v4Dnll71qbQrBy+e8HnJK8SkuF4dacci7yg/IxIBWoVSSI9mllPSOv02M7KxtWUb/d
	 uDHQ74dNQ4DO2yCa2TOKTpi6AsPXhtA7Uuv8NABifPy5731cMxQMvmCpHtzF14GpFl
	 6WCA5/bf+cr10tkV1SyDSj7yQiiSfNnB57sfdHfQOeyTnonLup/IWP3dvniAVq0nD2
	 7DuB+iExtOjuPIpy8PKY6FjGNPIVOZdpItFdL1OOITNNqF5j/++u8mxqB743ajRPTD
	 d3/o739O5+Seg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77ACA17E07F6;
	Mon, 02 Nov 2026 19:44:39 +0100 (CET)
Message-ID: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
Subject: Re: [PATCH 02/10] staging: media: cedrus: reject too large
 H.264/HEVC SPS
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:44:38 -0500
In-Reply-To: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Vy+jkNv142A0aYW5E0HP"
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


--=-Vy+jkNv142A0aYW5E0HP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The hardware decodes whatever picture size the SPS describes. An SPS
> beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> are allocated, makes the hardware overrun memory and hang. On H616, the
> JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> 4216x528) leave the hardware wedged, so that every following job times
> out until reboot.
>=20
> Validate the SPS picture size in try_ctrl. Move the size limits to
> cedrus_video.h for that.
>=20
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
>  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
>  3 files changed, 44 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index c3331b4f3f02..45deebddb630 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -28,10 +28,38 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> =20
> +/*
> + * The hardware decodes whatever picture size the bitstream headers desc=
ribe.
> + * Reject sizes beyond the hardware limits, or beyond the capture buffer=
s once
> + * they are allocated, instead of letting the hardware overrun memory an=
d hang.
> + */
> +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 =
height)
> +{
> +	struct vb2_queue *vq;
> +
> +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> +		return -EINVAL;
> +
> +	/*
> +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> +	 * formats pad the buffers to at least 16 pixels in both directions.
> +	 */
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (vb2_is_busy(vq) &&
> +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> +	     height > ALIGN(ctx->src_fmt.height, 16)))
> +		return -EINVAL;

If my memory is correct, Hans rejected this kind of construct in try_ctrl,
because if you are only doing try() it shouldn't fail like this. Instead we=
 can
validate in the real s_ctrl, but I believe the downside is that it makes th=
e
error asynchronous when a request is used (perhaps that's actually wanted ?=
)

Nicolas

> +
> +	return 0;
> +}
> +
>  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
> +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_ct=
x, hdl);
> +
>  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
>  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> +		u32 height;
> =20
>  		if (sps->chroma_format_idc !=3D 1)
>  			/* Only 4:2:0 is supported */
> @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +			height *=3D 2;
> +		if (cedrus_check_pic_size(ctx,
> +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> +					  height))
> +			return -EINVAL;
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>  		unsigned int bit_depth, max_depth;
>  		struct vb2_queue *vq;
> =20
> @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			/* Only 4:2:0 is supported */
>  			return -EINVAL;
> =20
> +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> +					  sps->pic_height_in_luma_samples))
> +			return -EINVAL;
> +
>  		bit_depth =3D max(sps->bit_depth_luma_minus8,
>  				sps->bit_depth_chroma_minus8) + 8;
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index adc7f255d7cf..2521315abdb7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -29,11 +29,6 @@
>  #define CEDRUS_DECODE_SRC	BIT(0)
>  #define CEDRUS_DECODE_DST	BIT(1)
> =20
> -#define CEDRUS_MIN_WIDTH	16U
> -#define CEDRUS_MIN_HEIGHT	16U
> -#define CEDRUS_MAX_WIDTH	4096U
> -#define CEDRUS_MAX_HEIGHT	2304U
> -
>  static struct cedrus_format cedrus_formats[] =3D {
>  	{
>  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.h
> index 8e1afc16a6a1..367e52158f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> @@ -22,6 +22,11 @@ struct cedrus_format {
>  	unsigned int	capabilities;
>  };
> =20
> +#define CEDRUS_MIN_WIDTH	16U
> +#define CEDRUS_MIN_HEIGHT	16U
> +#define CEDRUS_MAX_WIDTH	4096U
> +#define CEDRUS_MAX_HEIGHT	2304U
> +
>  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> =20
>  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,

--=-Vy+jkNv142A0aYW5E0HP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujaFgAKCRDZQZRRKWBy
9GApAP0cwQdda+CAhJmitoR5/UU25ugUyIbeyeggtB4u1qxsSAEA4ttPDgjqzTMX
nhFkFQM3gNbr3NOjrgd1nDwpzxmOEgo=
=8N4Q
-----END PGP SIGNATURE-----

--=-Vy+jkNv142A0aYW5E0HP--

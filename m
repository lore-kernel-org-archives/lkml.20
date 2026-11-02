Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645451;
	b=YFcm6SLHd8A0juYWJhg2mTMeOJuI/hr4oG3t7qwNKi/dC2MVmuXDXKYenvREo6jn7E6E
	 WXYZ8zkslPBDfwNgGZtvjB7V6YRx5k5xejjVNDpK6ItapRJv3YE2nHVXVi+i0EyHJplkt
	 fi611B+HV67d1vLhksdBSSduvJdQeyIEwONIPDZAg236pMD/XXr75xBlff2DVvKcDuZ09
	 joMK2PZNjg1qbd85h1J+lugpL0p7WglaLzP8viw7/7kxkde9P+67r3Uv9b3/eYkC4c3r/
	 Wav5ZV7AvmmU5c10kAo/0RDh/PJNVeGVGH614ZnXruTSau3aiM5VFT9SEO+Ek1xX56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645451;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=QyPdtmG5O4gEWYHR8b+vQVbdQt/9/X9eHrm6vneitHQ=;
	b=zEAu79r6VFtSjn1YOetUDgQj1tuDUmxnaBeAcz1WmFMTSp+rCL+ETi8GqUcbYuc7qXnJ
	 Uq3LsynXJ1iraSyDtmxK/2/WME9Ajlqe/GUzMTcrP3xm2BA9mid/9EH8UL/6OBU4/vDCb
	 9DoQjU5upXTAn0JJ18wqdGwLAdOkn5hLwKYoucfaEwOzOOdD9ttvlQWNK1Pkh8c26mjt7
	 y3srbTiuO/fkZ+0tlkioBwWup5A4O7oxElkc5F9VNe8wt1egRkHwUaRXS3CMC+lY7gTic
	 LLI5Nuuvm1bxWOLhILc3fSPQJGI7BWRZojEg0IjAS7BRSfF9VbGpUxKIxG1DAwSuZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mwQDZAy2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A3606A326;
	Mon,  2 Nov 2026 18:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mwQDZAy2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793645448;
	bh=qzBA81ShHldLD90swJaBtt/OtYkjLtWwLi/hFMBaL1w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mwQDZAy2e8wjzC96ZVB68kI/dOcz+M7DGj8Iepm62/0fy5v7sOwlYDmtChSXEfyhW
	 1k9L9jD1HiXRy39gcuSiaJQT9pCfe/1NN6ngeUHPrDKGK+8gIFYDxwjxmQ4l3EHZrn
	 xEwkW0H6u24W7W9Nzy35N2SQOIjtTGOkdFGjEOHbe4voNb84uglo58LcvR0IMgPx8D
	 D6x4dkw8x9Od/vxSSwrq/1ky21TK8YtOup51OKpLedw21NgxYODQqJYXoaU5Cjb4+Y
	 YB3AsjErr5rzxc3/JKYsaaFI+mFnl0p23jGxDO2ltE06SyiMYvgjIWeGUJl5DnrgAp
	 2tD+gZNB/+xpw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DDBD17E080E;
	Mon, 02 Nov 2026 19:50:46 +0100 (CET)
Message-ID: <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
Subject: Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term
 references in the frame info
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:50:44 -0500
In-Reply-To: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Ylgszz8oLP7hKDIiQWGA"
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


--=-Ylgszz8oLP7hKDIiQWGA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The frame info of a reference has a reference type for each field, in
> bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
> long-term reference. The driver never sets it, so the hardware handles
> long-term references like short-term ones, also where they differ, like
> in temporal direct and implicit weighted prediction. The vendor library
> sets it.
>=20
> This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
>=20
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
>  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 892193c12b2f..a716955655f7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ct=
x,
>  				struct cedrus_buffer *buf,
>  				unsigned int top_field_order_cnt,
>  				unsigned int bottom_field_order_cnt,
> +				bool long_term,
>  				struct cedrus_h264_sram_ref_pic *pic)
>  {
>  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> +	u32 frame_info, ref_type;
> =20
>  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
>  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
> -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> +
> +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> +	pic->frame_info =3D cpu_to_le32(frame_info);
> =20
>  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
>  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1)=
);
> @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx =
*ctx,
>  		cedrus_fill_ref_pic(ctx, cedrus_buf,
>  				    dpb->top_field_order_cnt,
>  				    dpb->bottom_field_order_cnt,
> +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
>  				    &pic_list[position]);
>  	}
> =20
> @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx =
*ctx,
>  	cedrus_fill_ref_pic(ctx, output_buf,
>  			    decode->top_field_order_cnt,
>  			    decode->bottom_field_order_cnt,
> +			    false,

nit: Not a hard objection, but I really hate boolean parameters. It could b=
e a
simple as:

+			    false, /* short term reference */

Or using an enum. My preference being documented here, its yours to decide.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>  			    &pic_list[position]);
> =20
>  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
> index 05e6cbc548ab..961fe023bb43 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -616,6 +616,14 @@
>  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
>  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> =20
> +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
> +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
> +
> +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> +
>  #define VE_VP8_PPS			0x214
>  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
>  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28=
)

--=-Ylgszz8oLP7hKDIiQWGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujbhAAKCRDZQZRRKWBy
9JWLAP4x8oCrqj26/oTlMncagq0eT+Bf92Otj0S9Y8iQE/FcgQD+MJmfpy96hxQF
U1VQIM6SOG5IPwtNHBzv9fHcsimvuAQ=
=mkHb
-----END PGP SIGNATURE-----

--=-Ylgszz8oLP7hKDIiQWGA--

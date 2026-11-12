Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493896;
	b=tmtjsJ40XiTBY4sSS8Mj3RofXoou3NvQAFAx6PCRBsnQ4QF3cAiYAvxhIRa58h1llMm4
	 2tTp0phY/801wiEEqLhEbDOn2I6DGiSjSkae5xT/Ef2BJ1YS4DCBDANQ/4KGLWaX2pAqy
	 rPrJZe5+CfKyphiu+HYizwDHbqjzjfkjhY8KxQrESgJD4bboxbjj+DOzCXI6IsnZYY0j0
	 OM6fSve2MPrTTzD+jXEx6mA7/4NE3fGQPKL7qZTtTCzTR6+03F1DUVNe61AQZ/Cl/5Io4
	 LyPWYXzE8GrMomOSLz/yUTHMJb+qcQbt+0gnYB25hrnx3RkwxhbWNOwoepLttq+1ppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493896;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=6s4531iB0pwwtkJP2bBPZCteIxEY5u4QI+uEjRbvaQM=;
	b=5RxHGACddyCCaPLGEGTOBd/fflC0JJBDtX6LqxOFlveaRzLTzzxFV1nNm7L+8siQT9K7
	 auWJxRDWwWB6VZsb03gLrsXIvqdr2TQyseiFdt7anUNvpZANg60/0uegmYTtqksbrO/EC
	 v2QQlVk+6hHJ8pHKg+dl71ZZPjOxw546cutwZ+EjA8uCi0i20XEk79HYKcAcHHe8sHC0D
	 YG2c61EpwH58Y+PuCt3NxlZNVostOre0ducNr8s9vW0XnBk8pwFjWGadoixQbVMQ8jBPj
	 V4yZ3bC534YMjHE+reC3zsbmggjQj4BzbyRl7IZNz7vhtn14h8DsU9byFTSAIxMhj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fTfEwMbH;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0E60A5BD1;
	Thu, 12 Nov 2026 14:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C0E60A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fTfEwMbH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794493893;
	bh=FYjRkCqyGsRzmWdDWrbZF9LJoHsBc2QeonGafSKs3io=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fTfEwMbHp4+4B3IGdyreGHL9lOXdgsebWLpWKAiUE742su8X68AaK/BPdQmsnhTkK
	 DBnXjsxusfs94dmGLvo5Qgdn3k54wbgzeH343gzr4S9msanrDzznWUh2Gy9HIN8XM1
	 la+aOdBXDCBP8pNLmx1xh6hkFOIo8KTriFHEQjOyuzjcvFq1cxGBA3zl19JjQAYQAW
	 OdXv3cHUqRrRseYTJxrY/TmusEA5W4LLtCIwB1U4pIwSXNoc2sukEArT1phd0Iz//N
	 /b+ZSPUqz/wwtrm00eIZuzddIggUTzkvPpXAtTdvSCLal4Dq9aQjzmzIUdcL+8z81o
	 HXMnY56/VdrKg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBC5817E0564;
	Thu, 12 Nov 2026 15:31:31 +0100 (CET)
Message-ID: <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p
 on the Rockchip VDPU2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, Jonas Karlman	 <jonas@kwiboo.se>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen	
 <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Nov 2026 09:31:30 -0500
In-Reply-To: <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
	 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-UsVvDKz6sEPhCdtGodXv"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-UsVvDKz6sEPhCdtGodXv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 12 novembre 2026 =C3=A0 08:54 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The VDPU2 decoder format tables (RK3328, RK3568, RK3588 VPU121) and the
> RK3399 one let the VP8 OUTPUT format go up to 3840x2160, but their only
> CAPTURE format, NV12, stops at 1920x1088, and the CAPTURE size is
> clamped to it. A 4K VP8 stream is therefore accepted on OUTPUT and then
> decoded into a 1920x1088 buffer: on RK3588 GStreamer v4l2slvp8dec runs
> into "gst_video_frame_map_id: assertion 'info->width <=3D meta->width'
> failed" for every frame of a 3840x2160 stream and none of the frames
> match FFmpeg.

Just to bring to your attention, the IP does support up to 65Kx65k, but the=
n you
can't do referencing (its the WebP mode, key frame only). Hughes Fruchet fr=
om ST
started looking into this but his work was not completed. The general idea
though was to perhaps introduce a V4L2_PIX_FMT_WEBP_VP8 (or VP8_INTRA, nami=
ng is
hard) format to signal this to the decoder, and limit to 1080 the FMT_VP8 (=
what
you are fixing I suppose).

>=20
> Nothing above 1080p can be decoded with these tables, so don't
> advertise it: limit VP8 to the 1920x1088 of the other codecs and of the
> CAPTURE format. Userspace that checks VIDIOC_ENUM_FRAMESIZES, and the
> S_FMT clamping, then know that a 4K VP8 stream needs another decoder.
>=20
> Fixes: 73fb5bfa53e9 ("media: hantro: Support RK3399 VP8 decoding")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 02673be9878e..2b6242c1fb86 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -274,10 +274,10 @@ static const struct hantro_fmt rockchip_vdpu2_dec_f=
mts[] =3D {
>  =09=09.max_depth =3D 2,
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D FMT_MIN_WIDTH,
> -=09=09=09.max_width =3D FMT_UHD_WIDTH,
> +=09=09=09.max_width =3D FMT_FHD_WIDTH,
>  =09=09=09.step_width =3D MB_DIM,
>  =09=09=09.min_height =3D FMT_MIN_HEIGHT,
> -=09=09=09.max_height =3D FMT_UHD_HEIGHT,
> +=09=09=09.max_height =3D FMT_FHD_HEIGHT,
>  =09=09=09.step_height =3D MB_DIM,
>  =09=09},
>  =09},
> @@ -315,10 +315,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[=
] =3D {
>  =09=09.max_depth =3D 2,
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D FMT_MIN_WIDTH,
> -=09=09=09.max_width =3D FMT_UHD_WIDTH,
> +=09=09=09.max_width =3D FMT_FHD_WIDTH,
>  =09=09=09.step_width =3D MB_DIM,
>  =09=09=09.min_height =3D FMT_MIN_HEIGHT,
> -=09=09=09.max_height =3D FMT_UHD_HEIGHT,
> +=09=09=09.max_height =3D FMT_FHD_HEIGHT,

If you have time, it is also miss-configured on the imx8mm, the combo-core
(G1/H1 combined, like RK modified version). While the imx8mq has 4k h264, I
don't know if the VP8 core actually is capable of 4k, so perhaps both soc n=
eed
fixing.

>  =09=09=09.step_height =3D MB_DIM,
>  =09=09},
>  =09},

--=-UsVvDKz6sEPhCdtGodXv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavXNwgAKCRDZQZRRKWBy
9DkyAP0Q5qttBFa47Zyj/PIBd6D//4pj/GszbWh3XhcsCqWbxgD/XOK6P1s53OLa
N6GX9/CmC99j1N3UZYLbYnUuHv9tlQI=
=VOqM
-----END PGP SIGNATURE-----

--=-UsVvDKz6sEPhCdtGodXv--

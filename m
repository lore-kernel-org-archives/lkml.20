Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0E43C7A4;
	Mon, 28 Sep 2026 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624367; cv=none; b=i/M5uhxnn+inip8LXrXX9WaZtoaESO5vABWmmSs/rFRjqFFywMM/ZbrgbdefaHz2DKLMq2k1guhWMtVBLUXCW8n70DJlH8XF8Z0qEMlFe8KsAGUEOQOZLl6ELeyozj9eknujeJOC1WJsW6lkviVO5f1FiHV3RE5/qCoikjakNlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624367; c=relaxed/simple;
	bh=+AAewgXDMIVVNyVEa+zV6e/mgsri0skjz0hNShpnhDg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G5DXESqhkYNgCIN4uTBHAzkXcqDxBin51QGCuNJMmo1xuCYzcNFv3VobZz+U0VFvIGjx86ZEWp7E1yVY1kfGooL5lAukzauS/wkSHSLmvuGrAj1dGlcGwjwWFdC08I7BF1RIYLKPR4CiEl+IZc9JSIq7n3NU5CPvE5YYGY/jdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HYVBYBjj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HYVBYBjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790624364;
	bh=+AAewgXDMIVVNyVEa+zV6e/mgsri0skjz0hNShpnhDg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HYVBYBjjuj9EqjMBnBn4CvDnQ58LVJvWBlOUfJS1Ga/XmiCzQJDRrqHtTBbH3g3bB
	 2zrWFStAS9/v8fF5tm/gQHvEBv7QN5xyAZfce7OBPvXFdgpRc6E2y/jnW//3APo897
	 nXBHYrmArPHcRhS9vYbSxBUreSMfOT+t5yZ2bPw2H4ybgiKIlYkiqzqM4uuyPVoG6I
	 rd1WC5Ocb5NWg7bOGzl3zpcNvxh8kFp7ZqJEEONrCkn+zqjQ/JqW/p4RuNerQUxb46
	 bHVJfFTAzvvhqjjLsIpysgPNDaA0U0qg6Nd2KKESaFBQwXdzS+gy5LLEr9Z2BOIC+b
	 XfbyD8kw2EsWw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D049D17E006F;
	Mon, 28 Sep 2026 21:39:22 +0200 (CEST)
Message-ID: <54bdf44f368e90bce879dab51475230726a630e0.camel@collabora.com>
Subject: Re: [PATCH RFC 2/2] media: amphion: Add
 V4L2_FMT_FLAG_DYN_RESOLUTION for VC1L
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ming Qian <ming.qian@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>, Frank
 Li	 <Frank.Li@nxp.com>, linux-imx@nxp.com, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:39:21 -0400
In-Reply-To: <20260608-flag-dyn-resolution-v1-2-44dc65516148@oss.nxp.com>
References: <20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com>
	 <20260608-flag-dyn-resolution-v1-2-44dc65516148@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-M4XvjIAAQre3ge1Vefte"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-M4XvjIAAQre3ge1Vefte
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 08 juin 2026 =C3=A0 12:56 +0900, Ming Qian a =C3=A9crit=C2=A0:
> The amphion VPU decoder always emits an initial V4L2_EVENT_SOURCE_CHANGE
> event after parsing the resolution from the stream header for VC1 Annex
> L format. Without V4L2_FMT_FLAG_DYN_RESOLUTION, userspace (e.g.
> GStreamer) cannot determine that the driver will signal the initial
> resolution, causing it to skip waiting for the event and fail to set up
> the CAPTURE queue properly.
>=20
> Add V4L2_FMT_FLAG_DYN_RESOLUTION to the VC1 Annex L format entry to
> indicate that the decoder will emit the source change event during
> initialization, consistent with other coded formats supported by this
> driver.
>=20
> Fixes: e670f5d672ef ("media: amphion: only insert the first sequence star=
tcode for vc1l format")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>


Can you send a non RFC version of this.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/amphion/vdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index a9f0521f2e1a..75808482d090 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -136,7 +136,7 @@ static const struct vpu_format vdec_formats[] =3D {
>  		.mem_planes =3D 1,
>  		.comp_planes =3D 1,
>  		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -		.flags =3D V4L2_FMT_FLAG_COMPRESSED
> +		.flags =3D V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED
>  	},
>  	{
>  		.pixfmt =3D V4L2_PIX_FMT_MPEG2,

--=-M4XvjIAAQre3ge1Vefte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrCaQAKCRDZQZRRKWBy
9CYCAPsFveAaWChcZQDCXyLHHs+vulfT1yzF5GrpP/nbumEvAwD+PIpjMxcHbLmi
mmV7vNw7LQoqmoTk7u/pflIvWwXjfwk=
=8PXW
-----END PGP SIGNATURE-----

--=-M4XvjIAAQre3ge1Vefte--

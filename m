Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415C4F7CC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625413; cv=none; b=X2GgQmR8fDJB7jfzd5tjgI2YiyYL1MF5Rn9fGsErPh3d4WOnlo/eXgJf1snmFnbek77UfLw7xiu9kpw2ylJBQgDd25MZa0u6gUJwUM33d7nfVhGxgjvafUA7W0WeVQkzOYS9i4OJv9E9dastbunFkob2pBB7UVI5gd8JICqflgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625413; c=relaxed/simple;
	bh=vRo+mo/h92iXA1isnqSpqSzHaDD4+V9lhZPq2yH7Sy8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kgfT3FZ+qI2nq/I83YkvJkPRqRSe5VedaSi5+JfMcYSrEA6EFRlsgoNJJct7E0GyTdsDmeny/qOR8RX76A61jj3UYaFbMnP8QOhMcCvO0L8964ZEXMeZzFUDsEOBG8BntZ0zuYc+Tl45LapCt0KUfflLPgMe2mutRkWRLgohmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=EoxIpCnR; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="EoxIpCnR"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c57d36d37so296153285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790625401; x=1791230201; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=EoxIpCnRuxwX0jveR2ugAuYLvlCfHOZtB1Dk4Qnw4HQgo3dCVg4Xf1mXh61dCYPA3M
         mZKLjw2y6X8wAdWeBMFhTFXBrMUV3xjpFnru7ZO5gX+npBcVl21SS8vsxhxQtkyUA1hT
         ZNry0cEXorUTJ5ZUUmDgDgcVtsrLiBlgLy5WXWonBU031xPGftQHwWp7c5y6CeKBLpbs
         kAADbDg7JMqrsDCegTvmvQ1Eq23/iVouRQabDVEjoG9OkKYmPMhUl+XMg4ld8H/CBRA4
         +oesopa+B1QiyFA3neIKpwVSSxoubQ2wuroBsix+HVTwl2PG4FWX1IPUR99NT/arK3SI
         YIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625401; x=1791230201;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=I+2xuxyaW1tJZIH30GyZM2chCCvZ0Vycuw/WlN3/dpp8fK/m+6ccfNVqSwEM/Rta0Y
         HxpZw+LAPQVoxVS/HtpMEEyf3Y2ZgbiRPW76U2RnEcptbKZFfosrcvkIEjNsNZ/IXR6f
         RhpI4lNLHKbuvHcg1K+v2QjfhWZoFv5qLn0GjaVzytYgHVaa3tARC8wifVcW9EhV4Xhq
         dzBRcZplt3vBVIE1h0OdQgfnb+zdvyxYAcUW+P3Pdy+cNUJ88k86uEGiCkJvWsPVA1ZS
         1y7Dng3eo3TbfE5EflL2UqDkFUAiDPkUPAFqryPxqGmtbAENf8KawmxWtrXu79qzkiP0
         bsIg==
X-Forwarded-Encrypted: i=1; AKwUvBx5tSBKOHQKvU99La/7Rnz/xWrT4eikORsj5Pm4nLUaviy8OA3UmQJ4WONGM2aovCHYzkOFTldBce88ZbE=@vger.kernel.org
X-Gm-Message-State: AFuF++nYVvHfPHvEoaSJue3a0Tj+ZErNvhKWWgsZpP9ongxXABk4z4uy
	XgHGg6R9taiOdvBzZ3GYCT/X7EvcV9G0EtlCzYIAQ/tk1mBRMo+p0lG/FFJOocABrNY=
X-Gm-Gg: AYBFou3F8Q0ejkPQA4kHlRh7WPrbuSYXaepsfDZezmod509uPV47tf1M0L8b2D9eqp4
	NGGxpIKvfE6GBhDxRz6V/NIq9zKev88mCpNwceXa74tvMmBTFvUWrN97/6t1w52SfKu0A1zuRzC
	bWoUMjPXhV3bYvAXvtro7py1c+Vpt/HhK+cx2eRVurWP5Bdb5ax0xuNi+nWTV9MtAgnTQx5hp9C
	AGDUjekkNYwSniOFjw2x3scOQu6X83OxM8222NOYGc2CSMEJJ87vYDCHUYTz4x0IbCg5eVy/byW
	p6HvPNlpadhX5POfjRfaZGDWwLa/cm+52hOk2gAnIYz0SVlqLo+6UY2TSsJ5IxKKhLrJqdJrdvs
	gYNp0UsQma/5MFi+GH2liHSJ8OAXh4L/kboi9nJ9hTk2IlXxClwmloUTX7MT/uidtsEyP4C/cHK
	xKZQ/cyznpPn1YLoLFpdT43ZQuS4zWQrjgo6eYEYWIXHRsXrE4YOkEFmXnnmTLR9dBa63EvI/Ap
	CNGnlNmUMkqEg==
X-Received: by 2002:a05:620a:404c:b0:939:e735:c50e with SMTP id af79cd13be357-93c43cc2b53mr2141972085a.13.1790625400740;
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a2bafsm87853036d6.7.2026.09.28.12.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Message-ID: <038a8200d4491261d728874da2db82f00e10bd29.camel@ndufresne.ca>
Subject: Re: [PATCH v6 1/9] media: v4l2-common: Fix P010 format info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, 
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com, 
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Date: Mon, 28 Sep 2026 15:56:38 -0400
In-Reply-To: <20260624072043.238-2-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
	 <20260624072043.238-2-nas.chung@chipsnmedia.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bMG5akiRB3PaSzMQ1vw4"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 16:20 +0900, Nas Chung a =C3=A9crit=C2=A0:
> V4L2_PIX_FMT_P010 is a 10-bit 4:2:0 semi-planar format, but its
> v4l2_format_info() entry described a 4:2:2 layout with a half-width
> chroma plane. Correct bpp and vdiv to match P010's real layout,
> consistent with the other semi-planar formats.
>=20
> Fixes: 5374d8fb75f3 ("media: Add P010 video format")
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Also picked, ty

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..4de8aa3ef7d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -323,7 +323,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_NV20,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV24,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  		{ .format =3D V4L2_PIX_FMT_P012,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =20
>  		{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },

--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrGdgAKCRDZQZRRKWBy
9GsIAQD157B5+yx05js7VShECkIRRKuZFpkaapJRCcZGE091YAEA7bUrfvGnymk8
65ItzDCQxEdR13vz+niUH1vG8TVs0g0=
=uMFh
-----END PGP SIGNATURE-----

--=-bMG5akiRB3PaSzMQ1vw4--

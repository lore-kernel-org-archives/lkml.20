Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646704;
	b=11I5mQr0H3jyJh/3hHGz9IWyv5KMmAGv9exRMq6QCm1oV5F2gfBpJr2OXVL05hq4iDMK
	 72HRa0IpdLbRjbXNozKLyzytD01PsPoDyROQrkRbWXZIsn5+Ix8Ucaw5WxYC8Zy3w/Gdr
	 cUkaKS5GM8mD+B1W0S6r4f0aiKvL4R0b+4bdZ4d1vQxmJuD4cumLubu0ffIr747QnCIme
	 /zSOiB4k4MFbIOSJKr5LknXFDiA2aH5hlnyJiFH00BROoKCAaSiVuGUcag+U+QduQeHm8
	 0ypo4BJlzHATRD3HcdEF7BinZrlEGZjrAj16gVfbEdWP/Vf11CeGSOD7hV4T7jcCUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646704;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=8m+OLwIKwAxl3Yo6BqrrXG2lnGq3krn0gCAbeNdSwA4=;
	b=aun78bBiOKoqAxPSnVGSqTi2A0CpSQiNVAQSAYOeLl/GFwOuXDW4V7ilsMonVUESk2Qa
	 gOFvi/Mjnuxlg3onBzseEH71pOXQ1OgQEAJKOBNcpF0NX+mdQ206SZcFjGoojHnjyWbrQ
	 qNEgfEA1j/KRDraRhZDK1meWEC64GfKvhO9AnjrA7N9qJCfOj3svbuN6jqNbInBXVzjPt
	 ZcOsXq5Yd8XQl4Nr2GNcDe7uInApbyE/Usb7Kl13aTJUb4E8cvzl5T8WHSGhRbQUEF1pQ
	 /eOz396gVGrHTH4GTEz09IpWLi0igqXKIBaGD0F9HP7taGdHDTuQVDC3hGbCVIn3hLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rj6zrNE8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084BD606A326;
	Mon,  2 Nov 2026 19:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rj6zrNE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646702;
	bh=2bw38SQHViussxJIXbLBvs1V6mhhWBzXS42chSu9hbg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Rj6zrNE8SU70J8ewdYtM4VrWPT9hQxqzjmxcuSeGZ+l0beXmDEd2xjIX+cOjjqeoc
	 sO7RBKOT+Ner5TIs23e+rDJ+H9PsWC6DcrA+DxFyUUWrrYH0ktRc0PtHVUHud2ftUQ
	 6fYTCorb4W8MOcnEKGsIK8/d4qJlhOQBH8AA1igatDPHVFJebBJuBTB/oB4/d1fel8
	 WtyvWluU/a/40kc5R8ba/GBN9OfCFJcokx/v8KORLv7MtIh3xBCXruoyQiNhwp2ofL
	 c9bgEAudToAZ2Uu573DljoqF9N1Y+qmRpqUMnv/eh8mSwzwsZY0Xv8ZXKNVZp9mOU+
	 BN3ksVxQZmGsQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3BD17E003A;
	Mon, 02 Nov 2026 20:11:40 +0100 (CET)
Message-ID: <e3de9fb175ea02f6b49fd8bd2e173f04823fd17b.camel@collabora.com>
Subject: Re: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor
 probability table size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:11:39 -0500
In-Reply-To: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-9-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4+OrXPDXnu6jqB54Yvxz"
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


--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The driver allocates the VP8 probability table with 0x2400 bytes, which
> is the size the old Allwinner A10 library uses. All newer vendor
> libraries allocate 0x5400 bytes and never write the area past 0x11b0
> from the CPU. The hardware uses that area as scratch space, most likely
> for the segment map, and its usage grows with the frame size: a
> 3840x2160 stream makes the hardware access memory past 0x2400 and
> causes IOMMU page faults.
>=20
> Allocate the table with 0x5400 bytes, like the vendor libraries do.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..6b00efa77c22 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -25,7 +25,7 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
> =20
> -#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
> +#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
>  #define VP8_PROB_HALF 128
>  #define QUANT_DELTA_COUNT 5
> =20

--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujgawAKCRDZQZRRKWBy
9AI/AQCxJz9EnnPrAIoA5yNTvO9ljlCZI3TJthPIfdHbuGic4AD+JHTwuW9a6dOj
gPGEjbipn75MeJAFopj4V59Bk7om7A4=
=JMmO
-----END PGP SIGNATURE-----

--=-4+OrXPDXnu6jqB54Yvxz--

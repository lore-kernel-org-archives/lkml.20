Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782479;
	b=NpoPjsFXEkKueCSw5GZ2mSi3ceRinJwZXjtYfFQdh4sPo6dgxFKi+oRL83OEki7sKJok
	 l0yMhceFwBGKToB4gbPM8Hy7frO/k1TleGn2DawOFRVLPY43UyHQu0CDhLGBCa1dSDpoc
	 j4Pq4ZmL0BDcXmCtGl4shUSXemTqQUkel3iiikbEipn3DdauOGeoJIh27QgA/hqFS508N
	 rfmIfSH5uqGrWGAzr/MaoqnW5D8KcaDKvqVaTIecR23Fj5ozRBWJw6/YsX8OoNXxgHArT
	 aaR0s8s9281lYZMlSPeylzIvAn4FvLoim4UKU94PJUJqvRr+ev1rKNAWqTvQaN/7eaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782479;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2O8IrxrO1YlFfd/nQudcwrr9AQTRa4cAxZBDMYTbcDc=;
	b=b07LSHbI+X2/G5brw0Z2FYyfddY00Zsth8ZHxPDa93rxNLyWAN8RrVfgD2/rM7p2goPY
	 smyRi0NPFL7PQLQKqZDiHdFuYSGR1t2lIyen0ev1qaD5aHUnWr/T8+tGGU5UIqquE99W/
	 2M/g+j+Fymm6ELrBhXXMENnMr9BFNSy6iNLmF3l1hfIa8ltC+StJp8CmJW/yOrloBeNLi
	 E3n/uut0/wXqxAqcQOHcD2+iKVjwaP2/aDuX/TxW6Pgf1pten+68aJQeocN/VqJKa8c21
	 NgxOKpnRGct5WWK1x2gfWpYVoQTs0oXd+6yO//Ki3vFPTWH+wI8LhlQp4IENIrPV07w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=D3as2IeU;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E8606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=D3as2IeU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2O8I
	rxrO1YlFfd/nQudcwrr9AQTRa4cAxZBDMYTbcDc=; b=D3as2IeUQ6Fi0Bv1vUVc
	7lqWVTOLseAYtBlODcxWqMjaX55P/qggqP+bSdV7Pz1obw8PYJ8mJrYVnejdHz3V
	HDJb4SD3HmCMz6l4j+6O6qEnrXHKzOWKqF/vYL5uaQL8isivqHBS2bnQhl25TRHS
	NOsMsk1nk9Pd8/qrsQHq/Y/DhvAEnz8dvSM5yeIwE5HCTywEy7htTuj0YwlEKSjC
	PwUvH0Vd0NVjj14VfS/2VKQCmF1v+55dE3sr2lGGpUIKORIv33WnKMa3+TiWgbWB
	9OpCZZ59z5qksp1/B5eCm7TEswUcivt0PvF7lO4AI/SF8GogAz+tuD1STUFFpoXs
	Bw==
Received: (qmail 1048451 invoked from network); 15 Nov 2026 23:41:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 23:41:15 +0100
X-UD-Smtp-Session: l3s3148p1@pI3kW1hgxsYujnuZ
Date: Sun, 15 Nov 2026 23:41:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vasantha Likitha T <vasanthalikitha.tandra@amd.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, michal.simek@amd.com,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2] i2c-tools: i2cdetect: Set I2C adapter timeout and
 retries using ioctl
Message-ID: <avo1CsZ8z4ODuwJo@shikoro>
References: <20261109171924.3632557-1-vasanthalikitha.tandra@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zt1sR/FHyOnhav6v"
Content-Disposition: inline
In-Reply-To: <20261109171924.3632557-1-vasanthalikitha.tandra@amd.com>

--Zt1sR/FHyOnhav6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vasantha,

> Changes in v2:
> - Move the change from i2ctransfer to i2cdetect and add -T and -R options,
> as suggested in review.

Better, but still not quite there yet, I would think...

> ---
>  tools/i2cdetect.c | 41 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
> index 3c22f17..8b08e55 100644
> --- a/tools/i2cdetect.c
> +++ b/tools/i2cdetect.c
> @@ -35,11 +35,14 @@
>  static void help(void)
>  {
>  	fprintf(stderr,
> -		"Usage: i2cdetect [-y] [-a] [-q|-r] I2CBUS [FIRST LAST]\n"
> +		"Usage: i2cdetect [-y] [-a] [-q|-r] [-T TIMEOUT] [-R RETRIES]\n"
> +		"                 I2CBUS [FIRST LAST]\n"

Putting it there to a "regular" detect means that you cannot set timeout
or retries without scanning a bus. I think we probably want to drop it
here and do something like

>  		"       i2cdetect -F I2CBUS\n"
+		"	i2cdetect -T TIMEOUT | -R RETRIES I2CBUS\n"

which allows settings these values and do nothing else.

What do you think?

Happy hacking,

   Wolfram


--Zt1sR/FHyOnhav6v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr6NQoACgkQFA3kzBSg
Kbbg0g/+M6ijijJ6BOjMabdbPD9VvfYrFHu7Aq0bq8fCoP7Zp5Q+b0repCsF0Ksc
GRBJvfQ6pbD3/kan7b2osndo+s19XexWFGOTL27Ax4yXVMV6mm2UEJLPxQKlX8zS
1eahaMMVP1Y0g7ZSUmYlecwRQHSpSB0Qeh0L+QWkvMlvQszI6zM2Y7mAiG18L5jj
wEoITIuxRRZklegskDIt3KCrbMLHpmrzpb8JS0I7d5IkbahxcsvV6oSUWy81fMxd
MV8xiq0P2bmdRi9qnA85dmporUU2igji7Dh5fCyQhHFMbi55EyWfb1orZdrgXdm4
NSskWumJrFDKesRKIT3zco2nguvESGFn1V8HArQ6+5wLAM8I8oUiYF1AUQ/BNxrI
KEraXH9Jm1v81KrNeyWJs5Y+wVyMqcSyQx/qEoXKOdqjQ5fyBlhkDFZNCVnSBduL
tKKGvxHYBd9sG2eJk7l4TTKUlnzIwEO1DN1WWGtm/tzD53OH9x88alZUC+AoWLvG
xt3k7ra13j4GsnITmPlUuAfD6Kh8AVgAdfoie5Nc97/SVEWjjCzFGSep5r+QZkqe
MOsA0Ax3OcASzX5u6M54P0M0OmEWXPMhMcO9RGBNf3LNSIl+r091dIH2l0L7U3zT
LU6y5Bsm5Sd04gNU8ZoBp0Wts/HR6TzCaommIpaBeq01ky42gv8=
=bx0O
-----END PGP SIGNATURE-----

--Zt1sR/FHyOnhav6v--

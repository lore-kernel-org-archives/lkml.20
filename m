Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823516;
	b=1QQR728U0rterL6B1h3nvrlZ2SufDEauFfKYK3bwuyBghY9TgPIdqxTf1xHBGCTm9/aG
	 QJmCWExXFdFwmeyH0XO3NueFnEB5dL65h+azevN/eVatc+Ft70ush5rbHtOnjr/9dAYoO
	 xTVwqDpvAKnDgE3YcmHnvuwjvvdZS/GNXTyKkFmCKUPRbVMsGwjyAA+wgLrGOhwaZjWW2
	 jl+hVSmSOe9PJ1HQgvmStC+l2YeqlNJ/KD2KEK7ARlv98rH4r29MECyi+b+ggyuEOJTD9
	 uqdSIcOSQBV3jQ8Ba+MVVVE/LQSUHduRM3aIL/WDDPBQCHYSPKvalWZm301Nvm6X0NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823516;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Q0y5H38M5nkBLyMAj5L3la0odTbAYzxV1gPXEVWBmgI=;
	b=SPVd4ANoA0zKXmfCtOiR5cIW2RDvfIKbdcD7HJ2SynZkW2qDMMpMCbUN+IrhTA4sNtDq
	 LAVnlQu4BYjRLt26MwMI9m/d29rJC4ppkrooiZ9JFFT84xqvuXus7nmU6KTsPxWXsrxyk
	 PZGjscnvhgo+va35VwNXlDDElg9UqhgBVXsgI/xn1ufLGcGI50JnJ4da7DgCuSKgavLpE
	 VlGr4lOrs88yH1D8CWzTldkG2NH3NuKzm/wP3CFHnydqdVs0qWAPZPBwmx/T8lTXphNhc
	 gVaelwmy7dpbGNEzXcdbC7ZTWvJhl7eI/vH2if18EXy1EbI7fZZRA6zUDKNIMbDqcPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iRKYcqG1;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AED606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iRKYcqG1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Q0y5
	H38M5nkBLyMAj5L3la0odTbAYzxV1gPXEVWBmgI=; b=iRKYcqG1SS2KcXxrrF5j
	fdvIcwijAgcOj+9Anw2xRozHzU9BjDjq1jQr6okctFHrl1FTAL0YH8NZQVIY1jQx
	EQSepAvMlvxh3LPcvM3TGkxVOGxjAQMaPEiJsn1qYgrXQe3zFTB7OVE7/3ZyOBFs
	ul66znsd3UuoX4sOa/06AdCi8X+qnDMvHpDg0Gh1Vd4EfPg6D9bQuT3yiAClLdik
	Oo3y9A1P6kykF0ly8IiuZJLStjP/xHAbUcqOHku5bMKkOJJMDXqqinXmJ+3hE/n0
	ET7U7e3meqzO7DiH+40hF2RPu700BSTuWHu3In4VenI/CKzoUJlpXJfAWZvR3OPy
	jw==
Received: (qmail 1228596 invoked from network); 16 Nov 2026 11:05:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 11:05:11 +0100
X-UD-Smtp-Session: l3s3148p1@1FfS6WFgduIujnv5
Date: Mon, 16 Nov 2026 11:05:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 0/3] Enable RZ/G3L SDHI
Message-ID: <avrVVjHY4Pp1hFvt@ninjato>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
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
	protocol="application/pgp-signature"; boundary="Os7FRzFaW1+KPzvM"
Content-Disposition: inline
In-Reply-To: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>

--Os7FRzFaW1+KPzvM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Nov 12, 2026 at 06:48:49PM +0000, Biju Das wrote:
> This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2
>=20
> This patch series is depend upon [1]
> [1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.r=
enesas.com/
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

could you comment shortly on the Sashiko reports, please?

Thanks and happy hacking,

   Wolfram


--Os7FRzFaW1+KPzvM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr61VYACgkQFA3kzBSg
Kbb9pRAAkhhvuzm8LJTOGcAaYkQMywCB7s5UrGrbnqtQTIZMpytxJM94zzLrZ7pG
6JOUE6Hdgrc7fgK0yfjcURJyTGQ97wwDvifgolBp31W8vWMG5WwLlr8WA/5aTQx0
uzWgJ8FxMA2xb/qt6l6VGlSaIv/8VYLIuW5wbAlvSRMHIaUiAmyqIiCAjzvrEZPG
D5LT1ayZUvLZU+eYYokx40cqv3ZIJ3BX9ilCHGCVTOVDTuUZkIjKvUkCR9/SWkQV
PUspnlwO/O9Oxb1WPFlsLNoIea9fstLAC9Dn0xA/GsdGgin3zCRUXdlmoqBRHeNP
SRdf9w4u+31sP+VFCzd14KXEfKmxXBZ50AjuGPV6WbPDes9ch38RhDMrVl27t7aq
RE5YDzrjZVkuTB/1kNqz4J1tcOdXTOuRDJM5jWEgBaKZhaSKMYGKzU5ouRHqiH06
r+91UaAUQgA8WFer1aKp8ir2Q0Eo2aQ6EPq751Abq8Y9z0ItVhuZHUCw4vhFn38U
4HOTDnD40vOKN4DVUXCKV7sX05xISJlhNvY86aGK3u14srTBoQSSQg4idXNJd6lQ
7ifuCP2DabF3RoPJtEWWFalK9VuSYBXcIR0XJHdgXSAw6nqTPaOqnzCcN/TxcwFT
r5D4C3jAucm1opunG0CMGw6+ZwtJD/J2Z9clCqD3LMQ0pS3b0NQ=
=5Vh5
-----END PGP SIGNATURE-----

--Os7FRzFaW1+KPzvM--

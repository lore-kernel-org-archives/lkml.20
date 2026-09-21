Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D33B9DA6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977342; cv=none; b=VceKPipEnUlzydexZGNn0ZBN14p4Bemwere9Jzj8AxfKgaWP6e9wV7yxAzJoUiXV7g96JpGL+6HU7FeWhdex6nkK/48Cvuqu+akqu2J5gdutDS/3sp6ODgfNcUP14w3mmv8oHuuVO5bfpIIRoTBSRdXVwCgc65b0ASXscWkE2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977342; c=relaxed/simple;
	bh=qwVwva3fYM47tB1duE8OSCj3V/erUb/avnvTKGBT0TU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=o7wqVVA0p0tmTlXb/M6VWStpKaqOcJ81990sopTqJZcwnYYhXbos5DocRM3FTfQmU2uqbmfhX97H4YwR48faO5DyKb7enuZTo4H/7EiIs5cZB0HOiF5hWIJjtWG1DpN3vES5c6+M4wWz6gHUVvqxTl3fniKf/vkO5EI/F90TpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMLOeDcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMLOeDcD"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9BD161F000FF;
	Mon, 21 Sep 2026 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977341;
	bh=1E0s58OdvUjvYlmidPn/3TmPeOT/AtnArGrXGHhHfsk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=iMLOeDcDKQt/KovrcXge7lyONWGDZtrrKe8OhSfTsiKYZfVIreYLmFyagwI+Avaen
	 iT902gPd2naVNBNGvoubQr1jgZSP7UMGXX/53Qu6RMyWYHdloNzhLcaak0GdBDKbBy
	 FepHxYsyfRA2AX0onfeioNvLjk5opTzAkc3A6ZmAfBcS/YVJtyOZOHob4se/MW51qY
	 4IOEsn8KmZTD30QxhG7mo5POiFO0Wq87UPji7+asIxrV8bYBuXY6ioOVLhHLP+d2EQ
	 Yi/FlDU34ZnhJtiCbgVOIHhnvsvwBP97cDksbGqGtnTyU0bQhv7ON8ZkuG791iiOmk
	 LRJiUP/0aod+Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 09:55:37 +0200
Message-Id: <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, "David Laight"
 <david.laight.linux@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Arnd,

On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Two large spi_nor_flash_parameter structures on a function stack
> is really too much, and this can exceed an otherwise reasonable
> frame limit:
>
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is=
 larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>
> Change one of them to a dynamic allocation to make this more reasonable.

Thanks for taking care of that. Will you respin the patch with what
David suggested?

-michael

> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the =
sfdp module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarDi+RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jwuAGA0b/VhzOESTZ2vh3trXzFHjqSLW5pH5+Y
VQ0va4Qlb/t7SLJSLj4L94nvicDp23+tAX90yIlisEQ7rkxbZrPWImsffW7C5f2y
31CJmVtVYIPMPQcgG/p3rxpa6KYiOzuAQr4=
=4JD/
-----END PGP SIGNATURE-----

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4--

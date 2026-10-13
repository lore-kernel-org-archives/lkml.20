Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB354937D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931173; cv=none; b=AYNhbOrWFGTCJD7m4oRL9RlfiH8GFTgFkyUqaZQiy8O3NUu4REhM6pQ3cGN0W/KIlSKDmuECgOlQ5Btl7RwBSfVWaIiuJXCiL2856s8QIXpK6vOq3biq7HT5qBn6by6u0GQQqkhMAOm/G43etypz4CXT3iJ0evsu4+fYAPU/D5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931173; c=relaxed/simple;
	bh=MYD28Az2ZCr9Qn/Y7wwcl4nhihSrtoq/OqaoHaMedZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk610d9saStpGcCbDrd/aubA8QjVJqKqU9jYDLZ1kLblzhdSNMbugHE03oBAREV+HnW4OlCRf8hIXqnS/t7lgtb+ax5VIVHj6ox78YH+jWnctoGniLKhZvo0SjwEL4Xr/iHA2ZQ1UKNW9GBj3AbTM/jqplgBJWgNLE5w1SwsrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQAXPAlg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQAXPAlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2F81F000FF;
	Tue, 13 Oct 2026 22:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791931172;
	bh=6TGi7nBnZz1eos9NfebL8co0kLsIUfiBo2SXeSOJfJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQAXPAlgBniVmy1nGVjgKoM17iR4YIxZvtuQzXHIRsEALS2++MLC9f3CaaFdrui9+
	 rLuhcGnMQmBt+IdYTbp1wjVhbGGjrAmclmlw4fkSXJQsyyoqq5l2MDrONZDVeKvdIO
	 XZmgWn4catHTKCP8ySDwUdjDp6pksnG6RuyayQDnyheoZzQodQcpqkstz3sdtRoG90
	 WOogyUXwDpht9dEFbTeIBUSeqtCLKTRFBS2ymXQMjirizOIw9WxMpGkTuFhltpGbF0
	 1Zmwo7qU7k7xYRYBv3u8/dpQlTUgNeQfWz1KOtv+m1lOZS5GKeBe8oU50lQkTBA1ve
	 yz7YoSjjqF7Cg==
Date: Tue, 13 Oct 2026 23:39:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: propagate IRQ count errors
Message-ID: <20261013-causation-cadet-4e2643a4f6e1@spud>
References: <20261013095756.1084568-1-thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Pi5zXAT+DdfpQWd"
Content-Disposition: inline
In-Reply-To: <20261013095756.1084568-1-thnkslprpt@gmail.com>

--3Pi5zXAT+DdfpQWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:57:56PM +0300, Avi Weiss wrote:
> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
>=20
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
>=20
> A negative count skips the IRQ registration loop and
> allows the probe to return success without requesting
> a deferred retry.
>=20
> Return negative IRQ counts so the driver is reprobed
> when the interrupt provider becomes available.
>=20
> Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platfo=
rm driver")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/cache/sifive_ccache.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d52..b4033110f34e5 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -262,6 +262,9 @@ static int sifive_ccache_probe(struct platform_device=
 *pdev)
>  	quirks =3D (unsigned long)device_get_match_data(dev);
> =20
>  	intr_num =3D platform_irq_count(pdev);
> +	if (intr_num < 0)
> +		return dev_err_probe(dev, intr_num,
> +				     "Failed to count interrupts\n");
>  	if (!intr_num)
>  		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");

I normally hate putting ternary operators in things, but I really don't
like how this looks, especially since the new dev_err_probe() will never
actually ever emit that warning given the behaviour of
platform_irq_count().

Can we do

if (intr_num <=3D 0)
	return dev_err_probe(dev, ret ?: -ENODEV, "No interrupts property\n");

instead?

Cheers,
Conor.

> =20
>=20
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --=20
> 2.43.0
>=20

--3Pi5zXAT+DdfpQWd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas6zIQAKCRB4tDGHoIJi
0leyAQD+PvVV7gZ53rns7Y7pJzVcDXMRJ40NmTvhLRQ95esGbgD/XzD91oyGhRVT
BUhbVVSJgW6yVAOgymzJ0VP9uDmbDgM=
=ewhJ
-----END PGP SIGNATURE-----

--3Pi5zXAT+DdfpQWd--

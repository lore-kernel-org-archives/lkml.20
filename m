Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972546;
	b=e6mqHK6ie80BmmfKYKtYVXY2VCwMgW5uHpDfnPeuuKJEHOi7aVg+3T7iJ7qn03WlsQ2a
	 vW/cqUBHUzhGukLfT+Blc1kqh7uYsEjQ5ll4nG68zlUsq4ZqnU0tHvJukXFvULe5FwMMl
	 5ZqdbIaC4WhIx9VTYx+d94kAeRgjVvA/K41cpTfXP/bPFtq5FlYj2X4+U702d7TWKGcE5
	 OJ3NzRP7k17820V5TY4kVJ78RcBBs6F8q2j7AAkG8CGm/lPWCCVK3CQaaFe3Ng5XUUIXx
	 qj2fBQMVO+lH6WN1kNTsktElW7rzn46PvZIYYTLDBB1wL8jNt9Ng+FG1LGG+XUFdWyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972546;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=80OQ1QRH/eXZDpRFnnohWK41eyPKM5qief5OGMWCxl0=;
	b=aU70R/paQdVVi4NQ4+y5n7Zd5c70gsm3x8F8A3AF0sGen+jVO8JOQo4pBtZuBiD5z74e
	 LawqCL/N9zgIjvarWmCWxkqnUrfYSRNbSuP9w4dHb06TwC7t5HzKl7G5wneXHAXjx41QC
	 leAfUdl+4xrPbM6h6zU2Hm/V6n7n2mKVbw66oSkuX4ReoFbSOpj67V5kuiT3AYE+QPdS5
	 wmIANVceu7P4NuByK9vnaAoPqsU1CoSfookBiypeATHA7XomAWfvEcIEUeMdtBaPuoYfA
	 sFzDWVGrQttZskIj2TLZlr6HYvKLDjFAGy33TKa0Ma4JCldBtX7zBcQflkpZdsbbD2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4Q2ednR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59833606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4Q2ednR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F223B1F008A1;
	Fri,  6 Nov 2026 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972546;
	bh=80OQ1QRH/eXZDpRFnnohWK41eyPKM5qief5OGMWCxl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4Q2ednRlVhyS6o83zuVUPh1fFBZvEs3k9Ab5lVQwGwFnZrF+DG1jpgagzs/XWfiq
	 XA7uGcSqJNl7/G5z85PFKMcjen230uoWlYGJttit4iU7O7+Gfq5PZwcFDgrejlqSk3
	 inROeRhXo5Y6xygl7jysRevHqduboC7l3PLAQj4Mp7CRVxD4IJalo8digWAXgMNMoI
	 cJU0/eipkYaDsTsPp18kLZvdYr1IMkuQEimSGPW2AJJUwAF8o251hEU+/J9wo7s/Jr
	 erb/h5/T0RWkcxIu3TP7wr7f/7N44zGD8RW4uwr0HyuPeB4UWL3mo7r/MnyuVx80Ti
	 +VtLPL/WX43Tg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 29DFF2807F0A; Fri, 06 Nov 2026 13:36:20 +0000 (GMT)
Date: Fri, 6 Nov 2026 13:36:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
Message-ID: <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl>
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
	protocol="application/pgp-signature"; boundary="MEobprugY+dfeo1I"
Content-Disposition: inline
In-Reply-To: <20261106130010.340950-1-mike.looijmans@topic.nl>
X-Cookie: Whoever dies with the most toys wins.


--MEobprugY+dfeo1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
> This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate the
> output voltage for disabled PWMs")

Adding Martin who wrote that patch - please CC people if you're directly
updating their patches.

>=20
> A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
> this could also mean that its output pin is tristated for example.
>=20
> If the PWM range is limited to something else than 0..100% this causes the
> probe function to fail with messages like:
>  dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>  pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to registe=
r regulator pwm-regulator
>  pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed wi=
th error -131
>=20
> The reason is that regulator_register() calls get_voltage(). The PWM is
> disabled at this point, and then the validity check triggers.
>=20
> Anything that calls get_voltage() while the PWM is disabled would get an
> -ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>=20
>  drivers/regulator/pwm-regulator.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index 7434b6b22d325..f50530c77d92f 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -157,13 +157,6 @@ static int pwm_regulator_get_voltage(struct regulato=
r_dev *rdev)
> =20
>  	pwm_get_state(drvdata->pwm, &pstate);
> =20
> -	if (!pstate.enabled) {
> -		if (pstate.polarity =3D=3D PWM_POLARITY_INVERSED)
> -			pstate.duty_cycle =3D pstate.period;
> -		else
> -			pstate.duty_cycle =3D 0;
> -	}
> -
>  	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
>  	if (voltage < min(max_uV_duty, min_uV_duty) ||
>  	    voltage > max(max_uV_duty, min_uV_duty))
> ---
> base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
> branch: linux-master-pwm-regulator
>=20
> --=20
> 2.43.0
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>=20
> Please consider the environment before printing this e-mail

--MEobprugY+dfeo1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3X0wAKCRAv73Ows9A4
iXn2AQDCko6gNE9BSWSt4homaAjCbuEWGVhbONdl3k7WPWgbYAD/Zp3WfuDcPglb
YGYF6Sp6OxpgHwpjF5nVJ6DYScqZ8gg=
=Bc+i
-----END PGP SIGNATURE-----

--MEobprugY+dfeo1I--

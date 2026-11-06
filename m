Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972770;
	b=kyR/+MiV7ix6R3A5BOk2NZNPjt62cXwi+LZp3ir+1GCeesF1t9Kxo9o/LqVfL0rLYb/w
	 qLkc3TVqqVneF9NwqyjEQQMf0puotLzus9dx1bzt6qmx2LbhkXBCMjLVqL0fqjU803Z1H
	 xuURSC2fgEiH5q4eGjgFeCOWijSjMds5C0JVArBtbxw4QaeGUzw4uinNs9Ay1w1yBInUy
	 PqHp4mYFJFB8qe/bkp1lXRjDvfIRBsbCrpSx9vODvrnYM6KxvWs1fnCHO+jJWc/hBOVIN
	 vsnUpMGTOWykp+4KVKUE/1muYrCeIckHf7yDuGIOaFUg/yc7VG9bVeiqq/TPkNlSbOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972770;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=g2MAcDNOpKufjkyOtqjhfIPO3pEskXUzH0UHhk9AgDw=;
	b=fiNDj4Qz/Z9h8X3LUdjL/NFHemFS8HzDZ5cW+ESNLB6LoOO6sHnu9ZI45SNH6jdy2vF/
	 GVnfMLAoUDeZtqrDaJMIE/7zwrs2KloFOLhBmD0Lm207GmfSkntPJT/VyNI1JC2ozwMej
	 kuOZgjrRosUZhQbr3dYeHEYYVua+I4+UMEZyFbAmi06HUpsnEj0k62xHe2XTNzY4RKm/6
	 CQLN58O1s6IxynniFExbBG5DYNW8pUT5GVCIr31/qD2PaVjdEkQQJU1eMrgl5fSNn8KWa
	 PNRc48afiQ1rfNKGOwoF5lpeBIqZxebM6jjDBmG/9I8PmWrSfyo74Cj4VOdSgLQC/3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZAMmLmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB0606D816
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZAMmLmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B261F008A1;
	Fri,  6 Nov 2026 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972770;
	bh=g2MAcDNOpKufjkyOtqjhfIPO3pEskXUzH0UHhk9AgDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JZAMmLmr6EJDrH+A1mrrOYlqkSyY3BZrv+SVjgLmSKpUR+2UIFr9iNZFkaD3rdnwI
	 2aIr3RXOzXrtBPARpGtj02vtts6ujJ9mSllCQXyv6WrYmHf3apJCUfmi1phmIjTnrc
	 n2xi3W/1B4dlnYid/M/HdjDkaBqERbVALmEKP8UdeQo2Mpy2q9kjkNhwCexAz7n63B
	 n9O/xJl/mJiFqkhxrsbW2xURcF4D34TNoLdrUmIPLJZ3VuF7PA+lJmC6ezcPBQ0n2z
	 gJvnq6NR5oK8ru9ThInf+GBWDfdAC8CVewtbycsOFYYPAUc0e6M2dg7CoYcl7t3j7w
	 d9fNmoVFMy65w==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 378662807F35; Fri, 06 Nov 2026 13:37:18 +0000 (GMT)
Date: Fri, 6 Nov 2026 13:37:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity
 checks in continuous .get_voltage"
Message-ID: <27e5c94a-acf2-4e32-92df-e3de124e0bc6@sirena.org.uk>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl>
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
	protocol="application/pgp-signature"; boundary="+wkG+ninlD8c9KnP"
Content-Disposition: inline
In-Reply-To: <20261106130010.340950-2-mike.looijmans@topic.nl>
X-Cookie: Whoever dies with the most toys wins.


--+wkG+ninlD8c9KnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:
> This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validity
> checks in continuous .get_voltage").

And again...  please don't try to sneak changes past people :/

> The core, and in particular the machine_constraints_voltage() method,
> expects the regulator to report what the current setting is, even if that
> is outside the allowed range. The core will then bring the voltage into
> that range. It cannot do that if the regulator refuses to return its
> setting, and causes probe() to fail for a pwm-regulator when it has
> restrictions to the PWM range with messages like:
>   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regist=
er
>     regulator pwm-regulator
>   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed
>     with error -131
>=20
> Besides that, regulator_get_voltage() is not supposed to return any
> state information, as is mentioned in the API documentation.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>=20
>  drivers/regulator/pwm-regulator.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index f50530c77d92f..00fcf9a172b47 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -158,9 +158,6 @@ static int pwm_regulator_get_voltage(struct regulator=
_dev *rdev)
>  	pwm_get_state(drvdata->pwm, &pstate);
> =20
>  	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
> -	if (voltage < min(max_uV_duty, min_uV_duty) ||
> -	    voltage > max(max_uV_duty, min_uV_duty))
> -		return -ENOTRECOVERABLE;
> =20
>  	/*
>  	 * The dutycycle for min_uV might be greater than the one for max_uV.
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

--+wkG+ninlD8c9KnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3YDgAKCRAv73Ows9A4
icptAP9/QfgkVW/IGWVlWU0Q2VEYyEcB9pd3fZ5atoYtwh2IOwD/fanHZB22tawV
DmW5DCGOlmc65DVnQlRh3haBF4uGFAw=
=rGxG
-----END PGP SIGNATURE-----

--+wkG+ninlD8c9KnP--

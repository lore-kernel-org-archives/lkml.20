Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0305421231;
	Mon, 31 Aug 2026 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183816; cv=none; b=TKf3RwkkWo1bkpAqMrf28XGMQIzEPTVFa90qZEUMEiuqv9swKqb9odwhh6qvKSFON/i6HyfPfKjOqNfQVJvOWdATkbPsbx/iOjGuV17GyqxzdawjUlB6yE8jG8oS3ySTM4PctzEG++NQ/y5kA55MDqDjYhu4JJG5zD0fqOu3OQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183816; c=relaxed/simple;
	bh=DMeZ/J4WohudPWMLAm1nxH4f/56JlDG166iIAUTtaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+T2c5hv2lWlTQ/iz+yFVTEAPmx3Wth+sNjS/f80zSjq4ORioeQOqZOfA4o/Au7gpIz+Cm5Ugg86z4kV8/f2u+nK1ugjqG5UgUqa6GpUNhKekgliyO8lVwsaeUeNvk1A2wCfxi+F1I2khY1I3o4TTMU5iZsMAzyiB4wxk4yZqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFCeOOyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFCeOOyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182201F00A3F;
	Mon, 31 Aug 2026 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183813;
	bh=pYypBu0OzMZ+quzdWoEKqzqwmmrXDJcbe9Fbm2RcwKg=;
	h=Date:From:To:Cc:Subject;
	b=dFCeOOyCVRt6WDOssWe2f5DTXlAAJV0Av9HTdiS7RoMn0HborkSECc7qNWKwguyW3
	 ukLEL1NTYd0AU1Y0HnR2gdWJQEC20FRwUd4rzEm/k+dJchkvFV0oBIQaJAVT6bsiZ3
	 PbuHtNWrUs/QGVFyajSgG1ZGegbKQQ0/FixrcwcNVOPmin/+udCzTWwvVBh+JJ5i0C
	 GOJq9BbgfWpaI2gExykBCZRYD6GWHyh5C7YnYztTJgsIt0tzf1toRw58rMW4LislEJ
	 LVDdqjbMYWRxk//RLr4PqGYtvAOIuiFXU9Z4mEGq9ir2CAq9kZPgZ4eVYqU//nKErN
	 LVal7z8/v6F7Q==
Date: Mon, 31 Aug 2026 14:43:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <apWFAoNOz2pX5xiJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CB+AxacBKJqsqFR9"
Content-Disposition: inline


--CB+AxacBKJqsqFR9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hwmon-staging tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/hwmon/hwmon.c:344:13: error: redefinition of 'is_hwmon_device'
  344 | static bool is_hwmon_device(struct device *dev)
      |             ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/hwmon/hwmon.c:321:13: note: previous definition of 'is_hwmon_device' with type 'bool(struct device *)' {aka '_Bool(struct device *)'}
  321 | static bool is_hwmon_device(struct device *dev)
      |             ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/hwmon/hwmon.c:321:13: warning: 'is_hwmon_device' defined but not used [-Wunused-function]


Caused by commit

   40b20f8e6b53e (hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device)

and the more intentional seeming

   a40a97b27cd6b (hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device)

interacting, I assume some cherry pick issue or something.  I have used
the tree from next-20260828 instead.

--CB+AxacBKJqsqFR9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVhQEACgkQJNaLcl1U
h9AlKgf/XXstOviZB5vAFQZCrSlIdiPIUbpS7QqIwn5NSDAqpD/87na4blQxwEkR
PYrmWeeZBT6MEtoIij0JrRZikf6SlSpD1ERFpGpar1rc19xATOYQ8r+DvC9JPW7h
AiOoTFAOZussc23f//kF0oiQH4AdHHF29VJ7VffMZECyWRy8jaXSaCfGfMB2Y0rU
JKBeZ+9LifZ5PmATgZPMIJt/t4Z+X2li/cfuBipiZEtivaXUx5+1qh+1Ue/LjPFf
pAIhlRsCYFhH9lnOaszmRiuKe75+EZO0DKT8SoP63mLa7Z4kcf5uvoTBEwdGUyV1
1uKG4QRewjuEGSmIeNwsVzwl+vR0TA==
=a6aG
-----END PGP SIGNATURE-----

--CB+AxacBKJqsqFR9--

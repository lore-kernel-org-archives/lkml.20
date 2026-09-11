Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B70472098;
	Fri, 11 Sep 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132878; cv=none; b=Wb7RkTCW+RRtwUchYvpnOBENDGlgn93QNJhLysolZo09bd0dKzCwmL1zCMTKsXyowqN96iTmoac0Ja/qmYtk63ZMHPTzQE65NveTc+06x7bdchW+fDO6EJF772xE/1paxDRhexiILjKHdx3h4iU7FVkraGmemRU3Fc5JbioqNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132878; c=relaxed/simple;
	bh=LVtfPua2nFQQRvHWqVCkr2aYhqIZD81fW8p5hSMKOVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q10F1bIDJrjX7dYx3PAskZwjlNdmxoG9sPr0TwQs7/8nnKvVMxJyeVumFTny30McQhxYhrUsZf0vyiPtYckmryybr1qQHA2TAEHQU67jAbrKmigGIabd6S6YtZm4+6EoXPruxw10+l6GVbMG5MjWaPnvxvKN1TJGKqmxTo+VRuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=II0mQMfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="II0mQMfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1051F000FF;
	Fri, 11 Sep 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132873;
	bh=avlp5r779dalvTpBbg+374wumzD01b73I7Ey2y8KDww=;
	h=Date:From:To:Cc:Subject;
	b=II0mQMfU3BXvBy7dYLOmIrDIa63EiUh0U8owndeR+kzmkIu/A/z2P+oSYRBGCWW5u
	 XO1HXyXp2zLPd+u+JdP0OFaeWhpAp6SoSQjK2NV4MpoLyqwfUONAngGtjAkRGLzcMi
	 UKPHWUI2ZvBP2u0K77qCQAQKOZgMv4iewKm/a42327nFiDsjQDVEMtlKoRfFlx9pMV
	 A+6qoHdSzfeKK33arfb/DWg3fCGjzOvreDTEHVR8PBQZIXr6lUpZR/iNjKgbarvLiW
	 a6dyjvQ9hyU2DTsQXKTYX7GUlvdb4mG2M2Gg6FlzPXpoRhluT9Ey13R+KQNDGAcKZb
	 yMjpeAKJGe3nA==
Date: Fri, 11 Sep 2026 14:21:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <aqQARvWlSUQEHMtw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9aEwxOLKQRheoRmh"
Content-Disposition: inline


--9aEwxOLKQRheoRmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  e40edfa049b96 ("Bluetooth: SMP: Zeroize raw key data on the stack in smp_e()")
  ee0662ba1e0a5 ("Bluetooth: hci_sync: Serialize local codec list cleanup")
  6691666bb4b22 ("Bluetooth: hci_qca: Do not write to the serial port after it is closed")

are missing a Signed-off-by from their committers

--9aEwxOLKQRheoRmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkAEUACgkQJNaLcl1U
h9AyjAf/W1i/dEknvxmgFHnBlHMKuoZPYocKywE+NochLtDmjzHQZWDVADwAGhfR
JMzHlNtR2BAF7p6JrPAeBHaEd8FgGspHPVgxd15P01tpIriEigcw936HYTXOGLCE
0ObH4//aVXQl+VSAZSEF+1t3WwO9M3Y9M5aXQZbGz/vzBtGpySZXePBO2YB2snXY
EgbsGDI9fS6a/VlxHIWZ7ClD4JRvoZ9cOrB+sQPKMVjHhF7suGcNF4XZ2Ny32dwx
TvhWdHbWunvIwOklAHMUMZ6G4Sk8T5oF0UwVjIGscNA8A/jPHB1w/oLbSjcOs5sE
q+icixVSFve/Ore4JYISDRAofW3B+w==
=8m/Z
-----END PGP SIGNATURE-----

--9aEwxOLKQRheoRmh--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD2469859;
	Thu,  1 Oct 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859721; cv=none; b=qIS7HQKRi78yn/IbFnScJAqckd+wM36LR9BXHrE0XW2GdP43cK/gksrlloBV5PPjBXisB2kJv4yArKTL2gmVDK+t0aBjsxun8ps5Lj6WS+kcdZh65nKNDF/E0JY+6M0GllQhX6+VEBblndkIYUf03vhUsrvzlSvkt4rX9CCfKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859721; c=relaxed/simple;
	bh=B/kX/Zl6l9uTYnJzKFACmRLX+cF/aR7lKdcOd6dc3cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQwAjFLwdO6U0sV2UEzKKT6crT1IbJ58d4bmpc6XPZ0n7FlseIAufy3VmZ+YlgsPbTnPGxitqHWEwl77ha8NN9PIwtEd864gLwG0N/3T3KXLoLk8tnUH5XhUMVY8TsGLt9nkLgWjR4WOO7iP9E8dxlzNvyPslv4eP3kJxjcneDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2U6tgOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2U6tgOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87131F000FF;
	Thu,  1 Oct 2026 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859720;
	bh=/RYzFekvh++mtVzB6gEAOLjBD3DaNSOVGyhP8K2TkWA=;
	h=Date:From:To:Cc:Subject;
	b=I2U6tgOjYY2pyHtYwAnKYFelZPkpDj9v+RrYirhGbYLf1quxjxdWd9ti99IRgHyt5
	 VCJU0+Kps4ZUIIzfK/L9eozDTIcaL/TgJi1mWXukYmnbJaEBVm8s+3XgCrcBdkGSGP
	 5DLCVkBxK8ovMxm2wVvos590YCsmxq8e24eOohpoy9EcBl4FIfpcCV5M3bB9fboodI
	 BKoyWIlFwj2sYR0Pks74trutcSNpsXUBbiaXCMn0h4YdhbcqQjrJuJPKjXnnwfcEk+
	 lKj0sKTYdPot60h15nfpWPmq6j75aYFMoNsQIx+eKLDb//m6ThiMmdxl/mJUWFiu9W
	 orAvEQYNDxJhQ==
Date: Thu, 1 Oct 2026 14:01:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the rtc tree
Message-ID: <ar5ZxSHNRMRyJP-s@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aeRub/LetDy+NY6b"
Content-Disposition: inline


--aeRub/LetDy+NY6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  d41ee317c9907 ("rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove")

Fixes tag

  Fixes: 1d61d2592c1f ("rtc: ftrtc010: Rename to Faraday FTRTC010")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--aeRub/LetDy+NY6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+WcQACgkQJNaLcl1U
h9DS3Af9FhuIWeT2Eb0e+zFCi83cpU1fJ82NAEi8Ge/YuEXZuN7bLJ8Fhpd2wzJg
cpKSIAkocSMukLRa1PElI+wO2sGYt997jzmPpOHYqkv1r/1QE2QtJsr9t28P670R
yjJZFzZ7UhY2zrMz1vvXzRF43bwHzUxlGLAjO1pB+PbnXxSN1kBkmsU8bMtXNNl0
PP2EzJvaCogiONb2h0/l2t1OE19hruJmWiMhXV9OAdBihlWDZam+DUcxKF5vq/AP
dD/Lhp2HI3tlv3nap8wx/CnEKuIcNdGXCy0z6uwC6zH76IQEcvlF1sdSqe9BxNqf
pboJgugXz/5pJ3NQ7WsKcl8PuGsrWg==
=nUxT
-----END PGP SIGNATURE-----

--aeRub/LetDy+NY6b--

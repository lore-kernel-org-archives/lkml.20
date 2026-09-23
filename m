Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8C35A3A4;
	Wed, 23 Sep 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181169; cv=none; b=J8VZfjCOOjvdxQj2teI7qR9CeA6bNmqNR16FsPRoR2MJmT2pwH4zC2fLzUhljIA9rjrWe1Bp9g4kQ5FXmnpwgfhSBpcccMLXEm7cWrnJgQJUgdsbI3qEvp1uJt8hTFIYS3WnLYTeH3GInlMNhsfSAVTPIrinPyEOi/x20r66e7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181169; c=relaxed/simple;
	bh=7wj/HrvkIr6buZPNjt13+J17qP3FnMl/DXdx94f3/f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HktR3uPeoIWS1Ufg+vUBNb/VGBGqbVrJdqphhf0wuAptLXkOJaCHwZMNmnbBWeTEjeBnJ1kscX5yrZlyCgsVRPbw2liJ99mT4P8W7irtbMWzHyX6HwL7TBmW3y3F88QDiAR+MGpZUaSMf6PUtqxhjfm8f43desiMWtj49MFdKME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0o73AaC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0o73AaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7371F000FF;
	Wed, 23 Sep 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181168;
	bh=7wj/HrvkIr6buZPNjt13+J17qP3FnMl/DXdx94f3/f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B0o73AaCiWzA5I/pjiCC/GECwmBbyZRsoYitw57g6H/O2ZF1Vt2I2I4gAotMC9yh4
	 kKdMR1DfSgqEBW9Jt2ZY1cY1oLHAtQcUcF4nVSi0EYhr5BuhxrAlKW1OW2AxvrbsJp
	 b3Qo5DaI1yGDA4LnKOWhCy8O9VQdRQQnSxjPQgr24LNEwhcmEFyAN3UvO+RRXke0sl
	 KK9KWKSHkoXFIKwNIHN4bgRcKpn3qrSWsNrUTrDde8QEQLpi7QttZfDy6G0oAcKMqb
	 uj8aJBoI+p61csAAsouzGRPSLUFGUQEZW43dKtFkOr4CWaYod7IcRFv0P2XsWF4MRJ
	 +JPZmjmcxpf0Q==
Date: Wed, 23 Sep 2026 17:32:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <20260923-evaluator-appetite-d3b70cefa03e@spud>
References: <20260923144905.3365851-1-petko.manolov@konsulko.com>
 <20260923144905.3365851-2-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Ouve/B/deH8VcxM"
Content-Disposition: inline
In-Reply-To: <20260923144905.3365851-2-petko.manolov@konsulko.com>

--6Ouve/B/deH8VcxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6Ouve/B/deH8VcxM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarP/LAAKCRB4tDGHoIJi
0ipZAQCcm9qDjG475QAn14IAOXjrEgDUmQzzLvnyobfxj5TR1QEArBvKMmVoDvpC
fj9bsonHsSvP5gqAQf959Por/z8YNAQ=
=08Yz
-----END PGP SIGNATURE-----

--6Ouve/B/deH8VcxM--

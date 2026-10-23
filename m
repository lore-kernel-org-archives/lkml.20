Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756683;
	b=W7j/7xJMVEJ3M4GMqzD6lXCFks1G8krGVXj5t6EqdF+ru1iyZvpOodmLE7ou7B490v+3
	 kFdC262O9p6+3dubmZDZEV30J0kdw7qMpim3qfpY6Q8EurmSbXreE/JFzqMhCDFKks/N0
	 LlFjh5sWh13/qlTL2jshspUiZoFRcNMMfRNAGhnBY1uX2NRlRb0aEJv2OoR4t/db/OyVl
	 JaXiVbNseToKCmqPRxQ8eQz5337dcHBAhKy2Puhe98O3lo1oi3ZhQk+spJqq3c7Ymu72m
	 xUBYOcgbzGMIOUwNeIXp7e30zrByrr9SNBasi6dxJdCKsYmaffb03neyNxCGlsQhj4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756683;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=o61ieacxr1eETeqNLTGL2iNOcu6hAarQpQ9okUNbDyw=;
	b=Lcfi5TjTdK19x+0lVUk+ds7jg7KyaQiwJvqmrTZEeBsX5d9f0NPQMwXyk9X0ME3ut+iB
	 cKiPlpPi6mf2/BGaH7PYvxZGSVemUMY8oBUTyzK6Qno62lcUeAT3a1NEKRPkEbJnNWsR8
	 L1TR4Xi2IltBI1mDEXlCtfk6rQwgh21Rg2LkRGFU2Zc6iy8dZf+C9artn6QT3pHIyfPQ3
	 vCQI4taj0IznaSZkJ6aNsUQGIllE/mSOWSqUMIwlIQPxfIIy0JehbG59ZUQOI73zxvIGP
	 aDkhzUmvDbEk5dwIPXyhDCo5Uc6yOVVOvOKffhz4SdIaMkWiYLYl+cQwqS/ytBFF7fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D72emF7C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE30606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D72emF7C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2423B1F01825;
	Fri, 23 Oct 2026 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792756683;
	bh=o61ieacxr1eETeqNLTGL2iNOcu6hAarQpQ9okUNbDyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D72emF7CYHwQS4s5Dmr/yFRa4odRyU+VTIif5ZjIsO5EMnTlIrcNUZ52P+MtVn1ep
	 071U4TcghaUKiB3qOSKKp4b8eNRA3NgrPDmicuWAG4su0SeRhg/8nk6/5TG4yf8eaI
	 ZLdoQldozxQI7DeK0FBKSG8bMz7xB/OUmpEaTl65NUbhDXS0+NpjxRAe42U+9ny+hQ
	 OC9dhqveFoRDCJNS0osJp13gjmkHYDMmxcntUiK6x9WiozcpblgBo59O6yptcZOggc
	 7OXCyhTYe+Q4rSupdvMdviqcW301EBslaILqQCRFOg2hwX5o2SA9gRbjsB/36fTJPY
	 NhvSgOZuWbRSw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D9F501D59F93; Fri, 23 Oct 2026 12:58:00 +0100 (BST)
Date: Fri, 23 Oct 2026 12:58:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] regulator: axp20x: Add support for the AXP2101
Message-ID: <attLyC7H__mw545w@sirena.org.uk>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-4-olivier@mgcrea.io>
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
	protocol="application/pgp-signature"; boundary="Cseg4qCM0IhmVrdT"
Content-Disposition: inline
In-Reply-To: <20261023100401.67592-4-olivier@mgcrea.io>
X-Cookie: Whoever dies with the most toys wins.


--Cseg4qCM0IhmVrdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2026 at 12:03:57PM +0200, Olivier Louvignes wrote:
> DCDC1 (1.5-3.4 V), DCDC2-4 (0.5-1.2 V by 10 mV, then 20 mV steps, DCDC3
> up to 3.4 V by 100 mV), DCDC5 (1.4-3.7 V and 1.2 V), ALDO1-4 and BLDO1-2
> (0.5-3.5 V), DLDO1 (0.5-3.4 V), and DLDO2 and CPUSLDO (0.5-1.4 V by 50
> mV). The DCDC frequency is not known to be configurable.

Acked-by: Mark Brown <broonie@kernel.org>

--Cseg4qCM0IhmVrdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCattLwwAKCRAv73Ows9A4
iZ8wAQCPILSeTRnnOhgO5NM11vswdLUD1L0NgdnJavCksWHfuwD/byRH4qkcI2yG
64I/ux1F7G6arhKdhaj/hIAhQdx1ugE=
=AowT
-----END PGP SIGNATURE-----

--Cseg4qCM0IhmVrdT--

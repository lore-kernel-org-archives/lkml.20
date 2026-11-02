Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639827;
	b=KmsTh2CsObk3yzD5ucqfNyVBRtDHSxwEI0saUIKoAxo55Skal6b0Lc17nGHJvSM1LXDd
	 wS0vjLF7oH0dBb8yloFpPFQ8blg31ECZPOz3wr565O9iRMHIIEbnXRyW8fAFymiMEbYZe
	 iIvBM4gDz6rqa8H2jyDT07bW7VUAE/kkPnVVFAohUfFoDT9E2CYff4v6b9qi2nlVdTRvP
	 RFhiJ7q/sUD/cj89Y9seaLkqVQl3iDjkedwjSguQLbR2FvNv75lari7hm+0s6p7UGtjAi
	 zNG3joLvwaLD/svAtv94yAL/dStpF3uE8Ku3VEWUvZReSlw5dEudVKkcVws+HmEgi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639827;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=dhcI8iXfoBfJ1dGo4txMhr/t00XMqwmFL5pRs3OUOTw=;
	b=wJGo0151knbXYj0Lu9ifCfJ+2LivTTJnPkWYf+znI2tYQlmP414zBugL1wypRCAEhO+4
	 iNc4R1RrpVyP4vhNXa41PNCls9pv6PxCuJr/iRUX5/oI5/BG8o7sEAxvxCz4j7vm1tt+U
	 1pJFR4EY3jifotOtXFYxNd6A+I0CbyOhIMZxMI2pe+FHVuaavNuCqS1mme4A/R6TAGCR+
	 EYHWuffmfqqWUJExpNjjFQ6GrZW1N6K2W/dI18ijfXrsBBxNCK8n/NF6HJx3lbvvlFm5u
	 Cxb7zBilFONJqJOs0fnLkQHwJ9yuXwRN28W+v0JJyPv196BBaeryMQhMj4tWnhtPuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XNCMYF+Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC0606A926
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XNCMYF+Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD831F00A16;
	Mon,  2 Nov 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639827;
	bh=dhcI8iXfoBfJ1dGo4txMhr/t00XMqwmFL5pRs3OUOTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XNCMYF+QTnLC1C3ozGNL7UkhdATIcQkh7LAYv8aXDSDSoAsqTBNqp1Bb96Tx9UfVi
	 CqgWpvgplDgN8NXIm0903Ha0fmPruOmDTVeBE922HEQ6DvrRrNc+TX8VAR2dGwihZS
	 Hy+uoM0gHz/akb4cS8uHJ/NVdEoRxk99dHFBYYejnpB0YyjW4m6aORqQBt820CQQi8
	 laYoUo1bQhVYZ2XAWc39mTs12fbJNTk//AvIxjr6CNXvl6eBO4RICSyR8ZVDksMFye
	 vm+JPIZezmCxaGjb5xPOpkcGZVJma7pWsPlnUFHM4BtJo/x0gBjZQRCdFsCHl3Wios
	 j7d5H/NqeMrxA==
Date: Mon, 2 Nov 2026 17:17:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] regulator: sy7636a: wait for power good on enable
Message-ID: <c0dbf6cf-b556-45fc-8935-71cec6fd50b0@sirena.org.uk>
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-4-pmazzini@gmail.com>
 <179362625591.1990291.13023153378073511078.b4-review@b4>
 <CAAxh=jsmE=vzn_6e9JiVbFcjsH7+-0kf8x=4J7Krufzb5E=9HA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="om8lPdpIwABg6Otq"
Content-Disposition: inline
In-Reply-To: <CAAxh=jsmE=vzn_6e9JiVbFcjsH7+-0kf8x=4J7Krufzb5E=9HA@mail.gmail.com>
X-Cookie: Used with permission.


--om8lPdpIwABg6Otq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 05:08:40PM +0000, Pablo Mazzini wrote:
> Right, I will skip the wait when power good is already high.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--om8lPdpIwABg6Otq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroxY4ACgkQJNaLcl1U
h9ArCQf/VMuphXEtXefJsQVtXp7zQAtwZ9SJmwVDMCD69o6wARyfgPb+WlFuDziD
iwEakl5qcIuWO4U0h5U8XV8qwEBIKD3SewMhumUnyXRKlXL048yTpGlAvm+mlLcD
5x4DzgrQaejbKKPsyevXUVyo8brhta/XJeuGG4lDVKaw0Z5pgITdi2dbymEyMAWi
EodDpffW1Rt4T8zLxPN68n9Ch92FA9zy1hXdaNnMR8rfnNtQmqvaeZH8cElYnJqS
95T6C4hSzQmI26vsIQcBRyGL54ovBZRSkp8U0CX2+MVrPXCjs7tZQNogsy2xxmkx
6wywGEMCSeFeqsc5BFBdasoOIZC96A==
=7Z8m
-----END PGP SIGNATURE-----

--om8lPdpIwABg6Otq--

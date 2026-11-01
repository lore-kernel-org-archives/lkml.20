Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572816;
	b=alY0N/6ZIinZvWfjr09PNaArrRj7pe2i38hSMUmAX2tmQuztdI8t2W1XpmYwhTYxLlwb
	 e5DMMZtOF3efV5dG7zV2M2/yFt1bDPEzRBIE7C1t0d66vrBcnfLWgSosdaxWrNLz61WuG
	 SlufNlhVdgFnIXPsKAIMjAUsFVZEjOhsKQTiooWRbwRzmv4g6fq6M6iqa1YQ6eOzTDErT
	 D4TVupF083hVpeoYfSFnowoz9yaKBgitz2haH/cQg/loOv0XAz6LxNlp/9u0ehaEQML+9
	 dDIOWYIKy7bDPGlGvHJWur8OXaHP6K7jmOyaz3sm3jlPCkTdDqZv6ilXFHVyXfGBUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572816;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=3if99zGsFpoaWlPkVMPbJ3l6rF8wASBCV35D8Ivm+Tw=;
	b=cu8XDUXqKoi6MMj3AtomWD/PvJQPU08ciLP0jI9ADmrkabqRA+fgnOwAjgdfMPJcFu98
	 mypWMucCsQll6vpIg9AsiZUb1LbnlvPlklJsKOgmy6L6qfLdY3fX55jmvcn0MuHO9cDJd
	 rPflq8x8VMXuk3+BYDZUEX9TMPD8W4Y1uaW3KHKTrQQP1oeakJp9cXXtwME6pXiZCRPIB
	 ssuc1nXVKFj9ndXpx/4osJxQyh4rTe74KIcPuEnZstigY/93vllR4NWO4veOVeJmz1wb1
	 xntyfUIXz5hkVkNJx6d5Nn+0sp/Wzbl1fxrNXRQ7qQbicVGDZwPGxtef9F9whrBZoww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msy09BZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035E606A332;
	Sun,  1 Nov 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msy09BZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9DB1F000C1;
	Sun,  1 Nov 2026 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572816;
	bh=3if99zGsFpoaWlPkVMPbJ3l6rF8wASBCV35D8Ivm+Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=msy09BZhssA6usmKymBv0dLLJ/G+ZdbslQU3LojnIT4huMx6tfrJ2jBNI1H1vecCr
	 Yf6109z3JHG9OG6DuyMDDqKSXeLR+wIiWedINBXKxV8qwakU+C95PIW9LHYKeN30X6
	 YXnHuoTuc3M3ON2IdcuU1SVBl/v1+OmxZTuFcEVzFkCgjfY7QxtJXbPRpBaKGmNw21
	 I/X9vTFbkvAZkENgqLpn/J8t4rr8oXQlcxwpxVeu2CaiT5eZ6rLLDPUgjX9KDo6fq8
	 LBBoAXJj4aUQHEaO+G50eJgJi0yoE7T+4A/4fMVambXr6Gv+gTO69eFtXUPBh9Nh6G
	 NNZN6qKFsxkCA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 593ED2064B9F; Sun, 01 Nov 2026 22:40:13 +0000 (GMT)
Date: Sun, 1 Nov 2026 22:40:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/3] regulator: add the WL2868C camera PMIC and its
 users
Message-ID: <aue_zSZqx_hsM7c2@sirena.org.uk>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
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
	protocol="application/pgp-signature"; boundary="azfLz2Hh5u+PuUby"
Content-Disposition: inline
In-Reply-To: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
X-Cookie: Whoever dies with the most toys wins.


--azfLz2Hh5u+PuUby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 11:42:57AM +0800, Qianhui Xu wrote:
> regulator: add the WL2868C camera PMIC and its users
>=20
> Hi all,
>=20
> this series adds a driver for the WL2868C camera PMIC found on the Lenovo
> Legion Tab (TB322FC / "elden", SM8750).  The chip is an I2C regulator with
> seven LDOs; on this board eight supplies are wired to the camera stack
> (S5KJNS sensor, GC08A8 sensor, GT9764 VCM, and the CSIPHY rails).

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--azfLz2Hh5u+PuUby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaue/xgAKCRAv73Ows9A4
ib9SAP45+umsB9CT/sdvyPYwgxPmpvvNnIDEphWcj/z+6QAB9gEA4JsxnIGmlYm5
5xu1BzZLaGMpjd7eB3h0keQEvCBj5Ao=
=od5F
-----END PGP SIGNATURE-----

--azfLz2Hh5u+PuUby--

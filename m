Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503880;
	b=r7mGWhNKc/V64r2PJDcFkDFgVAyyjqOcMBTZrby95fsQmGetGaLaqxavjZn/0uHTtfoZ
	 /uZB5UrSrqUh8OOYzn6Ax8KUMl4Qk1z6hv5bjQnk+q06/0YowBPcgN0iNZCFBeO6sptLN
	 yuQWqJLbBHtxaPReiqIrGHWBtzUuWv8BbPsbmNmBwaDztJWd78P5KcF2hzWNtdLGhuy9I
	 M9p+wpXprkLtUXceoc3tgzn07oWTwOK7nW5R+fZLuaTD3i5tzNRNhnzEkyCjK7Gh5gNnD
	 eJ56n6y5oVM4zxiwTIfIUF6mrOMWRiQtsmGEOJ/ZkFffU4vlcm/ru5qaR3BUeBOT3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503880;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Ja+gqSqJOdKCK/Bh+e4+IiJm3sk6MFvWKtgYDqRgAng=;
	b=NRUx8o7fXphikNIxz91Twxpaq2xZMm7e58hpD8dRhvdFzkym5gBcX2DocmZihfGHI2zU
	 XHLN3aiTvksgH7kuxfIFM8wrrFM6etQiKzpfcA/vcjs06Mel/5YJaM5xwCkt9dUZKYbvh
	 4otZ3RZe/D5XJ4vA/31gywyOekENXrVVRdVwpUksJLPJaDuNoaUU2b4nffcrmfPDVt7jM
	 8hiXpnC2aW4eblWVm0q3NiGW4aZbw0GKw5b8i/Tf04mbNiKSORz9vFdekAjFmFX3qjN4G
	 tedwzSDcXszQHI7qgfYPJ4UavguDHiY41xJaFF8rcfcSmQPerStNpmmQUZLs/CyXRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcoQO9nV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A760A262D;
	Tue, 20 Oct 2026 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcoQO9nV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A55E1F000C5;
	Tue, 20 Oct 2026 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503879;
	bh=Ja+gqSqJOdKCK/Bh+e4+IiJm3sk6MFvWKtgYDqRgAng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VcoQO9nV9srRY8du8dennLbTmgWVnN/UmJbz7V2gWdVcSeSnPg5i572vC1Agj4HVe
	 Rdg3QqKb1bERmj6bpdnaUHSpbX8bnyHw67p0jaC02MXXYiEXr/LOeILX8iGqw8muz8
	 TzVZBg0je3Q0UQW8sHZqy58dQ9A6nKilYzG1ayjaUIN5UeBdgW9o0MSvHw9jKYDGKs
	 4MRqor+2jCqtVQkd5nlhVs47ju9dMuP/UF18zguqcHFJiq/++gNsG+k3Jgp/xGtAYs
	 Ei/KlHVSXydU6ZcxIbR3ZGp5+AKjnaaKxdzkJOdnk9+4PSGsOdCR5fq71Q0VcDNdwZ
	 3gsgVI8tUYBYQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D72261AC5994; Tue, 20 Oct 2026 14:44:36 +0100 (BST)
Date: Tue, 20 Oct 2026 14:44:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Wait for firmware timer expiry before
 system suspend
Message-ID: <atdwRCswAUZ8f2M-@sirena.co.uk>
References: <20260915102110.3276924-1-rf@opensource.cirrus.com>
 <178948311377.151760.13181956545960061223.b4-ty@b4>
 <f3af6d37-abb4-4641-99e5-b9554f0e64ad@opensource.cirrus.com>
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
	protocol="application/pgp-signature"; boundary="7nIQD3szGvtuMB+x"
Content-Disposition: inline
In-Reply-To: <f3af6d37-abb4-4641-99e5-b9554f0e64ad@opensource.cirrus.com>
X-Cookie: You buttered your bread, now lie in it.


--7nIQD3szGvtuMB+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2026 at 02:21:37PM +0100, Richard Fitzgerald wrote:

> This commit seems to have got lost somehow. I can't see it in any of
> your branches.

> Does it need a resend?

Yes, please.

--7nIQD3szGvtuMB+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdwRAAKCRAv73Ows9A4
iU4pAP0YKzy5e38DiyxokJQ9itBj1ePUKC27MUXdzzVBV1PingD/ZG76UjMGi63i
B8p5bfJWf0JoXOJ/jPPiZuM4DkbIEQs=
=fdES
-----END PGP SIGNATURE-----

--7nIQD3szGvtuMB+x--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585E3B47F5;
	Tue, 15 Sep 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475151; cv=none; b=s9/rzZ2TtaYdVz1MM4NBEUSfuFGx+i8qMxggFitT9redwR+6GrolZ+xBY1vWAYKD2f7L8vxtaN7SRjX1IAStudfLHItWtRHkg3IqKZNLnZ4iyW2K6JwqwJFqfwRisfwiBOo2aWN9+V37U8HhMFiuKgh5eq+SG7QqdTg0e9lAjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475151; c=relaxed/simple;
	bh=0vrZ27TWxC9cE9UwgrK49wDe0LIanW44xi5oyU07R9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lu1CUJPPdwYTTwB54JzA4VuWUm/06b6hxczfiWrplaMvxDZRc0XKdh1seHTUsLk1+itHjeQW1t9ReSUG5LR/gbS/3th967gw53TqaJwBwdxGGaEw/0qWtb5A/+7dz1ookAEM87ER92zUPkQP6ehuGdUzeOOBC9+A2rTUR09oGw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zdn+CwTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zdn+CwTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE501F00898;
	Tue, 15 Sep 2026 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789475149;
	bh=HHYAPAF1wxEqtbhhunxpqcNfazQuKu21weORcfBXlFM=;
	h=Date:From:To:Cc:Subject;
	b=Zdn+CwTHp1YAY5XQkTjBDbaqxheyAc+9UBEtLA4h02PfTMofg6gr20xSr4+GnNb6N
	 m0aH5gkgHLXa0PKI+zAKNVfnqg8tyq4IdQsLrBjaz1Te65uJulw++g74zXEWuEqn4Y
	 AElxszaQ28IqPuUp+XpNbIiW5fN0NckxqguKs5RzgE6TeHOJxopa1l4+1cNnQnfA07
	 L7qfqAWjp1phFf6/2y6QmnJ6AFLDbEDBE0VANB/Vt5ZuyqQDdot7bMxnNlXqljRelK
	 xIhVM8IBfR5GnPsU3vTUQfbbh9fTBkFOCnfZJLO+4bS5bkmzp42Vqu1sq1cWD3EbXA
	 dVBgImY8Aeguw==
Date: Tue, 15 Sep 2026 13:25:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ntfs tree
Message-ID: <aqk5SpZbYVU452_A@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8RgCh9avGBEJPwXH"
Content-Disposition: inline


--8RgCh9avGBEJPwXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ntfs tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

arm-linux-gnueabihf-ld: fs/ntfs/mft.o: in function `ntfs_prepare_mft_folio_units':
/tmp/next/build/fs/ntfs/mft.c:3116:(.text+0x63ec): undefined reference to `__aeabi_uldivmod'

Caused by commit

   107857fee6272 (ntfs: write MFT folios through mapped I/O units)

I have used the tree from next-20260914 instead.

--8RgCh9avGBEJPwXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpOUkACgkQJNaLcl1U
h9Ag+Af/UFLC/kYNfRUO+xdqZkI5Ry7+zDkGYQJi6ONb1xiTnGbUeDjzFPBMPNIA
VIS4R+8A6sC9dCXrHFw3lk1qVnJznNF5iWk65kLibaV0kdtjdtZ5UIA5RcJT6DoY
T6J26gEL7vBZqyf8HViExwb87S1aFcbXbblratjj/7yudahA37cLL2f4T1VPvbU8
AF/+ukhd+zwYju4Wg/1r7XYJev0vGSfELQgsXPTWCLFZsdY2382iU2Mb0PgBj+Hm
HVLLbUvCOG4XbRlkBa06mO0yKqESCV8F27X9EzQz/5VvT8JZ8a3HniEUUlAT9r/0
2fiJdpcgp7nXLarhLM00WcMpAV/XjA==
=49BZ
-----END PGP SIGNATURE-----

--8RgCh9avGBEJPwXH--

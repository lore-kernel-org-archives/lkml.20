Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490196;
	b=GIW2cmRCbxz6L6K2MNeVs891KKxkAWNTQasi66L8IBDjqIaWdz7/r30zgSAxxEvGlW93
	 tu6oRI5BUI8Ic7jPNByPsLH7vi2wUdpNPJqUsq98GYM0NIfbzq9hTr0itOq5fnx3wtcaA
	 eX29NOipJ8dkOrSGMwt6jHlCXIXneZrdyDGYmw8urid9+WdjHqzMypzM9EbCQ98XY8PsY
	 7EWrhxhERE+EyyapM7g396cyX+4BSxQCk+RmsbwDWfDRMoor8bgTqkFRrpZS10tQcaaI2
	 7z+OVdmYtYznPeMv/fd8taPnYeZl5nFIFT0HKvlcE2fKmblNc806TW+ipt/TBpkujgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490196;
	h=Received:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=o5nPT80H26GdyBzi0jXQI+glih+JcqqJunkB/+qK6Vs=;
	b=cJCzYLmUeOed6v5dqYFVUfl3wc30V3Dak9+ZrHY6wyr/D3EokxNlOno+AbjcdgJi+10r
	 234sXM6sg9NYqsDu00kcte4tTytyhVlZlHWOXMtVSN4YKj4uFV902G74OCIL477QY4HXT
	 k5R3UzWh/oev88fPusVqLD8Bq47jtczdnI6MAzQaJSh9tM9DlY4lNqqO9J65NUB6zhKTY
	 DYlyTJ8gwO2jxRN98EKL/xYdVf72jwx5sVNVDTcJ1EBFdIYID9ZosYkvxWhKVSJFnI4Dr
	 jNxJ54iYOGmRV5G56l0/KGIIK6BVltE9onsVbB1T/y1i0m+0/UzrV0Ggaw68XtsSxYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Dii7/WyL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BB606A31B;
	Tue, 20 Oct 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dii7/WyL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1F01F000C4;
	Tue, 20 Oct 2026 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490195;
	bh=o5nPT80H26GdyBzi0jXQI+glih+JcqqJunkB/+qK6Vs=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Dii7/WyLkTvxAtglO59Rn+MdAJtEDZ1gj21jM+4fXp2QToxheJ2JexSgiXDRz0z/J
	 q7adBt5ofc75IdmfV5DB8VDwxa5EyDHdqL/fXRLLjY+PRie51sobmzj2dabUfPi56b
	 /dIB3g087Ul1a2Jsxogl2MAGuR3/CylkD9Sce+nUuR4DOLla8icCaxCOO/fJHPDrVV
	 jIqwkuuoWCrl7sP+PGc1p42O/SKLpk/L/7qn+Td1Fvbc8yl9FodTN+3BhHtRRWKLSF
	 sJjdIUq3amdL3wxLq3GIBeHK4NuUg3FuYPLSIMjxYhdN7agzInw0ZcgWcidLyHWzmg
	 F4WzQhS4/gjqQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AF8C01AC57D0; Tue, 20 Oct 2026 10:56:33 +0100 (BST)
Date: Tue, 20 Oct 2026 10:56:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ieee1394 tree with the origin
 tree
Message-ID: <atc60bmnIKiYCUHf@sirena.co.uk>
References: <atZBEI6G3PgKHKaW@sirena.co.uk>
 <20261020014456.GA335452@sakamocchi.jp>
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
	protocol="application/pgp-signature"; boundary="iA7d2ElpplopvgST"
Content-Disposition: inline
In-Reply-To: <20261020014456.GA335452@sakamocchi.jp>
X-Cookie: You buttered your bread, now lie in it.


--iA7d2ElpplopvgST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2026 at 10:44:56AM +0900, Takashi Sakamoto wrote:

> I believe that linux-next will merge the v7.3 tag and merges all or
> required branches onto it  within a few days, at which point the conflict
> should disappear. However, I'm not entirely familiar with how you maintain
> the tree.

Yes, I always start from whatever Linus' tree is and then merge further
changes on top of it.  If things are fine with Linus' tree I guess the
issue will go away today, though I don't explicitly track that for
things git can sort out automatically.

--iA7d2ElpplopvgST
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatc60QAKCRAv73Ows9A4
icrRAP47I/HMxfBpJhkMvMCWU6rS6iSMOvtQX5SrHTAlRNxvLAD/V5LjLVmiBvSh
1Zps3+RJ38xDmfRjAd7uhiAFu9t1Zwk=
=Ixhv
-----END PGP SIGNATURE-----

--iA7d2ElpplopvgST--

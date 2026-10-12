Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5130C606
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811790; cv=none; b=Z9CPNTx02a1NbQdnXDklpV4Ub1cwkXTLIUCeNt69K2/UyzTa0zHC+APayQY46zrCFWnVUPXPdw1j9eAVLfYph9kG4yLO6q4AUvSj40Ob96jGUqz9c7K/VndtegqujG2G0ynlH3cKwm+SIE7JPqPqDvuGqKYfnOA8RF3N/O+AO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811790; c=relaxed/simple;
	bh=OU4Y8whvWD2Hibdk8gEf9G/ATmDWla5lyVMlVtfiR0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw7q4SMNjFjc5Xe98b7CP3G94xpbfvGgh0aK1Aq/NabMar2uyAG74YQK9gPNwT/mHMr3uj4I//jAgyc56jaj5ugBDRAuWlfUMz6/oYetQiVew032yvj8y3gpo8KTb/2Kzh87TI3ERG4ZPdeKmUxx1pB8yw+4QshNPzJmOxMxkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXw70XOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXw70XOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC551F0089D;
	Mon, 12 Oct 2026 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791811789;
	bh=eZnvW1f6ZKKDs4epQ72esmcLtWFbZaDp3PtMSfBkwKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JXw70XOyZ/GydVd5g4rGWFnG4oNaR04Scx4JVWCXdDCDoHo58O/hj3Z9+gqAHYglt
	 IzOGuY5L3VN1DLqzLjk3xtI2cVTMMMFSsMy0Eh3FLyk1yxCLkW/lDJ6FN+Up1spRAN
	 mZRHqltvSw9+05Zf+vA+LcP/8BUYcI6ynnVvWGzBJez3LDOYWjXb4bs0+iwEG2Uknf
	 m4E20m+wgeTD7+vDczrmk1PDIJ42zx9wZNYyAuEf/3UYYVB2gg8aR8R1niBhHwwnUD
	 /UAwSmQM+jpImaaq3VaWpuoMco9dGlMzrT3qHjEs+1zm63H9ntcWn8bW5JK5JNYrx8
	 idUvrWZD2GR/A==
Date: Mon, 12 Oct 2026 14:29:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
Message-ID: <3ca592b2-a411-4353-ae13-06e84021955b@sirena.org.uk>
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
 <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
 <asuOoUt8XcOJJmSE@laps>
 <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcDg+wdYtDzc6CQA"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
X-Cookie: 98% lean.


--kcDg+wdYtDzc6CQA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 11, 2026 at 11:27:51AM -0700, Linus Torvalds wrote:

> Bah. It's not like I need reminding about how much I dislike pgp, but
> this whole "people change their keys without giving a reason or
> telling me" is something that *should* change, and doesn't require
> fixing that horrible program.

> PLEASE, people. Don't just throw your keys out into the wild blue
> yonder and then assume that's it. The people who *care* about your
> keys should be told about it, and why you suddenly changed your key.

Sorry, I was under the impression that the keyring you were using was
tied in with the kernel.org keyring and didn't realise that you needed
notifying separately.  This is me adding new subkeys to my existing key
so that I have backups of them and am not stuck with the single
smartcard I generated subkeys on 10 years or so ago and can also have a
physical token I can plug into USB C ports.

--kcDg+wdYtDzc6CQA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrM4MkACgkQJNaLcl1U
h9AzvAf8CpfwofupBOVZvtEeTjQIZbUlKK7dp74jnySWca9oRKO6EUbaLhT2/tZO
rZBYgronPAa3mJkpkrHWFR+YC0BGTOog4sKLhOwqYqiu4lxJkjM76o02hAd+24Si
hwahdq9B6vqIUF17RUE/5Y4hp88cCwmN8S55ZsIVcCJ7sRBNDDhGceRZp7cYMU69
Ofrp9blh9foBb+gdM5Wtoh9Zso3/ZrY4iE6PKXxFm16rYNefqK3Vn5iEswTtv2hc
IsFyNde1wQJS0QnHGKUjugp+UUW93AAXgzG3mcaZjFlxdq35g5Xl6E8qO2mz578W
fhHygPdADFzZ7ssJ58YeNSzVfShoXg==
=kaxg
-----END PGP SIGNATURE-----

--kcDg+wdYtDzc6CQA--

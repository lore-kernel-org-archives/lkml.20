Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAD3B0586;
	Fri, 18 Sep 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734952; cv=none; b=BNtN0lDWkDvrbqxeZIYuZH45lQfLZqU+ZvXDJAQgZ8vOFZtmoo7swXnf7SjXZPIA6N0xqhw/iQakp8YW+TJIvRG1+K3GlRgEOAy3dTREB5ixb5PNH+PQhnyl3OHy1Y4UeLkBK5X4/GGSq/05zu8qC8gJwLqhkk6zAw9pGoshSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734952; c=relaxed/simple;
	bh=lFb/ccV6+jizE6TGIAjcwsK07RZ9vzh/fvmX6XrndLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFtAJ7w2GUzzsHaTZqbsyr24KZFZnYR7esYY/k1j1ahvwXpWKfJQebma1cQIdpBNCxBC+YJODaG2bpJODp9AIJNM5gClwS9ijE0JtDpKp+7mGzf9DF5mTEct2qiOgYklWwJ74kVIjhxBZ+ysLXTm1oy9JnC0iFRgue6fNMFxCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh1ioEfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh1ioEfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989021F000FF;
	Fri, 18 Sep 2026 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734951;
	bh=PnfTQJIwz2bXz4YR/myW/Xmj/jc4ylC9Ppwvk0wRffc=;
	h=Date:From:To:Cc:Subject;
	b=hh1ioEfMS9xPALHNoT9qZJiv0YxV7bSXFUOjwijx0U9D0XvAx2cvZ42jQ3x9wQcFD
	 dIaZKzeqTPRZAjjBA1DaFzHPEnFA25EQm9Am80Qjl4MC9G6XDRMdFWZTznczCRw78k
	 Ih+kx3gF0PqPcGO5tWtZZJu8+AZh4Tc5KfU9xdjkj35thh+AwFpxyPsFZOETVUjAGN
	 tMceet5uQkMbrXxY+rsVLLqSR0++j+A72syILlY0aWhV9kQBB+kTz0i7HmjZ9E7c3p
	 DY1lkyHcPgt/kyZ9ZrV9oTURS80qp+pSGTFHQ/enleiUgE7HkEGMpke996X41En6bM
	 w73VsqIjNPOJA==
Date: Fri, 18 Sep 2026 13:35:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tomer Pomeranc <tomerpo@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <aq0wIywjYmlWf77i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="97e8isr3gG5KNoN9"
Content-Disposition: inline


--97e8isr3gG5KNoN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binder.c

between commits:

  c4c02084d6687 ("binder: fix leaked fd fixups on TF_UPDATE_TXN supersede")
  22c135635fdd9 ("binder: fix is_failure flag for superseded transaction cl=
eanup")

=66rom the char-misc.current tree and commit:

  fd2bc059ed466 ("binder: rm -f binder.c")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(Deleted the file)

--97e8isr3gG5KNoN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtMCIACgkQJNaLcl1U
h9DpYQf/Sq+rPDC+ufY6VoLrpav6sS3qn/IVVYGX+0G7yec0tRFWowf7F6Xjufnw
EpUfVGxM/FblwE/1S0TejMgFKlR8k/ATBj0g000r+GBBd7YvKSomehFuhqqZosOH
cd02THrSb/o2xmHGJ46zh+RTQgE3RpvGckbo73ZlTQ20M1iucib+Y1otynjWCUS6
/SRK6Mh2+Ukmg5jZtAvrqnx3oQMxtS5kF/LhoZuk1hBm7bnwnpOfwTJKa8l4nXq9
jSS1jfJI3ZeP4dYzcnDXgavdAqTOpGJ5pI3eqrymeUJlCaIBTPIQSE1DgrYYgKkU
9EGtN+NGR3xhHgA0w6nq94NM+/zCkQ==
=kYo8
-----END PGP SIGNATURE-----

--97e8isr3gG5KNoN9--

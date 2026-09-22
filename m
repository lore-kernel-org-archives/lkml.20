Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9DB524B17;
	Tue, 22 Sep 2026 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066549; cv=none; b=qg5N+5tgVr0knSFxLTFKdrSgjv/YW4VSwtVxxNmxe02/aqMRb69VdBQH7f3tBUBS6iigtOWlkIFIsvtUblttyfkc6vszm7vbh6UWjAKrNpOrX6mYnXHFZRtPnH3KWcvxMmUq+44t0o/i2TczSulmTO5H6HuITTAXWHvEVb+CzJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066549; c=relaxed/simple;
	bh=jRf+8KO9zCyaGEdZjbusfj8IWCVFZwS47IVnPlWXegM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bV6/b5HR8cH54bEslB1HATk3aDDZSyP5O9rmUYHbDHm84NKs8AL4yzz4qqmiDnQOdRSYoboEBJrwIRzJfL3N7EHREKBrc5bCKeT5bv4eoanRIC7pRqO9SMRdG8CwagvNA2dg0yZs7byEYg38RTzcGrbiAbqyM0eD0C9Q0aDA58s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVzNavr+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVzNavr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A31F00898;
	Tue, 22 Sep 2026 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066548;
	bh=gq9gD9Y9DK5USkkoDYxih1yvYZPujgLFBwXNWGcwRlw=;
	h=Date:From:To:Cc:Subject;
	b=RVzNavr+NelNwvzSSavehE4AAUKGqHjkxH2kNwAWSSXV5J7ZxSSzQzwxv6rhwvUM0
	 MlSBsb0o/sSMCGGyGX09iAAiByKYRaFK2mwcE4hge0tXvGw68+NqsvNkFN572wzUvH
	 YxXvVY1PJu/vDrMURIQHpPR18IY5rE0Vjq4no6gc4wI6SMA0z5aGA2uYResFtIq4vs
	 d/e+tk1Y2Edx+Od6MuKlwKTHaUxAf4HhsmLre+cp85AGaSeRjACXizjJ9/MxyDE/x7
	 fE4La7C7xw2HdYwf2UCevgPiz1+sE+EtH6Ws+aTxdtCMwT+tBYmTXkz9eBqFXBhGfz
	 v18SYg3eQk9Xg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1B6621AC56BF; Tue, 22 Sep 2026 09:42:25 +0100 (BST)
Date: Tue, 22 Sep 2026 10:42:25 +0200
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the i3c tree
Message-ID: <arI_cUUG1Ca0I-r2@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Si8gbC0Xfp9DazzE"
Content-Disposition: inline


--Si8gbC0Xfp9DazzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  bf9ec06c90dcd ("i3c: master: amd: Report direct CCC read length in payload.actual_len")

Fixes tag

  Fixes:629a6ddd1d9a ("i3c: master: Add driver for AMD AXI

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--Si8gbC0Xfp9DazzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyP3AACgkQJNaLcl1U
h9ClvQf/UIMYX/ilm5kCgJ7nOrK2JWVYTqns+bSYCEGs3r+zm3aEOQEz8fsVPxCo
/vNYLrO2q2XQNKRcLrXa6sN7XvPouiICRXV615fcqtuYWuPlNuOx4inO3Te2kQ0u
7Th1UW81TbSQqK+F35TSWlJrUyNCzn1h6/b1jws+RWtx8ZXL4RcKAD1g5CB/zPE0
YCgZjPYgr16AG92X/EMm+G+Lb+tMio6Y3afzzrS0VUNpCTsowuX/9qwUfPCRiyuZ
iU+wMpT9YLEsbGItlhqIYm1Qgjy2tMtkqTFBcnMaUyIXIzL+HybR6/mwFgt56YpM
V7QaRUISdnVLUyxD0JcrPfPGowLruA==
=KV05
-----END PGP SIGNATURE-----

--Si8gbC0Xfp9DazzE--

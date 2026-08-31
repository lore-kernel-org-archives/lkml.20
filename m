Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6D51044C;
	Mon, 31 Aug 2026 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183777; cv=none; b=uI7sW9TC4iRdXecfyhH05A2F4BFIMV1+RCGIaq3CC0fh2Ld+ypyar4o06LtDuefOb2OTxUoLa5RlNABIS8PuY+D3FBqyET3ILYpUK+QNiVe4GxGUUQiwM6Uf0o5H3cJMfUuy3JjwMR4FobDt+AHytMZPlUJ63RJiH55XpnJ5tHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183777; c=relaxed/simple;
	bh=83eycDDa+6VAb/Jgt9R1IVNpFe6nTHGMDInfYMOOMm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ji5GWxcGqergTBg9KZP22Zdif8It3uP1mS6cTiaGZXCd/uMuOfn4ZXYB69j+wzRF+C13GBoe9SGx+kJgilMbHVdL1stT0qx9bmoILiXAL/TvTQtBAIJoBTdh/1pAmZ6GaJVB7NJrcxWzfR6zvLjd1IQLzrIpbPzEHCkhybw35+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1RhKW+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1RhKW+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8AD1F00A3D;
	Mon, 31 Aug 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183776;
	bh=Ya33kDWixwjrnq/6g024BHdFb/dQs9yHXemL01fqS04=;
	h=Date:From:To:Cc:Subject;
	b=b1RhKW+iekvOT9ccn2dMsD2097FdSsKnLUCi4DX4QvXWZs04Uc1NowimJiYZKxAgB
	 VwXXMaKYyqv6zAuPr/gmSO4zVXcCfNIAz/X+UiPum/loAFDk7Enb+rLS9B05HEjbNf
	 o8XUbU2rX5wLVtsyuxgEl1hM+jRUBdKFzvnw/0NI9xOwcqeJ2b88TKds4I8916P7Rs
	 TWAi7P3njn52qJ86NESCECjQPScAwOeNw1k+ovgG/mOryHBrUGIGM5LW/VCXrGCFTO
	 Mv+t4tLG6rSle7NBm2bEwZkg/szd7VLRyUOvZJxye2tKHdW/lVNeTJnTqgzhVAKO7S
	 3ZGvpg+U9I7OQ==
Date: Mon, 31 Aug 2026 14:42:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the gfs2 tree
Message-ID: <apWE3TM7LTTCd65h@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BEPI5Xe5LDIvQzlC"
Content-Disposition: inline


--BEPI5Xe5LDIvQzlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  391f1e1e60fd8 ("fs: gfs2: Fix typos in comments")

is missing a Signed-off-by from its author

--BEPI5Xe5LDIvQzlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVhNwACgkQJNaLcl1U
h9ArhQf/Slk4uxfhtiHhFLwraegivTMJpF6Avx7AEgEegp+xVVnOX2FkFEesng96
LJqCGM+HAUZoEDOTzr0HzExSm9tvAyWp+/zht6HnOF8kTpK2TlQM1hFI8ZX+Sd8R
QK5Z1PGVYsmnL+AuWOmnRoIOcdEvz2D9i3G/+zQ3F28Uql3qF+f1yxZ0N6r38TQ8
6INOa1xXY7V3sdOAxRIxSYq+bO7MabKYAOqS68J5Bs22jnZCzup2o1ejyVAzIDFQ
OaO0W3h8jhLbCWPXyNecjt3sB48kooAQvxKCUf3JJ1TyDsBl17HTReUQhT7i5tWF
vokGvQo7vwBHojwc/cXDNun74ThS5Q==
=ZCDk
-----END PGP SIGNATURE-----

--BEPI5Xe5LDIvQzlC--

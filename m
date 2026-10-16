Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19CC3148D2;
	Fri, 16 Oct 2026 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148200; cv=none; b=GydEyE2ZhM+2ZB5kyze9gK1j931AozLZqS5lxNFyi6CCQl0sR3ac5i/9/r3RDybBDkM48d2+FBxsUZbezpc9fZyJGjO4+99UkZJzXXVCp0/ZwbRJaUQI0QsvDs0XhM43qNWt53ceR0U3uETqKPLVEzuze5d4vjf0O67XA9Kjf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148200; c=relaxed/simple;
	bh=ZibHjs4F9CEDK0Q1FYGoYBq4FV2wYLG/mwYdXaasFZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVuzkDn/poszfq9lNI7NUY5yVoBsASM4UFZoeUpFbSOr3T96BX4JAYhLEYFNEzJBwE5IU3B98lnRKXUQZCSKNPUiz2WjC736Nm/1a6jendYPAGvdcEbw6ZC7gwx7h543kgybY5q/Cysxym5tOzYwFwAOaFZQVNJNpqySGFt72oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsvLsu9o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsvLsu9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DB31F000C6;
	Fri, 16 Oct 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148199;
	bh=GCNZTHIhMSqIBzL7vIDlQLGNMsvpTXwU7NW31iqMR7w=;
	h=Date:From:To:Cc:Subject;
	b=TsvLsu9ojztRIWkNEHIvQ1XIY0qNdNRny8ppqTX+jGks48Nut81vPzepiKsW2uHG8
	 1zyvH8adx6JZ/uGVjWBfaPuNB1ltFPW7OTorA0QGS+N816Cr1s8SZaxi8SVyRBe+Xk
	 ppfxbGMXG4+x6gNg6+Auh4VPCaMPYedtr/48iobDhRGbVKLP+X/dOSQSLDmlBPsD3k
	 mqQxlXGzmwNEbUMeVtZVqvszI08GzfxVirYXrlXVBzcWnaL/Ykixv1xVS0J5P+vkjS
	 ZHhvfhMjqM4vsEani0yWNwl3mSSPWtAlzAzz05mHRdxKuCtPqrtrhZroOskZEloz2E
	 /g6cXknZBtBWA==
Date: Fri, 16 Oct 2026 11:56:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fuse tree
Message-ID: <atIC5K-4Grw9Y5d4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8dlK8Vp+w3lkSjDY"
Content-Disposition: inline


--8dlK8Vp+w3lkSjDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  95a3e58d2e081 ("dax: add fsdev_dax_from_file()")

is missing a Signed-off-by from its author

--8dlK8Vp+w3lkSjDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSAuMACgkQJNaLcl1U
h9B8pwf9FAt1A0ILdIl6MmbpJM8ZZB6LJHCe8nf4CQyTWeOnu6srDEcmyfeX785E
n5XHNqfLO7K98Kflf43CZwZtLfmyeUSwwN2VZrrRAKiHsEXVlL7uAEZD1CHk1lbo
w0L35xdJy/vHZwkkbrmNfCrzfGbS5xzgCqSbadCtcYaalzw9wqmai04it1K05egb
dWxWvBLYLfp3UPj9XkFNoWiJgoYA/01umb/ddtWsjN8nHI/uORK+YZECIhy0io/Y
49zk5z4wVvVEhJj8M475A6hyx8JmiD8D/qmIkitXfxuyZokVQ2+hnIPaNHM5Q3UE
fhtAmRoV5grIZXbDxSEPm8FQ6oaI+A==
=cN6J
-----END PGP SIGNATURE-----

--8dlK8Vp+w3lkSjDY--

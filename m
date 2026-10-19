Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E244E9C2A;
	Mon, 19 Oct 2026 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412312; cv=none; b=fVLYcPBRF54h0uoeEbZCuSeHK8iD8eCCSKYG1iNMBZG3R45+LepmhpPGjHfVsFUY+3XUrzPHeV8EYcIgM102pNvsWgJTMsXvxpzVa6b+KCYMw7yx5p4tG4tYs9H19vhMWBsSgcwZPlY1f6romXncV7ZyV88fsRZY0UoOj0BhO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412312; c=relaxed/simple;
	bh=WyU9cR4Oy++Xs7KfSAKDXoUAKWTbEeAd0d6PMErRssY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ycs+l3lQ/+xJOZu0eumdxRJ3DZ5tGwRH6Xp/fpWetk9UptSmllwigzuQHzZUrRCy6h7Ay4QmMJKMO5lBXSXxknJlPy0yNcZlFRQks6srWZKzwKJbNAc7LVluZIimkdJV+cEdgi4nCSDrXhEbpsTSlqYXzDMoq6cZLQmn8IORwkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDHfvoSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDHfvoSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFFF1F000C4;
	Mon, 19 Oct 2026 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412311;
	bh=S4yi4eRUixJruKMfDuGfRW0+sZtK+kieqtPnYhx0s4s=;
	h=Date:From:To:Cc:Subject;
	b=LDHfvoSPn6jbN0FSaFnZNFBar+j6wY3EjkKGsbX2i8hR8QxMw1vqBfUKhQQaIrpDZ
	 SL8Opd4sI4WuXUyKFYL4FnbYFlMiK94oooU++RqQn4yIINSso9XNFyzgJItBPr0h6K
	 gV9LSiZBGXmgCyUHhzTNPG4UMMCJ550pZ0i5ZPeKFio0FwVVrfjB/0z+CiIyydzgiZ
	 W5UwNoNtqoyjojigwjIhK7XvKnelUwdx+nznY9g1JSim8UpHC65r/SF0hxwyuZg1Q3
	 9GiRgYKNAPUapJv0gCLx7wHbkxRJJiHItCLjarmB46QsPwqeGe+dgka8l1xxl6My1D
	 KBgEVI9Q1QkWg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 05BCC1AC57D1; Mon, 19 Oct 2026 13:18:27 +0100 (BST)
Date: Mon, 19 Oct 2026 13:18:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fuse tree
Message-ID: <atYKkjN0WgEhpACL@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y9VsFibJyYR9iE6e"
Content-Disposition: inline


--Y9VsFibJyYR9iE6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  5fda61d42e762 ("dax: add fsdev_dax_from_file()")

is missing a Signed-off-by from its author

--Y9VsFibJyYR9iE6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatYKjAAKCRAv73Ows9A4
iSeoAQCyAM4lt4wXhk9JFq8HLpriY7+HLiePYlkwHd7cycf+SAD7BETqIxmLZFHF
hJlvPt5HBR68C+lItCM18xxUdSBp3AA=
=vblu
-----END PGP SIGNATURE-----

--Y9VsFibJyYR9iE6e--

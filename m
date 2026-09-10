Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A96486B8B;
	Thu, 10 Sep 2026 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046367; cv=none; b=o1Li8dwTPR03It/1xLzBuQujw+wPNy2AZGtRpPmXLF1PUS7MqASOtH0BheP2dZ0eR1Or76UeLrbfOozGwWG7eoPYsS2Ozdd/b5VoPSDx6Ut2OdsRGvzBuLwiRrhJWwDXMozS5+kbzy9/h3gCGRChDjyr5XNnaeJgWmapL87cb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046367; c=relaxed/simple;
	bh=qlkCU4bd/ziz0I1k4W0EYD7P1bY2O3KnGvomBXzVu+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVEzPSIZWNXt8voICI3tupa7iIST65xYIskMeO/BGmCvqA7tMDXv6t10BpyYlATW2rqXepYkI29VwYSQZ3DsN03VdeBbJ+susB6pOMW/J1icnDm+sIB5JKavf4Bw6ld1TJveIXA3QId6ntlKoN7fyktaE93OnpFjLXQhq8GW6cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0lofyxX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0lofyxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312781F000FF;
	Thu, 10 Sep 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789046366;
	bh=EmN0YUs0zg3/eR5WqsbGvMfqkpFUal7coFDJ8WpI/ic=;
	h=Date:From:To:Cc:Subject;
	b=M0lofyxX3ia8+tA4nKTdop8wrI9i5dSk5dTQbiB2SuzERdVUicqHB2mwIA5DpTRMm
	 DUHmFGGR3ZH1Q5EWvFOTLys6ZDTOF9sWDw2dN5RwCLf3UFfrdC0m7EPEObVVNGO09c
	 pk0NXRvXXlAxHrvw976hX4BxYHIN/uH0s/Ay47AU4lnCN5UNYIewFSw5RfUUOVTc0n
	 04MoSYJswy2pif8PraqK9UnQacCZ6rDIJllSvgMVbhOQtUBgRUGyR+OtmQldodiWn5
	 A5OomxmeuZcaVN81ecBWii7mQl2Za/Nk5RpgXV7+FQcw4YrmJieBVaQu/aXTnjjuvh
	 zZSG96d1vT1Zw==
Date: Thu, 10 Sep 2026 14:19:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ath tree
Message-ID: <aqKuWv0oUjGHSMIV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aDFfQRaCh0DaRwIg"
Content-Disposition: inline


--aDFfQRaCh0DaRwIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  bea22601ee301 ("wifi: cfg80211: don't free driver-owned scan requests")

Fixes tag

  Fixes: 4a58e7c38443 ("cfg80211: don't 'leak' uncompleted scans")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--aDFfQRaCh0DaRwIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqirloACgkQJNaLcl1U
h9A1jQf8CO7N0SEODx9gQ+e9UFkQd2Tb82JAEKDSZh0xlMxQYRe9lWCf1TmqMKey
cmTQgbc5b15JF++dIexZTfJR7YW7oCv69zdTUMs0CIz3dreuXVwNKPSJXP6Ycw1Q
LWxM4FN+V5fQ8OmCQ3edJxpVZYXNCtZjLnPN/cH/d1+4xt7qvniJKwahUOnZB56y
xFmuTRUZBL0NnKAMexB666SlRb8afpPVJpMTI6C32s4NczDfYFt9kIKyrrKMt3Zj
RTxwe/R1D0+SFFkvFV98p7eLyTK3NI9aAq5Pw7NSH67dpPsMKSEkFKo6qjAtngfp
prcOVf5z1uaUlkQCx4lL5PR+/byYUQ==
=lLQZ
-----END PGP SIGNATURE-----

--aDFfQRaCh0DaRwIg--

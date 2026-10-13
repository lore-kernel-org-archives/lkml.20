Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93C51FCBF;
	Tue, 13 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904719; cv=none; b=VI4ZS3Ok8VhomC95HWynj/mMvI7WeAmDgm92ypaeBCmigbxgd/l9Dyi4nSnYbgXHq/qMTcyj7FFzdTT3+PP7on9LEAq8iAH/qgiA/S2DuiQC+9/LP3FLfmMAI9U8S/JNgsfkm2cYRfhmq+4VPCoUNOedbauFVbZlx9ffnUz3obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904719; c=relaxed/simple;
	bh=wWxY2Yw/ga9e1ydCQegKYPl68q9olWQPLRL6uEygbYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzs7Pgh6UQLfajbAWVhjOhUevtQ/JXEBFMxXIU5xJtnBvEM4Vsn4olezp1HDPOSPF/IFnE9PrzfwOWE1v4lKyGalDSjog+zMAzQ4RyqItwoa+rNL8ToQn3g6H15F2m3inknKTwOE1OCvGA+DOkOMh9pDR7BDMiakjnfQQqnpPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQTlH8YC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQTlH8YC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EEA1F0089A;
	Tue, 13 Oct 2026 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791904718;
	bh=wWxY2Yw/ga9e1ydCQegKYPl68q9olWQPLRL6uEygbYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQTlH8YCdPMxuyW89Cc2eFLAyVA7oBvppONfJBzCxBUG05jfER6HjB4ouRZZjwpBy
	 oKyUbNUjIBalXeXL7LZbY2gl/uPLYgqfdIiQyvVcECidj9W9dHdtnD2uUBxuOWW2Em
	 LmPcoCJwqC0wKDGuTx3sIHGLEPvIfunqTP2VQa2Q0pHF9K/NZVinyLa1UulC4ZIWgW
	 xCEsWPQShPelBzgyC2jfjgKEDX1G99fdPpEhCe+kdx9MFF16o7PqYOFxoiUUzxaLCb
	 3yR1oMGXLCffEOSj4Ey9ZJVth6ohYyxuU4Il4whmirrnR8gfIfG5awm3kvQdFVgWhD
	 QAafun6GLfEKQ==
Date: Tue, 13 Oct 2026 16:18:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <7524f3d6-02c0-488c-be76-23de8afc2b76@sirena.org.uk>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1jjKJKaaQTH4Y02"
Content-Disposition: inline
In-Reply-To: <20261013125559.GG4214@killaraus.ideasonboard.com>
X-Cookie: Some equipment shown is optional.


--E1jjKJKaaQTH4Y02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 02:55:59PM +0200, Laurent Pinchart wrote:

> The absence of the tag on a suspicious series offered a low-effort way
> for maintainers to push back. What's the proposed low-effort replacement
> ?

Greg's suggested asking "how did you test this?" or similar, a lot of
people just throwing stuff at the wall simply won't respond.

--E1jjKJKaaQTH4Y02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOS8gACgkQJNaLcl1U
h9DtUwf/faotOERtWuRqIgmClMa9elJ7lQVjlxinEKZ7/ZlcVksk/UZrQ3KQPao6
Ja1Je+imr3rOw7yaze3HdhcmeFvP+atKx+yxLOCl0YDduFF4XtkPbthA21iN1aQ3
cwm91UNfxdce2Wdbx1aSnv/St690NfWLKMia51t0ZaY946+HAug6V8E7TNuzJ7YF
/mKRyMEeKND9Ezt8moIbLLdJ4eYCeeTSrc95tWRDuGdC4/IGhvJ8Go1IccXdKG0Z
HLiwz/VjopI11wZo78H0wngFUKQXTrgKq41tmo8H2bkKDonuTiNmYkkXvamVXyIx
acWfyG9rh92LDsUbF0PKKEO+7MDbrw==
=GUAS
-----END PGP SIGNATURE-----

--E1jjKJKaaQTH4Y02--

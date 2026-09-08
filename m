Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A84A014E;
	Tue,  8 Sep 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877115; cv=none; b=nEyjJh0J1XO7EmKpsCnNQHoMxKBi/E5qdNU2gwOGkvyLigGh2ZyQBuuq3sH1Z+pRGa05HXqvcRQSTS4njCgV3nMD4N3W4lXATpoZ0IuLO9rhUsj53kP739MUbMyzu1K7HXJnyh5F6riwNvvhNp9tR9/lj1R2K4u/uEU48hwcV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877115; c=relaxed/simple;
	bh=7qZI2pV1jmX5DcdeWN5aHOZbwYklI6EE1jMakZwMfLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ud1TnKmCZQS2z9sijCs4k9mHYPY83HqRVrWFEllzxJBkFa66FaltNRJe6SpD1uclW9a6QtD2ZwvP7I0ieqCQgrrlvP2K8OVARS1ECBpH5vO6lV/oo3IMqY79jPxzHE+G6FTSf/5e5xzBJ/3NkDmrhdu/xgMK6wtSz5GyE4ixiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6A51F00A3D;
	Tue,  8 Sep 2026 14:18:22 +0000 (UTC)
Date: Tue, 8 Sep 2026 15:18:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.3-rc2
Message-ID: <c29d58a7-7514-456b-9678-79c5381d447a@sirena.org.uk>
References: <fa64b953-6919-43ef-a937-d09e881bf2fd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+KRgHMmUSRffIZeT"
Content-Disposition: inline
In-Reply-To: <fa64b953-6919-43ef-a937-d09e881bf2fd@sirena.org.uk>
X-Cookie: The world is not octal despite DEC.


--+KRgHMmUSRffIZeT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 12:13:33AM +0100, Mark Brown wrote:

> Trees being held at old versions:

>   drm-misc       	next-20260831

> Both are trivial issues with fixes available, the drm-misc thing has
> apparently been struggling with some process stuff which I think should
> resolve shortly.

Actually there was a link failure behind the build failure so I guess
drm-misc will continue to have issues for a while, and both issues were
sent on to the drm tree so will now manifest there until drm-misc
manages to get something that builds and send it to drm for merge (or
drm applies fixes directly though that's unusual).

--+KRgHMmUSRffIZeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgGSsACgkQJNaLcl1U
h9Anowf+No4EQQFK/UPDRoAiyvO+LH5NH6bVip/YQGmHkn3wephhjXPwlsBeNrGu
k4jQp2nfOtjRXfAPofIPLe27mKFkJTydurk7r+uSK7KYlsoOQrEawgp/7lFGd3pC
e9QPLpoGvJSpjSMjNyeSjJHHXBAK1pRYx0KOubJorV6PgLptU5YUjZ5xT42VmWbD
4qJQ0u4NqOKPRsfjxXK7O25e3hUZOHpkKyEOJWBuzMkQcvphJA+ZuLTnLISJRXRe
+HM+SpZZZlK+22+W3KvMcqfCxUF/8HvRIoYpLKj/1saEuwBnzB194SZ4aWCsyXK4
fPqKJhtGyYRzVBzZJ64Ds5Dcdwrq2A==
=hgtX
-----END PGP SIGNATURE-----

--+KRgHMmUSRffIZeT--

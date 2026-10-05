Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE22222A9;
	Mon,  5 Oct 2026 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204774; cv=none; b=puEg0N0sHhYnTa/3zNNsCTZnXJ6yg3fdj8qZo+thIBXU/e0U6xU+Eq1SNFzztW2wNnivUIltUa5cLeHeB9Z9QZIjW/YlSL/rJqWBFxQgWAxbMDQJ0W0zlfAI+bJKZ82j0eyh2fw6t/nMMjRY5DuISan2Pa8lstC/byznqIPmc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204774; c=relaxed/simple;
	bh=p2vbJ6ABcFGwqNLXhCF8tcRt3mOyXaSnNFr8iCdL/64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmH5fgnBh4MSE0CGO70LQ9SYUYHoOw6yUE+gaEhbtYBpNjLEeNLjepMxYnNyc7Ac5mObzhlT1s89EpsZIbYkdYuNCLIfRxlKaySEzwrkBQ0qFdyyngXBZkZIiWsnQAYr4zKN8zevnRvR5dV/qyB7MBn9kbI78W87T13KoHsZ1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euz0k6a0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euz0k6a0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7451F000FF;
	Mon,  5 Oct 2026 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204773;
	bh=hUcyPedipM8gZneAAdQtTPjp5TByHDMeP0OIL1ck8pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=euz0k6a0urItAeb9LA3iyXMsbFPsMRMkRtgOrXwnBwF+y+OMDPNBaby4+K8FDLvwU
	 3ussa5TvnaXmDebi7HUNV+EFP0mIWesSP8jzMPskpOXtCsTwOEbIFALLViSixK3+QJ
	 NSm+r2AwQOlcKIKybx1F08+o8bymAU/DqoP6KOen2oPM9eEM0eLWp4ZxrVtwOR0+9D
	 hlpEju8mExTd+UQl6ULOjpDUdWOyv/pFcpW4oWgoDhrxH+rUVsmIDDtZxCa9a9ygcI
	 But2TshmdcrLO+ga4kE58wO/Chv0gA6j8ABP++vENJ5qAJDFMIvtkRkQbxFlEW1kJI
	 2WKnPtBkvoZXA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1A2B91AC57CE; Mon, 05 Oct 2026 13:52:50 +0100 (BST)
Date: Mon, 5 Oct 2026 14:52:50 +0200
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <asOdosd0zROmuzu1@sirena.co.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QoRENNxfC56sze9T"
Content-Disposition: inline
In-Reply-To: <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
X-Cookie: 10.0 times 0.1 is hardly ever 1.0.


--QoRENNxfC56sze9T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> > Commits
> >=20
> >   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 supp=
ort")
> >   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in f=
an_curve_get_factory_default()")
> >=20
> > are missing a Signed-off-by from their authors
>=20
> This issue is still present today.

And today.

--QoRENNxfC56sze9T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOdoQAKCRAv73Ows9A4
iQ3cAPsGk61JGNP0rhyuLAfccGIyIaGvCNGbX4Nyc9/whr9CJwD/SsZxFWv6/ibG
iLw1+VLmlYVZN7Dw7G55/xBH79g6+wc=
=1a/i
-----END PGP SIGNATURE-----

--QoRENNxfC56sze9T--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CCF443E52;
	Wed, 23 Sep 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170619; cv=none; b=VsSRf+PNJhF10fAQmwFLSoUqCrP+xwZ5AvVIZ1gxCC5rVdTVfvW+BXm2Q3flTn/Ik8OW6ibHmsbcQwntL6HHucxrVIQVakRSnQ1z+XG0/rw8DHu/xm5Xhikf61UBFJ05EYpiQ/r7vwYOtWLvpVncvNMGtGxOhl7b8oRgfIht1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170619; c=relaxed/simple;
	bh=rzq9cjij4GIzRVYAuct2Aa41rIPeUjx9wIWVvoCUrEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/lj3gQabcxP5FOMML8lvCruMucNdFo+OR0xj5jFgkk2NkcC6ePW/paLSHSLnIMG/di3JV3eZaeTHjfN1SnyUT+tMVJvypJSyV23U9JegthoyyIPLnlCvnHS1tShcyY+vDG3IVeKTocaZO4nv+K9RDyniPqLt1yk3lOCtAteexo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqRyZBdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqRyZBdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2802D1F000FF;
	Wed, 23 Sep 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170618;
	bh=rzq9cjij4GIzRVYAuct2Aa41rIPeUjx9wIWVvoCUrEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PqRyZBdjcX7hsiRuqmx4dSci++UIUGlnUTyow5F6WM7Xiz3xDICVvoNbcYVRhxuEb
	 mUgooIE8+7e6Ih6fl4XwIsvrV5Dbqv07xqce+C6fp9H+zKJJTYzupyZBoH4rEsERlC
	 7nOO5tSJ0CSPioiqxnt12Cgck7Qyji5wYKJcVK4EbQaf9HMxN7CIUoFxX6Xc6wwuQI
	 smW7o1cP18L39e57pXWgRBeQmOdJChp6Y4toGATzRTfonn5iESRmrbFZRl7wjtbNyH
	 Wts5aKQmZU8BzQ55ZBtN1naWcrcZ/Ebd+aciRsPp5yKXQZimNKcuBbuHzmEcVtHRt7
	 R95z080cvreyA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 637081AC573B; Wed, 23 Sep 2026 14:36:54 +0100 (BST)
Date: Wed, 23 Sep 2026 15:36:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: claudiu.beznea@tuxon.dev, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix a deadlock with the interrupt
 handler
Message-ID: <arPV9kcq3hEv4F1v@sirena.co.uk>
References: <20260923084401.65336-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TQ33EsQTOZpAHTLV"
Content-Disposition: inline
In-Reply-To: <20260923084401.65336-1-ginger.jzllee@gmail.com>
X-Cookie: I've been there.


--TQ33EsQTOZpAHTLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 04:44:01PM +0800, Ginger Li wrote:
> mchp_spdiftx_interrupt() is a hardirq handler and takes ctrl->lock to
> serialize the user data and channel status updates, while
> mchp_spdiftx_trigger() takes the same lock with spin_lock() from process
> context.

> Interrupts stay enabled while the lock is held in mchp_spdiftx_trigger(), so
> if an SPDIFTX interrupt is delivered on the CPU that is inside that critical
> section, the hardirq handler spins on a lock that the interrupted code is
> holding and can never release.

Are you sure, interrupts should be disabled during trigger...

--TQ33EsQTOZpAHTLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz1fUACgkQJNaLcl1U
h9Av5Qf/d4/IgiSTC8fzKCpBHCrMVsnphB2Jc5rorm7lGmaRkL0dT6coUrbH9fH+
C/l4BEe9W7cyaqq8Pwtvs0O9XaJAo3UW1vkJvYSylzBIMD+fxKbf6F2GzecOmpIA
lh/auaVxy1KaMLlTc1bVEaQrCzVVV8jC49Y86i0YiEjuSI97QBjyMxahBYdpL8v6
nf8yfg+PpjQGBsiM4AEJbRoHbTvEBlTmd/1JCHSvRg83eZpmBZqYvNeGvsSyvPdn
111L1TSK0wGIz1REHu546Ngb7fKQajWRZbEn1i/D6djMt8caO04knmQgNQbjbBPq
RtT95qdKdbuFCndQfeG8gLwdeYzheg==
=Owna
-----END PGP SIGNATURE-----

--TQ33EsQTOZpAHTLV--

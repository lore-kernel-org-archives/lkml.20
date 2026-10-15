Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100A502576;
	Thu, 15 Oct 2026 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064180; cv=none; b=GwZGflxoTr3InXyIhX0QVeOMi+zK9VpM2+L9c5KfnLtk9XRh1T5TwBg4UeS4/3MV/gqZRZtYeDm0IhuV4cuscQRGrWt7G4TbSbFPLEI6Y4bM4g4W9qPWfTOYg5M2VqZHIRUtYT1Flx6WzPRn1G7ky39LPZDE3MGfhePeSttcuek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064180; c=relaxed/simple;
	bh=XwhKJzYeW/IcjcDmQk658EyKOdkyKJ+NBPxpeHFoUAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmYWbllGpbPUMHzTYUs96bZearpforBUDtaCm4gid4DIJmv4oCa1E1it+gy/KfPNEc462n8aVh/EB/YUJ3IIQ50oqbFF/J+h8B5c26SCXOt6JdE44BDPW6+jdahka+wuiSnxit6Xxh7+gc9OUhIHyyVAKdlT/ZIcvM+qWjB1t2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+J02CN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+J02CN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D5C1F000C4;
	Thu, 15 Oct 2026 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792064176;
	bh=5JgHLQj3wVyKDESKBkbNsIpAHJL80iOH9P6zg3/cjmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+J02CN1Eg0K+kDy/F1djqKpPEUrmNTget1b9nQuPRK7iLX7gNXMdE+3mSz+Zvmf1
	 WQn5tb4CUOe2mK/+xbCAGFWN7qfpXtMf6blDjE8urRy3c++zsmfUGIRNIBI/J19eRF
	 1q6fcfe5pckfPCevW6oQHZMFzXDguozsVw4cnpFvadu/4QssX9z/HqWpNNb5EJXjNt
	 qgplQHAWqxZ8/SXkk0n3gFd8qWx439N+2daWscfNeCCKZYzkWWMogrbh3D6AZPnHdb
	 fMUx3DwOVEP68dqyvDD5cKsW2Bc8dEiPSOIKboGozhW1tvaxKXnhcwSmJSXR/RuPjV
	 lnhPC1ZfYSzww==
Date: Thu, 15 Oct 2026 12:36:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <hppiscas@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zhang <zhangyi@everest-semi.com>
Subject: Re: [PATCH v2] ASoC: es9356: defer IRQ readiness until cache replay
Message-ID: <fc5d79f1-c83d-4c3a-917e-2dd2c017abb6@sirena.org.uk>
References: <20261014032334.12227-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kQGS0Ll7FEAPd6mT"
Content-Disposition: inline
In-Reply-To: <20261014032334.12227-1-hppiscas@163.com>
X-Cookie: Tax and title extra.


--kQGS0Ll7FEAPd6mT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 11:23:34AM +0800, Pengpeng Hou wrote:
> For a SoundWire peripheral that remained attached, resume clears
> disable_irq before waiting for initialization and replaying the cache.
> That can permit deferred interrupt work before register restoration has
> succeeded.

> Move this attached-device IRQ readiness update after successful cache
> replay and protect it with disable_irq_lock. Preserve the entry-time
> unattach_request condition because sdw_slave_wait_for_init() clears it.
> The reattachment initialization path keeps its separate behavior.

> Return cache replay errors with cache-only mode restored and the cache
> marked dirty. Use explicit braces around the scoped guard so its internal
> control flow cannot bind an else from the surrounding condition.

You're shifting the disable_irq to after the register cache has been
restored which makes sense but I'm not seeing what ensures that any
interrupts that arrive before then are processed - for example one that
arrives while the cache is being replayed.  I think scheduling the
interrupt handler should kick things but I didn't check carefully.

--kQGS0Ll7FEAPd6mT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQuqoACgkQJNaLcl1U
h9BO2Qf+IJH+pNw/mSicK4I7UuoKZJeTgS6WQGet4V4D2EK+65Kgs6LCdHL0h+8f
0XBYnW07qNkSxCJ76yHJoYGPdEcAuW41i8+THewZioZoE4jcI2OLo9DHKo1qb8z1
0wz5vmKtA1yK6jFcMn6jk34bIlltYoWGiFhB2/Fl1Kst4U4evEIx6eXFsslrSPjr
eqOVwJL2ttpcp2lhf3qDOLGAOUcrqZdoMaICRIqACu+cVkQdN/xYdyiT7fkfn64d
nBhkKlltPtxyEIm7Qlq/XOZbDmEHQK6d1goKd7hFLcUHJbP5Fx9/CRf6533Bqd+A
Nx6CdfL8KLEugXI+E0DgXhj+lWI8+w==
=BKOo
-----END PGP SIGNATURE-----

--kQGS0Ll7FEAPd6mT--

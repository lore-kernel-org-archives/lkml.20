Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639358;
	b=c7YoSHeCvqCgkUYeT+qwwYHCfiqjxSj4FSwpe512NxUL6dVfcHrmmqnzr423eDSJBGjH
	 5rO7rWAoX5CDU9SIh8z1cXC8gZmJDoxf/FNuslIZkQ9K3qC0fx0rwbgYaLPXX9I0y6yMV
	 W1+4M9UgE2kurqXqARl2QAzPYlmR83rHWd4NtihGXCdOhDxeqoUVARg3awstA+zsLODbL
	 qx+38OgvPRp4pEstkTAA1EGWf9teCTJz72fnV72GA269b8GNWy22wUXrEaFrlg1zEnBd+
	 DoTw1IbglcGzhByYrlRiz/TFCd4ZCCKH+kcDITUKyjrS7EJ9M0EDbubUJJpZQ88gXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639358;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=vwwoXcGv7Q4czy54HAWIf1KDS8/4RsjzxuKe3zfZc4I=;
	b=yZkA0FmnjJea4M3lxdY/o5AJAVi3XazVVml172AUDya+G+LyzKyPbN+ZDDLEQT7uU0a9
	 20pREZJjJXf+WXhXI+oy2TSr1e7/sOH2yDTQg1gL23aiVdYaOTAC+/J0OexnSHTuxVo0+
	 M4fqLgGRjpTDCK1VBKWtb71h2KGeTCz5QYouplFffI8IMXRlDGx9KtJgsQzcPfZyQKDxV
	 /JnQh9VLs3HlfKIZBw8WO+aWrN2Qdc2CvqvA2nxjQBoJnSkJLyiNvOtIP3PdJOIOshCfN
	 Cm/fNt3Ly1fn1r3dYi8piZzSDgkttCTgXBg3a0rTKvnBRo1WbZTDsNmJ9lNCPcra3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AC8JpBno;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54522606A905;
	Mon,  2 Nov 2026 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AC8JpBno
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E281F00A16;
	Mon,  2 Nov 2026 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639357;
	bh=vwwoXcGv7Q4czy54HAWIf1KDS8/4RsjzxuKe3zfZc4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AC8JpBno9gvHL7OmgcmJuSOSXKViixIhoaxpRMVoAT874hFRXWQKy/fYWk1Sv0C+K
	 IlEnLAM0DEbIpJggDHSg7XeysdGw5iH+3u/QYW3K9inToAdZYKqnFgN1t0h4viXwKs
	 IMn1tp/lmd8HnO3f6nFpH/MehCJJavfaZrIq5i4WJzixGI3VN/XkIAT+6apAKC8Jrx
	 1ou++oiw9XF1xG9FlsljPgcjQ8b+FKXZIyo4wwQZPLj98/PncJ0RMZs3/reGDIDkV3
	 4LBANtIQBl3jfiigLl6ldSXDGeq61z7Ozw15z648l2NvP2lnYB9Wi5yagooZ84zi95
	 QvguspnIWytiA==
Date: Mon, 2 Nov 2026 17:09:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 3/3] regulator: Add TI LM51772 support
Message-ID: <a5c78238-7c5b-47dd-81b3-3a2650a08288@sirena.org.uk>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
 <179337726255.87968.9906404525377602371.b4-review@b4>
 <DMKPZZNSDY1O.3DILD6GVHK3RO@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="itKKA5CoZ5P1qvi9"
Content-Disposition: inline
In-Reply-To: <DMKPZZNSDY1O.3DILD6GVHK3RO@bootlin.com>
X-Cookie: Used with permission.


--itKKA5CoZ5P1qvi9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 01:23:02PM +0100, Paul Louvel wrote:
> On Fri Oct 30, 2026 at 5:21 PM CET, Mark Brown wrote:

> > It looks like this is an always on load on the output rather than
> > something only enabled when the regulator has been disabled so we'll end
> > up with an extra power drain for no reason.  Possibly we should have
> > core support for hardware that needs such manual management, though the
> > datasheet suggests DICHARG_CONFIG0/1 might be more appropriate for what
> > the API is looking for here?

> Yes indeed. I see no reason for the DISCHARGE_CONFIG0/1 to be disabled. At
> first, I thought that the FORCE_DISH was necessary to get the discharge on DVS
> ramp down.

> By manual management, do you mean selecting between those three configuration
> (force discharge, discharge only when disabled, disacharge only when disabled
> and until a certain threshold) ?

I mean hardware that only has force discharge so needs it to be enabled
only when the regulator is off.

--itKKA5CoZ5P1qvi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrow7gACgkQJNaLcl1U
h9D+qQf/WHFgZSHnAewKuw9/hWmRi3oEx9aPlzK3F6vRIJ4TydOsyRQNpQ4fuGnR
afA7DJhrgi526FirCjKhz79t5SFgrVbyd/H3IuMab5SfuBS2aooTloHGiAXZ+vJ8
Jb/YcWjydCnz+6HRkt8+SEgoXw+p+jOBqb7sloZS4Fz4OVKVLkcQdZgVLHz42Sz7
/JgRIGym+7QgnBoO2EMj6rpVrJ5TJkNA3le6Gqb6RjbVbbxoG+nN0N/oFYjq4jHW
3Hnc6uYkrD7xrq8LyJyJSYCbfZWG4SBoNfbqgmWJxkrqjshs3fKIc4jjFPqZ024L
cnEXr264z8VtKgutbYHs4KsYNhGbVg==
=ngJZ
-----END PGP SIGNATURE-----

--itKKA5CoZ5P1qvi9--

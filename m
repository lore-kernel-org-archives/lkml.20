Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44D424D46
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549719; cv=none; b=EUjPKDeqwtd+ikHAbBB7SEqvr/nzp/xVbnajQjrebiaaLs5ras709npGLMqFx4vBoD0Bz72nQcZWdV1BpCaUjIfxLj0DEBJQBzqAn3iGXleItLfb9FDUx0H08Cc/DvQPeOpLgBMtxYT2NJuWwPwC8o+NO57TNKHJCnjMx3xoUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549719; c=relaxed/simple;
	bh=sdGKbaYvmek7cpeeZ8Lf6aeS+wbMOF21Klff9pVKQBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUYUtFd8+DD7d9as1qKuqfercSLc1LC9LkX4857iUbvbNd7FODR2tvDZlffDG/llQes/cWJvnfyYAYYPAhA3IHg+YKPRqXLEfAjIiZvkC0iTPG1RLN0aaRgTMRfgswG7aGbLQDndANILoLlu3gFMdFMi5NS5zrONWidCBYb0h5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3vcY+2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3vcY+2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02AC1F00A3D;
	Fri,  4 Sep 2026 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788549716;
	bh=hg1UdI7cm/nq5tvhYbH2IiGhkJiVccUWc58/RH2jIrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3vcY+2RYUNqMizolkxhaIutgr1y5cD3HJ24jFIef9cJr0NmZfwiBl9fzdEY9XejR
	 tRvVpFtvbb/fvIoPPF/xn5NBCQCDgjBPq0cxtW4s5zUsES7OjYx6CuNF22wZF2o92s
	 gLPBfnFnwn588N/LyzFktocDfgx0HbZpCPWVJ49J3ArJ+c0YX+GkLHmfY2PSoEmnrH
	 82UCYqwxQ7AKA1vgdZPwrzv7xt40d1J2fAOJaspWQckDibZlvy6bwyrZuyQHhJR+b4
	 HggcvIeRFiNwSbbKRnX6ScqJhGPQlmiwpHW5NadAucBrDVkJsJbyZIB9geFGRRDQD3
	 +dCHJ/fiF1boA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 586091AC52F1; Fri, 04 Sep 2026 20:21:53 +0100 (BST)
Date: Fri, 4 Sep 2026 20:21:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: Re: [PATCH] regmap: irq: Free the irqdomain we create
Message-ID: <apsaUXmhUSXvAvFT@sirena.co.uk>
References: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
 <87mrtw7sf3.ffs@fw13>
 <87jyp07s7d.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8lGN2wA9bW5AHCu"
Content-Disposition: inline
In-Reply-To: <87jyp07s7d.ffs@fw13>
X-Cookie: My vaseline is RUNNING...


--+8lGN2wA9bW5AHCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 09:05:26PM +0200, Thomas Gleixner wrote:
> On Fri, Sep 04 2026 at 21:00, Thomas Gleixner wrote:

> >      if (irq_base > 0)
> >      	irq_domain_free_irqs(irq_base, chip->num_irqs);

> Hit send too fast. That stupidly works only when hierarchical domains
> are enabled.

> So you need:

>       if (irq_base > 0) {
>       	  for (unsigned int i = 0; i < chip->num_irqs; i++)
>           	irq_dispose_mapping(irq_base + i);
>       }
>       irqdomain_remove_domain();

Ah, thanks - I'd expected removing the domain to clean everything up.

--+8lGN2wA9bW5AHCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbGlAACgkQJNaLcl1U
h9A1SQf8CJwxLqVKy8dAgH83qXZgodtu5IU9EEfnUEiFhXYxd1NpP+L/BO0PDUZ6
lV17H2GJ3Zq9AAXcvFYWzl7qZxV24QgPOHCx1B9QvrVquAh8otNlXPPUPYv9Zlqm
HoJ5tS5xiLo6oyi/onRV3i85zvn+qL3JEgpWwlt8U4AFvexp0ZZeP+VjwZjbfFRE
/MFQHW0muitzTBHJSMnMyDi7LIbq6Q3Wqd50Ee+k10kKIs9exZhhiyn1spuZ9BF/
9CxH9qUNWLgSjqyZBbjwQuTtcBuJftFg0gD91gN9MuXke2k3bVy/gpfLPb/d3rz/
7A75tr+J9xRIkU8hKn+PXV8R1ljkLw==
=KR8c
-----END PGP SIGNATURE-----

--+8lGN2wA9bW5AHCu--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473545505D0;
	Tue, 22 Sep 2026 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087033; cv=none; b=ZR6IOpd4tvJa+Q9CdODyuuTb2qbbO9HLR0LRZhqLomcS3M6Tr7PuhTg5vGTZWpnA5jpePC+WcVytS1b67LLXasw8erkEN9YaZhcowwO+OAHShJGRL8OKkjCCtWa5519ECCtUxiW+cswumi1M2xqVnza2CK9r7OQDbOD9jEHw7Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087033; c=relaxed/simple;
	bh=DTPEAAHzHP3jklhDvyPNEprkCT5JqsLk/HS1PD5DJVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adn6kINL4bLLqzloeW516DA/K8bfIMh3eygyuVsR/fMcE4wntHu3xPzkZrUCLM/clEf9rD6eviAxqKM7V4YsC/3OPwpgF4MHpWcXP4ZKz/QObqTH0ydtp3k2yOohNkpeGJErtDh6bkTMcGpZkltNTj6in2ckws8OSIHrcfldRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jz7rmf5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz7rmf5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB251F000FF;
	Tue, 22 Sep 2026 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790087031;
	bh=Ly2pXhe/Sa/cBSQyrIeNJRWXh0gmta1ocy1JJ2ys6wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jz7rmf5av2MA4moOZ2rh+BkTmQFJ308+vC8s56Vemcm6jUo2xGQVtmAfjlFbAv7dE
	 Et2VMG1mgdfqvcMnGcNVdLfvnTYIiNRLmpK5U1CgdJSr3quVMCjxwqjC7ze8/jpdx6
	 nfk6ZOchs08d+l/lQtK2xgpx8hWd1HWs9xWPxQBJPmu8oaIZzC/7sZIHnPjIbLuoFn
	 pFtUiFZnLskFLtHrKuv9OyGKEVGce3LWg4KJ4Ram6wtrHSXNz++b65g3k/U7Ne3deF
	 9iIfBjiZFAjHW4gPMxRxC4N9TPqwlr3JtL8dCpAX4B/cOItQskfIdgrNv+NpQ9CoN0
	 bLiqcJVuWyPkQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4EDF91AC56C6; Tue, 22 Sep 2026 15:23:48 +0100 (BST)
Date: Tue, 22 Sep 2026 16:23:48 +0200
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <arKPdM4bYsAeAKtr@sirena.co.uk>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UbH3tjqyzUf1AEj7"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-2-joakim.zhang@cixtech.com>
X-Cookie: Too clever is dumb.


--UbH3tjqyzUf1AEj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 07:21:31PM +0800, joakim.zhang@cixtech.com wrote:

> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.

> +properties:
> +  compatible:
> +    const: cix,sky1-i2s-sc

Should there be some general Cadence fallback for this if it's a Cadence
IP?

--UbH3tjqyzUf1AEj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyj2kACgkQJNaLcl1U
h9CZRwf9Gcsnlbj3mDtspOE3KBPkeWdgWIwa6rSz/vI8UVuV18xOBbS2PYroKi4u
GhYAQIEI3QnfB0hVZ01CBV4uJGwTdxIZHNxcq/sG90iYvGLmWM5WWcAKyyboX+Tu
bUdeCMu6Uk6XUO43DmbJ9JTjhH4rGAeJgY/MLjnxsib6NzN8g7PuzmxyERWJgeQf
G7D8UZgwM2Noe438uIihYU/hQQfZcn4pk1xkAyPHPvysKNw38RI97GfR9N1rHfdF
r9DT5DpOC+SKcVWWeoAGc/Wnom3jBMc158U+bLHX0ilbH+Y/3xW0KpIsz941/F1X
dN/c+oy3rIz9MtqSOJ6WrwEAvqWu2w==
=fhHX
-----END PGP SIGNATURE-----

--UbH3tjqyzUf1AEj7--

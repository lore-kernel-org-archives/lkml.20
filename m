Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5283047ECE5;
	Wed,  2 Sep 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349818; cv=none; b=tZQdEVz3QawFyL3xiQqLjyjrn6U2Qwgi0BlmfitpPmWZ/7HG5SDp+1pqJeD46b1GFi1t9AtzTUtJp/gEza3rxCLVC9PQtX9KPJi8RW+taPnqbQvteEytoGHUYxh4lqeVlh3A0XKRksIeK1CkrsKYEOnUHMtEhZZk0u/IKhPTBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349818; c=relaxed/simple;
	bh=uw9vdokc6SZSpTtBwYdVramsI0UkMNVIIWYHqdlChPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khCiRFO+7a9/UcIoRmEFGUbSdne06I8x8Avuo0Kg2tPSC865VgCu6+iX7e842d2urnvbrooZuimlyl/C5PTgJZRTD9eTRmAYqU3XrdixTXllUqTYVA0SirEtlY2AMicpOuouw177hIXLe2gY2nTfEqpO1Kk758FDGCfg+drNIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o16lN7aq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o16lN7aq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482D51F000E9;
	Wed,  2 Sep 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349796;
	bh=QT/vK0x7oSBzL+u+emvTzGAZ5rg0ZuukzQWasrQZMag=;
	h=Date:From:To:Cc:Subject;
	b=o16lN7aqJ9/h/3LNlF6Kb+sU0EUDAXspAuJIrnWDrQ1gJp2gC0OtkKGEDYJ802Q8X
	 q7w8rQg1CUU0Kku7NBZmUYVY0V7BuBcFtAQw6KkNftunJTGC6yY7qVxXpn87CbfNG+
	 tVvlb/0LjuLUmpjK5fdfb16QgHW+1ktLLrvrHgd6uR//hl5+7fVrn5t2qvgS+ltaiN
	 lHMfb/iL6f3h2Djz4Umc1fC4QfThT1T3zQyl2W+JOA6Ork/itLtGOXSHddB9+kjxSr
	 b0DtbiwHPrGgCBPpENOhbpmx1BdH4GDbM42C1kwE5IWrCFuGvVd6ftgULbZJUMxhpw
	 jBZin1VEjdfsg==
Date: Wed, 2 Sep 2026 12:49:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	bui duc phuc <phucduc.bui@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <apgNYDiSiPmNZspF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ljn44yh+NvUsEiv9"
Content-Disposition: inline


--Ljn44yh+NvUsEiv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the gpio-brgl tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/gpio/gpio-altera.c: In function 'altera_gpio_probe':
/tmp/next/build/drivers/gpio/gpio-altera.c:224:21: error: 'irq' undeclared (first use in this function); did you mean 'girq'?
  224 |                 if (irq != -ENXIO)
      |                     ^~~
      |                     girq


Caused by commit

  6e6e585b603e4 (gpio: altera: Handle errors from optional IRQ lookup)

I have used the tree from 20260901 instead.

--Ljn44yh+NvUsEiv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYDWAACgkQJNaLcl1U
h9DbjAf/QNrF01Hn8DEyduyxHPuMxMBsLVss1CC3Nio2JS5ehRDmv1Auvq2WYp1N
dLA7otgP8nF+XrujB6IlOz8m3gIzGgi7fM0sqKjs0rbAA/rRcWxRHc0uoBKX3cpl
WtX02mFc7i2gUYL4Stgs+4D/CQngk2r50p2ETDaUr+3lPhv5SFrlBT2MiwUTIzvG
kOZUB8bLPQG93Q8cQSZEXM+bTUlPGgAZE29AflAXKsYU7ip0rdiFmq/mFSeNJDVm
YW9TR+sXiRnI/gjJDlS9KuUlvf69/ivR5olUoxIg8T9aiOM99uXivjEDJc8oJdpz
yu4DxznAUCU9C3WoS0AkcSXaBspZvA==
=hrwA
-----END PGP SIGNATURE-----

--Ljn44yh+NvUsEiv9--

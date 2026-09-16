Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E083C8C74;
	Wed, 16 Sep 2026 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574319; cv=none; b=G+E3irYAFxxLyhJEbiZUdHt53DjFJ2zlAY3G/BK4aw9hTbqqHhBAu8NDV1W1TEzwBacRKyUX1joyFjxYAbQmRc9Kbp32ESRX6XEL3B5k7jqgyGUWCj1YegRfexvvq9vkKfelK9118/eatKXZZrhA2h/zcsTRn7AZwNAYzKjbUx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574319; c=relaxed/simple;
	bh=jlqv1idyCZWRCkk0KGTcKAJHzrxEWwBlIqufKXr+Keg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmOO/450uw8JwWbsI4uuGdLsGrOHBB7FW72x4wxuB9akm7dpdbuAQZVJPrTdl8mc3FUXhV0N/WYrdK+Ufbo3bhLtDfb3fpp3zw8BGqHkc8oXzGuP/l48AyIeKmgLguzAvlHrwTbb20FwnJ8GO4oenzCPIlCjCxBlQobkiv+TwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PS4zUENw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PS4zUENw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC0B1F00893;
	Wed, 16 Sep 2026 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574311;
	bh=fDchc0GVCFnahaTOS2IPX7LJ0QuaPrWIgI/USy0uI3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PS4zUENwm9pwv3IwJMdCLVZz55I0sy+e19rr/0lMunYfxwlqrvhYPclDcI2cGXn8c
	 0Ueavg+eCFJUyqLpcrSwBjVrO8YLnsnjb9rkBYNVJtRH/8Qa0zFTONwO97YLkb8ZVi
	 HHLus4QvwEjlj4HXV9Q2L15vKCAxGQPm0ARbhiXSAZi8vJb83ToRN6YCRkXzdx2b6B
	 POeSsbok1JPj5fMtMVvSk6bZsKOhYWHgXd40QE8yrSm7+xbFwNZ/ceaW+qAsasn51Y
	 6q+EmhzF9ghsHdTwPfohr/yktH/2zOKJgfYgCNLtrPTzPgQUpev1xGHCWPRolGfsly
	 NISKCZJSCwWng==
Date: Wed, 16 Sep 2026 16:58:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Julian Braha <julianbraha@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Message-ID: <9610061b-aaed-48a8-8df5-7f29f4db69e1@sirena.org.uk>
References: <20260915211658.1671821-1-arnd@kernel.org>
 <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
 <d09d7709-e537-472c-82d6-e532e955f137@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B+AwEemnu3s6U8t9"
Content-Disposition: inline
In-Reply-To: <d09d7709-e537-472c-82d6-e532e955f137@app.fastmail.com>
X-Cookie: Double!


--B+AwEemnu3s6U8t9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 05:36:02PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 16, 2026, at 17:10, Mark Brown wrote:
> > On Tue, Sep 15, 2026 at 11:16:34PM +0200, Arnd Bergmann wrote:

> >>  	depends on SOUNDWIRE
> >>  	depends on SND_SOC_SDCA
> >> +	depends on HID

> > Should that be HID=y || HID=SND_SOC_SDCA like for SND_SOC_SDCA_HID and
> > SND_SOC_SDCA_CLASS?  The dependencies on _CLASS should stop the
> > problematic cases from actually occurring but I'm not sure if it stops
> > the warning.

> Yes. Just as I was trying to write up my presentation slides for next
> week trying to explain how nobody ever gets this right, you have reminded
> me that I can't do it either ;-)

> How about this version?

...

> I think this is much clearer than the original version or my
> first patch, as it avoids the fragile 'select'. If you like this
> one, I'll send a v2 after this passes some more randconfig testing,
> or you can apply that directly.

Looks good to me but I'm not entirely confident in my Kconfig special
case knowledge, I'll wait for your new version after testing.

--B+AwEemnu3s6U8t9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqvKAACgkQJNaLcl1U
h9DHHAf+NHZbPZ9aQ19cc6IS43MiTvvZ8mxnC7zTPmBTWrZDPL9NDQ8YFXaiiVGh
XJagVQllB9KcM74RnFQyClfCP+dAHEP4R/rfBNeJ+kjhXYTSFB85L/V+tmyDKXGj
xLSW2KftjihmwBs6vM3PwaXbcrPcVaYQ2BUwuW+M5I4XDCy8ERLp/isdUtrZgBhd
xQadaK9XrvmazmOeF/KrPBOagmNBo9SGdoiPTDq1QtMLP2S/wWFOSACknWBi1Suu
5bvf4VeVeK2B7aBD6hafJkE1mmHczsY5FTGfe5SEmp0ymIgtIlFNZYv8M8ki7smt
gLgFRB/JmRksUxiYvfp3pRb2RDGAsw==
=CXZX
-----END PGP SIGNATURE-----

--B+AwEemnu3s6U8t9--

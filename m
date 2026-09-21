Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C8493627;
	Mon, 21 Sep 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982904; cv=none; b=Ce1APaAkHV0ROVNDXb0fl6b+D7/OoDB8OuxxWkU2GMu3c7H8/c4Ex5inroToW921DKOjtNpasVSaBm0raVJPEQyXtSo8Hh21tlpCPjGlOe1lk0BjZJ0r9ad+sg2XrA5QykD06st1tfeWfNQyHXZmssUz1qBsD6k7YU13ODMPdQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982904; c=relaxed/simple;
	bh=BlO8YcIAdLIGXqChhgVqSTvIsclf7Ez8KriTr4yfPo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUjjL3JsQ5Hj4QMApo4GpVI+I0DUrTV3ASEM+6h1MFLvLvITxZTTtJBab+NRbpN2p618IyVNwyKSdyLlALF4bVkyBR8m+pamqFF9XwyEAHNIcp0j8yHp2R6z56SvX+d/eRbiRQTZNeueGRNW18ps+ZUVYGU6vSsA2PDTFChrF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDvl+ge2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDvl+ge2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B731F000FF;
	Mon, 21 Sep 2026 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982903;
	bh=Xkoji6zTVBEB22n/TDJ3LMI+tSUvIAOWk7kusizeXCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DDvl+ge2tsNfsLi4bmj87KXWxJsb3xBG3klQYu6S1TLOKMS9zwVBy4gg2JWvVbmPg
	 tcSjkU2YKqFzrkyScxe2kIRZRyNdZ3QP5W7tzbexr2jh/+/XfsSUXdfCoDGgV1B3Ka
	 h0EvmjiLX9u1tVuWn8dp0YoZgX8uIP4px3xsYg+XWeJZNRj508KQEM97eXUEYty1Dc
	 xMGzrivmjatQkrdPeK0/qHDzlmNKvHCmp9Tzo2mtVoIKnSWzlSmLxknsh/doJWWRzV
	 fXkRz4gQnZJgsObRR6XxSf0l5qs3qKOVN3m+w1uJ+tYr52UFf3RU5gyMNAsyH2Gnv9
	 XkYloDzLxLG6w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BEE3E1AC52F5; Mon, 21 Sep 2026 10:27:47 +0100 (BST)
Date: Mon, 21 Sep 2026 11:27:47 +0200
From: Mark Brown <broonie@kernel.org>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"pin-hao.huang@hp.com" <pin-hao.huang@hp.com>,
	"Syed.SabaKareem@amd.com" <Syed.SabaKareem@amd.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5] ASoC: tas2783-sdw: add firmware
 download status check
Message-ID: <arD4k6hCZyqycYYW@sirena.co.uk>
References: <20260921064053.932-1-baojun.xu@ti.com>
 <arDujlvvKixE6ifp@sirena.co.uk>
 <1c8da29a1fac4435a59783ab9fe7f68b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bJCWGDMDCoajVTO9"
Content-Disposition: inline
In-Reply-To: <1c8da29a1fac4435a59783ab9fe7f68b@ti.com>
X-Cookie: Too clever is dumb.


--bJCWGDMDCoajVTO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2026 at 09:22:23AM +0000, Xu, Baojun wrote:

> > > +     /* Check if the AMP is in reset status. */
> > > +     if (val == 0x20) {
> > > +             tas_dev->fw_dl_success = false;

> > I'm still not seeing where fw_dl_success gets set to true if the
> > download was skipped.

> If download was skipped, it should be true.

As I said on the previous version can you guarantee that the driver is
being probed with the device having been reset?  What happens if
something earlier in the boot process left it running, or the driver was
removed and reprobed?  The logic only works currently if the driver did
the download that it's skipping.

--bJCWGDMDCoajVTO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw+JIACgkQJNaLcl1U
h9BJEAf/eeDwmjV/FSyl6fIe7qlINfYCE9CEaHUbl12MXZlEzgyMZAHy0DHbA1VH
UtqTp0Vs8mOwXPcib1/xqVocHIvSgnr38zSGBR6ZWiXTlgqPpJ/3txPBvl3DELlw
JDZrV9yQEvlDu/1hS1A0ecdFkjdqnrHOVRypk7ISFg9t94TlxJFmNxMXu0f86Tls
XtulpOyuLMEPlDNw0E0BTLkW0AlCi+qc/+1dPguUHiGeM0jTedi9cXLvSls2SU6P
QjYKegIzU9vRAGH2xm9ywL8emZNPFMiWD9uvWhOFO5jfEeKqOu7TJHw8ydyHHoyU
sH4foP1eFeHvfgYPw1SX3WbmcBWIoQ==
=fpaH
-----END PGP SIGNATURE-----

--bJCWGDMDCoajVTO9--

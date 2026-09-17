Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967593DAAC9;
	Thu, 17 Sep 2026 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671300; cv=none; b=eTjlTJoY8I8OAtSsC0gSqGTfsKIDsV53MLuRek5/8rPheR1bxwN+38agBKYAkUFHouAz5q8c9YtiK3Mf0/KyMcJIkBdiAttsaVWQTgJQUuwM49NmQKPY7OJsGvI3SmKPs04w6Jj3ig1X2JTTrWP/pcV1D+hnMmEu52HLSzLY730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671300; c=relaxed/simple;
	bh=MFyYX9kVDyHke7v9GQr92A5KO4Bb7nWSVOlKfr7KMN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7oRNvl9Qmfsn2vldbTbze/bPNzVxwgR4Tok3/pe18agch40TfZ/eiB/Jca96xOp3k40ZJ6gWVt8mB7YA0nFwR7R9BWAWyrijlv9+ajYyViPANZyuCW7B4N5huGAyVYz0qliBm41o/+x44M5xL3FGKgbpn/r04Ry8XRCigYYQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf/2I9hp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf/2I9hp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398271F00893;
	Thu, 17 Sep 2026 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789671299;
	bh=MFyYX9kVDyHke7v9GQr92A5KO4Bb7nWSVOlKfr7KMN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qf/2I9hpI49nwH1tn75LokHsYexyxzfEH6U4I6JtWWLo19PjrUJp4eKR2SLM08VHm
	 vWyc/XnRZiWKesiQxVlHufPz4YMXOHKIDuHFZLd6kmqBryeS8P1tMm/02E5wtxwHc5
	 +QJxi6eC0j5oEjNgkA8YvlHYu7JPLvfuCQjbPjM9Ix0EczDZpnJZ+yHtFcvBH80TPr
	 T/jB/tDAFxzbCwJh4lL6blG/4XIJvY11sC+Xh6aAlipWQ5huq/YwpDXU/AJ11de6m9
	 wpGireRfH8+vMv3uCmMSZbXn+TVoQY5PXLt6yVKYw0XxDQFx0mSqBqEoWSVioRN/UU
	 0VaLYJ/6o/uLQ==
Date: Thu, 17 Sep 2026 19:54:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
Message-ID: <334c9751-208b-4c92-a839-be2afe7730d9@sirena.org.uk>
References: <20260916220453.260472-1-rosenp@gmail.com>
 <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
 <CAKxU2N_JqRtBckSr+CFyOLP3vVk=ndE4UE5ihYtBUoK5sd-F7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3dlCn4rFol7Kvr1"
Content-Disposition: inline
In-Reply-To: <CAKxU2N_JqRtBckSr+CFyOLP3vVk=ndE4UE5ihYtBUoK5sd-F7Q@mail.gmail.com>
X-Cookie: Whip it, whip it good!


--A3dlCn4rFol7Kvr1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2026 at 11:27:36AM -0700, Rosen Penev wrote:

> It was requested that I split up from
> https://lore.kernel.org/dmaengine/aqrxFTWEsJmFIrel@SMW015318/

Unless you mention that I'm not going to be able to tell that anything
else has changed...

--A3dlCn4rFol7Kvr1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsN34ACgkQJNaLcl1U
h9DcfQf8CoCTFUBtuCVxszea7OXsokIzmnMaLJNcJ9VauGsEEWHaqIEEnchdnO2B
dQRAYNfJQorruagKxL2JW7vWmu6sRfnUOeIbgVgyF7eElE1r8WZXdQ5bH+IJw0QN
nUuASD3TavelVFBPuIsjotbepLppsnAojbevZ2mCVMqPaNbQSCRCUIS1wbd8wu1w
2OTGZVpsuzVy0xdR4/WitqTeLe5+FTJU0gECQ7uLriqhBI5dLk8y234hOFywASpR
3N5pGooc7MpK3xWxZL0E8D6KNDSIJLBoEbgVuyfdDf3wm+UNwK9WbVpurbJ5voEx
152tx8KOjkm1H3uQSG7jC+ncwny2MQ==
=BeXk
-----END PGP SIGNATURE-----

--A3dlCn4rFol7Kvr1--

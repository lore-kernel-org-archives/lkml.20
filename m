Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F3392811;
	Thu, 15 Oct 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087870; cv=none; b=IWOvYnYZihffhJXGFck/7xj9cFw59mTB6HGXBEMvLu9YIlh/KucengkTr4BjhxoJlVax1QYpYRiArA4sZskNRDAWlLZQyLWfYIGR3dJ9Dtyyy0B94rhP9nCbB3vqteKqxB7cZgiyIofPMdFwnBEHJ/Do9IAxj3hMcT8uYx2S5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087870; c=relaxed/simple;
	bh=lsg1dfijms7lkhDf96j9gOlfkCYlZ3biuUFE22Qt6m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzQFwl2aH1+Pl5+8D6vcYWj4R1bqCxZsl2qPkbAgrxNIG5ScjkaM+EZ2XkgCu7LAvCHDopRxPWaq3RZ/P3HtifrzmZilC14e2gMITSlNTssxw4XccppqsUkr5l7ZvssJO18ojZvZndzrWw6GG5Wn4VYSJTIOYnYIPkhmUwe+9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWeo8Wq0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWeo8Wq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102141F000C4;
	Thu, 15 Oct 2026 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792087862;
	bh=nNbgFoILvXz3KdF+x2gpod6rM+HqoXUVeCqW4noJ2MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWeo8Wq0x00IHGH2lHZb/0LiuKi0GXm7wnBbqa2PVvVqWhqEMgbvmCSKoUUb90xPh
	 fPGjtYqDdKnW27H8GeEBPYkcLfyNVqOiL4x4YVmjAcvCIdg/AOC6qpqigUrpLYmTpF
	 Lpg6gOFQnjAIa3IjV1zJmCveD8ZfHYBFCa+3j6/PGIkfk8LVx7jrGvyvoO5f3TgXkE
	 eTiULcMc/LuEIcoXIr7djtzX+F91gt2KhVx+2CrBBz1DiiFLC0xAQJF/02a8Ddbb8Y
	 AlBWUb4BxfeAXKHrgPYsu1mZyPMUO9Ctt/ABcDWu5Ap91JY93/tJkf42eWpdwM53pK
	 4fFwhWvAgDELQ==
Date: Thu, 15 Oct 2026 19:10:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Message-ID: <55831eb0-b7b0-43f3-8c03-4d1029ea97a2@sirena.org.uk>
References: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvels45Sch5WBIir"
Content-Disposition: inline
In-Reply-To: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
X-Cookie: Tax and title extra.


--bvels45Sch5WBIir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 07:02:54PM +0200, Sebastian Reichel wrote:

> This codec is typically used with ALSA UCM, which right now falls back
> to handling mute in software. Expose proper hardware mute control
> considering the driver already handles it internally anyways, which
> allows UCM to bind speaker mute LED to the new control knob.

> +	wsa884x->user_mute = mute;
> +	if (wsa884x->pa_on)
> +		wsa884x_set_mute(component, mute || wsa884x->trigger_mute);

This is checking for pa_on but...

>  static int wsa884x_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {

> +	guard(mutex)(&wsa884x->sp_lock);
> +	wsa884x->trigger_mute = mute;
> +	wsa884x_set_mute(component, mute || wsa884x->user_mute);

...I can't see what guarantees that pa_on is set here.  It looks like
these are mono speakers with multiple speakers connected to a stream,
someone could fiddle with the routing on an active stream and power up a
speaker.  We should probably recheck in the speaker event.

--bvels45Sch5WBIir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRFzEACgkQJNaLcl1U
h9CUFQf9EcgxtBivBJw7MRNDX+lovyKT+6n/oIqUwVjzdJR9fnFHr+0adwjwTuS7
6IcssrX7G9beIUBdIkLDM2Bc1cd5bk1bPQbpT9KwHGCOPTLNtm9ZmtaZ8fL5ls0P
u5+8DhkM8DyzosZP+JrUVWIWYfRIT8j/b59E37SzxoGXAbZojBsa6DKnBs/CTIg6
kfNEGMOzI5uMlZ2P5lLirwhb5T8gNVG02UAdrj1JmGUcFMpuDUY8BMH1INV4297Q
H9kbP3tXbkvuaajAa99P2TsqbgZo3xNBjkr4h7aQHOg6gZmuitO5ynqfZdKliJoo
t+cwcmOmM0ikoNFygykcpplgEFbWrA==
=eS07
-----END PGP SIGNATURE-----

--bvels45Sch5WBIir--

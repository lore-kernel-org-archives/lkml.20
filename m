Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724591;
	b=iruGaz6QBsF8S1m5mBQzoqYeNqHvppP2jZ/4Fiqcyuds/i4NVE74XX3HJ0wezdJmrH0W
	 qlIHn7/LUmdvhJVrOQPiLFU/0g8JnlQy5jTuLtugQDi0EsadnWvnPZC+DpqDvHbwnBmBu
	 xCDnR3+pFSAt4vdPRXvmKP97yKMV0nKDeO5soDK4QJNPVVgyyeWzkDNEELKF9oGRDYIxP
	 lBkOZ8/wwwuyDkwyplN1h/knO1TR43TG/ZAjEZ/Pn8t8POq9HdprAnDsY5P7nmnAj9GNH
	 r61F8qTm7P/tO2xOol/B7kLMxOaP0hamai+38emoDQiNUpGA7ymDXAqICJUG2yq5KXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724591;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=JgzkxDLvLT73nIqEBv4EHYF8tqo1oI/Vz7oWz1FWoeU=;
	b=ByoSnFoc3cy9wPcJB+N19Qzw9kOgi3eg450is4JkHubjjyXJB83nR9+NKoYNNz3iYxPi
	 spqzM8PNhNHvR2MpkT8saGHd5k2ebCRCEgp7iDeUL/bZVeSEGGNm2kaqbFcsycWdVLmyd
	 OxQ4v2DDe54lbDgnpdjNEzcpXjlDGoBdnqRVuUi8iax29oedqiFG2ZtwWL2dr0HU2QGa3
	 sjiPmwtw7VDsfIi500NeOLaXlMbzJeCYGF/NOPem1ZSFwzDYe5RfqJuF6/gcIJQAeP7ER
	 ccNVMknrKvw70/Hs+w3AICwohP/yqvMkdx9OIdSM1z/dKDnEO+2UoCNxH+s1xUn1dZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezYU3G6S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFEB606D82F;
	Tue,  3 Nov 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezYU3G6S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7291F000C1;
	Tue,  3 Nov 2026 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793724590;
	bh=JgzkxDLvLT73nIqEBv4EHYF8tqo1oI/Vz7oWz1FWoeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ezYU3G6SgjoJ1LB72MMr7ZlTVimAikMLIt7ztwl0Yh4TXKiTsDt1HMGC0L2SMu24V
	 f8+6BNuoUKPDfWplmj3p2VrRsl29TBc+Qqhh8AhfGYV69rniAT4BxiduSzd4HNNLWD
	 07zA8VH4xNmvHvwl7WNN9PqVXwEamBjlTWrV7GC1TX0EmBSsO98jfwgdfHP8QLXqT7
	 PbpBjFVMcERPN0kV6UVFThN/HPplnWmCPBkjXO9hPDi7BSlV4qI6tFShpq43vXKP8Z
	 +sM8hhksiNhQuM7dToHqzpGoYh88ZKPxpOTXkrVQa+eze6DczLbEgKLALeklDhPdTo
	 Led81R3clv2PA==
Date: Tue, 3 Nov 2026 16:49:46 +0000
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Ivan Orlov <ivan.orlov0322@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ALSA: pcmtest: Add a volume control with event fault
 injection
Message-ID: <61df01a7-10ee-407e-879f-d9c1085a5d43@sirena.org.uk>
References: <20261103011000.1012035-1-sammiee5311@gmail.com>
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
	protocol="application/pgp-signature"; boundary="DhypsNCGn5z2zGxB"
Content-Disposition: inline
In-Reply-To: <20261103011000.1012035-1-sammiee5311@gmail.com>
X-Cookie: Small is beautiful.


--DhypsNCGn5z2zGxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2026 at 10:10:00AM +0900, HyeongJun An wrote:

> mixer-test runs eight checks on each control. To see one of them fail
> today, you need hardware with the bug or a driver broken by hand. I
> broke snd-dummy by hand to test the side effect check. This patch does
> the same for the two event checks, with module parameters.

> Two questions:

> 1. Is this useful enough to cover the other six checks too?

> 2. Should it live in pcmtest, or in a separate driver? pcmtest already
>    has the inject_* parameters and a selftest, so it seemed the natural
>    place.

It seems reasonable enough to me FWIW.

--DhypsNCGn5z2zGxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrqEKkACgkQJNaLcl1U
h9DWqAf9EMmJW1PTVnksugog02M4UhFyRNexHR8ft/Yg1+rth0MWOG5hVRStqtWy
ynQzU0Y+eddwNdNjrxKQhK8WM6rqSVeoI5O9I4wSMl66ZeblR6A/0zvv5LYW3u0F
8MffJ7G5JEpHUzv0UMGuoDTBRaLI0JMDnobzS8+2UyR6b/z6QoeqX87avydNpc5O
cCJh5PYTAVJ3bUN6Xc1M0gJ5EIUTK+719g6wl384D3DGj8/NIwcoSWd8g5ni8Qc+
64aKhKrrzbQj+NNYuy+hKtHzeizyGAIbljyN3Gw309Z8E3x18GrhhXbXMVgAg5QU
9DwiD8cEwZ5tgqH01CNed7yhSeZ27w==
=7G/P
-----END PGP SIGNATURE-----

--DhypsNCGn5z2zGxB--

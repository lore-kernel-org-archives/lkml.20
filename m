Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582558;
	b=j5ihUfJSJGEmyOIsUdx6KYgk3JIPKDC+IESZV4rjDQ/ZyTo4F9ugVjWRyCMDV1fl9PH8
	 +VFZWc2UVAK/If632rOjvE8mfTGHgw1lZVWp72sSJ2FlmAPfiwz9XePgSPuE9NrNOEAaN
	 rJ9q6lazbdFkEDGHE1r4iWtUyVazx3qq3m/k5ivQeMv6ae/eABz0aNxH9v8Io5V6UxL9j
	 DwDhi/c6TxYG8I35VrE/tyJoeWOZF+Mj/IzvXHtIQxELGwkk01Mt45f/8M1bprA2n9vEf
	 8IipgCius6hNGu14xqY0a8KYXw0yWQoMaRXpWvwTtjPQ0P96/rbtain8NFSRQnTUuUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582558;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ElaHpO/cl7bIhBpcIggkO3WyV+HKCbctoj21X/hVL3w=;
	b=D8cl+ABnTfQ44stTo6OtnulDL0ESQxMEAhEQcVHrNzbKMgECdHbwKNABGss7cCggIyRh
	 sp+uLiYS9cLRso6aBBRzd3bHKUsApizxmmYHrQD//2RMdQ2LAelHn7BOkn7M/tzyO1EvX
	 fRzWSqxchOJvFMo7aTeNjsXzLinmMDcCh8eyLdDwlYfj8mYLoXwkRMbo+MVDLMg4c/uiB
	 WpoqVKELl1RJgxkhgA0itTDSc59coucmnn4D+uNqST1WqE2ZcV2abl1isM5c6B4Z+kM7a
	 5W+EGIppgs7O794tp9MtRigopEmhLWoC+n3IJcKCgLT+/oranvv7WkZTgcPdG5mqvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCoxE7K8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C7606A32E;
	Fri, 13 Nov 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCoxE7K8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18081F000C4;
	Fri, 13 Nov 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582558;
	bh=ElaHpO/cl7bIhBpcIggkO3WyV+HKCbctoj21X/hVL3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCoxE7K8MTaoQxI7TJYL3QOgNegL48sGHSbCDvlHU6QC+LHc8Ap9HG6v17knvmDvF
	 0WQ4TdIS/GeUQHZZdZKOe4Z5hkfvYKGEA7hPrElyjOLy6cypsilVdxKGzLTwVxJ7Nm
	 V/THv7RQhk8ruf0nvU0V+TJKdgwbnCffsGEjITZq2sznjKY9fcvBiVfMwbXmeK3/VO
	 oypA7NkD6G3w2QDC3fEhWAUR8n3yGLCusgP4kgF40j12AyKmNHvLgOxaI7Wm9aGt8B
	 vhX0sluiK4JXpZ4BQKZcEGECH8ff/SaJQwUIXxOq29GXuliBCi4MXtK7ElPHbHkwaU
	 n/AAh8eot3+mw==
Date: Fri, 13 Nov 2026 15:09:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Valerio Setti <vsetti@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Message-ID: <956be74b-e417-49ef-8c2b-4cfa2785de1c@sirena.org.uk>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
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
	protocol="application/pgp-signature"; boundary="aUv4vAN6sKoMDkAM"
Content-Disposition: inline
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
X-Cookie: Flee at once, all is discovered.


--aUv4vAN6sKoMDkAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:54:29PM +0100, Manuel Ebner wrote:
> Hi Valerio,
>=20
> I have read your patch and have a question.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--aUv4vAN6sKoMDkAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3KBgACgkQJNaLcl1U
h9B39wf9EvUqesa7tYghVXB4F8vgGeLnqIn57bm2KD+9XYi4jGGVSW8c4ebimqhM
dp+bmECZYP/LAUEt398gktd5wGC+fWNPmHZ6rxyZJyCNr2+MuvjZ58rM1U7IJ9cA
k9qSPDzy6EV/4aNWqvFfmesBxQUqej68UhfKVr4w7/HmawPuUvlfA/z4qi9jCkZ4
5bTzkEzmBBVbJ2DFi1DcS0b22KkOgqHa1wSBaGCLmFVDhhgrEZCNFqSY3eJZprZG
7UPInXpfm7vM4MkdovYrnlXaTlZ/8jOgmw9F9z8jNCrcJFg+Beebv32ZmJuwUbY8
/PxUg36kalzUVnwXEVSMIPpbpx11+A==
=BzTS
-----END PGP SIGNATURE-----

--aUv4vAN6sKoMDkAM--

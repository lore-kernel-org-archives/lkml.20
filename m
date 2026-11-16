Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867435;
	b=FSTwhjP+eK5JtAMvr1dq3m3Mm0xMe+jiM2D5p1tGGFqchKAjFuXlKCdcX2+WpApqV2zH
	 TMahiXInNlzX+4ZO+4/+Yk+X4aDwOeqbQDG5WZGhs3JwZwMWSpxYBTMKeLfu/f+SvW8mX
	 69OzOEgn7C2dLs6UVyl+Y9wWsUjHwF3BlSohTVuNoYWP430GXWzOrnDF8VGqT1kvfK4SZ
	 E8ppZCS9EoE9AcWP2WK4z2rzQb4Efj7xxeTWU9P4/YFOKry/6yJcTRHY0HGIJdLsr729U
	 3J3CS+6EYiRuJvQ7flX+IbcVgoizQeygz242yT3eT7GAL2ZGWH1VK6rz+5ohLAd5IOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867435;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=mliR8LbpLPEncYUFbf9dyqHk+SUbNegdnOB/qGMOmBU=;
	b=KbFAnHkZkO0s7fnLNQeWR/8bx74IM6/bnL6C7kf9Xl8UvdJOGKsH83ZdqB8W9cPhqG6z
	 dS8ZgN08/tdqjthSOTYXXmU2DZf37pZyIKXNFL0VPd6vItFRj/+27bcvfC7fPbF3Hd8Z3
	 gnNBAbT/Ez9MF6nWRosUJSNdnmbt/8EwQYqhf8GbeNf4J/vrr1e8YapkeybSTJdazK8m8
	 lYT71VX8lQC+YaNkzQ1vhA3XaHx4s4vBzz4KBRFh0tISMfu4Z+18iEFtF5L4KbDvuLwBn
	 wnnx0CMRgve3yQrHlP1dxr3KUXx9Pn2YrXCxZzVBye+Jk6Y1eJ2YdQx3PBfoY5Au5XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrvC9eo7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEA606A335;
	Mon, 16 Nov 2026 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrvC9eo7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11FE1F000C5;
	Mon, 16 Nov 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794867434;
	bh=mliR8LbpLPEncYUFbf9dyqHk+SUbNegdnOB/qGMOmBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrvC9eo77v9rocDNGyC1ieF/zglD8bVr1k6ZAUwdE5IV1ceatha276TITuguChj1X
	 YE8qftcEXnISxe0i0v6MyqBCve/nFT+I9U+pEhmHGDgN3t5HBbP6h4lGS9qeb8Vhwf
	 EiT5uBtX4Oasl80s2UjiA05Lv0nie/RlFtCoFhNZdceVqpZRHs9p5uJhVJ7xfA2VFm
	 yqwyEr7Oe7vJj7Mhj09v/VZr/YXz7xIwXUTKZZtJi0bIu447xh8+rxtMuSH+lZWlmC
	 O60oHW0zZ0XjxudStEBWvdPGMu68GQYQXvcc09fW1dFGJ7JJzEYhXW6hxkTQQ/X+iS
	 jTE096nJfJL5Q==
Date: Mon, 16 Nov 2026 22:17:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the thermal tree
Message-ID: <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="4UxAw7GJdsa5/B0j"
Content-Disposition: inline
In-Reply-To: <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
X-Cookie: Serenity through viciousness.


--4UxAw7GJdsa5/B0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
> > Commit
> >=20
> >   115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")
> >=20
> > is missing a Signed-off-by from its committer
>=20
> This issue is still present today.

=2E..and you've not told me about your new email address so you've
probably been missing some of these mails :(

--4UxAw7GJdsa5/B0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7gOYACgkQJNaLcl1U
h9DhAAf8CDZxnGZc1K98zvWJ3MQIf0+p2AMPufE+ulAP0yI17oGnIpjFg2PdbNtj
exV7AOVR87HQvcFXWwGy/30Wv1K3bEDdicIkPfCi3BfLHuSGAoxMkvlDlHmSnLZP
hNSPJDv+8M2qzFaM78e60pZH9+dI6UD1UOJWwyXfCy84Zu9pgWU/FGFZeU3XJu+f
PzJUfjJ9N5ZaXSuherhEbg+wnwzFfpsjjo9pvy9FKqlGsbGJFUKApQ3nEig8plJx
qvNFQ1GO1BjXD8G3RFuZ8bYNyILLyyRekXnE2e4nnIvWei8qwy8Z7JqJAJRxQ6oh
cWm2MiLJUDM91HGnXR8JAxFRHv/BFA==
=eqrL
-----END PGP SIGNATURE-----

--4UxAw7GJdsa5/B0j--

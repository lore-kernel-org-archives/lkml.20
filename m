Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821374;
	b=qpenGW3hBNgj1LC5dmGAplNh3vI3tKAz7CsqjV3HCGljRtv3B59HMrEPvA/Rtz3Q9v/4
	 5UWTmb9t74696oI+hZ64dUOzHZCWLA73CwA+h3qVanZnv4OdQuxTSsefYfmHVBrcfeXR8
	 Ptul1nRU8VrQCsd+w8gRp++yHkQHu+GAJUD+EGwrtkNGSBJkDU9yM+CxL2Fhj8zqG1rZj
	 oRN54G39o8Q0gwVUHYl98m0VveRGM3hitgO5DYGuNHe7kcP2+xMX7Wul00rB+IRFQvekN
	 FdQT+SzmwHYeGp8+d1r+N2mp7n/wgSX/bdgoknuALT6mT3XjdfuaXgPIl4tWZpmnH4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821374;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=m+S9j1fc7QzaKSoehi2h1oJPGRZU9IfVV4cj6FL3ldc=;
	b=EMNxRzsVJjsA+7sF8x42FvuSRgpHX6w4di9FiizScYdbhWFn43LxPlGk2bFcDGPkoz3n
	 UamryCGYV0qNUOB72xN+3a6PDx2kg9/V35CyPTs5Jg85clbR9W/liQBd02lmNPETti+gL
	 POcjheJD2sLeUExYP+ZQroeU8hjNokjZ/sANV/ckgs+4r1T2uCOu7Dj317jzKtQBPAjoM
	 FcBCXQQJk/3O+Ebz1iqGbFC8zyGfH2h1Y+6P6xxhduP36Jpwa1EWLRTIZ4HdS3KDO/d7a
	 YzYAbvsq8bqJv0WqVzhgJ4i9V7JWpC7EYexPCu8DZ9LZtAW2OEwAE+xLDS0fWJ6Rf3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZGy8vRik;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531E6087D31
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9531E6087D31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZGy8vRik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m+S9
	j1fc7QzaKSoehi2h1oJPGRZU9IfVV4cj6FL3ldc=; b=ZGy8vRikaM9exXQQzPqt
	PEwMUORsezmRH8lXJfCpy8QVPmUhgCwVjFrMKaIYHVFfJVBmMXZNbUr0L+L1/6ZK
	6Zxep9gBRLxTQUU5cq0wZl1866GeLWHqCxHQa9U3L4OT+pOkgYR9g9Me0PDgYTkp
	sReiPcNYpE05WEHk069ZT2a7sAaLU52a1wk0HUo5SeLY+5xJGFVZPGNHt2ifhPCh
	GIzogiopVLAO/pghQ52twipxYzsBBjSFMfinQ+ki19feLfezzRWsf4iInPDyRvld
	XDY48LFRfAHa0D1txgR0c1Adwe30GG2iI25LneY6UWjwD0oQZak3rtrwOyzWK9iD
	0g==
Received: (qmail 839364 invoked from network); 4 Nov 2026 20:42:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2026 20:42:50 +0100
X-UD-Smtp-Session: l3s3148p1@gzWIlXhfdKvAwtcC
Date: Wed, 4 Nov 2026 21:42:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2 0/3] i2c: dev: fix blocked adapter deregistration
Message-ID: <auuKuSVcFC6lVgGU@shikoro>
References: <20260827102043.673273-1-johan@kernel.org>
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
	protocol="application/pgp-signature"; boundary="QA3Hpr92Br5cZit3"
Content-Disposition: inline
In-Reply-To: <20260827102043.673273-1-johan@kernel.org>

--QA3Hpr92Br5cZit3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:20:40PM +0200, Johan Hovold wrote:
> As part of addressing I2C lifetime issues, this series fixes an issue
> which may actually matter to some people, at least if they are playing
> around with USB attached I2C controllers, and whose fix does not depend
> on any larger rework.
>  =20
> This could possibly go into 7.3, but can also wait for 7.4 as the
> impact of the issue (both in terms of number of affected users and
> symptoms) should be limited.

Oh wow, I completely missed this for some reason :( Just discovered it
while digging around in patchwork.

I will try to find some time soon, so we can have it at least in 7.5.

Adding Bart to CC, maybe he is interested.


--QA3Hpr92Br5cZit3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrrirkACgkQFA3kzBSg
KbbtAQ//VmURoKTvNHxu/U5xogAuzFrVAYE2VRLPAjeRBPlW8lSnNNoXfpgMxUrA
kGm65qwpzjl8vwgvOeM40REpy8sE4/1/kO7OJPbfSB9+oz8nt3HDdnmaoiwn1a0F
YhX5NbSEmit0uHNI0Pl5NliPvLJ9nGqcKSy6LabPFGaXGYIveoYYlfgnR+RCHPBg
OI5qEdrPQJX4Akpy8DiRgy+OnZY4gexkkCq+YRU1fxvHy5gKgG1nKXUwpXm7Cpw3
l3qyxDu4YTfN9M2UH6SIKMW8Lc7pe2tBLiJCWZc2ACwJAyV1cyFbFKAl5As7zVtv
4ufr4dy3L7x3YZzHjC5i3mV++ZQLZUmlbirE9j92uBBbHpLMqGPH4Hl9w+avyZXl
hYFQlBelJjCqqJJ3dNZuYFQJoCw6CwxQu1bxImaQvjwf3z1+g2uf2ajISvJyqEbc
KS2pbZlSQYrzaPGAkcYGNGzyVzdh0RUlw0db2TKlHHubtywb5hrzBZ7krknBYwug
OYp1I5wU9d7sTuxBdh5QnFB/0dgppBEHGxQl7mWid5XgyZVBf2IpCrI6fecNEbvK
Tsm9hcxYscL64jnXfBye+JfPOyD5HhMyx+XUIoXCxIT2boU6598DlEMV0SBfFFOe
YQUkQK+ZWTschNZZURdLa6JiaeUfKtjZJhUFvVDY3eg8XPk43io=
=S4xH
-----END PGP SIGNATURE-----

--QA3Hpr92Br5cZit3--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971656;
	b=XmiqxtNgwNTYk+sJ2/OLVsKngNzRH9HeQdO4a2mLLXDIByYQb8q7xe+u2LAJ5PsOOjvN
	 w8+oUepLHfaRnM6w9DFEG9hKjdlBCo6PoGFvCSPvTFdBBdsLxaLK1+pDxCUmaGne2L33d
	 2cPSUb0MG7qQkRCWfo7lW1Ht9O7KfM2lk3q0CVAkomb4x9mcxQljdCKQAT3OuBfnMFAJ/
	 +o1OXVo7CJC1lvd1GSz9e6AZkB46MOfAJA311gXH6c4qFE3n+gc2CH6OqbFgBozPBcB+x
	 fRmVZ4MMDM+zhkMUjc1iGOAD/b5/bId1BptsRd2g/BoN9U7+C4QNPm38JsigITGqkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971656;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=PN4awULBFGC9ZH9QdrdiAMHRKAA3lcCqKfgTxlypFXc=;
	b=UNWEj3ouvHo4Gy/sQ6nCEbUNwR8q8Q9TN67FsoTX3+CXYup4M/FR2qaZTAfpwadX8IV3
	 ZSMJVuErDDQCX1UqKiHTEAK+Tn99xCdi1mbMrIqhNRasmw0IMaPASmTM0J7NtIOd8HncC
	 B+SoSDqdayrvDRgF6JD5xyRYxFfoPXkx11ciLw7ohTsSuOFhYYyt6LK28VL/O1UEjEWJ9
	 89D79RaALSLYZtlWME5jNTytAtcwj2jrmm1hSu5L9KUIDH6JkzTKHC6Fg/5KLLT+JSQPK
	 4aWY4mJB78Ixu6FPyc5rXvTnYeluRlmXYUP9Sn54xTGLZj43FQ20AqWBUkm8qMbXQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S21CMEXt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59606606A326;
	Fri,  6 Nov 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S21CMEXt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6821F0089F;
	Fri,  6 Nov 2026 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971656;
	bh=PN4awULBFGC9ZH9QdrdiAMHRKAA3lcCqKfgTxlypFXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S21CMEXt81WIvcIKyPoFfFmTRFa8ir9+MiOyQJOzj373HqU34J0Rl6QtMlJIkRoJv
	 qotoYFJKBQu5vOGm6DJ+obJGWRe16YpitShaijeWSzn9LrKYQnyD9hfNKt2gFayC6x
	 FwS1rNBTIdFOmBF6997HjpxIYtzqps2akAzNmq4Ct2AZXyMdKtWbjgHkQQwVMQPFP4
	 jmaFS8v1YBpU6xaByvC2y+0OmtNnClfpFgdNGZQf3L7d6enLhZ9GJgpeSZLHyUPcSn
	 4BzrcO64jjV9H0CRZpWkOMC7wVgq2hfsqI1S1/U66B5daxi6wC0ZVchbSIOOHgaz17
	 oVLYUJqfZIGTQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 7187528078CB; Fri, 06 Nov 2026 13:27:32 +0000 (GMT)
Date: Fri, 6 Nov 2026 13:27:32 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: pierre-louis.bossart@linux.dev, Basavaraj.Hiregoudar@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com,
	Sunil-kumar.Dommati@amd.com, Syed.SabaKareem@amd.com,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, venkataprasad.potturu@amd.com
Subject: Re: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F
 SoundWire machine driver series
Message-ID: <8d5dfce0-a916-481e-969c-f106f1571084@sirena.org.uk>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
 <1a75c8e5-975b-4225-9e25-5b6b1148fb50@sirena.org.uk>
 <2d887588-cda6-42a9-bf0b-890b89826b57@amd.com>
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
	protocol="application/pgp-signature"; boundary="hmGdR5RgUZctl1XF"
Content-Disposition: inline
In-Reply-To: <2d887588-cda6-42a9-bf0b-890b89826b57@amd.com>
X-Cookie: Whoever dies with the most toys wins.


--hmGdR5RgUZctl1XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 06:21:23PM +0530, Mukunda,Vijendar wrote:
> On 06/11/26 17:54, Mark Brown wrote:

> > This has really confused my tooling :(

> Understood, and apologies for the confusion.
> Since the original series is still under review, I sent the supplemental
> patch as a reply to it instead of starting a separate series with a
> dependency.
> Going forward, I will post such changes as a new series and clearly
> mention any dependencies.

If you want to add something to an existing series post a new version of
it.  It is not sustainable to manage a mess of interdependencies between
in flight serieses.

--hmGdR5RgUZctl1XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3VxAAKCRAv73Ows9A4
iZ2CAP46NBtxfL8hCUZOKrEQw42Agi0JhojneAcIGHLfbLMoNQEAjPbfv054xjHa
j4XKJRgXWFK4ZtAvOFovFUf9WZJWgQU=
=hmy3
-----END PGP SIGNATURE-----

--hmGdR5RgUZctl1XF--

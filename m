Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163194078E7;
	Wed, 16 Sep 2026 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586554; cv=none; b=bUm0qnDXipJPKHCz32P8zd9qy9dQOyjFnWm3ar+9QfZc7muOHqRy+UxPhaPkwDyFbijTdfPXFXyKWLwG7I4VPon/PmHHdThUjQnFVifzO81HskYUyF7Vz8C8MHW9a8ZVF8ZYhhmX8KWwW3YB0zRBaHv+gO6M4WqhkI/lV8fzSFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586554; c=relaxed/simple;
	bh=aw9bcFk1CGwHxQHSVYQyJSk9wJsd8IEc/8igbxwF3mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwQtZZbqKP2L9KSmFnVdj/TlV9wYo9JXOPyC1OR0fFfOjaK4AwvN2+o1NRIX7Fd2G10/HC6WuIEOLxR6ic4vgj74Gkhr4Qf7lWE7cDkgbwqA2srLxDSXbiOaLFluxaZClNCB+SGlCtP9ogPakoukDq5oashpUdU47ongKZDIzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDwIM3RG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDwIM3RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F9D1F000FF;
	Wed, 16 Sep 2026 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789586541;
	bh=nKpU+1ssjVEy6TjDj8VeyaecTSdOsRRuH3YMIIYRG/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDwIM3RGiCAfd+u6DxVdOtsvLnC+PGS2wvTBGr9dvGyKiqGxJDXY6el909LZoyWPk
	 9/1wSN+y2ZlZ20XxTHbbUTHJq/NyMDiWDlQvcutrxEn92vaX9FYYMwkRvUsoEoMSF0
	 S3ajsz1qIX/TctoazU/8mjZ8hnU3JbSNBbezd4rD+wYtnwuZjGx1UTHxfovmJWqMdm
	 6VSrQgWlu7r3iNKOLkgjRJBKMvYt1f3Gkbnv5lzWhk3K8MzMfwrJNS/h6mkWNvrsQp
	 JmObDI5Uuhf73hWgJgz1WbFb07v2PKyUkKwsUO0lWm19M5DcVQwYPCZ9fqe+pPK9wI
	 TUXO17X8Oj94Q==
Date: Wed, 16 Sep 2026 20:22:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/20] ASoC: es9356: Publish IRQ readiness after cache
 replay
Message-ID: <98b5911d-7188-43c8-9e03-e9b457a7d086@sirena.org.uk>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
 <20260828113416.47061-6-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1LqTgd6XqERg8KPt"
Content-Disposition: inline
In-Reply-To: <20260828113416.47061-6-pengpeng@iscas.ac.cn>
X-Cookie: I'm a Lisp variable -- bind me!


--1LqTgd6XqERg8KPt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 07:34:00PM +0800, Pengpeng Hou wrote:
> es9356_sdca_dev_resume() clears its disable_irq software gate before
> waiting for SoundWire initialization and before replaying the register
> cache.  If either operation fails, interrupt work can run against a
> device that did not finish resume.  The cache replay result itself is
> also ignored.

> +	if (!slave->unattach_request)
> +		scoped_guard(mutex, &es9356->disable_irq_lock)
> +			es9356->disable_irq =3D false;

This breaks the build:

/build/stage/linux/sound/soc/codecs/es9356.c: In function =E2=80=98es9356_s=
dca_dev_resume=E2=80=99:
/build/stage/linux/sound/soc/codecs/es9356.c:1124:12: error: suggest explic=
it braces to avoid ambiguous =E2=80=98else=E2=80=99 [-Werror=3Ddangling-els=
e]
 1124 |         if (!slave->unattach_request)
      |            ^
cc1: all warnings being treated as errors


--1LqTgd6XqERg8KPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqq7GgACgkQJNaLcl1U
h9AzMAf/UII23n4Q5NK0ddIdUGN/YyHwt5phHyaxv4oa6Jws5cFkmQ2IihOYk2DS
LXMOjudG/SNjC3kxIHgfaPdJjtoVwN95jZkmBi6wkHYFwgPTNx0PZtwpNNTsydwO
fcC1xeWbbIsWH/QybZXfksoAeEp5yt98XDt3/MI9UTCqpmOmT4Y1tGPp9TixcwYw
dK+Vb+G8i42whztr26pyceoKz/SGjavbwPSoRDAQsHTVVZT1Hfh+pjWsZRnkK25f
RAPKwtQj3Gk572updjC3jopZx+o4SlzTdyn3uLWiJi5xCK2iAxeE0oKowrTmXWQ3
2Qo7SWtXmWMfefHFFe7twfMtUMhWug==
=n7+X
-----END PGP SIGNATURE-----

--1LqTgd6XqERg8KPt--

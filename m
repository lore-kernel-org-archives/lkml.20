Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9636B06A;
	Fri, 25 Sep 2026 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345515; cv=none; b=Nsl+POIAjfGq3wi5HDIcvMto6lu4FfP4CDj+Ejboln34SZp4jdFSglEJ7Wy1gHA5yuNM+PaX6cFbzS35EuPYVS0wFfFGVmnS1EH+wPHkRP0thfCXXl8uM+nZ693y9TcvVUXIAkei5UbofNdywVKJ/o7KTguQASIhg/xNZYD4FXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345515; c=relaxed/simple;
	bh=E8dn6SLTYyIWIjVMJ9aKwzBBZnvw9oxDUJyHxcup7oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oy1ARHLuoW1+pOgqiAGjq+5GF7wA21wSud/yyONXmyBo8KREhCgt/SujIZI/1tPF8DheDiUIAgc+yX1508LvgqmRx4IdqABIj906MR+wK++7wuvNzdnqsBTPyHW7UnfU7sF6cvkEGsklqZFSu/vK79+XU6dARMhzFW+DHbN/5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7he75L+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7he75L+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04611F000FF;
	Fri, 25 Sep 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345514;
	bh=b87HLqwI9Nl47e4iwH0tlRksdJZuUIDb9rIeH9J/wvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a7he75L+J34X2q/P1zYgNP2Lk2qz8ND3yS4V6YTuP8zgGzvDEn0zQyivYB4FCdtyH
	 NPlISxSDmZMxepjKTolKti1sr6FNmAXy/VEyrYpE3ArgRxA0YiZCT4aNDpW474JSlI
	 Fnn3z8yEaU0gcc++hEJp69P2MPi47UzgzU7ntj83dv77zFXHK8voLYdHfIiJlF4KK0
	 S/RcOiA2tDRaXNX98BerorgqrRpPPP6ikwgdmytSz+fyPc1R5Xll3cK6faqRCTo3Zw
	 itIxvJId+SKJkSKYyakz4ZtA4sdkB+YzUSKE1gckInCDYOAP4M6qiKZuP2oQfv/mVx
	 qTF/gCG+VYziA==
Date: Fri, 25 Sep 2026 15:11:49 +0100
From: Mark Brown <broonie@kernel.org>
To: webgeek1234@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 4/6] ASoC: codecs: aw88166: remove fade in/out on
 start/stop
Message-ID: <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dCpCNHPvlLK6hdtm"
Content-Disposition: inline
In-Reply-To: <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com>
X-Cookie: Love America -- or give it back.


--dCpCNHPvlLK6hdtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 02:47:32AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This "feature" was copied from downstream, but it does not belong in
> the kernel at all. Remove it to simplify the driver.

Are you sure?  Some devices have really bad pop/click performance and
need ramps to mask the effects, we've got other drivers with soft ramps
in them.

--dCpCNHPvlLK6hdtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2gSUACgkQJNaLcl1U
h9CFgQf/eqrhYcdMomOMA1vlFBJe9CbEr818zhVRNzVxe+im6JDAluSsskjzuaZR
2EVQqXbnAH1QJQNyZoug3EbYWT6EX27r2+CMXWyGOjPsaqdzFmmVbABnACsLr2jp
hUnvGYPH4Iif197ERhN2HqCLw78W0rNKDYizxyU4YTsyZgsGCQWS3n3l/Sy7hHAd
PbPppk78XhAQE00v8RNiaNAiGjaxhSMZ3WX67O0kKgxeSYYEU45DM+KwACABM5xp
OGgLNJRE8B8FY0oEs/zG9PcKSGGM75svzHy3PvfUqIPqTpeMXJ+mw+uWnWKs803p
NKNUthgJSJUiADsWruBI4lwvpj3CxQ==
=ITS+
-----END PGP SIGNATURE-----

--dCpCNHPvlLK6hdtm--

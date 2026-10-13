Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78304F93A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905413; cv=none; b=rebsDQ0mjp68KFYepekgdqkDQqPgO6xkXqkDXC6mmzmh+9gYopZqNk5Mwuqh8oJuFc5PFUVmgbGnLEG5VT6M1w9nbY4epPA54orawqtWXY3GnL3RtwShYi6CM8m/UNDEAMHfVg21dPjlPKIC2VHshb0mRaVYCCRmUmt8TF4ZvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905413; c=relaxed/simple;
	bh=ZOPUCQMM8nkcHGWziwCpO3Y3wMiuUu4TgjhMNHQ4XaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHvBCtOba2vZTH3iLbItp1n8MkT4rWuEWfHTRnVXy9Yj1gsSjdHpB44dKKKWwWohFEQU0rhkhM8RflJwGV9NN1EVYoB/25k035T93Ndk0bLfXP+EU8ut2HYAQqLMPHp54ENm3uRJr1+MetphQRLyN+mz+8XOVeernY47cnONetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsWaM+4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsWaM+4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C721F000FF;
	Tue, 13 Oct 2026 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905412;
	bh=rAyS/1IzCRzhQpaDoMl4P3Lp0Bb3HZwrOWPnviM0hWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SsWaM+4hSp+Ys+cxgjxBS3ZayZIjvihMlYlrDPVMkAJS4Yylmz62GqcdCsD55ls5Z
	 uie2zdIzyo3GBEzfHW+jI8i9O3rpRIlXLRYSfImk3wAGCJfbicasbPriEZFHY50uzu
	 /CYqWCbgDQEpZF5weNvjew8iJNOvBmtklZfXU7PZFg+2EuiFdMeOvsXLjPSz/1B5Ct
	 g5XtkoOT8tTVmS6Ji9JlNqCKSUkxzxZ02P8WeigdN8PnA0Rbt7SjQd9C2OnSQHJwRc
	 MxcaUohUTggj68fnyPaWYiTRzfo4VzoHZ/0m6O45AGteKQ5lk4PsDpWjKphLn0JOe5
	 A0K8o3UtPSlJA==
Date: Tue, 13 Oct 2026 16:30:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Mingxuan Guo <gmx472@qq.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: cs_dsp: clear dsp->running on the
 cs_dsp_run() error path
Message-ID: <775ad338-0c87-44e8-937e-8c8408dcde5c@sirena.org.uk>
References: <tencent_B839C5A92D762B5717B9637A5CFA0841C608@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJCKWyzMQlEu4TzI"
Content-Disposition: inline
In-Reply-To: <tencent_B839C5A92D762B5717B9637A5CFA0841C608@qq.com>
X-Cookie: Some equipment shown is optional.


--sJCKWyzMQlEu4TzI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 06:23:58PM +0800, Mingxuan Guo wrote:
> cs_dsp_run() sets dsp->running = true once the core has been started, but
> the error path below it only stops and disables the core, leaving the flag
> set.  The first thing that can fail after that point is the post_run client
> hook, and it is reachable in mainline: wm_adsp registers
> wm_adsp_event_post_run(), which can fail in wm_adsp_buffer_init().

The patches in this series aren't threaded together and don't have a
cover latter which makes it hard for tools to work with them, you might
want to look at b4 to send the patches, especially it's web submission
endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--sJCKWyzMQlEu4TzI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOTn8ACgkQJNaLcl1U
h9Bgxgf/Tivc2rORB2SWKwCmH3Q9XKTDAtQ2QyXDaS6VE+jIO6IqBEk/a9F7C/TI
DBuYnMhSDmKN/wTftBcNjVdVoA5G1Q9sVXxjQoG7+QeTh2sefibqpP6Saw14R0FR
DTxxs4EeCE1cFupGFkxZ7VCWjwrHLpQ3oyfRa29/0TL10m/LrB5zClj2zLpfCPJ2
BHT8NB4Em0X1Gw7o/xYU9YxIhxzNL0yVnLueLwRIata/RXTyAe1hgFycc7DM0tnL
yXAnWqfbrb6FZkU4+Pk8uXIvU9sYz8Q2hli71P6h3arIsiUnGChuJ02A490b8kEK
1Cm37BM3UOw6ag+ENLgUfLtNiIUGoA==
=Jkro
-----END PGP SIGNATURE-----

--sJCKWyzMQlEu4TzI--

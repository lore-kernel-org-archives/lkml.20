Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437DE34752F;
	Mon,  7 Sep 2026 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781632; cv=none; b=Eaxg3NwN/JA7OeogSnRw9sUVX45xmeZG/yCv2R3TwI/JmNOi8EUwqKRP7q4Y+BOQsIJNXJxRX4gf7FdEDDTUxObQZbJTI35cPLX/kckl92al3YgW1f717Cg5mo3k9KdDl0rMItlwLpfJSoLuA8hJcRvkgs/iPnyvi2TT0JgjCnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781632; c=relaxed/simple;
	bh=kTHD8aXOkJPGWuhiRXf5vbRHcdX1+9ZccklSQKrZSNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG5TfyOvKLR3Kn9Rh7ytWBLq+Y+URNOCS2OveVpPMsUC/UUq9znnXkgXz/PYVD9X9watZ8vFzHzaqTvl66t++8lsEi9MugArXAA71Kw1cvOd72UMAfQihndrTJxMXgjeq2J4s8z8Ktx2IfxbZ+F86xY3ie0zi85sSXZYLJ81ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8gDzlxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8gDzlxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BF01F00A3A;
	Mon,  7 Sep 2026 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781631;
	bh=LNBJFrIZsAeWFxgWmTtDLoYL/yB9knk6yB5nM6P3GBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I8gDzlxBd1Fy+9lJod8z5J1uHaNQjRuCEjOAg3oHk2xqUZAkXhJENtN3g64364YZm
	 HoGo2FP/3/2GkAMmTif53WPY6yQ41X56IWa1L0ilE0XsKgUAC45sNGylTLhUBBtQxo
	 /upYgfmP1qRbyBXvlbU6oFJfKVve/PE5iI8MqpQKvCyD7H+vOH3JxeHl3rJDQ+9545
	 8Kwa4ht7JjIOmYKQpDuUvisfnOjML7xXY+r61nxAWcfXgt2l8DUoqDpfUgeBK7JWCh
	 xrY51N5HLfgpIFE7Bl1OIs8LJk+X2GMh6MdZsWJ97WIpmHyjLjwsz/FTVrCcIEH2k1
	 FjdxMV/2RXzXg==
Date: Mon, 7 Sep 2026 12:47:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <hppiscas@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Seven Lee <wtli@nuvoton.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ASoC: nau8821: stop resume when cache sync fails
Message-ID: <054a2f42-97b5-4ea8-ac63-449f593ba6a8@sirena.org.uk>
References: <20260906034321.86080-2-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N6qI5uOVmknfOxdx"
Content-Disposition: inline
In-Reply-To: <20260906034321.86080-2-hppiscas@163.com>
X-Cookie: Who's on first?


--N6qI5uOVmknfOxdx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 06, 2026 at 11:43:13AM +0800, Pengpeng Hou wrote:
> nau8821_resume() restores cached registers during component resume but
> ignores a regcache_sync() failure and continues with IRQ enablement.
> Those operations assume that the codec register state has already been
> restored.

Something seems up with your mail, neither this nor the other series you
posted at roughly the same time "ASoC: report additional component
restore failures" ended up threaded together.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--N6qI5uOVmknfOxdx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqepDYACgkQJNaLcl1U
h9CxIwf/X6UmbDIF8GHJnFJ8vXZv6U0kWdkATpbYNQ9PPJXzs4aOX951/lgv98Ju
8hQFI5x98IrbV7TGdd2fnuzE5xvKCZuEV6Zmjfkrs3XUT21rL1bTcD10/yhaqGtP
2E+nvj4XwpF9cQobTtAd5wMrCVRz+7ibksh/DXIn7XdTf00KJ60R1XipodRMomny
+9lTQrCUvRFqTNUQtL5KqX31m0x8Hwm8+kSxxFTZR3WqhxL+5p+OFbfUrdjO9I2M
Azzh8Q84Skipk+kxndHoYcj+xw+DzRMMZU0Wm5DjjDuP8P/jq6+GLwkeWrQDu6va
8IlVGD4M/cvkQPRxHAfvnhxkAcryVA==
=QfBs
-----END PGP SIGNATURE-----

--N6qI5uOVmknfOxdx--

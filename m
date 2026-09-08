Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BDC4CA793;
	Tue,  8 Sep 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867942; cv=none; b=gJb/690KEO+qZ2LBDcn3ZzsjHm74hxVdsibO+tmTC56Sg5T5pYFlTwprcsqsUklmifYy+icbmJMA0+M93Qmj5sRzPnBsdAxJ3WD0XPiC98DKHykv83i+7jnpIT67Mm4F0nRRZRUPMq17jT0ICMSkuJwuXN9ABEU5HpfcVg7pSOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867942; c=relaxed/simple;
	bh=zbg5FAD7smWEXvclYGRg2Ib/MOhFNpygakaqByFV7TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTRrcHTLJlQe1JQz0CMWd9+v/zK+JJK6GoZUNoLs3d+wuo98X45ep7YkoBKUQauu4OiHqdCapRfqlGQhNcGwtsco3oy2kHVxSmXgCKZQJnagWpSFtm9Zoi3EGbcHMA4Vc0kyTURSlkrRJtToNyV3VScpvFB+mYmfbJftpiBch/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVKeX786; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVKeX786"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1A21F00A3A;
	Tue,  8 Sep 2026 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867939;
	bh=wNhvu4CwgmmHs/WaZWmGUPPEylxpH6UVk4bULDjwx9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DVKeX786EFntBQ18ESlGxMRigDLcHuzhVPuHXlbA7doLZhEqN4kiJ2eEYGix2pT0H
	 zS3ILho8Tdk7nxRNUu8OlCRvBEROjLcybMbftBC4CNiDYFL0KCmKqUaaZFq5S+pLoP
	 qH0jL04YlYnvO8s4UH52JDwfKlZWHasDJ5BoGs7ldJCFwY2MWrnEJXgDvVoXBMCAnX
	 YE4tsrnDKn2gZomYwgSpFo4+WCkswAAQ9csiRsUxUHk1e7CN/5Riw+KzGTubOi6EZm
	 oVU7i9lgyMy73JR9aR7bNcKkV6WkQCIryZOCkPtHuFxweDjRDxUjfP8bavokzx8a+s
	 p47Jyn0XNyu0A==
Date: Tue, 8 Sep 2026 12:45:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <hppiscas@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Seven Lee <wtli@nuvoton.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ASoC: nau8821: stop resume when cache sync fails
Message-ID: <756f4726-4352-4640-b8a9-65d6bbb62a0a@sirena.org.uk>
References: <20260906034321.86080-2-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QdqdYgMdoNr0CCK3"
Content-Disposition: inline
In-Reply-To: <20260906034321.86080-2-hppiscas@163.com>
X-Cookie: The world is not octal despite DEC.


--QdqdYgMdoNr0CCK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 06, 2026 at 11:43:13AM +0800, Pengpeng Hou wrote:
> nau8821_resume() restores cached registers during component resume but
> ignores a regcache_sync() failure and continues with IRQ enablement.
> Those operations assume that the codec register state has already been
> restored.

>  	regcache_cache_only(nau8821->regmap, false);
> -	regcache_sync(nau8821->regmap);
> +	ret = regcache_sync(nau8821->regmap);
> +	if (ret)
> +		return ret;

This leaves the cache in write through mode which is probably going to
be a bad time.

--QdqdYgMdoNr0CCK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqf9V4ACgkQJNaLcl1U
h9C+4wf+JA2US4fhTz0lq7Nr7Hxb/BcmVuItrRKsq7mGO4xv2Nj5QYmtiBf8r3VR
xOQxBTSfIzjFENeyAPzNpuxCrtr29weNVS1mD/fnLHryzkIIOQ+1RXRW0MbzpobK
RtdCtQSP953QC/l8SF01VI6yFE9vL1XU90HFN19Xh6zHl5kxScblebEmNvDwV3ay
raipRLgrKjdcI8HcrNFJNWX18BvG4eGtlFZcuoEY7EG6g8JZPKA6Uh8B0lPA2QgN
pXghJjlSJBCQnl2JHGiFnWjQXGmYzqBcZ3t8G8aAg4AyFOCzcPnh2UjTAXPPDTl0
mHdZ95s040pDQ5SHTzD2VahZzUPcrw==
=Yyko
-----END PGP SIGNATURE-----

--QdqdYgMdoNr0CCK3--

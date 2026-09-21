Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B43B2FDF;
	Mon, 21 Sep 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985694; cv=none; b=kdvxFOICklGkC1pj5XiKcgIHfLUPFvPrLpBY8X+HGn4n6D5ew7Re4QOPC4bNuNr7A67QP8rtuaCdOMjc6F8PgS3GyaxKA8vins0VDN4n4AiNFvX5fEL5AIIkABSBifTFQNBWqBw1EqBUPHwD7IlzBikpPT7cZbvgBkZIJ66JrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985694; c=relaxed/simple;
	bh=Aqcq9aL88BNS0cECLzkTksUWHdYdimF8T4Db+anjypQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNiBl87do0MlNib5wF0pS2UAcNSfCpJyrLF5hrnwqckPPSp3SEPi+SSSuefCf8nO67I6A+fuB4I1W5uv2XpFem3CmuYfEwpB6/5pwZ99WAiKCRiLZ8u83TPgV3Y9ziOqB50ma+wjvBBWbAsiynzqfLkAJv8RgX05Vi9wXJBHbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8BpV7B7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8BpV7B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341BB1F000FF;
	Mon, 21 Sep 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985693;
	bh=Aqcq9aL88BNS0cECLzkTksUWHdYdimF8T4Db+anjypQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8BpV7B7EaLh0TRBdDEWhu1XlQA814ENsQgkEUZU6Fo4T6WiA/dznBTq+R1y00xn4
	 ljJFaQ656/qRmIpgMd6I0LfEq1Ho0m3pZdFh2QMWA7g15O7hqh4MRgaH7dRs/E36IZ
	 NpHcd8uOzpaJ1YJnUZ636VglI0i7TtWyjMUIsekqdyx7fcVIKTNgzinK4wd7VbTri3
	 cWvaMw0GlGmwKzZlEN9BaYHGegwDkCUTOdAR/QbH4zdAbEtJzcfph9Qugp/mi3h93r
	 tODcjhH/iRmFgA7nLDLBgWJeQa8LoTUkyCI9QXrXz/Pzx1vH7VjGpDXloLp9GK8hX3
	 gtCZ20wJFqxKQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2DC201AC52F5; Mon, 21 Sep 2026 11:14:49 +0100 (BST)
Date: Mon, 21 Sep 2026 12:14:49 +0200
From: Mark Brown <broonie@kernel.org>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"pin-hao.huang@hp.com" <pin-hao.huang@hp.com>,
	"Syed.SabaKareem@amd.com" <Syed.SabaKareem@amd.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5] ASoC: tas2783-sdw: add firmware
 download status check
Message-ID: <arEDmZ76qb3eLiwk@sirena.co.uk>
References: <20260921064053.932-1-baojun.xu@ti.com>
 <arDujlvvKixE6ifp@sirena.co.uk>
 <1c8da29a1fac4435a59783ab9fe7f68b@ti.com>
 <arD4k6hCZyqycYYW@sirena.co.uk>
 <4d1f121c8ac348dcbb16b554e4ed2b9c@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nnf9EGSfCSnJfaGN"
Content-Disposition: inline
In-Reply-To: <4d1f121c8ac348dcbb16b554e4ed2b9c@ti.com>
X-Cookie: Too clever is dumb.


--Nnf9EGSfCSnJfaGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2026 at 10:08:54AM +0000, Xu, Baojun wrote:

> Previously, a local variable tracked the AMP reset state to determine if a
> firmware download was required. However, we observed that the AMP resets
> during SoundWire bus stop/start sequences, causing the variable to become
> stale. To improve stability, the driver now directly reads the register
> value instead of relying on the cached variable.

It should just need an assignment to set the download flag when you
decide to skip?

> This version has been verified to work correctly on the current platform.

Are you sure there are no users with other systems who might be broken
by skipping the download?

--Nnf9EGSfCSnJfaGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxA5gACgkQJNaLcl1U
h9Ce+gf/Tk4xSnpcXTJeZWcbSj5JbxXk2JzDAwBUFxoiTU81EYI9M+1U8ZwMjKcE
Q+bohZFKf0g7MhxDTrLZMS5h8X5UeEwONHXf5nS+P6gEldpFol8rv3fY7pwKn6AD
NPV6+5w9gv98a17rIpXitX2odoC8/V6Cg4kEuVLqP5Wqbu96AbRVsk0/t7YfN9Cl
WpOHdRvfEVLF1I4qGvHZ2CdcmMPmV+m1PaHnMDI3wCzB+KGr99PGM0QYuz+ZQ8TI
ppbPKwc8MP7+r9BTbX/isjJf14MOOm5bZNNNFPQ2ElUfsHC8SmIEgOOHEQe6gZrU
seAHlha+5N5UQgDHcyZF+++pKGQU+Q==
=YwsF
-----END PGP SIGNATURE-----

--Nnf9EGSfCSnJfaGN--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49C39EF0C;
	Mon,  7 Sep 2026 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816408; cv=none; b=RHcwKrjQDe42BwhlOQJaLtTL0IG3V5pYKOoDIcXko6PxC7ZVS8wEPpgZIh9KPlr9mfBNS4MzyEdowTnfnfftbMB0BCylFLVZwB2R+Kj9bT1eZ5H7YskhftYhwmErgqL89HBG6tFslwRtoxpoR5NRQ716nRftrwQCmo3e/zHIwDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816408; c=relaxed/simple;
	bh=qxma2K6DKoFEVy/ut0woTLk7TkpNMnVQBtgJ+T5bxQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aodxPzSc3j1q5gGCjSz2Uqiyko7O/fyBGrjRgB1s+cNY56Z7Z+frxQvWeM61sKfPx+lygrcBk0xoY/ynWbgyVxphuYyw17mxFPYOZtaCR6KK3vlu9GPM08YDrQVRrQEmi0uZ4EkPtsJOa+X3f9LQj9Xbxo6i3odI7UY5tEErNjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaCJC7wm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaCJC7wm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8A1F00A3A;
	Mon,  7 Sep 2026 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788816407;
	bh=0Yesz9ak27Awy9F1+4UB5DYHc25JWpLLj+kYcrTZJWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KaCJC7wmACljfo/XuFGU2qrmvfdqj3RVjfbFZTt+sQmCUtxZf03KMk6tddtkhU9gR
	 Bx7RIYUCx1gLVbOw6EhSjWLuX3sd8OYEhHwgFChKjJaRInQGbwE5uWvMLu7UECobcG
	 v0+zSAAaPo9WjDOjMyI9k0i9aEfBsClfDrIAcK6r+yBpESgpW04gYR15t3PAzm4Kdz
	 m3RTOFyi1Z6zbtDPDtglX5sg8KkcacYr9FZ2LRSoxqnKRJfEpehdq0Fq/rh9ZBv5nF
	 3Ks7TkUFitZBjs91ULTuZtCEnRqNmnpMBpiu1TzqmYs5+3IBr5NOu7+BHFfv9SVuul
	 PWCDPfqNd6gOw==
Date: Mon, 7 Sep 2026 22:26:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <d17b7928-d2ce-4640-a704-9cba2910aa1f@sirena.org.uk>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrQNR57Kvrwt1iZs"
Content-Disposition: inline
In-Reply-To: <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
X-Cookie: Who's on first?


--lrQNR57Kvrwt1iZs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 09:47:42PM +0200, Pierre-Louis Bossart wrote:

> My take is that rather than encode all properties in C, it's probably
> worth exploring a DT representation of the concepts that *can* be used
> fairly easily and make the life of codec vendors easier - not as a
> literal translation of ACPI.

> Putting everything in C seems like a code management nightmare to me.

I think one of the issues they have here is that there's two cases that
need handling.  There's the case of DT native platforms where the vendor
can write a sensible DT, but there's also the case of platforms that are
ACPI native with ACPI that is basically unusable by Linux since it
relies very heavily on being supplimented by a platform specific driver
blob.  On those platforms there is little to no vendor support for
writing DT and you're stuck with some combination of reverse engineering
and reusing the ACPI data.

--lrQNR57Kvrwt1iZs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfLBAACgkQJNaLcl1U
h9CHXAf+JsNZcretzfv674Tfmsm6exRMwWLj+6jECAru0EGWV1q5+YJeeuEL2OO5
GrLPW5k7anE8aAzwBF53DUZD06LYt9/+SxwTmjaR8iMJjJ5qLSCI7K7AZP2jlp8t
4UMWSIxSZrmbmEI2kFsgLOVcprVcVOgm5A7WD/fk/4AoNYoREzdlRhg6FU/fcVGN
LTtq3qnUTNnoDM97Tdd48TrsJx64ZOvBi3W0DbwxscaszGFH2QFTgBXSSmv49Cdr
BCKsqiJ3WsQZIa7/pSkEM8oKldxrWGBfw7V+bymoJmwKgixAzCnN7AYwrxIh7xCS
UbBUKIuQNiOPLxLwC2E7cJ4RP6s4YQ==
=DfvH
-----END PGP SIGNATURE-----

--lrQNR57Kvrwt1iZs--

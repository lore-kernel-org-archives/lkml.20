Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7B4756C1;
	Thu, 27 Aug 2026 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848116; cv=none; b=ewLhbGnT6Q5MlQQvOd9iU4zRVYpiID6QNwe5cOnU9x3c5yAtrIgCe3Oq1r1WrJ3L+2kLojiihoUNucpwDbqNYrD2vJVij2bNsX+NqYMKaD1824BqP02HiI6CtuIkpnZfra1o6cq8vHk3Ru0v5//oP2f6zaPEFrdzHOEuc9Twlf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848116; c=relaxed/simple;
	bh=ebaBF7Wm57jhnHCdB2Tivrcc0WgePRhWe4w6HflJXUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKYDSLS1U5q4UU/u4qENuErJa9kdovNXpkh8Gm217qjEPaz//Wr+Y3pZ5pZQPS3UD9kt0B4xKOlovS/0pmQc7qbFMpXgRWBm9Wg7Xqd80uJEZEBy6EF5BU6I00fwC0hdLPxnY20nU6ENOdXK0LxsyEunVA/wFAitk4E7CiE0mo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il8vsbVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il8vsbVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA701F000E9;
	Thu, 27 Aug 2026 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787848115;
	bh=ebaBF7Wm57jhnHCdB2Tivrcc0WgePRhWe4w6HflJXUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=il8vsbVOCFUwes1trTtQUc+VPgHBNT8pQgbTC8TYPhIAsGILGCdk6BFKvKtouFF7w
	 0PPcJVg5Gtfpy5/z5OLyJm4e0mv6CKzd2VaBzIKnLXQSKgpgHrlFsfjGPqNFaiCQeH
	 uSVFdJ3k4Gk1OrESYOEx9lMTr5pPWqfhVFZd5dqCM2lB9C2vumY5EEuFN71EkbxGsI
	 samfySvYLnoD4SGk5eCruJsS7oPPKnK/AB1On85pcTaP/Wgw4pb8ZU0I9NBG+9Q6Nl
	 rf2zi7gzoJFdt2h8BnzEIFE8xLX9AhTb03u2FhNY+FTmul/19RTVJOTl22NmuMKNVp
	 i28zpeufjzvOw==
Date: Thu, 27 Aug 2026 17:28:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
Message-ID: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
 <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0wMx2L5PNJE4zS3t"
Content-Disposition: inline
In-Reply-To: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
X-Cookie: Alimony is the high cost of leaving.


--0wMx2L5PNJE4zS3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 02:58:04PM +0700, Bui Duc Phuc wrote:

> To be honest, after looking at the code for other MediaTek SoCs, I found quite
> a few logic issues and inconsistent clock handling. This, along with
> the git log history,
> makes me wonder whether these code paths were ever properly tested on
> real hardware.
> Therefore, I have stopped at mt8186 for now.

There's a lot of code there with shaky error handling; probably the
default case works but things blow up relatively easily on error.

--0wMx2L5PNJE4zS3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQZa0ACgkQJNaLcl1U
h9DUGwf+MCKXjmklPUUS4YqdH7aXXG4NE645E1C5lIakFBlUZ2EMKk7d0PfJyYJ8
1k50GnIm/Ud5wuZAvf5TWmKCRxtOHlOO3mK46E6jgJDVSEYu8D5G5hJGUoPuZDEF
A/V6u4gDYz+UbUiuNEGgcUJAAxcAY0n5vQzDvrZgv+PKaxGdOlTL5j1BzZtX+UlD
IDiuE6SkNZQ6MiSeAU/zyw5RLZES6NX3qliToDQnWYNcyWKUl8fdgVkAJWD75jAo
85rJGgqvAPd6kQg3qTf43+PgBovSgwE/oZg1EEyUZrEQpZ2r79S/cFZHfpFz/TV+
DRCLEIOXjwDCmSO5jYZOQXTCLRg4YA==
=UBIx
-----END PGP SIGNATURE-----

--0wMx2L5PNJE4zS3t--

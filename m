Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233858;
	b=KInwiFreJzMwEQN/tiPNgLavymWFzSBppvbXcZdlO9ZFWMEL4BXYqKQsgsQgCKcTrobh
	 pwDAEBkQ1C6Fs/FyirEA5vU1O7mswgWSeCruG45npfh4DaRLpHxLJHnxum7m0n82sesns
	 s2wNrOmz60rsXd1fRJxTes5utmLXTNFAXBHnO33zZSdPkVV14MaPFpfOtf51LvW/jauxk
	 /Lt8ccGCtqmpuB6R5HZJX5lkmsp1rKwy5JxqKxWHG052p+qHlJEm5VBCaZiFJhNcMcGsi
	 f+N6i4ClMTvALzbC6mcaIaVz5eRTehVF2kQazeKy8uahvgmyOGLyYfFYHakyXrktmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233858;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=1O27GI5E3DX5bMDDqqj8Am+AAxmU3JLmnxoA3a6RPwI=;
	b=18fO9TyOjcrdMymiyKjONzbOuktAtmLLf3dOg/8xoQ/DB9yrUvXMi8q9PP6VyaptOZkQ
	 gRNNj4jPnAqA6iC7rGor6xZP3rBdOOKXca/JSFAnMe25xC7+3ndWEML21LSytqYhuUZwL
	 69xh03On1dqhimAYl821pk5nOwXVpS3zUSo9EBiDd6D1bubmBTWpDFFwAfqDnln9S70aW
	 2A6ZaExw9XYb3BKMoEm4rUudaonOldvWCRWK3z6XIaeqZaiU9WgZnZy0YSQbyXq4WKpAi
	 ZHxO4YSTQZUf0SSLQKCL6H+cXBBvhDMHcRpDWGzpl4jRUfpzWnm3eEj2vwWETxAVIfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4QE43aK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B0606A31C;
	Mon,  9 Nov 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4QE43aK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AD61F0089F;
	Mon,  9 Nov 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233857;
	bh=1O27GI5E3DX5bMDDqqj8Am+AAxmU3JLmnxoA3a6RPwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y4QE43aKlrNKsnoau47OAW1asUD4eYhX/cDAw5fQzQp93yfgLB4djpuG65I2LGmzM
	 LnYfKrqCsIUPYpaLgCLRqPlQN/PzliibS1d18mcFBLZa2xpSM12EXLcXAU+nzumYr9
	 ON5blzPY8CSXQJYjlhvBa6EPBmX/hmzB/eUOlRFH1cbmdVhoR1MNigTbMlf7k6X9QM
	 VedH3e0CYDLTl1+fccYdWeAcwvphiLZn4jVe6lrnR1ArSLJfAhcTG9KPT2L7SLzvc7
	 XDWRUlO0ma7UOQy7FgBiO6J8DHq+gJODg90q3Vy6QVs0aG2v3br1epxiQTzKbmoLXr
	 ls+iGaQT5zPkw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id CDB662E9D5FE; Mon, 09 Nov 2026 14:17:33 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:17:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <9ad85e98-80e0-4320-b1b8-d8fc90270c8e@sirena.org.uk>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
 <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
 <179413707633.3630016.13654136728294242171.b4-review@b4>
 <avHCGt1WfQsP7qjy@opensource.cirrus.com>
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
	protocol="application/pgp-signature"; boundary="Zx7S6gwUPtaSkual"
Content-Disposition: inline
In-Reply-To: <avHCGt1WfQsP7qjy@opensource.cirrus.com>
X-Cookie: Whoever dies with the most toys wins.


--Zx7S6gwUPtaSkual
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 12:52:42PM +0000, Charles Keepax wrote:
> On Sun, Nov 08, 2026 at 11:24:36AM +0000, Mark Brown wrote:

> > The shifting would be broken if there were ever any 32 bit Soundwire
> > systems, and I guess we might get warnings on coverage builds.

> The minus one should cover us for up to 32-bit audio, although
> technically the soundwire spec does allow upto 64-bit audio.
> Pretty niche but I will add an if to skip things if the bit
> depth is too big probably better to be safe.

I was thinking of 32 bit audio on 32 bit systems.

--Zx7S6gwUPtaSkual
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHV+AAKCRAv73Ows9A4
iVK3AP4vTWtTi8j+r+wQxn9EPSTG+gOBFa++tUZ31hLJADAeRgEAzWFww8rqS6qo
WdidDr0pLgfSHyTsWSFvSxTc+pjI4QE=
=OCOX
-----END PGP SIGNATURE-----

--Zx7S6gwUPtaSkual--

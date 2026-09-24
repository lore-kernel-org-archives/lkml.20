Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65A3D953F;
	Thu, 24 Sep 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269406; cv=none; b=ZwpQPlfOnMEDGkIXw6h8M2EdbY7a56ywyi8H59x0aWvpnSWiYhseB/uS7hZyG5J9uKG/adN+/t8T+BLvNyh44s1sAAv4PPF7LpuxTuRPcqHmicZQl7iGo9hs65kC6yh8eZnaRw/6slAxp//HhTgFCknFwHkPKt66Yewfe4WJepI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269406; c=relaxed/simple;
	bh=GRYhMLA42NBei7YREWiLPxZRkNEQ5hzK4zvgTmWJl+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awQkGoyApD7whpL0x/Id7JEC26JkRp9km3VOvtSfTjkgd+IHaBpwyhQvJzJXAh6MztqSMGLCj7O5MsOR/4BCbIP3tDwq/elBVXEYGoG8vqFXkC+JivK7xl/gRH5+Y0romn3U1oW7vgiqTEuR1WG+nllmJJYYpVinZlhzn+WstJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8sPSa+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8sPSa+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA6A1F000FF;
	Thu, 24 Sep 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269405;
	bh=WUIXMGlF00n/an+XIpdJzwcraIyNlcy2fVXrbp/3+vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8sPSa+pp//4QY0n2InsviILwO2ANC2TmhgCzyKFTFL88X1OA1rd8piCZ75I9NYuf
	 fEC4gZaibZp2Mu+2cnaTVOycqGqUN+E9Ir2xIWEGVyYNu6SlG/wx/nOI6//uR1xuM4
	 SzEUnwUkjRl2qhzU1qZe9tmBaUl+HYwW3ds7tqxVGzCfdWyeX7dlIOsyUE70XAxjMu
	 a1FMvSAzwEYZrtkuHzbC+3WNlKr6kjS85sdATWW8JqrBJCfxxFOzOz+bs56EPWukLg
	 Caw4bVrWp2lhFZChfGOJzssdpZ7QUgtYQEDQOIS3Fyfy1xEhSduphAsxvK/HcrHISG
	 ZL+oTMyBJa+Ig==
Date: Thu, 24 Sep 2026 18:03:18 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH v5 0/5] ASoC: fsl_asrc/fsl_easrc: expose
 per-pair/context DAIs and fix DMA race
Message-ID: <744ce325-9d2e-45c7-b7d6-15ec7558dc83@sirena.org.uk>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thyvYpNwRTH7ReUZ"
Content-Disposition: inline
In-Reply-To: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
X-Cookie: What's so funny?


--thyvYpNwRTH7ReUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 11:34:23AM +0800, shengjiu.wang@oss.nxp.com wrote:

> Changes since v5:
> - rebase to latest master of linux-next

That's not a resend, a rebase is a new version.  This is all confusing
b4 badly, it's not picking up any of the reviews as being attached to
the v5 that already exist and doesn't even look at the new version since
it sees that it already has v5.  Can you please send a v6 with all the
reviews pulled in?

--thyvYpNwRTH7ReUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1V9UACgkQJNaLcl1U
h9BVcwf7BCet5mcdSMq0zC0cNsA9teLN9+P2zlswGHdgRRU40PVwEFizlbbS7wZl
DOt1x1P94upHDBxOIj1BQlE2NH0CCx1Ndmd+GoJ0iq+zvPD+6wWhehE1HJyf1odN
tHP8B7rCqkWXpKyWwPhWuQ7K6CjRo524433hqpLMfwEwIi4cRw2AIDPEJZEDxe4G
YVIw8Rs1M9mOcSeAW1AcEx6zW8ZRr9Fcsl1ZL4z5iOj7rBRVLjfy6AKbM+Xkekpf
3JcHWVENhCGh1J2m2PHfK3X4eKOJzRY/QJozB9KyoB75lQHUiYpC9msiJ+F4IN2J
2IKKSaDZ354mcPpf2uwWiGkUJN/bEw==
=1Dsv
-----END PGP SIGNATURE-----

--thyvYpNwRTH7ReUZ--

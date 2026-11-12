Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483032;
	b=WwuPET1/aki92mJ3ESHD76li902Cvna1fp3XLYj+463yBgYNk/s5mIumb39j30Qxz/TR
	 IdQc/+eiakNO5rfJykq69bZNq3SzI4l8uImJk3P9DqmuNysjKW9uBeodLDjQZvaiwwD8l
	 9yz4b6lmpDF+Des1+lseUeqeM32TvfUXtBqSDYm29bcUmAxGj7ftmEj6TzTb5GoNkF5iY
	 7/WjFi8N7xlt92sFkcQ8K8gIcWbWTax2paFYK1Yb3nhnmy1mX9wm/sfFb0AWH549EIIDr
	 teVOXHqXdsF8r7vwJzQDPj+3ffmItp390GtCR0AIFvBk+6eDVmh/zawTKJCggSKoTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483032;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=F6gU4BmozjxaE/QerEOJXFIss7OYqEoODtcrPRAZu7E=;
	b=roCznfstnrPzlylqnA5LG93HbgSwNmN+70Jzc8j6/E0BdzFhIpEYeqI8DpMzT+cw8H1s
	 dVZwJdEtCO1ty/r075AIloDybTUvA4HjZdqgV56TBvtKlJ+ODswJzzS+CvBWPJfb0UxfG
	 wt0iej1CJdsbXWnqskDZRtLryWPIbbeWwiLBs4N0ciTIQp5U7b6NvLijL7oo5kE3BCezY
	 RWLZR0MJgPV3L2Kk+tNGkifZQToyAHUixumP85atJ+mlFubn00FOok+NjVPV96+IUW+QN
	 LlY2QvJF8yWI3tEqVbzUdks6Ag03VSV+KdK1YuLY4s+fX/P+qPGN8K0ChugMFotAkOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ekj3YAJe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC09606A88F;
	Thu, 12 Nov 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ekj3YAJe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028221F00A05;
	Thu, 12 Nov 2026 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483032;
	bh=F6gU4BmozjxaE/QerEOJXFIss7OYqEoODtcrPRAZu7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ekj3YAJea3A+Hvwb14NKlDrVFiwuBOCv13IuASTSE91SXXW4eg3AUjZGTaUk5hZ1D
	 3+J7D8LLu3cLnNWZu42bWDWF38N72zRMSsrywFgVgpqKGVdTNJF0ktCGSHjaJV0tp/
	 H08GqrrCmlHSLDNxyiB0iulZrp1RVg1/4GoidyEXvVeEWy5iOrCmbgEDupnVqBupOf
	 lHU+tyB+qIjFA1JIxkkS6ayf7f0mukcfISHR1EebBHamuEPJS1vMGxo2rUfOe+dzJj
	 MbfYoFCg5YUCY8hUJeeG1kjENRN1Iqi4LiP1dzfC7u1N3j4yDH63RYTadqcC7p1hLk
	 ZnWx3y1BDip4w==
Date: Thu, 12 Nov 2026 11:30:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] ASoC: fsl_asrc/fsl_easrc: fix memory safety issues
Message-ID: <df98e456-5f70-4b3a-8881-a4c1e7440632@sirena.org.uk>
References: <20261112100105.123845-1-stefan.ghetu@nxp.com>
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
	protocol="application/pgp-signature"; boundary="0/NDbg2oErjx5qhd"
Content-Disposition: inline
In-Reply-To: <20261112100105.123845-1-stefan.ghetu@nxp.com>
X-Cookie: Baby On Board.


--0/NDbg2oErjx5qhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 12:01:00PM +0200, Stefan Ghetu wrote:
> This series fixes memory safety issues in the ASRC and EASRC drivers
> that can be triggered by a user with access to their PCM or compress
> devices:

I've got this cover letter but no patches...

--0/NDbg2oErjx5qhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1o1IACgkQJNaLcl1U
h9Aiogf/TPF5sHgdyas9ArjKL8tzkEJQmNb6PSOVQQkcP4LverwE7sJK2nYaWjiI
hexouqrJ3voghfk8Sg87fXw9OJq9Q2YJ3GjRg8HRi+zHQFGr3ZREHmC77DkWvtIm
04/mt2TiP1Aa8QJxX7HZZyH3y5CHYe6TdycteZZLphOVoyazmbZcmZAS2fvHaU8f
cOpigk8ufTq/m6c7yRLvDPKeQ3DPcBj0YVb8weyzI/J0pklVyAB3aVnaxaihSKWo
PaKz2YgEgSZlnM8oqaMIG/lCUNth9W4gu8P1p4fu4syFIBdKN2INVMaYq4nvNmie
H5vcCQMupSJuyhQAKSVJ42oIiHeNug==
=/WPG
-----END PGP SIGNATURE-----

--0/NDbg2oErjx5qhd--

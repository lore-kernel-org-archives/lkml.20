Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310A47F3AB;
	Sun,  4 Oct 2026 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143399; cv=none; b=KI+vMtCohzz9rQQHbCnpLQZjl37EgYQ9tv1Db4UZ2ess/0Ep/05teQu6ny97JTsOOV2W+ViidZvohQX7LuGBvDU+RLzxOpAD3IVtktq/c11nrvtlELokqH52UCdKG6aOU+Xu8EaWYcwyYOHKvJzk5xixhg7ZXCnU0luTVKJzYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143399; c=relaxed/simple;
	bh=ntbPkT4EqCxvqtHkvepVVOb3JwKYpe93pfFyZZavkLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMpdm1DpjeMB7Buwuw0wsQDRMqmVbsXb2ed36scbqVwCFYRjNAaVz4rTHAt58Vqn0M5g8ftF6x+1k7vhg6d1nSzoMxl4pMGJS0JUklyA3MV/tG+J26fuupXR9iPXrsdne/b0XmYJFwoxq0xQXSWn6KMRMuCeIBy/MfZkDtqLjGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTYpig44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTYpig44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2591F000FF;
	Sun,  4 Oct 2026 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791143398;
	bh=fHpsQQE9UqZSe0QhSH0h9jwrnaiFKyY1RtBFt2yz6ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTYpig44CmD7J9NXSJw7/SMbL4VMMNy1Kuiwyuem7nGHuWilQPmQs3gdbb2cAvSnf
	 AAr36sjLMyEyYgjYzSZY8KDE6HSqGa9ON/z4OZ0OqWe7cRcV6EbSBWcfuTaGPMMzrm
	 S6hRKq9dBrLlHWQhigsLakpjfDJH80lxfym05GPY97ojB0DuHu0LGHnhD+Ht1fzPss
	 0rqZ1zytuqIVL3XeIh6v983CHqleeN6zYyXgiC8+6C1Xw8J1ZLhNrsVda2K5DtsIjU
	 CAnYDHg8ouApvJoC4UNFg1+hnktA8YXkjkIbu2aYmLdAw8zj1DP7XSv57BS7lnMLYI
	 neMDQ4BWUl9Mw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3E52E15057AB; Sun, 04 Oct 2026 20:49:55 +0100 (BST)
Date: Sun, 4 Oct 2026 21:49:55 +0200
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error
 handling
Message-ID: <asKt42FgsbhSbQUP@sirena.org.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zpsLVCv47P2G2sR/"
Content-Disposition: inline
In-Reply-To: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Cookie: Use the Force, Luke.


--zpsLVCv47P2G2sR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 11:49:00AM +0700, phucduc.bui@gmail.com wrote:

> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> +	if (ret)
> +		goto err_fe_shutdow;

This will return 1 if a new constraint is installed which is not a
failure.

--zpsLVCv47P2G2sR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrCrd4ACgkQJNaLcl1U
h9Cm2Af6A4vUdvyN1uEnYTiYxlbgJWEz7e8VfvjDWGTzpY+Wl1WIHmqvqpNtzg/v
zQ7LubxbjautsYjHrxroDG92AAcrpooqmg+Xn8wVbCvHcEolPxtKfs0DNdcHl3Fl
OaKCC49hoLS90R/ZjmzF73ir0qc4v+cj64qqdRcr+Qv72vamZJhalrvRXVulKQmy
2TSgnR+poBZ8mf7vg5xN26s7jFf1plURkdtTMa25dfib1BJhhvI3ZlG94imEAcmk
evboxK/bNhL46fp+doSCqOHlWCQOIj/Chv2wwSqgz9sSS8B7q3YC6HlMMYwtKhYO
H11o2NTntzyGzv7YONxUC+31iB3alg==
=GJcp
-----END PGP SIGNATURE-----

--zpsLVCv47P2G2sR/--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272765;
	b=BVujwD9TQIlZg6kKqNfH/JSKQVzo9KQ1AR8my72QNa+jOFwjwrCzg5oGoSHSkIcB9W2Q
	 8+bHnRXYY4LW8Aq1afRxujrmQUD6jdNmx8EFWn2t6d4K7h+CU/rcj9fchjRCHLTdiHiz1
	 TEQBHZcNlcRT62xCdWYVZlqGLC5jNUhYH3rn9qA1OmaiJEbWeFjzjPVA1Tw7+UfhPWoA8
	 xNIBx/dWhdmSRKXOAX1+TFNYOgxo163v0UOPkkv45jFBN1bic7xnML3zbZA7x3aLrAqt1
	 Lw9Tfi+hnLsfTXfuwOM3dbL5x735K9rbjm1yANGRezLbJU8lQ88pW2zoLpjQ2WLID0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272765;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ASuFeZWVFqNm4w6NaGQHXdSU0AoN18nCC/XV68nOE20=;
	b=EZz3cIPDxlDrdW3gznFdLtbXWT6irI5LEfUezfj9nGUSmZ6XP1xNKhobvyryJiFhojG9
	 /iczgAUh3QwJ5GD8zmBp9zUmlEI/z99km5p1IN9ug1adPIamWowgfXWUxjmBzhS0k391Z
	 4qDAxwkZvdSWGFQPKU8ws7VJExMOxvXOwCnT51fCw4i+4y8vRFc1w8EdYpKtzdFpvlIKZ
	 YsWEUwiH9G6TsXfMM+sYiX6okdhhRNnshY2r5hGR8KpO8uYPaPL0sStlwclrFm3aDUrel
	 DTyxdqvkMpj166THT98ERlO4+cXQNYSxoKT8vpIT67ZupUPLP+OYlNiimdmpa3985zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8gzRHkO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0355606A326;
	Thu, 29 Oct 2026 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8gzRHkO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1832B1F01829;
	Thu, 29 Oct 2026 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793272764;
	bh=ASuFeZWVFqNm4w6NaGQHXdSU0AoN18nCC/XV68nOE20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8gzRHkOhKzR4aVyxR8qR4c0FZZ3SNynYwNATS9kRpbQE6N2suBfX9oN1nAuVUv37
	 Pf+otQrO0R67o/Nl/+UhYo+ojmdWoKgbNf28LoDuqJSnwDDKF0WKBkTVdDhnPrhFqk
	 mdldAYSXmivhvJos1KnLHDmY1SlWWdrTjh4On8obXGDwjiT3Wb3TEbY+zhkD/DDRn8
	 d33wEnci9zkApnCj2pJ19pnkIApgs1Ii0R2wJpzXIAlugV21hNM5PijBscyYDtQO7g
	 RFWiYqm1iar55dL4l8TLzlKSyZQC3bWoSfVf+hhYPjCN64CHjcmvih4idah107eac4
	 ofkFA44DUgxnA==
Date: Thu, 29 Oct 2026 11:19:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: aw88399: move library exports to
 SND_SOC_AW88399_LIB namespace
Message-ID: <8c7ab5d9-8815-4c86-970d-0639e9befe49@sirena.org.uk>
References: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
 <SN6PR19MB2303BF7F0C1B1BE767351D98FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="qpNotaX25K1MpkcZ"
Content-Disposition: inline
In-Reply-To: <SN6PR19MB2303BF7F0C1B1BE767351D98FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Cookie: I have a TINY BOWL in my HEAD


--qpNotaX25K1MpkcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 29, 2026 at 11:51:59AM +0100, Marco Giunta wrote:
> Replace every EXPORT_SYMBOL_GPL(x) in aw88399-lib.c with
> EXPORT_SYMBOL_NS_GPL(x, "SND_SOC_AW88399_LIB"), and add the corresponding
> MODULE_IMPORT_NS("SND_SOC_AW88399_LIB") metadata to the ASoC and HDA
> users of the library (aw88399.c, aw88399_hda.c, aw88399_hda_i2c.c).

Acked-by: Mark Brown <broonie@kernel.org>

--qpNotaX25K1MpkcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjK7cACgkQJNaLcl1U
h9CEegf+MJJGwkXb0geRGMHD+L7CENIs5LTQcMt578+OVAvsoR2PGvIdu2yRtk1m
Phlm4/iGZ3P6UI46GwSfbeT1SKItcstOZG6CFoJmcu3RaZ2/H2Bm/Ph5CjwIl0Zd
CDYGAG+MkEV53tPEv3iJNL3nrOzbIlsD5FlJuO16Hou80kqEXLYGkxkGK5GV5HcQ
d2bf/pTVD4nQu853wCXgcbIISPr/IqMP9DIf0W6NHUq4kMDyNVesDUGgukvJ6bUv
+SjuYF4Eh52ozbKLM5zJMhu9Fx/kzjP2A8sMG5cu+peyPa97ZRLmR8PS8U9MPWBD
UTzoB9+aKEMkU1PomPy95ixNXQDzQA==
=m3hH
-----END PGP SIGNATURE-----

--qpNotaX25K1MpkcZ--

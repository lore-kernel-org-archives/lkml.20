Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580214;
	b=O0hgfZ4Yxa/U+5d/cabsDPlkU/dyarUaUL1K34ka0hpGw3fzKOKAgsC7VJXJ6QYs9oUs
	 5sKsS5TLd22yyjaSv6MjZ32U5YzFemI0mvoaFuKrZ9i49Sqru1T/Z0BfKlzaf7uNO8WoA
	 029ujEJsXievFff+NUy5ZaBj4H8mkQJWogoX5yHYhmZYJThOZeGWtI/4wypL40Vn1rgk6
	 zp4TuBM7qJgpjjbhPBa6rHF0chrpkKfUblqCqFaOi7mH4z+PQnmSbkWJuYGPdwLGE6/A+
	 Z4qB33p7L3nEfQdWU7+QihxpM2m6J+xns6nxJ0CEfulYbtwW7ecgvsJ/ZxIoIMJJhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580214;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=w+ZMz+0ZOLFd15UIkbPxgflKYrBfk4WG/gSqKlvjSNc=;
	b=jzVr8+KhPD7xrDRHoQAzbKCLuQVcCheVtCb5/4NJSr+rR2TNqdZWTSP4O0FArPxCpF7U
	 vDiZswPzJ8J5GMDQpCNo5P3+pwd3WX7ry22kG1V7MBrZnu9infhxj1Pk0O2C4Aj+Szqz5
	 B27If9g0G9A3gWISaGoqTLTIUDmovxJHzpBsKEhFpUS9NNbKuh4glN0CepRGgdv/3xjF3
	 P9WAmMO36eXFhU/QFB+5ZthLH4hcGt/aK0lUX63wAHXcnTjcS8Jvg0VdBSOBB1y8YiYgn
	 g7bevhjwNzTdgW1i5QOHhbVjeYMv0+mZAffzWBdrB12KkGDNTH3m5rAVSVWsjvHatzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pc/D79pF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8A606A324;
	Mon,  2 Nov 2026 00:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc/D79pF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4941F000C1;
	Mon,  2 Nov 2026 00:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793580214;
	bh=w+ZMz+0ZOLFd15UIkbPxgflKYrBfk4WG/gSqKlvjSNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pc/D79pFMkIc3SbVZ3hnC4PQIwqC9o3dmTvC3bMe5aGYYf19z45JHUQKLMJKtHN3s
	 CnXX8E9/04UrFDCy+NbLH1KyTOFkrLLRbtLlgIsO54S/PE3Im1ZBZ2KFRJxQF+Wb4Z
	 8uhFxL1sKyVie5miQsPk1gxsCYt6f7UvcSOFD6JdzZJ/UuAWBDQPtuoFsDhdZxIF1p
	 FNjGP7JD5vPKoRvDngWfWWWjs7xroD6zNGoFNc3AzCwyJBrmCXl+xGjDgWBVdCflhN
	 +y2HHeV3Jvxf1HHFzKZGqrJDCRtw6E2GokpYFfLCvOG0l64srissTNdbZSV7U11Pz4
	 ElYO4Eeop1C+Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 24D1D2259609; Mon, 02 Nov 2026 00:43:32 +0000 (GMT)
Date: Mon, 2 Nov 2026 00:43:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before
 freeing its DMA buffers
Message-ID: <@sirena.org.uk>
References: <20261028144446.992948-1-sashal@kernel.org>
 <179357405490.1679716.7958054921741157139.b4-review@b4>
 <aufaFu3THHiUf_t3@laps>
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
	protocol="application/pgp-signature"; boundary="RafgBh24Cq3zZ4Sq"
Content-Disposition: inline
In-Reply-To: <aufaFu3THHiUf_t3@laps>
X-Cookie: Whoever dies with the most toys wins.


--RafgBh24Cq3zZ4Sq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 01, 2026 at 07:32:22PM -0500, Sasha Levin wrote:

> > This doesn't apply against current code, please check and resend.

> Just to confirm, I see this in Linus's tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11ae63bd9030349a0136fb2edd1622a4a029edc8 .

Ah, that'll be why!  My workflow with b4 sometimes doesn't fully clear
out done patches.

--RafgBh24Cq3zZ4Sq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaufcswAKCRAv73Ows9A4
ifaaAP9tFksDsJOQ7U+bbrDXszTjksyUxLPvQ2P8urSTYN2PHwD+O6+7/u4sFikh
9MnddvYTMSTRaZKD3s18TNX8c6EEzAI=
=LtF0
-----END PGP SIGNATURE-----

--RafgBh24Cq3zZ4Sq--

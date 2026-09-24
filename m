Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7053368AC;
	Thu, 24 Sep 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259117; cv=none; b=jSnYicQRZyPLnczsY6uNh8MP9MMDKOibB8qGHQHmZLJuqFf7naz2/o4CKjy22IRfpVaLyJtdMqu5FDVvMxsS2Cb+je9uiSwXPPwAiUriq7+saMedasn38hfBcVTSxj56e1qxLKA9hGhfkk6KBwJtgBGbq30KWar6mIWygaV1Xow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259117; c=relaxed/simple;
	bh=o11sQqOBhBiL7dUkdkqcVrszuECeWz6pF1gt5PO+MCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIQq7qfox8/aSo75pqOHECKDHRiG1s68qHS4TiqEC/ppFrKRIevYZ5cmn88mmkBAnBuRmD3IgiPqrZEu/w0Tx46JQjC1HrJoUcyFetWwZ7p7mZoZgbhnq6BKtxsSRO0OfAMwc6+81oFahLMpnoxTpAeGVtS1qjX5JY9hi1GPUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYzWjwiM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYzWjwiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F037C1F000FF;
	Thu, 24 Sep 2026 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259115;
	bh=o11sQqOBhBiL7dUkdkqcVrszuECeWz6pF1gt5PO+MCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MYzWjwiM6ns0FIDA+MSL2s2S3D0Tvj55Zcr/R/MQEOg/N8QM9k7QcJ+tuQLn8SE/s
	 c+ghYmfNlzCmyotoLaQqvgBl+lhtHCKy7kzvxnz1kvzL7G75ycvPAfur4/8ofzTuty
	 eUgbS7i7uxEplZ7nrhjKoZ9WHUm6Mp92R+YgmNocUsIkrH2hKnwaaCHrCkE9vcZccc
	 FeYJyiJH0e33aV0eEwiJwPz4MhXvlxSrnvdkAwrOLqshpqJ6DWIyB1VBRTFYLAB9dH
	 yk+YciKx6/awdq/EqKE8o0fYl4XiyRie9OC7aDGTQ4RrlpT/u19KUaTBLYLC6LjoV6
	 GX51/FzyjwbzQ==
Date: Thu, 24 Sep 2026 15:11:44 +0100
From: Mark Brown <broonie@kernel.org>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/8] Speakers for Pixel 3 / 3 XL
Message-ID: <d4816505-c2fd-4afc-8126-76843db674e7@sirena.org.uk>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8anuQy708O3pqY7"
Content-Disposition: inline
In-Reply-To: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
X-Cookie: Oh, so there you are!


--w8anuQy708O3pqY7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 03:24:05PM +0200, David Heidelberg via B4 Relay wrote:
> This series address:

> Changes in v4:
> - Rebase on top of d4d1619ebd55 ("ASoC: codecs: cs35l*: use .auto_selectable_formats") (Mark)

That's not what your b4 metadata claims:

> ---
> base-commit: 3d7783543c2646af69ad65825e810060494bea21
> change-id: 20260613-pixel3-audio-bdbfb49e8037

That's yesterday's -next and while this does now apply against that it
doesn't apply against my tree since you've also included DT changes :/

--w8anuQy708O3pqY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1L58ACgkQJNaLcl1U
h9ApTAf+Ns0DY9DchBrhJ9y5Y0/JbfVKnlVBjgF/g2HhqfSpUcAW/AlQc8P9iddN
OlScBUNHIWAjqaoYzll5Q57vLoBgyIa0A3/cZxP+EhTrohgFDjvq4zb0AvtP2Kqm
A2NdKRcHSAzTySkpi48EHziWGgZ7iMvjb/UkjitH2PGfTJwe730ALkGKbRrqWiZ4
fAgY5OEgZFA8AaRupOzFwMRCnjU5ikwAqCN0lYmj+hdwBTsutUx6EzsWh9tGIKON
9byD16LMNRGi31xa44L6uMevGch5Qh1dmCVC8OJijPeS1ts9l6j4xFXr4KTwgdGQ
0MA5Jg0oHqmR+99PY36xkkUGSc8jKg==
=ceyn
-----END PGP SIGNATURE-----

--w8anuQy708O3pqY7--

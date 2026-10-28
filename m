Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191153;
	b=i2chbetxPDamkEfUEGC/OIT+Ns2g+0cqGivqyRfeWCu5Hqjnj2wVpeJrJkQYRHdnkXun
	 lxjjYRTRyfWlgE5cQfNjEaaJ6LlwpP/6nAQazlnW7PUxLgKvI3qtpIOz9G1Tin3pk/HfR
	 QMR5zMgcyRSiz3q3trHj9w5j8DgOq+BQksEzbO2cCyuWJmfBb2rINUuyDVJsI7uFNHP2q
	 oezzdIgawfj22rWFX1vUPzsz+gA3NDTqwseFA7xZRwMOV/pj4SE3IpzVCtUfc/L1us3EU
	 gw/X4t+qRWXPaAbtcCRox447UXBFVp41rNCBkfUnb9R7AO+y/md6KCqjoGgbHviuEMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191153;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=SnuPMpXeFKNMQBI6zSkkhEmINJ/VnpZ0efl1Za4Hl0E=;
	b=C98JEqqMZIJORmyDtw+u5x15VlyTBA5Pc15xGEw3Up2WJiJFxkS+h+Ijhbob4Qt6fEpZ
	 WRMD+FBmHXvf+SUSSv2hzVjriqeHaEl5eUK1xaNojxVTOV3gPErQOczASsB8uaH8QKFnG
	 t7BHeHllQhzDhuIREVegLUrHyNwQSWDUB8E0ADk91t2vHk9s9wu7vX4zTVyfSbt4ULj6d
	 kwJ87dYG0lx20HEkZ43bMylgAMFIq1i2BElN56hAJgGL47zeZmfj9HkjlW+3d81bvfP1b
	 e9iOmhTBoZhs811mfpWZ8Jv5pKfHyrf8gYOZ9r3T2w7I0Gj5eFmDnuxeaXcBouLYn3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrhBghLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493A9606A31A;
	Wed, 28 Oct 2026 12:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrhBghLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F181F01825;
	Wed, 28 Oct 2026 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191152;
	bh=SnuPMpXeFKNMQBI6zSkkhEmINJ/VnpZ0efl1Za4Hl0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrhBghLxUmn96e6VTk0lcb4XVPMJKdnvwLq137+1rM8He5pUSvQsFY28xhBnn4mPH
	 XQK8L6pQ2ErIALjXJ+YnllfxpDhPdoZ1dwEaAfkRue9wU19xYguFI5ffwGu6ZuDepn
	 inxmhovgR+ryuqLETKoa+/EbQBVqmuEAjAsHSv45ICKEZRdOr3zbXbnlWjweigbMNb
	 KzRaUvGjXbnT6ynzrKKZYbsgf6uXcuL5OHLJ5QyfpjX2+diXOMuNDc+nf7b2KJqXiY
	 iDeq36mKzuc0vTRyYsSJKiMNXaP8dWc/5pRdGE5a4s98ImEFfcHZNaV0NxkYOvSU+o
	 iAgpMHt+3AqAA==
Date: Wed, 28 Oct 2026 12:39:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
Message-ID: <4321c89d-ac6f-4490-93ae-a016de029b11@sirena.org.uk>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="/PB2jDfIdAIGekRM"
Content-Disposition: inline
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Pushing 30 is exercise enough.


--/PB2jDfIdAIGekRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2026 at 06:14:10PM +0100, Srinivas Kandagatla wrote:

> Based on next-20261022 with the "ASoC: qcom: AudioReach and WSA88xx
> fixes" series applied.

Please resend this once it applies directly against my tree.

--/PB2jDfIdAIGekRM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh7OoACgkQJNaLcl1U
h9AM6Af9HGzFtg+GoONE27yiqqBPgCHuQiLwygYb96fbz9TF7kRS6bpLfk85p3Bv
CDg8dgfT+pgpMehQEpEXwe0kA7HRzTVwap/xIvIm+sruqXeTUMih/Lb0E4MgbRYm
pPDqcGT+QqJbwDaQAhItng/XavQqkR2K6z46KwulFaCgdlMfSTNkeuL1LDP9LPte
rP5xmiGGHm3uAK/dvOZGcCiBk4WuxFR/pyGRCSvW60VwD2MZPZqBZM+5bu5KFzzT
yeM3NIIIvbA1buT3/MAKwG8Utgcbis/ISRZw9a/ygyhxQfW3vn/Q1Aw9k0nPCwId
Qm5uIy/IAktp6ho9BgR6dnl/RiH2Ww==
=dNE6
-----END PGP SIGNATURE-----

--/PB2jDfIdAIGekRM--

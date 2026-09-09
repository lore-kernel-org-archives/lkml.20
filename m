Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236455616BA;
	Wed,  9 Sep 2026 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957606; cv=none; b=oNYaHCn+lEfNfhynnAnxSCEXV8EbO/bgSnCmILuPHKiDX39ORzSmcVRYa8i+4wQyL2Af9t3Q+5EAJcTWKrWZNmrp7O/rLUIU14gqE2Emx/yTIns5/UUBdYrpbKefWd4YY+tezUfUkYQD9Aau04Hrkssm9CkbFHu+Ah5MSwrbRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957606; c=relaxed/simple;
	bh=rzyzFF/egNeoTA0lLW4/7+ojF6gPF/K6f+CJs/CE/Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+gYOLfTFA855stak22mTuG3p7KteYy9SMJY/Dl8uAjShc5NCXLKh+7yOc0VzRU5GDq7oFdjp9oaFXavxQAV2z6/QLNveYD04gj0X9od7JH5exAzU/zO/pDbFHkRezsuxHpiowj+eMF+01zb/oJ9EhBrtg9LxivlgnN0mazixBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPQyHc9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPQyHc9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F39F1F00A3D;
	Wed,  9 Sep 2026 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957603;
	bh=rzyzFF/egNeoTA0lLW4/7+ojF6gPF/K6f+CJs/CE/Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IPQyHc9seTDs2NcAoYtb6S2prJ55DV+nOuHUgF3rQQpiVD6iMXsPgn/SJPguM8Yvo
	 +IxFolo/8dPhmlwlWaDApPBcaqQpcMH5In9zaUNXS7mi8Fs1+BtE028tAeZDcvulK+
	 eYmSXHcZJtXqoenssGNapjacoD9LQ8BPOtzGXMNzpvziOu3M6+thzxryXUT5SISrCf
	 r+Eci1IbootQqql6P0xxhvYg1/5oWUl0lDccVmPc5Kp9DsOpNm3rV7G7kwchCbnjUX
	 d5ydPNmmXz0Gq1Ed0SQG55yW5eNVHU/HnUn0fEBn8MI7NkYjXI5IpukrFcJIB99b7d
	 OUZPsBq1n1+pA==
Date: Wed, 9 Sep 2026 13:39:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
 <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iNcWc1qW2FmqJovm"
Content-Disposition: inline
In-Reply-To: <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
X-Cookie: Postage will be paid by addressee.


--iNcWc1qW2FmqJovm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 06:06:41PM +0530, Mohammad Rafi Shaik wrote:

> Although audio functionality working fine without this delay in my testing,
> I seem to have overlooked this requirement.

These sort of sleep after reset requirements often end up getting
implemented naturally due to other things that are going on and then
issues crop up later.

--iNcWc1qW2FmqJovm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhU5wACgkQJNaLcl1U
h9DcEQf+LQUJZGMM67kl6psUekADa5zy0YG2GGthWHRoIkKccbLCqkp+F5E99Nuu
/Lov0VrUF1PQ05b6/EJFWoPL/xWDazWHG8mhhdaSwjQ18vMi+8NP0U06FL2HMfPK
KrAtKzIQXNR/OdVSPUcwweOVc8duB2w+sDklSSJs+YgpBM4hVKRnyhc3/phB2y8J
ITdA/IRXMf844qOA3HMKswcCIhB2IlmT3NnXHfVp+MUKqc++fLeRbIYBNJMdzlY9
9UBOt3BMSdn5F0A9q3VFzhCUftqAKiJV22xEZKVO5LJgEZL6/Xu6gD7t9zNIQNoI
0LpJBMnB/e3fDrQFkLCZk0BF6pQ2XQ==
=7wOh
-----END PGP SIGNATURE-----

--iNcWc1qW2FmqJovm--

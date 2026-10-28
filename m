Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191686;
	b=Eh9OvdGJ/G6rcCNdGSybOgYJKEthSSp/xirk2XR70gNs5LTHpbQFPChi2Kk1ZDlFswg/
	 mwYuf+QVO5dgQ9UZ4QVQLNRS9rhs+KehTHvqvPeKzlSqDSMiQiGIWX+AjO3uMU6XZb/qq
	 5qPR2EYD6+e7p9IGYG0n1P5tGKganb10syFBOnDZfMqiSlUgjZuLxPI07B/fHm8eMp4Dv
	 HVi+hT+1Bfa6RppLIwJcUF78sUqmA3cv9CcwuRAcCnqkMxpjj5eHU6b8TtgfdYmIDiBHF
	 UZyeF/SQBt1DcNQn8tntcLZIr0iPkT2Zt74sFPaOF6GuYbjBQ7Hw/8+cdbpV5SwaH/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191686;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=gPVp/9e4HtWXvWK6vI/WHlR0OaGcM5UUmLmBIvbAjok=;
	b=hHLgP7kqabdZXoq+aZrcVDgp8l25jsZSHw44q7ZXu0VHXlt/tvq+62Qf/jQTnY82YehA
	 MVO5qvmusS1JbaMVF+BOgAWaC0fwATyM7RcItvnkGmWxnXra2SVtQz5bfv8V/rJ4RjkSO
	 DMKxe8Xm2gMfDaoILylIKpYTDSp8dzqoUHkiSBKyMzb1fd5QDhtr5lffjr63AL1d2z+i6
	 RifbqVmwmW6lW4j02SRx8PipzU3VH47UhiHzmMpyqE5vktZssh/yHvm/ONBSDxRxQm72l
	 QZ8lv+G8jFrCGhc/QpI8/47XmE8Gfo9kDy7VdirnrQZGWzhp4Yp7mbzYiCaYAJv3iBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQrYzo42;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CC606A323;
	Wed, 28 Oct 2026 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQrYzo42
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FE91F031E8;
	Wed, 28 Oct 2026 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191685;
	bh=gPVp/9e4HtWXvWK6vI/WHlR0OaGcM5UUmLmBIvbAjok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQrYzo428nUSRTkIblA+SRunJ3/xFwapJM5pWyWvKxLGmBGHb8ixT2CfAIU8+uqkl
	 FCfU18aiHzCbf47nkzFbzcqCERdjcwmOHp5IoKocBD4m/PrTICLFMF//jjrRhavhaC
	 YDAjrrFd6F/eBnIWo5EL7aJmvWwpQ0X+W5UxDzSeRxOe1FIiEIWja16L04WsRCyvHR
	 cbcZ4Z83OI/RUEwkKYT8oRT5L+wXn62XXjWS7rXFKy9lhm/XXmazRg/6uI5PSOWbvK
	 v0V86+bn/ZGNWKJzTmyjEzP205bIQkCHe56buQXrhTQUzKB0Bk5hY8EyTwS3ozN7c2
	 5/xHmUOd9I2+w==
Date: Wed, 28 Oct 2026 12:48:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] ASoC: qcom: Add Shikra IQS LT9611UXD EVK audio
 support
Message-ID: <dcbc52df-ac8c-40cb-b9a9-b442534dc37c@sirena.org.uk>
References: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="fXN6Duvapm6ooyCD"
Content-Disposition: inline
In-Reply-To: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
X-Cookie: Pushing 30 is exercise enough.


--fXN6Duvapm6ooyCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 01:12:15PM +0530, Karthik S wrote:

> Dependencies:
> - https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/
>   Shikra IQS base machine driver support (precon)
> - https://lore.kernel.org/all/20260910231642.1794948-9-mohammad.rafi.shaik@oss.qualcomm.com/
>   LT9611UXD DAI/codec driver support

Please resend this once enough of the dependencies are in for the
patches to be applied.

--fXN6Duvapm6ooyCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh7v8ACgkQJNaLcl1U
h9Ci0Qf/fWEQz+lL7Nmmf4aeBA272YGw0mGl2ORVEJZg0RTWN/Mc0UJW9LEf51YD
dcHZUEQIF219BGkcvBsuMmkdrJr3LXqXf7ZWXaN+3tJ2z2uvB/lswckzCEBlsuTP
VjOM1O7XnYD+MetUWq9PWYjysj+IyETtqvBOrRFhx0DNcvSHxPxtUafk1hP9Yd8Z
yWtBl9gqy06ZPtqYgLqPL5y04mjeTiSeZJvT/G60wNV4nZCC/x3Uv5IWo25uFt0y
Vny4ilwS5Z5MqVeIwCxn50glcWs4V/x3Vbz0+tIReu2vBgnQGA5MImsFkFI3jcfE
7RHsAGsDfUJE0qmtwFjlAjsU4Hel/g==
=r+su
-----END PGP SIGNATURE-----

--fXN6Duvapm6ooyCD--

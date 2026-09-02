Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB384A0EE8;
	Wed,  2 Sep 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360315; cv=none; b=lRN3g5RIKPL0zPdTl6vdieql4TFiV3ybPYEuDwdMXdMpOzNSW1saQ9xqIM97ovpFQOPcxaL7VLqbiobU1ysvRdUiWIbl8ff3sTxh5svDtFH0LIqH+RVLSAX1hsULxrtdDG7rgU1e3NyHzwJ/3yK5vpJHTZU+fxmPVhSgOqG8BJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360315; c=relaxed/simple;
	bh=SY1DtIUzci8tZ1pqViHykDWv+ThIgTySLENF7vnSTYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6Daa8V4oYtwlvFhlbuKxsI0gmRLD/rb9f6NGwvOGg0cRhYnW1bBr5q7YqoiJ3iSYTxBhJsLtqEz6GuBFPU0hrQrYNYbbyCSZSyhRxpJmB4SYIPmzo9DwUwhggWvYw5eRDK87Leke6nYQVQtmqz/Ip6y8xRuqyhmhi1I2XUuvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBNub/mI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBNub/mI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AB61F000E9;
	Wed,  2 Sep 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788360313;
	bh=t9HP8dt4LRUk6QPDOHoq4qiYozWKeKzRqB7qonnHWjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dBNub/mITsiuAPdRjzip6/W6xwfK7eGfjllmBher/SzPNO9wGn4ecHHlpVn8G1bn/
	 HfAR7TxY2CjKBurieJ4nBpcTh2JpYOcc2ULOovAboEgq86YZ2rp7/0WESc32zYy2rn
	 iCn+giozJttCspHM0o5RkYZUacAzDf8R3PiKtwOFAVlsJnfao2OLNCM1S9eHJhPx3z
	 RSsYHmHtWwLM+M+ydJcxHGvqU9tiYMXs4LX9/ajZVcKGnJHPChfQqUhaZgt9KxYeyB
	 PKuEFxlaGHI/alaFq5aXFPgYrVKItTeMpKTw8kh3CGiGnBeOKHiN0gVaT/5LTb9ymo
	 1o67haw5fWTvQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3B382CD7008; Wed, 02 Sep 2026 15:45:09 +0100 (BST)
Date: Wed, 2 Sep 2026 15:45:09 +0100
From: Mark Brown <broonie@kernel.org>
To: wangdich9700@163.com
Cc: srini@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangdicheng@kylinos.cn
Subject: Re: [PATCH 2/3] ASoC: qcom: lpass-hdmi: fix invalid rate error
 message
Message-ID: <apg2dTjMXjeBdnto@sirena.org.uk>
References: <20260902071943.522194-1-wangdich9700@163.com>
 <20260902071943.522194-3-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y+8rOoZgOQlwcHkY"
Content-Disposition: inline
In-Reply-To: <20260902071943.522194-3-wangdich9700@163.com>
X-Cookie: Orders subject to approval.


--Y+8rOoZgOQlwcHkY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 03:19:42PM +0800, wangdich9700@163.com wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>
>=20
> The sampling rate switch reused the bitwidth error path, so an
> unsupported rate logged "invalid bit width" with the bitwidth value.
> Print the rate instead.

>  	default:
> -		dev_err(dai->dev, "%s invalid bit width given : %d\n",
> -					__func__, bitwidth);
> +		dev_err(dai->dev, "%s invalid sampling rate given : %d\n",

rate is unsigned; I am surprised you don't get compiler warnings about
that.

--Y+8rOoZgOQlwcHkY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYNnQACgkQJNaLcl1U
h9DrVgf9E+hwQCO4zFPuFkPCvZzYpW0sKviph8ckssucDMZVKhFcD3ayapaXH0a3
qmdZn2cFdCs2Swcxpt/xgEahOaZN/wY8D4LkU+/J+6/dLJKHvuNmQ742AVyZVKJm
SXenTWz0jgdCtXq5CNum3QiKsJ9NBASaGXNGiWLNw9B+ECdLqvuCAhsbReToKgCi
xIUIsHgRJE5UzhJHc4ZVijGxgWkWcwt/8D202WkSGP8/mnjKXHBU3YyEgsPTLqGh
8rW7emRRxjYNMRc4+o71hKU2drmHVYrevmYXnpJ2BJMeDel5cwCeekvtCKAqJPcI
XhGtlyg/kc6JtbaD0fA+BekmyCyG8Q==
=ES97
-----END PGP SIGNATURE-----

--Y+8rOoZgOQlwcHkY--

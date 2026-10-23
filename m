Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776987;
	b=eZQ0nZ3QOm5T3z9Br9SspLiBmDIJkdzy0pOwrrKQPccD4plrgsppuO8YcstRKk6psOXd
	 b18wVymQkkI9QOcaJ7j+ZMBePWZS1jeJ+p5Hml/IUPWAPXItRVx9hJnDWREGN5hFnr20a
	 TLUGaiNp/LEuNgRFNwFT3kh1J8wNOJts5ceTpqBFlFqoqv3ytUIKr5KEXCfD5O4jSyI7S
	 63vZdLxZRJoMEpwTLbjCAPK+Jzny+oy8auMte6t7+wWX0wSlkWpXW21Zl5BDg/t30wuZP
	 4WTlHWkMvvBmrlEvI2hewN4fZQoYaGMV+O+qp9anXrC6ISqrpkISLwvXdahGE6bFrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776987;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=4LtPVC+zrlR4cEKSQvryqT2FphlXKfCrN2BYCQNIDpo=;
	b=TqMX+zwlOr6v8K2Y898iQfpyjvpE1EWxQQUQl9bsMJS4CBu/DiIEBowNYfwAuCQ4NsH7
	 fytPLzGz++buVSrMLkQpIknnmSAjSxAdO4iTfV0tOtVvEehqHw1tIheQeeN9u8D5521ZG
	 93qpmW7NnGjfYyxEidzU9uQpu8y1c2EE4DPLkb/Fyfl8tCRnvQS6d5hkoVR+2HjZeTcJl
	 Dx4uLcyoDR9ZrAfp1KSrRWTL1WOImp+wUdon9fsI5sLDQjHBVlEmqcFokA5bEvLN1//z+
	 0Nl1hn9WprepMqWw3m/ZnTNNAlwqC3Y350toUW7E3fg33h8fXfBq0GLYIwfv9cu59bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAPt+ucX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAPt+ucX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B531F01825;
	Fri, 23 Oct 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776986;
	bh=4LtPVC+zrlR4cEKSQvryqT2FphlXKfCrN2BYCQNIDpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hAPt+ucXI+DgtZaRxcGpTOcuQI9HQO/enRQ++CkxChfEremMT+CA6rixSfZOJY0L6
	 inIpXt0NH4nBlCkSrMGqO/6j5tI6Jl19htMP3S9x8AND4Uu0Pcf6Qg4hCFhipJ/5X4
	 7YPYvmEcGvsKMSPChcdApSmfovM3loYHEsh1JSr7SWmabMgiG4oKRCB28wY8aISwqx
	 wKRvAQDatRlonIngqQKb+Er0eTN3zCpYmfF+KcIKrpBg6ozJMEZxDTpfI99oFvxn7x
	 ZYyOeNOFgkkmN3adoSRt2Zw9lYyiASrellr0++9KDFMkzGd03RCnIo4+9/hbtgM+0r
	 3YT/DTh3RH4eQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B9F001DB81A8; Fri, 23 Oct 2026 18:36:05 +0100 (BST)
Date: Fri, 23 Oct 2026 18:36:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: core: freeze deferred disable work during
 suspend
Message-ID: <atubBdUBEejAyR9n@sirena.org.uk>
References: <20261016100522.2582557-1-yaojiale02@163.com>
 <20261016100522.2582557-2-yaojiale02@163.com>
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
	protocol="application/pgp-signature"; boundary="zzSpbQ1O88bwD7Vv"
Content-Disposition: inline
In-Reply-To: <20261016100522.2582557-2-yaojiale02@163.com>
X-Cookie: Whoever dies with the most toys wins.


--zzSpbQ1O88bwD7Vv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2026 at 06:05:21PM +0800, Jiale Yao wrote:

> regulator_disable_deferred() schedules hardware access after a
> caller-provided delay. The power-efficient system workqueue remains
> active during system suspend, so deferred regulator operations can reach
> a bus after its controller has been suspended.

> Use the freezable power-efficient workqueue to preserve the existing
> power policy while deferring regulator access until devices have resumed.

This is going to have a fun interaction with the only current user of
deferred disables, DAPM.  If a DAPM supply that uses deferred disables
is active at system suspend then it will disable it using a deferred
disable but since the workqueue is frozen quite early on in suspend this
will simply result in the disable not happening until after the suspend
has completed which isn't the desired outcome.

Since if we're suspending it's reasonable to assume that the supply
won't be bounced on again quickly, or that if it is we can reasonably
pay the cost of full ramp up, we should probably arrange for the disable
to be processed immeditely if we're in suspend.  In addition if there
are already pending disables it'd make sense to flush them rather than
letting the workqueue freeze, for similar reasons.

--zzSpbQ1O88bwD7Vv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatubBQAKCRAv73Ows9A4
ibTZAQCQYf3Axm83oLRuHLcv4YIuoY9ixtCjylF0g2+hBQ9KHAD/UMaYR/nYJpae
KvUvsGN0iAdL0j388TIVRyojVnrNpg8=
=L9a+
-----END PGP SIGNATURE-----

--zzSpbQ1O88bwD7Vv--

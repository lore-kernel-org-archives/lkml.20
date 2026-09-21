Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA93A8388;
	Mon, 21 Sep 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986225; cv=none; b=cNaNbXKwvEhvwZXU3hVsZCD8yUsEDc8tjU+ZhonI9MQPXG+cPaIGMuWJhPTxgtwdWjp91IoaVnFqYI4/Wf7wLxuuBhkt/1gBq+4KnJwsE+jUqY3pN08J52MzZcM0ue4h1KZ0sLm5ys+FJi4dwC5sVAKHlSkIMfdq+kgPnGBfeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986225; c=relaxed/simple;
	bh=7GAn0SQrJZf8k+Cj17Zb29X4ig34iegCyfKKDdzx8c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZuMSJpEdxQ8GPIGianGipRQZl6i93yelab4E39MOWXkKbCuM9SIpAnpLaW1D3ltTPBREZtC5O8mgpVxNSdzBuOxdqN+IiSvfqciWOCDEksHgCDEY5BGhTanpQQyTpJrA75fAY0BoDbHp7BxIhzSyaOQoGoacFHkpB80tXRt4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1StiYi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1StiYi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95551F000FF;
	Mon, 21 Sep 2026 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986223;
	bh=KeiDS35e7oDHwVYJ1jbiHDTcydj3LPI1RqwdLg/V/rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1StiYi4RfoOPqgoNX1poiOFcPxlad0HHVR4LgotRAP93zWrY35dmUG4Nvdg5CTj3
	 YrQKm155U8J7D3AjlI8Kam8U4CJ3SWheQ0s0bd8y0qZiByYR08hVKUy8kFygMnNSFp
	 /f27J7sCr3AhKDtucR0BNgSXW5dRy+IoifrobCIrlLNO1+N90f5iyTTceK0AmRE98D
	 jmlrxOdHpx1TU89FFNIgIBN3SM1Jh6mFo11g9sLj3mIJP+u6tvzy+dy23bBnRQelyw
	 4YHseQfrcmJ2L1CJVofEZEjtG6AZZKgZ22oFtLJYYe9n4A454D2l7YpQ0VX8xOmCuX
	 WThWlEhsEp7jg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 44EA21AC52F5; Mon, 21 Sep 2026 11:23:39 +0100 (BST)
Date: Mon, 21 Sep 2026 12:23:39 +0200
From: Mark Brown <broonie@kernel.org>
To: zain_zhou@realsil.com.cn
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Wei Wang <wei_wang@realsil.com.cn>
Subject: Re: [RFC PATCH 3/4] regulator: rts490x: Add driver for on-die
 regulators
Message-ID: <arEFq_jDaUcbbDvo@sirena.co.uk>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5/rSFUp8Yji7O/g"
Content-Disposition: inline
In-Reply-To: <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
X-Cookie: Too clever is dumb.


--f5/rSFUp8Yji7O/g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 20, 2026 at 06:05:00PM +0800, zain_zhou@realsil.com.cn wrote:

> Add regulator support for the four programmable LDO outputs in the
> Realtek RTS490x I3C hub. The driver exposes the LDO voltage and enable
> controls through the regulator framework while preserving protected
> register state across updates.

> +static int rts490x_regulator_unprotect(struct regulator_dev *rdev,
> +				       struct rts490x_reg_state *state)
> +{
> +	int ret;
> +
> +	state->restore = false;
> +
> +	ret = regmap_read(rdev->regmap, RTS490X_PROTECTION_CODE,
> +			  &state->original);
> +	if (ret)
> +		return ret;
> +
> +	if (state->original == RTS490X_REGISTERS_UNLOCK_CODE)
> +		return 0;
> +
> +	ret = regmap_write(rdev->regmap, RTS490X_PROTECTION_CODE,
> +			   RTS490X_REGISTERS_UNLOCK_CODE);
> +	if (!ret)
> +		state->restore = true;
> +
> +	return ret;
> +}

What's going on with all this restore tracking?

> +static int rts490x_regulator_probe(struct platform_device *pdev)
> +{

> +	if (!pdev->dev.of_node) {
> +		dev_warn(&pdev->dev,
> +			 "no OF node; skipping on-chip LDO registration\n");
> +		return 0;
> +	}

The hardware is there no matter what, you should just load the driver so
the state is visible.  Without constraints the hardware state won't be
touched.

> +	regulators = of_get_available_child_by_name(pdev->dev.of_node, "regulators");
> +	if (!regulators)
> +		return 0;

The driver should just register all the regulators the silicon has
unconditionally.

--f5/rSFUp8Yji7O/g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxBaoACgkQJNaLcl1U
h9DrEgf+KXidvn27tUTXYgVYcFZ0ex7DvlXgyKZmRRxKrLvcmKP7zfArl7kU5hn2
SI1FLzc3ZUSfJ91wZIe+loFnf/Vx7/pmt9KvN0IZqtmuI0q8pbsGGDPOb4xc/Mx6
MX/5aOUIrcHRGsxWUVJld1AYkG/Hp5z38/TlPxtdxQpP09artOzs4F1qXFUdcKMN
QtrtPgyUrMf9vJV3+QaEfIzU3XslZOqr7igO4+jeJbGtc8Za5FG7/StjbvrQoOkd
mxsTFhFLO9R4/QUjXz7ARi8JlAXl5WHaJiNhyoTrXXLlt/DbCIKLFA5cGd3gCA40
5VnO2kac3TjTifouGM5EgKWlv2P6Eg==
=RDhc
-----END PGP SIGNATURE-----

--f5/rSFUp8Yji7O/g--

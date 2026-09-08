Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A181560AA3;
	Tue,  8 Sep 2026 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874004; cv=none; b=BcmJ1ElEmCJsYYRV/sPXB3dJPa+nGRh9yuzDWiWAT+mWjsniplyGJZ2nG/J7ywCC5DXr6kcEZ/dxUPckZg6OMgxDKOl7DQerLUR2/+sHZDHfFA1ouYIDGNv37Ak00LBdQl1GNeCC9vskcR5XwtJhE/MXuxJxU097XlsQwfXQ4Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874004; c=relaxed/simple;
	bh=kkCW25mTBC6D6EOM8A27Os9PxNPMAbNEV5hiQ10NpKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7dxCkZllbQW2zM9/2kHolercSxfG3jG0DZToX71Wg75Kh5EXFuMQDcD7/ViCdaCfR/2WT0/EAHTbzKFMwSk5RE3wn/jK4p5Nw0yq+OaUVDmZgnw4A42/7R/38U9RUNsHk2oJMWmLlSX0rWVb7MfOlpQ/0/Nk3oHbVEG15Ni254=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HY+Lyj6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HY+Lyj6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A111F00A3A;
	Tue,  8 Sep 2026 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873988;
	bh=q04zxj00YAVHVF+Y7P5cma6NzSCR12O+/Gqj/zD7dkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HY+Lyj6IGR96zyT1qsYCwOJAHIyn5hCfupkAzuvfru0PDM+N5dpWX6zFCjnfOGn6i
	 tVQ1YJvsY6jjM92UHvYU/acV6trLMJn3hkLbc1E1immJ4BXulpmsztWugpgNhL7/Ha
	 V19XmH9Za03TpyfGzHd/RFYbQE952PGFoybuIkP5CisLHNylBlDy71fGOMoJ1kCGSt
	 MPDn4/gTi6CnLFi5qoj2BLbTXX8uDofg5CSFDMwUd/x/CDbMYcFk1BHHptKQtIdxuu
	 QwGxtPT+SfARx0kFZJ9/wRzu03zr1bDN2spuSmFRhcLfj5hYhHk3+LF2mlPabYJid+
	 zrdApXJlXJ+BA==
Date: Tue, 8 Sep 2026 14:26:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
	Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
	jishnu.prakash@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	lgirdwood@gmail.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9VW76fA+11sgbf3o"
Content-Disposition: inline
In-Reply-To: <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
X-Cookie: The world is not octal despite DEC.


--9VW76fA+11sgbf3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 06:43:09PM +0530, Kamal Wadhwa wrote:
> On Mon, Jun 29, 2026 at 02:13:00PM +0200, Konrad Dybcio wrote:

> > In that case, I see no real downside in allowing that, especially given
> > it would/should be used sparingly and only in cases like you mentioned
> > where the board has some quirks

> yes. we can use this sparingly for such board issues.

> @Mark, @Rob - can you please comment if you think this is acceptable?

Could you please ask a specific question?  What is "this" here?  There
is an large amount of quoted material in the message and referencs to
some property but I'm not clear which one.

Please also do not add random extra characters to my name, and also
you've CCed konrad.dybcio@kernel.org which appears invalid.

--9VW76fA+11sgbf3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgDP4ACgkQJNaLcl1U
h9APVAgAgq+stEwEc/8U6SjPxakkpGCjCDA/SXo7iDLCsUVsVlArF0X9xby1ke8j
MYXZ/4StflzSrvE4jca2Pxpznzc1L1GwitqsmVQxGrTZRlchaZV4X8pHknbJJA8v
BbZTb0JZKHiYpjPu5boA3jCYQq4GBVsffU2DN+JJJy/jmTSsiLXzFvEiAZdSxmI5
iYQ6k1owEM7QgVcqbivuKSKMNio8XmC1OP4EQ8hdeq1BcGMYLPkT6/uBMZTiAAUy
/7RIH7PqhGAU8ePnPK0TRoj+NUpknydYc1esMX4HZ2N7u7HJ4ug0Xmj7h/26KUT9
k7oZNP2t1WSU+ZbUSNgT9OQ7mWBypg==
=bqAj
-----END PGP SIGNATURE-----

--9VW76fA+11sgbf3o--

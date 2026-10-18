Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A648D864;
	Sun, 18 Oct 2026 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792349622; cv=none; b=igx9zjXakunha6mgCL92AsrbYCbG0vr1dnSAS1FAcvKQBOq8qkTErP0f/iu6CCSYP68peim9e3IsbHW2E/r3ekDZ77Z7iXMHW4Dr/uFCYEdCJCXTdI4GWDfvVGp0+O1fCRESpTva6qM6XTFCCYvS090II4FfMfg4x6KgELgE3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792349622; c=relaxed/simple;
	bh=Csfu+p7DecNNEaF3nmVC8sIFseRFu0794bq3QCYty+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTDvxwXEbAukC1XUVbXuhikpapEikWot9Q6RrcxtkiMVfcsORQPC+3y3S5cCEfW7diTveRydH/ufw3Wo26xnJ43qeVzU/lrUkWIOy9jUzDbp6sWnBPL0ZQYJgQL7eP4C/Lxp+ZskI6FRt+LvuxCQINWZxgZPdcR17LJwZQKb6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjA4CUnd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjA4CUnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00AB1F000C4;
	Sun, 18 Oct 2026 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792349620;
	bh=Csfu+p7DecNNEaF3nmVC8sIFseRFu0794bq3QCYty+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jjA4CUndG4pAHeZbrm1BxDlNpX+HwJnx5LMzyQhuRncmok2Is9Ye8llG9g5VDAMjg
	 x0jPf3L6EIV5jtbCf0rrWHecI+WUgQ2BYjvJ7U79qlJ2tlyaEvMDG2WkxVZMG9nzKN
	 g9xNf6xCxfV0Wbo+ntKJTxxnYs57ATObOtUGAj08h4M8VKPpDHSsEDMTD44dFVas0W
	 RQ9L3b8Nrml2q2PgegnN1dqxu0GPb8trAEyETF8LmgJnn4CH9oB8DjF+GGT7FpsTwi
	 8ThRNHtvUjIjNA9yU4XuEbZK7tzUhg6jDqQRrBnfrG1PsgMKQNhzILU/VJ4yMs+ZlL
	 QJewmA3n03Pmg==
Date: Sun, 18 Oct 2026 19:53:35 +0100
From: Conor Dooley <conor@kernel.org>
To: tianshi12127 <tianshi12127@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add Smartisan TD4362
Message-ID: <20261018-snorkel-mollusk-0bfba29ae1f8@spud>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
 <20261017103250.800109-3-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lC/VVTF4dvcK+DOZ"
Content-Disposition: inline
In-Reply-To: <20261017103250.800109-3-tianshi12127@gmail.com>

--lC/VVTF4dvcK+DOZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lC/VVTF4dvcK+DOZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatUVrwAKCRB4tDGHoIJi
0qsmAQDCxEOSqGcSTiPp8dYp93pj9cpI6gg97r3RkkHx9lbjaQEAu81O/c5LeMu5
GPjVL9aFsE6ayuPTU9LuBlQWBOl8RQY=
=NMlV
-----END PGP SIGNATURE-----

--lC/VVTF4dvcK+DOZ--

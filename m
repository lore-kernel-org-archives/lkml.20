Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DFA48035F;
	Tue, 29 Sep 2026 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718319; cv=none; b=kzVuVUQaS8yyWkIyqlOdhgOx7Bs4dBgREh2EDdfd4h9Tps+QLgA8NWYhGlH8oFgdbg5Vy1oAr4IpScCZ3BC7Ka3GN/v/svGQY0cB/niC3D8updWd6jo+38M0YB+bbaSecG03ufHGt9+YQu+1ZbyC5GrAxPUQRkwO05s31vh/BX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718319; c=relaxed/simple;
	bh=r/tcpcwfRAj97YXTFVy1944FX7u7iI2SARQAgPsJoEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ag6a26dpFL7xXn68rkUA/pNIU+BMR8ZQ5twvOAmTEboXWB/lV0ri37JZK9hObT9SjqLLGEA42If6OUKxJ64mj4SH0ZoUzOf7ZeHAkFMk3gR+SqipCDI95o3bCNt04woQO0ntkAqfqEu2UpngjCdiS/tdPSdHhTnG7TOsDmmKu60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNNit6iy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNNit6iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793F71F000FF;
	Tue, 29 Sep 2026 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718308;
	bh=r/tcpcwfRAj97YXTFVy1944FX7u7iI2SARQAgPsJoEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNNit6iyY6xKpJuVXhpVPrAOsnEBPwiuqCyo+2BpBpzKaCj6hNLmxQqGgAgifA1Xi
	 bvd4a8h+VxcFgH7MxLA73Tsd1bATxeGWJcSfGUUTYW1DbO7/uNMg0ebYGidTTaiw1e
	 EDM0Jk1fhTbrRMQLf+mv3RO4wvETPe8/P8JkDjJEBoBoHstrb4x8KZdssNKyALQC1R
	 DHAwRuTdBKoJSGKibYpPfd0L5HIOUTfJC/AkUKDSiukfZTM3FV+5cyCUnMSDb5eZ2z
	 Ebh0eIGFLEgLwxli9kIYrwVuWc3qCm9scPmZ8kRFnOIeTrr7zIgxK7+OVwhBKKDBeP
	 gAF0IlDuLWx3A==
Date: Tue, 29 Sep 2026 22:45:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Axelsson <andreas.axelsson@androscientia.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2781: Do not report cross-instance writes as
 errors on SPI
Message-ID: <09a602a0-3aeb-4ab9-832e-1c15abcfbf1b@sirena.org.uk>
References: <f39f2aa8-33f3-4cb6-b2ed-56254ad63f3c@androscientia.com>
 <aiqrzlIGi0ClnygD@sirena.co.uk>
 <d99d01e0-8ae5-4555-88cf-d7eb9afca692@androscientia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FXqQv4UZqkKGpPjn"
Content-Disposition: inline
In-Reply-To: <d99d01e0-8ae5-4555-88cf-d7eb9afca692@androscientia.com>
X-Cookie: 1 bulls, 3 cows.


--FXqQv4UZqkKGpPjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 11:36:11PM +0200, Andreas Axelsson wrote:
> Attached is the updated patch.

Please submit patches in the manner described in submitting-patches.rst
- tooling is all based on that.

--FXqQv4UZqkKGpPjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8MWAACgkQJNaLcl1U
h9DeBQf/fT/u70Ff9MWHmd6Dp7FrwW+jkhhOEmR5S511Ybn3w3cRtT4CPGPvoQmC
X8nrEdDMSFfCuAKfvSrRPsIFu4ZDX1cy5wlpBWyNuqxxxo175wr+fKxeh2JmckF1
WpnEFZiUeLwW/H3RVIWLujRL14mxyhLUmm0odxnZ8QYrD6BEZk/yCNANj6mGSWNp
imEcpPYVbO56nSJQECvjFutJtFMysNfJHjFrQTk4+59dapxNDDfEWStevwyP86iZ
GFjx3fJOIh3gZxnQ7txcygZr6oGYJKLD8pQCR32ej4OZrpy2Da1pYzhNSTIlfFSb
zCcxKsKWNdeTrXWlQdX0n8dTgJ3Y7g==
=D5nP
-----END PGP SIGNATURE-----

--FXqQv4UZqkKGpPjn--

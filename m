Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14568438010;
	Tue, 29 Sep 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679864; cv=none; b=OVmHWFf6mO2G+6IKHKEF5fVaXdP6sH8w5srG9FvTkj51kD7my9LdbSKeYC6jloLAe6GY1Lc4YQY27WucSf1PU45PttfpTrtS13WuDDIHO1K199cnQ7D6CxvbDdfZmY3WKJ1l32ITth8mT56NiJe31bsdaqZm7/3g+FpIhMx21iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679864; c=relaxed/simple;
	bh=bfvcxREXHo8YEECDUHHXRvYWxJNNb0UAyJmIMR+aTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi9zHUHa/p/1KSLzpCsNk3xMhWIvQnHKiCKouQ8pkKHxY7JQk3EEYAD6gxBzn5TdUpFHTjpfnVN27Cf3lpnZAlTCa1703bJBIzKxVMMGirgcWYETjm8PwWAKivNWGddPAQOKIHJv3mx95T4KLwOokflFqNPq2QqKmoRwSv7nj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFRlQ9lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFRlQ9lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19DE1F000FF;
	Tue, 29 Sep 2026 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679862;
	bh=MY3zgCye5lDO5o+jn68gyNtfwgF2cGVnmPPDN4yZnGI=;
	h=Date:From:To:Cc:Subject;
	b=mFRlQ9lNvi2xzAt7SLMgFydNuOrB/+/5F497AF3OhHfUJmhO7/8lQPinAoLFCwPSN
	 iKaholjBzUyWxmNmKugWrAQKjGwvOMgsSJwU9YX30XqOCBsktFUfJDTZCQoq1opYLB
	 3bukmyE51insVUWA8i/6pQcZ9PsYIt+19a/jSkJOY7v2E500BaGRPaUAPejlUo3UZl
	 4YXS85m6xsXaWxiSLSuflZaqlK/DkPhegJsuavaioEX6ovrC/xdHCidJGTx6Cysxnf
	 S4TLBuMhC2+sSHw/Q6G/qGYHoD4KH/U0f9/b78QpzZAIuC18dF+rnqnqynasKfcU0A
	 tLEnonLcMt1yA==
Date: Tue, 29 Sep 2026 12:04:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the stm32 tree
Message-ID: <arubM6k0KDyej0Y2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vsKljj057mxQk19"
Content-Disposition: inline


--6vsKljj057mxQk19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  281ab10cc888a ("arm64: dts: st: enable eMMC on stm32mp257f-dk")
  9a7f28a06dcf8 ("arm64: dts: st: add sdmmc2 pins_b for stm32mp25")

are missing a Signed-off-by from their committers

--6vsKljj057mxQk19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq7mzIACgkQJNaLcl1U
h9Ai6gf/Y0mPk3ontdYf1Ne7h9sq4NEUg/9ygknyXc9fZ+KBA1lBr0ggS7+W/cYu
Dg7nG6+AjBx+4Z+P/JT8NpE9NprF4BuIwAMTQm5Sype1sEOJm1JJ/3OXMz4fqZAf
8mKDVSQsfYBpfjnGnnhbLUfWhSIUIzplwJBk8JxE86Rx2J3r5Cdtx1LSOEq3b7Mv
PaOVTKXGs2TZuKhiQA0OU16tSfOmILjs++pTt9MFyF7d49E3Ie3DaqCs3S7z8oF3
vR/RKmJwxOGWeUxyB1BlT1H9IqlMiHSUJz3+v3IT7VcqL7Hi2FRZOzDFWVlLJ9wc
llaxAYpcnDo8utiWDTnY5U3QIssc3g==
=kSKM
-----END PGP SIGNATURE-----

--6vsKljj057mxQk19--

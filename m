Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743635C6AA;
	Mon, 21 Sep 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986707; cv=none; b=Sz9Vll23fsA70Q6tPAGGtFsdy0MnQCUDX+qWGaZ7sH5igl7mS6U9541p8VWNVrrRkA6EvNwlrRZ26DiviK2FUUIeGAg/YxBt4o7Kzwjc+vjyK5pBEtecwud1ENLSnadeDnqjSZHOgB00WgePIfbuGAvKwsXGbxP7fRmTJdajv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986707; c=relaxed/simple;
	bh=EXDllXkxE5PenXcNK0sPgs5pO/YD2IlpkkpKPa4JFKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3LI2sPrs0I0texgw8ZgMOHje1wXAceb0QodkyFbTFclckjpJPbDmHrO9zBLnsLkUk93rs/Vqo3e5PXMNNhgBUbWKb9IT2c/rtSpT8LvDn202XPJXTk6IQ6pb9gsWOyfaA2ZBjaMi7GFFlh5UztpbQ0kLOwxjnVA2NRsAAJmr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KimAC9VV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KimAC9VV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684ED1F000FF;
	Mon, 21 Sep 2026 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986705;
	bh=6wmU2sr9x4b6XtO4kbKx7Dnp9bvWjXp1O0gQjA1HTzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KimAC9VVpjCZlkNzduww4oh7bYp1aa0Np39yi2VPuNIrLfl56BeGTJcp983e3fDov
	 /KyyLZVNZsFFEtT+qjTMNU7A2hPWSY/l0Xnd9G2HlatJBjrsk9aca3EeZqawS+uRBL
	 XMlU1AFlK6EeAg6UlgEYzfis+KUzENakNO4EHfix0FCe6Uz1QiiS71vIK7hpEhsn/G
	 zWqB38Ue6AEvPJAb4UIiDvn/yxuMfaR44PwvqUOM9aeKTutrqwqfy9ywbCTKAZAX5A
	 lDJvUSgQO/xKTtylqMPeQC1jnajdsscyZCP6Fn6G3FvtCWPJMH29kZ1NISmshg/ufM
	 mkOtCoRMHKZdw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CD75E1AC5363; Mon, 21 Sep 2026 11:31:41 +0100 (BST)
Date: Mon, 21 Sep 2026 12:31:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Thin A15 B7UCX
Message-ID: <arEHjbt3AY06j_Vc@sirena.co.uk>
References: <20260918104944.649403-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfBbAC669TzLjavK"
Content-Disposition: inline
In-Reply-To: <20260918104944.649403-1-zhangheng@kylinos.cn>
X-Cookie: Too clever is dumb.


--rfBbAC669TzLjavK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 06:49:44PM +0800, Zhang Heng wrote:
> Add a DMI quirk for the MSI Thin A15 B7UCX fixing the issue
> where the internal microphone was not detected.

I think this is already covered by the change in e2aa5ad3be41a (ASoC:
amd: yc: Add DMI entry for MSI Thin A15 B7UC) which is already on it's
way to mainline - it has a substring of your product name so should
already match.  Can you confirm if this is still needed?

--rfBbAC669TzLjavK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxB40ACgkQJNaLcl1U
h9BP0Af+OK9qbFlJFxBQmRvyO7xrzqH6pWeJzfqOdltvy+eZTrYyFW7k5P8o8v1K
zWGr4QyPtoNOSZjU8ErZ0Z2/4A1eXCmbtCg5xRBW2dmm6M/reMw1Cvk+NY6ePDSJ
hIEo9DEUBSJEjEKLuZOedZ7T4tPPoMjsrIDABZpybietNdVzZ7m3AVRV92ffma+J
0BRi2wRJDzvFoYm+1oYksSms9YHtZzGXoS/Yh1KftR0N4BmiUj9UTTWeDXRtU71o
I86J+bk2V0Z88LFK0+9PlT3IwK56MV4PLy8gZYSyRCtPT/u7zDp/duy3BZQiMGmS
9YtiQsSUMOCOlcU9+b2cPLfgXcIrlQ==
=ojyg
-----END PGP SIGNATURE-----

--rfBbAC669TzLjavK--

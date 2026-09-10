Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B993BB113;
	Thu, 10 Sep 2026 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082286; cv=none; b=kW/Y3B5lScyoKZAcAMwNLDMvlsQMHS4G8sIembnLIW9BQXYFTdP4VMHjDMutIRmkr9PKPpe1735qoAXst8qXre77TVt3AoT2mul9pWxCGIp/hmuWu08hEClCkL+h8KZ9CpgYoT8PtqCf3nB1clv/7OkLBSFhWmiRP15n6GVT5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082286; c=relaxed/simple;
	bh=7qoaVTWNeWfKfJjIKDbZ92NAvSYn3b4QcmyHDV66GF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYWmTQdU0/l7gMY+4zzlMeb6jCpSWEuucbjDhIdzlE/REI4eO/4G2omlfibH5n2TBpBVdkLIDuU618J/AdAUihdzr2BVyOZmTgulS9BbYlnq9dZKoXUIuuxMUEpMTPkMWcOYRSRKGGMu7Coj68Fu9bumuNMWA1N0FVQXXoUs9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqtE4RZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqtE4RZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86631F008AB;
	Thu, 10 Sep 2026 23:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082285;
	bh=7qoaVTWNeWfKfJjIKDbZ92NAvSYn3b4QcmyHDV66GF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EqtE4RZKKalBVOoJBzTf/SP/EGqvoyxJVOur2GZ0HRGJNuRvJxXBeKNSYE9TeiCKl
	 iC0/clo4B9OxZDfd/X7kBtgswvPYGHUJwTvAMVoOweVuX/igfRC3Extj+oi7d2fEst
	 7eAif8sRtWVtGofzzUMY/2VTrI12xSpkQa3J7yKUTo2OtAzf0Q0IphZ+E/JBIETqT0
	 atv71eca1hOMftNdWZuCiOkBo6LGCWFZOtz7GM1jrjD3lWrMPc6fBFlPy/Mr9hABKR
	 JZBqF0ABDK/spShc2Qk2MbJuYyxqL3K6OrHxKCGFUw59NoOYkczXPBPnqaHaRXOSQH
	 qt0yjHVpli6ig==
Date: Fri, 11 Sep 2026 00:17:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: sound: qcom,lpass-va-macro: Add
 clock constraints for shikra
Message-ID: <2a49bfff-d51a-4d41-bf65-949f682d9d99@sirena.org.uk>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eRPXtxIlIXa46/kx"
Content-Disposition: inline
In-Reply-To: <20260910231642.1794948-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Gravity brings me down.


--eRPXtxIlIXa46/kx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 04:46:35AM +0530, Mohammad Rafi Shaik wrote:
> Add an if/then condition for qcom,shikra-lpass-va-macro specifying
> exactly 2 clocks (mclk and npl) as required by the Shikra VA macro
> hardware.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--eRPXtxIlIXa46/kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqjOqcACgkQJNaLcl1U
h9DpSQf+OyZxYZyV+/C9g7EPGraYa3GYoAPAR0NoSIFc+bKSd0i6uAofTJ3vVrN5
+fMAtQ1ALnsHrUIqMXbMG7FzBS1S9eC9L98Dig9BzZqYW9nJE2Mwt2bjY3QRFw++
tRGdnkwcIBAjh4/qXQ58Ug6LdIj9IyIUzPwFXnyi7LzrloSuTYQ6lH9xXEaT4dA1
Cri4EAmgJha8XyidmI2ZSu73ZQcol+8RsuZ8WJQaB+aEpPO0p6SjHzttWnlLIJJT
qHqmf6WD9vBOcPGwKwB2YBZrEjg5TcPNWzDCpGqnsSIJ8FgPzeZatLOe/A6GRU+V
pa1MGT+hYZluR+kJdR900K2rHi/KUA==
=bIky
-----END PGP SIGNATURE-----

--eRPXtxIlIXa46/kx--

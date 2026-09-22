Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79963542EC0;
	Tue, 22 Sep 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079673; cv=none; b=UdPSLXGGcPQ5vKxEyf8mkH/i/ORJsJ3yAMbRRzDxYsu3nqZZAZtFgyMF0YIEnkHYTLLzuZBOK0S4LcHzNuMuA+BLhnsfxLcjG91tZpwUVWVVnM9aX4FkoZkwWvZX7OEglaBw2ltcRJxoBjHw0LnJ+Pl+Hhcw3ulyk5xLh2DvvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079673; c=relaxed/simple;
	bh=AksxY1uAGBNJ49x3ygb1UGk3X0aybJfvIojcMU57v4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCVIut5Hgz81+Q616lg4TgJyv0RPBmLCHwF5m+zOgLGefEBy7jwKV0+2Qva7aaJaVQV9wyNzGf3sVVgdtt7S5hmPNkgfa29u/X8rdrLklKDgbCtPmObu8cs+f7G1PWEcJqCegZYi+L4ysgFJX7V3Peq+ZPbfkZ8sRAQnwWbrmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMbbpLtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMbbpLtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28CA1F00893;
	Tue, 22 Sep 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790079672;
	bh=AksxY1uAGBNJ49x3ygb1UGk3X0aybJfvIojcMU57v4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RMbbpLtDgIum719pZyr5Yl+MvvA0o+I9SrUdc3YMU8zN/Oz/UTOQ5EIrpzzHbj54O
	 U4SmYJLHkfF2vbeuJPUNeLBHzOuigrpFTJLFewpCjygjC7zO2HMZ4V9UI2m6kCdMf2
	 nZ/cOHWlSp5c2VZVuPrUfXSfpFdrlcht0GhIeNe58dQnq5RXcyUmnVwchJz6EIWh48
	 imZ7Ma9tBKUKnqClerER+nHQa8OPhzFCOAvENNg7hw0ORGI98APpZxptHxzZ08VgDN
	 Zyml1DKBzPN3L+gt6U2148DnlIyuaOl69rdOfU9JrJZbg6FHf/3wj3wlph9B4ZFOdq
	 D7HGEQnI6jSdg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 533291AC56BF; Tue, 22 Sep 2026 13:21:08 +0100 (BST)
Date: Tue, 22 Sep 2026 14:21:08 +0200
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
Message-ID: <arJytCJZZnIX835Q@sirena.co.uk>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LFiAsPWOjKfv+Nmx"
Content-Disposition: inline
In-Reply-To: <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--LFiAsPWOjKfv+Nmx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 12:38:11AM +0530, Ajay Kumar Nandam wrote:
> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
> context and cannot use the SMMU. PCM buffers must live in reserved-memory
> carveouts that are SCM-assigned to the appropriate VMIDs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LFiAsPWOjKfv+Nmx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqycqwACgkQJNaLcl1U
h9A/+gf/T8JL+RtFaRLxC8+bHI9qCoikjFfReVURxNayLiGcac5XMropiT7BHIZW
Z0WHPWbRdxqGgBXPYixX7sfn6RBNCwUyPtbm33lfyv+ZmpEkzCxIXD6yP7iD674h
80m9QdHKeskb0V23JDYnvxs7qN6hDC6GW9gZBjjUttyeaMmMKyeN2IFv+YIwI/vb
AD4gQMaJQYkIfenZKYXot5V7kCrRjdz2o8gSHSHZdAQXhYPdNIQoOSO2toy72QrC
mt33fbqZ2G5tqUtytiqsMGsqVWKZQNv3Q1LLm51cil0m/6hBk12tZ33ZgDyyIh7Y
WiZGchDz2xKpytm4Rm73kT5q1omYqA==
=5YX/
-----END PGP SIGNATURE-----

--LFiAsPWOjKfv+Nmx--

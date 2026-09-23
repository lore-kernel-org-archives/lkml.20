Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B979C542EEA;
	Wed, 23 Sep 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177595; cv=none; b=nkNqbz5bBbqmpu02pYWN9P/3ddhc0o2o7kTWTffnRvYTgacPWQi8UdPts/RboHBbOrLv+6oLuf1LwKBqxPKEX3YS7GuI4bhcnsDQ/rD70/7w7S19I04h771pny0cUkjMfLoHMGyjuju3Ez0cqWUYw55jbME9061RWk4hQLDoLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177595; c=relaxed/simple;
	bh=NuLeoh6Ugld7iV7SnT50xGGVF9b/mTHr305p/mbI9Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptYqGnreUkFBF1f3Z8txUm3DcbJDFMZdXQbIf5/hKZ+MM/DoiZnLUxwIJ/tMa45YyvRdXBzxVYlibQfxDKWe7/7GGDNa5sojv6HjUvRfwyJ2cPFQoX2dAl8Hf+hD7mU6yKb72qN8bh3fflLIreq63OvSb+o5nKe+LvVVekQCpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsqwuNQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsqwuNQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962CA1F00893;
	Wed, 23 Sep 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790177579;
	bh=7An/+u7SJBrDQANdjifBoZvri2cNNci83aas+f72qng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsqwuNQEU9yVEm6+99I7mYuQ0BDYPv/tBTCdeF7z6k/mz160aby73BGTMt1o0eku2
	 8gJWcNIyVP/HmmFZRtIquSBhwJMGVsZm88w2KjF0H1JNbQW1WUrjRJkNPKD3tm9GTf
	 d4y3g1vIZO5ygi6TuKrnWbFYrPmZ7zE8ew2c6JQW0F5JS0zu/PSelXRs77YRUjFMM6
	 U42wNptOL2Fygfnuq+UoT5fRe8E5jIGiLaZ5H/9e9SkRpg4Ajy7TQCJs4Hc/welA3h
	 u13PMpdHMKWwAnUwEpkSZW+S4Oto7qlNt27A/yCYTnM8wUg0EiicZz4wVfJaJn3F1U
	 cwHYZtbW6C5BA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 28DDD1AC573C; Wed, 23 Sep 2026 16:32:54 +0100 (BST)
Date: Wed, 23 Sep 2026 17:32:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/8] ASoC: qcom: Add audio support for Hawi and Maili
 platforms
Message-ID: <arPxJqKoCXfF4TCu@sirena.co.uk>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c292jOMaxEiICJ7D"
Content-Disposition: inline
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Elevators smell different to midgets.


--c292jOMaxEiICJ7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 02:16:19PM +0530, Prasad Kumpatla wrote:

> base-commit: 6c58e38b255a3e0c11e513e3b8de85eb26fb02b5
> prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
> prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
> prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
> prerequisite-patch-id: 21e9dfd02f282ea4239f12d91ac8a2be76aaad29
> prerequisite-patch-id: 52f17e16e09853e366ecc3da2676654df79daf06
> prerequisite-patch-id: f0b1cd1f1f8daf0e1814a338446d493d64c9469f
> prerequisite-patch-id: 29a1620a2ea61c0b7b052220e5ea522b1fbf2ad8
> prerequisite-patch-id: 0872295385e6712bf342d84f095ec3710abde8d8
> prerequisite-patch-id: 69807d41bbbd6177da4374639ae280501f3f60df
> prerequisite-patch-id: d9f8613cac873926d6d2fd77e45002d34954b434
> prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6

As I have repeatedly told Qualcomm people please stop sending me patches
that don't apply, please collaborate with your colleagues to get
whatever it is you depend on merged and once that has happened send your
new stuff.  Qualcomm is sending a very high volume of patches, they seem
to get limited review from other Qualcomm people and progress very
slowly.  I'm getting a lot of Qualcomm code sent to me, in hard to
manage forms.  Please also consider helping out with review of other
code, not just submitting your own.  This is not directed to you
specifically, this is more Qualcomm as a whole.

I've dropped this for now, please resend once it can at least be
applied.

--c292jOMaxEiICJ7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz8SIACgkQJNaLcl1U
h9CAWgf+Mtzx9WxeJ2oDuphhA2V0HsNyVXrUseYeu3W/d25j1u3IKdEz94s2kKz3
rx+T7mlVVrqcKYaH7UiLYsoaBuBXxxMmm8WpTtrVxjeuCF/Zpmz8ZzS9I+8D1S3Q
UwgkJE2vkKSEmnf3oSrWHBUk56Y2ZlayEBVGOHgquwcR71qm+tkY1jMI8Y2h+vF7
UgKYqVuAdN1G0Co5KSWldl0mzY5ODkq2iVzQDsKM0PpwT+mQRJMYo2O3cAQqhFDX
JiY+R9pB5bmIRIJ6v333FwRwvx8I93UaPWNRi1OBl3II/7jYoxiEkNyK2EAc4zhP
I9EhksTv79EAH0jqibpFkVL/HK92OQ==
=wBT9
-----END PGP SIGNATURE-----

--c292jOMaxEiICJ7D--

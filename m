Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EC315D49;
	Tue,  8 Sep 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896967; cv=none; b=Z2FEKx+rpiKSRK0w/iqq+EMevADzpddPezyPP1vJYav1UHwzUKwVV9nuel/p1W6DFe1TV/FcOGxtFbBTv4IkjbVyJpCGHSMHIUMozArZJ6PYP+NatnNSPMSv+5Mv3k0525hjHB17aES3ouOgAByAzsFZniQKvvrLFM6I6Xlt/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896967; c=relaxed/simple;
	bh=rgJSUYHlkcErCbXk0bwy8oX8d3IsA4cgNJZC9Ka8Xxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwyd7RZpOIwfJVIX2dgju7XsNKnyNBJSiKu4+cgyNUb76WpoIRnRHARuP3VJ/5QM10zlfvH3Vu6dW0Pg2/dNNQto4lo7W+9Va/asZXDYtlznKPovoUFCDQwTDslTkUCiLna1vDuMLKTR35XhHRqOaS8J1Rg9lc2Zqs9HWsk4Nr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/kn2Qh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/kn2Qh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF441F00A3E;
	Tue,  8 Sep 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788896966;
	bh=293efd8OkQdYG7J7DoMlVzlrpU2pBJJ+Nskz7GcwtAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/kn2Qh3gwFEwIbq2y9bh/BbXhXeiDTimZQA4JLNxtzHWtkKxId0dPNeUQ9pesfg0
	 xPJLUAE5yqSW8PbgPRIo4xf5muFhsKq7SUDijDQt1xxdCnGseniesPt2ZjagxJf6vG
	 TTmOh+PUAF+4H9qjRqYEyS4GZtA7GiPLMsbkVN8SXpRaYDjx6xJaD4u0eXTzTidqe4
	 TqngR5h23VjOVOqflApuK81+/E362+eO+6+f9Fjms1bSfGk+yfHn+aP0vMUCC59jHK
	 YzXEjx0BF+UieqIO9GzUerSbJkSesGCNb32hDXprCdHt9yp37RYnIqHJhT8TzD+JZL
	 1mVAaeVmT2D3g==
Date: Tue, 8 Sep 2026 20:49:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1iUwHh5skxVSU9mE"
Content-Disposition: inline
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com>
X-Cookie: The world is not octal despite DEC.


--1iUwHh5skxVSU9mE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 05:39:26PM +0530, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform, together with a dt-bindings
> header for QAIF DAI and AIF interface IDs.

> +  clocks:
> +    minItems: 5
> +    maxItems: 9
> +
> +  clock-names:
> +    description:
> +      The first five clocks are always required. Any further entries are the
> +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting from
> +      AIF interface 0 for as many serial AIF interfaces as the board uses.
> +    minItems: 5
> +    items:
> +      - const: lpass_config
> +      - const: lpass_core_axim
> +      - const: aud_dma
> +      - const: aud_dma_mem
> +      - const: bus
> +      - const: aif_if0_ibit
> +      - const: aif_if1_ibit
> +      - const: aif_if2_ibit
> +      - const: aif_if3_ibit

The driver doesn't request any of these clocks as optional, are they
really optional?  Probably easier to make them all mandatory and then
relax later if they can genuinely be optional.

--1iUwHh5skxVSU9mE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgZr8ACgkQJNaLcl1U
h9ClzAf/QWVhtZS3ZaMtJZ40O7yfH+/b/o0694RXmc5cGMnZOgD5VD5PfYBEkPqb
DiaK8QaNMuJ26XPFceZNUjQx5oSpCEvevSvfu7CYRpBYeIK9ZLJfmRHZaaxe1/AO
e+sCvYNmTAIojD7ew5Uz88Hfj4dlDj2ZwikTmj+XYJdcl02OhsIMbp+0cLRmGxJ8
aQ+DUah7g0qp4cnF6FDYZ9bnQMp3eAZXMZ5zyzcvrbR1NvCDSs4IW55nc+y5vzGa
TOAAn+ZXsoPVsD/PB5yL0Ngo0lxAdtDSDWgcreV7htVJzkhuFZFGrNIoF3mxXhb/
d3i/SnHrqp95071rlPrSQ6ebWZQYPA==
=ysw+
-----END PGP SIGNATURE-----

--1iUwHh5skxVSU9mE--

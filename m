Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF65568FCA;
	Tue,  8 Sep 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897257; cv=none; b=PKXX1TwZQv+I1jkqXewSxfvXujZjszN5uuA7sU2edqqTL1ku77caDYxyU9jQSq4ipmri0x8ytG1GoWfpD6pyF/IgZhnpYY1dNFOtLrfiLK94jKpiSyrwGb80ZwQnfUT1GJoWexOftK4+G5eYyEYHDhLVH+PMV1NS8g+u1N8TfNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897257; c=relaxed/simple;
	bh=r6iL8ELqsmiTu5om7d2qrMatsi6x/FM3xADBBjqseUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN71gFhxyTnFqNXYMOjNbrb0adPIyijGppPFf8MQQOoi3LbzN44v/5yFor9yqqVboXfQ6xGcDUiZs+OXCHFmzLqgvJntqTeqBRwXBb/8LEpMpLfxJAmyzlURrM9oj3S6bh7yV/opw/QKxYspHILowxUEVdFGKSZFIilNnXAxXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKCj8rfj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKCj8rfj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85801F00A3A;
	Tue,  8 Sep 2026 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897256;
	bh=PDUXNiEVNeBnSzhK8gGUjhQ7dxK5w69wRZKzTskX+QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKCj8rfjkVDSyA7Xo2RbbGRWQdNrqiwG/MNrZyrkI0ebzaG201CYgOFQS6Li3WsBP
	 ateGXu/b2CtB/qbVzfxYLj5TP+O1sG5lIU1fS9QniKiF4nEb2EJ92gBgmh8VH6wCOS
	 35aSkpRgG+F0Hr52H1K6xjLYEDzc1yqkZf8j2l8Xp55ikKXEyPFIRMCiRmGkxPCrid
	 23Uq7mFQeUp9KToO8BvjqFlHfKlYHpd8hGW1mQeXhuk4pwCIZc1M/NChI1NOsY8dd/
	 F2ZmpC3e3jOGETAkt7L1whsexdo7Qcp+7gXxWL7TX3PU+fCM/Ew/kBSF/4vX7xkM14
	 FjRR5owhluUGA==
Date: Tue, 8 Sep 2026 20:54:10 +0100
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
Subject: Re: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Message-ID: <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="neULH4pMwo+5JkXC"
Content-Disposition: inline
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
X-Cookie: The world is not octal despite DEC.


--neULH4pMwo+5JkXC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 05:39:25PM +0530, Harendra Gautam wrote:
> This series introduces the Qualcomm Audio Interface (QAIF) driver for
> the Shikra audio platform.

>   qaif-platform.c: PCM platform component. Handles DMA buffer allocation
>   (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
>   pointer/mmap/copy), table-driven two-level IRQ dispatch with
>   period-elapsed notification, and component suspend/resume across power
>   collapse.

I didn't notice the suspend/resume support in the series?

--neULH4pMwo+5JkXC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgZ+EACgkQJNaLcl1U
h9A5fAf8C1o3YWCBTxV6dSvy5g9u9Q3mYD4jWiCpACfXRsbL+wfuv1jIPjQADaEu
Gs6dfOnIES66sBA6Fq+6y5KtBrV5fHP5xYerb7lQQtddLVMo0Y1bA0Tps8gqUaMi
R/4Y4Ai8o++rl7LpsCCRziA1gSTZrPGEtWqsc91YO/XBUbNpwWRDYSjrD3PsydZP
0ngTV3QTqPJ9vRyPRBpqQo1NXq5sPsLNRXVl+jKyMeUQ6+fL7q3myKqPV4qYpxPk
KPKxbsau23iF2LR+yFxyXhEjZ1LNRqK6Wvo8oTfpXppW8QXrZyjdrE6PsEAr3fWk
tyc6HnTMiYuAY1QeM3YeUhWDonGMKg==
=fLZ8
-----END PGP SIGNATURE-----

--neULH4pMwo+5JkXC--

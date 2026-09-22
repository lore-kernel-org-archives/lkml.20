Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6C39FCBF;
	Tue, 22 Sep 2026 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083952; cv=none; b=VY/I9on28uJr8f2DzuELUKv7nUolz+t1X36LbbKY1wYEN9zoundHKXUMlJmKpv6fRe2P5ptgBtbA3vAwfd192QnSd9YuLpjM4jLQzHh8rkKUNytB0x9bUjiiZ9xSRbHCRTd9EY9ZOD1HJkpdfV/kkWmHsnJc+1/wy8zhJ5GsYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083952; c=relaxed/simple;
	bh=LYo9expeQU1cCwYwOhTDwbg03nk/lQdkP6k+S5qLDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCtp5rrd/Pl8DOycBzkfhJfZu3pDolkov/Z5a6FzjNBDVGqT6hIWuZAY3IJ1N1HOHY8A160J+/w269BrlMnakcN+DNy1vezqIKj+Fvs1WKhxH7IiA6DM6arrOe89AtEPygAzuhVWzCl0Vg5SwtbAObvED9ZjPxJBeLWHGIAfrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+hVf59p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+hVf59p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7051F000FF;
	Tue, 22 Sep 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083951;
	bh=P8U0LLjZbP/ePMrZWC1I+4FguivqM7VnbYyMmDfijc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+hVf59p3DbX3eT/fHbsgXUkOVlKotpbEIQ31NTnRI+eLAx32MIL6CELAEIQsIerW
	 RabJ/p++KAAjRUssGmtUPpSvUNaIEeZoj3LpZJV8lwataAlv1JUds9DQsne1vf/bR7
	 YfOQ/VvXDjwmyPFFSuBO4l3EVraMFCCMMjdd4YOH4DDCN1nZD6aK100cZzCTzZO9TV
	 7MuOoUjQYUyj+oTpusc2zxMjKrPD9Una4IjDZb+56yC2SJewp5nwn48/61/fKOPLNK
	 0ylkrib0mGnZNR9BJm0A2qNJFyp6hj5WJfn7ZoonTom9SCISVtJPD9+BHirD3eqfa6
	 X8bvTmb4/CXXg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CE3861AC56C0; Tue, 22 Sep 2026 14:32:27 +0100 (BST)
Date: Tue, 22 Sep 2026 15:32:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
Message-ID: <arKDa69Aggoo32CE@sirena.co.uk>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V0vWP9UJNZF+i9I8"
Content-Disposition: inline
In-Reply-To: <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--V0vWP9UJNZF+i9I8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 02:19:06PM +0100, Srinivas Kandagatla wrote:
> The SDCA class driver is useful on non-ACPI platforms where the
> topology is supplied statically via sdca_class_hw_ops.get_function_data.

>  config SND_SOC_SDCA
>  	tristate "SDCA core support"
> -	depends on ACPI
>  	select AUXILIARY_BUS
>  	help
>  	  This option enables support for the MIPI SoundWire Device
> -	  Class for Audio (SDCA).
> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
> +	  via sdca_class_hw_ops.populate_function.

  $ git grep sdca_class_hw_ops
  $

--V0vWP9UJNZF+i9I8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyg2oACgkQJNaLcl1U
h9Bn/wf+OmRIs8u+VImvndxMDXckfSRECvmzvcGfxvXZ0gANIESYzRGy/mreuWYJ
YpsQi5RX8nhaIH2KgUfUMInfAceUHPf0L4uf9HNrqWJNbwEjzJR4hEKYEvBI1Wpt
dYuzGEfmCentFIlNEHuYtSLn5TrRtFayhk+dVh0b2pIw1SHcpoFNZYXT2l9a9I9X
5k9MZDkM+MdHwHxmuvxrmRlIqgKABPBv618RoSXWPBUjtj4fvXAnJwBvvMmupb80
Z90JXqwq7yL/JlQ6MsxvIIVRrKCgKZEaJf9iZ8wEhPkHN7ow5HpvjPUUWminfMIB
jrZVM9ZVZU0EtnIKaE1SmrRg/XFA0A==
=uwPS
-----END PGP SIGNATURE-----

--V0vWP9UJNZF+i9I8--

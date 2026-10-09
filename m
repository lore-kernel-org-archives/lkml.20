Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA263175A74;
	Fri,  9 Oct 2026 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560510; cv=none; b=oR0Vw4JVWMw+5GBgi6tJavJuS3sLGpJp1zvX7HuwOPBrX+Y8slIpMqbo1ZnnqADjb1mQ1lceuc2IN5eeyYLhZOb9ARXUV356+Ckp7Xc38SX7AL3jAPSftBTEO/ASs069PRz6eTvtQMThIGhM8tkc/v63OrIqhUrVq9U+Jn79Wek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560510; c=relaxed/simple;
	bh=dUWZmZOch5Qb4AzmbYv9GLjnStjLEJtXiqFclZadx5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkhRAF+MZUw+uUYgfBOsfkAM/80iCwA2pZrRj1a8XUI/ms5u3pACvS1Xyl2xIXa4dBxdWoKP+5aqGUdwrynFxjN/bSOT0IJR2J6H+bU4/DBrRTkeM0nPIv1L6Pxnj6A7KtxMAP1FgM27iosYehQtbwPlrskCJJBP9gMexMSlmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDsIToSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDsIToSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021F51F000FF;
	Fri,  9 Oct 2026 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560509;
	bh=m7+KzHXqKWMyDE/8urLgeEGgBfz4aMSR0uxlEDv1yNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDsIToSKhlKo1OKsP5MwpHPGh84Kvc1vLzR6nGW7O8qXWJpXHoDSLMw0IuYjsUMc/
	 fYtdZ3u6P1zcTjGs0IiM3FJauq/x/+6jJr7veGtiyOjNhgA1W2XDvXqJ6Nu8YyT5mM
	 BbzH6VWCwycy0pJiqpt3+K6/FmIo2Wt80f4voy3h7hU9H3UMDNwBAfj2MGfZTyYDq8
	 JUwxcTONqgf2btIozJnkFRwPEobSd396Am6c2zfnU2boR/cRVVsM9r4ogtzOzf6j5Z
	 eXW76I+F94BFSiuwyFLNGKbjj+K7rwTqMQQLMkxEX1KNjYgGT14aDUEkdu9o7vAO/i
	 yr8fp8Z4mUuWg==
Date: Fri, 9 Oct 2026 10:41:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM
 controller
Message-ID: <179156050784.2261655.11183119560977756251.robh@kernel.org>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
 <20261009111334.23522-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009111334.23522-2-ansuelsmth@gmail.com>


On Fri, 09 Oct 2026 13:13:31 +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 MHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.
> 
> Document the related compatible and required interrupt/reset and provide an
> example for it.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


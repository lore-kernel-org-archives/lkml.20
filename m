Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481860;
	b=Yo73ZAx1YaksqtSlKUIEli37bQwpzG4kUbyGTn6/u8zCSWQPz5q0b6WQnynGWLChdV2G
	 BOtecgL5ZQjWRpyJ8JjgVruNjSgqbKcYty8+OeFjg46TOXfIPCTefTs6BGRsLofMCH8b8
	 pK8kB9lN5heZG52HmFidlBNzMLvKCTDetziOYF3tECqm7LBItwZbD+FxST/Hwrt1OeFow
	 VHMqSTEqYPgHTp+57J6R/sRNJSFL9F3IOEaNxZrLx2BGfUkyrBea+Rvq7vvTDnHsyEDR2
	 BXpv+o4EH5QyP0wR2J5P0gc6HJQUp9Ky0WRLb3jVmpi6DotgBdx/XutJKu6xInl+eTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481860;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ektZNdoDRs4nbYgB95A+evTohYyvZ+c3ZHsun85mrNk=;
	b=fFbRzDMMJc4iT5yGBO3XjFc329NGqrwPv9Y0MZKuVFRKdqqg6F8a9raUSdVNFX2zaoyD
	 WkICPLiS4g7pEAF2gyY9p/2tMT8ef2ZomIS2aZANJKZadEFQ4rAuQim6RHvBc004O67X4
	 u14oLznBH+XxGpLBZ4UVFMD9AmqCBhCwO1BQTavWebpi+xLuvRs+b5Mv91au6RE0Kbo3n
	 10ILRTWFsKibVSEaZnbtkMw+febivwMMx8gjMNw48eb7rgMvBUp/wcHJfy505D3RzEiye
	 xyTUEtRmws6cxQJCL1EbEryyTRXOyHejqzHrUq2oY5tzeNuIWM8AQEfjz3rPu+0Q9Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwtDVxcr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825A606A31C;
	Thu, 12 Nov 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwtDVxcr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182F21F00A05;
	Thu, 12 Nov 2026 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481859;
	bh=ektZNdoDRs4nbYgB95A+evTohYyvZ+c3ZHsun85mrNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BwtDVxcrJDfKDI+sNi5mUcOqiYck2I0tcD04KbCSmrlsFNsp8iy2H0NSgZfTs6nQL
	 UqhE0LLuBc4NGVQX5rq7sxaVHvir0+MGbNrfZ81U2xeent/FHcvng2rTPmxY4Z5RDL
	 cnDV9KWGV1fef1OllxITvJDrlN2i0eW4mpFyo2Td1oZp9h8ec11zAf0YDaAMcDRxr7
	 cNcG3ZLa5Awm2hhqOabCa0RQEC0Z8TXy4zEZkeXUl8PweS+LCVK+YOorDmkVVOFKIs
	 nZMkj65GTyc+wJwnWv+VPH+/lI1eC3bFtaq0ikhgar2blqlEQ8LXOcRPEDZBWYYNrI
	 c198QFJyWiJ7A==
Date: Thu, 12 Nov 2026 12:10:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Purism Kernel Team <kernel@puri.sm>, Vincent Cloutier <vincent@cloutier.co>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add Samsung S5K3L6 image
 sensor
Message-ID: <20261112-dainty-groovy-jaguar-7cdd26@quoll>
References: <20261112004636.739749-1-vincent.cloutier@icloud.com>
 <20261112004636.739749-2-vincent.cloutier@icloud.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112004636.739749-2-vincent.cloutier@icloud.com>

On Wed, Nov 11, 2026 at 07:46:34PM -0500, Vincent Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
> 
> Add a devicetree binding for the Samsung S5K3L6 13MP raw Bayer image
> sensor.
> 
> Describe the validated two-lane MIPI CSI-2 configuration used by the
> Librem 5 rear camera, including its supplies, input clock, reset GPIO and
> three link frequencies. Require the endpoint and reset GPIO: the driver
> uses hardware reset to stop the sensor if an I2C standby write fails.
> 
> Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
> Assisted-by: OpenCode:GPT-6.1 Sol

Drop tag. Also, your SoB is supposed to be the last one.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  .../bindings/media/i2c/samsung,s5k3l6.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> new file mode 100644
> index 000000000000..097593d74780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3l6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5K3L6 13MP MIPI CSI-2 image sensor
> +
> +maintainers:
> +  - Vincent Cloutier <vincent@cloutier.co>
> +
> +description: |-

Drop |-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


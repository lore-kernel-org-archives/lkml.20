Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BE4BD7B0;
	Thu, 17 Sep 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640026; cv=none; b=F08Lb6jwJHs/NmzUoPTQlsLoIEEgRpkd+8ptoBfQFC7iiMYLV7fifH7IUuerLAMki0DW4lsG/5XbYQ0KUKfO0pFVJgmhaEAnyi6NOeGJRFQ/dQx3jma0Ye3y10IFRBfQ5ghSFQWpsC7DTSQ8SOpPtsKJrA4hrxFl3lttiLvCItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640026; c=relaxed/simple;
	bh=yuErPhKSr7sh5YlKsqXl4PXpDwrpX1j/k8mQCU+N3A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdZ92b5LB0nLiQbaPacmZc4uf+nrZ70CxHa7yKX5daBaICLlHC9LY3rSTUzXnaPWF81JipMCqhBtgZxACutGkxS042yOpMTyyqEEVtdHv5dasAGQs1SZ50H093V+ic3pnshmcQk52FlsIx/rXU4QoPTjOSiUUxTn4A3B9NA5AY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qr1rZaJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qr1rZaJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6DC1F000FF;
	Thu, 17 Sep 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640016;
	bh=H81DEbDxFcyHG7e2r8ZlV1Yo/9mUgbCnoe7Jl41GgiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qr1rZaJu3Bk1xtTc/RgIPugDRauTakW8fofbeDzRR+WI9A2hZpFhIhn5ypFHvZTz+
	 1W3Vp/pHSLtwb8+WkRAe/5aPDSHoUJfWc7MhpcCfa+PoyWEsCMxGx6j/kNRIymqmMD
	 6CPJeW4gN2pqPmB7GNuU/UKBi1iZjUUxFz7UhUwneYQcCggGVGNxFoBvRxXZIJroyq
	 xOnn4hCq1b53aIHz0To0sXz9FuJLy3sSY9RLQFx3T9qwD1RaIOGKS2HdXnbdZqqs+s
	 LhnUGVnA4wQhFi1NEbfub0IexGnfzcamvXkanrf7SYTNYIbLZOxNB4GGZ7sXRBNuCC
	 jaoqPEWjWX+1A==
Date: Thu, 17 Sep 2026 12:13:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
Message-ID: <20260917-active-strong-emu-bf8fbd@quoll>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
> platform.
> 
> The Nord platform provides:
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 10 x CSID Lite
> - 3 x VFE (Video Front End)
> - 10 x VFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>  1 file changed, 393 insertions(+)

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

...

> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +

Missing supplies, altough maybe this is related to some other ongoing
work, so would be useful to see explanation in commit msg.

Best regards,
Krzysztof


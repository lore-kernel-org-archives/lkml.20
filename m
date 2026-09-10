Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB283C945A;
	Thu, 10 Sep 2026 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024923; cv=none; b=r32IaPshRVTDt235PWy5nAtzemoTVwqMckWYR2G/mgJk9eTGM73mta81bTYisO/XyZgAfvflLNlzvCSh1D/WNy0YySt2Tp9Vx77jEOIP/9oBjVVQeAVex+FO783AonBsrKnz0sMJ5J9AFAzEBnXX5X7LPkNjqHMHpWY0cn8hG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024923; c=relaxed/simple;
	bh=rRmLKo9/YgoHQSBeZM/OKHlc7x2H88moFKuFpc1Bqwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiZWZmdeMqIZOxDZNiiU8uRxYwk56d9L2HxtMKvMy46TAwudJZr7RbZ0FPRaiUB94p5a6MzX0UpufENlgBYvV2P8i/sBBdDImWjxsgzDbZGBSkUnUPg5sY+IYO5fX+Xh6Gs4ozj5Bh9UaHnN2QUQXshGQXTG2iBZxcOeVWcrMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntfdPzs9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntfdPzs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE35E1F000FF;
	Thu, 10 Sep 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789024921;
	bh=DnBf1HbHap733x3IxD/CH2nO9ibXQfvh68wZr7MEKEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ntfdPzs92az/FrLSRYER+tJYZDlutnj9QoDzY9V2qeYvL2ELW/vV1dxE0r7LEwK5h
	 kJ5s6/ImHs4zEb+CQWb909C5ho1vb1Zf9Tj6eSJyASwjXBgQ4vYKeX1tAja7nA3DtG
	 7N+VsJ///2QkQIzPUaJ++4beVOH49qsHCIOiq0bRjWwrHgMSaboYXHRQVxsZ//Ua4U
	 zGecndOkvpscBFJ8oRUvNfSy1J6N8CtQL5xBM+yDfzZaQE6ejx6uvy2MCOPKfShe2m
	 j2WYpl4/s7YfrkFsywIBz68FUcC1SLiNnINIquxng+mopALmxcrrJNZxNz78kYNWcV
	 Tp72FsNJSwKGA==
Date: Thu, 10 Sep 2026 09:21:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Message-ID: <20260910-enlightened-charming-antelope-a812da@quoll>
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>

On Thu, Sep 03, 2026 at 09:44:33PM +0100, Bryan O'Donoghue wrote:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +                description:
> +                  Data lane positions following this endpoint's clock
> +                  lane. Positions are a per-port logical numbering, not
> +                  package pad or ball positions.
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3
> +                    data-lanes:
> +                      items:
> +                        - const: 4
> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0

So endpoint@0 has a fixed clock-lanes? Then the property is redundant
and you can completely drop it.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1

Best regards,
Krzysztof


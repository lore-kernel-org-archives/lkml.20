Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788397;
	b=SEhHh9QWs8jqPkb/0I7mPh9JFpGjUZBLFYZGw5bYD3PrvYR+VAitZxEb7agWRb2XSyi0
	 FPZTs+aONw2ddHW+SfB/aOkgS/NCuEUaJZGo9lDtp9YF4I+hmhw2B3Cb/ZjImeLdd06M9
	 OsfvEHd0Yh7cwMaiBtVwR4dh/FIBbsLV10dexku4AD4MXW10PKcrR3GmM0BIso7emvnJr
	 PnwbUPix7NIsdrHBVULuSKIBD5RKChPY7Qbkj7yFqY/5+DsLZQubxlACDThG9cxLVyitt
	 GSwplg5B72sOLIo2Se3YykbIMIWowup07zRw3LgmszKx16SlflQtB6V+lVfqBSEDZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=u/eDtZS4wjn/U8MG+7DwL0ZWK1x555IP9HVQv9HwObk=;
	b=0vjIiPdxtl7AQKnayYKcPskfsR9oKLu4bXxOs5I07TZgBBTfBM/hmhjxKUvC3hazC9g/
	 zkVx5TpoUeirnax59UYqgHXu8H2MDnpB7T6FRyUPTVmE7UKKihQHTBrmwHNJoqR1eMskR
	 FMLixh1Ky8fclb3uO5WFySQeqeOen6LlvvgM1pexJ1obh8UOV+XKBdq+wz+69fqLKpAYH
	 t1cFNt2cX6INj9uZ03lJy/zP0RtShR1uWRT2anBboAWntKPjHzWR9PqOZQXAXm9j865EK
	 BITay6P5JD0N3L76Ui0veVjUY1tnNUEzqW5xpJjSzNS/iGATiGxBQSaIIDdZ2CWF09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i/Ilhiu8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79053606A31B;
	Wed,  4 Nov 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i/Ilhiu8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FB41F000C1;
	Wed,  4 Nov 2026 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788397;
	bh=u/eDtZS4wjn/U8MG+7DwL0ZWK1x555IP9HVQv9HwObk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/Ilhiu8gSErW8FsASyqWzyY0c3ig2W+mB2luw9OtSy5tq+qToMpYsWzLxP4f7IsD
	 HolPhDqS/pwnVDrQAeSfwbJ1bzZ+thF15O+7uP3exotVOTQ523IacKlx6zwxvtBcJc
	 pDKaIGByIbr8IN1x9Xw03+euuyAvLJWrqrSkOOdvdiUTwVx9xfNhgpAvmNcqRcxLMK
	 o7GO4HqYbErZg6infRCme3H4ZteFZUAcqkCAM4ZBs5WDWmUTOfxTJDpzvFhKLL7uZT
	 vzbIP3AHJVj0o005andcJU+1uHHMEcVrRL80WKUL6WUvYN1cXhbm6r3m8kVofes/bC
	 IGkSfYE8qKQEg==
Date: Wed, 4 Nov 2026 11:33:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261104-grateful-chivalrous-cougar-ebe4ff@quoll>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
 <20261103074913.1971025-2-hongliang.yang@cixtech.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261103074913.1971025-2-hongliang.yang@cixtech.com>

On Tue, Nov 03, 2026 at 07:49:20AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> +patternProperties:
> +  "^usb-port@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A single USB3 PHY port/lane.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"

Why do you need this node in the first place? Parent is the phy provider, n=
o?

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#address-cells"
> +  - "#size-cells"

Best regards,
Krzysztof


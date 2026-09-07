Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41D3AE199;
	Mon,  7 Sep 2026 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762962; cv=none; b=fB/gk8A+OA6TP63olzh3XFxs8r01GDBNP6EvWLc23BVNk6OpnfiaWMkr+dwDJdIBaWGoUA8zrHTiDIZyBBCx8sQuAWNLpBuXtK86UqJx5ro9w+sLOg/SC/HNee+KQc8ihhjPfJAtiKEDWwew3RbcydYFRFrjpi6pk0Z1BkIXdpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762962; c=relaxed/simple;
	bh=mpk5OUehbNbX13Xb5bamR/Zu6Vh1HfAfNWLYjNiSiRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7EGafEtyMVxjYF9L2+10Yv/7jYh63oci5++H1jluLuEDHRshIzCLjscNMlmunT66dQcdOR/9KYpbLYWJVgYL8XL1nKN8OQEicca/6lub7yzINe8OjpKNp67VrATpoSZlbQ2tyzzgy070oaR01tIxk26sRco30tvqiEcGu4cqCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSHN7SMH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSHN7SMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079421F00A3A;
	Mon,  7 Sep 2026 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788762961;
	bh=fvYKRdXxIGC3gy/lhw4VnS34/hd+ivtyb/2EWm1V8Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSHN7SMHPq7Wpbhq6EU5r5WynaR3/sBBwSlL6DZ9U85zSoDb3zIwiO0Mmsa888Z4N
	 fZQF1IUdtIHE7YKI7CpTSwOR5Q8R3/TmZOiOFo9ZOGzJul74TkqVla8sD0ws6E0xCE
	 Re94OsrUP7YeD0qCb0Owo6DyQw7SAaq64K7gQ4ZY2cGu7QkBoDo0ct+uOIJeu/ACBk
	 uBepBNND6vZlTtGxYDqQEajdcXx/U3D0wWUgw/e3lZ+QAe9i4jA21ohLc+NrUTnBgE
	 o2v71tkKF4Frvekl/0A8eeUof//byOUIjIRQCP89w45Zhzuui2VmsaoYk4eUGGjiiz
	 bPh/vkPH37g7g==
Date: Mon, 7 Sep 2026 08:35:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
Message-ID: <20260907-auspicious-liberal-raccoon-bd7a81@quoll>
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901123933.15388-2-ansuelsmth@gmail.com>

On Tue, Sep 01, 2026 at 02:39:31PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> new file mode 100644
> index 000000000000..f1a5d83e8968
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7583 SoC USB PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
> +
> +  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> +  mode currently configured on the system for the relevant USB port.
> +
> +  On Airoha AN7583 there is an unified PHY implementation where a single
> +  PHY provide support for both the 2 USB 2.0 port and
> +  optionally one 3.0 USB.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7583-usb-phy
> +
> +  reg:
> +    items:
> +      - description: phy register
> +      - description: ana register
> +      - description: pma register
> +      - description: dig register

"registers"

> +
> +  reg-names:
> +    items:
> +      - const: phy
> +      - const: ana
> +      - const: pma
> +      - const: dig
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  usb3-phy:
> +    type: object
> +
> +    properties:
> +      phys:
> +        items:
> +          - description: phandle to Serdes PHY
> +
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1
> +
> +    required:
> +      - phys
> +      - '#phy-cells'
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  '^usb2-phy@[0-9a-f]+$':

You should not mix MMIO and non-MMIO children. Either children have
distinctive addressing, or not. Not both.

The other problem is that your children have no resources, so are not
really distinctive children and should be folded in to the parent.

I already asked that at v2, so let's finish with asking: drop the
children.

Best regards,
Krzysztof


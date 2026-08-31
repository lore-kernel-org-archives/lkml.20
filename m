Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF63A6B67;
	Mon, 31 Aug 2026 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202775; cv=none; b=ko+VLOQBzZ6S5zp/jJakANdYGIDjP/yteoYs4Xe+XXk+hgkxFC6KLwdDf3Ks0eUAbDRZ3doW2K2ueT7LDe70OGi93x2Ubba5aOYcGEs4cagCfPC1fpSO93j/Pruh8pjDo3L/mTA4w8CnjRrmMp8Syi7Dh5K7iwLNNvliBmo7gXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202775; c=relaxed/simple;
	bh=VDU4F8Mk+k2p3r9T1suGoRC3Eu89siA3IUMCsaNL/rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN1kLBerobt6vL1AEwo2OyiG8xqjEr5ugOXbRqaXfilU5bFE02qXYw3YoQbbuS6hB8NL/YPqUNqa+Ub/OnJ9BXzL7LAYM42YpCfppUXHedgo2MvFFfl75Ppy5bdS1la9NKLcbasUziEbQDA6hPbVzsWsnDnTbu+Vj6DheJyxEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ndixk7wL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ndixk7wL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD371F000E9;
	Mon, 31 Aug 2026 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202773;
	bh=9h9f4egroVHXOkCH/bF4osumxuil4xiCtT1M5bdwfPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ndixk7wLCgrS3AfH4roAaSWyjpt6ufvFGCl1XMdBSSX4QPgVizjQANmqjZZy9qBfQ
	 O76D+5jcGxlF6hqPgJuowvhyVEMK7OXT8uqs3uVVBqtnv1itOgJQbghQsPdJDk8GOW
	 aRcwtd3BEYCn41BEygTvNM9xOkvC64yit+QYGXy+H5eHhcLtQa8g4G1y0YLa0Sehk3
	 zi3BVKpPetNI1o+oFq8XyUPfhhHuxgvPnUh0X09rSMJ3+G427abmKAp4Oy+NgV/6KR
	 xKEBlrwIsWTqOMGlbdLlUba/pXs0TTfYcaqbk5gDD3oR7tm5GtxTuVWWTRD7ZYMGY6
	 9TQALswYWSgiA==
Date: Mon, 31 Aug 2026 13:59:33 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
	Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <20260831185933.GA1042786-robh@kernel.org>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
 <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>

On Mon, Aug 31, 2026 at 08:15:35PM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 84 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> index 000000000000..dd73b62357ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Keystone Device State Control
> +
> +maintainers:
> +  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> +
> +description:
> +  The Keystone II devices have a set of registers that are used to control the
> +  status of its peripherals. This node is intended to allow access to this
> +  functionality.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,keystone-devctrl
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP GPIO controller

       required:
         - compatible

And on the other 2 child nodes.

> +
> +  "^interrupt-controller@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP to ARM interrupt controller
> +
> +  "^reset-controller@[0-9a-f]+$":
> +    type: object
> +    description: Keystone reset controller

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19648AE38;
	Mon, 19 Oct 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394220; cv=none; b=n3/CB6MJ00r6lI9Z5jfZ5C9hFIH9bU8RytKpVyQj0U71TuLzbw5lwrMS6hx+j4WHG2tAIieBMx0WoFMhgnZuN4uQgVcCulOW62fZibjTzx5FV2L4YZvoxlCstTx3hz1NLcudIkF8Yn9/ODPxB4nYqD5+yZWFJ7TNxZlj0DSBOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394220; c=relaxed/simple;
	bh=AfVFm6EsnXsZblcJ2hFj5jURFfJ7w/y9DKZ45PS6VTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efAa9YT2aUuvjf6sQxk+7yy/a1f6OSZaKoPdk51uiZrlbapjalnsQ9zDshjaBhFLPLfha0yJ0UWipZjU0A9Yc6s23F5MATzGIssQ1omDez1aHtn/gD8H47vQyeYaZOMe1Gf4/bQuKxILSid/zSsO5DWEABVfM+87t1ivNa0bWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkRw5jts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkRw5jts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D903C1F000C4;
	Mon, 19 Oct 2026 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394218;
	bh=XYSVoR0LXdlVmOJW7CQxG2dIDUVuom9NuxitFvzPwok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gkRw5jtsxd4oI1yI9mEulsBWR+qyfg3uNXIDAbhNA1Yf3HrJBo0Rv8iq/jsTKXsGg
	 Hoq1MhocawIEWn2GMJ+DeqcH/OFJ3+N2ZSpHFLW67Jrf43Dj8AOcpskunZN3+y1zjZ
	 XK6IDjzr5stKZ+CfdetfV2LlBZDPn60MZDarA3Mi9L9Y6fysx6hWWtcLvbV1as+me1
	 0jLAJ1WVhsiKXeEy1WptjwxEhRFCwjnNLQj3GlHaIHDb3KeO+obaoLX04o5pBHxFNr
	 YLaSaQPH9JOojXs5JTiRDPJ1ZXfRHKITviD25XEgjn2l/l8ATiIYyBZFtX0hnFGyYi
	 omtTMeK+mULVQ==
Date: Mon, 19 Oct 2026 09:16:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
Message-ID: <20261019-ninja-velociraptor-of-gallantry-2efa3c@quoll>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 04:54:57PM -0700, Anusha Arun Nandi wrote:
> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
> PHY, modelled as a standalone generic-PHY provider like the existing
> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
> common PHY framework instead of driving it in-line.

A nit, subject: drop second/last, redundant "schema". The
"dt-bindings" prefix is already stating that these are schemas.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Follows the qcom,x1e80100-csi2-phy schema's shape: a ports/port@0
> sensor-input endpoint carrying data-lanes/bus-type (D-PHY only for
> now, C-PHY bus-type value is accepted by the schema but wired up by a
> companion series), a port@1 CSID output, and a mandatory
> operating-points-v2 table plus power-domains/power-domain-names.
> 
> Unlike x1e80100, SA8775P's CSIPHY has a single power-domain: the
> Titan Top GDSC, matching the legacy in-tree CAMSS driver's
> sa8775p_resources.pd_name = "top" (drivers/media/platform/qcom/camss/
> camss.c) and the existing lemans.dtsi camss node's power-domains =
> <&camcc CAM_CC_TITAN_TOP_GDSC>. It is not OPP-scaled, only kept
> enabled, the same way x1e80100's own "top" domain is.
> 
> The PHY takes three clocks (core, timer and the shared CSID CSIPHY RX
> clock) and the vdda-phy/vdda-pll supplies. The core/timer naming
> matches x1e80100's clock-names convention for the same pair of
> clocks.
> 
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> new file mode 100644
> index 000000000000..b66ec2f14189
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8775P CSI2 PHY
> +
> +maintainers:
> +  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
> +  CSI Decoder on the SA8775P SoC.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: csiphy_rx

You just named it basde on clock name. Instead, name it based on the
input name. csiphy is also completely redundant.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +
> +  vdda-phy-supply:
> +    description: Phandle to PHY supply.
> +
> +  vdda-pll-supply:
> +    description: Phandle to PLL supply.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. A single sensor is described by a single endpoint
> +          with one to four data lanes, numbered 1-4. The clock lane is
> +          position 0.
> +
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@0)?$":

so not a pattern really and just endpoint.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +                default: 4
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
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    csiphy0: csiphy@ac9c000 {

Drop unused label

git grep csiphy@

Don't come with own style.

Best regards,
Krzysztof


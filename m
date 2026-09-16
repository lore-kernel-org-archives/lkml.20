Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0447DD7C;
	Wed, 16 Sep 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549010; cv=pass; b=ix1Y1BQT6O+kHPj1h9w2AAoV+AtN3obgHlhn3IFP6w7XjBTFsgdCUUH2YsMYiI3I6SFR992QOUVcWRl4+X8AgmIat1+LmemT0JG6UtB/2bWdmu9cYqnZZJlqI0IxQEUG56fbCxeBNL7exnrk6ZpRzWnjTgbkZ6r2z20sRoi+bG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549010; c=relaxed/simple;
	bh=XEv6d6bJdSTUPtUlJnfPrgdNMwC9r6COxl37Ji4f/v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMB38hMXrlupsrW1XyFzFebZnoUpQkiQd9eyJsfuzNFR+NPgd2Y6m/asn7SZn9D0fZsbNBLZoTkHOThQVi/X/HLpR7wLubn9x7JMwmBWo010sniBzGziY7Ow5pyCR6bMHJr1R94UQB7M9kG1C8FAC/Rep0Z5bO3fZJR4xVCDwc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=poD7HyNx; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="poD7HyNx"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hlCRd5PDgz49PxH;
	Wed, 16 Sep 2026 11:56:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789548990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezQiH4GI5x0B5Nn8vmUNZz5LEmTUvo5o5R80qIpMy20=;
	b=poD7HyNxO6VAFMS7x2lNSRmXgPgkTvuKmYliJRaxIjgDwQ/xHb64Isd94e3gJr0WQb57Ek
	0hgThyDUShn0TqAxB2bHjwvjprsYxyeTM8HR7xYdQpCGE6AKYFenml4tHsvEmLxe/LJYY5
	5lGMjjJSUwcLSkTcMsWfxiBd2USBcllbagAxL9c221T4KYLKL9Py+9pdB+Ecg1og2b9Tic
	P04wKbc0OGfeEo7faXynOpQ7lvXsfV/piE7gM6osRRF2Ka33iWg+rS3+mliFKaBqikYLdv
	5B2C1JmBLNzOY/PkjJRJpTgjY7io3YqfLtbRgJOuE+/N6n61M6ITwVekhLERJQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789548990;
	b=hiyBUYybyewFm5MAJvtYZMqY3TaZax+JtgmcubQJv8lSdZ/B592yiEFG7HOkXQP523x9Vo
	IUmuj7ssQ65ZWBhIUFk00pb8Pef6vxXkNBcXi+JCA2i/pPMV5ORDZxDMAVtnh9deJCUCTI
	7qBhjhFeMtDEFYuwchBXaNBfDNbab8k+eD3VLfLFcPxE3ZWAwf4DGuPcczXlZu59Vs0gKa
	P2/gRX1h4NlckjWuOHAQR/CHZqNGz9Ztx9opbTe5g/hEX3BR3jWsG1OhvRBCbzCQt3Zlr5
	iPiqf61GRxrmEz6wh93vT+hrz4Twmft0uooTYNoUVD+00WAlzHn6iSRB+h7PMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789548990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezQiH4GI5x0B5Nn8vmUNZz5LEmTUvo5o5R80qIpMy20=;
	b=u5c9gAAW1OBV7kdTpw26zgk3AAedsiTdq5l6SO78Xx7/mG+ZuNlVkKPJiGFHfJn4o6Jv/0
	evlNoI7fxTAYaRC/JcnjKPyMY8zPOkeb4paMl9y1aaPLodtilv+NUHObrVd0UcHsIy2tx3
	19ESkY7Ined9qpmBWw2ztVDPPYyIk+aXhnAxLO71HVOLtiXzut2yOXuiwRaIIKo2j5SKZR
	1UWz3swn84rVk992lvXVpLMIcJD3RouTTEKE1FzGUnwI+bh/5id3ea2AthOrCOuYftHmna
	SHbpQ2fXQuIlr58RZ/AGrcvNndaMykLDYqA/IvC45cfWvC208Ki8Y7lseCBCig==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C3C9E634C51;
	Wed, 16 Sep 2026 11:56:27 +0300 (EEST)
Date: Wed, 16 Sep 2026 11:56:27 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hermes.wu@ite.com.tw
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Message-ID: <aqpZuwSx3lPXCda6@valkosipuli.retiisi.eu>
References: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
 <20260720-upstream-it6625-it6626-v1-1-475912f74459@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-upstream-it6625-it6626-v1-1-475912f74459@ite.com.tw>

Hi Hermes,

Thanks for the set. I know the set has been merged already so could you
address the issues in follow-up patches, please?

On Mon, Jul 20, 2026 at 03:57:45PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
> MIPI CSI-2 bridge. The device exposes three graph ports: port@0
> (MIPI0) and port@1 (MIPI1) are the two selectable CSI-2 D-PHY/C-PHY
> outputs, and port@2 is the HDMI connector input. Only port@0 is
> required, since a board only needs to wire up as many of the bridge's
> outputs as it actually uses.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  .../devicetree/bindings/media/i2c/ite,it6625.yaml  | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..102af5dcb380b0ad2462c376e5a87b22d7296f14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ite,it6625.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6625/IT6626 HDMI to dual MIPI CSI-2 bridge
> +
> +maintainers:
> +  - Hermes Wu <Hermes.wu@ite.com.tw>
> +
> +description: |-
> +  The ITE IT6625 and IT6626 are HDMI to MIPI CSI-2 bridge devices.
> +  IT6625 supports an HDMI 2.0 input and converts it to one or two D-PHY CSI
> +  outputs, while IT6626 supports an HDMI 2.1 input and converts it to one or
> +  two C/D-PHY CSI outputs. The bridges are programmable through I2C and
> +  expose one HDMI input port and two selectable CSI-2 output ports. The
> +  bridge can operate in split mode or clone mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ite,it6625
> +      - ite,it6626
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      GPIO connected to the active-low reset line.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
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

If bus-type isn't required, a default need to be specified.

> +
> +              clock-noncontinuous: true
> +              link-frequencies: true
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI1
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
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

Ditto.

> +
> +              clock-noncontinuous: true
> +              link-frequencies: true
> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: HDMI connector input port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@4c {
> +        compatible = "ite,it6625";
> +        reg = <0x4c>;
> +
> +        reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            csi_out0: endpoint {
> +              remote-endpoint = <&csi2_rx0>;
> +              bus-type = <4>; /* MEDIA_BUS_TYPE_CSI2_DPHY */
> +              data-lanes = <1 2 3 4>;
> +            };
> +          };
> +        };
> +      };
> +    };
> 

-- 
Regards,

Sakari Ailus

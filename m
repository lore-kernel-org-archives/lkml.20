Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2D20B80B;
	Mon,  5 Oct 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187910; cv=none; b=uaRSwNceGp55/s4vsLRJavv4TEHaat1ejgXKl8bXy3fki9tc7pA3ZBAHafx6rKxosJoDvICFvaSs7G7MkWdL06lG1g9fG7bow6nEniqSpdOADouhq8BYGe+q5bsEI/CK6WyUizihHEYxLo2+inlSHArXVaZ2e+6FLgyKUbOjSlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187910; c=relaxed/simple;
	bh=st/qLCL/giY4pL8SWRU1yd5Jt5UqpGSnlFcz4M4mP7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW3xQ3SluLYTsZhcFba5beH9/iE5rjyLIX4STi0WUXMOFFGBU80hg39SFDV6CkMdIni8WhekPwH89f6R6s3T/aE3wO9VaJzlp45H6EKa2z+QV8wm7ojw4mUbIpgLOw3oIQ9axmF36u5zH/uzSPbq6VHbsDBpCm+6uU3O7x4p/kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJtb+AYT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJtb+AYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791187909; x=1822723909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=st/qLCL/giY4pL8SWRU1yd5Jt5UqpGSnlFcz4M4mP7o=;
  b=RJtb+AYTBCDJz0PKp4ubB/d8dJ3VTsGiK0m/n/fJKGofJGBnbxac1UEo
   emRzSOWnj5q+QM7Dzx2deNsVNBQ3DiepiIB2/fYP49FXgZuwtyRX09lgs
   3OClFyrh/c/1fQJYq7QQ9iEMuB4vxq5rL9fjZTY2MdItDt7olRipdG/e/
   8/o906RQr8s/bJZeAJClhUrFIgKQC9L+KAALIqFFIyadL0ZwiISDiQFdz
   6OyAdmnhpWlbvADjB0m2tVrX8qe5thwL20JEfbGqmYEWlVccMneLrMf69
   ADwaVqvIOsBwphSJx7TlqLExePqFVJI5p5XdoSSH2IJwDYIpJMQvIYrxp
   w==;
X-CSE-ConnectionGUID: Rg8OkbxgSjKN6dYeGW8aBA==
X-CSE-MsgGUID: bB2CRlHYQkK/4dCYk49ZJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="117371369"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="117371369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:11:48 -0700
X-CSE-ConnectionGUID: D2ZY/M0SSeOreGrOk0cpmg==
X-CSE-MsgGUID: YhYWfDyASQyvpezqwxaBEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="303006505"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:11:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F3D7D11F817;
	Mon, 05 Oct 2026 11:11:46 +0300 (EEST)
Date: Mon, 5 Oct 2026 11:11:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com>
 <20261005071010.7191-2-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005071010.7191-2-robertbozik@gmail.com>

Hi Robert,

On Mon, Oct 05, 2026 at 09:10:08AM +0200, Robert Bozik wrote:
> Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
> sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
> and the standard SCCB command interface.
> 
> The sensor ships in laptops as an under-display camera, where it is
> described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
> the closest relative already in tree.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Bozik <robertbozik@gmail.com>
> ---
> Changes in v4:
> - No changes to the binding.
> 
>  .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> new file mode 100644
> index 000000000..804307cd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV32C4 Image Sensor
> +
> +maintainers:
> +  - Robert Bozik <robertbozik@gmail.com>
> +
> +description:
> +  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
> +  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
> +  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
> +  transmitter and the standard SCCB command interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov32c4
> +
> +  reg:
> +    maxItems: 1

minItems should be 2 here, for the always-on client.

> +
> +  clocks:
> +    maxItems: 1
> +    description: Input clock (XVCLK).
> +
> +  avdd-supply: true
> +
> +  dovdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@36 {
> +            compatible = "ovti,ov32c4";
> +            reg = <0x36>;
> +
> +            clocks = <&ov32c4_clk>;
> +            assigned-clocks = <&ov32c4_clk>;
> +            assigned-clock-rates = <19200000>;
> +
> +            avdd-supply = <&vreg_2p8>;
> +            dovdd-supply = <&vreg_1p8>;
> +            dvdd-supply = <&vreg_1p1>;
> +
> +            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                ov32c4_ep: endpoint {
> +                    remote-endpoint = <&csiphy0_ep>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <400000000>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Sakari Ailus

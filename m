Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C83C988B;
	Tue,  8 Sep 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855388; cv=none; b=IxSWHy6sXC1FPGF/BT+VJY8+QsDKlZqwLZL0mF0w6okHa8fDAywtXK1KQH0Ak3zq62Hvt1KoDwlyyOd8vbUGlkKrt1Su401WmGGBCmU9D9fWSCVmtuEXftT+tyEMOc7cH1OBHW18jggaS/XH/laUPb5t8u/q1QVtunF/JBaDnV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855388; c=relaxed/simple;
	bh=499f0WjwF0hT2Ks4mDRqxEgVXK2ErEkIiSMr/9Gksk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsFDEvNZgkOvZf8JnPy1Cg4M43RsuiFfSlNmQYaFpKgsEEy+4oRYLkRPi4xN1cO0t3mUq5YdgWtgoHmS7MLNJh7JKZhFA5+74KcMUYI5XTpcOp7B7mD3vYl4zxZRKmhi9VmCWeLF4keXV6aX3h3SkqiBeT1185nP5UVEqLpGmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxPhve5Q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxPhve5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855388; x=1820391388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=499f0WjwF0hT2Ks4mDRqxEgVXK2ErEkIiSMr/9Gksk0=;
  b=lxPhve5QeaKj3q1nLYB72eDzRSjRVpP3Q356lFOtkeLkVawzdMNiI2ee
   3ayDjfoglxaQ0VOhS+8LBd68OK1WRsxEnO5etIq9W4rHMbNNXzhQIoCWx
   7HeHJJcsAn6Leh7gG+NjyfVNQKXblUnZce2bw8xTUjXoyuaLWtZurxu1U
   I/Tnb9SO9O9H3Uds5PQhixpoBGhtsOY0GkZWNrwEdC97ShIKS5SZrAOYD
   8JqgqalbFfbBInxa2CTOEHv8qy4cp3yFhDOf/KzVOJpEk71hnQSGksLah
   y4ylEF/aN8Qtz5UrB53kNWE9awcBQKGPtBwUK6VDEAcGIkWgS83NiGYy7
   g==;
X-CSE-ConnectionGUID: CZJzd4XTQdOqOqOKjEGlSg==
X-CSE-MsgGUID: XXMQgNikStqFP3SAjQjo1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89293340"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89293340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:16:27 -0700
X-CSE-ConnectionGUID: 4HbdLj5yRQmj5BwqvkfXeg==
X-CSE-MsgGUID: MkwRn3RmRt61C8RCh55puA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="276187230"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:16:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 42D8E11FA3A;
	Tue, 08 Sep 2026 11:16:26 +0300 (EEST)
Date: Tue, 8 Sep 2026 11:16:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>

Hi Jacopo,

On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> Add bindings for the ams OSRAM Mira016 image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> new file mode 100644
> index 000000000000..49a606fca6cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +  - Philippe Baetens <philippebaetens@gmail.com>
> +
> +description:
> +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> +  and 3D consumer and industrial machine vision applications. The sensor is
> +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> +  physical layer specifications to transmit the image data to the host
> +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ams,mira016
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vdd28-supply:
> +    description:
> +      I/O voltage supply, 2.8 volts
> +
> +  vdd11-supply:
> +    description:
> +      I/O voltage supply, 1.1 volts
> +
> +  reset-gpios:
> +    description: Sensor reset (RST_N) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description:
> +      Video output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1

The device obviously supports non-continuous clock mode (and that's what
the driver also only does right now) but as the continous clock mode is
required by CSI-2, I presume the device can do both.

So I think you should have

             clock-noncontinuous: true

here.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdd28-supply
> +  - vdd11-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@36 {
> +            compatible = "ams,mira016";
> +            reg = <0x36>;
> +            clocks = <&cam1_clk>;
> +
> +            vdd28-supply = <&cam1_reg>;
> +            vdd11-supply = <&cam_dummy_reg>;
> +
> +            port {
> +                endpoint {
> +                    data-lanes = <1>;
> +                    link-frequencies = /bits/ 64 <750000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e12dc3ca57ab..1c24b05b378b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1454,6 +1454,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
>  F:	drivers/iio/light/as73211.c
>  
> +AMS MIRA016 DRIVER
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +M:	Philippe Baetens <philippebaetens@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> +
>  AMT (Automatic Multicast Tunneling)
>  M:	Taehee Yoo <ap420073@gmail.com>
>  L:	netdev@vger.kernel.org
> 

-- 
Regards,

Sakari Ailus

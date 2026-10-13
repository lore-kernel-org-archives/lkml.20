Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797403164D6;
	Tue, 13 Oct 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876009; cv=none; b=D0rjm0QoqwPA0I7kql/rYbqzWrYlao+xbumPUFjJjzv/1ul6ulRrTSF0UyxETwWEuBWRHyrc46z9r1HP2uS0EGC9sdKf3YsyOP6BeqVdlcAhEH6lXFCZs1AMBaFqT4T8TeaTv/W91//pEJw3rDzyFDqqxWiNNSTzgt4Rqmep2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876009; c=relaxed/simple;
	bh=3EIMklRsm+lKbHY3s2vmOySVyFXwXiQ9bpxf5C526jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHs7GH6Cynsa94IseCqEcRrAa036+bMIMiPUkUWa2GWVcrE8cQ4oEwkl/hfPUksEaxGArcjb170DwuqY0lVMsF8vJfXqLY4QbOcgBD1auQjPSfvJxxH2EjyrprjwJCv2sKPuOOUfsKYp5J2+6BOz+0MRc7M4rrHjPnyw/qtocyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCwszX6V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCwszX6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8937A1F000FF;
	Tue, 13 Oct 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876008;
	bh=8pf0Ph7c3/u3audy18tF0yiCmBWPU7a6hHO+L6l5Qus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lCwszX6VZ+gYWYSA27kg9BmzRmjTXOSnvK5PEI5ipX+Eytj5EPZIkxfmSTXV6qlUr
	 dPTrUYAUtHUaXTPBNgjqsZ3X/Qvxc3jUGRhPOBg+T6KB5FiTrkeSc4V9VaOxVXsPm9
	 iebqrjsY+PPlLmTj5HEVN2vYqPT/htJf95jkSIWBR+SAnntAXTLACFWh9go5Hm7JrW
	 vQ/Rza5zfv1TNo0ty1zSMFfhZTLyuQp3OCzAZHhsZ7OZYCushwXLoyhKxDASZu4hfd
	 /+pResJ4PAFnJqv65XTgpPWciVmM34AO8svzEDEMheFmXNC2MZ9qPFQq/rjYzj9OtD
	 0suqQJ8lcrLJQ==
Date: Tue, 13 Oct 2026 09:20:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, wesley.cheng@oss.qualcomm.com, sriram.dash@oss.qualcomm.com, 
	jack.pham@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com, 
	shazad.hussain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
Message-ID: <20261013-light-significant-markhor-c30eea@quoll>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
 <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>

On Sat, Oct 10, 2026 at 11:02:42AM +0530, Faisal Hassan wrote:
> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
> interconnects, resets, regulators and GDSC are abstracted and managed
> collectively by firmware.
> 
> Add a new binding file for firmware-managed USB controllers where
> access to these resources is exposed as two power domains:
> - Power domain: Controls power supply (GDSC) to the USB controller
> - Bus domain: Controls clocks and interconnects for data transfer
> 
> The binding makes power-domains and power-domain-names properties mandatory
> for firmware-managed platforms, while excluding the clocks property since
> clocks are managed through the power domains.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> new file mode 100644
> index 000000000000..87f426fdbd70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
> +
> +maintainers:
> +  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> +  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> +
> +description:
> +  USB controller on Qualcomm SA8255P automotive SoC where platform resources
> +  such as clocks, interconnects, resets, regulators and the GDSC are
> +  abstracted and managed collectively by firmware through SCMI (System
> +  Control and Management Interface).
> +
> +  Access to these firmware-managed resources is exposed as two power
> +  domains, one gating the power supply (GDSC) to the controller, and one
> +  gating the clocks and interconnects used for data transfer.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 5
> +    maxItems: 6
> +
> +  interrupt-names:
> +    minItems: 5
> +    items:
> +      - const: dwc_usb3
> +      - const: pwr_event
> +      - const: hs_phy_irq
> +      - const: dp_hs_phy_irq
> +      - const: dm_hs_phy_irq
> +      - const: ss_phy_irq

That's still unexpectedly flexible.

> +
> +  power-domains:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: power
> +      - const: bus

I don't see how did this improve. I asked to use existing bindings as
reference, so why aren't these power and perf? You wrote that bus
controls clocks and interconnect, so is this something different than
perf domain is doing for sa8255?

> +
> +  resets:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2

phys should be afixed, constrained.

> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 2

This as well.

> +
> +  dma-coherent: true
> +
> +  # Firmware-managed platforms do not use direct clock/interconnect control
> +  clocks: false
> +  clock-names: false
> +  interconnects: false
> +  interconnect-names: false

Drop all four above. Not sure why do you need them.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - power-domain-names
> +  - resets

I guess phys and phy-names as well.

> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434C4A4EEB;
	Mon, 21 Sep 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003438; cv=none; b=k8erJvp7gDNCiF6DPRKzaK4LM0aEdal9i/5tpEk21U2LC6Tyk/qKsi76bUkKZmGYSQbcQKeaOc5YyGZy00TvC5X2YWvmcdn5/rVVszY0XoPIxJeQDypMyQ9bI74DE92L6yu9B1OM6MC7adm2lPi2z3rS8eE+xTFXbYcGkaQDI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003438; c=relaxed/simple;
	bh=8hPr2TPWSDqcpDddloRw3P9FB85WZ9nSi9UTUCVUz30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8gMlFIpxp/kMn7LFSixc0WqGE1DxJjXy1Hl1eCpDtKt+PeFSu0B2EAB5Q4lNtb0RVP07aqfBxRZCbiLfaYe067EeXGpufseGmt3cmmy+VcoYDXAOjaPcz07H4Ncy02zymxAsP4NYvqKhEbgY4Bsb/19wQgM6b3J4XLJpMZEznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY1Y8tnR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY1Y8tnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037E11F000FF;
	Mon, 21 Sep 2026 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003436;
	bh=jo1mttMAeBwlE9oZ0kKMfIeVFqGCkPvCpNBkLCVIhak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OY1Y8tnRgZFAQsFAY86sn33inDXJ7p5NzoDpdtD2NzRETWTeVIDkfBva8QwenUumC
	 WGc/A1EsUoeVvhosvijBx3soZOWwMOChxaHMOKqcca8+nVcrCHcDyVakaVfMoiBf0h
	 BWCc+QIhhZRbNJ7Kko2JsfXycOT7f4RlBB97v70j8hiiLkOrgb7j/REzp2HPdQxSRU
	 brxSVbPFDYPnGtz46at+/bQAMPlTWQNzOltBi/PyRcBnKgh9oQ8/DNmyzFpDme3p6Y
	 0y02R2DQBAAPwHnM1o5LhJ6jt2s3IiojEa4uPkUREJMbcivC99fh/CU+e303YtQA4T
	 7jtb6SrbmC0cQ==
Date: Mon, 21 Sep 2026 16:10:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <20260921-nice-russet-caracal-6db6d3@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-2-andre.przywara@arm.com>

On Fri, Sep 18, 2026 at 04:11:04PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> new file mode 100644
> index 0000000000000..179c542f383d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Live Firmware Activation (LFA)
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +
> +description:
> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
> +  firmware interface to activate an updated firmware at runtime, without
> +  requiring a reboot. Updates might be supplied out-of-band, for instance
> +  via a BMC, in which case the platform needs to notify an OS about pending
> +  image updates.
> +  [1] https://developer.arm.com/documentation/den0147/latest/
> +
> +properties:
> +  compatible:
> +    const: arm,lfa
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The notification interrupt for changed firmware image status. For
> +      an out-of-band firmware update, some system entity would signal
> +      the availability of a firmware update to the host OS via this interrupt.
> +
> +      This must be an edge-triggered IRQ.
> +
> +required:
> +  - compatible
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +        firmware-update {
> +            compatible = "arm,lfa";
> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;

Could the example use an edge-triggered interrupt type as it must be
edge-triggered IRQ as per the above scheme ? As written, a device tree
copied from the example violates the binding's requirement.

Alternatively, is the binding incorrect and needs fixing ? I am not sure
if there is any requirement on it from the specification. Where did you
derive it from ?

-- 
Regards,
Sudeep

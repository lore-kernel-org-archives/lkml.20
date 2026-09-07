Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB7233939;
	Mon,  7 Sep 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772135; cv=none; b=QuREd71PkZ8Xwbl/+jR2+ob6KGVi0YvdgwCgzbhPEDvegSJvYxezagnxtd0Wa0ReY7mJn+T3G8M6tvdRZmWx7cXU4N4DoRL84QojW8FClJqwBh5D4z36uIaYvs70SlOQDEZp2YhpqqES4UiN2zUxdXIjMII7fbXcF/Gdj0MSwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772135; c=relaxed/simple;
	bh=uCfZTfX2XVpehn+fIliTAk5aZIdzQekMfQww5kSvFUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlIJByd1809wk2tvEugCBAIDG3O0QJrZQ1Cy2HMwJwkS6xYCmUY7C9wjtz0gL4NKzTj71kBHm7oamW3aW6ZrwVsWYRVJo239kN6Pe4Hv8waj0TnyqpNbmsyDvJ+iunDdtKW5UR3kUTZzCV6hy7ZT12EzKK/t3hlzpdhzUQY6dqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMAx2iY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMAx2iY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BBB1F00A3A;
	Mon,  7 Sep 2026 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788772133;
	bh=G3iM/ReEV9+vKdb80yT0YD5MukMwqCgjcKzuMZz3vhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMAx2iY0+km6Xi7zooLmytwVH7m/rcIHK5XI8Y8UKQeV6RlqSt0tFnZQ1gPx7qY2S
	 vNH3qMnghiuJHlvnWdLFqea4F7rFEylWvGdI4WB3xe8oR1Rv5+2RvnBJ9UAVqd2kfR
	 x+s1e7EPB5t+6PbYuSlakdbMmBolx44htPQhS3SY1aAuCDZRmDYu/az8ndn/YGctl0
	 gaJRVxmh25Ks6NPm2gUKJCbj0x+bgDQAEl7SYkKpBGcFSPpH5KDUG3fsOr97kOq2Re
	 K34YofWqwXei6xayENA8lgOwshr4lku6ZscZi2xTOkZ4okb9hej+F0evAlzaf/2Vhm
	 HkvH0u7+ytBmw==
Date: Mon, 7 Sep 2026 11:08:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Sriram Dash <sriram.dash@oss.qualcomm.com>, 
	Jack Pham <jack.pham@oss.qualcomm.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
Message-ID: <20260907-arcane-spicy-parrot-6da5ed@quoll>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 09:08:23PM +0530, Faisal Hassan wrote:
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
>  .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> new file mode 100644
> index 000000000000..c6db7bcf4981
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> @@ -0,0 +1,123 @@
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
> +    minItems: 1
> +    maxItems: 6

Why is this flexible?

> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 6

Why is this flexible even more, allowing completely random names?

> +
> +  power-domains:
> +    description: |
> +      Power domains are provided by SCMI (System Control and Management
> +      Interface). See Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +      for details.
> +
> +      Exactly two power domains must be specified:
> +        - "power": controls power supply (GDSC) to the USB controller
> +        - "bus": controls clocks and interconnects used for data transfer

Look at other bindings how they do it.

I finished here, because you would avoid all above questions if you just
copied recently added or reviewed on the list SA8xxx binding. You did
not, so basically I expect more of unexpected code, which is pointless
to review. Just open existing files...

Best regards,
Krzysztof


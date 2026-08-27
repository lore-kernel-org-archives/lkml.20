Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F8455173;
	Thu, 27 Aug 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835606; cv=none; b=AKIt+CLnGcV6t0awaUmiviiqdwYc758bvaSJrJbJWbgeUo+yddbB5f2Ms4Ls0lpJyMCryHelIHmH6G5FFP0VVcwfcqgQPERVck2pxkG2TDyctsaAVyv2R+zgBJ01HB+hYYzGgXWdWBRHngILiTPJv1XkkK/bD7NtjMC0bWMQNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835606; c=relaxed/simple;
	bh=DmYQHPvuzN7w14pM+qNa9bDK8VfqhPzHtWD+USU/0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZF3TWyqIrz7GvvNvhi55ql6vr5qx05cVSIcY0zydx5vMAl0CjFUOQh6BxO99/arUTaMEDxNnTxbGhFvyv20HchUA/FLwKwlwdFRFVvMRStponPxCgt67F80Ldr3Qsja5X3vM4p/isdHQnCaau1c5a0jl0I+fmNIIMd2LAHNars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQNM85ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQNM85ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFCE1F000E9;
	Thu, 27 Aug 2026 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835587;
	bh=nHj2MclCk+X9SP4Q2c6F2gv56YQ8ZRF79zdrdZI3CCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PQNM85raTj4YxX05iQsQNYL4K3pmBOKj8+SY1N9Rp95qrAdSBNPQIqAfAt0N7Vo1O
	 NUYMPl6VlmBXwIrdldCjY4vNMB6OsVK4vkFWm7sxWj4PjKwVLR0zN/qZvt14DUaoLf
	 q9Pq3dvGmHhK9MlVQjaEbrWrWt0aNCj0qjPhJAlHVvGj/ckov8IuZ4aFQfa3yXPeCB
	 Islc4QKwFb5jcnOPcOztzUx/OH4NAHHo3hGLz2TIDrqjvbbEgG9sIwCwfP3BFY5Bn4
	 E7dbYjLKuSnj1BcIn2sIt4/eW/yUz8VFsdOg3WOpUNoxy5pMTVw9cj+jtoN6G50PmZ
	 LV1uSKjxDdaXQ==
Date: Thu, 27 Aug 2026 14:59:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Pankaj Dev <pankaj.dev@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rahul Kumar <rahul.kumar05@st.com>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
Message-ID: <20260827-strategic-hallowed-lynx-ca3bcc@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-6-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260822074816.548662-6-marex@nabladev.com>

On Sat, Aug 22, 2026 at 09:46:38AM +0200, Marek Vasut wrote:
> The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
> glue logic wrapper around it controlled by syscon. Document the glue
> logic and DWC3 controller.
>=20
> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Fix up Sob/Cdb lines
> V3: - Document maximum-speed
>     - Switch resets to maxItems: 1
>     - Drop label from example
>     - Use generic over-current-active-low
>     - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-spe=
ed/phys/phy-names
> ---
>  .../bindings/usb/st,stm32mp25-dwc3.yaml       | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dw=
c3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> new file mode 100644
> index 0000000000000..96bd557327252
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
> +
> +description:
> +  The STM32 MPU DWC3 USB SoC controller block supports both
> +  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +  - Marek Vasut <marex@nabladev.com>
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#

Honestly, I am lost. It seems this resolves my comment at v2, but now I
went through patchset from Fabrice Gasnier which was ON TOP of this
patch adding this line.

It is not your fault, although if there are pending comments expressed
not via review but via patchses on top of things being reviewed, then
can you check for them?

Best regards,
Krzysztof


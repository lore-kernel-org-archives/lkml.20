Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679852;
	b=LbDaLXV3H2x2V/ZNIWmP14zxDIfy7m3ZWoY/YuyEyL7yXUT2CrxXSKlTuf2jtEJ3VosY
	 VrlSpq7pYPF0kIgtadzr8s+HgkWKNe8YndO7x0WdDyR0VExK0Cp3Wal7t0kmODAoUyjOw
	 8rljHhoDGe9Uk42mW4lfhqRF312y7LGzmJuJfLmQm0t3CkEhvRwwOoZn3H7oq2AEgdZfz
	 GJwAgIMH+zQz0wa/EN4LuQzgvrhiIQ/LsvtZr8FvfQo90ZtsOhXsODE1H8AuezJ1IcCDr
	 umQl+xOspSlL2LQz1jQ+uVI+gQQeRWu/ISgTKBvwDm7BE41WClfnOgx/C20qwnUTGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679852;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wtteTU/FEEjNn69nM9CCNjF8Rj/1ujGjiCLiAnepc0E=;
	b=2SiGJ+1AGe4RuCJpsAXJ4IMQfo3yU4VlqcbsTiVMhyeDH9l3irhjBIY8rAZj3KrkIcdb
	 BGamlLGfwUW0iW0QudoWaH2tqwrk4bSZwYnAgk8ti9twzdUyqa9Tnrrtsv+l640t51/Lk
	 GroGf54iBKeIcIfvl0fiQw/mQGRjlFeA348jfA/pdIvhmeRy1TPJNttz853U5p/mip4oH
	 h4klko+iI9+3YJRGduAfQ46E/K5hj8vMrhOG4ypKlzn9BenNstUDQCLAmLIFjTIlyXdVg
	 6yNKGeBQPCVXJ3QtiNpuuqEadXwj33bqAY7HeNKDyFaYgXK+4OV0W0lUgUBTPst55Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlkbcnKb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DECD606A319;
	Thu, 22 Oct 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlkbcnKb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB16A1F000C1;
	Thu, 22 Oct 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792679851;
	bh=wtteTU/FEEjNn69nM9CCNjF8Rj/1ujGjiCLiAnepc0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlkbcnKbK0eBCdyQ3kaluKcD0zoRw33EeYnWrhPm6KN+VYrGfkO6mkt4J+9wPvaVV
	 pl2a/L2d0sFfdUNgGVed8CrsvU5KxkBIBjFt2JgG1s+ogVbr3pXDhKCrwpcN9AGkBa
	 6lim+1tg+V0WIJPXN3mzRxP6REguI08LJCicTiw20zlBg35gjMSLv3eiNdrDeX5SPC
	 z0IPcLaRxcVryABuJpEcvUR39NvOBRUd2yVRKat0c7PDXVHGxJapX/eiObrpprbq0i
	 E/CKrJlDsKUmTWrL3YB1wu8VhcOM6vpg+WhaULR5pKjNrRRaRFcu79BR/AmuFW0pgX
	 QWJOhFJUGRg4Q==
Date: Thu, 22 Oct 2026 09:37:30 -0500
From: Rob Herring <robh@kernel.org>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, michal.simek@amd.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org, james.morse@arm.com, mchehab@kernel.org,
	rric@kernel.org, git@amd.com
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Message-ID: <20261022143730.GA1287910-robh@kernel.org>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>

On Wed, Oct 21, 2026 at 06:27:20PM +0530, Rama devi Veggalam wrote:
> Add the "xlnx,versal-xilsem" compatible string for the Versal
> XilSEM (Xilinx Soft Error Mitigation) hardware block.
> 
> XilSEM runs as part of the Platform Loader and Manager (PLM) on the
> PMC and detects (and optionally corrects) soft errors in Versal
> Configuration Memory, notifying error events to user applications.
> 
> The new compatible string only needs a single register region and
> does not use reg-names or interrupts, so the schema gates these
> requirements per compatible string.
> 
> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> ---
> Changes in v4:
> - Added a new "xlnx,versal-xilsem" compatible string to the existing
>   xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
>   DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
>   validated independently per compatible string.
> 
> Changes in v3:
> - Merged XilSEM edac with Versal Edac
> 
> Changes in v2:
> - Changed "xlnx,versal-xilsem-edac" to constant
> - Removed "compatible: in required section
> - Removed "|" in description
> - Removed "items" in compatible
> - Fixed indentation in examples
> - Updated title and description
> ---
>  .../memory-controllers/xlnx,versal-ddrmc-edac.yaml | 64 +++++++++++++++++++---
>  1 file changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> index 12f8e9f..b5dc320 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
> @@ -4,25 +4,35 @@
>  $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-edac.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
> +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and XilSEM EDAC
>  
>  maintainers:
>    - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>    - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
>  
>  description:
>    The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and LPDDR4/
>    4X memory interfaces. Versal DDR memory controller has an optional ECC support
>    which correct single bit ECC errors and detect double bit ECC errors.
>  
> +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the Platform Loader
> +  and Manager (PLM) which is loaded into and runs on the Platform Management
> +  Controller (PMC). XilSEM is responsible for detecting and optionally
> +  correcting soft errors in Configuration Memory of Versal. Whenever an error
> +  is detected, be it correctable or uncorrectable, XilSEM notifies the errors
> +  to user applications via the firmware's event notification interface,
> +  rather than a devicetree-described interrupt.
> +
>  properties:
>    compatible:
> -    const: xlnx,versal-ddrmc
> +    enum:
> +      - xlnx,versal-ddrmc
> +      - xlnx,versal-xilsem
>  
>    reg:
> -    items:
> -      - description: DDR Memory Controller registers
> -      - description: NOC registers corresponding to DDR Memory Controller
> +    minItems: 1
> +    maxItems: 2
>  
>    reg-names:
>      items:
> @@ -35,8 +45,39 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reg-names
> -  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,versal-ddrmc
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: DDR Memory Controller registers
> +            - description: NOC registers corresponding to DDR Memory Controller
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: noc
> +      required:
> +        - reg-names
> +        - interrupts
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,versal-xilsem
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XilSEM (Soft Error Mitigation) register region
> +        reg-names: false
> +        interrupts: false

These 2 devices have absolutely 0 properties in common. It makes no 
sense to share a binding doc.

Rob

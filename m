Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756B37475D;
	Mon,  7 Sep 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771784; cv=none; b=IfZK/djC6yyPntFP1MTQTnLUAmALCva6URWdHYuU0e3ofTLbs+IBUMuz0iiiMri/zXAFgu+h9MfXVwT5RfmmfdES+i91gpalUL1huyBdpfY+B4K2rEoyqc1PfxcJXwcjvRsHtHv7mp4afIQxnIx0uR4BspVh50FhQIJEEIlsWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771784; c=relaxed/simple;
	bh=Go+bBQ61UsY2NImsKzf3YoYh/SoBrl4RgefHRiYG8RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDUcvJbzQV2cwTsu3gfLSMYcrQcZz+tXzTB7/f8rHAc980TBSYIDTAJbxPd69gDjniuK5+QwHK82ibsnr67g7/aQmo2pOyyR23PEiEo+EB9u9SQNfKHZiv3STKZhfQPfEzalMxjFIN2tGL1EeeG5fneVWU2xFbZ4Tkg91vRhUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igNYO8RH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igNYO8RH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4A11F00A3A;
	Mon,  7 Sep 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771782;
	bh=qPcPiAWfjggqcajS5JwGn0UOdsMyEDVI6NoXDi4xWv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=igNYO8RH580c16Q0eiHMhb5A2oQYox4ljVElJLUkXFyZeLlOtnyqWagqlBbp2lieK
	 4f2k0rZvzwmVqkMSn3Tr0TCDLzmVc3SeoS1s3DuZeQlEOk95WvGfiDuDjZKc7KaZhp
	 8/zCYylYcVtWQLFWrX/HwJ8eibQDU/SgXrpUbRk8AIedg1ORoK34F/CTR+318f/WUi
	 6SK1AhVP7F4AuveMJStqwkuNkalqVMV5rfImcydsYZcu1mhtJP8Fn7xuCZZ3dIKaPx
	 gXUBmTXdUbwT6II4Sq18IGHEZ74D0UgS/c9KqMRotGk826OVcWpGcr8VtF656FkrMf
	 y5D3sqMTqZbpw==
Date: Mon, 7 Sep 2026 11:02:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>, 
	Yaode Fang <Yaode.Fang@ite.com.tw>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274
 support
Message-ID: <20260907-bulky-adorable-agama-40ece9@quoll>
References: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>

On Thu, Sep 03, 2026 at 06:15:43PM +0800, Amber Kao wrote:
> Add device tree binding documentation for the ITE IT527x series
> (IT5271, IT5272, IT5273, and IT5274) I2C-based USB Type-C Power
> Delivery (PD) controllers.
> 
> The series comprises four variants differing by port count and
> Power Range support:
> - IT5271: single-port, SPR (Standard Power Range)
> - IT5272: two-port, SPR
> - IT5273: single-port, EPR (Extended Power Range)
> - IT5274: two-port, EPR
> 
> Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
> ---
> The driver for this device family is shared with ITE IT8851/IT8853,
> currently under review as a separate series:
> https://patchwork.kernel.org/project/linux-usb/patch/20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw/
> 
> This binding is submitted independently so it can be reviewed on

No, it cannot be reviewed on its own, because splitting it means you
have undocumented compatibles in the other patchset.

And if you do not, then there is no user for this binding.


> its own; once the driver series lands, IT527x support will be
> wired into it there.

Then what is the point of this binding now?

> ---
>  .../devicetree/bindings/usb/ite,it5271.yaml        | 176 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 +
>  2 files changed, 184 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ite,it5271.yaml b/Documentation/devicetree/bindings/usb/ite,it5271.yaml
> new file mode 100644
> index 000000000000..29cd7add9bde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,it5271.yaml
> @@ -0,0 +1,176 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ite,it5271.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT5271/IT5272/IT5273/IT5274 USB Type-C Power Delivery Controller
> +
> +maintainers:
> +  - Amber Kao <amber.kao@ite.com.tw>
> +
> +description: |
> +  The ITE IT527x series are I2C-based USB Type-C Power Delivery (PD)
> +  controllers.
> +  All variants support DFP/UFP/DRP roles, USB PD 3.1, Fast Role Swap,
> +  USB4, and TBT3/TBT4 alternate modes.
> +
> +  The series comprises four ordering part numbers built on identical
> +  silicon; port count and PD power range support are configured via
> +  firmware/OTP rather than differing in the register interface itself:
> +    - IT5271: single-port variant, SPR
> +    - IT5272: two-port variant, SPR
> +    - IT5273: single-port variant, EPR
> +    - IT5274: two-port variant, EPR
> +

Why isn't this entire binding part of the other file?

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ite,it5271
> +      - items:
> +          - const: ite,it5272

enum

I finished actually here, becausr I still find reviewing outside of
driver a waste of our time.

Best regards,
Krzysztof


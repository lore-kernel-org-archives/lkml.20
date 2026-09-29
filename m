Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E683AEF49;
	Tue, 29 Sep 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672766; cv=none; b=FLSBHEO9e7xsX0tUR7q79HM7A34V9bTuU7gwZ84NSdwK7KmlmKX90Oiqac8YBExaAQD5H/EzOM9hAEtzMrwNtNR05iPKdjnX27z7Ue6xB5fY+Yt9PrUIh0aOnSOM3SV8yfZD4Pg11oZVgBkQRDh6oYznnogtgN+tvWAfreFnUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672766; c=relaxed/simple;
	bh=bbFcPc1IleVdvzLJ+qy5Z6oS0IHPGYiTbfbbbq/2INQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjEyWaMBQc4yb+nWgZ9iTPRMSBgoHvpXNRM11zh7IzQEUxSEs+tUuOclAwhlVrt9wQxu1brTgH6B/PUQKh6opU80QMTV30IQKamnE3saKcGYb3bueJN9X3q+h9bzXxAM8X/Fxq1gnkEA3epKkXRsMJTqG42lSikLSBJv53Flirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo64ku58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo64ku58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C91F0089B;
	Tue, 29 Sep 2026 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790672750;
	bh=qAc4L7KUHHcY/yph5WN91+0w4y9rHjYBvQM3E9pKxuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eo64ku58MSp0JCLpwXnn+7itMA0bZmuXYS40dLtZSyDVfqrpYkE/x6e+uokBkjlF8
	 ntER0n/to4t30A0gvVynkXqiTu03+WijvJebRYXDYUO1v9feUtNb4QnjnRU6Z9JH89
	 4ZDsSrhkOpYBvv1d93YwuVMQigxBm8YGo6iIrZYK0Pm5RVrbgxhG2bqB3qGCtYOWcJ
	 RjQFNzdN04G4DDFTJS0UNke1mtmwDm1Rmggv39mSCW7alr/7MJP3m/ryXh+d2sEDnx
	 v983XPQGsn6JynEqxz9I1UlkPoUUm5bPMrqkZ2gJ7oTdqafOBxaYsyU0gEsTmwTwQu
	 dBOdZz9bbyUiA==
Date: Tue, 29 Sep 2026 11:05:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
Message-ID: <20260929-brave-mouflon-of-enthusiasm-df7efe@quoll>
References: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
 <20260928-paul-v7-3-rc1-edac-v4-1-4646a5b7cac9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928-paul-v7-3-rc1-edac-v4-1-4646a5b7cac9@bootlin.com>

On Mon, Sep 28, 2026 at 12:45:47PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC DT binding.

Which is?

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
> new file mode 100644
> index 000000000000..098e69ff6297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/cdns,ddr-edac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence DDR EDAC
> +
> +maintainers:
> +  - Paul Louvel <paul.louvel@bootlin.com>
> +
> +description: >

Drop >

> +  The Cadence DDR supports DDR2 and DDR3 memory with or without ECC.
> +  The bootloader must configure ECC mode in the memory controller.
> +
> +  The memory controller supports SECDED (single bit error correction, double bit
> +  error detection). ECC scrubbing has to be done via software.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> +      - const: cdns,ddr-edac

I doubt this can be used standalone, so I am not sure what is the
benefit of cnds compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DDR controller clock
> +      - description: APB internal bus clock
> +
> +  clock-names:
> +    items:
> +      - const: ddrc
> +      - const: pclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    edac: memory-controller@4000d000 {

Drop unused label

Best regards,
Krzysztof


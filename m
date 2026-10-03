Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D305041A57D;
	Sat,  3 Oct 2026 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038563; cv=none; b=BUemv5DOPq2hpGbP3fJXZt2mY4fOrmLi/mLpObaFHuiJ1rllbRLjnvtGVL2sh0VBR3x4bobK4114wXr9ArXUBgw6zHtN3w4lNPL4Zym8aFnV3839VBdSlRhj+BQm/OuLfxt22d4wz6Dg6/1deJsxG2QeQep4xtG1ZQtlELaq1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038563; c=relaxed/simple;
	bh=uGBJCobcSQfDXNUoamqwH0Bu2qRL4xzyPtZVswHSv/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBwDsunnuqOjvJJf1MkmHVMhM1pY8MWFO5F7To1z/HPh+Z7YlmaY4PasH5hRr02kV3O/Ja1nfDbU0zvE3jbN8Op7+TVBNGaFJyAPB+Hhx5IBShW4rW36n496yiSUX1QiK3KIxrDsRviyKNiSSdYxDtE63a+NpFMo4peZijn+who=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaH8YrQC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaH8YrQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5511F0089B;
	Sat,  3 Oct 2026 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038555;
	bh=gCF9tetbpMfQg3fMkPRL+OgJ850OtOdqqJtsAEmAaxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaH8YrQCXluDW63hTphJmUmkFE6nG5mcrDtNhv7a0JKSrCGXHTUaRfxohiLxbQyZe
	 NHMakZELalf5KQnUx1sEGf9jZDg0vClMQcVWwK3+Z0smvyE7XXYa+Iu0WtA9sc7W8O
	 48eykD6tWDOsznoQDeDakMq2YjW02eeabCvv/f19f80CbX4Q388sRs0IYR/+/ITRVz
	 n+y1ZZk0e7iyQg9UIYY4g7AP+kmifAXjFP4fCQbImCE0kr/D5O+RCSlaZ2FJf6LyOe
	 kw6gz1YcgrGBKy3UJRJEkXX/VSCRb9GdE5+4CWD+CyaW1GFBC8OFqd4vdFYep28GZz
	 VkaMGyHMODVjA==
Date: Sat, 3 Oct 2026 16:42:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH 3/4] ARM: dts: aspeed: add Intel AVCRP BMC
Message-ID: <20261003-talented-perfect-rook-9ccf55@quoll>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9dadaaf04cae28e13057fa5d65023789f74483fb.1790344811.git.dawid.glazik@linux.intel.com>

On Fri, Oct 02, 2026 at 06:32:44PM +0200, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 767f7c7652d5..ea4645ef9872 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ibm-rainier-4u.dtb \
>  	aspeed-bmc-ibm-sbp1.dtb \
>  	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..ba0091689172
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Intel AVCRP BMC";
> +	compatible = "intel,avcrp-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS4,115200n8";

We moved to stdout property years ago.

Best regards,
Krzysztof


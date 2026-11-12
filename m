Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481723;
	b=Aqx9S0mYPxzeCrMSBOd7gmlbReKXbuOkkjz/ew4bMIdHqmD4oLig2BM7yzJRQigC1ufo
	 ognfPYkS4RptvCxaVsE8sTAKoP9rzNzCS3W3kx62CLvHpvvpYhP+sfyJzsUhfb5yR4Tcf
	 rVqsTP99U/m+nvyAeBl4H0rNMiklmjGGS48ZaZgnCoLu7FUejTvG3D6An7DYRlAelpNY/
	 1JP017CDUwvbzEG3V6CGA66xmcAgoGB247cpCWC9GUIf9D8iZedf04WRYY8xQ/MwG0lnd
	 Pksy3C8Ud+iE2VnIIxBTUyCoLAs06Hqccp4+uM8CQazZ1hgKb49OLrflLIakzUzN3OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481723;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HiPw/vO6fj89ZTfYmyeZnIAu27qYcwnBAOmXn+WneYM=;
	b=ht41sXj4A7UJ3kItyb0RMtVUxaoSjQKKZ+cxEfciV4INZ4pXIXlap3m1DAUeXNyQ5tFQ
	 FlxbYN6eQPrFhNfzLK+csaBhQnRvGp0YL3jliU2knBU5riGZW47WwPsyTC3SMNsFBpFaB
	 ZDnVwMDk06SYH4PszriFpPjZyk3i3sj9nMKKztdrTi5UfYYUwCmF3DCQgfpxX0jWOPRng
	 bvB/1j2OyFTztbwVC8T5jUgUkvnHWCRVQG/VwouLsheqxWlcs+gQYVa7QsBMu9QRX+bfT
	 ApjA8ynZ3rhVTUrSDPwk0Of3SVa1P/fF5pIfeBMgpcoHIYfRScUe/RUMlpkdpjqQIMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8WWcBab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7534606A321;
	Thu, 12 Nov 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8WWcBab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AEA1F00A05;
	Thu, 12 Nov 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481723;
	bh=HiPw/vO6fj89ZTfYmyeZnIAu27qYcwnBAOmXn+WneYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8WWcBabyiIZJt9o4CRWXCXqWprHnqX/iN3JpjVXQksv65oEatvA7TfzcUnPKz8mz
	 NTsKi80nGYIxl1a0wZnUAxfimcMlBPQq8SQ33l/rCDZ86XFhxtH04Bdcgth7iEhGXO
	 0xc/P9YLJNHE1ST277DK0pA4o7DQyBn8YWKtBkKaxY91DpvQ6xjT2p9tyYMVsZ90/d
	 M5m6LK4NLX9pyxOUJME4ljdvcr/FU6We7PrcibPjgBRP4vOV3ISuQ7pV1DM+duznMc
	 UIHCOy9NwJj133zfvBo6x6sPosW7OkrqjunUcezd3iKhqGycpYUO85/g9MbjSazy9q
	 fd47LzyUQzGgw==
Date: Thu, 12 Nov 2026 12:08:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Message-ID: <20261112-mottled-formidable-galago-eb933b@quoll>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111162917.97532-3-cyan2254650260@gmail.com>

On Wed, Nov 11, 2026 at 11:29:17AM -0500, Pufan Jin wrote:
> Add devicetree support for the ALINX AX7Z020B development board.
> The board is built around the ALINX AC7Z020 system on module with a
> Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
> flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
> host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
> MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
> DevCFG FPGA manager is also enabled.
> 
> The two SMA AD inputs and the spare differential pair are wired to
> XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
> always accessible from the PS, so expose these channels via the
> driver's xlnx,channels property.
> 
> Link: https://www.alinx.com/

Drop link. We do not advertise websites, unless it brings some value.

> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
> ---
>  arch/arm/boot/dts/xilinx/Makefile             |   1 +
>  .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
>  .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
>  create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

...

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> new file mode 100644
> index 0000000000..472d9fcaaf
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DTS for ALINX AX7Z020B Development Board
> + *
> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "zynq-alinx-ac7z020.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "ALINX AX7Z020B Development Board";
> +	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		serial0 = &uart1;
> +		serial1 = &uart0;
> +		mmc0 = &sdhci0;
> +		spi0 = &qspi;
> +		i2c0 = &i2c0;
> +	};
> +
> +	chosen {
> +		bootargs = "";

Drop bootargs, why do you need empty ones anyway?


> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	usb_phy0: phy0 {

just "phy" or is there phy-1?

Best regards,
Krzysztof


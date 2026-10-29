Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267637;
	b=q9lIThpoxK68dMlHjM6BjC4+gz1J0iC9hgaPZzBKn8kLibXpo3XwAM6OP8/453DFFoi/
	 Zslkje6T6WuqwT9mByIvqjjl0pE1blTv/t/i6ANEaotPONvU86lihsfK5EjBLb1fAu4b5
	 xxSJLIB+6b9TO3vr6NFImlyYO9jDz0NCXRZDUMzsf3+GC03OtUsZnNrDBrYYozhyLvEiy
	 3DbR49D7LI6c4rYdlUNasNPsaVPepj8IqH2gQR/9/NJpRW4KfXaY2wKjtpHDBZDFBkj19
	 T54kkjIAd8eTQvRuh9n50TIEg8ABG4zpSSHdoN/5Pt1/ERLliDy+gkUs2P9Rz/e8VTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267637;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=V6Z3lx8HB/65IktpMvGzORYJmEAvTuwDLE0nRJTp3hM=;
	b=wCbiIsxOjAK454DUmUwZA2o5BMpfx8uZ8sA4izr78F5AhV2quSydTnYCA5vMGayQqGgB
	 Isn5FcDktTLIwokYQX5fncxV2LAbw7dhzUkGlh/vB6Lfodxzw3N/whgE9KgODC+omcY8p
	 OYsHH70qIL0mdF/CxymyV13qhsB8KxToqdvGsVt4Dt/0r7kWIxAWrNnxLrQgBDzLU/aFA
	 z0tPeYNHRP9DeIgB6nGOW82XxTtAVxLej46bbCDqoV6C9tY2/sdlIZQMUTEB2HPHdU9g5
	 nKIr/iEWxO8P/A7kMQR41wjvhq97DVeoZ7PGttstPBK4TVXor/losYcB5VKRF6nfXEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Huh6i3il;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062E606A31A;
	Thu, 29 Oct 2026 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Huh6i3il
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B41F01828;
	Thu, 29 Oct 2026 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267636;
	bh=V6Z3lx8HB/65IktpMvGzORYJmEAvTuwDLE0nRJTp3hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Huh6i3ilGxlUQtbUPcQDEACaSC8dodvTAcDQ770a1bA7dtYFzJThClWwToRi++ZcX
	 KtkrkWvDmOnZzC0u6SlsKhXDqNDQqXYnd1M9sD93SHFaWE1dX0FgWhUpzzxZlvgK+p
	 MAyJsDAj0RE0wrqixzclF1d2n4gSm33fKp6WZTCAN5cZKRBpUz8JsqtVjTmLy4bARb
	 CybTuhe4dijZoxnpCQRaAfR3hFwwapnXga6wLeXvmvaeOExekqVhckzlPFqC3e1TzR
	 xAXRoop5zsm3ryCjDYklCHKD4HDvbsdQVDL6Fv+32yDrYtm4+2nyZencxYzHbcMra4
	 k0tMVJQTV3iUg==
Date: Thu, 29 Oct 2026 10:53:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Message-ID: <20261029-gentle-devious-trogon-de665e@quoll>
References: <cover.1793243187.git.jackyhuang@nvidia.com>
 <0d221cbd11c8b582d43b21e4156dfb7c83b121b3.1793243187.git.jackyhuang@nvidia.com>
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
In-Reply-To: <0d221cbd11c8b582d43b21e4156dfb7c83b121b3.1793243187.git.jackyhuang@nvidia.com>

On Thu, Oct 29, 2026 at 01:58:08PM +0900, Jacky Huang wrote:
> +	chosen {
> +		bootargs = "console=tty0 console=ttyS4,115200n8 earlycon";

Drop bootargs. Console (and baudrate) goes to stdout-path. earlycon is
for debugging, not mainline wide-usage.

> +		stdout-path = &uart5;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fault-led {
> +			gpios = <&exp7 12 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-led {
> +			gpios = <&exp7 8 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		uid-led {
> +			gpios = <&exp7 10 GPIO_ACTIVE_LOW>;
> +		};
> +	};

...

> +				device@1 {
> +					compatible = "usb955,cf11";
> +					reg = <1>;
> +					#address-cells = <2>;
> +					#size-cells = <0>;
> +
> +					cp2112: interface@1 {
> +						compatible = "usbif955,cf11.config1.1";
> +						reg = <1 1>;
> +						#gpio-cells = <2>;
> +						gpio-controller;
> +						#interrupt-cells = <2>;
> +						interrupt-controller;
> +
> +						i2c {
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +
> +							/* CPU0 IROT/thermal/SOCAMM/JTAG */
> +							pca9555@50 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +								compatible = "nxp,pca9555";
> +								reg = <0x50>;

...

> +
> +/* Board 0 management bus 1: GPIO expanders + HPM MCU MCTP */
> +&i2c1 {
> +	mctp-controller;
> +	multi-master;
> +
> +	status = "okay";
> +
> +	/* MCTP for HPM MCU */
> +	mctp@18 {
> +		compatible = "mctp-i2c-controller";
> +		reg = <(0x18 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> +
> +	/* Board 0 management bus 1 GPIO expander 0 */
> +	pca9555@20 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&standby_power_regulator>;
> +		gpio-line-names =
> +		"B0_M1_MCU_RESET_L-O",

Messed indentation.

Are you sure you run dt-check-style here?

Best regards,
Krzysztof


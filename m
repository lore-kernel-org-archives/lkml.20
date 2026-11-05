Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890841;
	b=wSZLJEhL+zYzoArl25EXV08PBOg8sJCCJhEfLe2VjT0vgPBrTE+xNr/TKBhV7gAvaHRA
	 AGvsipTjcvSqej/AJPxApkS0XuxzXoGeSS8zW8sqFQs4iwa7/dig5AE8sXiAELJlchMem
	 iuL9F4B8fV1EprQXwHqCAeqybdhdeBeZ90kkcBwoAcRfN7veNfRrcH6fkDW9fmDKropVw
	 4zx/6OlADW8YrvEY9dyUf4x2UC3X3KhDUB+DdCcW4fOP+WYKIdTnGxvqb6vYx7roTILpG
	 GdxB0GQ7lPMIkS12whvtvmVnWB9lp7IqYT2yjlGzeOSDcOPJCcAiMHpfGN7nlzA9tfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=;
	b=P2XEQ/zcoDXbTfIjlEmIhsFZEfVn1DP/kK4mnym0eON9CiK9wuNawdkO8QS8XLRVQo9L
	 EjMiRJRt4tvxHOoNAbCE+KHoiezNFVIkG7VUppW3U1wcQP4rdZYnrLnb18upIs1X1PTfe
	 MYIxoruBwi7sO2rtX0MRY+KwCb8lG5GQrZgzVDZnh4IomG83ktJN0bW5i6toymNisx4jJ
	 QfmKlWQ61jlEcX8i9rply5W3eonhlY9T9PQ7FdCEcxOawjKBOdhgv2550RGkI9PrU855k
	 CmE8wM3i0KGOS6B+M3z1k66LLgzFkwLiTqDuuFh0OknPImLyfKkLU2glM8APJfpG1Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OpINkCMT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709A606A333;
	Thu,  5 Nov 2026 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8709A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OpINkCMT
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 34AEB2020F5;
	Thu, 05 Nov 2026 16:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793890833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=;
	b=OpINkCMTWfmWgbQqY37XhoZ8X9wm4O2L3BWfnUPYRAth8HkmMe4fzWhQn3gBFzNG/ypfEs
	MpIITGdsaV+v/f8LVF8pR55ZZS3IvRtBNUW/jP7TUoX6hFdG0H3RadL2cRJE3UZ/Ky9fZO
	EErUUBqiW4uNvEqH+61XAW3mlge+z8XJHoKRAQJyXgvyftQx7ku0F96VYC3JWaSDIn/B5k
	BiQlGEDU3SH8knrpfiR5uNsGErlvw/i8HwhNiQjvgYNac2ZW4RvEXO/AA7sFXcImtOMRk+
	4lhvs5brzSaGqh3Urb7kvmSN+DLR7OVRaBnTvfAa3LJtw+UM1jTZ2TIGGOwVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793890833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=;
	b=AfEQ9ItYIfx67ZQHnZOiSCYhIozwM6hgy30D8bFub2sla6xj+BMUezQSQdRG3/tPvcLPXj
	Sr5aRX5kTa7JVA/iR6HEgIGZ+pQ6aOR1LjLHgT9SD45O3SpVaEgk8x/rC+cDTqsXsPbicc
	vwQ4NMzFtIxqO3ONlPtSK2HSznSrozM1U94k11rRluDsGsOkYLYa056Rmb74aLU9nZxL/M
	E8ZJsvmS4ZYA1nx0jdRbqecqmhvC27VsIeUxp4FYplS7LD8gYcvdShAAVRc8jkTkEKmEEz
	0FfC9Ni6nKqGbzSzi+RWRxBXf1Jvp4R8sI9WTFoLjZbYRXAIxZeOhjZxAUBGqA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793890833; a=rsa-sha256;
	cv=none;
	b=J43jk3juJ6r4hf7tDRXaaJIfsdU70nVFRR2ywvs2kQTcqrsRAqZkUq5TaTlbxVFpUF9EBw
	1bsCG/GTGWGXI92+iVgQeEsByCZqYvEI6xXYwN1N27ilZda6nOJxCR2xirGhM2zkJhqEiB
	NZ00yft5WBRR7/foUf9Qyj75qO9mtsQSASnndyRI1zgdVI8t5OWHNNFYjIzj1Ca3hw76xr
	0Vh7rGZXAIp3mfjdbr5jqp0iOEkFpKKim/5BCplmpTZKsrhwsGTIXe6E2ySnqT0ktN1Xji
	krki923h0pCgjSmo451il+FavEr48Z5gvelEDeQOrJmIFLN+rV0kzNj/nAb5dA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 16AA81BF5CC; Thu, 05 Nov 2026 16:00:33 +0100 (CET)
Date: Thu, 5 Nov 2026 16:00:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
References: <20261105144920.2796623-2-robh@kernel.org>
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
In-Reply-To: <20261105144920.2796623-2-robh@kernel.org>

On 26-11-05 08:49, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Rebased
> 
> It's been nearly a year and these are still orphans. There was a promise
> to upstream something for the kontron ones, but that hasn't happened.

That's unfortunate, but these includes are used at least by the barebox
bootloader [1,2], dropping these would cause a DT regresssion.

Would it help to upstream [1,2]?

Regards,
  Marco

[1] https://elixir.bootlin.com/barebox/v2026.10.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
[2] https://elixir.bootlin.com/barebox/v2026.10.0/source/arch/arm/dts/imx6q-samx6i.dts#L8

> 
>  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
>  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
>  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
>  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
>  4 files changed, 123 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> deleted file mode 100644
> index 5a9b819d7ee8..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6dl.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> -	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> deleted file mode 100644
> index e76963436079..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6q.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Quad/Dual";
> -	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> deleted file mode 100644
> index 3a968782e854..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -//
> -// Copyright 2017 NXP
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	mpl3115@60 {
> -		compatible = "fsl,mpl3115";
> -		reg = <0x60>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> deleted file mode 100644
> index 3d56a4216448..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	adc@52 {
> -		compatible = "ti,adc081c";
> -		reg = <0x52>;
> -		vref-supply = <&reg_2p5v>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -};
> -
> -&i2c3 {
> -	rtc@68 {
> -		compatible = "dallas,ds1337";
> -		reg = <0x68>;
> -	};
> -};
> -
> -&pcie {
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> -- 
> 2.53.0
> 

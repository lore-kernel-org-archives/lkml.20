Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557383;
	b=ljI8bDvfNEgxsXeS+Xd+4gD6GAm/NQqgYMOOlnLrcLs65y4KMsUyQ5h1Cio/0S5qq6KF
	 m+/iQTfk0YsVFGlYs8hMOpLeld5/zDjihz8z0YDEdK1TSGqOe3AE7MzLxvxl1ATXFyaJj
	 2t0rrkklooETiR7CEEX0cwY6R7MynFMdagbkkVU4kC1BB2twrEN87yG12hL/yLgh3Jly4
	 smBlHMusKeCXZO9vM34XK15b4TP8mTzBeEPGpj1JjI6pPgzv05R7V4ujo6a7ogjcEsOIF
	 pvbnKv5+oEnhZX6KZPvxiOEk5CS+UxgTODVhi62uKVlj2XzZ+DTK/of3RcDCkqTwZTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557383;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=tFhldmzZtrcUIX+IHzur5sfIp07vN9tRvmim7V5lDx4=;
	b=gkAYY/ktUsCP+hE5kMWLU5e1UzBvOn5+GCKAs55hcdSmbClTYfTW1Y5gDqBiOX9rg/rv
	 oTT3M9izrN/J/dFhX1S/0yQlE4DX+WMIV9TmJaTGTKX9pC2e3nHMVAlfvywBoIgbpwddA
	 dBzv9qUYRAB9aDS16Uy+V1Nz6AecL5chB023YIEHFOTF8LcPXTNokUgNdiwRnzu91RORN
	 +CCGEQVGTVA+43Eo7yIkF0AxPBM1Rm896fQQJg2TcIE3QQG1RiZD4ILsvvQseCehj0Agd
	 fCKOf5dRjapHWpYnsIyxDJtPFhHjaahea832yyHAtz84+SnBGDbFQIUoJ6Vpi9XoWhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R79qgKyT;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E015606A324;
	Sun,  1 Nov 2026 18:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E015606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R79qgKyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tFhldmzZtrcUIX+IHzur5sfIp07vN9tRvmim7V5lDx4=; b=R79qgKyTpWDh/2r+KkK2V4mheb
	qOSlYOoAbkSjs5lkPygzmKzgBr3ZVxFRQVQHZopx+84lD7lZXRQYF97a0ZdLv349IjUfFbMvo3+Tu
	C6i5G9suQZDFGz60r9mkj7CPTnE/Bp8V52PaE6bAukRcWXjPEQYFqbSF5zYoMYLCqSyD8kwMR6ywu
	UVRvi9up5Usq0r33eZFd864U5BzOClIIIf+E23mLfS0QaDYIQ//6lc9917fD7oODkzB9SuXLUhKgy
	cq25YB9e7V7bUTTcnjoq9YF+Phjry/avVreKgoYD4JMQmT60DNa3ewLOII60tk6WyZzjCygmrEaBO
	gLem3wmA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bob Hui <bg9oxa@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bob Hui <bg9oxa@163.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Sun, 01 Nov 2026 19:22:54 +0100
Message-ID: <2372620.HovnAMPojK@phil>
In-Reply-To: <20261023-quarkpi-ca2-v10-2-9db904194e03@163.com>
References:
 <20261023-quarkpi-ca2-v10-0-9db904194e03@163.com>
 <20261023-quarkpi-ca2-v10-2-9db904194e03@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 22. Oktober 2026, 18:26:21 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Bob Hui:
> Add a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S based card
> computer. The board comes in 4, 8 and 16 GiB LPDDR4X variants with
> 32 GB, 64 GB or 128 GB of eMMC; this was tested on the 16 GiB/128 GB
> one.
>=20
> Supported peripherals:
>   - 2x LPDDR4X SDRAM and eMMC, plus the microSD card slot
>   - RK806-1 PMIC with the full regulator tree
>   - HDMI output up to 4K60, through hdptxphy0 and VOP2
>   - Gigabit Ethernet with the YT8531 RGMII PHY on MDIO1
>   - four USB Type-A ports (1x USB 3.0, 3x USB 2.0)
>   - USB Type-C port with USB 3.0 and DP output, described through the
>     USBDP PHY and DP0, with role switch and DP altmode
>   - 3.5 mm headset jack (headphones + microphone) with the ES8388
>     codec, the headphone amplifier and jack detection
>   - three function keys (volume down, volume up and PWR_ON from the
>     PMIC) and the headset hook button
>   - IR receiver, 4-pin PWM fan connector and two LEDs
>   - 3-wire debug UART (UART2)
>   - 40-pin expansion header with UART5, I2C3, I2C5, SPI0 and PWM14
>   - two 26-pin MIPI DSI and three 22-pin MIPI CSI connectors, with the
>     connector I2C buses enabled (i2c4, i2c7); panels and cameras are
>     described by overlays
>   - M.2 E-key socket for a WiFi/BT module, with the PCIe 2.0 x1 link
>     enabled (pcie2x1l2, combphy0_ps)
>   - Mali GPU and the three NPU cores

Please trim your commit message down a lot, this should definitly
not be this long and contain stuff nobody cares about ;-)
So I guess the above should be enough.


> Assisted-by: Hermes:deepseek-v4-flash

Assisted-by got removed again from the process documentation with 7.4-rc1
so is not necessary anymore.


> Signed-off-by: Bob Hui <bg9oxa@163.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Andrew always just reviews part of the board, namely the gmac and mdio
nodes - and states that in his review mail, so I guess a nice way to
do this would be:

Reviewed-by: Andrew Lunn <andrew@lunn.ch> #gmac1 + mdio1


> +	aliases {
> +		mmc0 =3D &sdhci;
> +		mmc1 =3D &sdmmc;
> +		ethernet0 =3D &gmac1;

please sort properties according to the devicetree writing guide,
namely here, properties alphabetically, "e" comes before "m".

> +		button-vol-up {
> +			label =3D "volume up";
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			press-threshold-microvolt =3D <17000>;
> +		};
> +
> +		button-vol-down {
> +			label =3D "volume down";
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +			press-threshold-microvolt =3D <417000>;
> +		};

similarly please sort nodes without addresses alphabetically,
"down" before "up"


> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
[...]
> +	};
> +
> +	combophy_avdd0v85: regulator-combophy-avdd0v85 {
[...]
> +	};
> +
> +	combophy_avdd1v8: regulator-combophy-avdd1v8 {
[...]
> +	};

another example of the sorting issue.
The parts I highlight are not exhaustive, please make sure all are
sorted correctly.

[...]

> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;

regulator-suspend-microvolt is deprecated in the binding, please don't
introduce new instances of it. (applicable to all cases)


> +&i2c2 {
[...]
> +};
> +
> +&cpu_l0 {

please sort phandle references alphabetically, &cpu... before &i2c
same for all other places in the file.

> +/ {

you have one root block at the top, you should definitly not need another
one here.


> +/ {

or here

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";


> +&{/} {

this is geting crazy now

> +	ir_receiver: ir-receiver {
> +		compatible =3D "gpio-ir-receiver";
> +		gpios =3D <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ir_receiver_pin>;
> +	};
> +};
> +


Heiko



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737675;
	b=imQmVh/ECx0vDFg46xU5TYyflKrhtte/+WMTREKnVFi7sXjZ2fXF1P2DBLS+0bCbZHiy
	 vWK44ltL/G16d9+gaJM5bIsAH8kW9xZy+0qZcdDsjiFfH/OxNF3m3h8ld33ovmIKmzCSw
	 tHLNFjzmsnRbtXCrXaTJwNboqlPH7r0SqUPM6rvuySA4x646DU/7Bu6O1f1MrzlFDIMsd
	 0zhL7flbw63p2N7gHoQcSbgI/EcRULMpnZm3+1IaVxg1X+91bNn1NNJPd/cdBXk7wsoZS
	 Vm2PrHQZ80gHYI9ZBAAW1dCmmwv43rYWTMa2Ej9/1vk3HxXGEX3S3PDnRs0FP0YSctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737675;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jsOzBPklyFHN5jTwfkFr9FXyJBSWMNCCaNjdoNWryzI=;
	b=POY/owmw5XohB32jNExszOkscfg/7GpScCYAlGadRNu9Gg7uadBS76i0UrBLv1Zx6/BQ
	 wMMUQvvpphDnZWiniEc/CwOZ6GKJtzUGp3DCnx9kA6K9NSmkbA4PovL9c0ZzbDBVZDgeD
	 XSqH70s5GGEZ2I3Z12xnXtZGdKbKawdPAYtG05k3ZxFvLcP2OblVbJBI5WqjdVGHXO1mP
	 JhmvAId/XReISdeTTrYM7lpNroya75XrymL7KLrYhoIuH46sZPd6L9ZR1GljTGOzINXKJ
	 vQAiVXEJKNN3oZ6E1Q1hT7fmw6Hlp5Z2Ib8iN++pwM9XviOsSt8FO7GOPJOuMQUrdnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1Er7Is7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F05606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1Er7Is7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA0A1F000CA
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737675;
	bh=jsOzBPklyFHN5jTwfkFr9FXyJBSWMNCCaNjdoNWryzI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=V1Er7Is7RnbiN+NUKhpa7FNisKKeKAeIHVG0MSGXlUllTsgiQGQZ8nANCSvWShb7Q
	 F6jL89F2bgxfUFYcXnSBmX6dZKYBbb0HAX8PSbbS7m0gbfxJlvDg9pJGLihL3ej+9U
	 7nM+CU139jM5pPG84S2RPRVrX/XR1hydrKFRTYaXvvrs+BwnDIoKbVi+1T/RpA0PCg
	 EPg9g1Oic7PKGias7RsjP5EKt3s3hYfW4XmP+upEPUoHNnjciASlMIuzhgneSx1o/g
	 sHWagyUnThMscZtCgCwejHFEtBPBoSgAR1Bcz2/YZYU+A/rIIQCNyvGS8xDzWSUdQd
	 sCrBBPMKaW9WA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso26427611fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:14:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqxreUhuz97Ah+ypjBjBBynkEuKa8zJmFS9mZsPb0ADfZkjon9VVApc92rOqAzhGCxqrzSUummonfFFqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P56u29kuwqRolwvgd3aj4deocjJ27vKgQwN+ifvpmlr4VAcqj
	7Lv8oZ0QD9rw+i63LJtabhTPKMTKDyq1vcyKul8urt4RDx9YX2EohvSIjGSVASJgYgHP9zLevVV
	afhX8S0d7Dq0sqFLiI0YbTECOJsH01h0=
X-Received: by 2002:a05:651c:e0a:b0:3ab:3bf3:1604 with SMTP id
 38308e7fff4ca-3ae2b522732mr26530741fa.26.1794737673900; Sun, 15 Nov 2026
 02:14:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com> <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
In-Reply-To: <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:14:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
X-Gm-Features: AclHuK_6A40eJrlmY5f-ZeGht5rVlzRHC6fRhBB__iltMURvpQkARgIjbXIIKYQ
Message-ID: <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: filipescu.cristian@gmail.com
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
<devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
> including its regulators, storage, Ethernet PHY, LEDs and USB ports.
>
> Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetection,
> which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> registration and keep reset outside interface detach so its configured
> 125 MHz clock output is retained. Use PHY-internal RGMII delays.
>
> Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMMC
> DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
>
> Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.s=
krabec@gmail.com/
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++++=
++++++
>  2 files changed, 380 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index aa21f58a4..7ea136380 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-p=
lus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> new file mode 100644
> index 000000000..e2ca41b94
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> +// Based on sun50i-h6-orangepi-3.dts, which is:
> +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>

We now have a common sun50i-h6-orangepi.dtsi file. You really should
rewrite this patch to just use that as a base.  It is mostly the same
across all the OrangePi H6 boards.

> +
> +/dts-v1/;
> +
> +#include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +       model =3D "OrangePi 3 LTS";
> +       compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> +
> +       aliases {
> +               ethernet0 =3D &emac;
> +               ethernet1 =3D &aw859a;
> +               serial0 =3D &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       connector {
> +               compatible =3D "hdmi-connector";
> +               ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_con_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_out_con>;
> +                       };
> +               };
> +       };
> +
> +       ext_osc32k: ext-osc32k-clk {
> +               #clock-cells =3D <0>;
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <32768>;
> +               clock-output-names =3D "ext-osc32k";
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-0 {
> +                       function =3D LED_FUNCTION_STATUS;

The schematic (v1.4) calls this the "PWR" LED.

> +                       color =3D <LED_COLOR_ID_RED>;
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&led_red_pin>;
> +                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> +               };
> +
> +               led-1 {
> +                       function =3D LED_FUNCTION_POWER;

And this one the "STATUS" LED. So you have the two functions swapped.

> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&led_green_pin>;
> +                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> +                       default-state =3D "on";

And this should go to the power LED.

> +               };
> +       };
> +
> +       reg_gmac_3v3: gmac-3v3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "gmac-3v3";
> +               vin-supply =3D <&reg_vcc5v>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               startup-delay-us =3D <150000>;
> +               enable-active-high;
> +               gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> +       };
> +
> +       reg_vcc5v: vcc5v {
> +               /* board wide 5V supply directly from the DC jack */
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc-5v";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_wifi_3v3: wifi-3v3 {
> +               /* 3.3V regulator for WiFi and BT */
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "wifi-3v3";
> +               vin-supply =3D <&reg_vcc5v>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               enable-active-high;
> +               gpio =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +       };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "ext_clock";
> +               reset-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> +               post-power-on-delay-ms =3D <200>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdca>;
> +};

Set the supply on all cores.

> +
> +&de {
> +       status =3D "okay";
> +};
> +
> +&dwc3 {
> +       status =3D "okay";
> +};
> +
> +&ehci0 {
> +       status =3D "okay";
> +};
> +
> +&ehci3 {
> +       status =3D "okay";
> +};
> +
> +&emac {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ext_rgmii_pins>;
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&ext_rgmii_phy>;
> +       phy-supply =3D <&reg_gmac_3v3>;
> +       allwinner,rx-delay-ps =3D <0>;
> +       allwinner,tx-delay-ps =3D <0>;
> +       status =3D "okay";
> +};
> +
> +&gpu {
> +       mali-supply =3D <&reg_dcdcc>;
> +       status =3D "okay";
> +};
> +
> +&hdmi {
> +       hvcc-supply =3D <&reg_bldo2>;
> +       status =3D "okay";
> +};
> +
> +&hdmi_out {
> +       hdmi_out_con: endpoint {
> +               remote-endpoint =3D <&hdmi_con_in>;
> +       };
> +};
> +
> +&mdio {
> +       reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> +       reset-delay-us =3D <15000>;
> +       reset-post-delay-us =3D <100000>;
> +
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible =3D "ethernet-phy-id4f51.e91b";
> +               reg =3D <1>;
> +
> +               motorcomm,clk-out-frequency-hz =3D <125000000>;
> +               rx-internal-delay-ps =3D <1950>;
> +               tx-internal-delay-ps =3D <1950>;
> +       };
> +};
> +
> +&mmc0 {
> +       vmmc-supply =3D <&reg_cldo1>;
> +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +       disable-wp;
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +};
> +
> +&mmc1 {
> +       vmmc-supply =3D <&reg_wifi_3v3>;
> +       vqmmc-supply =3D <&reg_bldo3>;

Something is fishy here. The schematic also shows vcc-wifi-io (on the aw859
side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at least
checking with a multimeter to confirm what the voltage is on the VDDIO
pin of the module.

> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       bus-width =3D <4>;
> +       non-removable;
> +       status =3D "okay";
> +
> +       aw859a: wifi@1 {
> +               reg =3D <1>;
> +       };
> +};
> +
> +&mmc2 {
> +       vmmc-supply =3D <&reg_cldo1>;
> +       vqmmc-supply =3D <&reg_bldo2>;
> +       mmc-ddr-1_8v;
> +       mmc-hs200-1_8v;
> +       cap-mmc-hw-reset;
> +       non-removable;
> +       bus-width =3D <8>;
> +       status =3D "okay";
> +};
> +
> +&ohci0 {
> +       status =3D "okay";
> +};
> +
> +&ohci3 {
> +       status =3D "okay";
> +};
> +
> +&pio {
> +       vcc-pc-supply =3D <&reg_bldo2>;
> +       vcc-pd-supply =3D <&reg_cldo1>;
> +       vcc-pg-supply =3D <&reg_bldo3>;
> +};
> +
> +&r_ir {
> +       status =3D "okay";
> +};
> +
> +&r_pio {
> +       vcc-pm-supply =3D <&reg_bldo3>;
> +
> +       led_green_pin: led-green-pin {
> +               pins =3D "PL7";
> +               function =3D "gpio_out";
> +               drive-strength =3D <10>;
> +       };
> +
> +       led_red_pin: led-red-pin {
> +               pins =3D "PL4";
> +               function =3D "gpio_out";
> +               drive-strength =3D <10>;
> +       };
> +};
> +
> +&r_i2c {
> +       status =3D "okay";
> +
> +       axp805: pmic@36 {
> +               compatible =3D "x-powers,axp805", "x-powers,axp806";
> +               reg =3D <0x36>;
> +               interrupt-parent =3D <&r_intc>;
> +               interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <1>;
> +               x-powers,self-working-mode;
> +               vina-supply =3D <&reg_vcc5v>;
> +               vinb-supply =3D <&reg_vcc5v>;
> +               vinc-supply =3D <&reg_vcc5v>;
> +               vind-supply =3D <&reg_vcc5v>;
> +               vine-supply =3D <&reg_vcc5v>;
> +               aldoin-supply =3D <&reg_vcc5v>;
> +               bldoin-supply =3D <&reg_vcc5v>;
> +               cldoin-supply =3D <&reg_vcc5v>;
> +
> +               regulators {
> +                       reg_aldo1: aldo1 {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc-pl-led-ir";
> +                       };
> +
> +                       reg_aldo2: aldo2 {
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc33-audio-tv-ephy-m=
ac";
> +                       };
> +
> +                       /* ALDO3 is shorted to CLDO1 */
> +                       reg_aldo3: aldo3 {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc33-io-pd-emmc-sd-u=
sb-uart-1";
> +                       };
> +
> +                       reg_bldo1: bldo1 {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcc18-dram-bias-pll";
> +                       };
> +
> +                       reg_bldo2: bldo2 {
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcc-efuse-pcie-hdmi-p=
c";
> +                       };
> +
> +                       reg_bldo3: bldo3 {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcc-pm-pg-dcxoio-wifi=
";
> +                       };
> +
> +                       bldo4 {
> +                               /* unused */
> +                       };
> +
> +                       reg_cldo1: cldo1 {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc33-io-pd-emmc-sd-u=
sb-uart-2";
> +                       };
> +
> +                       cldo2 {
> +                               /* unused */
> +                       };
> +
> +                       cldo3 {
> +                               /* unused */
> +                       };
> +
> +                       /* DCDCB is polyphased with DCDCA. */
> +                       reg_dcdca: dcdca {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1160000>;
> +                               regulator-ramp-delay =3D <2500>;
> +                               regulator-name =3D "vdd-cpu";
> +                       };
> +
> +                       reg_dcdcc: dcdcc {
> +                               regulator-enable-ramp-delay =3D <32000>;
> +                               regulator-min-microvolt =3D <810000>;
> +                               regulator-max-microvolt =3D <1080000>;
> +                               regulator-ramp-delay =3D <2500>;
> +                               regulator-name =3D "vdd-gpu";
> +                       };
> +
> +                       reg_dcdcd: dcdcd {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <960000>;
> +                               regulator-max-microvolt =3D <960000>;
> +                               regulator-name =3D "vdd-sys";
> +                       };
> +
> +                       reg_dcdce: dcdce {
> +                               regulator-always-on;
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +                               regulator-name =3D "vcc-dram";
> +                       };
> +
> +                       sw {
> +                               /* unused */
> +                       };
> +               };
> +       };
> +};
> +
> +&rtc {
> +       clocks =3D <&ext_osc32k>;
> +};
> +
> +&uart0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart0_ph_pins>;
> +       status =3D "okay";
> +};
> +
> +&usb2otg {
> +       dr_mode =3D "host";
> +       status =3D "okay";
> +};
> +
> +&usb2phy {
> +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */

This isn't connected to anything but a pull-up. And you already specified
host mode only above.


ChenYu

> +       usb0_vbus-supply =3D <&reg_vcc5v>;
> +       usb3_vbus-supply =3D <&reg_vcc5v>;
> +       status =3D "okay";
> +};
> +
> +&usb3phy {
> +       status =3D "okay";
> +};
>
> --
> 2.47.3
>
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952588;
	b=EP9ATAYWY25hLObJQFkhAEc5oCBH/jVfyKDXUGnk2w3OtS/Bd0xH2v1euukxJQnjDQyg
	 8opUNL1BRfLwZgHNkR28Rj5/aQpACC1wvkqTIn40UZ3yMMSwWaQH3gHD5b1JZqFX6mBJT
	 tfrYdCrr5mNtwlWzNiqIjbyNrrCYi9Sy9TCEDMbOH5rmYqzhe34JimaxQhyZh/QZy0gwL
	 zZWTfX/BhRX8EtWH0wrs83N6d2k+S/UIeO3Di4oA6a/6XJ2vJNyXorxWVRnPVfRgJF6dw
	 zoCO5W98LCnyF3NYYuFTtx6hYwx9VmqSrnT042b0A1L34tz29k/oZo5RNXBiQO7Famw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952588;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=CHrI1kjHp/5iGoHZkZHTx8sVaxFMZq6Cnqe7sXoFPl4=;
	b=f841Z1QRwr5JVLWIhZZ7g/EPAFXftyuxm3kB7e8n+//UzsmkNXzO1bg8RAZg3A+nteoF
	 T9DZkpjbEYKNmzk8J5xv8G3rGmvqKjJu+ZfUUTcUuGVYOYzea5JbnQO1XMZNlVwovw4VH
	 qG1nXKbc4loep3oRTdgGqGU+XtMmEixq+9BghLtK4CUgfrY6epsjvZfnVT6PZ6LW/eKyQ
	 2+wGFCDj3U+ZGD5u+2yGY2bcVWPl5h22QLG1exLu1FwliXo6Nzbrpb+r1mXf9bO7i3ECI
	 u3s4awJas3tskDmMqRIztST5gCQJQj1KhAuCBYj0g020pIT6swVhbkXy0f0KezXDQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nyKGNyB1;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69275606A332;
	Fri,  6 Nov 2026 08:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69275606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nyKGNyB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CHrI1kjHp/5iGoHZkZHTx8sVaxFMZq6Cnqe7sXoFPl4=; b=nyKGNyB1GN6bxn4Vmwjn3rF3UC
	+S8e/L/utkMkZDWQB31Si0I9y2MoS9aqjmU0uqp4avOKj855x9tM96oti7qTMCttyqW2YCf3oNTTQ
	XtOiVdPRnJUSuPtzt3+81bNXLLSfJYw2oM69FTSKx1A1Mu2MK/Qud1sdG97DC7e+8dzaB7hKYSHQA
	ZtK85bgLt0fQ46ldrAbI4dWVGfomHEYciJPMfriFCLE2SkMkuEZ3PJh+712CrwsWCKQsbnSH7Q2uz
	IWQHV8KK4ncTo3QbYNe2guilYO+4veWMqUbly7fXO5B3W+rLAu7PvrBYp4xwqc4P5BbI4PMH8G63s
	FFUKU4Qg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaozhong Li <yaozhonguwl@gmail.com>
Subject:
 Re: [PATCH v3] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Fri, 06 Nov 2026 09:09:30 +0100
Message-ID: <6900453.LvFx2qVVIh@diego>
In-Reply-To: <20261106061835.1316-1-yaozhonguwl@gmail.com>
References: <20261106061835.1316-1-yaozhonguwl@gmail.com>
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

Hi,

Am Freitag, 6. November 2026, 07:18:35 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yaozhong Li:
[...]
> - Describe the slot's own supply, vcc_sd, and use it as the sdmmc
>   vmmc-supply (Heiko). It is fed from vcc3v3_sys, and GPIO4_D6 controls
>   the slot power switch: holding the pin low leaves the card unpowered.
>   This is the same arrangement as vcc3v0_sd on the ROC-PC. The existing,
>   unreferenced lcd_panel_reset pinctrl entry also names GPIO4_D6; the
>   vendor tree uses the pin only for vcc_sd.

I you're reading the schematics, this is wrong.

In the schematics file Shawn linked to earlier (and also the one I have),
GPIO4_D6 is connected to the reset-pin of an AT18.

While the vcc3v0_sd is an always on regulator coming from vcc3v3_sys.
As stated in v2, see page 20 of your schematics.

So you essentially just set vmmc-supply to vcc3v3_sys. As I said that is
merely descriptive.


Heiko

> - Link to v2: https://lore.kernel.org/all/20261105102556.1365-1-yaozhongu=
wl@gmail.com/
>=20
> Changes in v2:
> - Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
>   instead of dropping it (Heiko)
> - Rewrite the commit message (Heiko)
> - Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhong=
uwl@gmail.com/
>=20
> On the boot-time issue described in v2: with the vmmc-supply in place
> the sdmmc controller now probes after the GRF io-domain here, and a card
> present at boot came up in SDR104 in 5 of 5 warm boots, against 0 of 8
> before. That is a change in probe order rather than a fix for the
> ordering problem itself.
>=20
>  .../boot/dts/rockchip/rk3399-firefly.dts      | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa..03858a4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -233,6 +233,19 @@ vcc5v0_typec: regulator-vcc5v0-typec {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> +	vcc_sd: regulator-vcc-sd {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc_sd_en>;
> +		regulator-name =3D "vcc_sd";
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc3v3_sys>;
> +	};
> +
>  	vcc_sys: regulator-vcc-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";
> @@ -731,6 +744,12 @@ wifi_enable_h: wifi-enable-h {
>  		};
>  	};
> =20
> +	sdmmc {
> +		vcc_sd_en: vcc-sd-en {
> +			rockchip,pins =3D <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	usb-typec {
>  		vcc5v0_typec_en: vcc5v0_typec_en {
>  			rockchip,pins =3D <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -777,7 +796,7 @@ &sdio0 {
> =20
>  	/* Power supply */
>  	vqmmc-supply =3D <&vcc1v8_s3>;	/* IO line */
> -	vmmc-supply =3D <&vcc_sdio>;	/* card's power */
> +	vmmc-supply =3D <&vcc3v3_sys>;	/* card's power */
> =20
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> @@ -804,6 +823,9 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_sd>;
> +	vqmmc-supply =3D <&vcc_sdio>;
>  	status =3D "okay";
>  };
> =20
>=20
> base-commit: 940de590b839f71d6dc846160534bf202401b8b7
>=20





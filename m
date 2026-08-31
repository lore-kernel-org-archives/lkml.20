Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4B403B0E;
	Mon, 31 Aug 2026 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179804; cv=none; b=ryjCLZz4OnHKvjWE2+zWcN3dNGBrMTGzJe419tXlTX9IEyi6hpKT1ECKu7ffreIH+YAqpUATx0mzDrXLnFEbMbxaV5nC61wluPych5d8maByuqD88KtTUdEohs21Ul+1NYKXF1O46apgcxkK38rojPkIevyRWsxxgOiuyNnMBgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179804; c=relaxed/simple;
	bh=3xn6EbsJQTv8n8sWrncDHv0Frn/z9/lxD60oQFGeWeA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KTaV7HPPMPP324ZMfRRHenpSz9eTH2/F2YmJYdli62nxp0JsOq15UTMGoayHZwkqGA6/sASmOj1v7CUMf+VgD/ZqypDWQTYBLSrktFmEOdQb8d3yaV3ZG4kQ4pZDP5+YSUFufwM5t3zvcPTIiJScDg4A6UBY31vL87UXLWVwoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LswL4YcE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LswL4YcE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E5C41A1910;
	Mon, 31 Aug 2026 12:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E32E360231;
	Mon, 31 Aug 2026 12:36:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1072C11C783F8;
	Mon, 31 Aug 2026 14:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788179795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fDkwzF0tc0UWuOWxyLku2+JHWMLLyGVwL0Bv7ZP3/YM=;
	b=LswL4YcEz5i/RniNTvJX2nWI/MncEK+5aFpfsXZO1u1XCltKY8KVX9xn+MIS7/0U66Mg+D
	o7smOZnhqWm8cea0Ci9NqcKDmKPZsu1Iij4RM6wWawneyxASnbp+gaxQ2XStcTG3aJhwfZ
	NaCKX8ekAt6SfjjjYbAEOA6YQehvGc4Y+OObz0qWbqcT5ySZ5bNZkmmH49uWmdbLwce+vc
	NCdt9t/tJXtkZEw/uWDHpKHsjXitbgTvQAOH3OmnDnKvDlukeITMaRNRvQFkgC1HKQr/OB
	8dUIG14XYWWXTDXkHvggYKv9DEuQO/wViba+NwKaR3ILs9/C/13EojzVTV81kQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: marvell: Replace spaces indentation with tabs
In-Reply-To: <20260829194043.107875-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194043.107875-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:36:31 +0200
Message-ID: <875x0qpiuo.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/dove.dtsi           | 22 +++++++++----------
>  arch/arm/boot/dts/marvell/kirkwood-6282.dtsi  | 15 ++++++-------
>  .../marvell/kirkwood-guruplug-server-plus.dts |  4 ++--
>  arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi  |  4 ++--
>  .../boot/dts/marvell/kirkwood-synology.dtsi   | 12 +++++-----
>  .../dts/marvell/orion5x-rd88f5182-nas.dts     |  2 +-
>  6 files changed, 29 insertions(+), 30 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/dove.dtsi b/arch/arm/boot/dts/marv=
ell/dove.dtsi
> index 062c86361640..75e2f9baf661 100644
> --- a/arch/arm/boot/dts/marvell/dove.dtsi
> +++ b/arch/arm/boot/dts/marvell/dove.dtsi
> @@ -100,12 +100,12 @@ pcie: pcie {
>  			msi-parent =3D <&intc>;
>  			bus-range =3D <0x00 0xff>;
>=20=20
> -			ranges =3D <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x20=
00
> -			          0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000
> -				  0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0   /* Port 0.0 Mem */
> -				  0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0   /* Port 0.0 I/O */
> -				  0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0   /* Port 1.0 Mem */
> -				  0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
> +			ranges =3D <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x20=
00>,
> +				 <0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000>,
> +				 <0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0>,   /* Port 0.0 Mem */
> +				 <0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0>,   /* Port 0.0 I/O */
> +				 <0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0>,   /* Port 1.0 Mem */
> +				 <0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
>=20=20
>  			pcie0: pcie@1 {
>  				device_type =3D "pci";
> @@ -117,8 +117,8 @@ pcie0: pcie@1 {
>=20=20
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
> -				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0
> -				          0x81000000 0 0 0x81000000 0x1 0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0>,
> +					 <0x81000000 0 0 0x81000000 0x1 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>=20=20
>  				#interrupt-cells =3D <1>;
> @@ -146,8 +146,8 @@ pcie1: pcie@2 {
>=20=20
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
> -				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0
> -				          0x81000000 0 0 0x81000000 0x2 0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0>,
> +					 <0x81000000 0 0 0x81000000 0x2 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>=20=20
>  				#interrupt-cells =3D <1>;
> @@ -772,7 +772,7 @@ rtc: real-time-clock@8500 {
>=20=20
>  			gconf: global-config@e802c {
>  				compatible =3D "marvell,dove-global-config",
> -				             "syscon";
> +					     "syscon";
>  				reg =3D <0xe802c 0x14>;
>  			};
>=20=20
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi b/arch/arm/boot=
/dts/marvell/kirkwood-6282.dtsi
> index e33723160ce7..9f63e3f9eb1c 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
> @@ -11,14 +11,13 @@ pciec: pcie@82000000 {
>=20=20
>  			bus-range =3D <0x00 0xff>;
>=20=20
> -			ranges =3D
> -			       <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
> -			        0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
> -				0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
> -				0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 MEM=
 */
> -				0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO =
 */
> -				0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 MEM=
 */
> -				0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 IO =
 */>;
> +			ranges =3D <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x0000=
2000>,
> +				 <0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000>,
> +				 <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000>,
> +				 <0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 M=
EM */>,
> +				 <0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 I=
O  */>,
> +				 <0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 M=
EM */>,
> +				 <0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 I=
O  */>;
>=20=20
>  			pcie0: pcie@1,0 {
>  				device_type =3D "pci";
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts =
b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
> index d5aa8b505cc0..cc88d5324983 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
> @@ -104,14 +104,14 @@ &mdio {
>  	ethphy0: ethernet-phy@0 {
>  		/* Marvell 88E1121R */
>  		compatible =3D "ethernet-phy-id0141.0cb0",
> -		             "ethernet-phy-ieee802.3-c22";
> +			     "ethernet-phy-ieee802.3-c22";
>  		reg =3D <0>;
>  	};
>=20=20
>  	ethphy1: ethernet-phy@1 {
>  		/* Marvell 88E1121R */
>  		compatible =3D "ethernet-phy-id0141.0cb0",
> -		             "ethernet-phy-ieee802.3-c22";
> +			     "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi b/arch/arm/boot=
/dts/marvell/kirkwood-lsxl.dtsi
> index 5e0b139dd4fb..4206529b4a52 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
> @@ -168,8 +168,8 @@ gpio_fan {
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fan_low &pmx_fan_high &pmx_fan_lock>;
>  		pinctrl-names =3D "default";
> -		gpios =3D <&gpio0 19 GPIO_ACTIVE_LOW
> -		         &gpio0 18 GPIO_ACTIVE_LOW>;
> +		gpios =3D <&gpio0 19 GPIO_ACTIVE_LOW>,
> +			<&gpio0 18 GPIO_ACTIVE_LOW>;
>  		gpio-fan,speed-map =3D
>  				<0    3>,
>  				<1500 2>,
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi b/arch/arm/=
boot/dts/marvell/kirkwood-synology.dtsi
> index 6b7c5218b1fb..de34bc2446ed 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
> @@ -281,7 +281,7 @@ gpio-fan-150-32-35 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
> -		             &pmx_fanalarm_35>;
> +			     &pmx_fanalarm_35>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio1 0 GPIO_ACTIVE_HIGH
>  			 &gpio1 1 GPIO_ACTIVE_HIGH
> @@ -301,7 +301,7 @@ gpio-fan-150-15-18 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
> -		             &pmx_fanalarm_18>;
> +			     &pmx_fanalarm_18>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio0 15 GPIO_ACTIVE_HIGH
>  			 &gpio0 16 GPIO_ACTIVE_HIGH
> @@ -322,7 +322,7 @@ gpio-fan-100-32-35 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
> -		             &pmx_fanalarm_35>;
> +			     &pmx_fanalarm_35>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio1 0 GPIO_ACTIVE_HIGH
>  			 &gpio1 1 GPIO_ACTIVE_HIGH
> @@ -343,7 +343,7 @@ gpio-fan-100-15-18 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
> -		             &pmx_fanalarm_18>;
> +			     &pmx_fanalarm_18>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio0 15 GPIO_ACTIVE_HIGH
>  			 &gpio0 16 GPIO_ACTIVE_HIGH
> @@ -364,7 +364,7 @@ gpio-fan-100-15-35-1 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
> -		             &pmx_fanalarm_35>;
> +			     &pmx_fanalarm_35>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio0 15 GPIO_ACTIVE_HIGH
>  			 &gpio0 16 GPIO_ACTIVE_HIGH
> @@ -385,7 +385,7 @@ gpio-fan-100-15-35-3 {
>  		status =3D "disabled";
>  		compatible =3D "gpio-fan";
>  		pinctrl-0 =3D <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
> -		             &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
> +			     &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
>  		pinctrl-names =3D "default";
>  		gpios =3D <&gpio0 15 GPIO_ACTIVE_HIGH
>  			 &gpio0 16 GPIO_ACTIVE_HIGH
> diff --git a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts b/arch/a=
rm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
> index 75ab913b21e5..1d803d1d1112 100644
> --- a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
> +++ b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
> @@ -22,7 +22,7 @@ chosen {
>=20=20
>  	soc {
>  		ranges =3D <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000>,
> -		         <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
> +			 <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
>  			 <MBUS_ID(0x01, 0x0f) 0 0xf4000000 0x80000>,
>  			 <MBUS_ID(0x01, 0x1d) 0 0xfc000000 0x1000000>;
>  	};
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

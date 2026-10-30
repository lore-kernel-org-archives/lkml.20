Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388598;
	b=dv06oBTeOKN3KF+Cp60b97kcEmiWcV/Z/V3P67m91WxlOLIaFxgAPA3sjlSD8v9xltum
	 f+F082zfZjKQuF8ptPDF7RIemO4aUllVSOdTdPB8iQ9Wamfi3Qni4DmsOPTn0G4W3Zmxw
	 yZzKdHJCbNgkq1X9B8pGylQ32i91eGvvPZQabK2O13gF2rBV4aN3HOBDn7uOftzP81oYZ
	 i6Vrzx3a4eXurFM0K06FEhpyD3RQJx2we+Se5xs1sWTCdeIOd1xdF81vGIo6E3zH4aiV3
	 yMznfZi0XOHMjd8l21p7WLlM4ZYAxCDLeN/sQwrJcuVpofQcIvFta5giAi6qrKvUbJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388598;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=vPaZTew6bHfge4tOyLNLySlYKC2rw8qbkKNVjP45eiQ=;
	b=4V94f9Lb4Tdxqmma7zJERmivYYZiefVh0M71zZ+kjglVJ21fVrxBbYXrX4Npt68ZuX2e
	 PUY8DDqzO/pQzup8ZYxWNNeEykvfov458zoPsybVIAX2ts4DOVAs82nbAWcHaw9T1k4qA
	 obaF6SOtSfCDA4VOu4dEUzMp8nWzbtQAxCpqfeNU2hHfxJBkTXdzlcbwHIF2AP1KzOx16
	 43jsHtUvI2sojnfK4pe4USZ9/0Ankioimu2WE9rPlgwOzbPGxcSMp3lGwFMDqYW6YQxMo
	 RaTnis2rYK+Fm21whFGe3nS03Yf/CFnTdW1iPzyJy+Bcyy7SxKe0LGSArtX6Wnjw3ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vcu0mzRq;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0D606A31A;
	Fri, 30 Oct 2026 19:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vcu0mzRq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vPaZTew6bHfge4tOyLNLySlYKC2rw8qbkKNVjP45eiQ=; b=vcu0mzRqxjxJVB7xA26R21VLOx
	1XuofCcoDvKjYRmwM2obB+hnUCFpJkF2LJaei8BwSJBywSI21TReldCkGn+wUdrlpC7lnPOFPVhJQ
	InLmBANLT+fRBAxuq/0hEXI/HTmcRD1WdeJyimQeu+GuZ+aIzaKMVUMW5u7kxr5NWsbEIeqO8r7eb
	5z+MErXmfIQH1kwv44t0UWeM9iwm1+TY4B6nc5OszREoFiojcFy4mUbQ3rDmDMv1XLbd5qsr1tFQp
	dgsq2+G4QhKtf2FimPUBNyCXhiEmCVykMTENu6eE6MY5CF20VntzbvgM9RbUsso6Sm919olW2kuYP
	eLFI0hRQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Fri, 30 Oct 2026 20:29:47 +0100
Message-ID: <1937939.QCnGb9OGeP@phil>
In-Reply-To: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
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

Am Samstag, 10. Oktober 2026, 23:53:01 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Igor Velkov via B4 Relay:
> From: Igor Velkov <iav@iav.lv>
>=20
> The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
> at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
> silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
> silergy,syr827, and enable the GPU.
>=20
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Schematic, sheet 7:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.=
2.pdf
>=20
> Tested on mainline: panfrost probes, devfreq moves vdd_gpu from 825 mV
> at 200 MHz to 1100 mV at 800 MHz, glmark2-es2-wayland under headless
> weston scores 548-577 in three runs. Two of them logged one panfrost
> job timeout each; the Armbian DT gave none in three runs.
> ---
>  .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index 63ad79b4c8ac..1f50982291bf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -339,6 +339,11 @@ &gmac {
>  	status =3D "okay";
>  };
> =20
> +&gpu {
> +	mali-supply =3D <&vdd_gpu>;
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency =3D <400000>;
>  	i2c-scl-rising-time-ns =3D <168>;
> @@ -453,6 +458,25 @@ regulator-state-mem {
>  			regulator-off-in-suspend;
>  		};
>  	};
> +
> +	vdd_gpu: regulator@41 {
> +		compatible =3D "silergy,syr828";
> +		reg =3D <0x41>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vsel2_pin>;
> +		regulator-name =3D "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;

both of these should not be needed, as the GPU should control its
regulator. (always-on and boot-on)

Heiko



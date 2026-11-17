Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933479;
	b=lYEI04i6DoiVQARMfvbZRkTQKZSAnwWeN7n1Hz33n3IxTbURh3IR4s/+M7whNwMdYEbB
	 eoPvxFTiUgq7gLMTzphMOr3wYjcfG10d5BCywFdaLYAHAKcFeJmJWZK9iKqThHFosEW95
	 VUrRaI94BDH2DGdmRUaa9eWDwmitMSsfIlsrLQMX9pnwMtDFmNRYkLEdItVbj6n0tL9t+
	 WCnQHjaIU5/Tv9+mqSZI89cj+4SRjyhgQSp+mLDuN8JaQHgRBBLauoP8XbBM5R/2HYVb+
	 xDaxVRLfTN/8PblsPwtSik9IAmijhdsZZNqxMdHK9540oNOC7gGco0bz1Kni779Euvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
	b=VmVTeuFUS0dFUuNTi0or9agHXCtzy/BWzbrnGbE8SDMTSphlyHqhtFR6eySxvMjXTEQb
	 D+0org/XLfmm38JD0Z7/IdkuxxFpocqDwOvY0SXbbcNcz5Igc3yF6Dv69dYFm15R7b9kV
	 eOPJCX+rRa0ijTYdatUDcosVOXNEIarQBFNTiKXAzcNWnw2U8n1ub3+Gy5NLycYgE16zD
	 HC73KRE+QxpQKmGrK7AZrraAutYtbRanbCeURNLnYZnzSTTVquHt26Em7z2Jm/xOnb2eK
	 j3IUpVO/bF8UZ2DqPOMqodIZxPNMD2a1guosNfbX+cYKzcfnkyELA5JAfqmANBBnygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu3VmwTq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C954A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu3VmwTq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so376605e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933477; x=1795538277; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=pu3VmwTqFXhXYIDXsNaxCSy2vpYd9ciqG5Qt6dHE2Y2iR7/QaBDmkG/QTiFKGORlFx
         vqaM505zEUTVNdgUH0LU4JJws9coXoENjeKKMkD3MxzCaus/FtSRCBebHbbVFHUbQ3NY
         lTE0McxpDzkmZpIAdJsN7CLilTT6N+3D1lBEO5IgnIL/fFgVIxMBzPJI7JG+LayPWBCg
         yHBPIjvajNZflGZLp7AKQYkrz4fswYvH2Pn+VA0+HvVvks/z8zY5yLeQKJD/ntVHGb3e
         6v7zd2i/9US6SuQ4swNUiAicqOqhNHYyaa++H1uCpZXYMAE/V3RGOs5x5cKKwLbADWJK
         8gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933477; x=1795538277;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=qIQS4L8STL2Do4Na8RZ7M1wTaPciwF0JGmXkf0Q2nhyxMrKGB5DOPMpw8nIsUwwFnY
         LwjGm7jw1sBIyMaZDYxGteyEPei66gLhXsHPtq6SMxe8dZYHgKiKYz8+zKpDjo+8LRZd
         tnzR7JDAl8iqpUWt2gcpRfNynSY/SDtmykJ95hz86Ec7Y2K57y0inuQpw4KTtj+BX2sq
         YiFNzZpxZeitlLl08uUZgS/cvYVbp+htQOesIW0DcCFjYxTMuiLVTyx+s0xQK1kktxck
         /PRZNiNmkX5q0UszXiRjHKiQqRznHKgJMil6/oPUfxmoOq4Mtnc6+EylvEDNAWVXCkeA
         lb8A==
X-Forwarded-Encrypted: i=1; AL+hErFhqCKDZ8xyTQJWcVlrIKLrCKA6g+4ooryi5fopgadIMYw1Ronfnb7nGerWadl2EulQkWABiPtuqrWbSGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AdNaZDHURONyFUtdkkFwOWXBJ96qmqqP9OpcNAhC8Tra/F6i+
	Y0WmV7wAOjxvSy+VTmT+otWKdLhNXXGYlTSZ3gspH8KF6HaJlOYtJbB2
X-Gm-Gg: AYBFou21uM6zNQ55hWVJeN6ySa10MxTBqiI98FzFpIm8tMKjKNA0vRmYP7ngptUgyag
	xFUyfXmChMA8O7XiaDut5lux7lQGmuGtX16jgHbwsd90ncwKG2VqKS9hyhJTap/Fg96R+QVxM/s
	GhVpcREHbig8MCTPQ1QNP6BBo01lZ2kulsasvSxYFTyShTAJ0EIfNXP/q/VaGdMMz+dwH1M2RHw
	SIEoEl3id+pz8CeQRU6svxVyLqMAkIPRSZ8wS6XaKcQ9lG8UZrU5jrKbdiI90a9mMzOqBVvUxbq
	68a+0JJ+MexwuWgFg01Lf6CWLhcoCZjnFKZnSgYWIWNCVcG0hxR/dT66ZWa0UPGmcztn1Dk38fk
	FR8WKaPZlEwu0vvTNEtfqVzM21vucE4l56fzsmqXGLmCmAxlEtiJkYJGhfGyXYtTR+gluFfaXpg
	EdbGaQP2sysodx0uUhtzClix8HqZB//jnb79kP8A1ImFJMEw50huo8teIsJh7NyOQZlY4AS2xr6
	t/AhqnXBxz4H7UUsU8TQ52UYIXkAptbr16q7KWctVCqOoSlXYIle8k6yEzZTVWyhJJcbkYHftdT
	Z7ZSe3ol7wyTGvndmeTO9K/FXLnjkrn279DTb2zCojAfwKMzJYBBGYxc/wu1VgEPmVm915DjL9S
	TVrYNFYgNEc84LUmoSImd18bJGxT+r00lcs8tECK7CdlI0jBWs1nLMow2FByGplBa3BRS3uGRRN
	iZCIK5iMSG4+vnZYJw7YyNMT4RcVvhsnQ4ikwI3RfZl3FMl1iITHWXTGas3q40Thy5G1m5Ugp2v
	fNSq9J8/5rIHVsoHhIKHjdR73B5BWppEibff7Z27qSbiOF4wP3V1gsrZLhn+kOgnFrH
X-Received: by 2002:a05:600c:a0b:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb68477b90mr206657185e9.7.1794933477039;
        Tue, 17 Nov 2026 08:37:57 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm29882037f8f.6.2026.11.17.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:37:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 17:37:55 +0100
Message-ID: <n0Gb_HzYRTi_JMXR8vuZwg@gmail.com>
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
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

Dne torek, 17. november 2026 ob 15:21:21 Srednjeevropski standardni =C4=8Da=
s je Jun Yan napisal(a):
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
>=20
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
> description this depends on are already merged in sunxi/dt-for-7.5.
> ---
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> index 225f42bd3b9e..9b192caeecb2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> =20
>  	aliases {
> +		ethernet0 =3D &emac;
>  		ethernet1 =3D &sdio_wifi;
>  		serial0 =3D &uart0;
>  	};
> @@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
> =20
> +&ac200_clk {
> +	status =3D "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply =3D <&reg_dcdca>;
>  };
> @@ -107,6 +112,14 @@ &ehci3 {
>  	status =3D "okay";
>  };
> =20
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rmii_pins>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ac200_ephy>;
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdcc>;
>  	status =3D "okay";
> @@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ethernet-phy-package@1 {
> +		compatible =3D "x-powers,ac200-ephy-package";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vcc-supply =3D <&reg_aldo2>;
> +		nvmem-cells =3D <&ephy_calibration>;
> +		nvmem-cell-names =3D "configuration";
> +		x-powers,ac200 =3D <&ac200>;
> +		x-powers,xmii-rx-clock-inverted;
> +
> +		ac200_ephy: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-id0044.1400";
> +			reg =3D <1>;
> +		};
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> @@ -173,6 +209,10 @@ &pio {
>  	vcc-pg-supply =3D <&reg_bldo3>;
>  };
> =20
> +&pwm {
> +	status =3D "okay";
> +};
> +
>  &r_i2c {
>  	status =3D "okay";
> =20
>=20





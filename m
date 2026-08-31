Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0C408611
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179828; cv=none; b=nojJVRRb+c+qwo74cclHc02j1gZUmix8dqcMF4sR9mC8IEFTcc+mF4ezgPOrYLzK7WZ1db6UIq9kZWgcSstFzsz4iFjvKdaJCggIP2SY25FJ2II/JHRNjWN5gd/cBvpDzyv6P/zzCatsu8/J74XakKm7S55rjKIcF+KkciJGAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179828; c=relaxed/simple;
	bh=rxafdNkhfDfqTybQYvBD6c3YqwB52Q+nzoEnzCYqAtc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=A4LBbimMPaBLbWdEIfThwNA3zPTiToHz08MA2IkgKx0wS5I1s7Ap164ZpI0orvXdvY7IK+npwpOYcDQKV0bugnsdCR3mkMjCRU5Oq40sYoDv8fkKnOoHlOPJ59hgO/D1e2GBFtAFdEp9W3fBeiqXByoYI/qbXHvBzBIF38yS100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=K1XHC5SY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="K1XHC5SY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1257753f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1788179823; x=1788784623; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=K1XHC5SYcxnGaJQ7IIVVk74WmHlY9GT9xoczspG/I4CSA+ZLPcMmkIJlBEGpoFrYov
         GWpoqZrhA3cWR/1FbOGocZkCfwkMaow9lyDuQ17kvrFdbaL7g28WdNhjdKtYZZQFSG3L
         2mUFrQJi702uTcFFL3sYptIHeSNnNu1t3hLvMnvismdviy87q6IVlEmB3Q9eNF5oXx61
         dK83PhJtDTPBFJHLmS325kNec26ujYKPj5Nh4gIstnTrZwjXvILT69wx14mTpyVTzKAJ
         3WltxTga0F9gaEko1eDQmRMOHpSAWKY3Cvp+NBAOuGj/3Dvk9NYpjtKvp2LbFL09O2di
         JZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179823; x=1788784623;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=Q0NotPCdvCq+c18pX12N6uaTD1U/+t9aWbkAFMBEJXMUubZuTe7627OkdmwmpCxpmy
         e+d3QODnUFYQuWKZ/WAthROgaQ96/oJhy+lC0q5KcR/h/8DtoVfdO9aB6U/IV/YrIpIb
         Js9EqD8T/jH0UENb4aCnrMVAmbiwt84OGx7vYM77xwTsRdVysuyMWhjgeNOhUlStKLS9
         H+hDSr91uOWLm0n1KyRxzIC9vBPiYgx8f6c/75WF+Y2aPqPDlJOwq2QV6SOOK8ph9yOQ
         QQTZccFe+DqMr38oZvMxHPO0JtIkAuNUErRd72/oIzynWNvqggc8U1jj1gVD3y0v3QPH
         CDVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyJeARgWw1v1y2kgy/SO31XGO0QS3V8GgI5TQpcwTkuXfPm6GKrPAMNoA3X2zUkxQ6/uQZrBV6542x/8c=@vger.kernel.org
X-Gm-Message-State: AFuF++ljrxwxuSlSlqc5a9A3HYpKyL1vnxNSz0V1v292epU3mOzKJ5n+
	TvNH2lM0YK1YM6nR36S88Rbd56yeVFtPcudqohjbrvkM90OUXz8Fr6AcuGc+VzUIIW19q+/zbCS
	/MaMoPgE=
X-Gm-Gg: AYBFou24iGKObUWEBeB7+IbWQPwpcdYbZQ6eb4BG8U+OCAkgYD5e1EUqbhg4whvt7rs
	bNz9Ogu5Pp4x6Xe+8gV3TfbL0Q4hxJ7+zbroml/lpnJ7c/M/M+WaOQYYfXEX/RNbQDVb/yhxHIH
	Kd6fJdxEZZ10RdmJ13XNC06XI2RSzpuGmDpsDa0NbgnfMOQmSSrtetggChlYZdiM25gluSvHS2+
	NhIgS7l0TUQU6dw/TWlG8sIiPywe8VVQsCC6FxxmZZTxOTt2oaARwfvMvVglNuzk03DxOYy2xKy
	r9tGtavhNkxT6Pg1CK5SllOz9NZDqmMPzZGyCN06GB9QfQ0VrFWMm1T82ITnmRfg4fgba5Uwt7M
	6gLqLTw66J97BPyJzY3oDOm72IP10BlF4Lj7E6d7l0fcuJ4rldoIvprSO9zQ/wW4CkB7forNYwN
	IAzeR5TdvJcUyuoRUZ09PI1D1+x76nxq17PHZ5i/Agc78oAvYIuTELsqE4ktaDFqqk/NWTA3Qn4
	jThgKCHgUWARh3BzYsbhr9Wub6Nvko97xEmh3mYjNzfGKChGCR3kOI9/krQCGQf4E8v
X-Received: by 2002:adf:e014:0:20b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-48441010765mr717293f8f.17.1788179822646;
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
Received: from white-mocha.local (p200300e66714e500cb5f91bd76cb96be.dip0.t-ipconnect.de. [2003:e6:6714:e500:cb5f:91bd:76cb:96be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm4540003f8f.33.2026.08.31.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 14:36:34 +0200
Message-Id: <178817979463.20922.10263529532171804189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788179813; l=4261;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=rxafdNkhfDfqTybQYvBD6c3YqwB52Q+nzoEnzCYqAtc=;
 b=t8LGYUPo6IQisrHMFR86MLJkpE4vyOvF+mup7Ma3JedRI7oe9cjXkFGqlpW4+NEa7i1H4cjuu
 KqDrGxOVrRaAPCrbQic/6SFFZLmVlk7lX/4SH0QIWnf7fDdf0cciMtA
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi Prasanth,

On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console, and
> MAC0 connected to an RTL8211F Ethernet PHY.

Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128 to
populate the MAC address on MAC0.

> 
> The MAC0 RGMII RX delay configuration was validated on hardware.
> The RTL8211F requires its internal RX delay for reliable operation,
> while an additional TX delay is not required.

No, it does not. The traces have the same length and don't require special
delays. If you use u-boot/next, then it might be true because it still misses
the correct SoC-specific delays. This is, however, fixed in openbmc/u-boot.

I know that this is not optimal. I'm already working on getting this fixed in
upstream U-Boot too.

> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-altrad8.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-asrock-e3c256d4i.dtb \
>  	aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..aa623f0ca36c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "ASRock Rack B650D4U BMC";
> +	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};

Where's the reservation for video?

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;

That's already defined in aspeed-g6.dtsi

> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		status = "okay";
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			u-boot@0 {
> +				reg = <0x00000000 0x000e0000>;
> +				label = "u-boot";
> +				read-only;
> +			};
> +
> +			u-boot-env@e0000 {
> +				reg = <0x000e0000 0x00020000>;
> +				label = "u-boot-env";
> +			};
> +
> +			kernel@200000 {
> +				reg = <0x00200000 0x00800000>;
> +				label = "kernel";
> +			};
> +
> +			rofs@a00000 {
> +				reg = <0x00a00000 0x02000000>;
> +				label = "rofs";
> +				read-only;
> +			};
> +
> +			rwfs@2a00000 {
> +				reg = <0x02a00000 0x01600000>;
> +				label = "rwfs";
> +			};

No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.

> +		};
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	/*
> +	 * The RTL8211F provides the required RGMII RX delay. No additional
> +	 * TX delay is required for this board.
> +	 */

No? I do have this board myself with a custom BMC ROM and I can tell you that
you don't have to set delays other than the described SoC-specific delays, but
this is, as mentioned, already done in the BSP. (And no, I haven't upstreamed
my DTS yet bc I haven't had the time to do it.)

> +	phy-mode = "rgmii-rxid";

`rgmii-id`

> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;

No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see the
other device-trees for ASRock Rack mainboards.

For me, it is a:

NACKed-by: Tan Siewert <tan.siewert@9elements.com>

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

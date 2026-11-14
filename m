Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641428;
	b=bKuprg9fsAbqmzGRNuv49B1HEVxKys+7Kp2tUsWHL8PXmwKHWqUTSYV78HJKGq+mMPbo
	 rd8oPoZxgB1Tpzq7cei/lLY2PajWKC2NUb7xoA/NWQiXXEkkcFd5Wa7+bUNatbsKRplfk
	 V12+E9D55qZuD6eIeXMoAytYve10WrdIYEOp/D9Va8aBsAqldh3pgFU9itDMtXs/BwDWq
	 pXaSlR5Zu12ZdZwYzY13g4g1HtsGS1QfvBIOU2WQnHXZ2+MbY6USrdmWS8ZDkvFZL+Ba4
	 dsrD9uwRSo6Seu5A2yqZg4wqSHw5JggGA2ah6Sgy+vRJA9cW+XFzFKPFG553A5CQw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641428;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RtlrGzw8VmtDYwdiBvn4lTn2fL67N+5GJzUI4/4Jq2o=;
	b=Wry0Nj1OFHmOCGF5hgj7M+uqCfbjlPeHJVuqJUmAOy4UIvXcxo94+E9f4OnS1RvJ2uPL
	 tXjpbQJB5KtiuQCoFK7GLpu7K+VyulikqTv/GUfDliKRbs68Oz6cPWD+mVlb7WWIw78Qz
	 bal/YZbRiHJeAton4+CpPR+o4ItNG9DnmfIDniCRsT/ghPqjbJpqcPmovkXuts69L3KPe
	 52DjJRZz+0KFgfBKrPtA/kHr5bwze+6kHh6Co5pbdsMj+MHogQR3Fc0THFvEqVl9n1RdP
	 wA+T5AlUHVbLIDJA6r9pOXDh5kJCdZSUlTlIde7utODSlALJJcalZJA+Jej7q74lbsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Autf3p2T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20795606A323;
	Sat, 14 Nov 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Autf3p2T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9FE1F000C4;
	Sat, 14 Nov 2026 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794641427;
	bh=RtlrGzw8VmtDYwdiBvn4lTn2fL67N+5GJzUI4/4Jq2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Autf3p2TMGSLZAPTTzmL0aw0g86IZzBrFMJbM+IcPxPrd+SrNlN+5LX6Tx+RIWFea
	 6JUHDTHsglYHSFmDwwVVw5b1/lY6MRD2tnVg7qfWJaqtjeeqkGUDeCf+FeoOIePEBT
	 VK6H+a5/B0+ixtGJTs2prCqtlBLPN5EWTUXU/Os6Lo6dy0fzod674PpRNONBJp4u0S
	 8rtvGHUjV9t4g6u+eCaTGdcW0jGNElRaSVkFM98iPcXDpk54Z7eZdxoh2sH728ssT4
	 yxdN5tAWH72MEWT1HCU0IwPQAuXhixXc4iPwqkBWAVbDHAi+eBq3Cbzj8EpCxhac5S
	 jgzzY4m6tYGxA==
Date: Sat, 14 Nov 2026 07:30:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
Message-ID: <20261114073025-GKA100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033310.361435-1-sandie.cao@deepcomputing.io>
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
In-Reply-To: <20261109033310.361435-1-sandie.cao@deepcomputing.io>

Hi Sandie,

On 11:33 Mon 09 Nov     , Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
..
> USB A works on otg mode, it isn't configured currently.
Drop it, not really useful to mention there, irrelevant to this patch.

Currently, No USB A port support is merged in mainline code.
FYI, Chunyan submitted a patch for adding peripheral support of USB A.
https://lore.kernel.org/all/20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com/


> - 4 USB-C Ports
      ~~~~~ USB Type-C? less confusing
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1

For "Port X" here, is it a naming from FML13V05's schematic?
would be great to mention which specific USB 3.0 controller (Port B, C, D)
 of the SoC it connect to..

> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index e061233c15a3..bcd533484a73 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -172,8 +172,58 @@ dldo7: dldo7 {
>  	};
>  };
>  
> +&combophy {
> +	spacemit,apmu = <&syscon_apmu 0x17>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
>  	status = "okay";
>  };
> +
> +&usb2_host {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub@1 {
> +		compatible = "usb5e3,608";
> +		reg = <1>;
> +	};
> +};
> +
> +&usb2_phy {
> +	status = "okay";
> +};
> +
> +&usb3b_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3b {
> +	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> +
> +&usb3c_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3c {
> +	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> +
> +&usb3d_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3d {
> +	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

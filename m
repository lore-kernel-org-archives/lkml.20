Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940648;
	b=zM2YPIJV6eyNrcSF5gf4mBtW+h3MzHDZ6l760v/p5CrP84p4i19BRnqD+g6N5Q6SeXFJ
	 pltPcmUbqi6P/Jc2/gub8FOmyKPpbmi+bpu544b/QlPxrsG9aeXpCZu7Tspf4aBl9Aqnx
	 K/2sjHFLLrs0GZbWnG8pv9ob5QkX9jHcaAgmN6Zr9JhTo/kWquVwdgYuQd7n+tx35IpsP
	 bD6qX2G5PiAy0OS+oBoS1+zagimn9irfVZz1f9v7v7SyaBzKtkJqdwBaEAtxsyatdQnxw
	 HeBmR4vmiztfRZsadQbvdrpLhjwBEV5HKDQiynn0cS/+zVOTzeh8efjWByNCbiqn1hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940648;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=kxFpMtQbzKIRxEyj/jc+g0b9VDx9hp1+9az4E+nbn3U=;
	b=KBLCCYrnuYa4Tl507KU92G0kbGtwg3UxwFGRrwGgU2ix5x5e69SzdKdd/ZKxCGpkk9YR
	 YU32pMkeSaeY1LApRL+ZYamBnx/ndyta938bdMsbWvVTPsK+V7GlNNpNRs4xp+aF2HBgz
	 WOBGJZQu5C/1950ioLGcT+69kH4R1J1ppiJC+Frzw0CGzzHEiP5C2XvL0jEUt9RxRuWOu
	 s99YxhhaArt3kww81TMaRLfbaJVswaH8bnVQZjxEJek8bdXBy4HgUS2GoMCInr3AhNOlr
	 mC6L5pymxhJAV0UCv+6aOAfnVZo+wWtQdujjScPE7NWYOnvL9977/gcgmtx6bAnQVSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VdVV4V5Y;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B91606A326;
	Fri,  6 Nov 2026 04:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VdVV4V5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793940645;
	bh=kxFpMtQbzKIRxEyj/jc+g0b9VDx9hp1+9az4E+nbn3U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VdVV4V5YyBeklNYMLlTDcpWHCtmgoy7lcLNQr36qF84kCLsoNnb/nc/Hd9v1lTf/W
	 o7qbp9x44oun7kbQvUe1AOhr/28CoD/9ZLPqBuhRng+BHIx/JHeb6ciGFQoJxTeeJ5
	 6uIXhQua2Lqsdmq12APk08T5vkuCOZib9/0JV6nZ0DSnQMto9gc1Wu0T8aXW2IVjyD
	 4vXyYoPEoBWLrCr9l6ecnygTl2IFeqaZfamMw5da2cGnJiDGnq7Jc5yqLvuq7W4oRs
	 RsM0t4sks6ZqXJ8i6dPi0oTJP+hNR7qCT98HzKgUy21OVHfLmENgNSWZsQUDj3efHO
	 AmDX4/IYAwGBw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C32964952;
	Fri,  6 Nov 2026 12:50:45 +0800 (AWST)
Message-ID: <7eda59ffde46142602c6d8e425fd4097872ee8c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/3] ARM: dts: aspeed: add Intel JNCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Fri, 06 Nov 2026 15:20:44 +1030
In-Reply-To: <ffb7b028f317a3a2cd1a98b8f454b46a706cee42.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
	 <ffb7b028f317a3a2cd1a98b8f454b46a706cee42.1792749922.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-26 at 17:40 +0100, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel JNCRP BMC platform.

Can you please provide more information about the platform design and
its purpose?
>=20
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v4:
> =C2=A0 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
> v3:
> =C2=A0 - Sorted nodes alphabetically
> =C2=A0 - Sorted properties per dts-coding-style
> =C2=A0 - Removed lpc-snoop label
> =C2=A0 - Removed &i3c_global since it's enabled by default
> =C2=A0 - Added &kcs3 and replaced flash layout with 128MB one
> =C2=A0 - Restored Reviewed-by from Andrew Lunn, dropped by mistake in v2
> v2:
> =C2=A0 - Reviewed-by: Andrew Lunn for nodes: &mdio1, &mac1
> =C2=A0 - Replace bootargs console=3DttyS4,115200n8 with stdout-path =3D &=
uart5
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 276 ++++++++++++++++++
> =C2=A02 files changed, 277 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.=
dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 1e4154f12228..5e685a625883 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -58,6 +58,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-ibm-sbp1.dtb \
> =C2=A0	aspeed-bmc-ibm-system1.dtb \
> =C2=A0	aspeed-bmc-intel-avcrp.dtb \
> +	aspeed-bmc-intel-jncrp.dtb \
> =C2=A0	aspeed-bmc-intel-s2600wf.dtb \
> =C2=A0	aspeed-bmc-inspur-fp5280g2.dtb \
> =C2=A0	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
> new file mode 100644
> index 000000000000..e66ea7f00fed
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2025 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	compatible =3D "intel,jncrp-bmc", "aspeed,ast2600";
> +	model =3D "Intel JNCRP BMC";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlycon";

Please remove bootargs here, earlycon is for debugging.

Andrew

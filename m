Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940287;
	b=sRs9iJr57CpfWGH0vJ8Gj7PCPNSktvg69J/qJjWgFHHej/K5Uae7w/La+uK5fBZI/Ua2
	 7TXqpJ9jpPzqjdeyOu0K6mnbzx0Pqb1fnKWvQUtvLKOgQiI35QKqsob6raQTZib8ExXyM
	 IoWynka3YTRRwOEML712Z0CJJErST2pq12AZThjxb+h2RrQr+Lwfjefl+Aztbbh51WBx9
	 RXsVSn95IM10Ev0WL5FxS5hWfeb+GdN0Uu6Y/WpFn+x+T4eynLZQRNnik9EXhL1lDDXFc
	 JfpjSbODUk3YNTRQwLbMYnAwKT5o8oszV1dLPewdl/mJj3K1Wt0dI0JiR5DenDTEjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940287;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=YFoZXU10IP230tleaiBGL1W+4BzMqJD5/OQifxbywPQ=;
	b=QBerBdxmCXrPny2rXFX2fhpaFZxQziouOgA7xzyMP9AJ3zT3IZUPBKn+MnLdH/X5uBtu
	 ie3IZC/jlhOHV62/eCZoXsRPjOikZEbFac3D/5NgskstxrYneedK8bntoLEMPSD/xaH+N
	 ZHhan4wK+HQc+u/3K/ov2ky48DZCqhs0pTHdo9lOHaToUGc5cejl0yhMwOteDgz7aJNa0
	 QAO/uoPmzRFmL75DOpmDzQkWIII+kyv8BM83VXf3ceIVnrILlsEUfcHfZcdDcpb3tMdfT
	 LzHhAzVnesk7Rg0yVbWf1glvmgfZxUGH0VBL9ua6XgBcQp6Pe+NKEHFjDddFe67IrLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ORjN6Qaq;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42919606A326;
	Fri,  6 Nov 2026 04:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42919606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ORjN6Qaq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793940283;
	bh=YFoZXU10IP230tleaiBGL1W+4BzMqJD5/OQifxbywPQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ORjN6QaqOIz1opYhhwsBq8ZHWvenOnD/h7Pyt2qqBWAk4IWMV1kigIYqGjllF3ZJY
	 G1bcFgU6+ExgM8Pwj1Qs1FiX2qRLh+YEIiJ1p2pnAJoR3MUfdMIFDl08Dd1/NHNq5g
	 zvjGn9sH5VVm0LfVu5qHdmvqabPC3o5zJ/aD0sLsXyf8edV/z7Gt/ypFr81dXdj4Bh
	 jYBmRyGU7qCJMUWzOCDYE535xqUGLUz2I2SyQSgpuxqeYmGN89bNT9JjF6viTDmJA2
	 GwhkpJwNaRYNsi8mRn2wTkutRaZV/NGLpjLVENy8qwiDZwBdgU1PSQ6iEE1qlkpapd
	 rmmmauy9Vda0Q==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AB8BB64952;
	Fri,  6 Nov 2026 12:44:42 +0800 (AWST)
Message-ID: <971b14eb2ea35ae89b5517438435460bdc8385a3.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Fri, 06 Nov 2026 15:14:42 +1030
In-Reply-To: <aa35e5bb8a3d49ea4d5bc245887aaf8ce0ce42b1.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
	 <aa35e5bb8a3d49ea4d5bc245887aaf8ce0ce42b1.1792749922.git.dawid.glazik@linux.intel.com>
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
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.

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
> =C2=A0 - Removed GPIO line names for pins claimed by pinctrl
> =C2=A0 - Restored Reviewed-by from Andrew Lunn, dropped by mistake in v2
> v2:
> =C2=A0 - Reviewed-by: Andrew Lunn for nodes: &mdio1, &mac1
> =C2=A0 - Replace bootargs console=3DttyS4,115200n8 with stdout-path =3D &=
uart5
> =C2=A0 - Remove the unreferenced video_memory reserved-memory node
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-avcrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 322 ++++++++++++++++++
> =C2=A02 files changed, 323 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.=
dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 6874b621deb4..1e4154f12228 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -57,6 +57,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-ibm-rainier-4u.dtb \
> =C2=A0	aspeed-bmc-ibm-sbp1.dtb \
> =C2=A0	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
> =C2=A0	aspeed-bmc-intel-s2600wf.dtb \
> =C2=A0	aspeed-bmc-inspur-fp5280g2.dtb \
> =C2=A0	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..010ace09d90f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	compatible =3D "intel,avcrp-bmc", "aspeed,ast2600";
> +	model =3D "Intel AVCRP BMC";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlycon";

Please remove bootargs here, earlycon is for debugging.

Andrew

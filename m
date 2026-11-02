Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647847;
	b=0zSj2KNtfnkZdMe/OEjyMiNQ7ofIElKN36oI2zfdnnuwBt/p0P3Cex8a5+bT6I3avqAW
	 NaviI/3V5jx8Hiv2+GzmtFzAblANek7sEmbHPnTcGy+tnMIsZA3ufb0PVOiyxXVOAsAwe
	 0Fqy9gB8L9nl8fxSgzbIz7cddaY0llOA0wZF/Ae3s4fx0iLqcVDIeHmKQYCWixfjGvJ4k
	 2RPuNIfZWubtH+IrEWtdTAC0f2xT89AQO7QHEu7IZ8segUeW5G/xajrdWsRG+ABIk53Y4
	 CWaRvRhqH9jcJrNy5MVPVUIz2qR2ns2Phz9RkWt5NJczRgsQ6tXp4ZwV0F1ppEhpJPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647847;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BfhxWykTmPc6wyjeVHTR21Enz+OZo/UGczIHttX3ohI=;
	b=x3FWb8qQ9BRElrcbCyMRjokBB6Ht1+/7/3ejppD9CDTl2z8C0lzTTYmUeenDCVzK+D3a
	 InuBGTT6ylWFgLGXMNdxZX+2ojE46igfxfYlXHAlUGMgU9m0rMNgghSGjcminsKIzT11T
	 M0PEzTDBykyW3mBH2lI3CFmuxKbE76ngsGVfjpSQ3eFk4AVqcGULVC/aLPa3sHzr+ohEU
	 bB2yV9scKV3k0JMEivIjEzd4sZtiObyOPCmWG0XmMf4HtW91InWjvGnNROHKQhnvwyGZ/
	 cr9TZIAXH7YtPthVqVNWCEn9Mhu2hk4gdELRyldRQxhjue1N+ViIW2Oks06nOa0t39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IIWbNPU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F0606D827;
	Mon,  2 Nov 2026 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IIWbNPU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845CE1F00A1A;
	Mon,  2 Nov 2026 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647846;
	bh=BfhxWykTmPc6wyjeVHTR21Enz+OZo/UGczIHttX3ohI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IIWbNPU2lDllFE/WRQ7Y998Rg+/pXHzawGjvgbMq4ZqNv9gzB8aPd0CIx7U/F/ZD/
	 iJXo64WgvNf2rQC2j0CanZ8MzWnsf3Wcpnxv7MRzcOpBT3HBUrLq8gRGSjybm10rD/
	 BmI5AoMuQ+02ru1A77u/AvWkHrZyf/iT4a+s8rJw3aaKGM0fhIWkaPLCNzyYvbIjlG
	 Bi6eM+bHxAwuP/6pQXhcoyEL5XU5065YuM637Ivt0ckZWikz2bnPhrPuomstoK4Z7q
	 BiRRn1CnFSFRPdbq7rEA+24Ame7OG3Z2Mk5ura6B6Clcfa0Pt2efwabZ8O2leZtjLd
	 tMpa3WcCI0sMA==
Date: Mon, 2 Nov 2026 19:30:41 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261102-salsa-cartel-dd4f4b2a9639@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e+Bmd5hFsa6OPnoE"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>

--e+Bmd5hFsa6OPnoE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:26PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
> the CVA6 repository (corev_apu/fpga, release v5.3.0). It targets the
> Digilent Genesys 2 board and provides a CLINT, a PLIC, a 16550 UART, a
> Xilinx SPI controller connected to the SD card slot and a Xilinx GPIO
> block driving the LEDs.
>=20
> Describe the SoC in cva6-genesys2.dtsi, shared by the two configurations
> of the core that the FPGA platform builds, and add a board device tree
> for each of them:
>=20
>   - cv64a6: rv64imafdc with the B, Zcb, Zicond and Zkn extensions,
>     Sv39, 1 GiB of DDR3
>   - cv32a6: rv32ima, Sv32, 128 MiB of DDR3
>=20
> The ISA extensions follow the core configurations of CVA6 v5.3.0
> (core/include/cv64a6_imafdc_sv39_config_pkg.sv and
> cv32a6_ima_sv32_fpga_config_pkg.sv).
>=20
> The platform also has a lowRISC Ethernet controller and a PULP APB
> timer. They are left out until bindings exist for them.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  MAINTAINERS                                   |   7 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
>  .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  29 ++++
>  .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  31 +++++
>  .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 131 ++++++++++++++++++
>  6 files changed, 201 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 782389bd5c..17865074a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23566,6 +23566,13 @@ T:	git https://git.kernel.org/pub/scm/linux/kern=
el/git/conor/linux.git/
>  F:	arch/riscv/boot/dts/canaan/
>  F:	arch/riscv/boot/dts/sifive/
> =20
> +RISC-V OPENHW GROUP SoC SUPPORT
> +M:	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> +F:	arch/riscv/boot/dts/openhwgroup/

There's no git tree here, are you expecting me to apply the patches for
your platform?

> +
>  RISC-V PMU DRIVERS
>  M:	Atish Patra <atish.patra@linux.dev>
>  R:	Anup Patel <anup@brainfault.org>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 69d8751fb1..305a93ad6f 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -5,6 +5,7 @@ subdir-y +=3D anlogic
>  subdir-y +=3D canaan
>  subdir-y +=3D eswin
>  subdir-y +=3D microchip
> +subdir-y +=3D openhwgroup
>  subdir-y +=3D renesas
>  subdir-y +=3D sifive
>  subdir-y +=3D sophgo
> diff --git a/arch/riscv/boot/dts/openhwgroup/Makefile b/arch/riscv/boot/d=
ts/openhwgroup/Makefile
> new file mode 100644
> index 0000000000..a75a5863b7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_OPENHWGROUP) +=3D cv32a6-genesys2.dtb cv64a6-genesys2.=
dtb
> diff --git a/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts b/arch/r=
iscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
> new file mode 100644
> index 0000000000..83d0286171
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU, 32-bit core (cv32a6), on the Digilent Genesys =
2.
> + */
> +
> +/dts-v1/;
> +
> +#include "cva6-genesys2.dtsi"
> +
> +/ {
> +	model =3D "OpenHW Group CVA6 cv32a6 on Digilent Genesys 2";
> +	compatible =3D "openhwgroup,cv32a6-genesys2", "openhwgroup,cva6-apu";
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		/* 128 MiB of DDR3, as configured for this core by the FPGA build */
> +		reg =3D <0x0 0x80000000 0x0 0x8000000>;
> +	};
> +};
> +
> +&cpu0 {
> +	compatible =3D "openhwgroup,cv32a6", "riscv";
> +	riscv,isa-base =3D "rv32i";
> +	riscv,isa-extensions =3D "i", "m", "a", "zicntr", "zicsr", "zifencei",
> +			       "zihpm";
> +	mmu-type =3D "riscv,sv32";
> +};
> diff --git a/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts b/arch/r=
iscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
> new file mode 100644
> index 0000000000..8fe653b35c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU, 64-bit core (cv64a6), on the Digilent Genesys =
2.
> + */
> +
> +/dts-v1/;
> +
> +#include "cva6-genesys2.dtsi"
> +
> +/ {
> +	model =3D "OpenHW Group CVA6 cv64a6 on Digilent Genesys 2";
> +	compatible =3D "openhwgroup,cv64a6-genesys2", "openhwgroup,cva6-apu";

As I mentioned, these need to change.

> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		/* 1 GiB of DDR3, as configured for this core by the FPGA build */
> +		reg =3D <0x0 0x80000000 0x0 0x40000000>;
> +	};
> +};
> +
> +&cpu0 {
> +	compatible =3D "openhwgroup,cv64a6", "riscv";
> +	riscv,isa-base =3D "rv64i";
> +	riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "b", "zba",
> +			       "zbb", "zbc", "zbkb", "zbkc", "zbkx", "zbs",
> +			       "zca", "zcb", "zcd", "zicntr", "zicond", "zicsr",
> +			       "zifencei", "zihpm", "zknd", "zkne", "zknh";
> +	mmu-type =3D "riscv,sv39";
> +};
> diff --git a/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi b/arch/ri=
scv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> new file mode 100644
> index 0000000000..95978274a7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU on the Digilent Genesys 2 FPGA board.
> + *
> + * The SoC description is shared between the 32-bit (cv32a6) and the
> + * 64-bit (cv64a6) configurations of the CVA6 core. The core specific
> + * properties and the memory size are set in the board .dts files.
> + */
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};

As I understand it, these should always be at the board level, but given
this is a pure FPGA design there's gonna be some oddness and I think
that's okay.


> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		/* The CLINT mtime counter runs at half the core clock */
> +		timebase-frequency =3D <25000000>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +			clock-frequency =3D <50000000>;
> +			tlb-split;
> +
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				interrupt-controller;
> +				compatible =3D "riscv,cpu-intc";
> +			};
> +		};
> +	};
> +
> +	/* Peripheral clock, the same as the core clock */

Sounds like you're then missing a clocks property in your cpu?

> +	clk50: clock-50mhz {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <50000000>;
> +		clock-output-names =3D "clk50";
> +	};

Is this genuinely a fixed clock, or an output of a clocking-wizard
instance (or similar)?

Cheers,
Conor.

> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			gpios =3D <&gpio0 1 0>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +
> +	soc {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		compatible =3D "simple-bus";
> +		ranges;
> +
> +		clint: clint@2000000 {
> +			compatible =3D "openhwgroup,cva6-clint", "sifive,clint0";
> +			reg =3D <0x0 0x2000000 0x0 0xc0000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
> +
> +		plic: interrupt-controller@c000000 {
> +			compatible =3D "openhwgroup,cva6-plic", "sifive,plic-1.0.0";
> +			reg =3D <0x0 0xc000000 0x0 0x4000000>;
> +			#address-cells =3D <0>;
> +			#interrupt-cells =3D <1>;
> +			interrupt-controller;
> +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			riscv,ndev =3D <30>;
> +		};
> +
> +		uart0: serial@10000000 {
> +			compatible =3D "ns16550a";
> +			reg =3D <0x0 0x10000000 0x0 0x1000>;
> +			clock-frequency =3D <50000000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <1>;
> +			/* Registers are 32-bit wide and 32-bit aligned */
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +		};
> +
> +		spi0: spi@20000000 {
> +			compatible =3D "xlnx,xps-spi-2.00.a";
> +			reg =3D <0x0 0x20000000 0x0 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <2>;
> +			xlnx,num-ss-bits =3D <1>;
> +			xlnx,num-transfer-bits =3D <8>;
> +
> +			mmc@0 {
> +				compatible =3D "mmc-spi-slot";
> +				reg =3D <0>;
> +				spi-max-frequency =3D <12500000>;
> +				voltage-ranges =3D <3300 3300>;
> +				disable-wp;
> +			};
> +		};
> +
> +		gpio0: gpio@40000000 {
> +			compatible =3D "xlnx,xps-gpio-1.00.a";
> +			reg =3D <0x0 0x40000000 0x0 0x10000>;
> +			clocks =3D <&clk50>;
> +			#gpio-cells =3D <2>;
> +			gpio-controller;
> +			xlnx,all-inputs =3D <0>;
> +			xlnx,all-inputs-2 =3D <0>;
> +			xlnx,dout-default =3D <0>;
> +			xlnx,dout-default-2 =3D <0>;
> +			xlnx,gpio-width =3D <8>;
> +			xlnx,gpio2-width =3D <8>;
> +			xlnx,interrupt-present =3D <0>;
> +			xlnx,is-dual =3D <1>;
> +			xlnx,tri-default =3D <0xffffffff>;
> +			xlnx,tri-default-2 =3D <0xffffffff>;
> +		};
> +	};
> +};
> --=20
> 2.43.0
>=20

--e+Bmd5hFsa6OPnoE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujk4QAKCRB4tDGHoIJi
0oeIAP46LJrUgot7AlG3TyETQUXfPmRg49sgupvNR0OciLDXuwD/ZXUuz6PgUJe7
+dM4J/5uSikM4PHmRRM4arLTunsX9wE=
=+2Db
-----END PGP SIGNATURE-----

--e+Bmd5hFsa6OPnoE--

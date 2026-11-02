Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600830;
	b=l8DfXNVzCH+7hmsju+U4yBjo8vD7QKB2E0OzmddsG7+QdGqFDQD0D76p4x89AoUSffQ9
	 Jb0kgTkfJn9jdPUM363q5Ja71jDJi+OIU1il8/lKLw9quDacx18BUGNpAa7+tP5WtmNzZ
	 nC45iUzAkfE6XbvYAbxShnXR77rMBDZP6dOBUl5vGH4yuFbKe1ZI2aKuH0ctuDSynK1LW
	 PapijDip4mJllvTgerp8goWkC7Fw5m2zjCxwKooc+cSN3n1N/gDk7K6Xrw23ZN/rfcvQn
	 HJ7JSK6uXAG6Gp9OSs48eYC/9BGADijFiaotfoyD89mbfI+/8eRxBQO5VxVYFo7RlMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600830;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:Cc:
	 Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=2wkyyxCXcw31vN0kWDvVp8R9jdhVQobQ/AyYbLR2pHk=;
	b=Uk+0zFK9LAue21ddL1QzE9OgM54Zg/Q7btAilUvjsemC2tompUq3a9w3hSZlOpBRXLVi
	 agcnVkw2OLaQ08OwTfPThdnVD1Xa63bbvrAAJCISljc0+6FbBgj7VcZwQ/t3+4oHNWkH/
	 Am23i3FkepqYQ+evz7xSpYkR7Yu+HWTUUZ6b+U2cWd+ble1b91swDYno/NSvcTiPlvwKL
	 3IFkaxmOTHf4bovwJD9bTCadV3SdJkNUVRLs1XgVMYVN7qpILaQ6v1QsLrT2pCob6jscZ
	 6OCGTuMZj670lUPIifCs3W3WGFZQVucGxE93EL90mmNOB7OJNoKqMduxOQELvJCsnVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUfj+mSF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBD606A324;
	Mon,  2 Nov 2026 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUfj+mSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208CC1F000C1;
	Mon,  2 Nov 2026 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600829;
	bh=2wkyyxCXcw31vN0kWDvVp8R9jdhVQobQ/AyYbLR2pHk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=JUfj+mSFyWi89QZqMgxFHU1jsY8ia6jOnc5kmdWeX8UNEKiO37kG2oTLCBfuGQd1M
	 93Apw1F76fupZmBgsGArRgUPPVERy7Yy4oL9lBRGzfwphsgwGL4cgMfY/Pc/BdSa7m
	 zUEfVi9OUCWt3K6HWMtHPwyH3gd0sPRAT2foWrB7bbtorRxYYmzLrzcvehTUYOFoIT
	 PS8/BSUBG50L86RyP9gRha77l9LsL7aWX0ve/+WlU8teBQYlng+IT/SN8FxuCSMJbX
	 eN46VDHuGQ4r5y6o7vVp2BYOn1MorDvWQ5usgde4aRWVhiB7et6Rs3U4zKPv6Mxjwv
	 9731/zMoa5DcA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=90a2fe1c88bb8110eb48ee7ba039607e9e01d3d22524d3001346e8bf68cd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 02 Nov 2026 14:27:04 +0800
Message-Id: <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <devicetree@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
From: "Troy Mitchell" <troy@kernel.org>
To: "Chunyan Zhang" <chunyan.zhang@linux.spacemit.com>, "Yixun Lan"
 <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Aurelien
 Jarno" <aurelien@aurel32.net>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
 <auYxFRtKWbGAlRTL@aurel32.net>
 <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
In-Reply-To: <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>

--90a2fe1c88bb8110eb48ee7ba039607e9e01d3d22524d3001346e8bf68cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Chunyan,

On Fri Oct 30, 2026 at 5:40 PM +0800, Chunyan Zhang wrote:
> Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> of the K3 SoC.
>
> Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> yet, so the port runs at high-speed (maximum-speed =3D "high-speed").
>
> Enable USB3 port A with dr_mode =3D "peripheral", so it can be used as
> a USB device.

Port A is a Type-C port behind a FUSB301, so please note in the commit
message that it's device-only until the CC controller is described.

Was this tested with a C-to-C cable? That depends on the FUSB301's
power-on CC mode, since nothing configures it yet.

>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..74d4fdf9e405 100644

Please rebase onto spacemit for-next, which already has Aurelien's
USB3 phy rework.

> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -323,6 +323,15 @@ &usb2_phy {
>  	status =3D "okay";
>  };
> =20
> +&usb3a_u2phy {
> +	status =3D "okay";
> +};
> +
> +&usb3a {
> +	dr_mode =3D "peripheral";
> +	status =3D "okay";
> +};

After the rebase these should go before &usb3b.

> +
>  &usb3d_u2phy {
>  	status =3D "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index c3f2dce0969c..220dfe29bb78 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
>  			};
>  		};
> =20
> +		usb3a: usb@cad00000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0xcad00000 0x0 0x10000>;
> +			interrupts =3D <118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			clock-names =3D "usbdrd30";
> +			resets =3D <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> +			reset-names =3D "ahb", "vcc", "phy";
> +			phys =3D <&usb3a_u2phy>;
> +			phy-names =3D "usb2-phy";
> +			phy_type =3D "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;

snps,dis_u3_susphy_quirk is missing too, like usb3b/c/d.

--=20
Troy Mitchell

--90a2fe1c88bb8110eb48ee7ba039607e9e01d3d22524d3001346e8bf68cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaugtOAAKCRCYCe+A+TM0
L6tmAQD6H+sVHQCkV2Ocd85M+lpBTtSKrtx5qkrvmHZhgR1TpwD/UzoIixtIl4bI
99V9oZLJbvyGtVPtxaLmVdgI7NldqA4=
=eBlM
-----END PGP SIGNATURE-----

--90a2fe1c88bb8110eb48ee7ba039607e9e01d3d22524d3001346e8bf68cd--

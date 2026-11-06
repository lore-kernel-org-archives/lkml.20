Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985591;
	b=huPgb3Y/FtuAiEY7LIyrmjorf5BN+Z1WCLfuQYts+HTZqpVRyYH2WRy01RD8ML7flWBH
	 mPrq29gSlIHsajWVM/SaDm92WDxKGEuKuEY1GRDqqHBqFiXGc4moaKOgymLyj5RZ42crC
	 IOLGjtaKxaHHQfoab2pP7e292dCifgEAEp62sirFBNAtr2I77cmmdW+BDRa9B3pkuZSzw
	 gPSfOAJc28lG73nEMZWqc0sFnZTM681cLuh4667BR5cGRuV+xH3uhQO8+uE0Ct9BmrJTy
	 FNjZWQs8GiR3vzJgzNMIRWDtHsQj1JHuGl1XwCEgDuteEzp5WRKANMKbo38aNNPbIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985591;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0iFTCwthtb4KQWJ3KgZO/eQr21RNoCfrtaNGVHe64Us=;
	b=x1V9hOgCVbosvU4iPrEW+LRtIQ3B029u1oxFp1g1YiAjUIQy5g0YwiFv47YqtxlWdvKv
	 eb/mTAyTsnBCl9a70/HLT3vnrH5ozJoHDcKE8dN440Iso25dYNfxVULOkl6QfU1m2DHZK
	 2clSjyDt/mvjuObyoytEl8gb3YItgk8svKnZf7RR9w9HteRI6HOj1VAIoJ0fQgenufAPu
	 JObVdpUW51WqMcwEyvZ3EOfLT0actSE0pwO7waMMVlfeywg3+lvSACQXgSLRYkByRgfuw
	 +mt4FNCdpAsy1Megoj++gEkBTqopgNIG/88zk3iMtQFGArpX4Ka7ptFwhL7TI766crQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYSaZkGV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D8606EEA5;
	Fri,  6 Nov 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYSaZkGV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1E61F008A1;
	Fri,  6 Nov 2026 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985591;
	bh=0iFTCwthtb4KQWJ3KgZO/eQr21RNoCfrtaNGVHe64Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYSaZkGVHJuACXRFQhoLUAGx2gARxd2wREGPO2sCc1yXKN3RY46h7J5wDjOayccX6
	 ++s4RgmjOlutg0e/O7i8kshnMl7BZ33JA2VknynORN5vKm54dpmRMwM0ZSTE7eXKis
	 67cxNvgpIHRz0B4TKyHXXD/gjkI8DOldPxtIkBb2my9fuRqztQsV1wB7b0lGAdRwi0
	 UmwMjlwomVzIsrh5D0Mouj6FFvLZQds7vivxE1bQcaxUmrsTC8Y85uRHieWDzZIzgV
	 skz9Ek8c9DolL87XjnfHpm5A+8Cd1NfJSXWjiQiGrKsmnbP6c9jBXfnuT7Z171OmzB
	 pYgt0jfrbH14w==
Date: Fri, 6 Nov 2026 17:19:46 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
Message-ID: <20261106-walk-overload-3ffa489c0af1@spud>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
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
	protocol="application/pgp-signature"; boundary="pNM4qVg2gRPOW9R5"
Content-Disposition: inline
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>

--pNM4qVg2gRPOW9R5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:46:58AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> Add the AO_CEC_A controller and its pin group.
>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 155997649dc3..dd51e786d29d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -747,6 +747,14 @@ mux {
>  					};
>  				};
> =20
> +				ao_cec_a_pins: ao-cec-a {
> +					mux {
> +						groups =3D "ao_cec_a";
> +						function =3D "ao_cec_a";
> +						bias-disable;
> +					};
> +				};
> +
>  			};
> =20
>  			gpio_intc: interrupt-controller@4080 {
> @@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
>  				amlogic,has-chip-id;
>  			};
> =20
> +			cec_a: cec@44000 {
> +				compatible =3D "amlogic,meson-gx-ao-cec";

This is an s4, not a gx, so you need a specific compatible.
pw-bot: changes-requested

Thanks,
Conor.

> +				reg =3D <0x0 0x44000 0x0 0x14>;
> +				interrupts =3D <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				clocks =3D <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
> +				clock-names =3D "core";
> +				assigned-clocks =3D <&clkc_periphs CLKID_CECA_32K_DIV>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL>;
> +				assigned-clock-parents =3D <0>,
> +							 <&clkc_periphs CLKID_CECA_32K_DIV>,
> +							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
> +				assigned-clock-rates =3D <32768>, <0>, <0>;
> +				status =3D "disabled";
> +			};
> +
>  			ir: ir@84040 {
>  				compatible =3D "amlogic,meson-s4-ir";
>  				reg =3D <0x0 0x84040 0x0 0x30>;
> --=20
> 2.56.0
>=20

--pNM4qVg2gRPOW9R5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4MMgAKCRB4tDGHoIJi
0ntYAQDW1EKWgmTLaW09unAisYzkptD8uRbVDs3X4Om7xA7jpwEAqLxY4Kmoizv1
p3w9XKAyw3cich6+tLlpCcPJ8D0vgAQ=
=1s4Y
-----END PGP SIGNATURE-----

--pNM4qVg2gRPOW9R5--

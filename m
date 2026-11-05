Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878648;
	b=aN6pwvXLUEWrqAnlDG3RFmeS6eTugHO3BQVAMoA76/VEllaoaKX2eRkdlK+HfMtzeoba
	 Ewft79RgDZjLZbrOA0hGViyCjlOC6iLA/cv5LQ5/UWXIMnaa0JLqqsVrGcU8fWYEi8h1o
	 evv0n9KRXyQEgz/PlVx+/qOhkFIWwFl3CL1u1+CppZ24lvEiuo0TlU59m3etC+E0rOGzs
	 FtO1i2yDXmYiVNgjwH4BB+JXdcVH/HPlT23x26pswBHJcEt0b0vo2beTvP5H55hRNo6Dg
	 C16rQ2StdU5MyHYss6DJXDoABMvD4lqScZ1Gk9lo6Ku5jJFhQ3cf5BlaKB47l8hYvCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878648;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=VMhnWUVSQ2tILOB4G/emtQlgU+NR+argJ27mPCGNL+4=;
	b=TT1rHMVZFzdo4e25CnMDgAG4yZ6BgXsCIAUBI7BDW8UDaO8FAGpwnT43dy/mjQdTWvfF
	 Jup+a4tormNOHjlJAseG5aGA+CKo8mI/YFoftsW7g4o6hFsuSznqFBFEUEojGmVSnUXO0
	 46DeCgwjLRE3i3fCtYMn1UmneSpwDBGMoe2QIcirtgo6ohCqHQDH5N5zMb+SV6bGNCR0W
	 LgIXRvY7dRXhfYsogZbBDA+7a/qCm7w8yckh4jrKTrrCJf52WfOJOiJGSmckLw2XLxxPv
	 IfDM3iHHpg2ofzHe0G7Z7Ab5YOkokyP8B7550FEDRTHhM9GhaE7eg/D9Mof0n8Ov0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ovcCqlh7;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE0606A31B;
	Thu,  5 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ovcCqlh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VMhnWUVSQ2tILOB4G/emtQlgU+NR+argJ27mPCGNL+4=; b=ovcCqlh7VrjwANEc7//D13mAC7
	VksmRuZHZ/2GBLXZhGPO/i9gLDz/Uh4ZlTcJfTilOWw4jrcidB6sCY0aa2IDhhiBXBMCcei44br/N
	xQcZJKGqIHwaf9qXFMnN9G1DRw6VnLyoS0iZFFUu2jLH/Xz4t1VU84HUJEOlSjsk5uPc1FSiF9//a
	lEDTZWM7pNflmGJh4AhEWFG4WpBUlVTUQzFQLASEFPXmGwpbNlEcFN5iFwV1S8Ysu/S4uFy6V6NOx
	jycjBSr6knqI86H0o3xwoslL8tbZgX14BtXg+ll1GWEPWB5wwgB5v+5iErkUTxlZlxEbrwGuHsdB/
	Qt56sqfg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaozhong Li <yaozhonguwl@gmail.com>
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Thu, 05 Nov 2026 12:37:13 +0100
Message-ID: <3342569.D8ZAKjAxdT@diego>
In-Reply-To: <20261105102556.1365-1-yaozhonguwl@gmail.com>
References: <20261105102556.1365-1-yaozhonguwl@gmail.com>
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

Am Donnerstag, 5. November 2026, 11:25:56 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Yaozhong Li:
> Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
> schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
> of the WiFi SDIO node instead, and that consumer keeps the rail from
> switching to 1.8V.
>=20
> The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
> supply stays vcc1v8_s3.
>=20
> Fix the supplies of sdio0 and sdmmc accordingly and enable SDR104, which
> now becomes possible.
>=20
> With UHS enabled, sequential read from a 64GB SDXC card inserted after
> boot goes from 22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz,
> with no WiFi errors.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
> Changes in v2:
> - Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
>   instead of dropping it (Heiko)
> - Rewrite the commit message (Heiko)
> - Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhong=
uwl@gmail.com/
>=20
> A note on testing: with a card in the slot at boot, the first
> initialisation fails tuning ("All phases bad") and the card comes up in
> high speed mode, as it does without this patch. A card inserted after
> boot, or a rebind of the controller, comes up in SDR104; the numbers
> above were taken that way.
>=20
> The GRF io-domain device binds about 250 ms after fe320000.mmc here, so
> SDMMC0_VDD is still configured for 3.3V when the card switches to 1.8V.
> Forcing that GRF_IO_VSEL bit to 3.3V with the io-domain driver unbound
> reproduces the same failure on demand. This looks like the probe
> ordering issue Jonas described for the ROCK 3B [1]. It also happens with
> SDR50, with a second card, and with sdio0 left without a vmmc-supply as
> in v1.
>=20
> If you would rather not enable UHS until that is solved, I can send the
> supply changes on their own.
>=20
> [1] https://lore.kernel.org/all/e9ff5387-b3c1-41a7-b251-a12789d25a70@kwib=
oo.se/
>=20
>  arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa..fe1f8d7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -777,7 +777,7 @@ &sdio0 {
> =20
>  	/* Power supply */
>  	vqmmc-supply =3D <&vcc1v8_s3>;	/* IO line */
> -	vmmc-supply =3D <&vcc_sdio>;	/* card's power */
> +	vmmc-supply =3D <&vcc3v3_sys>;	/* card's power */
> =20
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> @@ -804,6 +804,8 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;

=46rom the schematics vcc3v3_sys also supplies the sd-slot (via an
always-on regulator / page 20 for me),  so adding

	vmmc-supply =3D <&vcc3v3_sys>;

would be nice, so that the declaration becomes more complete.

> +	vqmmc-supply =3D <&vcc_sdio>;
>  	status =3D "okay";
>  };


Thanks
Heiko



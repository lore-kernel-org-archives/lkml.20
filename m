Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541966;
	b=LsiW76csfaLmgyJcpsAQXMPAFgXkgnNjefvyEOlsgUXQcNeh2DBbcBcjlZCyBon/ABYk
	 R58MXNLxKTh2bVe3e9WL8SxS4DtRBejzl2FpCsu2X6wLLWM/CgplPx3T3xZqrh+GUKQiz
	 XEQRo5oSGrzJbiWmQxFHwId6DtZOaqYX3L7CQDYOY9yZ8tW/uurqbvRHdhdmP/rWiN2tI
	 b9kB5biNXpgoXXGjPK6yWhExQFMxjpjVV1Ncrf62ZlHI6xJ5RoJn/BXU1Or3ub2FuEqxC
	 11vNdcFo4Od3xB9xXer2UMALnEl5Ay42dQaX2IgQ4/nV1UevE0mmAHPDt4daIz5alCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541966;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=Pb2tgUvSCnXik9d7e+k7c23WDjV6nr8u+NYxLcvKygc=;
	b=iVWfGmchaM3PlfpzGI6a/5liAlSwDcWnApJlnzvkuIN7epFEixXmPxpVV+gtMzBhY4EC
	 Lu4toBfaWlCQiDFDhUiK2BR/9HPe4bAl3St4QFR1Pqp4cbDtws9y6VAfTxw8lblxI3p5Y
	 +wdH9lU7SyUkiF0Uq1D7ukuAVFkG7b4ykPkxbBS1lWZmyvA8Ir0923V3cnAOc5TWVRt9U
	 FJ0Eqsprc+ZB83lwikDKIC7brqyxXoMJ4pbCvvKacRDCLcD2aJLmR2VMORGRTRCITSd4P
	 6wxEt/Z6NSQayT1h0f81SfnSOcWDKnf+9X/wM9Wy26eu8Lt6y9D52Dvl5IV+Bi4IiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=f3h37cP4;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7088606A324;
	Sun,  1 Nov 2026 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7088606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=f3h37cP4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Pb2tgUvSCnXik9d7e+k7c23WDjV6nr8u+NYxLcvKygc=; b=f3h37cP4p7Is2X4TRLMrgHrtFy
	8sv5yL/fdmgiuWxyCUNn/Q2YIlV4y8NA0atk/aDivmvAyaVqAp7XH7aAkA5zqfOO+dSrACQRF3XsZ
	qGGMuYBkVlCejDDQYEJUWR51EmubT57Ehstj+sLN8/Jj1m32JRG1PQoXarqjjOrkKW0DcyEVHtkIv
	tqKvrVkZCnt4c32AYEV3eTYZ9LI04N+DCAflaTg6OY7z8BlckXcpiBwcyVYVt/o7/RbMcBUqq0Dyn
	/r0RtfZyuvu51bg2EEm6VqYQC0kHQy0aQCFBFCQE1XyW8R6zgyMSs9w5ZgHR29ToiocQUs5AfiJJ/
	TQxYC2dw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject:
 Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock
 nodes
Date: Sun, 01 Nov 2026 15:05:43 +0100
Message-ID: <2977688.AiC22s8V5E@phil>
In-Reply-To: <20261023053548.1595033-2-coiaprant@gmail.com>
References:
 <20261023053548.1595033-1-coiaprant@gmail.com>
 <20261023053548.1595033-2-coiaprant@gmail.com>
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

Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Coia Prant:
> The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> interfaces via its four MII ports.  Add the XPCS device node to the
> SoC device tree.
>=20
> The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> requires the CSR clock (PCLK_XPCS) for register access and the EEE
> clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> PD_PIPE power domain must be enabled before any register access.
>=20
> Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> assigned-clock-parents.
>=20
> The XPCS node is disabled by default and must be enabled at the board
> level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> are always present and do not have a status property, as they are
> static clock sources.
>=20
> The XPCS node requires a reference to the appropriate Naneng Combo PHY
> via the phys property.  dtbs_check only validates required properties
> for enabled nodes, so the SoC dtsi does not provide phys: boards that
> enable the XPCS must supply it, since the SerDes link is a board-level
> design choice (combphy1 on some boards, combphy2 on others).
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..20a72785adbc2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -8,6 +8,20 @@
>  / {
>  	compatible =3D "rockchip,rk3568";
> =20
> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +

these clocks don't belong here.

When you place these nodes in the main, they seem to come out of
thin air, while that might be true for some boards, that they
have dedicated oscillators for that, this will likely not be true
for all.

So these should be defined in the board dts, to match the actual
hardware.


Heiko




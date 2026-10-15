Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576A49EC70;
	Thu, 15 Oct 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050389; cv=none; b=GqKdUtTNV/AqR1yPOAGHg7JnMU3pr7ngsZP2Q2cu1vbs8HAfSAGb36z/6YG1F0gjVD7NVs3Z+uMkpsjX3sYse9tKa1rt4c57BzGlvDbmP7EWewVDMut9++lINFfPac08gn/TWM+sCnx3MjUOvfCAXs8BvYE6PNk8NHWvYqdFT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050389; c=relaxed/simple;
	bh=/aRx7UPkJK0a3gNwxeWCtXPadETNk7emaPRIKEyIVwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMiFHHS6DGXVsdybQLNUxTUnsj5oi7h5gg57cnS4ujcgCQPP0XyfblfivvDcU4UQqDN9Qh5C6aqdVxtATtRxHYS5mLkwkoCbCht2tTmnKNUB7OhHxhxXyEFRrqc9cYVIHPVgXNb9/6GaP3jI8kx0Vx4iW/MRHPunxxdDnYJGLdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/H46poL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/H46poL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB4F1F000C4;
	Thu, 15 Oct 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050383;
	bh=QkqZG/OEwWJwbZzPLLwpQFxTbwuEuA7XEWKZ9tqbnB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/H46poLF6DSrGnvDDatBj2zQa4/k7wjPuQhcY/jW4f3+NFllWuqOFGCktjHtrXFw
	 VoVTwzNFBaIzv+31E8G206VIR4KOl9YxpG2dGkPsNrgvMbHpPtKsNmjs0onHrgHAjS
	 v+cIlmV9qtcgUyhNyieYpfWnstne6zR1HG6YagyGDa5vc0aY5xUB0s6Y8B47Xw6FZT
	 Kf0JMGZrU18rrFv+IAnwEegXytfrylrh5nml2lJ47DJFB45X2ak1M3+KFWodnXZS7Q
	 Xank1trwOKbzsH45FTsKzHGrzTE6Zu2Ithf7U2tQqCuZiZ6A5qXX5ORBmd3zpv9kMI
	 /n4cXf+GMFkhA==
Date: Thu, 15 Oct 2026 07:46:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Message-ID: <20261015074621-GKN26088@kernel.org>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
 <20261012235624.77993-3-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012235624.77993-3-alan.tseng.cs@gmail.com>

Hi Hung-Chun,

Have two minor comments, see below

On 07:56 Tue 13 Oct     , Hung-Chun Tseng wrote:
> On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
> the board, and before DRAM training it programs the P1 PMIC (0x41 on
> i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
> need the flash on QSPI.
> 
> Mark these board peripherals, and the I2C buses they sit on,
> bootph-pre-ram on the boards that have them.
> 
> Assisted-by: claude-opus-5-5 dtbs_check
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 8 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 8 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
>  6 files changed, 41 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> index 81c40df2a..6269d2ba7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> @@ -64,6 +64,7 @@ &pdma {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	status = "okay";
> @@ -71,6 +72,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>;
>  		pagesize = <16>;
>  		read-only;
> @@ -93,6 +95,7 @@ serial-number {
>  };
>  
>  &i2c8 {
> +	bootph-pre-ram;
We could move this to dtsi file, since all board share
same design which use i2c8 for connecting to pmic, the
reward would be that we no longer need to carry this
property all over board dts file.. similar we could do
for "i2c2", but I noticed k1-orangepi-rv2/r2s have no
eeprom enabled..

>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c8_cfg>;
>  	status = "okay";
> @@ -100,6 +103,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -113,6 +117,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1 {
> +				bootph-pre-ram;
U-Boot also carry "regulator-name" for this node, we
probably could also merge it here, but could do it in
another patch if want to limit this patch to "pre-ram"
change only

>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -127,6 +132,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -155,6 +161,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;

-- 
Yixun Lan (dlan)

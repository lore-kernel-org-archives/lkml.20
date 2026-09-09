Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BB580398;
	Wed,  9 Sep 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970836; cv=none; b=SElWilptJKUH95avp68CBtxH3ZOAPvVfKaeMgaN7KQ+t3BUJS1NTHl5+ANIja7TEkSsVtdONXHsTV2d6KevOQ2ZU8CR9vtuzn/XUVgi37jHEG0Fs73LpNQLvurigHT/S0vcuf6LOQCZYzsUcxdgY4soGbRMtXHpl5wsOt4joWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970836; c=relaxed/simple;
	bh=UUeVEBaFv+mU0zzEufRC1He4yG7Kd/oISg/1H00kCKI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h/2OrEDXU9xDcD4r+Rej84jsa3yqOKUviKMmqVe9v8QRuDMe2MprA7k0WoaK5QiEiOAVOGf/xV8Vg3eI9uSsTibx+GWXirPu+Uqs7ZuWDUultchItXo6Tw/BvRgiaDg3HK9P/wrNzSqjkyaZ0hleNgbNU1FfWQ677bkVBVGyZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: laurentiumihalcea111@gmail.com
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: frank.li@nxp.com
X-PTX-Original-Recipient: festevam@gmail.com
X-PTX-Original-Recipient: elena.popa@nxp.com
X-PTX-Original-Recipient: consmin.stoica@nxp.com
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: imx@lists.linux.dev
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4AEF620007C;
	Wed, 09 Sep 2026 18:20:30 +0200 (CEST)
Message-ID: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Date: Wed, 9 Sep 2026 18:20:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
> 
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
> 
> The support targets revision B of the board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

> +	chosen {
> +		stdout-path = &lpuart1;

I would recommend instead "serial0:115200n8" here. This introduces no
change for Linux, but for other consumers of the device tree, they will
be able to agree on a common baudrate.

> +	memory@80000000 {
> +		device_type = "memory";
> +		/* actual size filled in by the bootloader */
> +		reg = <0x0 0x80000000 0 0x80000000>;

If the board has at least 2G always, this is fine.

> +&usdhc2 {
> +	bootph-pre-ram;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";

Looks unexpected to have same pinctrl groups for the higher speeds.
Are higher speed modes even possible on this board?

If not, I would suggest dropping the extra states.

Cheers,
Ahmad

> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +
> +	status = "okay";
> +};
-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


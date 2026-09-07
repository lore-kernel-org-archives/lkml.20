Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D321488763;
	Mon,  7 Sep 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781230; cv=none; b=qdGWU72U3n9Zc6rSXKCqWtWmb6Zp7ImMEc9XJFdVu+8wIVC4SoPDnJXktFDW1bGqT7qlQyjRBdPuO9BSUL+DICf0p4WUIu6BcyXzRWrXUWKSyvxEUwodpeVP52+Y79IfX950r0yLjF145aOkp8rnTW6nBPSXaSRmWpF5Sp4u9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781230; c=relaxed/simple;
	bh=FSURDa2toA39l+5JVs1lCYdc/4UY1Km+OrSUMI7Sm2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhvclFCrh+/TcL04S7UQmVDDegfwotuuLUsbxzi5ebYzRIqPp5K5+aPFqlmTmnlCD2Unc+d/2jK8vwJtJAMFHWWVgB1VCAog7Si/lRaljB+WQ+Dmw3pajpMeMvdP2v6e0niRBUiTlb/XgqdtQYmolwS1Z4mKVrMkGYTjyBS0Q4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cd235a67;
	Mon, 7 Sep 2026 19:40:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jensenhuang@friendlyarm.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
Date: Mon,  7 Sep 2026 19:40:10 +0800
Message-Id: <20260907114010.2166428-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905-r28s-upstream-v1-2-f68d5389269a@proton.me>
References: <20260905-r28s-upstream-v1-2-f68d5389269a@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07bab3ea703a2kunm7cb50498ea708
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh1LVkhMQkMYH0saHUlMSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

Hi,

> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile

> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb

This device tree has many similarities to the nanopi zero2.
Can you create a shared device tree?

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts

https://wiki.friendlyelec.com/wiki/images/7/7c/NanoPi_R28S_2605_SCH.pdf
Please name the labels according to the schematic.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&user_key>;

Schematic label: GPIO4_B2_USR_BTN

> +		button-reset {
> +			debounce-interval = <50>;
> +			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
> +			label = "reset";
> +			linux,code = <KEY_RESTART>;

label = "USER";

> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lan_led_g>, <&sys_led_r>, <&wan_led_g>;

Schematic label: LED1 LED2 LED_SYS

> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_enable_h>;

Schematic label: PWR_WF

> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_reset_h>;

Schematic label: PCIE_ETH_PERSTB

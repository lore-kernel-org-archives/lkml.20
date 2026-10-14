Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB151624DF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791938151; cv=none; b=XqPzZ+CyBIumYp6gAeQzonuTZI1pNnGJSoGMG1UaJw50s3Yv7dqARxz+dfQHn3GTCExFmSDU8yQAofHTHN0JG6QsMBp4DYBYXgckT18FRDJf9kg2WOXcmWZM2N+MzamDgqae7TxmxH8d+2vDukVlurV8sNnvNBkzRkd5acmEZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791938151; c=relaxed/simple;
	bh=b4gq6g1PmafbonBhTXkrQ58KOfN1rO/0cHgI2tmQK48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/niC+zNrlGrkNwxcYletuxvFJ7qu2EyxnV7bpBeH4cEfVFRyYRWpAewYbkzwB2Nn8oPu/HZQhLGOAmsITaF2Y5Ua9zqWnAeqtyofE6nj0y1gV9ZJoinadOh+yh91NYsSnGQ/Uf/pk87PTterwlKemKsArG0sfVJ8OJ4ZzLwHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eCWTd60u; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eCWTd60u"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cbc729b88fso598036137.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791938147; x=1792542947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fETuRtPje6LTC2rIz2bJlcHYx0+4RuHZEXBtVbxeG+A=;
        b=eCWTd60uHatGMyKs82dkkfn0nOIANTXmqbzBwUJ8LC6YK6B4dzN/vuGsaxflMAJwML
         AasRQM0iANomMgpfmh2FoI5wjtLr1pdxctan8y2LM/uSnlngqyUtaZN0o41EJCmjumpS
         6sd9/gJO2AQ0Sgtcn7BBWbO+zaHx5jrMZoRU6yKxdHM66B/K6+iJEiSt89K9UyAuaFIq
         FayMFoSVK+QirRoTX2wRLNH+jxHtQrOlrR46cX6vjt02gcI295VkFb+G+FuUdlbRJMwa
         DWCbyRgHlj2FWq82GjtyYDTLIPWtyF8x0Z28Ivnz/ljcNxQZOo+/Cl80VkcIwEmsKCpr
         yoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791938147; x=1792542947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fETuRtPje6LTC2rIz2bJlcHYx0+4RuHZEXBtVbxeG+A=;
        b=LSr6r+2RdAhpX/jataElXivd2XZPT8hg0C8gIBbkF1CWDR88pZYBrNivekev/ydA2E
         aAVSs1BoxQE7ljE3Jnx4iJ0Au8L6k4Zo/3efJmvCnHaAHBp/wapiTpPHxYGcr12Q5kSn
         fN/YQJH5s4klv/k1dcbJjjp6qp6C8eZqpYBienMfxaitWTJW/IIBrJ+XsYsZNxCK0kOD
         adCgxlH5mnsOAQvmgMXZ7PIROXTtGJeypdwvyD7s9bNKsDqPrLhA6yEVL8eys9oBSHDu
         mWbRDppD/m74xRcAE+aB7i35+ZHsd6jiHsQsPdaWNDmYEv/W5734z2lPWVG+xBnKyeaf
         sIZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGC3kJeKSo0BfswvCJO41ckreib8eY2uRt9bVqxx93GbSr6o5VoqHT/UMPOhyFSlTkPg1tKn4fYnoKaTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8vseyiXKcMYcNvdA+3ryJRUNYhakI8gd/YPK4bBFM9u/x0nee
	4LYF2SopUY4OZLgcsUhUHi7p2peQzZd6VxqtL5Uh2gHWQT+J0Dcs7sEnXzTxeWYiii0=
X-Gm-Gg: AYBFou1/EPQ5o4PwvZmn4ipAvf4w1NCWwHT82MqGz38pgAEXIIacnJ9ut9sUHWVLbCg
	SsRpW6zu1+oDF4VygVlMK1/F5Arx7xNdbSbZnguUUFcTnseW74qB36Di5LvmUfSeTa7NecebPB2
	OxrHbazRlP0bZDNzPKcHBi8iNfclfHlfSMHCYHh0y+Dp8jCPDnQ136pNYFAUaOg9klvGZkkVdxV
	XDpzogIGpAHegCGLigysQ2knIdR1i2uGBsjw0t1/0udDumSVqcyD0iYe6l6FK2W8oruZak+p+RF
	dkj8+w+0TbDwk2Vj98cJ9A+lH8AEZrZJ1xSftqRqG4lXAugXhX3uCWOoIIF4q5pu5OGx82m5wge
	UY9VG17lJ3dVk0LVX9EllmrEhPJMoZootjbhpC0fmuBW1RXza7mVqfNRqg1Ou0IiH/JmavUmMkc
	V5v6E9ezNFSZl2Gi4Z5jRuy7WAQ6Fr/ldZA/ak2z6IQsRH+AoZR2Qsf3bHOI83w5etBBY/sOm8C
	ryApTysThrbJofSfhEUO6zjgL2fIxUWGafC5ZF8eNg=
X-Received: by 2002:a05:6102:5121:b0:7c3:6466:3155 with SMTP id ada2fe7eead31-7cb375fcf5cmr3438386137.33.1791938147238;
        Tue, 13 Oct 2026 17:35:47 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cbbd178e4csm4108537137.2.2026.10.13.17.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:35:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:35:40 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Message-ID: <as7OCfOlcnqvvE2y@hiagonb>
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>

Hi Inochi Amaoto,

Just a friendly ping about this patch. Not sure if it was picked up by
you already.

Thanks!

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> The CV1800B SoC has a DWMAC controller connected to an internal 10/100
> Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
> reach the internal PHY are already described in cv180x.dtsi, but are
> disabled by default.
> 
> Enable gmac0 and the MDIO multiplexer to make ethernet work.
> 
> Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
> up at 100Mbps/Full and the interface gets an address via DHCP.
> 
> This can not be enabled by default as others may want to use the same
> pins as GPIO, that is the reason an overlay is being used.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
> Hi,
> 
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.
> 
> U-Boot logs:
> 
> milkv_duo# setenv fdtoverlay_addr_r 0x82480000
> milkv_duo# boot
> ** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
> 1:	Poky (Yocto Project Reference Distro)
> Retrieving file: /Image.gz
> append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
> Retrieving file: /cv1800b-milkv-duo.dtb
> Retrieving file: /cv1800b-milkv-duo-eth.dtbo
>    Uncompressing Kernel Image to 0
> \## Flattened Device Tree blob at 82200000
>    Booting using the fdt blob at 0x82200000
> Working FDT set to 82200000
>    Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
> Working FDT set to 83560000
> 
> Kernel logs:
> 
> root@milkv-duo:~# ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
>     link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
>     inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
>        valid_lft forever preferred_lft forever
> root@milkv-duo:~# dmesg | grep stmmaceth
> [    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
> [    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
> [    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
> [    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
> [    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
> [    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
> [    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
> [    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
> [    0.639720] stmmaceth 4070000.ethernet: COE Type 2
> [    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
> [    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
> [    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
> [    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
> [   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
> [   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
> [   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
> [   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
> [   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> 
> [1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
> [2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> ---
>  arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index d5c80d4ff005..adea990ad912 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> new file mode 100644
> index 000000000000..52c85b4e0155
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Enable ethernet support on Milk-V Duo (CV1800B).
> + *
> + * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> 
> ---
> base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
> change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40
> 
> Best regards,
> --  
> Hiago
> 

Best regards,
-- 
Hiago

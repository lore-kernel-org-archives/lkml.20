Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689860;
	b=p5iQ4EYqn5MbRGiGRWOADAB2dxJ44UOq/7wHHOe+Cr2mo3PmZ1foXnzrjrNulp4jIIWy
	 11VNoj8UrAscrpjwjCali4gHVXD2IiKH4M1w21CbQ6s6nwWMMyegssnAYRxnwJtnRsPwB
	 K2j508PDmM3DEAEcnPnvQw8ngZDvWlwujmu+EDFMqSN1WKxBMhXrIKtyoCTpj1WKuDT6t
	 vaZlZgvETfvt0k8NzMMD1P6GZYqQKRgAP53e+nBITMj+DN0NTC6P3x92yOPJTspu2OgNW
	 r5c3V2gzk/m1Zxf0zdNf0Wnc2cBbLHrFrJglVez16fhpkHAKk6VfZKn+eEIHhWhUEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
	b=r/dmW7ake4LxcuilFivMMexpYQmc29HJhWouY+obf7/FirbP9L5gbVJjKh7Nj6uTRW92
	 t8a0TPk2Qz1jsTOiSNZB97Ej7oPlLALkyRHwCA/Ir8+kGBP9dkU6Snr1/3Ac7fVmKv9an
	 0ivCCaf3s1vXsWFTx6KovjZZLx5ix2KnSNw1hVTjVL35hlZSew5kaZogDIDCbAAzsvimE
	 s1Vcivu8+AJAQeIGs/phaoGG9W2OFiE0asduFMGh/4mGWY1uPewi6+ptX5Sqv15E4gT80
	 vTwZ/PySMhxA5nDsylCKXBeWHKUGhUIwTgwH5CdkOokqCjuzRqSQlSwBTZUIDofEJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H8EnXrbw;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488A606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5488A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H8EnXrbw
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so79332a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689859; x=1793294659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=H8EnXrbwBE0R+WLhuZaLYmZtswNj1VpN7z4pYlk3xGtbG9FHyZBvi3b8cB746oX/w2
         Y2B7pLrMNMxXX+eUXvAMolqKmkCSCLsfhAztscTt517XdeyRtqrozxoWsvN5jYvPcwkW
         9kJv3DEyQ2g8EJhoL6KkY9+kKiMoABC2p/6xebrEMKs6uPcUkwqWIv2KTCEB/4FpP5ry
         jaTUs7jtOVdf/uYQuy3GMnXEc0GcO1J0FetTD64ar7xkcGIy3t8ruxBJhBJEI4GlK2tb
         hZHlGS/YySbJH3kvRaQPUxUsFzUDXmXEUl8d4JmoCSjoTUtgJ7Y11XU63tdiBNmNf6vB
         fHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689859; x=1793294659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=kucHm8o03HP2E/0BhVBaGrDFAfy7zZwqgnJ+df6ES/Yb9mYY/sHSwp5CuogS86yJVe
         iMUeyiMgnMT0uJysPb6dC/+ZSjMWkJYrAaIgrAB2SEw364E8T5BOkU+z0x9AYrEA0LhI
         4GkBHAwlIfy+VzSOzGnLh2JSE0d/s8wTr3uR7kjEfhDBEL/169SOtlR77W21ARvlNCX6
         yh4Q6aGITlT6RKGpFPFuCbPQPk3xoG+bAubivSB1viBm+0I9e+5WFKWPxDH8e3nh5PpC
         /9IBlqgyoZUa7U7elwdLp2d5VrcXpw5TyxxpNHANy/iVVgZXNQFsfhHEHhAYBV9/NNdr
         9I5Q==
X-Forwarded-Encrypted: i=1; AKwUvByqqXncSD8DsZU0Uh7fKnfGg+VS6TVv23rxfu15GHzSY83wtWCJHxZKK9TfIXECPSsiK6Zf3oL1eqfXaeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4tJLYGfivfNzNQ+wmM13nay1sp1CRyWjWgOV7gugktwnK4ntF
	gpmdpQzxu8IBC8UkwNlIDgDwTy1nleCfZXhDd2W1sXVYJpoC3wUHoMZ/bMgWmuqw8lA=
X-Gm-Gg: AYBFou0ZVRwLP8jXNI1vucXseE2zt7C3hNwq5/gVygPc+zQQ71XuTVoXo392XkbirJL
	At+L2/XoYJ6H/ZkJYQ0+Ze+QYmm6POagjDebyFZwskjnQh3JssI69doST6gQPOAP7t4Bu7BcQ/E
	ebDcLzZzb3J6rnKMIWyXqeGkUoTCevecL6Batjp6iAuLAAB9XQ/VoxcCReTGuD1Pi48zC5UA+Cf
	N+h9+JmgSMQ5YPHEKDOHETIYfaI6WTDPt1DNgkSJKFSgZ2sofCNGK/gn6Zqh+idfsOMHiPG8fBx
	4q1XXg97lniEycdu66ub3c5V2S+OBhISzxO6WUyY/OYgduMIgyEJrH7pgSFoSl3gfKM5ckS4TNT
	uduwN/AaNgq8M+EDC+I/QAe7wkoL+u+1XvqlngATm1yfR7lig6QLjDgUgfpdOF1mNtjWKo7o07y
	d/SSMibxXRo/KnbxWbDPPU3C5J4yCWFUg0QW7zN0zXuhAM/egpBnKToZnjbEVexzlcKGrfRbiVy
	Ht5bjGPH1xSkDWl79WnIhdbMWI6Y/afdnUx6PlvTxFrXWhdFdm4Z6IySTY=
X-Received: by 2002:a17:90b:580c:b0:3ac:8ee5:e00f with SMTP id 98e67ed59e1d1-3ad86cc1a23mr4599427a91.57.1792689858509;
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5f8sm5060365a91.9.2026.10.22.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:24:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <atpGv_FiRlgPh4-4@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:23PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Move related memory region to overlay files.
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------

I will need an R-b from Sascha to merge the above files, otherwise they will
have to be resent separately.

Thanks,
Mathieu

>  3 files changed, 84 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb56..f3b19f3b1488e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 0000000000000..c3deb277edabf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>,
> +				<&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>,
> +				<&rsc_table>;
> +		memory-region-names = "vdev0buffer",
> +				      "vdev0vring0", "vdev0vring1",
> +				      "vdev1vring0", "vdev1vring1",
> +				      "rsc-table";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: memory@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: memory@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&edma1 {
> +	/* reserved for M7 */
> +	dma-channel-mask = <0x40>;
> +};
> +
> +&edma2 {
> +	/* reserved for M7 and V2X */
> +	dma-channel-mask = <0xf>;
> +};
> +
> +&micfil {
> +	/* reserved for M7 */
> +	status = "reserved";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index f82e149323d34..3ab679e5a4740 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -189,37 +189,6 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  		};
>  
> -		vdev0vring0: vdev0vring0@88000000 {
> -			reg = <0 0x88000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@88008000 {
> -			reg = <0 0x88008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@88010000 {
> -			reg = <0 0x88010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@88018000 {
> -			reg = <0 0x88018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0buffer: vdev0buffer@88020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0x88020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@88220000 {
> -			reg = <0 0x88220000 0 0x1000>;
> -			no-map;
> -		};
> -
>  		vpu_boot: memory@a0000000 {
>  			reg = <0 0xa0000000 0 0x100000>;
>  			no-map;
> 
> -- 
> 2.43.0
> 
